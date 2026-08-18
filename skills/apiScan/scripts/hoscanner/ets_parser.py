#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
ets_parser.py —— ArkTS / .ets 源码词法分析与 API 调用图谱提取（独立实现）

在规则扫描（api_rules.py）之外，用一个轻量词法器对源码做结构化分析：

  * imports        —— 提取 @kit / @ohos / 本地相对导入
  * call_sites     —— 每个调用点（qualified name + 行号 + 是否构造调用）
  * call_graph     —— 调用者（函数/方法/组件 build）→ 被调用的系统 API
  * classification —— 系统 API（来自 @kit 导入）/ ArkUI 组件 / ArkUI 通用属性 / 本地调用

该模块不依赖 DevEco Studio 编译产物，可直接对三方库源码目录运行。
"""
import os
import re
from dataclasses import dataclass, field

# ---------------------------------------------------------------------------
# 词法
# ---------------------------------------------------------------------------
_PUNCT = set("(){}[].,;:+-*/%=<>!&|^~?@#")


@dataclass
class Token:
    kind: str        # 'ident' | 'num' | 'str' | 'punct' | 'op'
    value: str
    line: int


def tokenize(src: str) -> list[Token]:
    tokens: list[Token] = []
    i, n = 0, len(src)
    line = 1
    while i < n:
        c = src[i]
        if c == "\n":
            line += 1
            i += 1
            continue
        if c in " \t\r":
            i += 1
            continue
        # comments
        if c == "/" and i + 1 < n and src[i + 1] == "/":
            while i < n and src[i] != "\n":
                i += 1
            continue
        if c == "/" and i + 1 < n and src[i + 1] == "*":
            end = src.find("*/", i + 2)
            if end == -1:
                break
            line += src.count("\n", i, end)
            i = end + 2
            continue
        # strings
        if c in "'\"`":
            quote = c
            j = i + 1
            while j < n:
                if src[j] == "\\":
                    j += 2
                    continue
                if src[j] == "\n":
                    line += 1
                if src[j] == quote:
                    break
                j += 1
            tokens.append(Token("str", src[i:j + 1], line))
            line += src.count("\n", i, j)
            i = j + 1
            continue
        # identifiers
        if c.isalpha() or c in "_$":
            j = i
            while j < n and (src[j].isalnum() or src[j] in "_$"):
                j += 1
            tokens.append(Token("ident", src[i:j], line))
            i = j
            continue
        # numbers
        if c.isdigit() or (c == "." and i + 1 < n and src[i + 1].isdigit()):
            j = i
            while j < n and (src[j].isalnum() or src[j] in "._xX"):
                j += 1
            tokens.append(Token("num", src[i:j], line))
            i = j
            continue
        # multi-char operators
        two = src[i:i + 2]
        if two in ("=>", "==", "!=", "<=", ">=", "&&", "||", "++", "--", "**", "?.", "??"):
            tokens.append(Token("op", two, line))
            i += 2
            continue
        if c in _PUNCT:
            tokens.append(Token("punct", c, line))
            i += 1
            continue
        # any other char
        i += 1
    return tokens


# ---------------------------------------------------------------------------
# ArkUI 已知组件与通用属性（用于调用分类；SDK 声明可在配置中扩展）
# ---------------------------------------------------------------------------
ARKUI_COMPONENTS = {
    "Row", "Column", "Text", "Button", "Scroll", "List", "ListItem", "ForEach",
    "Flex", "Blank", "Circle", "Rect", "Path", "Line", "Polygon", "Polyline",
    "Ellipse", "Shape", "TextInput", "TextArea", "Stack", "Grid", "GridItem",
    "Tabs", "TabContent", "Navigation", "NavDestination", "Image", "Video",
    "Divider", "Progress", "Rating", "Slider", "Toggle", "Switch", "Badge",
    "Span", "Menu", "MenuItem", "Select", "Dialog", "AlertDialog", "DatePicker",
    "TimePicker", "TextPicker", "CalendarPicker", "RichEditor", "ScrollBar",
    "Refresh", "WaterFlow", "FlowItem", "SideBarContainer", "Panel", "Search",
    "Checkbox", "Radio", "Counter", "DataPanel", "Gauge", "LoadingProgress",
    "QRCode", "SymbolGlyph", "Marquee", "PatternLock", "Search", "Stepper",
    "TextTimer", "TimePicker", "Toggle", "Web", "XComponent",
    "TextClock", "GridRow", "GridCol", "AlphabetIndexer", "TextInputDialog",
    "Hyperlink", "ImageAnimator", "Menu", "MenuItemGroup", "CustomDialog",
    "Panel", "SwipeRefresher", "Navigator", "LocalStorage",
    # ArkUI 控制器 / 类
    "Scroller", "GridScroller", "TabsController", "ScrollController",
    "ListController", "GridController", "SearchController",
    "TextInputController", "TextAreaController", "VideoController",
    "DatePickerController", "TimePickerController", "SliderController",
    "ScrollView", "RowSplit", "ColumnSplit", "AppStorage", "LocalStorage",
    "PersistentStorage", "Environment", "UiContext",
}
# ArkUI 通用属性 / 通用方法（链式调用）
ARKUI_ATTRIBUTES = {
    "width", "height", "size", "margin", "padding", "backgroundColor",
    "border", "borderRadius", "borderWidth", "borderColor", "borderStyle",
    "fontSize", "fontColor", "fontWeight", "fontFamily", "fontStyle",
    "textAlign", "textOverflow", "maxLines", "lineHeight", "letterSpacing",
    "align", "alignItems", "justifyContent", "flexGrow", "flexShrink",
    "flexBasis", "layoutWeight", "position", "offset", "zIndex", "opacity",
    "visibility", "display", "constraintSize", "aspectRatio", "scale",
    "rotate", "translate", "transform", "onClick", "onTouch", "onHover",
    "onKeyEvent", "onAppear", "onDisAppear", "onAreaChange", "onSizeChange",
    "onVisibleAreaChange", "scrollBar", "scrollable", "edgeEffect",
    "enableScrollInteraction", "nestedScroll", "scrollToIndex", "scrollTo",
    "scrollEdge", "scrollBy", "scrollSnapAlign", "space", "fill", "stroke",
    "strokeWidth", "strokeColor", "fillOpacity", "strokeOpacity", "dashArray",
    "stateEffect", "enabled", "defaultFocus", "focusable", "blur", "shadow",
    "clip", "mask", "foregroundColor", "foregroundImage", "renderFit",
    "imageFill", "objectFit", "source", "alt", "placeholder", "type",
    "autofocus", "controller", "key", "id", "data", "ref", "onChange",
    "onSubmit", "onCancel", "onClose", "onBackPressed", "onScroll",
    "onScrollIndex", "onReachStart", "onReachEnd", "onRefresh", "animateTo",
    "keyframes", "animateOnAppear", "transition", "opacity",
    "direction", "alignSelf", "safeArea", "expandSafeArea", "overlay",
    "accessibilityText", "accessibilityDescription", "accessibilityLevel",
    "linearGradient", "radialGradient", "sweepGradient", "backgroundBlurStyle",
    "foregroundBlurStyle", "backdropBlur", "grayscale", "brightness",
    "contrast", "saturate", "hueRotate", "invert", "sepia", "colorBlend",
    "symmetricTransition", "geometryTransition", "sharedTransition",
    "motionPath", "interpolateMotion", "blockInterpolation", "typeToggle",
    "onContentScroll", "onScrollStop", "onScrollStart", "onScrollStateChange",
}

# 控制流关键字（不作为函数/方法定义）
_CONTROL_KEYWORDS = {"if", "for", "while", "switch", "catch", "with"}

# 已知系统 API 调用名（深链系统调用识别，如 getUIContext().getPromptAction().showToast）
_SYSTEM_API_NAMES = {
    "showToast", "showDialog", "showActionMenu", "openToast", "getPromptAction",
    "getUIContext", "getWindow", "getWindowProperties", "setDisplayOrientation",
    "getDisplayCountry", "getDisplayLanguage", "maximize", "transform",
    "fastConvertToJSObject", "setWindowSystemProperties", "setWindowLayoutFullScreen",
    "getConfiguration", "getApplicationContext", "getMainWindow",
}


def _looks_like_system_chain(qualified: str) -> bool:
    """判定带点的调用链是否为系统 API 调用（含已知系统方法名）。"""
    if not qualified:
        return False
    for nm in _SYSTEM_API_NAMES:
        if nm in qualified:
            return True
    return False


# ---------------------------------------------------------------------------
# 结构化分析结果
# ---------------------------------------------------------------------------
@dataclass
class ImportInfo:
    line: int
    names: list[str]          # 导入的具名符号
    source: str               # '@kit.ArkUI' / '@ohos.app.ability.UIAbility' / 相对路径
    kit: str | None = None    # 归一化的 kit / ohos 包名（用于报告）

    @property
    def is_kit(self) -> bool:
        return bool(self.source) and self.source.startswith("@kit.")


@dataclass
class CallSite:
    line: int
    qualified: str            # 完整限定名，如 'promptAction.showToast' / 'win.getWindowProperties'
    base: str                 # 最左标识符，如 'promptAction'
    name: str                 # 最后一个标识符（方法名）
    is_constructor: bool      # new X(...)
    caller: str               # 所在函数 / 方法 / <top-level>
    kind: str                 # 'system' | 'arkui_component' | 'arkui_attribute' | 'local'
    kit: str | None = None    # system 时归属的 kit 名称
    is_chain_attr: bool = False  # 组件属性链调用（根植于 ')' / ']' / '}' 的 .method( ）
    chain_component: str = ""   # 链根组件名（如 Text/Button/Row），用于属性方法重载的组件特化匹配
    is_call: bool = False     # 是否为函数调用（后跟 '('）；C++ 侧用于区分调用 vs 类型引用


@dataclass
class FileAnalysis:
    path: str
    rel_path: str
    imports: list[ImportInfo] = field(default_factory=list)
    call_sites: list[CallSite] = field(default_factory=list)
    functions: list[str] = field(default_factory=list)
    field_types: dict[str, str] = field(default_factory=dict)  # 字段名 → 类型名（如 controller→CustomDialogController）
    first_decl_line: int = 0  # 文件首个 interface/class/struct 声明行


# ---------------------------------------------------------------------------
# 函数/方法边界跟踪（brace-depth + paren-depth 启发式）
# ---------------------------------------------------------------------------
class _ScopeTracker:
    """维护“当前所在函数/方法名”。"""

    def __init__(self):
        self._stack: list[str] = []
        self._opens: list[int] = []       # 每个函数体开启时的 brace depth
        self._pending = None              # ('name', paren_open_depth) 等待确认
        self._brace_depth = 0
        self._paren_depth = 0

    @property
    def current(self) -> str:
        return self._stack[-1] if self._stack else "<top-level>"

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

    def open_paren(self):
        self._paren_depth += 1

    def close_paren(self, next_is_brace: bool, next_is_arrow: bool):
        """')' 之后紧跟 '{' 或 '=>' 时，判定之前的标识符为函数定义。

        - next_is_brace: `name(args) {` → 函数体开始，pending 等待 '{' 确认（保持）。
        - next_is_arrow: `name(args) =>` → 箭头函数；表达式体无 '{'，
          pending 不再需要 '{' 确认，立即清空以免污染后续调用提取。
        - 都不是：普通调用的 ')'，清空误设的 pending。
        """
        if next_is_brace:
            pass  # 保持 pending，由 begin_brace 确认
        else:
            self._pending = None  # 箭头表达式体 / 普通调用，无需 '{' 确认
        self._paren_depth = max(0, self._paren_depth - 1)


# ---------------------------------------------------------------------------
# 分析器
# ---------------------------------------------------------------------------
_KIT_ALIASES = {
    "@kit.AbilityKit": "AbilityKit",
    "@kit.ArkUI": "ArkUI",
    "@kit.PerformanceAnalysisKit": "PerformanceAnalysisKit",
    "@kit.LocalizationKit": "LocalizationKit",
    "@kit.BasicServicesKit": "BasicServicesKit",
    "@kit.AccessibilityKit": "AccessibilityKit",
    "@kit.ConnectivityKit": "ConnectivityKit",
    "@kit.CoreFileKit": "CoreFileKit",
    "@kit.DataCloudKit": "DataCloudKit",
    "@kit.DeviceUsageStatisticsKit": "DeviceUsageStatisticsKit",
    "@kit.DistributedServiceKit": "DistributedServiceKit",
    "@kit.MediaKit": "MediaKit",
    "@kit.MindSporeKit": "MindSporeKit",
    "@kit.NetworkKit": "NetworkKit",
    "@kit.SensorServiceKit": "SensorServiceKit",
    "@kit.StateManagementKit": "StateManagementKit",
    "@kit.TelephonyKit": "TelephonyKit",
    "@kit.UserAuthenticationKit": "UserAuthenticationKit",
    "@kit.WorkSchedulerKit": "WorkSchedulerKit",
    "@kit.SecurityCryptoKit": "SecurityCryptoKit",
    "@kit.ImageKit": "ImageKit",
    "@kit.AudioKit": "AudioKit",
    "@kit.VideoKit": "VideoKit",
    "@kit.AnalysisKit": "AnalysisKit",
    "@kit.AdsKit": "AdsKit",
    "@kit.BackgroundTasksKit": "BackgroundTasksKit",
    "@kit.BluetoothKit": "BluetoothKit",
    "@kit.CalendarKit": "CalendarKit",
    "@kit.CloudFoundationKit": "CloudFoundationKit",
    "@kit.GameServiceKit": "GameServiceKit",
    "@kit.LocationKit": "LocationKit",
    "@kit.MultimodalAwarenessKit": "MultimodalAwarenessKit",
    "@kit.PushKit": "PushKit",
    "@kit.ScreenKit": "ScreenKit",
    "@kit.SystemKit": "SystemKit",
    "@kit.UiAppearanceKit": "UiAppearanceKit",
    "@kit.UrlKit": "UrlKit",
    "@kit.WalletKit": "WalletKit",
    "@kit.InputKit": "InputKit",
    "@kit.IndustrialKit": "IndustrialKit",
    "@kit.InteractionKit": "InteractionKit",
    "@kit.MapsKit": "MapsKit",
    "@kit.SearchKit": "SearchKit",
    "@kit.ArcGISKit": "ArcGISKit",
    "@kit.ZmsKit": "ZmsKit",
    "@kit.CloudStorageKit": "CloudStorageKit",
    "@kit.CloudDataKit": "CloudDataKit",
    "@kit.ArkData": "ArkData",
}


class EtsAnalyzer:
    def __init__(self):
        pass

    def analyze(self, path: str, rel_path: str) -> FileAnalysis:
        with open(path, encoding="utf-8", errors="replace") as f:
            src = f.read()
        fa = FileAnalysis(path=path, rel_path=rel_path)
        if not src.strip():
            return fa

        tokens = tokenize(src)
        self._extract_imports(tokens, fa)
        self._extract_field_types(tokens, fa)
        self._extract_calls(tokens, fa)
        return fa

    # -- field types -------------------------------------------------------
    def _extract_field_types(self, tokens, fa: FileAnalysis):
        """提取字段声明 `name: Type` / `name?: Type`（含修饰符 private/readonly 等）。

        记录 字段名→类型名 映射（如 controller→CustomDialogController），并把类型名
        所在行作为使用点加入 call_sites（kind=local），使类型引用行也能匹配类变更。
        同时把类型使用关联到所属 interface/class/struct 声明行（参考清单常把类变更
        归到包含类型字段的接口声明行）。
        """
        n = len(tokens)
        i = 0
        enclosing_decl_line = 0  # 最近 interface/class/struct 声明行
        while i < n:
            tv = tokens[i].value
            # 跟踪 interface/class/struct 声明行
            if tv in ("interface", "class", "struct") and tokens[i].kind == "ident" \
                    and i + 1 < n and tokens[i + 1].kind == "ident":
                decl_line = tokens[i + 1].line
                enclosing_decl_line = decl_line
                if not fa.first_decl_line:
                    fa.first_decl_line = decl_line
            # 形如 [修饰符] ident [?] : Type ...
            if tokens[i].kind == "ident" and tv not in _CONTROL_KEYWORDS \
                    and tv not in ARKUI_COMPONENTS and tv not in ("interface", "class", "struct"):
                j = i + 1
                if j < n and tokens[j].value == "?":
                    j += 1
                if j < n and tokens[j].value == ":":
                    j += 1
                    if j < n and tokens[j].kind == "ident":
                        type_name = tokens[j].value
                        if type_name and type_name[0].isupper() and len(type_name) >= 3:
                            fa.field_types[tokens[i].value] = type_name
                            # 类型名所在行作为使用点（覆盖类型注解行匹配类变更）
                            fa.call_sites.append(CallSite(
                                line=tokens[j].line, qualified=type_name,
                                base=type_name, name=type_name, is_constructor=False,
                                caller="<type-ref>", kind="local", kit=None))
                            # 关联到所属声明行（如 interface GridCellItem 的第 1 行）
                            if enclosing_decl_line and enclosing_decl_line != tokens[j].line:
                                fa.call_sites.append(CallSite(
                                    line=enclosing_decl_line, qualified=type_name,
                                    base=type_name, name=type_name, is_constructor=False,
                                    caller="<type-ref>", kind="local", kit=None))
            i += 1

    # -- imports -----------------------------------------------------------
    def _extract_imports(self, tokens, fa: FileAnalysis):
        i = 0
        n = len(tokens)
        while i < n:
            if tokens[i].value == "import" and tokens[i].kind == "ident":
                # 解析到 'from' 或 ';' 或换行
                j = i + 1
                names: list[str] = []
                source = ""
                while j < n and tokens[j].value != ";":
                    if tokens[j].value == "from" and tokens[j].kind == "ident":
                        j += 1
                        if j < n and tokens[j].kind == "str":
                            source = tokens[j].value.strip("'\"")
                        break
                    if tokens[j].kind == "ident" and tokens[j].value not in ("import", "from", "as"):
                        names.append(tokens[j].value)
                    j += 1
                if source:
                    kit = None
                    if source.startswith("@kit."):
                        kit = _KIT_ALIASES.get(source, source)
                    elif source.startswith("@ohos."):
                        kit = source  # 直接使用包名
                    fa.imports.append(ImportInfo(
                        line=tokens[i].line, names=names, source=source, kit=kit))
                i = j + 1
                continue
            i += 1

    # -- call sites + call graph -------------------------------------------
    def _extract_calls(self, tokens, fa: FileAnalysis):
        n = len(tokens)
        i = 0
        tracker = _ScopeTracker()
        # 组件上下文栈：每层 brace 一个槽位，记录当前块的最近 ArkUI 组件构造名。
        # 属性链调用（.fontSize/.fontWeight/...）继承所在块的组件构造，
        # 用于方法重载的组件特化匹配（如 Text 上的 fontWeight → TextAttribute）。
        component_stack: list[str] = [""]

        # 已导入符号 → kit（仅系统模块 @kit/@ohos；本地相对导入不计为系统 API）
        imported: dict[str, str] = {}
        for imp in fa.imports:
            if not imp.kit:
                continue
            for name in imp.names:
                imported[name] = imp.kit

        # 收集函数名（用于 caller 标注）
        def detect_function_head(idx: int) -> str | None:
            """若 tokens[idx:] 构成函数定义头，返回函数名；否则 None。
            识别 `ident(params):ret {`、`ident(params) {`、`(params) => {`。
            排除 ArkUI 组件名与控制流关键字（它们属于调用而非定义）。"""
            k = idx
            name = None
            if k < n and tokens[k].kind == "ident" and tokens[k].value not in _CONTROL_KEYWORDS:
                name = tokens[k].value
                k += 1
            else:
                return None
            if name in ARKUI_COMPONENTS:
                return None
            # 泛型/装饰器前缀可能在前面，这里只认 `name(` 或 `name<...>(`
            while k < n and tokens[k].value == "<":
                k += 1
                dep = 1
                while k < n and dep > 0:
                    if tokens[k].value in "<([":
                        dep += 1
                    elif tokens[k].value in ">)]":
                        dep -= 1
                    k += 1
            if k < n and tokens[k].value == "(":
                # 找到匹配 ')'
                dep = 0
                while k < n:
                    if tokens[k].value == "(":
                        dep += 1
                    elif tokens[k].value == ")":
                        dep -= 1
                        if dep == 0:
                            break
                    k += 1
                if k < n and tokens[k].value == ")":
                    k += 1
                    # 可选的返回类型注解：仅在同一逻辑行内扫描（不跨换行），
                    # 避免把 `foo(args)` 后面隔多行才出现的 `{` 误判为函数体
                    start_line = tokens[k - 1].line if k - 1 < n else -1
                    while (k < n and tokens[k].value not in ("{", "=>", ";")
                           and tokens[k].line == start_line):
                        k += 1
                    if k < n and tokens[k].value in ("{", "=>") \
                            and tokens[k].line == start_line:
                        return name
            return None

        while i < n:
            tok = tokens[i]

            # -- 记录函数定义头（method/function/lambda）--
            if tok.kind == "ident" and not tracker._pending:
                # 前驱为 '.' → 方法调用而非函数定义，跳过 detect_function_head
                prev_for_head = tokens[i - 1].value if i > 0 else ""
                fn = None if prev_for_head == "." else detect_function_head(i)
                if fn:
                    tracker._pending = (fn, tracker._brace_depth)
                    fa.functions.append(fn)
                    i = self._advance_past_head(tokens, i)
                    continue

            v = tok.value
            if v == "(":
                tracker.open_paren()
                i += 1
                continue
            if v == ")":
                nx = tokens[i + 1].value if i + 1 < n else ""
                tracker.close_paren(nx == "{", nx == "=>")
                i += 1
                continue
            if v == "{":
                tracker.begin_brace()
                # 进入新的组件块（如 build() / 某组件内容块）时，组件上下文重置：
                # 子块内的属性链默认归属本块最近组件构造，避免继承外层组件。
                component_stack.append("")
                i += 1
                continue
            if v == "}":
                tracker.end_brace()
                if component_stack:
                    component_stack.pop()
                i += 1
                continue
            # 语句结束 / 属性链分隔 → 清空当前组件上下文（下一属性需新的组件构造）
            # 仅在不在圆括号内时清空：组件构造参数列表中的 ',' / ';' 不应破坏
            # 组件上下文（如 Text(arg1, arg2) 中的 ',' 会让后续 .fontWeight 误判为无组件）。
            if v in (";", ",") and tracker._paren_depth == 0:
                if component_stack:
                    component_stack[-1] = ""
            # -- 调用表达式：`[qual.]name(` / `new [qual.]name(` --
            prev = tokens[i - 1].value if i > 0 else ""
            prev2 = tokens[i - 2].value if i > 1 else ""
            # 链式属性调用：`.name(` —— prev == "." 时不能整体跳过。
            # 区分：组件构造（无点）/ 链式属性方法（带点）/ new 构造。
            if tok.kind == "ident" and not tracker._pending:
                call = None
                if prev == "new":
                    # 'new' 的构造 ident 由 'new' token 自身处理，跳过避免重复
                    pass
                elif prev == ".":
                    # 紧跟在 ')' / ']' / '}' 后的 `.name(` —— 结果/组件链调用
                    # （_try_call_at 从基标识符无法到达这些根）
                    if prev2 in (")", "]", "}"):
                        call = self._try_chain_call_at(tokens, i)
                else:
                    call = self._try_call_at(tokens, i)
                if call is not None:
                    cname, is_ctor, base, name, line = call
                    cs = self._classify(
                        cname, is_ctor, base, name, line, tracker.current, imported)
                    # 标记组件属性链调用（来自 _try_chain_call_at，根植于结果/组件块）
                    if prev == "." and prev2 in (")", "]", "}"):
                        cs.is_chain_attr = True
                    # 组件上下文：组件构造 → 设为当前组件；属性链 → 继承当前组件
                    if cs.kind == "arkui_component":
                        if component_stack:
                            component_stack[-1] = name
                        cs.chain_component = name
                    elif cs.kind == "arkui_attribute":
                        cs.chain_component = (component_stack[-1]
                                              if component_stack else "")
                    elif cs.is_chain_attr:
                        # 组件特有属性方法（commands/baselineOffset/format/searchButton 等
                        # 未列入 ARKUI_ATTRIBUTES 通用表，被归类为 local/system）的链式调用，
                        # 同样继承所在块最近组件构造，供匹配器做组件特化重载匹配。
                        cs.chain_component = (component_stack[-1]
                                              if component_stack else "")
                    fa.call_sites.append(cs)
                elif prev == ".":
                    # `.name` 非调用（无括号）→ 成员属性访问使用点（覆盖 LayoutPolicy.matchParent 等）
                    # _try_call_at 仅在有 '(' 时捕获，故有括号时由其覆盖、此处跳过避免重复
                    next_is_call = (i + 1 < n and tokens[i + 1].value == "(")
                    if not next_is_call:
                        ma = self._classify(
                            tok.value, False, tok.value, tok.value, tok.line,
                            tracker.current, imported, is_member_access=True)
                        ma.chain_component = (component_stack[-1]
                                               if component_stack else "")
                        fa.call_sites.append(ma)
            i += 1

    @staticmethod
    def _advance_past_head(tokens, idx: int) -> int:
        """从函数定义头开始，跳到 '{' 或 '=>' 处。"""
        n = len(tokens)
        while idx < n and tokens[idx].value not in ("{", "=>"):
            idx += 1
        return idx

    def _try_call_at(self, tokens, idx: int):
        """尝试在 tokens[idx] 解析一个调用表达式。返回 (qualified, is_ctor, base, name, line)。"""
        n = len(tokens)
        # 向前收集限定名：name(.name)* 或 new name(.name)*
        k = idx
        is_ctor = False
        if tokens[k].value == "new":
            is_ctor = True
            k += 1
        if k >= n or tokens[k].kind != "ident":
            return None
        base = tokens[k].value
        parts = [base]
        line = tokens[k].line
        k += 1
        # 跳过泛型参数 <...>（如 new TreeMap<string, number>( ））
        while k < n and tokens[k].value == "<":
            k += 1  # 跳过 '<'
            dep = 1
            while k < n and dep > 0:
                if tokens[k].value in "<([":
                    dep += 1
                elif tokens[k].value in ">)]":
                    dep -= 1
                k += 1
            # k 现在指向 '>' 之后的 token
        while k + 1 < n and tokens[k].value == "." and tokens[k + 1].kind == "ident":
            parts.append(tokens[k + 1].value)
            k += 2
            # 链中也可能带泛型
            while k < n and tokens[k].value == "<":
                k += 1
                dep = 1
                while k < n and dep > 0:
                    if tokens[k].value in "<([":
                        dep += 1
                    elif tokens[k].value in ">)]":
                        dep -= 1
                    k += 1
        if k < n and tokens[k].value == "(":
            return ".".join(parts), is_ctor, base, parts[-1], line
        return None

    def _try_chain_call_at(self, tokens, idx: int):
        """解析链式调用叶子 `.name(`（前驱为 '.'）。

        仅当 `.name(` 紧跟在另一个表达式结果（')' 或 ']'）之后才提取——即
        `xxx).method(` 形式，_try_call_at 从基标识符无法到达。
        若 `.name(` 跟在普通标识符后（如 `treeMap.set(`），基标识符会被
        _try_call_at 整体捕获，此处返回 None 以避免重复。
        返回 (qualified, is_ctor=False, base, name, line)。
        """
        n = len(tokens)
        # 前驱的再前一个：tokens[idx-1]=='.'，tokens[idx-2] 是链根
        if idx - 2 < 0:
            return None
        root_tok = tokens[idx - 2]
        # 链根为表达式结果 ')' / ']' 或组件块结束 '}'
        if root_tok.value not in (")", "]", "}"):
            return None
        name = tokens[idx].value
        line = tokens[idx].line
        # 后续必须是 '(' 才算调用
        if idx + 1 < n and tokens[idx + 1].value == "(":
            return name, False, name, name, line
        return None

    def _classify(self, qualified, is_ctor, base, name, line, caller, imported,
                  is_member_access=False) -> CallSite:
        # 规则优先级：系统导入符号；ArkUI 组件；ArkUI 属性；构造；命名空间；本地
        kit = imported.get(base)
        if kit:
            return CallSite(line, qualified, base, name, is_ctor, caller, "system", kit)
        if name in ARKUI_COMPONENTS:
            return CallSite(line, qualified, base, name, is_ctor, caller, "arkui_component")
        # 链式属性方法 / 属性访问：叶子名在通用属性表 → arkui_attribute
        # （即使链以 this./super. 开头，系统组件属性链也归 attribute）
        if name in ARKUI_ATTRIBUTES:
            return CallSite(line, qualified, base, name, is_ctor, caller, "arkui_attribute")
        # 成员属性访问（非调用）：归 local（matchParent 等由匹配器按符号命中）
        if is_member_access:
            return CallSite(line, qualified, base, name, is_ctor, caller, "local")
        # 已知系统 API 名（深链叶子，如 showToast）→ system
        if name in _SYSTEM_API_NAMES:
            return CallSite(line, qualified, base, name, is_ctor, caller, "system", None)
        # getPromptAction() 链上的 showToast 等系统调用（base 非导入符号但属系统 API）
        if not is_ctor and "." in qualified:
            # 深链系统调用：含已知系统 API 名 → system
            if _looks_like_system_chain(qualified):
                return CallSite(line, qualified, base, name, is_ctor, caller, "system", None)
        # 构造 new Scroller() / new Date() 等 → 若带点(命名空间构造) 归 system 候选；否则 local
        if is_ctor and "." in qualified:
            return CallSite(line, qualified, base, name, is_ctor, caller, "system", None)
        return CallSite(line, qualified, base, name, is_ctor, caller, "local")


# ---------------------------------------------------------------------------
# 工程级分析
# ---------------------------------------------------------------------------
_ETS_EXTS = {".ets", ".ts", ".tsx"}


def analyze_project(ets_root: str, exclude: set[str] | None = None) -> list[FileAnalysis]:
    exclude = exclude or set()
    results: list[FileAnalysis] = []
    for root, _dirs, files in os.walk(ets_root):
        for fn in sorted(files):
            if not fn.endswith(tuple(_ETS_EXTS)):
                continue
            if fn in exclude:
                continue
            fpath = os.path.join(root, fn)
            rel = os.path.relpath(fpath, ets_root)
            results.append(EtsAnalyzer().analyze(fpath, rel))
    # 按相对路径排序（保证输出稳定）
    results.sort(key=lambda fa: fa.rel_path)
    return results


def analyze_src_roots(src_roots: list[str], project_root: str,
                      exclude: set[str] | None = None) -> list[FileAnalysis]:
    """多源码根分析：遍历全部 src/main/ets，rel_path 形如 {module}/src/main/ets/{file}。

    module = src 的父目录名（entry / ohos_library 等），匹配参考清单的
    {module}\\src\\main\\ets\\... 形式（entry 与 ohos_library 同级库并存）。
    """
    exclude = exclude or set()
    results: list[FileAnalysis] = []
    seen: set[str] = set()
    for root in src_roots:
        if not os.path.isdir(root):
            continue
        # root 形如 .../{module}/src/main/ets；module = src 的父目录名
        # rel 基准：{module} 的父目录，使 rel 形如 {module}/src/main/ets/{file}
        root_norm = root.replace(os.sep, "/")
        if root_norm.endswith("/src/main/ets"):
            module_dir = root_norm[: -len("/src/main/ets")]  # .../{module}
            full_base = module_dir.rsplit("/", 1)[0] if "/" in module_dir else ""
        else:
            full_base = ""
        if not full_base:
            full_base = root  # 回退
        for rdir, _dirs, files in os.walk(root):
            for fn in sorted(files):
                if not fn.endswith(tuple(_ETS_EXTS)):
                    continue
                if fn in exclude:
                    continue
                fpath = os.path.join(rdir, fn)
                fpath_norm = os.path.normpath(fpath)
                if fpath_norm in seen:
                    continue
                seen.add(fpath_norm)
                rel = os.path.relpath(fpath, full_base)
                results.append(EtsAnalyzer().analyze(fpath, rel))
    results.sort(key=lambda fa: fa.rel_path)
    return results
