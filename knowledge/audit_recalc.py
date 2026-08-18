# -*- coding: utf-8 -*-
"""
Independent audit of HarmonyOS change classification analysis.
Recompute everything from raw JSON; compare against report claims.
"""
import json
import os
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(r"E:\Agent\huawei\knowledge")
API_DIR = ROOT / "harmonyos_api_changes"
BEH_DIR = ROOT / "harmonyos_behavior_changes"

def load_json(path):
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)

def pct(n, total):
    return (n / total * 100) if total else 0.0

print("=" * 80)
print("INDEPENDENT AUDIT — HarmonyOS change classification")
print("=" * 80)

# ============================================================
# 0. File exclusion check: wangzhi.txt
# ============================================================
print("\n### 0. File exclusion check")
all_beh_entries = sorted([p.name for p in BEH_DIR.iterdir()])
json_beh_entries = sorted([p.name for p in BEH_DIR.glob("*.json")])
non_json_beh = [n for n in all_beh_entries if not n.endswith(".json")]
print(f"behavior dir total entries: {len(all_beh_entries)}")
print(f"behavior dir JSON files: {len(json_beh_entries)}")
print(f"non-JSON entries in behavior dir: {non_json_beh}")
wangzhi_path = BEH_DIR / "wangzhi.txt"
print(f"wangzhi.txt exists: {wangzhi_path.exists()}")
if wangzhi_path.exists():
    with open(wangzhi_path, "r", encoding="utf-8", errors="replace") as f:
        head = f.read(300)
    print(f"wangzhi.txt head (first 300 chars):\n{head}")

api_json = sorted(API_DIR.glob("*.json"))
beh_json = sorted(BEH_DIR.glob("*.json"))
print(f"API JSON file count: {len(api_json)}")
print(f"Behavior JSON file count: {len(beh_json)}")

# ============================================================
# 1. API changes: count validation + totalChanges check
# ============================================================
print("\n" + "=" * 80)
print("1. API CHANGES (harmonyos_api_changes/)")
print("=" * 80)

api_op_counter = Counter()
api_total = 0
api_per_file = []   # (name, version, totalChanges_field, actual_count, match)
api_version_op = defaultdict(Counter)
api_top_keys = Counter()
api_missing_op = 0
api_op_null_values = []   # records where operation key missing or null/empty

for fp in api_json:
    data = load_json(fp)
    for k in data.keys():
        api_top_keys[k] += 1
    version = data.get("versionName") or fp.stem
    actual = 0
    kits = data.get("kits", []) or []
    for kit in kits:
        chs = kit.get("changes", []) or []
        for ch in chs:
            op = ch.get("operation", None)
            # Distinguish missing key vs null vs empty string vs valid string
            if "operation" not in ch:
                api_missing_op += 1
                op_key = "<MISSING_KEY>"
            elif op is None:
                api_missing_op += 1
                op_key = "<null>"
            elif op == "":
                api_missing_op += 1
                op_key = "<empty>"
            else:
                op_key = op
            api_op_counter[op_key] += 1
            api_version_op[version][op_key] += 1
            actual += 1
            if op_key in ("<MISSING_KEY>", "<null>", "<empty>"):
                api_op_null_values.append((fp.name, version, op_key, ch.get("id")))
    api_total += actual
    tc = data.get("totalChanges", None)
    match = (tc == actual) if tc is not None else None
    api_per_file.append((fp.name, version, tc, actual, match))

print(f"\nAPI files: {len(api_json)}")
print(f"API total changes (recomputed): {api_total}")
print(f"Reported total: 28455  -> match: {api_total == 28455}")
print(f"distinct operation values (incl. null markers): {len(api_op_counter)}")
print(f"operation missing/null/empty count: {api_missing_op}")

# totalChanges per-file check
mismatches = [r for r in api_per_file if r[4] is False]
no_field = [r for r in api_per_file if r[4] is None]
print(f"\ntotalChanges per-file check:")
print(f"  files with totalChanges field: {len([r for r in api_per_file if r[4] is not None])}")
print(f"  files WITHOUT totalChanges field: {len(no_field)}")
print(f"  mismatches: {len(mismatches)}")
if no_field:
    print("  Files lacking totalChanges field:")
    for r in no_field:
        print(f"    {r[0]}: version={r[1]}, actual={r[3]}")
if mismatches:
    print("  MISMATCH details:")
    for r in mismatches:
        print(f"    {r[0]}: totalChanges={r[2]}, actual={r[3]}")

