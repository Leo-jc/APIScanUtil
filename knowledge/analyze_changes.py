# -*- coding: utf-8 -*-
"""
Analyze HarmonyOS change JSON files in two directories:
  - harmonyos_api_changes/      (API变更清单, uses kits[].changes[].operation)
  - harmonyos_behavior_changes/ (行为变更清单, uses interfaceBehaviorChanges[].interfaceChanges.changeType / changeReasonCategory)

Outputs:
  1. Per-directory classification counts + percentages
  2. Cross-version breakdown
  3. A raw dump (JSON) of all classification records for downstream review/audit
"""
import json
import os
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent
API_DIR = ROOT / "harmonyos_api_changes"
BEH_DIR = ROOT / "harmonyos_behavior_changes"

def load_json(path):
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)

def pct(n, total):
    return f"{(n / total * 100):.2f}%" if total else "0.00%"

# ----------------------------------------------------------------------
# 1. API changes  — classification by `operation`
# ----------------------------------------------------------------------
def analyze_api():
    per_file = []          # list of (filename, version, operation, change)
    op_counter = Counter()
    version_op = defaultdict(Counter)   # version -> Counter(operation)
    kit_op = defaultdict(Counter)       # kit name -> Counter(operation)
    files = sorted(API_DIR.glob("*.json"))
    total = 0
    for fp in files:
        try:
            data = load_json(fp)
        except Exception as e:
            print(f"[WARN] failed to read {fp.name}: {e}", file=sys.stderr)
            continue
        version = data.get("versionName") or fp.stem
        for kit in data.get("kits", []) or []:
            kit_name = kit.get("name", "<unknown>")
            for ch in kit.get("changes", []) or []:
                op = ch.get("operation") or "<null>"
                op_counter[op] += 1
                version_op[version][op] += 1
                kit_op[kit_name][op] += 1
                per_file.append((fp.name, version, kit_name, op, ch))
                total += 1
    return {
        "files": len(files),
        "total": total,
        "counter": op_counter,
        "version_op": version_op,
        "kit_op": kit_op,
        "per_file": per_file,
    }

# ----------------------------------------------------------------------
# 2. Behavior changes — classification by changeType and changeReasonCategory
# ----------------------------------------------------------------------
def analyze_behavior():
    changeType_counter = Counter()
    reason_counter = Counter()
    effective_counter = Counter()   # apiEffectiveVersion
    version_type = defaultdict(Counter)
    files = sorted(BEH_DIR.glob("*.json"))
    total = 0
    records = []
    for fp in files:
        try:
            data = load_json(fp)
        except Exception as e:
            print(f"[WARN] failed to read {fp.name}: {e}", file=sys.stderr)
            continue
        version = data.get("versionName") or fp.stem
        # interfaceBehaviorChanges
        for item in data.get("interfaceBehaviorChanges", []) or []:
            ic = item.get("interfaceChanges") or {}
            ctype = ic.get("changeType") or "<null>"
            reason = ic.get("changeReasonCategory") or "<null>"
            eff = ic.get("apiEffectiveVersion") or "<null>"
            changeType_counter[ctype] += 1
            reason_counter[reason] += 1
            effective_counter[eff] += 1
            version_type[version][ctype] += 1
            records.append({
                "file": fp.name,
                "version": version,
                "changeType": ctype,
                "changeReasonCategory": reason,
                "apiEffectiveVersion": eff,
                "changeTitle": ic.get("changeTitle"),
                "id": ic.get("id"),
            })
            total += 1
        # also check for other possible arrays
        for key in ("systemBehaviorChanges", "toolBehaviorChanges", "changes"):
            if key in data and isinstance(data[key], list):
                for item in data[key]:
                    if isinstance(item, dict):
                        ctype = item.get("changeType") or item.get("type") or "<null>"
                        reason = item.get("changeReasonCategory") or "<null>"
                        changeType_counter[("[other:"+key, ctype)] += 1
                        records.append({
                            "file": fp.name,
                            "version": version,
                            "changeType": f"[{key}] {ctype}",
                            "changeReasonCategory": reason,
                            "changeTitle": item.get("changeTitle"),
                            "id": item.get("id"),
                        })
                        total += 1
    return {
        "files": len(files),
        "total": total,
        "changeType": changeType_counter,
        "reason": reason_counter,
        "effective": effective_counter,
        "version_type": version_type,
        "records": records,
    }

