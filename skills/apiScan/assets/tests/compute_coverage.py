#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
compute_coverage.py —— 测试集覆盖率计算

口径（用户确认）：
  - 覆盖率 = 召回率 Recall：以真实清单（*_apiChange.json，合计 882 条）为基准。
  - 匹配键： (api, codeLocation) 严格匹配 —— API名称/api 逐字相同 + 代码位置归一化
    （统一分隔符为 '\\')后相同即命中。
  - 数据源：本次重新扫描的 output/{项目名}_scan_result.json（API 12→26）。
  - 多余项：仅统计并按 变更类型/分类 归类，不修改工具、不参与覆盖率扣分。

输出：
  - 控制台逐项目 + 汇总表
  - output/coverage_report.json （结构化：各项目 matched/missing/extra/recall + 缺失明细）
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

REF_API = "API名称"
REF_LOC = "代码位置"


def load(p):
    with open(p, encoding="utf-8") as f:
        return json.load(f)


def norm_loc(loc: str) -> str:
    """统一分隔符为反斜杠；仅做分隔符归一，不剥离模块前缀（entry/ohos_library 均保留）。

    参考：entry\\src\\main\\ets\\pages\\Index.ets:269
    扫描：同形或 ohos_library\\src\\main\\ets\\...（保留完整模块前缀以区分模块）
    """
    if not loc:
        return ""
    return loc.replace("/", "\\").strip()


def ref_keys(ref):
    """参考去重后的 {(api, loc)} 集合。"""
    out = set()
    for r in ref:
        out.add((r[REF_API].strip(), norm_loc(r[REF_LOC])))
    return out


def sc_keys(sc):
    """扫描(systemChanges+behaviorChanges)去重后的 {(api, loc)} 集合。

    扫描侧同时纳入扁平 changeList 作为补充来源，确保与 changeList 口径一致。
    """
    recs = list(sc.get("systemChanges") or []) + list(sc.get("behaviorChanges") or [])
    out = set()
    for r in recs:
        out.add((r["api"].strip(), norm_loc(r["codeLocation"])))
    return out


def compare_one(name):
    proj_dir = os.path.join(TESTSET, name)
    ref_files = glob.glob(os.path.join(proj_dir, "*_apiChange.json"))
    sc_path = os.path.join(OUTPUT, f"{name}_scan_result.json")
    if not ref_files:
        return {"status": "无参考清单", "missing": -1}
    if not os.path.isfile(sc_path):
        return {"status": "无扫描结果", "missing": -1}
    ref = load(ref_files[0])
    sc = load(sc_path)
    ref_set = ref_keys(ref)
    sc_set = sc_keys(sc)
    matched = ref_set & sc_set
    missing = ref_set - sc_set
    extra = sc_set - ref_set

    # 多余项分类（按扫描条目 category）
    extra_recs = [r for r in (list(sc.get("systemChanges") or []) +
                              list(sc.get("behaviorChanges") or []))
                  if (r["api"].strip(), norm_loc(r["codeLocation"])) in extra]
    extra_by_cat = Counter(r.get("category", "") for r in extra_recs)

    # 缺失项分类（按参考条目 变更类型）
    missing_recs = [r for r in ref
                    if (r[REF_API].strip(), norm_loc(r[REF_LOC])) in missing]
    missing_by_type = Counter(r.get("变更类型", "") for r in missing_recs)

    recall = 100.0 * len(matched) / max(1, len(ref_set))
    return {
        "status": "OK" if not missing else "X",
        "ref_total": len(ref_set),
        "sc_total": len(sc_set),
        "matched": len(matched),
        "missing": len(missing),
        "extra": len(extra),
        "recall_pct": round(recall, 1),
        "extra_by_category": {
            "system_change": extra_by_cat.get("system_change", 0),
            "behavior_change": extra_by_cat.get("behavior_change", 0),
        },
        "missing_by_type": dict(missing_by_type),
        "missing_items": sorted(missing),
        "extra_items": sorted(extra),
        "ref_path": os.path.basename(ref_files[0]),
        "sc_path": sc_path,
    }


