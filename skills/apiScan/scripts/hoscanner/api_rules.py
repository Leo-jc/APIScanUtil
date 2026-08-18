#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
api_rules.py —— 系统 API 使用规则引擎

* DEFAULT_RULES：内置扫描规则（41 条 ArkTS 规则，覆盖既有工程扫描结果）。
* 每条规则 = (标签, 正则模式, [KB 索引候选关键词])。
* 支持通过 --rules 传入 JSON 追加 / 覆盖自定义规则，便于扫描其它三方库。
"""
import json
import re

Rule = tuple[str, str, list[str]]  # (label, pattern, kb_candidates)

# fmt: off
DEFAULT_RULES: list[Rule] = [
    ("promptAction.showToast",                  r"promptAction\.showToast\b",          ["promptAction", "showToast", "PromptAction"]),
    ("promptAction.openToast",                  r"promptAction\.openToast\b",          ["promptAction", "openToast", "PromptAction"]),
    ("hilog.info",                              r"hilog\.info\b",                      ["hilog", "info"]),
    ("hilog.warn",                              r"hilog\.warn\b",                      ["hilog", "warn"]),
    ("hilog.error",                             r"hilog\.error\b",                     ["hilog", "error"]),
    ("router.pushUrl",                          r"router\.pushUrl\b",                  ["router", "pushUrl"]),
    ("router.back",                             r"router\.back\b",                     ["router", "back"]),
    ("router.getParams",                        r"router\.getParams\b",                ["router", "getParams"]),
    ("intl.DateTimeFormat",                     r"intl\.DateTimeFormat\b",             ["intl", "DateTimeFormat"]),
    ("intl.NumberFormat",                       r"intl\.NumberFormat\b",               ["intl", "NumberFormat"]),
    ("intl.RelativeTimeFormat",                 r"intl\.RelativeTimeFormat\b",         ["intl", "RelativeTimeFormat"]),
    ("i18n.System.getSystemLocale",             r"i18n\.System\b",                     ["i18n", "System"]),
    ("window.getLastWindow",                    r"window\.getLastWindow\b",            ["window", "Window", "getLastWindow"]),
    ("Window.setGestureBackEnabled",            r"setGestureBackEnabled\b",            ["Window", "setGestureBackEnabled"]),
    ("Window.getWindowProperties",              r"\.getWindowProperties\b",            ["Window", "getWindowProperties"]),
    ("display.getDefaultDisplaySync",           r"display\.getDefaultDisplaySync\b",   ["display", "getDefaultDisplaySync"]),
    ("display.getPrimaryDisplaySync",           r"display\.getPrimaryDisplaySync\b",   ["display", "getPrimaryDisplaySync"]),
    ("bundleManager.getApplicationInfoSync",    r"bundleManager\.getApplicationInfoSync\b", ["bundleManager"]),
    ("abilityAccessCtrl.createAtManager",       r"abilityAccessCtrl\.createAtManager\b", ["abilityAccessCtrl", "createAtManager"]),
    ("getContext().getApplicationContext",      r"\.getApplicationContext\b",          ["getApplicationContext", "ApplicationContext"]),
    ("UIContext.showAlertDialog",               r"\.showAlertDialog\b",                ["UIContext", "showAlertDialog"]),
    ("getUIContext()",                          r"\.getUIContext\b",                   ["UIContext"]),
    ("CommonMethod.borderRadius",               r"\.borderRadius\(",                   ["CommonMethod", "borderRadius"]),
    ("TextAttribute.fontWeight",                r"\.fontWeight\(",                     ["fontWeight", "TextAttribute"]),
    ("List/ForEach/ListItem",                   r"\bList\b|\bForEach\b|\bListItem\b", ["List", "ForEach", "ListItem", "ListOptions"]),
    ("Scroller.scrollToIndex (backToTop)",      r"\.scrollToIndex\b",                  ["Scroller", "scrollToIndex", "backToTop", "ScrollableCommonMethod"]),
    ("Scroller.scrollEdge",                     r"\.scrollEdge\b",                     ["Scroller", "scrollEdge", "ScrollableCommonMethod"]),
    ("TextInput",                               r"\bTextInput\b",                      ["TextInput", "TextInputAttribute"]),
    ("Tabs/TabContent",                         r"\bTabs\b|\bTabContent\b",           ["Tabs"]),
    ("setColorMode",                            r"\.setColorMode\b",                   ["setColorMode", "ConfigurationConstant"]),
    ("ConfigurationConstant.ColorMode",         r"ConfigurationConstant\b",            ["ConfigurationConstant"]),
    ("ScrollableCommonMethod (Scroll)",         r"\bScroll\b",                         ["Scroll", "ScrollableCommonMethod"]),
    ("import hilog",                            r"import.*hilog",                      ["hilog"]),
    ("import promptAction",                     r"import.*promptAction",               ["promptAction"]),
    ("import router",                           r"import.*router\b.*from",             ["router"]),
    ("import intl",                             r"import.*intl.*from",                 ["intl"]),
    ("import i18n",                             r"import.*i18n.*from",                 ["i18n"]),
    ("import window",                           r"import.*window.*from",               ["window"]),
    ("import display",                          r"import.*display.*from",              ["display"]),
    ("import bundleManager",                    r"import.*bundleManager.*from",        ["bundleManager"]),
    ("import abilityAccessCtrl",                r"import.*abilityAccessCtrl.*from",    ["abilityAccessCtrl"]),
]
# fmt: on


# ---------------------------------------------------------------------------
# C/C++ 原生 API 扫描规则（harmonyos_native 规则集）
# ---------------------------------------------------------------------------
# HarmonyOS 原生 C 接口前缀；命中即产出一条使用记录，供变更匹配器与知识库交叉。
# 与 DEFAULT_RULES（ArkTS）分离：scan_cpp 用本集，避免 ArkTS 规则误命中 C++ 源码。
NATIVE_API_RULES: list[Rule] = [
    ("native_api OH_",     r"\bOH_[A-Za-z][A-Za-z0-9_]*", ["Native", "OH_"]),
    ("native_api napi_",   r"\bnapi_[A-Za-z][A-Za-z0-9_]*", ["Native", "napi_"]),
    ("native_api OHOS_",   r"\bOHOS_[A-Z][A-Za-z0-9_]*", ["Native", "OHOS_"]),
    ("include native header",
     r"#include\s*[<\"](?:native_|oh_|arkui_|ark_|napi\.h)",
     ["Native", "native_header"]),
]


class RuleEngine:
    """编译规则并执行逐行扫描。"""

    def __init__(self, rules: list[Rule] | None = None, extra_rules_path: str | None = None):
        self.rules: list[tuple[str, re.Pattern, list[str]]] = [
            (label, re.compile(pattern), candidates) for label, pattern, candidates in (rules or DEFAULT_RULES)
        ]
        if extra_rules_path:
            self._load_extra(extra_rules_path)

    def _load_extra(self, path: str):
        with open(path, encoding="utf-8") as f:
            data = json.load(f)
        for item in data:
            self.rules.append((item["label"], re.compile(item["pattern"]), list(item["candidates"])))

    @property
    def rule_count(self) -> int:
        return len(self.rules)

    def match_line(self, line: str) -> list[str]:
        """返回该行命中的规则标签列表（按规则声明顺序）。"""
        hits = []
        for label, pattern, _cands in self.rules:
            if pattern.search(line):
                hits.append(label)
        return hits

    def candidates_for(self, label: str) -> list[str]:
        for lab, _p, cands in self.rules:
            if lab == label:
                return list(cands)
        return []
