#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
region_lexer.py —— C/C++ 源码状态机区域分析（移植自 DevEcoAPIScan CppCodeScanner）

把整段源码扫描成 RegionType[] 数组，给每个字符打区域标签：
  * CODE       —— 正常代码区域
  * COMMENT    —— 注释区域（单行 // 与多行 /* */）
  * STRING     —— 字符串字面量区域

API 调用命中必须在 CODE 区域内，避免注释/字符串中的 API 名误报。

状态机四态：
  CODE → 双引号进 STRING；// 进 SINGLE_LINE_COMMENT；/* 进 MULTI_LINE_COMMENT
  STRING → 处理转义 \\，遇未转义双引号回 CODE
  SINGLE_LINE_COMMENT → 到行尾自动回 CODE
  MULTI_LINE_COMMENT → 遇 */ 回 CODE
"""
from __future__ import annotations

from dataclasses import dataclass


# 区域类型常量（与 DevEcoAPIScan RegionType 枚举对齐）
CODE = 0
COMMENT = 1
STRING = 2


@dataclass
class CodeLine:
    content: str
    start_index: int
    end_index: int


def split_lines(src: str) -> list[CodeLine]:
    """按通用换行符（\\n / \\r\\n / \\r）切分源码为 CodeLine 列表，保留每行的字符索引范围。

    对齐 Java 的 split("\\R", -1) 语义：保留分隔符，使每行 CodeLine.end_index 指向换行符末尾。
    Python re 不支持 \\R，这里手动遍历切分。
    """
    lines: list[CodeLine] = []
    if not src:
        return lines
    start = 0
    i = 0
    n = len(src)
    while i < n:
        c = src[i]
        if c == '\r':
            if i + 1 < n and src[i + 1] == '\n':
                # \r\n
                end = i + 1
                lines.append(CodeLine(content=src[start:end + 1], start_index=start, end_index=end))
                start = end + 1
                i = end + 1
                continue
            # \r
            lines.append(CodeLine(content=src[start:i + 1], start_index=start, end_index=i))
            start = i + 1
            i += 1
            continue
        if c == '\n':
            lines.append(CodeLine(content=src[start:i + 1], start_index=start, end_index=i))
            start = i + 1
            i += 1
            continue
        i += 1
    # 最后一行（无换行符结尾）
    if start < n:
        lines.append(CodeLine(content=src[start:n], start_index=start, end_index=n - 1))
    return lines


def analyze_regions(src: str) -> list[int]:
    """对源码做状态机区域分析，返回与 src 等长的 RegionType 数组。

    状态机：
      CODE: 双引号 → STRING；/ 后接 / → COMMENT(单行)；/ 后接 * → MULTI_LINE_COMMENT
      STRING: 处理转义，遇未转义双引号回 CODE
      SINGLE_LINE_COMMENT: 到行尾一次性填满 COMMENT 后回 CODE
      MULTI_LINE_COMMENT: 逐字符填 COMMENT，遇 */ 回 CODE
    """
    n = len(src)
    if n == 0:
        return []
    out = [CODE] * n
    state = CODE  # 0=CODE 1=SINGLE_LINE_COMMENT 2=MULTI_LINE_COMMENT 3=STRING
    escape = False
    i = 0
    while i < n:
        c = src[i]
        if state == CODE:
            if c == '"':
                out[i] = STRING
                state = 3  # STRING
                escape = False
                i += 1
                continue
            if c == '/' and i + 1 < n:
                nxt = src[i + 1]
                if nxt == '/':
                    out[i] = COMMENT
                    out[i + 1] = COMMENT
                    state = 1  # SINGLE_LINE_COMMENT
                    i += 2
                    continue
                if nxt == '*':
                    state = 2  # MULTI_LINE_COMMENT，不立即填，由循环填
                    i += 2
                    continue
            out[i] = CODE
            i += 1
            continue
        if state == 1:  # 单行注释：到行尾填满 COMMENT
            # 找到本行结束位置
            nl = src.find('\n', i)
            if nl == -1:
                end = n
            else:
                end = nl + 1  # 含换行符
            for k in range(i, end):
                out[k] = COMMENT
            i = end
            state = CODE
            continue
        if state == 2:  # 多行注释：逐字符填 COMMENT，遇 */ 回 CODE
            while i < n:
                cur = src[i]
                out[i] = COMMENT
                if cur == '*' and i + 1 < n and src[i + 1] == '/':
                    out[i + 1] = COMMENT
                    i += 2
                    state = CODE
                    break
                i += 1
            else:
                # 未闭合的块注释
                break
            continue
        if state == 3:  # 字符串
            out[i] = STRING
            if not escape and c == '"':
                i += 1
                state = CODE
                escape = False
                continue
            escape = (not escape) and (c == '\\')
            i += 1
            continue
    return out


# ---------------------------------------------------------------------------
# 区域类型查询与三重校验（移植自 CppCodeScanner.checkPreChar/checkNextChar/checkRegion）
# ---------------------------------------------------------------------------
def get_pre_char(src: str, index: int) -> str:
    """取 index 前一个字符（用于前驱字符校验）。"""
    return src[index - 1] if index > 0 else '\0'


def get_next_non_blank_char(src: str, index: int) -> str:
    """从 index+1 开始找下一个非空白非控制字符（用于后继字符校验）。"""
    j = index
    while j + 1 < len(src):
        c = src[j + 1]
        if not (c.isspace() or (ord(c) < 0x20)):
            return c
        j += 1
    return '\0'


def check_pre_char(src: str, index: int) -> bool:
    """前驱字符非字母数字下划线：保证命中的 OH_Xxx 是独立标识符，
    而非 `MyOH_Foo` 中的子串。

    移植自 CppCodeScanner.checkPreChar。
    """
    c = get_pre_char(src, index)
    return not (c.isalpha() or c.isdigit() or c == '_')


def check_next_char(src: str, index: int) -> bool:
    """后继非空白字符为 '('：保证命中的是函数调用而非类型/变量引用。

    移植自 CppCodeScanner.checkNextChar。
    """
    c = get_next_non_blank_char(src, index)
    return c == '('


def check_region(region_types: list[int], index: int) -> bool:
    """该索引位于 CODE 区域（非注释非字符串）。"""
    if index < 0 or index >= len(region_types):
        return False
    return region_types[index] == CODE


def get_line_number_from_index(lines: list[CodeLine], index: int) -> int:
    """通过字符索引定位所在行号（0-based）。"""
    for i, ln in enumerate(lines):
        if ln.start_index <= index <= ln.end_index:
            return i
    return -1
