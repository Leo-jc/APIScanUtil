#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
cpp_parser.py —— C/C++ 原生源码词法分析与原生 API 调用图谱提取

与 ets_parser.py 对 ArkTS 的处理平行，对 HarmonyOS 三方库 / 应用的 C/C++ 原生代码
（entry/src/main/cpp 下 .cpp/.cc/.cxx/.c/.h/.hpp/.hxx）做结构化分析：

  * includes       —— #include 提取（系统头 / 本地 / 原生头 native_*.h / ohos 原生头）
  * call_sites     —— 每个原生 API 调用点（限定名 + 行号 + 调用者）
  * functions      —— C/C++ 函数 / 方法定义名（用于 caller 标注）
  * classification —— native（OH_*/napi_*/OHOS_ 原生系统接口）/ local（业务自定义）

关键技术（移植自 DevEcoAPIScan CppCodeScanner）：
  * 状态机区域分析（region_lexer.analyze_regions）—— 给源码每个字符打
    CODE/COMMENT/STRING 标签，API 命中必须在 CODE 区域内；
  * 三重校验（check_region + check_pre_char + check_next_char）——
    独立标识符 + 后跟 '(' 调用符号，避免变量/类型引用误报；
  * 同行同接口名去重 —— 一行内只保留第一条匹配。

复用 ets_parser 的 ImportInfo / CallSite / FileAnalysis 数据结构，使 change_matcher
可统一消费 ArkTS 与 C++ 两类使用点。

