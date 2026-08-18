#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
review_agent.py —— 变更条目审查 agent

对 change_report 中的每条变更条目做真伪审查，降低误报率：
  * 把“变更条目 + 使用点源码片段”送 LLM 判定该变更在该调用点是否真实成立；
  * 返回每条 verdict：verified（真实变更）/ false_positive（误报）/ review（存疑待人工）；
  * 无 LLM 或调用失败时回退到确定性启发式（按重载返回类型与调用点上下文一致性判定，
    仅标注存疑，不静默丢弃，保证覆盖率不降）。

LLM 复用 ai_advisor 的 OpenAI 兼容 urllib 通道（环境变量同前），不引入第三方 SDK。
"""
from __future__ import annotations

import json
import os
import re
import urllib.request

# 复用 ai_advisor 的 LLM 环境变量约定
ENV_BASE_URL = "HOSCANNER_LLM_BASE_URL"
ENV_API_KEY = "HOSCANNER_LLM_API_KEY"
ENV_MODEL = "HOSCANNER_LLM_MODEL"
DEFAULT_BASE_URL = "https://api.deepseek.com/v1"
DEFAULT_MODEL = "deepseek-chat"

# 审查结论常量
VERIFIED = "verified"
FALSE_POSITIVE = "false_positive"
REVIEW = "review"

# 确定性回退：ArkUI 属性方法的组件特化重载返回类型 → 该属性仅在该组件链上成立。
# 调用点 snippet 若不含组件构造线索，则组件特化重载判为存疑（REVIEW）而非直接定真。
# 组件特化重载的返回类型后缀：*Attribute / *Modifier，以及具体的组件状态类型。
_COMPONENT_ATTR_SUFFIX = re.compile(r":\s*([A-Z][A-Za-z0-9_]*)\s*(?:;|\||$)")
# 判定为“组件特化返回类型”的后缀（非通用 T/void/基础类型/Promise）
_SPECIAL_RETURN_SUFFIXES = ("Attribute", "Modifier")
# 已知组件状态返回类型（返回这些的属性方法都是组件特化）
_KNOWN_COMPONENT_RETURN = {
    "ArcDotIndicator", "LengthMetrics", "LocalizedBorderRadiuses", "FontWeight",
    "Length", "BorderStyle", "ResourceColor", "ColorMetrics", "Dimension",
    "AssetDownloadConfig", "CalendarFormat", "BarMode", "HorizontalAlign",
}
_GENERIC_RETURN = re.compile(r":\s*T\b|:\s*void\b")


def _special_component_of(api: str) -> str | None:
    """若 api 是组件特化属性重载，返回对应组件名（用于在 snippet 中找构造线索）；否则 None。"""
    m = _COMPONENT_ATTR_SUFFIX.search(api)
    if not m:
        return None
    ret = m.group(1)
    # 通用返回类型不算组件特化
    if _GENERIC_RETURN.search(api) or ret in ("T", "void", "number", "string", "boolean"):
        return None
    for suf in _SPECIAL_RETURN_SUFFIXES:
        if ret.endswith(suf):
            comp = ret[:-len(suf)]
            return comp or None
    if ret in _KNOWN_COMPONENT_RETURN:
        return None  # 具体类型但无清晰组件名线索，返回 None（仍判为特化但无构造线索可匹配）
    return None


class ReviewAgent:
    """变更条目审查 agent。"""

    def __init__(self, use_llm: bool = True, batch_size: int = 12):
        self.use_llm = use_llm
        self.batch_size = batch_size

    # ------------------------------------------------------------------
    # 对外入口
    # ------------------------------------------------------------------
    def review(self, items: list) -> list:
        """审查变更条目列表，返回带 verdict/reason 的新列表（原条目原地补字段）。

        items: ApiChangeItem 列表（需含 api/codeLocation/snippet/op/impact）。
        返回：原 items 列表，每项新增 reviewVerdict / reviewReason 字段。
        """
        if not items:
            return items
        # 先全部置为“待审”
        for it in items:
            it.reviewVerdict = REVIEW
            it.reviewReason = ""

        if self.use_llm and self._llm_available():
            try:
                self._review_llm(items)
                return items
            except Exception as e:  # noqa: BLE001
                print(f"  ! 审查 LLM 调用失败（{e}），回退到确定性启发式审查")
        self._review_deterministic(items)
        return items

    # ------------------------------------------------------------------
    # LLM 审查
    # ------------------------------------------------------------------
    def _llm_available(self) -> bool:
        return bool(os.environ.get(ENV_BASE_URL) or os.environ.get(ENV_API_KEY))

    def _review_llm(self, items: list):
        """分批送 LLM 审查。每批把若干 (api, snippet, op) 交模型判定。"""
        for start in range(0, len(items), self.batch_size):
            batch = items[start:start + self.batch_size]
            verdicts = self._call_llm_batch(batch)
            for it, v in zip(batch, verdicts):
                verdict = v.get("verdict", REVIEW)
                if verdict not in (VERIFIED, FALSE_POSITIVE, REVIEW):
                    verdict = REVIEW
                it.reviewVerdict = verdict
                it.reviewReason = (v.get("reason") or "").strip()[:200]

    def _call_llm_batch(self, batch: list) -> list[dict]:
        """调用 LLM 对一批条目审查，返回与 batch 等长的 verdict 列表。"""
        base_url = (os.environ.get(ENV_BASE_URL) or DEFAULT_BASE_URL).rstrip("/")
        api_key = os.environ.get(ENV_API_KEY) or ""
        model = os.environ.get(ENV_MODEL) or DEFAULT_MODEL
        # 构造条目清单（精简，省 token）
        lines = []
        for i, it in enumerate(batch):
            snip = (getattr(it, "snippet", "") or "").strip()
            lines.append(
                f"[{i}] api={it.api}\n    变更类型={it.op}\n    变更影响={(getattr(it,'impact','') or '')[:80]}\n    调用点源码={snip}"
            )
        prompt = (
            "你是鸿蒙 ArkTS 升级变更审查员。下面是若干“知识库变更记录 × 调用点”条目。\n"
            "判断每条：该变更记录的 API 签名是否真实匹配该调用点源码所用的接口。\n"
            "常见误报：同一属性名(如 backgroundColor/fontWeight)在不同组件上有多个组件特化重载\n"
            "(如 ): ToolBarModifier / : ArcDotIndicator)，调用点若在通用组件(Column/Row/Text)上，\n"
            "则仅匹配通用重载(返回 T)，组件特化重载为误报。\n"
            "输出 JSON 数组，每项 {\"idx\": 数字, \"verdict\": \"verified|false_positive|review\", \"reason\": \"简短中文\"}。\n"
            "verified=真实匹配；false_positive=误报(签名不匹配调用点)；review=存疑。\n\n条目：\n"
            + "\n".join(lines)
        )
        payload = {
            "model": model,
            "messages": [
                {"role": "system", "content": "你是严谨的 API 变更审查员，只输出 JSON 数组。"},
                {"role": "user", "content": prompt},
            ],
            "temperature": 0.0,
            "max_tokens": 1200,
        }
        req = urllib.request.Request(
            f"{base_url}/chat/completions",
            data=json.dumps(payload).encode("utf-8"),
            headers={"Content-Type": "application/json",
                     "Authorization": f"Bearer {api_key}"},
            method="POST")
        with urllib.request.urlopen(req, timeout=90) as resp:
            data = json.loads(resp.read().decode("utf-8"))
        content = data["choices"][0]["message"]["content"].strip()
        # 解析 JSON 数组（容错：剥离 markdown 代码围栏）
        content = re.sub(r"^```(?:json)?|```$", "", content, flags=re.MULTILINE).strip()
        arr = json.loads(content)
        # 按 idx 对齐回 batch
        by_idx = {int(a.get("idx", -1)): a for a in arr}
        return [by_idx.get(i, {"verdict": REVIEW, "reason": "未返回"}) for i in range(len(batch))]

    # ------------------------------------------------------------------
    # 确定性回退审查（无 LLM 时）
    # ------------------------------------------------------------------
    def _review_deterministic(self, items: list):
        """启发式审查：组件特化属性重载在调用点无组件线索时判为 REVIEW（存疑）。

        保守原则：只把“组件特化重载且调用点 snippet 无组件构造线索”标 REVIEW，
        其余标 VERIFIED。绝不标 FALSE_POSITIVE（避免误删参考匹配，保证覆盖率）。
        """
        for it in items:
            api = it.api or ""
            snip = (getattr(it, "snippet", "") or "")
            comp = _special_component_of(api)
            if comp:
                # 组件特化属性重载（如 ): TextAttribute / : ToolBarModifier）
                # 调用点 snippet 若含该组件构造线索(如 Text( )，则真实；否则存疑
                if re.search(rf"\b{re.escape(comp)}\s*\(", snip):
                    it.reviewVerdict = VERIFIED
                    it.reviewReason = f"调用点含 {comp} 组件构造线索，匹配 {comp}Attribute/Modifier 重载"
                else:
                    it.reviewVerdict = REVIEW
                    it.reviewReason = f"组件特化重载（{comp}），调用点无 {comp} 构造线索，存疑"
            else:
                it.reviewVerdict = VERIFIED
                it.reviewReason = "非组件特化重载，按符号匹配认定"


def review_report(report, use_llm: bool = True) -> dict:
    """审查整份升级变更报告，原地补 reviewVerdict/reviewReason，返回统计。"""
    agent = ReviewAgent(use_llm=use_llm)
    all_items = report.system_changes + report.behavior_changes
    agent.review(all_items)
    # 统计
    from collections import Counter
    c = Counter(it.reviewVerdict for it in all_items)
    return {
        "total": len(all_items),
        "verified": c.get(VERIFIED, 0),
        "false_positive": c.get(FALSE_POSITIVE, 0),
        "review": c.get(REVIEW, 0),
        "llm_used": use_llm and agent._llm_available(),
    }
