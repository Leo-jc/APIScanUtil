#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""hoscanner 路径与常量配置。"""
import os
import json

# skill 根目录（scripts/hoscanner/config.py → scripts/hoscanner → scripts → apiScan）
_SKILL_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


def _load_skill_config() -> dict:
    """读取 skill 根目录的 config.json（若存在）。参照 ohos-scan-leak runner.load_config。"""
    p = os.path.join(_SKILL_ROOT, "config.json")
    if os.path.isfile(p):
        try:
            with open(p, encoding="utf-8") as f:
                return json.load(f)
        except Exception:  # noqa: BLE001
            pass
    return {}


_CFG = _load_skill_config()

# ---------------------------------------------------------------------------
# 默认路径（优先级：CLI 参数 > 环境变量 > config.json > 内置默认）
# ---------------------------------------------------------------------------
# SDK 根：环境变量 HOSCANNER_SDK_ROOT > config.json sdkRoot > 空（CLI 必传）
DEFAULT_SDK_ROOT = (
    os.environ.get("HOSCANNER_SDK_ROOT")
    or (_CFG.get("sdkRoot") or "").strip()
    or ""
)
DEFAULT_KNOWLEDGE_ROOT = os.path.join(_SKILL_ROOT, "knowledge")
# 工程路径置空：单工程扫描必须经 --project 显式传入，不再默认指向某个具体 demo
DEFAULT_PROJECT = ""
# 输出目录默认放 skill 根下 output/（运行时生成；.gitignore 忽略）
DEFAULT_OUT_DIR = os.path.join(_SKILL_ROOT, "output")

# 知识库两个目录
# 注意：行为/UX 变更目录已由 apiChange 重命名为 harmonyos_behavior_changes，
# 此处兼容两者——KnowledgeBase._load 会优先用新名，缺失时回退旧名 apiChange。
API_CHANGE_DIR_NAME = "harmonyos_behavior_changes"        # 行为 / UX 变更清单（list 结构，29 个文件）
API_CHANGE_DIR_NAME_LEGACY = "apiChange"                  # 旧目录名（向后兼容）
API_CHANGES_DIR_NAME = "harmonyos_api_changes"            # 系统 API 变更清单（dict 结构，24 个文件）

# 工程源码扫描根：相对工程根的 ETS/TS 源码目录
ETS_SRC_REL = os.path.join("entry", "src", "main", "ets")

# C/C++ 原生源码目录（NAPI / HarmonyOS Native，与 ets 同级 main 目录下）
CPP_SRC_REL = os.path.join("entry", "src", "main", "cpp")

# 扫描的 C/C++ 源码扩展名
CPP_EXTS = (".cpp", ".cc", ".cxx", ".c", ".h", ".hpp", ".hxx")

# 扫描时排除的目录（C++ 侧）：build 产物 / 三方 / 构建缓存
CPP_SKIP_DIRS = {"build", ".cxx", "oh_modules", "node_modules", ".git",
                 ".preview", "third_party", "thirdparty"}

# HarmonyOS Native C/C++ 系统 API 前缀：
#   OH_*      —— 原生接口（如 OH_Drawing… / OH_NativeBuffer… / OH_Audio…）
#   napi_*    —— Node-API / NAPI 桥接接口
#   OHOS_     —— 部分旧版 C 接口宏 / 类型前缀
NATIVE_API_PREFIXES = ("OH_", "napi_", "OHOS_")

# 生成的数据文件，扫描时排除
EXCLUDED_GENERATED_FILES = {"KnowledgeStore.ets"}

# 知识库文件名解析：HarmonyOS_6.0.0(20)_Beta1.json / HarmonyOS_26.0.0_Beta1.json
FN_RE_PATTERN = r"^HarmonyOS_(\d+\.\d+\.\d+)(?:\((\d+)\))?(?:_([A-Za-z0-9]+))?\.json$"

# 报告中用于标注“知识库无对应变更记录”的文案（与参考文档一致）
NOT_FOUND_LABEL = "(未在知识库中找到对应文件，可能为 ArkUI 内置 API)"

# 噪音类名（索引 KB 时忽略）
# 注：DevEcoAPIScan 把 "unnamed" 视为 DEFAULT_ARK_CLASS_NAME（全局变量/常量的默认类）
# 参与匹配；apiScan 没有 DEFAULT_ARK_CLASS_NAME 机制，"unnamed" 直接索引会误命中
# 业务代码中含 "unnamed" 字串的任意使用点，故保留为噪声过滤。
NOISE_CLS = {"None", "", "global", "unnamed"}
