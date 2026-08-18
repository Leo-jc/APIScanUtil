# -*- coding: utf-8 -*-
"""Supplementary: per-version totals + verify report section 3 claims."""
import json
from collections import defaultdict
from pathlib import Path

ROOT = Path(r"E:\Agent\huawei\knowledge")
API_DIR = ROOT / "harmonyos_api_changes"
BEH_DIR = ROOT / "harmonyos_behavior_changes"

def load_json(p):
    with open(p, "r", encoding="utf-8") as f:
        return json.load(f)

# API per-version totals
api_ver = defaultdict(int)
for fp in sorted(API_DIR.glob("*.json")):
    d = load_json(fp)
    v = d.get("versionName") or fp.stem
    cnt = 0
    for kit in d.get("kits", []) or []:
        cnt += len(kit.get("changes", []) or [])
    api_ver[v] += cnt

print("API per-version totals (sorted by count desc):")
for v, c in sorted(api_ver.items(), key=lambda x: -x[1]):
    print(f"  {v:<40}{c}")

# Behavior per-version totals
beh_ver = defaultdict(int)
for fp in sorted(BEH_DIR.glob("*.json")):
    d = load_json(fp)
    v = d.get("versionName") or fp.stem
    cnt = len(d.get("interfaceBehaviorChanges", []) or [])
    beh_ver[v] += cnt

print("\nBehavior per-version totals (sorted by count desc):")
for v, c in sorted(beh_ver.items(), key=lambda x: -x[1]):
    print(f"  {v:<40}{c}")

# Report section 3 specific claims
print("\n### Report section 3 claim verification ###")
api_claims = {
    "6.1.0(23)_Beta1": 4339,
    "26.0.0_Beta2": 3222,
    "5.1.0(18)": 3799,
    "6.0.0(20)_Beta1": 2533,
}
beh_claims = {
    "5.0.2(14)_Beta1": 33,
    "6.0.0(20)_Beta1": 21,
    "26.0.0(26)_Beta1": 26,
    "5.0.1(13)_Beta3": 14,
}
print("API version peak claims:")
for v, c in api_claims.items():
    actual = api_ver.get(v, "NOT FOUND")
    print(f"  {v}: report={c}, actual={actual}, match={actual==c}")
print("Behavior version peak claims:")
for v, c in beh_claims.items():
    actual = beh_ver.get(v, "NOT FOUND")
    print(f"  {v}: report={c}, actual={actual}, match={actual==c}")

# Show the actual top API peak versions
print("\nActual top-6 API versions:")
for v, c in sorted(api_ver.items(), key=lambda x: -x[1])[:6]:
    print(f"  {v}: {c}")
print("Actual top-6 behavior versions:")
for v, c in sorted(beh_ver.items(), key=lambda x: -x[1])[:6]:
    print(f"  {v}: {c}")
