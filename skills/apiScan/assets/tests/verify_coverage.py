#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
verify_coverage.py —— 覆盖校验

校验 hoscanner 的扫描结果「完全覆盖」给定的参考文档（api_usage.json / api_usage.md）：

  * 全部 API 使用记录（api + codeLocation）均在扫描结果中
  * 唯一 API 全部覆盖
  * .ets 文件全部覆盖
  * 每条记录的 kbSources 与参考一致
  * 知识库文件全部涉及

用法：
  python tests/verify_coverage.py [--scanned output/{项目}/api_usage.json] [--reference <参考 api_usage.json>]

  默认参考路径 docs/api_usage.json 不随仓库分发，需通过 --reference 指定实际参考文档。
"""
import json
import os
import sys

DEFAULT_SCANNED = os.path.join(os.path.dirname(__file__), "..", "..", "output", "api_usage.json")
DEFAULT_REFERENCE = os.path.join(os.path.dirname(__file__), "..", "..", "docs", "api_usage.json")


def load(path: str) -> dict:
    with open(path, encoding="utf-8") as f:
        return json.load(f)


def verify(scanned_path: str, reference_path: str) -> bool:
    ref = load(reference_path)
    sc = load(scanned_path)

    ref_usage = ref["apiUsage"]
    sc_usage = sc["apiUsage"]

    ref_entries = {(u["api"], u["codeLocation"]) for u in ref_usage}
    sc_entries = {(u["api"], u["codeLocation"]) for u in sc_usage}
    sc_by_key = {(u["api"], u["codeLocation"]): u for u in sc_usage}

    print("=" * 70)
    print("覆盖校验：scanned vs reference")
    print(f"  参考文档: {reference_path}")
    print(f"  扫描结果: {scanned_path}")
    print("-" * 70)

    ok = True

    # 1) 记录数
    print(f"[1] API 使用记录数   : 参考 {len(ref_usage)}  vs 扫描 {len(sc_usage)}"
          f"  {'✓' if len(sc_usage) >= len(ref_usage) else '✗ 不足'}")
    ok &= len(sc_usage) >= len(ref_usage)

    # 2) 唯一 API
    ref_apis = {u["api"] for u in ref_usage}
    sc_apis = {u["api"] for u in sc_usage}
    missing_apis = ref_apis - sc_apis
    print(f"[2] 唯一 API          : 参考 {len(ref_apis)}  vs 扫描 {len(sc_apis)}"
          f"  {'✓' if not missing_apis else '✗'}")
    if missing_apis:
        print("      缺失:", sorted(missing_apis))
    ok &= not missing_apis

    # 3) 文件
    ref_files = {u["codeLocation"].split(":")[0] for u in ref_usage}
    sc_files = {u["codeLocation"].split(":")[0] for u in sc_usage}
    missing_files = ref_files - sc_files
    print(f"[3] 扫描文件          : 参考 {len(ref_files)}  vs 扫描 {len(sc_files)}"
          f"  {'✓' if not missing_files else '✗'}")
    if missing_files:
        print("      缺失:", sorted(missing_files))
    ok &= not missing_files

    # 4) 记录级覆盖（api + codeLocation）
    missing_entries = ref_entries - sc_entries
    print(f"[4] 记录级覆盖        : 参考 {len(ref_entries)} 条中缺失 {len(missing_entries)} 条"
          f"  {'✓' if not missing_entries else '✗'}")
    for api, loc in sorted(missing_entries):
        print(f"      缺失: {api} @ {loc}")
    ok &= not missing_entries

    # 5) kbSources 一致性
    kb_mismatch = 0
    for api, loc in ref_entries & sc_entries:
        r = next(u for u in ref_usage if u["api"] == api and u["codeLocation"] == loc)
        s = sc_by_key[(api, loc)]
        if r["kbSources"] != s["kbSources"]:
            kb_mismatch += 1
            if kb_mismatch <= 5:
                print(f"      kbSources 不一致: {api} @ {loc}")
                print(f"        参考: {r['kbSources']}")
                print(f"        扫描: {s['kbSources']}")
    print(f"[5] kbSources 一致性  : {len(ref_entries & sc_entries)} 条中不一致 {kb_mismatch} 条"
          f"  {'✓' if kb_mismatch == 0 else '✗'}")
    ok &= kb_mismatch == 0

    # 6) 知识库覆盖
    ref_kb = set(ref["summary"]["allInvolvedFiles"])
    sc_kb = set(sc["summary"]["allInvolvedFiles"])
    missing_kb = ref_kb - sc_kb
    print(f"[6] 知识库文件覆盖    : 参考 {len(ref_kb)}  vs 扫描 {len(sc_kb)}"
          f"  {'✓' if not missing_kb else '✗'}")
    if missing_kb:
        print("      缺失:", sorted(missing_kb))
    ok &= not missing_kb

    # 7) kbCoverage 汇总
    ref_cov = ref["summary"]["kbCoverage"]
    sc_cov = sc["summary"]["kbCoverage"]
    cov_ok = (sc_cov["totalKbFiles"] == ref_cov["totalKbFiles"]
              and sc_cov["directApiMatch"] == ref_cov["directApiMatch"]
              and sc_cov["dataLayerOnly"] == ref_cov["dataLayerOnly"])
    print(f"[7] kbCoverage 汇总   : 参考 {ref_cov['totalKbFiles']}/{ref_cov['directApiMatch']}/"
          f"{ref_cov['dataLayerOnly']}  扫描 {sc_cov['totalKbFiles']}/{sc_cov['directApiMatch']}/"
          f"{sc_cov['dataLayerOnly']}  {'✓' if cov_ok else '✗'}")
    ok &= cov_ok

    # 8) api_usage.md 内容比对（归一化时间戳与集合顺序后应完全一致）
    import re
    import os as _os
    md_ok = True
    ref_md = _os.path.join(_os.path.dirname(reference_path), "api_usage.md")
    sc_md = _os.path.join(_os.path.dirname(scanned_path), "api_usage.md")
    if _os.path.exists(ref_md) and _os.path.exists(sc_md):
        def _norm(md: str) -> str:
            def _sort_set(m):
                items = re.findall(r"'[^']*'", m.group(1))
                return "{" + ", ".join(sorted(items)) + "}"
            md = re.sub(r"\{((?:'[^']*',?\s*)+)\}", _sort_set, md)
            md = re.sub(r"生成时间：.*", "生成时间：T", md)
            md = re.sub(r"\*本文档由.*自动生成。\*", "*本文档由 GENERATOR 自动生成。*", md)
            return md
        md_ok = _norm(open(ref_md, encoding="utf-8").read()) == \
                _norm(open(sc_md, encoding="utf-8").read())
        print(f"[8] api_usage.md 比对 : {'✓ 内容一致（时间戳/集合顺序/生成器署名除外）' if md_ok else '✗ 存在差异'}")
        ok &= md_ok
    else:
        print("[8] api_usage.md 比对 : 跳过（缺 md 文件）")

    print("-" * 70)
    print("结论：", "✅ 完全覆盖参考文档" if ok else "❌ 存在缺口")
    print("=" * 70)
    return ok


def main():
    args = sys.argv[1:]
    scanned = DEFAULT_SCANNED
    reference = DEFAULT_REFERENCE
    if "--scanned" in args:
        scanned = args[args.index("--scanned") + 1]
    if "--reference" in args:
        reference = args[args.index("--reference") + 1]
    scanned = os.path.abspath(scanned)
    reference = os.path.abspath(reference)
    if not os.path.exists(scanned):
        print(f"错误：未找到扫描结果 {scanned}，请先运行 run_scanner.py")
        return 1
    if not os.path.exists(reference):
        print(f"错误：未找到参考文档 {reference}")
        return 1
    return 0 if verify(scanned, reference) else 2


if __name__ == "__main__":
    sys.exit(main())
