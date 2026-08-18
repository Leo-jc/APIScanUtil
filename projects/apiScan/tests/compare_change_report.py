#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
compare_change_report.py —— 校验扫描结果是否完全覆盖各项目真实变更清单。

分工说明（与 compute_coverage.py 的关系）：
  * 本脚本：快速对比 —— 逐项目输出 matched/missing/extra，多余项按 系统/行为 分类，
    判定是否 ≥10% 合理补充；产出 output/comparison_aggregate.json；全项目 missing=0 时 exit 0。
  * compute_coverage.py：覆盖率报告 —— 在本脚本口径基础上额外计算召回率 Recall、
    缺失按变更类型分类、多余按 category 分类，并产出 coverage_report.json 供
    coverage_to_md.py 渲染可读 Markdown。两者匹配键一致，可按需选用。

匹配标准（用户指定）：(api, codeLocation) 归一化后相同即视为匹配命中。
  - 参考: API名称 + 代码位置
  - 扫描: api + codeLocation（归一化：统一分隔符，去 entry\\src\\main\\ets\\ 前缀）

自动发现 testSet 下项目，输出逐项目 matched/missing/extra，
并聚合到 output/comparison_aggregate.json；仅当所有项目 missing=0 时 exit 0。
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

HERE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TESTSET = r"D:\Projects\APIScanUtil\testSet"
OUTPUT = os.path.join(HERE, "output")

REF_API = "API名称"
REF_LOC = "代码位置"


def discover_projects() -> list[str]:
    out = []
    if not os.path.isdir(TESTSET):
        return out
    for name in sorted(os.listdir(TESTSET)):
        d = os.path.join(TESTSET, name)
        if os.path.isdir(d):
            out.append(name)
    return out


def load(p):
    with open(p, encoding="utf-8") as f:
        return json.load(f)


def norm_loc(loc: str) -> str:
    """归一化 codeLocation：统一分隔符，去掉工程前缀差异。

    参考：entry\\src\\main\\ets\\pages\\Index.ets:269
    扫描：entry\\src\\main\\ets\\pages\\Index.ets:269  （同形）或
          ohos_library\\src\\main\\ets\\...（库模块，保留完整模块前缀）
    这里只剥离 entry 模块的 src/main/ets 前缀差异，保留模块名以区分 entry / ohos_library。
    """
    if not loc:
        return ""
    loc = loc.replace("/", "\\").strip()
    # 统一：剥离 entry 模块前缀（参考与扫描均可能带 entry 前缀，保持一致即可）。
    # 两侧都保留 entry 前缀时无需剥离；仅剥离扫描侧多带的工程根前缀差异。
    return loc


def ref_keys(ref):
    """参考去重后的 {(api, loc)} 集合。"""
    out = set()
    for r in ref:
        out.add((r[REF_API].strip(), norm_loc(r[REF_LOC])))
    return out


def sc_keys(sc):
    """扫描(systemChanges+behaviorChanges)去重后的 {(api, loc)} 集合。"""
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
    # 多余项合理性分类：按变更类型归类（系统 API 变更 / 行为变更）。
    # 参考清单只覆盖行为变更（UX/接口定义），系统 API 变更（废弃/新增重载/错误码）天然属合理补充。
    extra_recs = [r for r in (list(sc.get("systemChanges") or []) + list(sc.get("behaviorChanges") or []))
                  if (r["api"].strip(), norm_loc(r["codeLocation"])) in extra]
    extra_by_cat = {"system_change": 0, "behavior_change": 0}
    for r in extra_recs:
        cat = r.get("category", "")
        if cat in ("system_change",):
            extra_by_cat["system_change"] += 1
        else:
            extra_by_cat["behavior_change"] += 1
    return {
        "status": "OK" if not missing else "X",
        "ref_total": len(ref_set),
        "sc_total": len(sc_set),
        "matched": len(matched),
        "missing": len(missing),
        "extra": len(extra),
        "extra_by_category": extra_by_cat,
        "extra_meets_10pct": len(extra) >= 0.1 * max(1, len(ref_set)),
        "missing_items": sorted(missing),
        "extra_items": sorted(extra),
        "ref_path": os.path.basename(ref_files[0]),
        "sc_path": sc_path,
    }


def main():
    projects = discover_projects()
    print("=" * 78)
    print("覆盖校验：各项目扫描结果 vs 真实变更清单")
    print("  匹配标准: (api, codeLocation) 归一化后相同即命中")
    print("-" * 78)

    results = {}
    all_ok = True
    for name in projects:
        r = compare_one(name)
        results[name] = r
        if r["status"] not in ("OK",):
            all_ok = False
            print(f"[{name}] {r['status']}")
            continue
        if r["missing"]:
            all_ok = False
        eb = r.get("extra_by_category", {})
        meet = "✓≥10%" if r.get("extra_meets_10pct") else "x<10%"
        print(f"[{name}] 参考 {r['ref_total']:>4} / 扫描 {r['sc_total']:>4} | "
              f"命中 {r['matched']:>4} 缺失 {r['missing']:>4} {'OK' if not r['missing'] else 'X'} "
              f"多余 {r['extra']:>4}（系统{eb.get('system_change',0)}/行为{eb.get('behavior_change',0)} {meet}）")

    # 缺失细分
    print("\n--- 缺失细分 ---")
    any_missing = False
    for name in projects:
        r = results[name]
        miss = r.get("missing_items") or []
        if not miss:
            continue
        any_missing = True
        print(f"\n[{name}] 缺失 {len(miss)} 条：")
        by_loc = Counter(loc for (api, loc) in miss)
        print(f"  涉及位置 {len(by_loc)} 个")
        for (api, loc) in miss[:25]:
            print(f"    api={api[:60]!r}")
            print(f"        loc={loc}")
        if len(miss) > 25:
            print(f"    ... 其余 {len(miss) - 25} 条省略")

    # 多余细分（合理补充判定）
    print("\n--- 多余（扫描有、参考无）汇总 ---")
    for name in projects:
        r = results[name]
        extra = r.get("extra_items") or []
        if extra:
            print(f"  [{name}] 多余 {len(extra)} 条（合理补充候选，需人工判定）")

    # 聚合输出
    agg = {
        "projects": {n: {k: v for k, v in r.items()
                         if k not in ("missing_items", "extra_items")}
                     for n, r in results.items()},
        "allCovered": all_ok,
    }
    os.makedirs(OUTPUT, exist_ok=True)
    with open(os.path.join(OUTPUT, "comparison_aggregate.json"), "w",
              encoding="utf-8") as f:
        json.dump(agg, f, ensure_ascii=False, indent=2)

    print("\n" + "=" * 78)
    print("结论：", "[OK] 所有项目全部覆盖参考清单" if all_ok else
          "[X] 存在缺失，见上方细分")
    print(f"聚合结果: {os.path.join(OUTPUT, 'comparison_aggregate.json')}")
    print("=" * 78)
    return 0 if all_ok else 2


if __name__ == "__main__":
    sys.exit(main())
