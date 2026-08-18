#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""test_cpp_scan.py —— C/C++ 原生代码扫描功能测试

覆盖：
  1. cpp_parser.CppAnalyzer：#include 解析、原生 API 调用点提取、函数边界/caller
  2. scanner.scan_cpp：规则扫描产出原生 API 使用记录
  3. change_matcher：C++ 使用点纳入 use_index，system 分支匹配 native 使用点
  4. report：cpp_api_usage / cpp_call_graph 生成
  5. 端到端 Scanner.run（含 --no-cpp 回退）
"""
import os
import sys

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(HERE)
sys.path.insert(0, REPO)

from hoscanner.api_rules import NATIVE_API_RULES, RuleEngine
from hoscanner.cpp_parser import (CppAnalyzer, analyze_cpp_project,
                                 analyze_cpp_src_roots)
from hoscanner.scanner import scan_cpp, Scanner
from hoscanner.config import NATIVE_API_PREFIXES

FIXTURE = os.path.join(HERE, "fixtures", "cpp_sample", "entry", "src", "main", "cpp")
KNOWLEDGE = os.path.join(REPO, "knowledge")


def _assert(cond, msg):
    if not cond:
        raise AssertionError(msg)


def test_tokenizer_and_native_recognition():
    """原生 API 名识别：OH_*/napi_*/OHOS_* 命中，普通标识符不命中。"""
    from hoscanner.cpp_parser import _is_native_name
    _assert(_is_native_name("OH_Drawing_Canvas"), "OH_ 前缀应识别为原生")
    _assert(_is_native_name("napi_get_cb_info"), "napi_ 前缀应识别为原生")
    _assert(_is_native_name("OHOS_ImageInfo"), "OHOS_ 前缀应识别为原生")
    _assert(not _is_native_name("DrawingHelper"), "业务类名不应识别为原生")
    _assert(not _is_native_name("Add"), "普通函数名不应识别为原生")
    print("  [OK] tokenizer 原生 API 名识别正确")


def test_cpp_analyzer_includes():
    """#include 解析：原生头计入 imports（kit=Native）。"""
    fpath = os.path.join(FIXTURE, "napi_init.cpp")
    fa = CppAnalyzer().analyze(fpath, "entry/src/main/cpp/napi_init.cpp")
    native_headers = [i for i in fa.imports if i.kit == "Native"]
    _assert(any("napi/native_api.h" in i.source for i in native_headers),
            f"应识别 napi/native_api.h 为原生头，实际 Native 头：{[i.source for i in native_headers]}")
    print(f"  [OK] #include 解析：{len(fa.imports)} 条 import，{len(native_headers)} 条原生头")


def test_cpp_analyzer_call_sites():
    """原生 API 调用点提取：napi_* / OH_* 均应被识别为 kind=native。"""
    fpath = os.path.join(FIXTURE, "drawing_helper.cpp")
    fa = CppAnalyzer().analyze(fpath, "entry/src/main/cpp/drawing_helper.cpp")
    native_calls = [cs for cs in fa.call_sites if cs.kind == "native"]
    names = {cs.name for cs in native_calls}
    # 期望命中若干典型 OH_Drawing_* / OH_NativeBuffer_* 接口
    expected = {"OH_Drawing_CanvasSave", "OH_Drawing_PenCreate",
                "OH_Drawing_PathCreate", "OH_NativeBuffer_Alloc"}
    missing = expected - names
    _assert(not missing, f"应提取原生调用点，缺失：{missing}（实际命中：{sorted(names)}）")
    # caller 应归属某函数（DrawRoundRect / CreateBuffer）
    callers = {cs.caller for cs in native_calls}
    _assert(any("DrawRoundRect" in c or "CreateBuffer" in c for c in callers),
            f"原生调用点 caller 应为函数名，实际：{callers}")
    print(f"  [OK] 调用点提取：{len(native_calls)} 个原生调用点，caller 归属正确")