def main():
    projects = sorted(p for p in os.listdir(TESTSET)
                      if os.path.isdir(os.path.join(TESTSET, p)))
    print("=" * 92)
    print("测试集覆盖率计算  （口径：召回率 Recall，匹配键 (api, codeLocation) 严格匹配）")
    print(f"  测试集: {TESTSET}")
    print(f"  扫描结果: {OUTPUT}")
    print("-" * 92)
    header = (f"{'项目':<22}{'真实清单':>9}{'扫描结果':>9}{'命中':>7}"
              f"{'缺失':>6}{'多余':>7}{'覆盖率':>9}")
    print(header)
    print("-" * 92)

    results = {}
    all_covered = True
    tot_ref = tot_matched = tot_missing = tot_extra = 0
    for name in projects:
        r = compare_one(name)
        results[name] = r
        # 仅“无参考清单 / 无扫描结果”这类异常状态才跳过（不计入合计）
        if r.get("status") not in ("OK", "X"):
            print(f"[{name}] {r['status']}")
            continue
        if r["missing"]:
            all_covered = False
        eb = r.get("extra_by_category", {})
        print(f"{name:<22}{r['ref_total']:>9}{r['sc_total']:>9}{r['matched']:>7}"
              f"{r['missing']:>6}{r['extra']:>7}{r['recall_pct']:>8.1f}%"
              f"  （多余: 系统{eb.get('system_change',0)}/行为{eb.get('behavior_change',0)}）")
        tot_ref += r["ref_total"]
        tot_matched += r["matched"]
        tot_missing += r["missing"]
        tot_extra += r["extra"]

    print("-" * 92)
    overall_recall = 100.0 * tot_matched / max(1, tot_ref)
    print(f"{'合计':<22}{tot_ref:>9}{'-':>9}{tot_matched:>7}"
          f"{tot_missing:>6}{tot_extra:>7}{overall_recall:>8.1f}%")
    print("=" * 92)
    print(f"结论：{'[OK] 全部项目完全覆盖真实清单（缺失=0）' if all_covered else '[X] 存在缺失项，见下方细分'}")
    print(f"整体覆盖率（召回率）：{tot_matched}/{tot_ref} = {overall_recall:.1f}%")

    # 缺失细分
    if tot_missing:
        print("\n--- 缺失项细分（参考有、扫描无）---")
        for name in projects:
            r = results[name]
            miss = r.get("missing_items") or []
            if not miss:
                continue
            print(f"\n[{name}] 缺失 {len(miss)} 条  按变更类型: {r.get('missing_by_type',{})}")
            for (api, loc) in miss[:30]:
                print(f"    api={api[:70]!r}")
                print(f"        loc={loc}")
            if len(miss) > 30:
                print(f"    ... 其余 {len(miss) - 30} 条省略")

    # 多余项汇总
    print("\n--- 多余项汇总（扫描有、参考无，合理补充候选，不扣分）---")
    for name in projects:
        r = results[name]
        extra = r.get("extra_items") or []
        eb = r.get("extra_by_category", {})
        if extra:
            print(f"  [{name}] 多余 {len(extra)} 条  系统{eb.get('system_change',0)}/行为{eb.get('behavior_change',0)}")

    # 聚合输出
    agg = {
        "caliber": {
            "coverage": "召回率 Recall = matched / 真实清单总条数",
            "matchKey": "(api, codeLocation) 严格匹配（分隔符归一为反斜杠，不剥离模块前缀）",
            "dataSource": "本次重新扫描 output/{项目名}_scan_result.json（API 12→26）",
            "extraHandling": "仅统计分类，不修改工具，不参与覆盖率扣分",
        },
        "overall": {
            "projects": len(projects),
            "ref_total": tot_ref,
            "matched": tot_matched,
            "missing": tot_missing,
            "extra": tot_extra,
            "recall_pct": round(overall_recall, 1),
            "allCovered": all_covered,
        },
        "projects": {n: {k: v for k, v in r.items()
                         if k not in ("missing_items", "extra_items")}
                     for n, r in results.items()},
    }
    os.makedirs(OUTPUT, exist_ok=True)
    out_path = os.path.join(OUTPUT, "coverage_report.json")
    with open(out_path, "w", encoding="utf-8") as f:
        json.dump(agg, f, ensure_ascii=False, indent=2)
    print(f"\n聚合报告: {out_path}")
    print("=" * 92)
    return 0 if all_covered else 2


if __name__ == "__main__":
    sys.exit(main())