该模块不依赖编译器，直接对源码目录运行。
"""
import os
import re

from .config import CPP_EXTS, NATIVE_API_PREFIXES
# 复用 ets_parser 的结构化结果类型，保持匹配器统一消费
from .ets_parser import CallSite, FileAnalysis, ImportInfo  # noqa: F401
# 区域分析模块（状态机 + 双重校验，移植自 DevEcoAPIScan CppCodeScanner）
from .region_lexer import (analyze_regions, check_pre_char, check_region)

# ---------------------------------------------------------------------------
# 词法
# ---------------------------------------------------------------------------
_PUNCT = set("(){}[].,;:+-*/%=<>!&|^~?@#")


class Token:
    __slots__ = ("kind", "value", "line", "char_index")

    def __init__(self, kind: str, value: str, line: int, char_index: int = -1):
        self.kind = kind        # 'ident' | 'num' | 'str' | 'punct' | 'op' | 'pp' | 'rawstr'
        self.value = value
        self.line = line
        self.char_index = char_index  # 该 token 起始字符在源码中的索引（用于区域分析校验）


def tokenize(src: str) -> list:
    tokens: list = []
    i, n = 0, len(src)
    line = 1
    while i < n:
        c = src[i]
        if c == "\n":
            line += 1
            i += 1
            continue
        if c in " \t\r\f\v":
            i += 1
            continue
        # 行注释 //
        if c == "/" and i + 1 < n and src[i + 1] == "/":
            start = i
            while i < n and src[i] != "\n":
                i += 1
            tokens.append(Token("pp", src[start:i], line, start))
            continue
        # 块注释 /* */（含换行计数）
        if c == "/" and i + 1 < n and src[i + 1] == "*":
            start = i
            end = src.find("*/", i + 2)
            if end == -1:
                line += src.count("\n", i)
                break
            line += src.count("\n", i, end)
            i = end + 2
            tokens.append(Token("pp", src[start:i], line, start))
            continue
        # 预处理指令 #include / #define / #if …（整行收集为单个 'pp' token）
        if c == "#" and (i == 0 or src[i - 1] == "\n"):
            start = i
            j = i
            # 续行 '\'：收集到行尾，再合并续行
            while j < n:
                if src[j] == "\n" and (j == 0 or src[j - 1] != "\\"):
                    break
                if src[j] == "\n":
                    line += 1
                j += 1
            tokens.append(Token("pp", src[start:j], line, start))
            i = j
            continue
        # 原始字符串字面量 R"delim(...)delim"
        if (c == "R" or c == "L" or c == "u" or c == "U" or c == "8") and i + 1 < n and src[i + 1] == '"':
            start = i
            # 处理 u8"..." / U"..." / L"..." / R"(...)" 前缀
            prefix_len = 1
            if c == "8" and i > 0 and src[i - 1] in ("u", "U", "L"):
                # 已被前置标识符吞掉，按普通串处理：回退到 '"'
                pass
            if src[i + prefix_len: i + prefix_len + 1] == '"':
                # 原始串 R"d(...)d"
                if c == "R":
                    q = i + 2
                    delim_start = q
                    while q < n and src[q] != "(":
                        q += 1
                    delim = src[delim_start:q]
                    close = f'){delim}"' if delim else ')"'
                    end = src.find(close, q + 1)
                    if end == -1:
                        end = n
                    else:
                        end += len(close)
                    line += src.count("\n", i, end)
                    tokens.append(Token("rawstr", src[i:end], line, start))
                    i = end
                    continue
                # 普通带前缀串 L"…" / u"…" / U"…"
                quote = i + prefix_len
                j = quote + 1
                while j < n:
                    if src[j] == "\\":
                        j += 2
                        continue
                    if src[j] == "\n":
                        line += 1
                    if src[j] == '"':
                        break
                    j += 1
                tokens.append(Token("str", src[i:j + 1], line, start))
                line += src.count("\n", i, j)
                i = j + 1
                continue
        # 普通字符串
        if c == '"':
            start = i
            j = i + 1
            while j < n:
                if src[j] == "\\":
                    j += 2
                    continue
                if src[j] == "\n":
                    line += 1
                if src[j] == '"':
                    break
                j += 1
            tokens.append(Token("str", src[start:j + 1], line, start))
            line += src.count("\n", i, j)
            i = j + 1
            continue
        # 字符字面量 'c' / '\n'
        if c == "'":
            start = i
            j = i + 1
            while j < n:
                if src[j] == "\\":
                    j += 2
                    continue
                if src[j] == "'":
                    break
                j += 1
            tokens.append(Token("str", src[start:j + 1], line, start))
            i = j + 1
            continue
        # 标识符（含下划线；C++ 允许 $ 作扩展）
        if c.isalpha() or c == "_":
            start = i
            j = i
            while j < n and (src[j].isalnum() or src[j] == "_"):
                j += 1
            tokens.append(Token("ident", src[start:j], line, start))
            i = j
            continue
        # 数字字面量
        if c.isdigit():
            start = i
            j = i
            while j < n and (src[j].isalnum() or src[j] in "._xX"):
                j += 1
            tokens.append(Token("num", src[start:j], line, start))
            i = j
            continue
        # C++ 多字符操作符 / 作用域
        two = src[i:i + 2]
        if two in ("::", "->", "++", "--", "==", "!=", "<=", ">=", "&&", "||",
                   "+=", "-=", "*=", "/=", "%=", "<<", ">>", "::", "::"):
            tokens.append(Token("op", two, line, i))
            i += 2
            continue
        if c in _PUNCT:
            tokens.append(Token("punct", c, line, i))
            i += 1
            continue
        i += 1
    return tokens


# ---------------------------------------------------------------------------
# 原生 API 识别
# ---------------------------------------------------------------------------
def _is_native_name(name: str) -> bool:
    """是否为 HarmonyOS 原生系统 C 接口名（OH_* / napi_* / OHOS_*）。"""
    if not name or len(name) < 3:
        return False
    if name[0].islower() and name.startswith("napi_"):
        return True
    return name.startswith(NATIVE_API_PREFIXES)


# 原生头文件特征（include 时计为“原生 API 依赖使用点”）
_NATIVE_HEADER_RE = re.compile(
    r"(^|/)(native_(?:window|buffer|image|surface|vsync)_\w+|"
    r"oh_\w+|ark_\w+|napi(?:\.h|/)|arkui_\w+|drawing_\w+)\b", re.IGNORECASE)


# ---------------------------------------------------------------------------
# 分析器
# ---------------------------------------------------------------------------
class CppAnalyzer:
    def __init__(self):
        pass

    def analyze(self, path: str, rel_path: str) -> FileAnalysis:
        with open(path, encoding="utf-8", errors="replace") as f:
            src = f.read()
        fa = FileAnalysis(path=path, rel_path=rel_path)
        if not src.strip():
            return fa
        tokens = tokenize(src)
        self._extract_includes(tokens, fa)
        # 区域分析：给源码每个字符打 CODE/COMMENT/STRING 标签（移植自 DevEcoAPIScan）
        region_types = analyze_regions(src)
        self._extract_calls(tokens, fa, src=src, region_types=region_types)
        return fa

    # -- #include ----------------------------------------------------------
    def _extract_includes(self, tokens, fa: FileAnalysis):
        """解析 #include <…> / #include "…"，识别系统/原生/本地头。

        原生头（native_*.h / oh_*.h / napi.h / arkui_*.h）计入 imports 且 kit='Native'，
        使知识库中以头文件名为关键词的变更能桥接到使用点。
        """
        for tok in tokens:
            if tok.kind != "pp" or "#include" not in tok.value:
                continue
            m = re.search(r"#include\s*[<\"]([^>\"]+)[>\"]", tok.value)
            if not m:
                continue
            header = m.group(1).strip()
            base = os.path.basename(header)
            source = f"<{header}>" if "<" in tok.value else f'"{header}"'
            kit = None
            if _NATIVE_HEADER_RE.search(header) or base in ("napi.h", "arkui/native_interface.h"):
                kit = "Native"
            elif header.endswith(".h") and "/" not in header:
                kit = "system"  # 系统级标准头（粗分类）
            else:
                kit = None     # 本地 / 第三方头
            fa.imports.append(ImportInfo(
                line=tok.line, names=[base], source=source, kit=kit))

    # -- 调用点 + 函数边界 -------------------------------------------------
    def _extract_calls(self, tokens, fa: FileAnalysis, src: str = "",
                       region_types: list | None = None):
        """提取原生 API 调用点与 C/C++ 函数边界。

        策略（移植自 DevEcoAPIScan CppCodeScanner，放宽 next_char 保留类型引用）：
          * 扫描标识符序列，凡标识符名匹配原生前缀（OH_*/napi_*/OHOS_*）即记一个使用点。
          * 双重校验：CODE 区域（非注释非字符串）+ 前驱非字母数字下划线（独立标识符，
            排除 MyOH_Foo 子串）。
          * 后跟 '(' → is_call=True（真调用）；否则 is_call=False（类型/变量引用），
            保留使用点覆盖"声明了原生类型"这一使用形式，避免覆盖率下降。
          * caller：通过括号深度跟踪最近定义的函数名（_ScopeTracker 简化版）。
        """
        n = len(tokens)
        i = 0
        tracker = _CppScopeTracker()
        # 区域分析校验可用时启用双重校验；否则退化为原行为（next_is_call）
        region_enabled = bool(src and region_types)

        # 预收集函数定义名集合（用于 caller 标注与 fa.functions）
        # 简化识别：形如 `[修饰符]* name (params) {` 或 `name::name(params) {`
        def looks_like_function_def(idx: int):
            """若 tokens[idx] 是函数名，且其后 `(...) {`/`;` 为定义，返回函数名。"""
            if idx >= n or tokens[idx].kind != "ident":
                return None
            name = tokens[idx].value
            if name in _CPP_KEYWORDS:
                return None
            k = idx + 1
            # 命名空间/类限定 Foo::Bar::method
            while k + 1 < n and tokens[k].value == "::" and tokens[k + 1].kind == "ident":
                name = tokens[k + 1].value
                k += 2
            # 跳过模板 <...>
            while k < n and tokens[k].value == "<":
                k += 1
                dep = 1
                while k < n and dep > 0:
                    if tokens[k].value in "<([":
                        dep += 1
                    elif tokens[k].value in ">)]":
                        dep -= 1
                    k += 1
            if k >= n or tokens[k].value != "(":
                return None
            # 匹配到 ')'
            dep = 0
            while k < n:
                if tokens[k].value == "(":
                    dep += 1
                elif tokens[k].value == ")":
                    dep -= 1
                    if dep == 0:
                        break
                k += 1
            if k >= n:
                return None
            k += 1
            # 可选 const/override/noexcept 修饰，到 '{' 或 ';'
            start_line = tokens[k - 1].line
            while (k < n and tokens[k].value not in ("{", ";")
                   and tokens[k].line == start_line):
                k += 1
            if k < n and tokens[k].value == "{" and tokens[k].line == start_line:
                return name
            return None

        while i < n:
            tok = tokens[i]
            v = tok.value

            # 跟踪括号 / 大括号深度
            if v == "(":
                tracker.open_paren()
                i += 1
                continue
            if v == ")":
                nx = tokens[i + 1].value if i + 1 < n else ""
                tracker.close_paren(nx == "{")
                i += 1
                continue
            if v == "{":
                tracker.begin_brace()
                i += 1
                continue
            if v == "}":
                tracker.end_brace()
                i += 1
                continue

            # 函数定义头识别（非调用：前驱不是 '.'/'->' 且非 '(' 内）。
            # 仅在顶层或类作用域（非括号内）识别定义，减少误判。
            prev = tokens[i - 1].value if i > 0 else ""
            if (tok.kind == "ident" and not tracker._pending
                    and prev not in (".", "->", "::")
                    and tracker._paren_depth == 0):
                fn = looks_like_function_def(i)
                if fn:
                    tracker._pending = (fn, tracker._brace_depth)
                    fa.functions.append(fn)
                    # 跳到函数体 '{'
                    while i < n and tokens[i].value != "{":
                        i += 1
                    continue

            # 原生 API 使用点：标识符名匹配 OH_*/napi_*/OHOS_*
            if tok.kind == "ident" and _is_native_name(v):
                next_is_call = (i + 1 < n and tokens[i + 1].value == "(")
                if region_enabled:
                    # 双重校验（移植自 DevEcoAPIScan CppCodeScanner，但放宽 next_char）：
                    #   1) start_index 在 CODE 区域（非注释非字符串）—— 必须满足
                    #   2) 前驱非字母数字下划线（独立标识符，排除 MyOH_Foo 子串）—— 必须满足
                    #   3) 后继非空白字符为 '(' —— 软校验：满足则 is_call=True，否则 is_call=False
                    #      保留类型/变量引用使用点（如 OH_NativeBuffer* buf），
                    #      覆盖"声明了原生类型"这一使用形式，避免覆盖率下降。
                    start_idx = tok.char_index
                    if start_idx < 0:
                        start_idx = 0
                    if (check_region(region_types, start_idx)
                            and check_pre_char(src, start_idx)):
                        qualified = v
                        # ::链：OH_NS::Symbol
                        if i + 1 < n and tokens[i + 1].value == "::" and i + 2 < n \
                                and tokens[i + 2].kind == "ident":
                            qualified = v + "::" + tokens[i + 2].value
                        cs = CallSite(
                            line=tok.line, qualified=qualified, base=v, name=v,
                            is_constructor=False, caller=tracker.current,
                            kind="native", kit="Native",
                        )
                        # is_call：后跟 '(' 为真调用；否则为类型/变量引用
                        cs.is_call = next_is_call
                        fa.call_sites.append(cs)
                else:
                    # 回退：未启用区域分析时保持原 next_is_call 行为
                    qualified = v
                    if i + 1 < n and tokens[i + 1].value == "::" and i + 2 < n \
                            and tokens[i + 2].kind == "ident":
                        qualified = v + "::" + tokens[i + 2].value
                    cs = CallSite(
                        line=tok.line, qualified=qualified, base=v, name=v,
                        is_constructor=False, caller=tracker.current,
                        kind="native", kit="Native",
                    )
                    cs.is_call = next_is_call
                    fa.call_sites.append(cs)
            i += 1
        return


# C/C++ 关键字（不作为函数名）
_CPP_KEYWORDS = {
    "if", "for", "while", "switch", "catch", "return", "sizeof", "alignof",
    "do", "else", "goto", "case", "default", "break", "continue", "throw",
    "try", "namespace", "using", "typedef", "struct", "class", "union",
    "enum", "public", "private", "protected", "virtual", "override", "final",
    "static", "extern", "inline", "const", "constexpr", "mutable", "volatile",
    "auto", "void", "bool", "char", "short", "int", "long", "float", "double",
    "signed", "unsigned", "template", "typename", "new", "delete", "operator",
    "friend", "this", "nullptr", "true", "false", "explicit", "noexcept",
    "decltype", "static_cast", "dynamic_cast", "reinterpret_cast",
    "const_cast", "co_await", "co_return", "co_yield", "concept", "requires",
    "asm", "thread_local", "wchar_t", "char16_t", "char32_t",
    # 属性 / 修饰宏（不作为函数名）
    "__attribute__", "__declspec", "__cdecl", "__stdcall", "__fastcall",
    "__inline", "__forceinline", "NAPI_EXPORT", "EXTERN_C_START", "EXTERN_C_END",
}


class _CppScopeTracker:
    """C/C++ 函数作用域跟踪（简化版 brace-depth + paren-depth）。"""

    def __init__(self):
        self._stack: list[str] = []
        self._opens: list[int] = []
        self._pending = None
        self._brace_depth = 0
        self._paren_depth = 0

    @property
    def current(self) -> str:
        return self._stack[-1] if self._stack else "<top-level>"

    def open_paren(self):
        self._paren_depth += 1

    def close_paren(self, next_is_brace: bool):
        if next_is_brace and self._pending is not None:
            name, _d = self._pending
            # 等到 '{' 真正 begin_brace 时再压栈
            pass
        else:
            self._pending = None
        self._paren_depth = max(0, self._paren_depth - 1)

    def begin_brace(self):
        self._brace_depth += 1
        if self._pending is not None:
            name, _d = self._pending
            self._stack.append(name)
            self._opens.append(self._brace_depth)
            self._pending = None

    def end_brace(self):
        if self._opens and self._opens[-1] == self._brace_depth:
            self._stack.pop()
            self._opens.pop()
        self._brace_depth = max(0, self._brace_depth - 1)


# ---------------------------------------------------------------------------
# 工程级分析
# ---------------------------------------------------------------------------
def analyze_cpp_project(cpp_root: str, exclude: set[str] | None = None) -> list[FileAnalysis]:
    exclude = exclude or set()
    results: list[FileAnalysis] = []
    if not os.path.isdir(cpp_root):
        return results
    for root, _dirs, files in os.walk(cpp_root):
        for fn in sorted(files):
            if not fn.endswith(CPP_EXTS) or fn in exclude:
                continue
            fpath = os.path.join(root, fn)
            rel = os.path.relpath(fpath, cpp_root)
            results.append(CppAnalyzer().analyze(fpath, rel))
    results.sort(key=lambda fa: fa.rel_path)
    return results


def analyze_cpp_src_roots(src_roots: list[str], full_base_for: dict[str, str] | None = None,
                          exclude: set[str] | None = None) -> list[FileAnalysis]:
    """多源码根 C/C++ 分析。

    src_roots 形如 .../{module}/src/main/cpp；rel_path 基准取 {module} 的父目录，
    使 rel 形如 {module}/src/main/cpp/{file}（与 ets 侧对齐，便于跨语言统一定位）。

    full_base_for: {src_root_norm -> full_base} 映射；缺失时 rel 基准回退到 src_root 自身。
    """
    full_base_for = full_base_for or {}
    exclude = exclude or set()
    results: list[FileAnalysis] = []
    seen: set[str] = set()
    for root in src_roots:
        if not os.path.isdir(root):
            continue
        root_norm = root.replace(os.sep, "/")
        full_base = full_base_for.get(root_norm, root)
        for rdir, _dirs, files in os.walk(root):
            for fn in sorted(files):
                if not fn.endswith(CPP_EXTS) or fn in exclude:
                    continue
                fpath = os.path.join(rdir, fn)
                fpath_norm = os.path.normpath(fpath)
                if fpath_norm in seen:
                    continue
                seen.add(fpath_norm)
                rel = os.path.relpath(fpath, full_base)
                results.append(CppAnalyzer().analyze(fpath, rel))
    results.sort(key=lambda fa: fa.rel_path)
    return results
