#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
ai_advisor.py —— AI 升级建议生成器

基于升级变更清单（change_report）生成自然语言的“升级风险评估与行动建议”。

两级模式：
  1. LLM 模式（可选）：当配置了 OpenAI 兼容的 LLM 端点时
     （环境变量 HOSCANNER_LLM_BASE_URL / HOSCANNER_LLM_API_KEY / HOSCANNER_LLM_MODEL，
     默认指向 DeepSeek 兼容端点），调用大模型生成综合评估与优先建议；
  2. 确定性回退：未配置 / 调用失败时，按变更类型与版本统计自动生成
     高影响变更清单（删除/废弃/行为变更）与逐 API 建议。

LLM 调用不引入第三方 SDK，仅使用标准库 urllib，可离线运行（回退模式）。
"""
import json
import os
import urllib.request
from itertools import groupby

from .report import _count_by_language

# 高影响变更类型
CRITICAL_OPS = ("删除API", "废弃", "接口行为变更", "UX视觉布局变更", "权限变更")
WARN_OPS = ("函数变更", "接口定义变更", "新增API")

# 环境变量配置（可选）
ENV_BASE_URL = "HOSCANNER_LLM_BASE_URL"
ENV_API_KEY = "HOSCANNER_LLM_API_KEY"
ENV_MODEL = "HOSCANNER_LLM_MODEL"
DEFAULT_BASE_URL = "https://api.deepseek.com/v1"
DEFAULT_MODEL = "deepseek-chat"


def _is_critical(it) -> bool:
    return any(k in it.op for k in CRITICAL_OPS)


def _is_warn(it) -> bool:
    return any(k in it.op for k in WARN_OPS)


def _collapse_duplicates(items, keys):
    """折叠除 keys 外字段相同的条目，保序；返回 [(it, count), ...]。

    count 为折叠的原始条目数（≥1）。keys 决定"相同"口径——advice 的三节/LLM
    样本不显示 codeLocation，故 keys 不含 codeLocation，使同一变更在多个调用点
    命中时折叠为一行（消除重复噪声，数据层 per-call-site 行仍保留在 change_report）。
    """
    out, seen = [], {}
    for it in items:
        k = tuple(getattr(it, f) for f in keys)
        if k in seen:
            seen[k][1] += 1
        else:
            seen[k] = [it, 1]
            out.append(seen[k])
    return [(it, n) for it, n in out]


class UpgradeAdvisor:
    def __init__(self, change_report, call_graph=None, use_llm: bool = True):
        self.report = change_report
        self.call_graph = call_graph
        self.use_llm = use_llm

    # ------------------------------------------------------------------
    # 确定性回退建议
    # ------------------------------------------------------------------
    def _deterministic_advice(self) -> str:
        r = self.report
        lines = []
        lines.append("# HarmonyOS 升级评估与行动建议（AI 辅助）")
        lines.append("")
        lines.append(f"> 生成方式：确定性规则引擎（未配置 / 未启用 LLM，"
                     f"或 LLM 调用失败后的回退）。升级窗口 API {r.from_api_version} → {r.to_api_version}。")
        lines.append("")

        crit = [it for it in r.system_changes + r.behavior_changes if _is_critical(it)]
        warns = [it for it in r.system_changes + r.behavior_changes if _is_warn(it)]

        lines.append("## 一、总体结论")
        lines.append("")
        lines.append(f"- 使用的系统 API：{r.used_apis} 个")
        lines.append(f"- 升级区间内变更条目：系统 API {len(r.system_changes)} 条，"
                     f"行为变更 {len(r.behavior_changes)} 条，合计 {r.total} 条")
        lines.append(f"- 高影响变更（删除 / 废弃 / 行为变更 / UX 变更）：**{len(crit)} 条**")
        lines.append(f"- 需关注变更（函数 / 接口定义变更）：**{len(warns)} 条**")
        all_lb = _count_by_language(r.system_changes + r.behavior_changes)
        crit_lb = _count_by_language(crit)
        lines.append(f"- 语言分解：ArkTS **{all_lb['arkts']}** / C++ **{all_lb['cpp']}**"
                     f"（高影响：ArkTS {crit_lb['arkts']} / C++ {crit_lb['cpp']}）")
        lines.append("")

        # 按版本分布
        from collections import Counter
        ver = Counter((it.version) for it in r.system_changes + r.behavior_changes)
        lines.append("## 二、变更按版本分布")
        lines.append("")
        lines.append("| 版本 | 变更数 |")
        lines.append("|------|--------|")
        for v, n in sorted(ver.items(), key=lambda kv: self._ver_key(kv[0])):
            lines.append(f"| {v} | {n} |")
        lines.append("")

        if crit:
            lines.append("## 三、高影响变更清单（需优先处理）")
            lines.append("")
            lines.append("| API | 版本 | 类型 | 语言 | 内容 | 来源 |")
            lines.append("|-----|------|------|------|------|------|")
            collapsed = _collapse_duplicates(
                sorted(crit, key=lambda x: (x.api, self._ver_key(x.version))),
                keys=("api", "version", "op", "decl", "language", "kbFile"))
            for it, n in collapsed[:200]:
                decl = it.decl.replace("|", "\\|")[:80]
                suffix = f" ×{n}" if n > 1 else ""
                lines.append(f"| `{it.api}{suffix}` | {it.version} | {it.op} | {it.language} | {decl} | `{it.kbFile}` |")
            if len(collapsed) > 200:
                lines.append(f"\n> …共 {len(crit)} 条高影响变更（折叠为 {len(collapsed)} 行），"
                             f"其余见 `change_report.json` / 第四节逐 API 建议。")
            lines.append("")

        # 逐 API 建议
        lines.append("## 四、逐 API 建议")
        lines.append("")
        per_api = r.per_api()
        for api in sorted(per_api):
            g = per_api[api]
            items = g["system"] + g["behavior"]
            total = len(items)
            crit_items = [it for it in items if _is_critical(it)]
            crit_n = len(crit_items)
            lb = _count_by_language(items)
            clb = _count_by_language(crit_items)
            tag = "⚠️ 高风险" if crit_n else ("ℹ️ 关注" if total else "")
            lines.append(f"### `{api}`  {tag}  （变更 {total} 条 [ArkTS {lb['arkts']} / C++ {lb['cpp']}]，"
                         f"其中高影响 {crit_n} 条 [ArkTS {clb['arkts']} / C++ {clb['cpp']}]）")
            lines.append("")
            # 组内高影响条目按 (version, op, decl, language) 连续折叠：
            # per_api() 已按 (apiVersion, version) 排序，相同元组天然相邻，
            # groupby 合并相邻 run 并保留版本阅读序（同一变更跨版本分隔后重现仍各自成行）。
            for (_v, _op, _decl, _lang), grp in groupby(
                    crit_items, key=lambda it: (it.version, it.op, it.decl, it.language)):
                gs = list(grp)
                it0 = gs[0]
                cnt = f"（共 {len(gs)} 处调用点）" if len(gs) > 1 else ""
                lines.append(f"- [{it0.language}] [{it0.version}] `{it0.op}`：{it0.decl}{cnt}")
            lines.append("")

        lines.append("---")
        lines.append("*本文档由 hoscanner 的 UpgradeAdvisor 自动生成。*")
        return "\n".join(lines)

    @staticmethod
    def _ver_key(v: str) -> tuple:
        """版本字符串排序键：数值优先（取首个数字），再按字符串。"""
        import re
        m = re.search(r"\d+\.\d+\.\d+", v or "")
        if m:
            return tuple(int(x) for x in m.group(0).split("."))
        return (0, 0, 0)

    # ------------------------------------------------------------------
    # LLM 模式
    # ------------------------------------------------------------------
    def _llm_available(self) -> bool:
        return bool(os.environ.get(ENV_BASE_URL) or os.environ.get(ENV_API_KEY))

    def _call_llm(self, prompt: str) -> str:
        base_url = (os.environ.get(ENV_BASE_URL) or DEFAULT_BASE_URL).rstrip("/")
        api_key = os.environ.get(ENV_API_KEY) or ""
        model = os.environ.get(ENV_MODEL) or DEFAULT_MODEL
        url = f"{base_url}/chat/completions"
        payload = {
            "model": model,
            "messages": [
                {"role": "system",
                 "content": "你是鸿蒙(HarmonyOS)三方库升级迁移专家。基于给出的系统 API 变更与行为"
                            "变更数据，输出精炼、可执行的升级风险评估与行动建议（中文 Markdown）。"},
                {"role": "user", "content": prompt},
            ],
            "temperature": 0.2,
            "max_tokens": 2000,
        }
        req = urllib.request.Request(
            url, data=json.dumps(payload).encode("utf-8"),
            headers={"Content-Type": "application/json",
                     "Authorization": f"Bearer {api_key}"},
            method="POST")
        with urllib.request.urlopen(req, timeout=60) as resp:
            data = json.loads(resp.read().decode("utf-8"))
        return data["choices"][0]["message"]["content"]

    def _build_llm_prompt(self) -> str:
        r = self.report
        crit = [it for it in r.system_changes + r.behavior_changes if _is_critical(it)]
        lb = _count_by_language(crit)
        collapsed = _collapse_duplicates(
            crit, keys=("api", "version", "op", "language", "decl", "kbFile"))
        sample = "\n".join(
            f"- [{it.version}] [{it.language}] {it.api} `{it.op}`: {it.decl}" + (f" ×{n}" if n > 1 else "")
            for it, n in collapsed[:80])
        return (
            f"鸿蒙三方库从 API {r.from_api_version} 升级到 {r.to_api_version}。\n"
            f"使用的系统 API 共 {r.used_apis} 个；\n"
            f"升级区间内变更：系统 API {len(r.system_changes)} 条，行为变更 {len(r.behavior_changes)} 条，"
            f"其中高影响 {len(crit)} 条（ArkTS {lb['arkts']} / C++ {lb['cpp']}）。\n\n"
            f"高影响变更样本（前 80 条）：\n{sample or '（无）'}\n\n"
            "请给出：1) 整体升级风险等级与理由；2) 必须重点回归的 API 清单；"
            "3) 分版本迁移要点；4) 建议的测试策略。控制在 600 字内。"
        )

    # ------------------------------------------------------------------
    def generate(self) -> str:
        if self.use_llm and self._llm_available():
            try:
                return self._call_llm(self._build_llm_prompt())
            except Exception as e:  # noqa: BLE001
                print(f"  ! LLM 调用失败（{e}），回退到确定性建议")
        return self._deterministic_advice()