# Top-level keys seen across API files
print(f"\nTop-level keys across API files: {dict(api_top_keys)}")

# distinct operation values + counts + pct, sorted desc
print(f"\nAPI operation distribution (distinct={len(api_op_counter)}):")
print(f"{'rank':>4}  {'operation':<60}{'count':>10}{'pct%':>10}")
for i, (op, c) in enumerate(api_op_counter.most_common(), 1):
    print(f"{i:>4}  {op:<60}{c:>10}{pct(c, api_total):>10.2f}")
sum_check = sum(api_op_counter.values())
print(f"sum of all op counts = {sum_check}  (should equal total {api_total}): {sum_check == api_total}")

# Verify "新增API" claim
print(f"\n新增API count: {api_op_counter.get('新增API', 0)}  reported 18970 -> {api_op_counter.get('新增API',0)==18970}")
print(f"新增API pct: {pct(api_op_counter.get('新增API',0), api_total):.2f}%  reported 66.67%")

# ============================================================
# 2. Behavior changes: totalChanges check + classification
# ============================================================
print("\n" + "=" * 80)
print("2. BEHAVIOR CHANGES (harmonyos_behavior_changes/)")
print("=" * 80)

beh_ct_counter = Counter()   # changeType
beh_reason_counter = Counter()
beh_eff_counter = Counter()   # apiEffectiveVersion (raw, distinguish None types)
beh_total = 0
beh_per_file = []
beh_top_keys = Counter()
beh_top_array_lengths = defaultdict(list)   # key -> list of lengths per file
beh_none_type = []   # records where changeType is None-like
beh_other_arrays = defaultdict(int)   # non-interfaceBehaviorChanges top-level arrays

# Track raw None type markers
ct_missing = 0
ct_null = 0
ct_string_none = 0   # literal "None"
ct_empty = 0
reason_missing = 0
reason_null = 0
reason_string_none = 0
eff_missing = 0
eff_null = 0
eff_string_none = 0

for fp in beh_json:
    data = load_json(fp)
    for k in data.keys():
        beh_top_keys[k] += 1
    version = data.get("versionName") or fp.stem
    ibc = data.get("interfaceBehaviorChanges", []) or []
    # record all top-level array keys
    for k, v in data.items():
        if isinstance(v, list):
            beh_top_array_lengths[k].append((fp.name, len(v)))
    actual = 0
    for item in ibc:
        ic = item.get("interfaceChanges")
        # changeType raw analysis
        if ic is None:
            ct_missing += 1
            ct_key = "<interfaceChanges_missing>"
        elif "changeType" not in ic:
            ct_missing += 1
            ct_key = "<changeType_missing>"
        else:
            cv = ic.get("changeType")
            if cv is None:
                ct_null += 1
                ct_key = "<null>"
            elif cv == "":
                ct_empty += 1
                ct_key = "<empty>"
            elif cv == "None":
                ct_string_none += 1
                ct_key = "None"
            else:
                ct_key = cv
        # changeReasonCategory raw
        if ic is None or "changeReasonCategory" not in ic:
            reason_missing += 1
            reason_key = "<missing>"
        else:
            rv = ic.get("changeReasonCategory")
            if rv is None:
                reason_null += 1
                reason_key = "<null>"
            elif rv == "None":
                reason_string_none += 1
                reason_key = "None"
            else:
                reason_key = rv
        # apiEffectiveVersion raw
        if ic is None or "apiEffectiveVersion" not in ic:
            eff_missing += 1
            eff_key = "<missing>"
        else:
            ev = ic.get("apiEffectiveVersion")
            if ev is None:
                eff_null += 1
                eff_key = "<null>"
            elif ev == "None":
                eff_string_none += 1
                eff_key = "None"
            else:
                eff_key = ev
        beh_ct_counter[ct_key] += 1
        beh_reason_counter[reason_key] += 1
        beh_eff_counter[eff_key] += 1
        actual += 1
        if ct_key in ("<changeType_missing>", "<interfaceChanges_missing>", "<null>", "<empty>"):
            beh_none_type.append((fp.name, version, ct_key, ic.get("id") if ic else None))
    beh_total += actual
    tc = data.get("totalChanges", None)
    match = (tc == actual) if tc is not None else None
    beh_per_file.append((fp.name, version, tc, actual, match))

print(f"\nBehavior files: {len(beh_json)}")
print(f"Behavior total changes (recomputed): {beh_total}")
print(f"Reported total: 163  -> match: {beh_total == 163}")

