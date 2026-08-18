#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
report.py —— 报告生成

* api_usage.json / api_usage.md  —— API 使用记录（结构与参考文档一致，保证可覆盖比对）
* api_call_graph.json            —— API 调用图谱（文件 → 函数 → 系统 API 调用点）
* change_report.json / .md       —— 升级涉及的「系统 API 变更 + 行为变更」清单
"""
import datetime
import json
import os

from .config import NOT_FOUND_LABEL


def _md_inline(s: str) -> str:
    """转义 markdown 表格/行内的管道符，避免破坏列表与表格列。"""
    return (s or "").replace("|", "\\|").replace("\n", " ").strip()


# ---------------------------------------------------------------------------
# 1. 知识文件覆盖统计
# ---------------------------------------------------------------------------
def build_coverage(usages: list[dict], all_kb_files: list[str]):
    """coverage: 知识文件(含 NOT_FOUND 占位) → 使用它的 API 标签集合。"""
    coverage: dict[str, set[str]] = {}
    for u in usages:
        for kb_f in u.get("kbSources", []):
            coverage.setdefault(kb_f, set()).add(u["api"])

    all_set = set(all_kb_files)
    covered_real = {k for k in coverage if k in all_set}
    missed = all_set - covered_real
    summary = {
        "totalKbFiles": len(all_set),
        "directApiMatch": len(covered_real),
        "dataLayerOnly": len(missed),
        "note": "知识文件总数 = API 直接匹配的文件 + 未被代码直接引用的文件。未被直接引用的文件仍可通过同知识库其它记录间接关联。",
    }
    return coverage, summary, sorted(all_set)


# ---------------------------------------------------------------------------
# 2. api_usage.json
# ---------------------------------------------------------------------------
def gen_api_usage_json(usages: list[dict], all_kb_files: list[str], out_path: str):
    coverage, summary, involved = build_coverage(usages, all_kb_files)
    output = {
        "title": "HarmonyOS API 变更中心 — API 使用记录",
        "summary": {
            "totalApiUsages": len(usages),
            "uniqueApis": len({u["api"] for u in usages}),
            "filesScanned": len({u["file"] for u in usages}),
            "kbCoverage": summary,
            "allInvolvedFiles": involved,
        },
        "apiUsage": [
            {
                "api": u["api"],
                "codeLocation": f"{u['file']}:{u['line']}",
                "snippet": u["snippet"],
                "kbSources": u["kbSources"],
            }
            for u in sorted(usages, key=lambda x: (x["file"], x["line"]))
        ],
    }
    os.makedirs(os.path.dirname(out_path) or ".", exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as f:
        json.dump(output, f, ensure_ascii=False, indent=2)
    return output


# ---------------------------------------------------------------------------
# 3. api_usage.md
# ---------------------------------------------------------------------------
def gen_api_usage_md(usages: list[dict], all_kb_files: list[str], out_path: str,
                     kb_scan_order: list[str] | None = None):
    coverage, summary, involved = build_coverage(usages, all_kb_files)
    results = sorted(usages, key=lambda x: (x["file"], x["line"]))

    lines = []
    lines.append("# HarmonyOS API 变更中心 — API 使用文档")
    lines.append("")
    lines.append(f"生成时间：{datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    lines.append("")
    lines.append("## 概述")
    lines.append("")
    lines.append(f"- **API 使用记录数**：{len(results)}")
    lines.append(f"- **涉及的唯一 API**：{len({r['api'] for r in results})}")
    lines.append(f"- **扫描的 .ets 文件数**：{len({r['file'] for r in results})}")
    lines.append(f"- **知识库文件总数**：{summary['totalKbFiles']}")
    lines.append(f"- **API 直接匹配的知识文件**：{summary['directApiMatch']}")
    lines.append(f"- **未被代码直接引用的知识文件**：{summary['dataLayerOnly']}")
    lines.append("")
    lines.append(f"> **统计口径**：知识库共 {summary['totalKbFiles']} 个文件。其中 {summary['directApiMatch']} 个被代码中的 API 直接引用（即应用代码使用了该文件中出现的 API）；其余 {summary['dataLayerOnly']} 个文件未被本次扫描的源码直接命中。")
    lines.append("")

    lines.append("## API 使用详情")
    lines.append("")
    lines.append("| # | API | 代码位置 | 片段 | 来源知识文件 |")
    lines.append("|---|-----|----------|------|-------------|")
    for i, r in enumerate(results, 1):
        kb_cell = "<br>".join(r["kbSources"][:5])
        if len(r["kbSources"]) > 5:
            kb_cell += f"<br>…等 {len(r['kbSources'])} 个文件"
        snippet = r["snippet"].replace("|", "\\|")[:80]
        lines.append(f"| {i} | `{r['api']}` | `{r['file']}:{r['line']}` | `{snippet}` | {kb_cell} |")
    lines.append("")

    lines.append("## 知识库文件覆盖清单")
    lines.append("")
    lines.append(f"共 **{len(coverage)}** 个知识文件被 API 使用或数据层加载覆盖。")
    lines.append("")
    lines.append("| 目录 | 文件名 | 被引用的 API 数量 |")
    lines.append("|------|--------|------------------|")
    for fname, apis in sorted(coverage.items()):
        dir_name = os.path.dirname(fname)
        base = os.path.basename(fname)
        # 与参考实现一致：展示命中的 API 集合（这里按名称排序以保证输出确定性）
        set_repr = "{" + ", ".join(f"'{a}'" for a in sorted(apis)) + "}"
        lines.append(f"| {dir_name} | {base} | {set_repr} |")
    lines.append("")

    lines.append("---")
    lines.append("*本文档由 hoscanner（HarmonyOS 升级 API 变更扫描工具）自动生成。*")

    os.makedirs(os.path.dirname(out_path) or ".", exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    return lines


# ---------------------------------------------------------------------------
# 4. api_call_graph.json
# ---------------------------------------------------------------------------
def gen_call_graph_json(file_analyses, out_path: str):
    graph = []
    for fa in file_analyses:
        sys_calls = [cs for cs in fa.call_sites
                     if cs.kind in ("system", "arkui_component")]
        node = {
            "file": fa.rel_path,
            "imports": [
                {"line": i.line, "names": i.names, "source": i.source,
                 "kit": i.kit, "isKit": i.is_kit}
                for i in fa.imports
            ],
            "functions": fa.functions,
            "systemApiCalls": [
                {
                    "line": cs.line,
                    "qualified": cs.qualified,
                    "base": cs.base,
                    "name": cs.name,
                    "kind": cs.kind,
                    "kit": cs.kit,
                    "isConstructor": cs.is_constructor,
                    "caller": cs.caller,
                }
                for cs in sys_calls
            ],
        }
        graph.append(node)

    # 汇总：系统 API 调用图谱（api → 调用点列表）
    usage_by_api: dict[str, list[dict]] = {}
    for fa in file_analyses:
        for cs in fa.call_sites:
            if cs.kind in ("system", "arkui_component"):
                usage_by_api.setdefault(cs.qualified, []).append({
                    "file": fa.rel_path, "line": cs.line,
                    "caller": cs.caller, "kit": cs.kit,
                })

    output = {
        "title": "HarmonyOS API 调用图谱",
        "summary": {
            "filesAnalyzed": len(file_analyses),
            "systemApis": len(usage_by_api),
            "systemApiCallSites": sum(len(v) for v in usage_by_api.values()),
        },
        "files": graph,
        "apiGraph": [
            {"api": api, "kind": "system", "callSites": sites}
            for api, sites in sorted(usage_by_api.items())
        ],
    }
    os.makedirs(os.path.dirname(out_path) or ".", exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as f:
        json.dump(output, f, ensure_ascii=False, indent=2)
    return output


# ---------------------------------------------------------------------------
# 4b. C++ 原生 API 使用与调用图谱
# ---------------------------------------------------------------------------
def gen_cpp_api_usage_json(usages: list[dict], all_kb_files: list[str], out_path: str):
    """C++ 原生 API 使用记录（OH_*/napi_*/OHOS_* + 原生头 include）。"""
    coverage, summary, involved = build_coverage(usages, all_kb_files)
    output = {
        "title": "HarmonyOS C/C++ 原生 API 使用记录",
        "language": "C++",
        "summary": {
            "totalApiUsages": len(usages),
            "uniqueApis": len({u["api"] for u in usages}),
            "filesScanned": len({u["file"] for u in usages}),
            "kbCoverage": summary,
            "allInvolvedFiles": involved,
        },
        "apiUsage": [
            {
                "api": u["api"],
                "codeLocation": f"{u['file']}:{u['line']}",
                "snippet": u["snippet"],
                "kbSources": u["kbSources"],
                "language": u.get("language", "C++"),
            }
            for u in sorted(usages, key=lambda x: (x["file"], x["line"]))
        ],
    }
    os.makedirs(os.path.dirname(out_path) or ".", exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as f:
        json.dump(output, f, ensure_ascii=False, indent=2)
    return output


def gen_cpp_api_usage_md(usages: list[dict], all_kb_files: list[str], out_path: str):
    coverage, summary, involved = build_coverage(usages, all_kb_files)
    results = sorted(usages, key=lambda x: (x["file"], x["line"]))
    lines = []
    lines.append("# HarmonyOS C/C++ 原生 API 使用文档")
    lines.append("")
    lines.append(f"生成时间：{datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    lines.append("")
    lines.append("## 概述")
    lines.append("")
    lines.append(f"- **原生 API 使用记录数**：{len(results)}")
    lines.append(f"- **涉及的唯一 API**：{len({r['api'] for r in results})}")
    lines.append(f"- **扫描的 C/C++ 文件数**：{len({r['file'] for r in results})}")
    lines.append(f"- **知识库文件总数**：{summary['totalKbFiles']}")
    lines.append(f"- **API 直接匹配的知识文件**：{summary['directApiMatch']}")
    lines.append("")
    lines.append("> 扫描 `entry/src/main/cpp` 下的 C/C++ 原生源码，识别 HarmonyOS Native 接口"
                 "（`OH_*` / `napi_*` / `OHOS_*`）与原生头文件 `#include`，并交叉匹配系统 API 变更知识库。")
    lines.append("")
    if not results:
        lines.append("（工程内未发现 C/C++ 原生代码，或未识别到原生 API 使用）")
        lines.append("")
    else:
        lines.append("## 原生 API 使用详情")
        lines.append("")
        lines.append("| # | API | 代码位置 | 片段 | 来源知识文件 |")
        lines.append("|---|-----|----------|------|-------------|")
        for i, r in enumerate(results, 1):
            kb_cell = "<br>".join(r["kbSources"][:5])
            snippet = r["snippet"].replace("|", "\\|")[:80]
            lines.append(f"| {i} | `{r['api']}` | `{r['file']}:{r['line']}` | `{snippet}` | {kb_cell} |")
        lines.append("")
    lines.append("---")
    lines.append("*本文档由 hoscanner（HarmonyOS 升级 C++ 原生 API 变更扫描）自动生成。*")
    os.makedirs(os.path.dirname(out_path) or ".", exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    return lines


def gen_cpp_call_graph_json(file_analyses, out_path: str):
    """C/C++ 调用图谱：文件 → 原生 API 调用点（OH_*/napi_*）+ 原生头 include。"""
    graph = []
    for fa in file_analyses:
        native_calls = [cs for cs in fa.call_sites if cs.kind == "native"]
        node = {
            "file": fa.rel_path,
            "includes": [
                {"line": i.line, "header": i.source, "kit": i.kit}
                for i in fa.imports
            ],
            "functions": fa.functions,
            "nativeApiCalls": [
                {
                    "line": cs.line,
                    "qualified": cs.qualified,
                    "name": cs.name,
                    "kit": cs.kit,
                    "caller": cs.caller,
                    "isCall": getattr(cs, "is_call", False),
                }
                for cs in native_calls
            ],
        }
        graph.append(node)

    usage_by_api: dict[str, list[dict]] = {}
    for fa in file_analyses:
        for cs in fa.call_sites:
            if cs.kind == "native":
                usage_by_api.setdefault(cs.qualified, []).append({
                    "file": fa.rel_path, "line": cs.line, "caller": cs.caller,
                })

    output = {
        "title": "HarmonyOS C/C++ 原生 API 调用图谱",
        "language": "C++",
        "summary": {
            "filesAnalyzed": len(file_analyses),
            "nativeApis": len(usage_by_api),
            "nativeApiCallSites": sum(len(v) for v in usage_by_api.values()),
        },
        "files": graph,
        "apiGraph": [
            {"api": api, "kind": "native", "callSites": sites}
            for api, sites in sorted(usage_by_api.items())
        ],
    }
    os.makedirs(os.path.dirname(out_path) or ".", exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as f:
        json.dump(output, f, ensure_ascii=False, indent=2)
    return output


# ---------------------------------------------------------------------------
# 5. change_report.json
# ---------------------------------------------------------------------------
def _item_to_dict(it) -> dict:
    return {
        "api": it.api,
        "codeLocation": it.codeLocation,
        "category": it.category,
        "source": getattr(it, "source", "代码扫描"),
        "kbFile": it.kbFile,
        "version": it.version,
        "apiVersion": it.apiVersion,
        "subVersion": it.subVersion,
        "op": it.op,
        "decl": it.decl,
        "url": getattr(it, "evidenceUrl", "") or getattr(it, "url", ""),
        "evidenceUrl": getattr(it, "evidenceUrl", ""),
        "impact": getattr(it, "impact", ""),
        "snippet": getattr(it, "snippet", ""),
        "language": getattr(it, "language", "ArkTS"),
        "reviewVerdict": getattr(it, "reviewVerdict", ""),
        "reviewReason": getattr(it, "reviewReason", ""),
    }


def _sdk_version(it) -> str:
    """SDK变更版本：version + 空格 + subVersion（如 5.1.0(18) Release / 6.0.0(20) Beta1）。"""
    v = (getattr(it, "version", "") or "").strip()
    sv = (getattr(it, "subVersion", "") or "").strip()
    if v and sv:
        return f"{v} {sv}"
    return v or sv


def _impact_version(it, to_api_version: int) -> str:
    """影响版本：接口定义/接口行为类变更多为 ALL；UX视觉布局等变更按版本区间。

    与参考清单约定一致：
      - 接口定义变更 / 接口行为变更 → ALL
      - UX视觉布局变更 / UX交互行为变更 → {version} - {toVersion}（如 5.1.0(18) - 26.0.0(26.0.0)）
    """
    op = (getattr(it, "op", "") or "").strip()
    if op in ("接口定义变更", "接口行为变更", "接口属性变更", "接口废弃变更"):
        return "ALL"
    v = (getattr(it, "version", "") or "").strip()
    if op.startswith("UX") or "视觉布局" in op or "交互行为" in op or "行为变更" in op:
        to_ver = f"26.0.0({to_api_version}.0.0)" if to_api_version >= 26 else str(to_api_version)
        return f"{v} - {to_ver}" if v else "ALL"
    return "ALL"


def _item_to_ref_dict(it, to_api_version: int) -> dict:
    """对齐参考清单（FluidLayout apiChange.json）的扁平字段格式。

    每条变更注明来源（source：代码扫描 / 导入语句 / 配置文件 / 注释等）。
    """
    return {
        "API名称": it.api,
        "语言": getattr(it, "language", "ArkTS"),
        "SDK变更版本": _sdk_version(it),
        "影响版本": _impact_version(it, to_api_version),
        "标题": getattr(it, "impact", "") or getattr(it, "decl", ""),
        "代码位置": it.codeLocation,
        "修复状态": "未修复",
        "变更类型": it.op,
        "链接": getattr(it, "evidenceUrl", "") or getattr(it, "url", ""),
        "来源": getattr(it, "source", "代码扫描"),
        "来源知识文件": it.kbFile,
    }


def gen_change_report_json(report, out_path: str):
    # 明细按 (api, apiVersion, codeLocation) 排序，使同 API 聚拢、版本递增
    system_sorted = sorted(report.system_changes,
                           key=lambda it: (it.api, it.apiVersion, it.codeLocation))
    behavior_sorted = sorted(report.behavior_changes,
                             key=lambda it: (it.api, it.apiVersion, it.codeLocation))
    per_api = _group_by_api(system_sorted, behavior_sorted)
    review_stats = getattr(report, "review_stats", None) or _count_review(report)
    # 扁平变更清单（对齐参考 FluidLayout apiChange.json 的字段格式，含来源标注）
    ref_sorted = sorted(system_sorted + behavior_sorted,
                        key=lambda it: (it.apiVersion, it.api, it.codeLocation))
    change_list = [_item_to_ref_dict(it, report.to_api_version) for it in ref_sorted]
    # 按语言分解（ArkTS / C++）
    lang_breakdown = _count_by_language(system_sorted + behavior_sorted)
    output = {
        "title": "HarmonyOS 三方库升级 — 系统 API 变更与行为变更清单",
        "upgradeWindow": {
            "fromApiVersion": report.from_api_version,
            "toApiVersion": report.to_api_version,
            "note": "仅统计 (fromApiVersion, toApiVersion] 区间内发生的变更。",
        },
        "summary": {
            "usedApis": report.used_apis,
            "systemChangeCount": len(report.system_changes),
            "behaviorChangeCount": len(report.behavior_changes),
            "totalChangeCount": report.total,
            "distinctApiCount": len(per_api),
            "languageBreakdown": lang_breakdown,
            "review": review_stats,
        },
        "systemChanges": [_item_to_dict(it) for it in system_sorted],
        "behaviorChanges": [_item_to_dict(it) for it in behavior_sorted],
        "changeList": change_list,
        "perApi": per_api,
    }
    os.makedirs(os.path.dirname(out_path) or ".", exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as f:
        json.dump(output, f, ensure_ascii=False, indent=2)
    return output


def _count_review(report) -> dict:
    """统计审查结论（无 review_stats 时从条目字段实时统计）。"""
    from collections import Counter
    c = Counter(getattr(it, "reviewVerdict", "") for it in
                report.system_changes + report.behavior_changes)
    return {
        "total": len(report.system_changes) + len(report.behavior_changes),
        "verified": c.get("verified", 0),
        "false_positive": c.get("false_positive", 0),
        "review": c.get("review", 0),
        "llm_used": bool(getattr(report, "review_stats", {}).get("llm_used")) if getattr(report, "review_stats", None) else False,
    }


def _count_by_language(items: list) -> dict:
    """按使用点语言分解变更条目（ArkTS / C++）。"""
    from collections import Counter
    c = Counter(getattr(it, "language", "ArkTS") or "ArkTS" for it in items)
    return {
        "arkts": c.get("ArkTS", 0),
        "cpp": c.get("C++", 0),
    }


def _group_by_api(system_sorted, behavior_sorted) -> dict:
    """按 API 聚合：每个 api 一组，含代码位置/版本/证据URL/影响/变更类型/明细。

    排序键 (api, apiVersion) 保证同 API 聚拢且按版本递增，消除扁平表的乱序。
    """
    groups: dict[str, dict] = {}
    for key, items in (("system", system_sorted), ("behavior", behavior_sorted)):
        for it in items:
            g = groups.setdefault(it.api, {
                "api": it.api,
                "codeLocations": [],
                "versions": [],
                "changeType": it.op,
                "evidenceUrl": getattr(it, "evidenceUrl", ""),
                "impact": getattr(it, "impact", "") or it.decl,
                "system": [],
                "behavior": [],
            })
            g[key].append(_item_to_dict(it))
            if it.codeLocation not in g["codeLocations"]:
                g["codeLocations"].append(it.codeLocation)
            if it.version and it.version not in g["versions"]:
                g["versions"].append(it.version)
    # 各组明细按版本稳定排序；版本列表去重后保持出现序
    for g in groups.values():
        g["system"].sort(key=lambda d: (d.get("apiVersion", 0), d.get("codeLocation", "")))
        g["behavior"].sort(key=lambda d: (d.get("apiVersion", 0), d.get("codeLocation", "")))
    return {api: groups[api] for api in sorted(groups)}


def gen_change_report_md(report, out_path: str):
    system_sorted = sorted(report.system_changes,
                           key=lambda it: (it.api, it.apiVersion, it.codeLocation))
    behavior_sorted = sorted(report.behavior_changes,
                             key=lambda it: (it.api, it.apiVersion, it.codeLocation))
    lines = []
    lines.append("# HarmonyOS 三方库升级 — 系统 API 变更与行为变更清单")
    lines.append("")
    lines.append(f"生成时间：{datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    lines.append("")
    lines.append("## 升级窗口")
    lines.append("")
    lines.append(f"- **源 API 版本**：{report.from_api_version}")
    lines.append(f"- **目标 API 版本**：{report.to_api_version}")
    lines.append(f"- **统计区间**：({report.from_api_version}, {report.to_api_version}]")
    lines.append("")
    lines.append("## 汇总")
    lines.append("")
    lines.append(f"- 使用的系统 API 数：**{report.used_apis}**")
    lines.append(f"- 系统 API 变更条目：**{len(report.system_changes)}**"
                 f"（按 API 分组：**{len({it.api for it in report.system_changes})}** 个）")
    lines.append(f"- 行为变更条目：**{len(report.behavior_changes)}**"
                 f"（按 API 分组：**{len({it.api for it in report.behavior_changes})}** 个）")
    lines.append(f"- 变更条目合计：**{report.total}**")
    lang = _count_by_language(system_sorted + behavior_sorted)
    if lang["cpp"]:
        lines.append(f"- 语言分解：ArkTS **{lang['arkts']}** / C++ **{lang['cpp']}**")
    review_stats = getattr(report, "review_stats", None) or _count_review(report)
    if review_stats["total"]:
        mode = "LLM 审查" if review_stats["llm_used"] else "确定性启发式审查"
        lines.append(f"- 审查结论（{mode}）：真实 **{review_stats['verified']}** / "
                     f"误报 **{review_stats['false_positive']}** / 存疑 **{review_stats['review']}**"
                     f"（误报条目已从下方清单过滤，存疑条目标注保留）")
    lines.append("")
    lines.append("> 下方按 API 分组列出，每组给出变更类型 / 影响版本 / 变更影响 / 变更证据 URL"
                 " 及全部涉及代码位置。同一 API 的多个调用位置聚拢展示，便于逐接口核对。")
    lines.append("")

    _append_api_section_md(lines, "系统 API 变更", system_sorted)
    _append_api_section_md(lines, "行为变更", behavior_sorted)

    lines.append("---")
    lines.append("*本文档由 hoscanner（HarmonyOS 升级 API 变更扫描工具）自动生成。*")

    os.makedirs(os.path.dirname(out_path) or ".", exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    return lines


# ---------------------------------------------------------------------------
# 6. DevEcoAPIScan 兼容 CSV 报告（12 列）
# ---------------------------------------------------------------------------
# 移植自 DevEcoAPIScan ApiCollector.writeFile 的 CSV 报告格式：
#   Api Name, Api Type, Api File Path, Api Prefix, Api Params, API Args,
#   Invoke Method, Invoke Location, Api Key, Invoke Instance, ChangeId, MethodDefinition
#
# 该格式是 DevEcoAPIScan 的核心输出，保留 12 列结构化字段，使第三方工具能直接消费。
# apiScan 端用 KB 记录与使用点信息填充对应字段：
#   Api Name        —— apiName（方法签名 / 字段名）
#   Api Type        —— 记录类型（method / field / class_decl / component_decl / ctor）
#   Api File Path   —— kbFile（知识库文件路径）
#   Api Prefix      —— cls（类名 / 命名空间）
#   Api Params      —— 空字符串（apiScan 不细拆参数类型）
#   API Args        —— snippet（使用点源码片段，便于审查）
#   Invoke Method   —— 调用者（codeLocation 的 file:line）
#   Invoke Location  —— codeLocation
#   Api Key         —— api + codeLocation 唯一键
#   Invoke Instance  —— 使用点 base（链根标识符）
#   ChangeId        —— KB 记录的 changeId / version
#   MethodDefinition —— api（方法签名）
#
# 与 DevEcoAPIScan 相同：去重使用点（同一 file:line 只保留一条），按 (api, codeLocation) 排序。
_CSV_HEADER = ("Api Name,Api Type,Api File Path,Api Prefix,Api Params,API Args,"
               "Invoke Method,Invoke Location,Api Key,Invoke Instance,ChangeId,"
               "MethodDefinition\r\n")


def _csv_cell(s: str) -> str:
    """CSV 字段转义：内部双引号 → 两个双引号，整字段加双引号包裹。

    移植自 DevEcoAPIScan writeFile 中的 `"${value}"` 模式（含逗号/换行字段需包裹）。
    """
    s = (s or "").replace('"', '""')
    return f'"{s}"'


def gen_change_report_csv(report, out_path: str):
    """生成 DevEcoAPIScan 兼容的 12 列 CSV 升级变更清单。

    每条变更条目按 (api, codeLocation) 展开为一条 CSV 记录；同 (api, codeLocation)
    去重（保留首条），确保 1 变更 × 1 使用点 = 1 行。
    所有可能含逗号/换行/双引号的字段都用 _csv_cell 包裹（双引号转义）。
    """
    items = sorted(report.system_changes + report.behavior_changes,
                   key=lambda it: (it.api, it.codeLocation, it.apiVersion))
    seen = set()
    rows = []
    for it in items:
        # 审查结论：误报条目不进入 CSV（与 markdown 一致）
        if getattr(it, "reviewVerdict", "") == "false_positive":
            continue
        key = (it.api, it.codeLocation)
        if key in seen:
            continue
        seen.add(key)
        # 全部字段都用 _csv_cell 包裹，避免方法签名（多参数含逗号）、
        # 中文 op（不含逗号但保持一致）、文件路径（不含逗号但一致）等字段错乱列数。
        api_name = _csv_cell(it.api)
        api_type = _csv_cell((getattr(it, "op", "") or "").strip() or "system")
        api_file_path = _csv_cell(getattr(it, "kbFile", "") or "")
        api_prefix = _csv_cell(_extract_prefix(it.api))
        api_params = _csv_cell("")
        api_args = _csv_cell(getattr(it, "snippet", "") or "")
        invoke_method = _csv_cell(getattr(it, "language", "ArkTS"))
        invoke_location = _csv_cell(it.codeLocation)
        api_key = _csv_cell(f"{it.api}@{it.codeLocation}")
        invoke_instance = _csv_cell(_extract_invoke_instance(it.api, getattr(it, "snippet", "")))
        change_id = _csv_cell(getattr(it, "version", "") or "")
        method_def = _csv_cell(it.api)
        rows.append(
            f"{api_name},{api_type},{api_file_path},{api_prefix},{api_params},{api_args},"
            f"{invoke_method},{invoke_location},{api_key},{invoke_instance},"
            f"{change_id},{method_def}\r\n"
        )
    os.makedirs(os.path.dirname(out_path) or ".", exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as f:
        f.write(_CSV_HEADER)
        for row in rows:
            f.write(row)
    return {"rows": len(rows), "header": _CSV_HEADER.strip()}


def _extract_prefix(api: str) -> str:
    """从 API 签名中提取前缀（命名空间链/类名）。

    对齐 DevEcoAPIScan getPrefix：用 '#' 连接命名空间链。
    apiScan 端 api 多为方法签名（如 'fontWeight(value: ...): TextAttribute'），
    取方法名首段作为 prefix；若 api 是 declare class X 形式，取 X。
    """
    s = (api or "").strip()
    if not s:
        return ""
    # declare class X / declare const X / declare interface X
    import re
    m = re.match(r"(?:declare\s+)?(?:const|class|interface|enum|function|let|var)\s+([A-Za-z_$][\w$]*)", s)
    if m:
        return m.group(1)
    # 方法签名：name(params) 或 prop: T
    m = re.match(r"([A-Za-z_$][\w$]*)", s)
    return m.group(1) if m else ""


def _extract_invoke_instance(api: str, snippet: str) -> str:
    """从使用点 snippet 中提取调用实例（链根标识符）。

    对齐 DevEcoAPIScan ApiUsage.instance（实例方法调用的 base 类型名）。
    apiScan 用 snippet 中的 'xxx.method(' 提取 xxx 作为链根。
    """
    import re
    if not snippet:
        return ""
    # 链式调用：xxx.method( → 取 xxx
    m = re.match(r"\s*([A-Za-z_$][\w$]*)\s*\.", snippet)
    if m:
        return m.group(1)
    return ""


def _append_api_section_md(lines: list, title: str, items: list):
    """按 API 分组的层级展示：标题 → 每个 API 一段（类型/版本/影响/证据/位置列表）。

    审查结论：false_positive 的条目被过滤；review 的条目在标题标注 [存疑]；
    verified 不额外标注。
    """
    # 过滤审查误报条目
    kept = [it for it in items if getattr(it, "reviewVerdict", "") != "false_positive"]
    lines.append(f"## {title}（按 API 分组，共 {len({it.api for it in kept})} 个 API；"
                 f"已过滤误报 {len(items) - len(kept)} 条）")
    lines.append("")
    if not kept:
        lines.append("（升级窗口内未命中此类变更）")
        lines.append("")
        return
    # 按 api 聚合，组内按版本
    groups: dict[str, list] = {}
    for it in kept:
        groups.setdefault(it.api, []).append(it)
    for api in sorted(groups):
        grp = sorted(groups[api], key=lambda it: (it.apiVersion, it.codeLocation))
        first = grp[0]
        # 组内审查结论标注
        verdicts = {getattr(it, "reviewVerdict", "") for it in grp}
        tag = ""
        if "review" in verdicts:
            tag = " ⚠️[存疑]"
        elif verdicts == {"verified"}:
            tag = " ✅"
        evidence = getattr(first, "evidenceUrl", "") or getattr(first, "url", "")
        impact = getattr(first, "impact", "") or first.decl
        versions = sorted({it.version for it in grp if it.version})
        locs = sorted({it.codeLocation for it in grp})
        lines.append(f"### `{api}`{tag}")
        lines.append("")
        lines.append(f"- **变更类型**：{first.op}")
        lines.append(f"- **影响版本**：{'、'.join(versions) if versions else '—'}")
        lines.append(f"- **变更影响**：{_md_inline(impact) if impact else '—'}")
        lines.append(f"- **变更证据**：{evidence if evidence else '—'}")
        lines.append(f"- **涉及代码位置**（共 {len(locs)} 处）：")
        for loc in locs:
            # 取该位置首条来源标注 + 审查结论
            it0 = next((it for it in grp if it.codeLocation == loc), first)
            src = getattr(it0, "source", "代码扫描")
            vt = getattr(it0, "reviewVerdict", "")
            vtag = {"review": " ⚠️存疑", "verified": "", "false_positive": ""}.get(vt, "")
            lines.append(f"  - `{loc}`（来源：{src}{vtag}）")
        lines.append("")
        # 组内逐条明细（版本/来源知识文件），供深入核对
        if len(grp) > 1:
            lines.append("  <details><summary>组内明细（按版本）</summary>")
            lines.append("")
            lines.append("  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |")
            lines.append("  |------|----------|--------------|----------|")
            for it in grp:
                decl = _md_inline(it.decl)[:80]
                lines.append(f"  | {it.version} | {it.op} | `{it.kbFile}` | `{it.codeLocation}` |")
            lines.append("")
            lines.append("  </details>")
            lines.append("")