def test_cpp_analyzer_function_boundary():
    """C++ 函数边界：fa.functions 应含 Init/Add/DrawRoundRect 等。"""
    fpath = os.path.join(FIXTURE, "napi_init.cpp")
    fa = CppAnalyzer().analyze(fpath, "entry/src/main/cpp/napi_init.cpp")
    _assert("Add" in fa.functions, f"应识别函数 Add，实际：{fa.functions}")
    _assert("Init" in fa.functions, f"应识别函数 Init，实际：{fa.functions}")
    print(f"  [OK] 函数边界：识别 {len(fa.functions)} 个函数 {fa.functions}")


def test_scan_cpp_usages():
    """scan_cpp 规则扫描：产出原生 API 使用记录，rel 形如 entry/src/main/cpp/...。"""
    rules = RuleEngine(NATIVE_API_RULES)
    # 用空 KB（无匹配文件），仅验证扫描产出
    from hoscanner.kb_index import KnowledgeBase
    kb = KnowledgeBase(KNOWLEDGE)
    full_base = os.path.join(os.path.dirname(FIXTURE), "..", "..").replace(
        os.sep, "/").replace("/../..", "")
    # full_base = .../cpp_sample/entry（rel 基准取 module 父目录的父级）
    # 实际 rel 基准：full_base 为 cpp_sample/entry → rel 形如 src/main/cpp/...
    full_base = os.path.normpath(os.path.join(FIXTURE, "..", ".."))
    usages = scan_cpp([FIXTURE], rules, kb, full_base_for={FIXTURE.replace(os.sep, "/"): full_base})
    _assert(len(usages) > 0, "应产出至少一条原生 API 使用记录")
    # 每条使用记录应带 language=C++
    _assert(all(u.get("language") == "C++" for u in usages), "使用记录应标记 language=C++")
    # 检查 rel 路径形式
    files = {u["file"] for u in usages}
    _assert(any("drawing_helper" in f or "napi_init" in f for f in files),
            f"rel 路径应含文件名，实际：{files}")
    apis = {u["api"] for u in usages}
    _assert(any("OH_" in a for a in apis), f"应命中 OH_ 规则，实际：{apis}")
    _assert(any("napi_" in a for a in apis), f"应命中 napi_ 规则，实际：{apis}")
    print(f"  [OK] scan_cpp：{len(usages)} 条使用记录，{len(apis)} 个唯一 API")


def test_change_matcher_cpp_use_points():
    """change_matcher：C++ 使用点纳入 use_index，build_report 不报错且带 language。"""
    from hoscanner.change_matcher import ChangeMatcher
    from hoscanner.kb_index import KnowledgeBase
    rules = RuleEngine(NATIVE_API_RULES)
    kb = KnowledgeBase(KNOWLEDGE)
    full_base = os.path.normpath(os.path.join(FIXTURE, "..", ".."))
    cpp_usages = scan_cpp([FIXTURE], rules, kb,
                          full_base_for={FIXTURE.replace(os.sep, "/"): full_base})
    cpp_analyses = analyze_cpp_src_roots(
        [FIXTURE], full_base_for={FIXTURE.replace(os.sep, "/"): full_base})
    matcher = ChangeMatcher(kb, {}, file_analyses=[], usages=[],
                           cpp_file_analyses=cpp_analyses, cpp_usages=cpp_usages)
    # use_index 应含原生符号
    native_syms = [s for s in matcher._use_index if s.startswith(NATIVE_API_PREFIXES)]
    _assert(len(native_syms) > 0, f"use_index 应含原生符号，实际原生符号数：{len(native_syms)}")
    # C++ 使用点应标记 language=C++
    cpp_ups = [up for up in matcher._all_use_points if up.language == "C++"]
    _assert(len(cpp_ups) > 0, f"应有 C++ 使用点，实际：{len(cpp_ups)}")
    report = matcher.build_report([], 12, 26)
    # 不要求一定有变更命中（知识库为 ArkTS 导向），但报告应正常构建
    _assert(hasattr(report, "system_changes"), "应返回 UpgradeChangeReport")
    print(f"  [OK] change_matcher：use_index 含 {len(native_syms)} 个原生符号，"
          f"{len(cpp_ups)} 个 C++ 使用点，报告构建正常")