# totalChanges per-file
beh_mismatches = [r for r in beh_per_file if r[4] is False]
beh_no_field = [r for r in beh_per_file if r[4] is None]
print(f"\ntotalChanges per-file check:")
print(f"  files with totalChanges field: {len([r for r in beh_per_file if r[4] is not None])}")
print(f"  files WITHOUT totalChanges field: {len(beh_no_field)}")
print(f"  mismatches: {len(beh_mismatches)}")
if beh_no_field:
    print("  Files lacking totalChanges field:")
    for r in beh_no_field:
        print(f"    {r[0]}: version={r[1]}, actual={r[3]}")
if beh_mismatches:
    print("  MISMATCH details:")
    for r in beh_mismatches:
        print(f"    {r[0]}: totalChanges={r[2]}, actual={r[3]}")

print(f"\nTop-level keys across behavior files: {dict(beh_top_keys)}")
print(f"\nTop-level ARRAY keys across behavior files (key: total occurrences, sum of lengths):")
for k, lst in beh_top_array_lengths.items():
    total_len = sum(x[1] for x in lst)
    print(f"  {k}: appears in {len(lst)} files, total records across all files = {total_len}")

print(f"\nchangeType raw None-type analysis:")
print(f"  literal 'None' string: {ct_string_none}")
print(f"  missing key: {ct_missing}")
print(f"  JSON null: {ct_null}")
print(f"  empty string: {ct_empty}")
print(f"\nchangeReasonCategory raw None-type analysis:")
print(f"  literal 'None' string: {reason_string_none}")
print(f"  missing key: {reason_missing}")
print(f"  JSON null: {reason_null}")
print(f"\napiEffectiveVersion raw None-type analysis:")
print(f"  literal 'None' string: {eff_string_none}")
print(f"  missing key: {eff_missing}")
print(f"  JSON null: {eff_null}")

print(f"\nbehavior changeType distribution (distinct={len(beh_ct_counter)}):")
print(f"{'rank':>4}  {'changeType':<40}{'count':>10}{'pct%':>10}")
for i, (k, c) in enumerate(beh_ct_counter.most_common(), 1):
    print(f"{i:>4}  {k:<40}{c:>10}{pct(c, beh_total):>10.2f}")
sum_ct = sum(beh_ct_counter.values())
print(f"sum changeType = {sum_ct} (should = {beh_total}): {sum_ct==beh_total}")

print(f"\nbehavior changeReasonCategory distribution (distinct={len(beh_reason_counter)}):")
print(f"{'rank':>4}  {'reason':<60}{'count':>8}{'pct%':>8}")
for i, (k, c) in enumerate(beh_reason_counter.most_common(), 1):
    print(f"{i:>4}  {k:<60}{c:>8}{pct(c, beh_total):>8.2f}")
sum_r = sum(beh_reason_counter.values())
print(f"sum reason = {sum_r} (should = {beh_total}): {sum_r==beh_total}")

print(f"\nbehavior apiEffectiveVersion distribution (distinct={len(beh_eff_counter)}):")
print(f"{'rank':>4}  {'effective':<40}{'count':>10}{'pct%':>10}")
for i, (k, c) in enumerate(beh_eff_counter.most_common(), 1):
    print(f"{i:>4}  {k:<40}{c:>10}{pct(c, beh_total):>10.2f}")
sum_e = sum(beh_eff_counter.values())
print(f"sum effective = {sum_e} (should = {beh_total}): {sum_e==beh_total}")

# ============================================================
# 3. Specific claim verifications
# ============================================================
print("\n" + "=" * 80)
print("3. SPECIFIC CLAIM VERIFICATIONS")
print("=" * 80)

# API: 42 classes, 新增API=18970 (66.67%)
api_valid_classes = {k for k in api_op_counter if k not in ("<MISSING_KEY>","<null>","<empty>")}
print(f"\nAPI operation distinct valid classes: {len(api_valid_classes)}  reported 42 -> {len(api_valid_classes)==42}")
print(f"  (including null-type markers: {len(api_op_counter)})")

# Behavior changeType: 8 classes, 接口行为变更=107 (65.64%), None=17
print(f"\nBehavior changeType distinct: {len(beh_ct_counter)}  reported 8 -> {len(beh_ct_counter)==8}")
print(f"  接口行为变更: {beh_ct_counter.get('接口行为变更',0)}  reported 107 -> {beh_ct_counter.get('接口行为变更',0)==107}")
print(f"  None (literal string): {beh_ct_counter.get('None',0)}  reported 17 -> {beh_ct_counter.get('None',0)==17}")
print(f"  None is literal string 'None' (not missing/null): {ct_string_none>0 and ct_missing==0 and ct_null==0}")

