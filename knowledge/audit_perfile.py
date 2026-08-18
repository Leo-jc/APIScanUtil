# -*- coding: utf-8 -*-
"""Check per-FILE (not per-versionName) totals to match report's filename-based claims."""
import json
from pathlib import Path

ROOT = Path(r"E:\Agent\huawei\knowledge")
API_DIR = ROOT / "harmonyos_api_changes"
BEH_DIR = ROOT / "harmonyos_behavior_changes"

def load_json(p):
    with open(p, "r", encoding="utf-8") as f:
        return json.load(f)

print("API per-FILE (filename, versionName, count, totalChanges):")
for fp in sorted(API_DIR.glob("*.json")):
    d = load_json(fp)
    vn = d.get("versionName")
    cnt = sum(len(k.get("changes",[]) or []) for k in d.get("kits",[]) or [])
    tc = d.get("totalChanges")
    print(f"  {fp.name:<45} vn={vn:<20} cnt={cnt:<6} tc={tc}")

print("\nBehavior per-FILE (filename, versionName, count, totalChanges):")
for fp in sorted(BEH_DIR.glob("*.json")):
    d = load_json(fp)
    vn = d.get("versionName")
    cnt = len(d.get("interfaceBehaviorChanges",[]) or [])
    tc = d.get("totalChanges")
    print(f"  {fp.name:<50} vn={vn:<20} cnt={cnt:<4} tc={tc}")
