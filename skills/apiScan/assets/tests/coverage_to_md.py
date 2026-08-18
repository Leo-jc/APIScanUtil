#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
coverage_to_md.py —— 将 coverage_report.json 转为可读 Markdown 报告

coverage_report.json 的 per-project 摘要里缺失/多余明细（missing_items/extra_items）
已被剔除，本脚本按相同口径从「真实清单」与「扫描结果」重新推导缺失项，
与 output/coverage_report.md 一起输出。
"""
import glob
import json
import os
import sys
from collections import Counter

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

HERE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))  # apiScan/assets/
TESTSET = os.environ.get("APISCAN_TESTSET", r"D:\Projects\APIScanUtil\testSet")
OUTPUT = os.path.join(HERE, "output")
REPORT_JSON = os.path.join(OUTPUT, "coverage_report.json")
REPORT_MD = os.path.join(OUTPUT, "coverage_report.md")

REF_API = "API名称"
REF_LOC = "代码位置"


def load(p):
    with open(p, encoding="utf-8") as f:
        return json.load(f)


def norm_loc(loc: str) -> str:
    if not loc:
        return ""
    return loc.replace("/", "\\").strip()


def ref_keys(ref):
    return {(r[REF_API].strip(), norm_loc(r[REF_LOC])) for r in ref}


def sc_keys(sc):
    recs = list(sc.get("systemChanges") or []) + list(sc.get("behaviorChanges") or [])
    return {(r["api"].strip(), norm_loc(r["codeLocation"])) for r in recs}


def sc_records(sc):
    """扫描侧全部条目（含 category），供多余项分类用。"""
    return list(sc.get("systemChanges") or []) + list(sc.get("behaviorChanges") or [])


def missing_detail(name):
    """重新推导某项目的缺失项明细：[(api, loc, 变更类型), ...]。"""
    proj_dir = os.path.join(TESTSET, name)
    ref_files = glob.glob(os.path.join(proj_dir, "*_apiChange.json"))
    sc_path = os.path.join(OUTPUT, f"{name}_scan_result.json")
    if not ref_files or not os.path.isfile(sc_path):
        return []
    ref = load(ref_files[0])
    sc = load(sc_path)
    miss_keys = ref_keys(ref) - sc_keys(sc)
    out = []
    for r in ref:
        k = (r[REF_API].strip(), norm_loc(r[REF_LOC]))
        if k in miss_keys:
            out.append((r[REF_API].strip(), r[REF_LOC].strip(), r.get("变更类型", "")))
    # 去重保序
    seen, dedup = set(), []
    for item in out:
        if item not in seen:
            seen.add(item)
            dedup.append(item)
    return dedup


def bar(pct: float, width=20) -> str:
    filled = round(pct / 100 * width)
    return "█" * filled + "░" * (width - filled)


def main():
    if not os.path.isfile(REPORT_JSON):
        print(f"找不到 {REPORT_JSON}，请先运行 compute_coverage.py")
        return 1
    agg = load(REPORT_JSON)
    caliber = agg["caliber"]
    overall = agg["overall"]
    projects = agg["projects"]

    lines = []
    w = lines.append

    w("# HarmonyOS 三方库升级 API 变更扫描 —— 测试集覆盖率报告")
    w("")
    w(f"> 生成时间对应数据源：`output/coverage_report.json`  ")
    w(f"> 测试集：`{TESTSET}`  ")
    w(f"> 扫描结果：`{OUTPUT}`")
    w("")
    w("---")
    w("")
    w("## 一、结论")
    w("")
    verdict = "✅ 全部项目完全覆盖真实清单（缺失 = 0）" \
        if overall["allCovered"] else "⚠️ 存在缺失项（见第三节）"
    w(f"**整体覆盖率（召回率 Recall）：{overall['matched']}/{overall['ref_total']} = {overall['recall_pct']}%**  ")
    w(f"**结论：{verdict}**")
    w("")
    w("| 指标 | 值 |")
    w("|---|---:|")
    w(f"| 测试项目数 | {overall['projects']} |")
    w(f"| 真实清单总条数 | {overall['ref_total']} |")
    w(f"| 命中条数 | {overall['matched']} |")
    w(f"| 缺失条数 | {overall['missing']} |")
    w(f"| 多余条数（不扣分） | {overall['extra']} |")
    w(f"| 整体召回率 | **{overall['recall_pct']}%** |")
    w("")
    w("## 二、口径说明")
    w("")
    w("| 项 | 定义 |")
    w("|---|---|")
    w(f"| 覆盖率定义 | {caliber['coverage']} |")
    w(f"| 匹配键 | {caliber['matchKey']} |")
    w(f"| 数据源 | {caliber['dataSource']} |")
    w(f"| 多余项处理 | {caliber['extraHandling']} |")
    w("")
    w("## 三、各项目覆盖率")
    w("")
    w("| 项目 | 真实清单 | 扫描结果 | 命中 | 缺失 | 多余 | 覆盖率 | 状态 |")
    w("|---|---:|---:|---:|---:|---:|---:|:---:|")
    for name, r in projects.items():
        status = "✅" if r["status"] == "OK" else "⚠️"
        w(f"| {name} | {r['ref_total']} | {r['sc_total']} | {r['matched']} | "
          f"{r['missing']} | {r['extra']} | **{r['recall_pct']}%** | {status} |")
    w(f"| **合计** | **{overall['ref_total']}** | — | **{overall['matched']}** | "
      f"**{overall['missing']}** | **{overall['extra']}** | **{overall['recall_pct']}%** | |")
    w("")
    w("### 覆盖率分布")
    w("")
    w("```")
    for name, r in projects.items():
        w(f"{name:<22} {bar(r['recall_pct'])} {r['recall_pct']:>5.1f}%")
    w("```")
    w("")
    w("## 四、缺失项明细（参考有、扫描无）")
    w("")
    miss_total = overall["missing"]
    if miss_total == 0:
        w("无缺失项。")
    else:
        w(f"共 **{miss_total}** 条缺失，分布在 "
          + "、".join(n for n, r in projects.items() if r["missing"]) + "：")
        w("")
        for name, r in projects.items():
            if not r["missing"]:
                continue
            detail = missing_detail(name)
            w(f"### {name}（缺失 {r['missing']} 条）")
            w("")
            w(f"按变更类型：{r.get('missing_by_type', {}) or '—'}")
            w("")
            w("| # | API | 代码位置 | 变更类型 |")
            w("|---:|---|---|---|")
            for i, (api, loc, ctype) in enumerate(detail, 1):
                w(f"| {i} | `{api}` | `{loc}` | {ctype or '—'} |")
            w("")
    w("## 五、多余项汇总（扫描有、参考无，合理补充候选，不扣分）")
    w("")
    w("| 项目 | 多余合计 | 系统 API 变更 | 行为变更 |")
    w("|---|---:|---:|---:|")
    for name, r in projects.items():
        eb = r.get("extra_by_category", {})
        w(f"| {name} | {r['extra']} | {eb.get('system_change', 0)} | {eb.get('behavior_change', 0)} |")
    w(f"| **合计** | **{overall['extra']}** | | |")
    w("")
    w("> 多余项是工具相对参考清单的额外补充候选，覆盖率口径不扣分。")
    w("")
    w("## 六、缺失项 API 模式分析")
    w("")
    if miss_total:
        # 归类缺失 API 的签名模式
        patterns = Counter()
        for name, r in projects.items():
            for api, _loc, _ctype in missing_detail(name):
                key = api.split("(")[0].split(":")[0].strip()
                if api.startswith("declare interface"):
                    patterns["declare interface（接口声明）"] += 1
                elif ": " in api and "(" not in api:
                    patterns["属性声明式（name: type）"] += 1
                else:
                    patterns["方法签名式（fn(...): T）"] += 1
        w("| 模式 | 条数 |")
        w("|---|---:|")
        for pat, cnt in patterns.most_common():
            w(f"| {pat} | {cnt} |")
        w("")
        w("缺失集中在两类：")
        w("- **属性声明式 / 接口声明**（如 `font: string`、`declare interface AnimateParam`）—— 规则匹配偏向方法调用，对纯声明式签名覆盖不足；")
        w("- **带可选参数的接口签名**（如 `searchButton(value, option?)`、`fontWeight(... | string)`）—— 形参归一化或候选生成与参考清单签名不一致。")
    w("")
    w("---")
    w("")
    w("*本报告由 `tests/coverage_to_md.py` 从 `output/coverage_report.json` 生成。*")
    w("")

    with open(REPORT_MD, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    print(f"已生成: {REPORT_MD}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
