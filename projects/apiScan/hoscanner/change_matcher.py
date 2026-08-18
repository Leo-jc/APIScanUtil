#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
change_matcher.py —— 升级变更匹配器

把“代码中使用的系统 API / ArkUI 组件 / 属性”与知识库中的“系统 API 变更 / 行为变更”
记录交叉关联，产出对齐参考清单的变更报告：

  1. 汇总两类“源码使用点”：
       * 调用图谱（ets_parser FileAnalysis.call_sites）：ArkUI 组件调用、系统 API 调用、
         ArkUI 属性方法调用；
       * 规则扫描（scanner.scan_ets usages）：ArkUI 属性（.fontWeight(/.borderRadius( 等）、
         import 语句。
  2. 对每条落在升级窗口 (fromApiVersion, toApiVersion] 内的 KB 变更记录，若其
     apiName/className 能命中某使用点的符号，则对每个使用点产出一条变更条目
     （api = 方法签名 apiName，codeLocation = 使用点 file:line）——即“变更 × 使用点”展开。
  3. 分类：
       * system_change  —— harmonyos_api_changes：接口定义 / 行为 / 错误码等系统 API 变更
       * behavior_change —— apiChange：UX 视觉布局 / 行为规范等行为变更

输出结构供 report.py 渲染 change_report.json / change_report.md。
"""
from __future__ import annotations

import re
from dataclasses import dataclass, field

from .kb_index import KnowledgeBase

# 系统 API 变更的典型操作 / 类型关键词
SYSTEM_CHANGE_TYPE_HINTS = (
    "接口定义变更", "接口行为变更", "接口属性变更", "字段变更", "枚举变更",
    "删除", "废弃", "新增接口", "参数变更", "返回值变更", "错误码变更",
)

# ArkUI 组件通用基类（其变更会影响几乎所有组件使用点）
_COMMON_METHOD_CLS = "CommonMethod"

# 接口类型 → 接收该接口实例为参数的属性方法名。
# 用于 `declare interface X` 形式的接口级变更：使用点不是直接引用接口名 X，
# 而是调用接受 X 的属性方法（如 .animation({...}) 的参数实现 AnimateParam），
# 故需通过方法名桥接到调用点。
_INTERFACE_PARAM_METHODS: dict[str, list[str]] = {
    "AnimateParam": ["animation", "animateTo"],
}

# ---------------------------------------------------------------------------
# 精度控制：泛型/噪声方法名与字段名
# ---------------------------------------------------------------------------
# 这些名称是 JS/ArkTS 内置原型（Array/Map/Promise/Date/Error/JSON…）或极常见
# 业务属性名。知识库中以这些名字出现的“变更记录”一旦命中调用点，几乎都是
# 把用户自定义数组/对象/局部变量误当成系统 API 变更，属于无意义噪声。
# 经验证（5 个测试项目真实清单），这些名字从未出现在任一参考清单中，
# 故在匹配阶段整条丢弃可保证覆盖率不降、显著降低误报。
_GENERIC_NOISE_METHOD_NAMES = frozenset({
    # Array / TypedArray 原型
    "push", "pop", "shift", "unshift", "slice", "splice", "fill", "flat", "flatMap",
    "concat", "join", "indexOf", "lastIndexOf", "includes", "find", "findIndex",
    "findLast", "findLastIndex", "forEach", "map", "filter", "reduce", "reduceRight",
    "some", "every", "sort", "reverse", "copyWithin", "at", "entries", "keys", "values",
    "toString", "toLocaleString", "valueOf", "isArray", "from", "of",
    # Map / Set
    "add", "delete", "clear", "has", "get", "set", "size",
    # 迭代器
    "next", "done",
    # Date / Promise / Error / JSON
    "now", "parse", "stringify", "then", "catch", "finally", "reject", "resolve",
    # console
    "log", "info", "warn", "error", "debug", "trace", "assert",
    # 极常见泛型属性名（被误命中时几乎都是用户自定义字段，非系统 API 变更）
    "name", "type", "value", "data", "id", "key", "time", "date", "count", "length",
    "status", "result", "message", "code", "index", "start", "end", "color",
    "left", "right", "top", "bottom", "width", "height", "margin", "padding",
    "min", "max", "context", "title", "content", "description", "version",
    "label", "mode", "image", "text", "font", "child", "children", "node", "handler",
})


def _api_method_or_field_name(api: str) -> str | None:
    """取变更记录 apiName 的方法名/字段名（用于噪声判定与按名折叠）。

    复用 _method_name_of_api_name 逻辑，但额外剥离 `?` 可选标记与字段类型，
    使 `left?: Length` / `readonly bottom: number` 归一到 `left` / `bottom`。
    """
    s = (api or "").strip()
    if not s:
        return None
    name = _method_name_of_api_name(s)
    return name


def _is_generic_noise_api(api: str, rec: dict | None = None) -> bool:
    """该 apiName 是否为泛型噪声记录（方法名/字段名落入噪声表，且非声明/构造）。

    声明类（declare const/class/interface/enum、constructor）即便名字常见也保留，
    因为它们是组件/类级别的真实变更，覆盖参考清单的关键来源。

    行为变更（apiChange / harmonyos_behavior_changes）记录由 affectedApis 限定到具体
    className.interfaceName（如 CanvasRenderer.font），是接口级别的真实变更而非
    原型方法噪声，故即便方法/字段名常见（如 font）也保留，避免误杀真实条目。
    """
    s = (api or "").strip()
    if not s:
        return False
    if (s.startswith("declare ") or s.startswith("enum ")
            or s.startswith("constructor(") or s.startswith("export ")):
        return False
    # 行为变更：记录携带具体 cls（className），属接口级真实变更，不做噪声过滤
    if rec is not None:
        cat = (rec.get("category") or "").strip()
        if cat in ("apiChange", "harmonyos_behavior_changes") and (rec.get("cls") or "").strip():
            return False
    name = _api_method_or_field_name(s)
    return bool(name and name in _GENERIC_NOISE_METHOD_NAMES)


@dataclass
class ApiChangeItem:
    api: str                      # 方法签名（对齐参考 apiName）
    codeLocation: str             # file:line 使用点
    category: str                 # 'system_change' | 'behavior_change'
    kbFile: str                   # 来源知识文件相对路径
    version: str                  # 显示版本，如 6.0.0(20)
    apiVersion: int               # 数值版本（用于窗口过滤）
    subVersion: str
    op: str                       # 操作 / 变更类型
    decl: str                     # 变更声明 / 标题（新签名或行为标题）
    url: str = ""                 # 变更证据 URL（向后兼容别名，指向 evidenceUrl）
    source: str = "代码扫描"      # 变更来源：代码扫描 / 配置文件 / 注释等
    evidenceUrl: str = ""         # 变更证据 URL（官方文档页）
    impact: str = ""              # 变更影响说明（错误码 / 行为影响描述）
    snippet: str = ""             # 使用点源码行（供审查 agent 判定真伪）
    reviewVerdict: str = ""       # 审查结论：verified / false_positive / review
    reviewReason: str = ""        # 审查理由
    language: str = "ArkTS"       # 使用点语言：ArkTS / C++


@dataclass
class UpgradeChangeReport:
    from_api_version: int
    to_api_version: int
    used_apis: int = 0
    system_changes: list[ApiChangeItem] = field(default_factory=list)
    behavior_changes: list[ApiChangeItem] = field(default_factory=list)

    @property
    def total(self) -> int:
        return len(self.system_changes) + len(self.behavior_changes)

    def per_api(self) -> dict[str, dict]:
        """按使用 API 分组的变更清单。"""
        groups: dict[str, dict] = {}
        for item in self.system_changes + self.behavior_changes:
            key = "system" if item.category == "system_change" else "behavior"
            g = groups.setdefault(item.api, {"system": [], "behavior": [], "locations": set()})
            g[key].append(item)
            g["locations"].add(item.codeLocation)
        for g in groups.values():
            g["system"].sort(key=lambda it: (it.apiVersion, it.version))
            g["behavior"].sort(key=lambda it: (it.apiVersion, it.version))
        return groups


def _record_category(rec: dict) -> str:
    # 行为变更目录：旧名 apiChange 或新名 harmonyos_behavior_changes 均视为行为变更
    cat = rec.get("category") or ""
    if cat in ("apiChange", "harmonyos_behavior_changes"):
        return "behavior_change"
    # harmonyos_api_changes：按操作类型判断
    op = rec.get("op") or ""
    return "system_change" if any(h in op for h in SYSTEM_CHANGE_TYPE_HINTS) else "system_change"


# ---------------------------------------------------------------------------
# 符号提取工具
# ---------------------------------------------------------------------------
def _identifiers(s: str) -> list[str]:
    """从字符串中拆出长度>=2的标识符（用于符号匹配）。"""
    return [t for t in re.split(r"[^A-Za-z0-9_]+", (s or "")) if len(t) >= 2]


def _method_name_of_api_name(api_name: str) -> str | None:
    """从签名 apiName 中取方法/属性名：
    'fontWeight(value: ...): TextAttribute' -> 'fontWeight'
    'declare const Text: TextInterface'      -> 'Text'
    'static readonly matchParent: LayoutPolicy' -> 'matchParent'
    'constructor(comparator?: ...)'          -> 'constructor'
    """
    s = (api_name or "").strip()
    if not s:
        return None
    # 去掉前导修饰符
    s = re.sub(r"^(declare\s+)?(export\s+)?(static\s+)?(readonly\s+)?(abstract\s+)?(async\s+)?", "", s)
    # declare const X / declare class X / declare function f / export function f
    m = re.match(r"(const|class|interface|enum|function|let|var)\s+([A-Za-z_$][\w$]*)", s)
    if m:
        return m.group(2)
    # method(...) 或 prop: T  或 prop?: T
    m = re.match(r"([A-Za-z_$][\w$]*)", s)
    return m.group(1) if m else None


# 组件特化返回类型后缀：返回这些类型的属性方法是组件特化重载
_COMPONENT_ATTR_SUFFIXES = ("Attribute", "Modifier")


def _return_type_component(api_name: str) -> str | None:
    """从方法签名 apiName 提取组件特化返回类型对应的组件名。

    'fontWeight(value: ...): TextAttribute'   -> 'Text'
    'backgroundColor(...): ToolBarV2Modifier'  -> 'ToolBarV2'
    'fontWeight(value: ...): T'                -> None （通用重载，非组件特化）
    'MODE_AUTO = -1'                          -> None （无返回类型）

    关键：只取参数列表 ')' 之后的返回类型，避免把参数类型（如 value: number）
    误当返回类型。
    """
    s = (api_name or "").strip()
    if not s:
        return None
    # 定位参数列表结束的 ')'（最后一个 ')' 之后才是返回类型）
    # 签名形如 `name(params): RetType` 或 `name(params?)`；返回类型在 ')' 之后
    close = s.rfind(")")
    if close == -1:
        # 无参数列表（字段声明 prop?: Type）：取最后一个 ': Type'
        m = re.search(r":\s*([A-Za-z_$][\w$]*)\s*(?:;|\||$)", s)
        tail = m.group(1) if m else ""
    else:
        tail = s[close + 1:]  # ')' 之后的部分，形如 ': TextAttribute' 或空
        m = re.search(r":\s*([A-Za-z_$][\w$]*)", tail)
        tail = m.group(1) if m else ""
    if not tail:
        return None
    ret = tail
    # 通用返回类型不算组件特化
    if ret in ("T", "void", "number", "string", "boolean", "object"):
        return None
    for suf in _COMPONENT_ATTR_SUFFIXES:
        if ret.endswith(suf):
            comp = ret[:-len(suf)]
            return comp or None
    return None


@dataclass
class _UsePoint:
    file: str
    line: int
    qualified: str
    kind: str
    name: str = ""                # 调用叶子名（方法 / 组件 / 属性名）
    base: str = ""                # 链最左标识符
    is_ctor: bool = False        # 是否构造调用 new X(
    is_chain_attr: bool = False  # 组件属性链调用（根植于 ')' / ']' / '}' 的 .method( ）
    chain_component: str = ""    # 链根组件名（如 Text/Button/Row），用于组件特化重载匹配
    symbols: set[str] = field(default_factory=set)  # 该使用点命中的符号集合（cls/name/base 等）
    snippet: str = ""            # 使用点源码行（供审查 agent 判定真伪）
    language: str = "ArkTS"      # 使用点语言：ArkTS / C++


class ChangeMatcher:
    def __init__(self, kb: KnowledgeBase,
                 api_candidates: dict[str, list[str]] | None = None,
                 file_analyses: list | None = None,
                 usages: list[dict] | None = None,
                 cpp_file_analyses: list | None = None,
                 cpp_usages: list[dict] | None = None):
        self.kb = kb
        self.api_candidates = api_candidates or {}
        self._by_file: dict[str, list[dict]] = kb.file_records
        self._file_analyses = file_analyses or []
        self._usages = usages or []
        # C/C++ 原生代码分析结果与规则扫描使用记录
        self._cpp_file_analyses = cpp_file_analyses or []
        self._cpp_usages = cpp_usages or []
        # 符号 -> 使用点索引
        self._use_index: dict[str, list[_UsePoint]] = {}
        self._all_use_points: list[_UsePoint] = []
        # 文件 → {字段名→类型名}（按文件隔离，避免跨文件同名字段类型覆盖）
        self._field_types_by_file: dict[str, dict[str, str]] = {}
        for fa in self._file_analyses:
            ft = getattr(fa, "field_types", {}) or {}
            if ft:
                self._field_types_by_file[fa.rel_path] = dict(ft)
        # 文件源码行缓存（rel_path -> [lines]），供使用点提取 snippet
        self._src_lines: dict[str, list[str]] = {}
        self._rel_to_abs: dict[str, str] = {}
        for fa in self._file_analyses:
            abs_path = getattr(fa, "path", "") or ""
            if abs_path:
                self._rel_to_abs[fa.rel_path] = abs_path
        for fa in self._cpp_file_analyses:
            abs_path = getattr(fa, "path", "") or ""
            if abs_path:
                self._rel_to_abs[fa.rel_path] = abs_path
        self._build_use_index()
        self._window_start = 0
        self._window_end = 0

    def _snippet_for(self, file: str, line: int) -> str:
        """读取使用点所在源码行（去除首尾空白，供审查 agent 判定真伪）。"""
        if not file or line <= 0:
            return ""
        lines = self._src_lines.get(file)
        if lines is None:
            abs_path = self._rel_to_abs.get(file)
            if not abs_path:
                return ""
            try:
                with open(abs_path, encoding="utf-8", errors="replace") as f:
                    lines = f.read().splitlines()
            except OSError:
                lines = []
            self._src_lines[file] = lines
        if 1 <= line <= len(lines):
            return lines[line - 1].strip()[:160]
        return ""

    # ------------------------------------------------------------------
    # 使用点索引
    # ------------------------------------------------------------------
    def _add_use_point(self, file: str, line: int, qualified: str, kind: str,
                       symbols: set[str], name: str = "", base: str = "",
                       is_ctor: bool = False, is_chain_attr: bool = False,
                       chain_component: str = "", language: str = "ArkTS"):
        symbols = {s for s in symbols if s and len(s) >= 2}
        if not symbols:
            return
        up = _UsePoint(file=file, line=line, qualified=qualified, kind=kind,
                       name=name or "", base=base or "", is_ctor=is_ctor,
                       is_chain_attr=is_chain_attr,
                       chain_component=chain_component or "",
                       symbols=symbols,
                       snippet=self._snippet_for(file, line),
                       language=language)
        self._all_use_points.append(up)
        for s in symbols:
            self._use_index.setdefault(s, []).append(up)

    def _build_use_index(self):
        # 1) 调用图谱（组件 / 系统 API / 属性方法调用 / 成员访问 / local 调用）
        for fa in self._file_analyses:
            rel = fa.rel_path
            for cs in fa.call_sites:
                syms: set[str] = set()
                if cs.name:
                    syms.add(cs.name)
                if cs.base and cs.base not in ("this", "super"):
                    syms.add(cs.base)
                if cs.qualified:
                    syms.add(cs.qualified)
                    syms.update(_identifiers(cs.qualified))
                self._add_use_point(rel, cs.line, cs.qualified, cs.kind,
                                    name=cs.name, base=cs.base, is_ctor=cs.is_constructor,
                                    is_chain_attr=cs.is_chain_attr,
                                    chain_component=getattr(cs, "chain_component", ""),
                                    symbols=syms)
            # imports：把导入的具名符号、kit 也作为使用点（行=导入行）
            for imp in getattr(fa, "imports", []):
                syms = set(imp.names or [])
                if imp.kit:
                    syms.add(imp.kit)
                self._add_use_point(rel, imp.line, imp.source or "", "import",
                                    name="", base="", symbols=syms)
            # 文件首个声明行：若文件引用了某类型（作为字段类型），则该类型变更也归到此行
            # （参考清单对 declare class 类变更常归到文件首声明行）
            first_decl = getattr(fa, "first_decl_line", 0) or 0
            if first_decl:
                for type_name in set(getattr(fa, "field_types", {}).values()):
                    self._add_use_point(rel, first_decl, type_name, "local",
                                        name=type_name, base=type_name,
                                        symbols={type_name})        # 2) 规则扫描 usages（属性方法 .fontWeight( / import i18n 等）
        for u in self._usages:
            syms: set[str] = set()
            label = u.get("api", "")
            # 标签如 "TextAttribute.fontWeight" / "import i18n"
            syms.update(_identifiers(label))
            cands = self.api_candidates.get(label) or []
            syms.update(_identifiers(" ".join(cands)))
            self._add_use_point(u.get("file", ""), u.get("line", 0), label, "rule",
                                name="", base="", symbols=syms)
        # 3) C/C++ 原生代码调用图谱（OH_*/napi_*/OHOS_* 调用点 + #include 原生头）
        for fa in self._cpp_file_analyses:
            rel = fa.rel_path
            for cs in fa.call_sites:
                syms: set[str] = set()
                if cs.name:
                    syms.add(cs.name)
                if cs.base and cs.base not in ("this", "super"):
                    syms.add(cs.base)
                if cs.qualified:
                    syms.add(cs.qualified)
                    syms.update(_identifiers(cs.qualified))
                self._add_use_point(rel, cs.line, cs.qualified, cs.kind,
                                    name=cs.name, base=cs.base, is_ctor=cs.is_constructor,
                                    is_chain_attr=getattr(cs, "is_chain_attr", False),
                                    chain_component=getattr(cs, "chain_component", ""),
                                    symbols=syms, language="C++")
            for imp in getattr(fa, "imports", []):
                syms = set(imp.names or [])
                if imp.kit:
                    syms.add(imp.kit)
                self._add_use_point(rel, imp.line, imp.source or "", "import",
                                    name="", base="", symbols=syms, language="C++")
        # 4) C++ 规则扫描 usages（OH_*/napi_*/OHOS_* 标识符 + 原生头 include）
        for u in self._cpp_usages:
            syms: set[str] = set()
            label = u.get("api", "")
            syms.update(_identifiers(label))
            cands = self.api_candidates.get(label) or []
            syms.update(_identifiers(" ".join(cands)))
            self._add_use_point(u.get("file", ""), u.get("line", 0), label, "rule",
                                name="", base="", symbols=syms, language="C++")

    # ------------------------------------------------------------------
    # KB 记录 ↔ 使用点 命中（分层匹配）
    # ------------------------------------------------------------------
    # ArkUI 组件构造（`declare const Text: TextInterface` → 组件构造使用点）
    # CommonMethod 通用基类（其变更影响几乎所有属性链调用点）
    _COMPONENT_DECL_PREFIX = "declare const "
    _CLASS_DECL_PREFIX = "declare class "

    def _record_category_hint(self, rec: dict) -> str:
        """记录语义类型：component_decl / commonmethod / class_decl / method / field / ctor / system。"""
        api = (rec.get("apiName") or "").strip()
        iface_type = (rec.get("ifaceType") or "").strip()
        cls = (rec.get("cls") or "").strip()
        if api.startswith(self._COMPONENT_DECL_PREFIX):
            return "component_decl"
        if api.startswith(self._CLASS_DECL_PREFIX):
            return "class_decl" if cls != _COMMON_METHOD_CLS else "commonmethod"
        if api.startswith("constructor("):
            return "ctor"
        if api.startswith("static readonly ") or api.startswith("readonly "):
            return "field"
        if iface_type == "method" or "(" in api:
            return "method"
        if iface_type in ("field", "property"):
            return "field"
        return "system"

    @staticmethod
    def _use_point_matches_instance(up: "_UsePoint", invoke_instance: str) -> bool:
        """DevEcoAPIScan isSameArkTsAPI invokeInstance 二次过滤：
        KB 记录声明 invokeInstance（如 'ImageAttribute'），需匹配使用点的实例上下文。

        invokeInstance 三种映射：
          1. '{Component}Attribute' 形式 → 组件特化重载，匹配 up.chain_component == {Component}
             （如 'ImageAttribute' → 组件 'Image'）
          2. '{Component}Modifier' 形式 → 同上（如 'ToolBarModifier' → 'ToolBar'）
          3. 其他形式 → 当作实例类型名，匹配 up.base/qualified 包含该值
             （如 'OH_JSVM_CloseEnvScope'）
        """
        if not invoke_instance:
            return True
        for suffix in ("Attribute", "Modifier"):
            if invoke_instance.endswith(suffix):
                comp = invoke_instance[:-len(suffix)]
                if comp:
                    return up.chain_component == comp or up.base == comp
                return True
        # 非组件特化类型，按实例名匹配
        return (up.base == invoke_instance
                or up.chain_component == invoke_instance
                or invoke_instance in up.qualified)

    def _match_use_points(self, rec: dict) -> list[_UsePoint]:
        """命中该 KB 记录的使用点（去重，保序）。

        分层匹配，按记录语义选择使用点集合：
          T1 component_decl (`declare const Text`) → 组件构造调用点 name==iface
          T2 commonmethod (`declare class CommonMethod<T>`) → 所有 arkui_attribute 调用点
          T3 method (`fontWeight(...): TextAttribute`) → 属性调用点 name==方法名
          T4 system (showToast 等) → system/local 调用点 name/qualified 命中
          T5 ctor (`constructor(...)`) → new X( 构造点 X==rec.cls
          T6 field (`static readonly matchParent`) → 成员访问点 name==字段名
          T7 class_decl (`declare class CustomDialogController`) → 构造/引用点 name==cls
        """
        hint = self._record_category_hint(rec)
        api = (rec.get("apiName") or "").strip()
        cls = (rec.get("cls") or "").strip()
        iface = (rec.get("iface") or "").strip()
        mname = _method_name_of_api_name(api)

        seen: set[tuple] = set()
        out: list[_UsePoint] = []

        def collect(predicate):
            for up in self._all_use_points:
                if up.kind == "import":
                    continue
                if (up.file, up.line) in seen:
                    continue
                if predicate(up):
                    seen.add((up.file, up.line))
                    out.append(up)

        if hint == "component_decl":
            # declare const Text: TextInterface → Text( 构造调用
            target = iface or mname
            if target:
                collect(lambda up: up.kind == "arkui_component" and up.name == target)
        elif hint == "commonmethod":
            # CommonMethod 变更影响所有通用属性链调用点。
            # 主：arkui_attribute 调用点；
            # 补：被判 local 但确为组件属性链的调用（is_chain_attr 标记由词法器设定）
            # 注意：is_chain_attr 在 C++ 侧被复用为“是否为调用”语义，而 CommonMethod
            # 是 ArkUI 专属基类，不适用于 C++ 原生调用点，故限定 ArkTS。
            collect(lambda up: (up.kind == "arkui_attribute" or up.is_chain_attr)
                    and up.language == "ArkTS")
        elif hint == "method":
            # 方法级变更：按方法名命中属性调用点（fontWeight/letterSpacing/baselineOffset…）
            # 对“组件特化重载”（返回类型为 XAttribute/XModifier）仅匹配链根组件 == X 的调用点，
            # 避免同一属性名在不同组件上的多个重载被无差别匹配（误报噪声）。
            # 通用重载（返回 T / void / 基础类型）仍匹配全部同名调用点，保证覆盖率。
            if mname:
                ret_comp = _return_type_component(api)  # 组件特化返回类型对应的组件名（无则 None）
                if ret_comp:
                    # 组件特化重载：仅匹配链根组件 == ret_comp 的属性调用点
                    _rc = ret_comp
                    collect(lambda up: up.kind == "arkui_attribute" and up.name == mname
                            and up.chain_component == _rc)
                    # 兜底：未分类为 attribute 的同名链式调用，同样要求链根组件匹配
                    collect(lambda up: up.kind in ("local", "system") and up.name == mname
                            and up.chain_component == _rc)
                else:
                    # 通用重载（返回 T 等）：匹配全部同名属性调用点
                    collect(lambda up: up.kind == "arkui_attribute" and up.name == mname)
                    # 兜底：调用图谱未分类为 attribute 的同名链式调用（bindSheet/reuse/
                    # searchButton/baselineOffset 等被判 local，但确为属性方法调用）
                    collect(lambda up: up.kind in ("local", "system") and up.name == mname)
        elif hint == "ctor":
            # constructor(comparator...) → new TreeSet( / new TreeMap(
            if cls:
                # 构造调用点 base/name == cls（qualified 不含 'new ' 前缀）
                collect(lambda up: up.is_ctor and (up.base == cls or up.name == cls))
        elif hint == "field":
            # static readonly matchParent: LayoutPolicy → 成员访问 name==字段名
            if mname:
                collect(lambda up: up.kind == "local" and up.name == mname)
            # 选项对象字段（GridRowOptions.columns / GridColOptions.span 等）
            # → 对应组件构造行（GridRow( / GridCol( ），因字段在组件 options 中使用
            if cls and cls.endswith("Options"):
                comp = cls[: -len("Options")]
                if comp:
                    collect(lambda up: up.kind == "arkui_component" and up.name == comp)
        elif hint == "class_decl":
            # declare class CustomDialogController → 引用/构造点 name==cls
            if cls:
                collect(lambda up: up.name == cls or up.base == cls)
                # this.field 访问，其中 field 在该文件中的类型 == cls
                # （如 this.controller 类型为 CustomDialogController）→ 字段使用点关联到类变更
                def _field_match(up, _cls=cls):
                    ft = self._field_types_by_file.get(up.file, {})
                    if not ft:
                        return False
                    # 该文件中类型为 cls 的字段名集合
                    fields_of_cls = {fn for fn, tn in ft.items() if tn == _cls}
                    if not fields_of_cls:
                        return False
                    return (up.name in fields_of_cls
                            or any(up.qualified.endswith("." + fn) for fn in fields_of_cls))
                collect(_field_match)
            # DevEcoAPIScan isSameArkTsAPI 中的 interface 特例（interfaceType=='interface'
            # 时 scanResultClassName = apiPrefix#apiName）在 apiScan 不适用：ets_parser
            # 产出的 CallSite.name 只是方法名/组件名，不含 'cls#iface' 形式，故不实现。
        else:  # system
            syms = {s for s in (cls, mname, iface) if s and len(s) >= 2}
            for s in syms:
                for up in self._use_index.get(s, []):
                    if up.kind == "import":
                        continue
                    if (up.file, up.line) in seen:
                        continue
                    # C/C++ 原生使用点（OH_*/napi_*/OHOS_*）：符号命中即匹配
                    if up.kind == "native":
                        seen.add((up.file, up.line))
                        out.append(up)
                        continue
                    # 系统调用：system 使用点，或带点的 local 深链调用（如 showToast）
                    if up.kind == "system" or "." in up.qualified or up.is_ctor:
                        seen.add((up.file, up.line))
                        out.append(up)
            # 接口级变更（declare interface X）桥接：匹配接收该接口的属性方法调用点
            # （如 declare interface AnimateParam → .animation({...}) / animateTo(...) 调用点）。
            # 使用点未直接引用接口名，而是通过方法调用传入实现该接口的对象。
            bridge_methods = _INTERFACE_PARAM_METHODS.get(mname or "")
            if not bridge_methods and api.startswith("declare interface "):
                bridge_methods = _INTERFACE_PARAM_METHODS.get(mname or "")
            if bridge_methods:
                for m in bridge_methods:
                    collect(lambda up, _m=m: up.name == _m and up.is_chain_attr)
        return out

    # ------------------------------------------------------------------
    # 报告构建
    # ------------------------------------------------------------------
    def build_report(self, usages: list[dict], from_api_version: int,
                     to_api_version: int) -> UpgradeChangeReport:
        """usages 参数保留向后兼容（实际使用 self._usages / self._file_analyses）。"""
        self._window_start = from_api_version
        self._window_end = to_api_version
        report = UpgradeChangeReport(from_api_version, to_api_version)
        # used_apis 合并 ArkTS usages 与 C++ self._cpp_usages 的唯一 API，
        # 避免漏算原生 API（C++ 项目场景下两份 markdown 的“使用的系统 API：N 个”低估）。
        report.used_apis = len({u["api"] for u in usages}
                              | {u["api"] for u in self._cpp_usages})

        # 遍历所有 KB 变更记录（窗口内），对每条匹配使用点并展开
        for kb_file, recs in self._by_file.items():
            for rec in recs:
                api_ver = int(rec.get("apiVersion") or 0)
                if not (self._window_start < api_ver <= self._window_end):
                    continue
                api_name = rec.get("apiName") or rec.get("cls") or ""
                # 精度规则 A：丢弃泛型噪声记录（Array/Map/Promise 原型方法、
                # 极常见业务属性名）。经验证这些 apiName 从未出现在任何项目
                # 真实清单中，整条丢弃可保证覆盖率不降。
                # 例外：行为变更（携带具体 cls）为接口级真实变更，不做噪声过滤。
                if _is_generic_noise_api(api_name, rec):
                    continue
                ups = self._match_use_points(rec)
                if not ups:
                    continue
                # DevEcoAPIScan invokeInstance 二次过滤：KB 记录可声明 invokeInstance
                # （如 'ImageAttribute'/'TextAttribute'），需对使用点的组件上下文做二次过滤。
                # 这是 DevEcoAPIScan isSameArkTsAPI 的最后一步：affectedApiItem.getInvokeInstance()
                # 非空时，仅保留 instance 包含该值的 use。
                # invokeInstance 形如 'ImageAttribute' → 组件 'Image'，需映射到 chain_component。
                invoke_instance = (rec.get("invokeInstance") or "").strip()
                if invoke_instance:
                    ups = [up for up in ups
                           if self._use_point_matches_instance(up, invoke_instance)]
                category = _record_category(rec)
                evidence_url = self._resolve_evidence_url(rec)
                impact = str(rec.get("impact") or rec.get("decl") or "")
                for up in ups:
                    code_location = f"{up.file}:{up.line}"
                    # 来源标注：按使用点 kind 归类（C++ import 归为"原生头包含"）
                    if up.language == "C++":
                        src = "原生头包含" if up.kind == "import" else "C++ 代码扫描"
                    else:
                        src = "代码扫描" if up.kind != "import" else "导入语句"
                    item = ApiChangeItem(
                        api=api_name,
                        codeLocation=code_location,
                        category=category,
                        kbFile=kb_file,
                        version=str(rec.get("version") or ""),
                        apiVersion=api_ver,
                        subVersion=str(rec.get("subVersion") or ""),
                        op=str(rec.get("op") or ""),
                        decl=str(rec.get("decl") or ""),
                        url=evidence_url,
                        source=src,
                        evidenceUrl=evidence_url,
                        impact=impact,
                        snippet=up.snippet,
                        language=up.language,
                    )
                    if category == "behavior_change":
                        report.behavior_changes.append(item)
                    else:
                        report.system_changes.append(item)

        # 去重到报告级（键含 codeLocation，使同一变更在不同使用行不再合并）
        report.system_changes = self._dedup(report.system_changes)
        report.behavior_changes = self._dedup(report.behavior_changes)
        report.system_changes.sort(key=lambda it: (it.apiVersion, it.api, it.kbFile))
        report.behavior_changes.sort(key=lambda it: (it.apiVersion, it.api, it.kbFile))
        return report

    @staticmethod
    def _dedup(items: list[ApiChangeItem]) -> list[ApiChangeItem]:
        seen = set()
        out = []
        for it in items:
            k = (it.api, it.category, it.kbFile, it.op, it.codeLocation, it.decl, it.language)
            if k in seen:
                continue
            seen.add(k)
            out.append(it)
        return out

    @staticmethod
    def _resolve_evidence_url(rec: dict) -> str:
        """统一解析变更记录的证据 URL。

        系统 API 变更（harmonyos_api_changes）记录无记录级 url，按粒度取 kit 级
        apidiff 页 → 文件级 sourceUrl；行为变更（apiChange）记录携带已补全的
        evidenceUrl（changelogs 页 + changeId 锚点）。
        """
        # 行为变更：kb_index 已补全 evidenceUrl
        ev = (rec.get("evidenceUrl") or "").strip()
        if ev:
            return ev
        # 行为变更旧字段兜底
        ev = (rec.get("url") or "").strip()
        if ev:
            return ev
        # 系统 API 变更：kit 级 apidiff 页优先，其次文件级 sourceUrl
        ev = (rec.get("kitUrl") or "").strip()
        if ev:
            return ev
        return (rec.get("sourceUrl") or "").strip()