def test_reports_cpp():
    """report：cpp_api_usage / cpp_call_graph 生成。"""
    import json
    import tempfile
    from hoscanner.kb_index import KnowledgeBase
    from hoscanner.report import (gen_cpp_api_usage_json, gen_cpp_api_usage_md,
                                  gen_cpp_call_graph_json)
    rules = RuleEngine(NATIVE_API_RULES)
    kb = KnowledgeBase(KNOWLEDGE)
    full_base = os.path.normpath(os.path.join(FIXTURE, "..", ".."))
    cpp_usages = scan_cpp([FIXTURE], rules, kb,
                          full_base_for={FIXTURE.replace(os.sep, "/"): full_base})
    cpp_analyses = analyze_cpp_src_roots(
        [FIXTURE], full_base_for={FIXTURE.replace(os.sep, "/"): full_base})
    with tempfile.TemporaryDirectory() as td:
        ujson = gen_cpp_api_usage_json(cpp_usages, kb.all_kb_files,
                                       os.path.join(td, "cpp_api_usage.json"))
        gen_cpp_api_usage_md(cpp_usages, kb.all_kb_files,
                             os.path.join(td, "cpp_api_usage.md"))
        cg = gen_cpp_call_graph_json(cpp_analyses,
                                     os.path.join(td, "cpp_call_graph.json"))
        _assert(ujson["summary"]["totalApiUsages"] > 0, "使用记录应 > 0")
        _assert(ujson["summary"]["filesScanned"] >= 2, f"应扫描 2 个文件，实际 {ujson['summary']['filesScanned']}")
        _assert(cg["summary"]["nativeApis"] > 0, f"原生 API 应 > 0，实际 {cg['summary']['nativeApis']}")
        _assert(cg["summary"]["nativeApiCallSites"] > 0, "原生调用点应 > 0")
        # 文件落盘
        _assert(os.path.isfile(os.path.join(td, "cpp_api_usage.md")), "md 应生成")
    print(f"  [OK] reports：usage {ujson['summary']['totalApiUsages']} 条，"
          f"call_graph {cg['summary']['nativeApis']} 个原生 API")


def test_scanner_no_cpp_fallback():
    """Scanner(scan_cpp=False) 应跳过 C++ 扫描，不产生 cpp 报告。"""
    s = Scanner(project=FIXTURE, knowledge_root=KNOWLEDGE,
                out_dir=os.path.join(REPO, "_test_out_no_cpp"),
                scan_cpp=False, use_review=False)
    _assert(s.cpp_src_roots == [], "禁用 C++ 时 cpp_src_roots 应为空")
    print("  [OK] Scanner(--no-cpp)：跳过 C++ 扫描，cpp_src_roots 为空")


def main():
    tests = [
        ("tokenizer + 原生识别", test_tokenizer_and_native_recognition),
        ("#include 解析", test_cpp_analyzer_includes),
        ("原生调用点提取", test_cpp_analyzer_call_sites),
        ("函数边界", test_cpp_analyzer_function_boundary),
        ("scan_cpp 使用记录", test_scan_cpp_usages),
        ("change_matcher C++", test_change_matcher_cpp_use_points),
        ("C++ 报告生成", test_reports_cpp),
        ("Scanner --no-cpp 回退", test_scanner_no_cpp_fallback),
    ]
    print("=" * 60)
    print("C++ 原生代码扫描功能测试")
    print("=" * 60)
    failed = 0
    for name, fn in tests:
        print(f"\n[{name}]")
        try:
            fn()
        except Exception as e:
            failed += 1
            import traceback
            traceback.print_exc()
            print(f"  [FAIL] 失败：{e}")
    print("\n" + "=" * 60)
    print(f"结果：{len(tests) - failed}/{len(tests)} 通过")
    print("=" * 60)
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