def print_counter(title, counter, total):
    print(f"\n## {title}  (total={total})")
    print(f"{'分类':<40}{'数量':>10}{'占比':>12}")
    print("-" * 62)
    for k, v in counter.most_common():
        label = str(k)
        print(f"{label:<40}{v:>10}{pct(v, total):>12}")

def main():
    print("=" * 70)
    print("HARMONYOS 变更分类分析报告")
    print("=" * 70)

    print("\n" + "=" * 70)
    print("一、API 变更 (harmonyos_api_changes/)  — 按 operation 分类")
    print("=" * 70)
    api = analyze_api()
    print(f"文件数: {api['files']}    变更总数: {api['total']}")
    print_counter("API operation 分类", api["counter"], api["total"])

    print("\n### 各版本 operation 分布:")
    print(f"{'版本':<32}" + "".join(f"{op:>14}" for op, _ in api["counter"].most_common()))
    for ver in sorted(api["version_op"].keys()):
        row = f"{ver:<32}"
        for op, _ in api["counter"].most_common():
            row += f"{api['version_op'][ver].get(op, 0):>14}"
        print(row)

    print("\n### 各 Kit 的 operation 分布 (Top 15):")
    print(f"{'Kit':<40}" + "".join(f"{op:>12}" for op, _ in api["counter"].most_common()))
    kit_totals = {k: sum(c.values()) for k, c in api["kit_op"].items()}
    for kit in sorted(kit_totals, key=kit_totals.get, reverse=True)[:15]:
        row = f"{kit[:38]:<40}"
        for op, _ in api["counter"].most_common():
            row += f"{api['kit_op'][kit].get(op, 0):>12}"
        print(row)

    print("\n" + "=" * 70)
    print("二、行为变更 (harmonyos_behavior_changes/) — 按 changeType 分类")
    print("=" * 70)
    beh = analyze_behavior()
    print(f"文件数: {beh['files']}    变更总数: {beh['total']}")
    print_counter("behavior changeType 分类", beh["changeType"], beh["total"])
    print_counter("behavior changeReasonCategory 分类", beh["reason"], beh["total"])
    print_counter("behavior apiEffectiveVersion 分类", beh["effective"], beh["total"])

    print("\n### 各版本 changeType 分布:")
    all_types = sorted({t for c in beh["version_type"].values() for t in c.keys()})
    print(f"{'版本':<32}" + "".join(f"{t:>18}" for t in all_types))
    for ver in sorted(beh["version_type"].keys()):
        row = f"{ver:<32}"
        for t in all_types:
            row += f"{beh['version_type'][ver].get(t, 0):>18}"
        print(row)

    # dump raw for review
    out = {
        "api": {
            "files": api["files"],
            "total": api["total"],
            "counter": dict(api["counter"]),
            "version_op": {k: dict(v) for k, v in api["version_op"].items()},
        },
        "behavior": {
            "files": beh["files"],
            "total": beh["total"],
            "changeType": dict(beh["changeType"]),
            "reason": dict(beh["reason"]),
            "effective": dict(beh["effective"]),
            "version_type": {k: dict(v) for k, v in beh["version_type"].items()},
        },
    }
    with open(ROOT / "analysis_result.json", "w", encoding="utf-8") as f:
        json.dump(out, f, ensure_ascii=False, indent=2)
    print("\n[OK] 详细结果已写入 analysis_result.json")

if __name__ == "__main__":
    main()