# Behavior reason: 7 classes, IMPLEMENTATION_BUG=62 (38.04%)
print(f"\nBehavior reason distinct: {len(beh_reason_counter)}  reported 7 -> {len(beh_reason_counter)==7}")
print(f"  IMPLEMENTATION_BUG: {beh_reason_counter.get('IMPLEMENTATION_BUG',0)}  reported 62 -> {beh_reason_counter.get('IMPLEMENTATION_BUG',0)==62}")

# effective: 3 classes
print(f"\nBehavior effective distinct: {len(beh_eff_counter)}  reported 3 -> {len(beh_eff_counter)==3}")

# ============================================================
# 4. Percentage spot checks (6+ items)
# ============================================================
print("\n" + "=" * 80)
print("4. PERCENTAGE SPOT CHECKS (report vs recomputed)")
print("=" * 80)
checks = [
    ("API", "新增API", 18970, 66.67, api_total),
    ("API", "API从不支持元服务到支持元服务", 1416, 4.98, api_total),
    ("API", "API模型切换", 1398, 4.91, api_total),
    ("API", "删除错误码", 916, 3.22, api_total),
    ("API", "新增错误码", 810, 2.85, api_total),
    ("API", "删除API", 288, 1.01, api_total),
    ("API", "接口新增同名方法且参数类型与已有的参数类型范围不是包含关系", 1, 0.01, api_total),
    ("BEH-ct", "接口行为变更", 107, 65.64, beh_total),
    ("BEH-ct", "None", 17, 10.43, beh_total),
    ("BEH-ct", "UX交互行为变更", 9, 5.52, beh_total),
    ("BEH-reason", "IMPLEMENTATION_BUG", 62, 38.04, beh_total),
    ("BEH-reason", "SOLUTION_DESIGN_ISSUES", 34, 20.86, beh_total),
    ("BEH-reason", "UPSTREAM_OPEN_SOURCE_COMMUNITY_TRIGGERED_CHANGE", 4, 2.45, beh_total),
    ("BEH-eff", "NOT_ISOLATED", 83, 50.92, beh_total),
    ("BEH-eff", "ISOLATED", 79, 48.47, beh_total),
    ("BEH-eff", "COULD_NOT_ISOLATED", 1, 0.61, beh_total),
]
print(f"{'category':<12}{'item':<50}{'rpt_cnt':>8}{'rec_cnt':>8}{'rpt%':>8}{'rec%':>8}{'cnt_ok':>8}{'pct_ok':>8}")
for cat, item, rpt_cnt, rpt_pct, tot in checks:
    if cat == "API":
        rec_cnt = api_op_counter.get(item, 0)
    elif cat == "BEH-ct":
        rec_cnt = beh_ct_counter.get(item, 0)
    elif cat == "BEH-reason":
        rec_cnt = beh_reason_counter.get(item, 0)
    else:
        rec_cnt = beh_eff_counter.get(item, 0)
    rec_pct = round(pct(rec_cnt, tot), 2)
    cnt_ok = rec_cnt == rpt_cnt
    pct_ok = rec_pct == rpt_pct
    print(f"{cat:<12}{item:<50}{rpt_cnt:>8}{rec_cnt:>8}{rpt_pct:>8}{rec_pct:>8}{str(cnt_ok):>8}{str(pct_ok):>8}")

# ============================================================
# 5. Structural aggregation checks from report conclusions
# ============================================================
print("\n" + "=" * 80)
print("5. STRUCTURAL CONCLUSION CHECKS (API)")
print("=" * 80)
add_ops = ["新增API","新增错误码","新增kit","新增导出符号","新增装饰器","新增继承父类"]
del_ops = ["删除API","删除错误码","删除kit","删除导出符号","删除同名函数"]
add_sum = sum(api_op_counter.get(o,0) for o in add_ops)
del_sum = sum(api_op_counter.get(o,0) for o in del_ops)
print(f"Add-class ops sum: {add_sum}  pct={pct(add_sum, api_total):.2f}%  report says ~69.5%")
print(f"Del-class ops sum: {del_sum}  pct={pct(del_sum, api_total):.2f}%  report says ~4.36%")

print("\n### AUDIT COMPLETE ###")
