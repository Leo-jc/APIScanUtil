#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
scanner.py —— 扫描编排（hoscanner 主流程）

步骤：
  1. 构建知识库索引（apiChange + harmonyos_api_changes）
  2. 规则引擎扫描 .ets 源码 → API 使用记录（api_usage）
  3. 词法分析 → API 调用图谱（api_call_graph）
  4. 升级窗口匹配 → 系统 API 变更 + 行为变更清单（change_report）
  5. 写出报告（JSON + Markdown）
"""
import os

from .ai_advisor import UpgradeAdvisor
from .api_rules import RuleEngine, DEFAULT_RULES, NATIVE_API_RULES
from .change_matcher import ChangeMatcher
from .config import (CPP_EXTS, CPP_SKIP_DIRS, CPP_SRC_REL, DEFAULT_KNOWLEDGE_ROOT,
                     DEFAULT_OUT_DIR, DEFAULT_PROJECT, DEFAULT_SDK_ROOT,
                     ETS_SRC_REL, EXCLUDED_GENERATED_FILES, NATIVE_API_PREFIXES)
from .ets_parser import analyze_src_roots
from .kb_index import KnowledgeBase
from .report import (gen_api_usage_json, gen_api_usage_md, gen_call_graph_json,
                     gen_change_report_csv, gen_change_report_json,
                     gen_change_report_md, gen_cpp_api_usage_json,
                     gen_cpp_api_usage_md, gen_cpp_call_graph_json)

# 数据定义行关键词（参考实现约定：这些行不作为 API 使用记录）
_DATA_LINE_KEYWORDS = ("apiName:", "kbSource:", "kbFiles:", "desc:")
_COMMENT_PREFIXES = ("//", "*", "/*")


def scan_ets(ets_root, rules: RuleEngine, kb: KnowledgeBase,
             exclude: set[str] | None = None, project_root: str | None = None,
             src_roots: list[str] | None = None) -> list[dict]:
    """逐文件逐行按规则扫描，返回 API 使用记录（与参考实现语义一致）。

    支持多源码根：src_roots 提供时遍历全部根，rel 路径形如
    {module}/src/main/ets/{file}（entry / ohos_library 等），匹配参考清单。
    """
    exclude = exclude or EXCLUDED_GENERATED_FILES
    results: list[dict] = []
    roots = src_roots or [ets_root]
    for root in roots:
        if not os.path.isdir(root):
            continue
        # root 形如 .../{module}/src/main/ets；rel 基准为 {module} 的父目录，
        # 使 rel 形如 {module}/src/main/ets/{file}
        root_norm = root.replace(os.sep, "/")
        if root_norm.endswith("/src/main/ets"):
            module_dir = root_norm[: -len("/src/main/ets")]
            full_base = module_dir.rsplit("/", 1)[0] if "/" in module_dir else ""
        else:
            full_base = project_root or ets_root
        if not full_base:
            full_base = project_root or ets_root
        for rdir, _dirs, files in os.walk(root):
            for fn in files:
                if not fn.endswith(".ets") or fn in exclude:
                    continue
                fpath = os.path.join(rdir, fn)
                rel = os.path.relpath(fpath, full_base)
                with open(fpath, encoding="utf-8", errors="replace") as f:
                    lines = f.readlines()
                for lineno, line in enumerate(lines, start=1):
                    stripped = line.strip()
                    if stripped.startswith(_COMMENT_PREFIXES):
                        continue
                    if any(kw in stripped for kw in _DATA_LINE_KEYWORDS):
                        continue
                    for label in rules.match_line(line):
                        candidates = rules.candidates_for(label)
                        kb_files = kb.match_kb_files(candidates)
                        results.append({
                            "api": label,
                            "file": rel,
                            "line": lineno,
                            "snippet": stripped[:120],
                            "kbSources": kb_files,
                        })
    return dedup_results(results)


def dedup_results(results: list[dict]) -> list[dict]:
    seen = set()
    out = []
    for r in results:
        key = (r["api"], r["file"], r["line"])
        if key in seen:
            continue
        seen.add(key)
        out.append(r)
    return out


# ---------------------------------------------------------------------------
# C/C++ 原生代码扫描
# ---------------------------------------------------------------------------
_CPP_COMMENT_PREFIXES = ("//", "*", "/*", "#")


def scan_cpp(cpp_roots: list[str], rules: RuleEngine, kb: KnowledgeBase,
             exclude: set[str] | None = None,
             full_base_for: dict[str, str] | None = None) -> list[dict]:
    """逐文件逐行扫描 C/C++ 源码，返回原生 API 使用记录。

    与 scan_ets 对 ArkTS 的处理平行：用 NATIVE_API_RULES 逐行匹配
    OH_*/napi_*/OHOS_* 标识符与原生头 #include，每条命中产出一条使用记录
    （api=标签，file=rel，line=行号，snippet=源码行，kbSources=KB 命中）。
    rel 路径形如 {module}/src/main/cpp/{file}（与 ets 侧定位对齐）。
    """
    exclude = exclude or set()
    full_base_for = full_base_for or {}
    results: list[dict] = []
    for root in cpp_roots:
        if not os.path.isdir(root):
            continue
        root_norm = root.replace(os.sep, "/")
        full_base = full_base_for.get(root_norm, root)
        for rdir, _dirs, files in os.walk(root):
            for fn in files:
                if not fn.endswith(CPP_EXTS) or fn in exclude:
                    continue
                fpath = os.path.join(rdir, fn)
                rel = os.path.relpath(fpath, full_base)
                with open(fpath, encoding="utf-8", errors="replace") as f:
                    lines = f.readlines()
                for lineno, line in enumerate(lines, start=1):
                    stripped = line.strip()
                    if stripped.startswith(_CPP_COMMENT_PREFIXES):
                        continue
                    for label in rules.match_line(line):
                        candidates = rules.candidates_for(label)
                        kb_files = kb.match_kb_files(candidates)
                        # C++ 侧 snippet 取标识符所在行原文（截断 120）
                        results.append({
                            "api": label,
                            "file": rel,
                            "line": lineno,
                            "snippet": stripped[:120],
                            "kbSources": kb_files,
                            "language": "C++",
                        })
    return dedup_results(results)


class Scanner:
    def __init__(self, project: str = DEFAULT_PROJECT,
                 sdk_root: str = DEFAULT_SDK_ROOT,
                 knowledge_root: str = DEFAULT_KNOWLEDGE_ROOT,
                 out_dir: str = DEFAULT_OUT_DIR,
                 ets_src_rel: str = ETS_SRC_REL,
                 cpp_src_rel: str = CPP_SRC_REL,
                 from_api_version: int = 12,
                 to_api_version: int = 26,
                 rules_extra_path: str | None = None,
                 use_ai: bool = False,
                 use_review: bool = True,
                 scan_cpp: bool = True,
                 result_filename: str | None = None,
                 aux_dir: str | None = None):
        self.project = os.path.abspath(project)
        self.sdk_root = sdk_root
        self.knowledge_root = knowledge_root
        self.out_dir = out_dir
        self.ets_src_rel = ets_src_rel
        self.cpp_src_rel = cpp_src_rel
        # 发现工程内全部 src/main/ets 源码根（entry / ohos_library / 其它模块），
        # 覆盖三方库多模块结构。回退到单一 ets_src_rel 保持向后兼容。
        self.src_roots = self._discover_src_roots()
        self.ets_root = self.src_roots[0] if self.src_roots else os.path.join(self.project, ets_src_rel)
        # C/C++ 原生源码根发现（entry/ohos_library 等模块的 src/main/cpp）
        self.scan_cpp_enabled = scan_cpp
        self.cpp_src_roots: list[str] = []
        self.cpp_full_base_for: dict[str, str] = {}
        if scan_cpp:
            self.cpp_src_roots, self.cpp_full_base_for = self._discover_cpp_src_roots()
        self.from_api_version = from_api_version
        self.to_api_version = to_api_version
        self.rules_extra_path = rules_extra_path
        self.use_ai = use_ai
        self.use_review = use_review
        # 扁平输出：主结果文件 output/{result_filename}，辅助文件 output/{aux_dir}/
        self.result_filename = result_filename
        self.aux_dir = aux_dir

    def _discover_src_roots(self) -> list[str]:
        """发现工程内所有 {module}/src/main/ets 源码根（排除 oh_modules/build/.cxx）。

        三方库常把库源码放在与 demo 工程同级的 ohos_library/ 目录：
        若工程根未覆盖该目录，则向上查父级目录的同名 ohos_library（及工程同名库目录），
        以匹配参考清单中 ohos_library\\src\\main\\ets\\... 形式的位置。
        设置 self.src_roots 为全部源码根（含同级 ohos_library）。
        """
        roots = self._walk_src_roots(self.project)
        # 补充：父级目录下的 ohos_library（库源码常与 demo 工程同级）
        parent = os.path.dirname(self.project)
        sibling_lib = os.path.join(parent, "ohos_library") if parent and parent != self.project else ""
        has_ohos_lib = any("ohos_library" in r.replace(os.sep, "/") for r in roots)
        if not has_ohos_lib and sibling_lib and os.path.isdir(sibling_lib):
            roots.extend(self._walk_src_roots(sibling_lib))
        # 去重并稳定排序
        return sorted(set(roots))

    @staticmethod
    def _walk_src_roots(project: str) -> list[str]:
        skip = {"oh_modules", "build", ".cxx", ".preview", "node_modules", ".git"}
        roots = []
        if not os.path.isdir(project):
            return roots
        for root, dirs, _files in os.walk(project):
            dirs[:] = [d for d in dirs if d not in skip]
            if os.path.basename(root) == "ets" and root.replace(os.sep, "/").endswith("src/main/ets"):
                roots.append(root)
        return roots

    # ------------------------------------------------------------------
    # C/C++ 原生源码根发现
    # ------------------------------------------------------------------
    def _discover_cpp_src_roots(self) -> tuple[list[str], dict[str, str]]:
        """发现工程内所有 {module}/src/main/cpp 源码根，返回 (roots, full_base_for)。

        rel 基准与 ets 侧一致：{module} 的父目录，使 rel 形如
        {module}/src/main/cpp/{file}。同级 ohos_library 同样纳入。
        """
        roots = self._walk_cpp_src_roots(self.project)
        parent = os.path.dirname(self.project)
        sibling_lib = os.path.join(parent, "ohos_library") if parent and parent != self.project else ""
        has_ohos_lib = any("ohos_library" in r.replace(os.sep, "/") for r in roots)
        if not has_ohos_lib and sibling_lib and os.path.isdir(sibling_lib):
            roots.extend(self._walk_cpp_src_roots(sibling_lib))
        roots = sorted(set(roots))
        # 为每个 root 计算其 rel 基准（full_base），与 ets 侧一致
        full_base_for: dict[str, str] = {}
        for root in roots:
            root_norm = root.replace(os.sep, "/")
            if root_norm.endswith("/src/main/cpp"):
                module_dir = root_norm[: -len("/src/main/cpp")]
                full_base = module_dir.rsplit("/", 1)[0] if "/" in module_dir else self.project
            else:
                full_base = self.project
            full_base_for[root_norm] = full_base or self.project
        return roots, full_base_for

    @staticmethod
    def _walk_cpp_src_roots(project: str) -> list[str]:
        """遍历发现 .../src/main/cpp 目录（排除 build/.cxx/oh_modules 等产物）。"""
        if not os.path.isdir(project):
            return []
        roots = []
        for root, dirs, _files in os.walk(project):
            dirs[:] = [d for d in dirs if d not in CPP_SKIP_DIRS]
            if os.path.basename(root) == "cpp" and root.replace(os.sep, "/").endswith("src/main/cpp"):
                roots.append(root)
        return roots

    # ------------------------------------------------------------------
    def run(self) -> dict:
        print("=" * 66)
        print("hoscanner — HarmonyOS 三方库升级 API 变更扫描")
        print(f"  工程        : {self.project}")
        print(f"  源码目录    : {self.ets_root}")
        if self.scan_cpp_enabled:
            print(f"  C++ 源码目录: {', '.join(self.cpp_src_roots) or '(未发现 src/main/cpp)'}")
        print(f"  SDK 根目录  : {self.sdk_root}")
        print(f"  知识库根目录: {self.knowledge_root}")
        print(f"  升级窗口    : API {self.from_api_version} → {self.to_api_version}")
        print("=" * 66)

        # 1) 知识库
        kb = KnowledgeBase(self.knowledge_root)
        print(f"[1/6] 知识库索引：{kb.total_kb_files} 个文件，"
              f"{len(kb.kb_index)} 个关键词，{len(kb.dedup_records())} 条去重变更记录")
        if kb.errors:
            print("  ! 解析出错：", kb.errors)

        # 2) 规则扫描（多源码根，rel 形如 {module}/src/main/ets/{file} → 匹配参考清单）
        rules = RuleEngine(DEFAULT_RULES, extra_rules_path=self.rules_extra_path)
        usages = scan_ets(self.ets_root, rules, kb, src_roots=self.src_roots)
        unique_apis = {u["api"] for u in usages}
        files_scanned = {u["file"] for u in usages}
        print(f"[2/6] API 使用扫描：{len(usages)} 条记录，{len(unique_apis)} 个唯一 API，"
              f"{len(files_scanned)} 个文件（{len(self.src_roots)} 个源码根）")

        # 3) 调用图谱（词法分析，多源码根）
        analyses = analyze_src_roots(self.src_roots or [self.ets_root],
                                     self.project, exclude=EXCLUDED_GENERATED_FILES)
        print(f"[3/6] 调用图谱：{len(analyses)} 个文件分析完成")

        # 3.5) C/C++ 原生代码扫描（NAPI / HarmonyOS Native）
        cpp_usages: list[dict] = []
        cpp_analyses: list = []
        if self.scan_cpp_enabled:
            from .api_rules import NATIVE_API_RULES as _NATIVE_RULES
            from .cpp_parser import analyze_cpp_src_roots
            cpp_rules = RuleEngine(_NATIVE_RULES)
            cpp_usages = scan_cpp(self.cpp_src_roots, cpp_rules, kb,
                                  full_base_for=self.cpp_full_base_for)
            cpp_analyses = analyze_cpp_src_roots(
                self.cpp_src_roots, full_base_for=self.cpp_full_base_for)
            cpp_apis = {u["api"] for u in cpp_usages}
            cpp_files = {u["file"] for u in cpp_usages}
            print(f"[3.5/6] C++ 原生扫描：{len(cpp_usages)} 条记录，{len(cpp_apis)} 个唯一原生 API，"
                  f"{len(cpp_files)} 个文件（{len(self.cpp_src_roots)} 个源码根）")

        # 4) 升级变更匹配（调用图谱 + 规则 usages ∩ KB）
        api_candidates = {label: rules.candidates_for(label) for label in unique_apis}
        matcher = ChangeMatcher(kb, api_candidates,
                                file_analyses=analyses, usages=usages,
                                cpp_file_analyses=cpp_analyses, cpp_usages=cpp_usages)
        change_report = matcher.build_report(usages, self.from_api_version, self.to_api_version)
        print(f"[4/6] 升级变更匹配：系统 API 变更 {len(change_report.system_changes)} 条，"
              f"行为变更 {len(change_report.behavior_changes)} 条")

        # 4.5) 变更条目审查（降低误报）：LLM 审查，失败回退确定性启发式
        review_stats = None
        if self.use_review:
            from .review_agent import review_report
            review_stats = review_report(change_report, use_llm=self.use_ai)
            print(f"[4.5/6] 变更审查：共 {review_stats['total']} 条 —— "
                  f"真实 {review_stats['verified']} / 误报 {review_stats['false_positive']} / "
                  f"存疑 {review_stats['review']}（LLM: {'开' if review_stats['llm_used'] else '关/回退'}）")
            change_report.review_stats = review_stats

        # 5) 报告
        os.makedirs(self.out_dir, exist_ok=True)
        # 扁平输出：主结果文件 + 辅助目录
        if self.result_filename:
            result_path = os.path.join(self.out_dir, self.result_filename)
        else:
            result_path = os.path.join(self.out_dir, "change_report.json")
        aux = os.path.join(self.out_dir, self.aux_dir) if self.aux_dir else self.out_dir
        os.makedirs(aux, exist_ok=True)

        api_usage_json = gen_api_usage_json(usages, kb.all_kb_files,
                                            os.path.join(aux, "api_usage.json"))
        gen_api_usage_md(usages, kb.all_kb_files,
                         os.path.join(aux, "api_usage.md"))
        call_graph = gen_call_graph_json(analyses,
                                         os.path.join(aux, "api_call_graph.json"))
        # C++ 专属报告
        cpp_usage_json = None
        cpp_call_graph = None
        if self.scan_cpp_enabled:
            cpp_usage_json = gen_cpp_api_usage_json(
                cpp_usages, kb.all_kb_files,
                os.path.join(aux, "cpp_api_usage.json"))
            gen_cpp_api_usage_md(cpp_usages, kb.all_kb_files,
                                 os.path.join(aux, "cpp_api_usage.md"))
            cpp_call_graph = gen_cpp_call_graph_json(
                cpp_analyses, os.path.join(aux, "cpp_call_graph.json"))
        gen_change_report_json(change_report, result_path)
        gen_change_report_md(change_report,
                             os.path.join(aux, "change_report.md"))
        # DevEcoAPIScan 兼容 CSV（12 列结构化报告）
        csv_summary = gen_change_report_csv(
            change_report, os.path.join(aux, "change_report.csv"))

        # 6) AI 升级建议（未配置 LLM 时回退到确定性规则建议）
        advisor = UpgradeAdvisor(change_report, call_graph=call_graph, use_llm=self.use_ai)
        advice_md = advisor.generate()
        with open(os.path.join(aux, "upgrade_advice.md"), "w",
                  encoding="utf-8") as f:
            f.write(advice_md)
        print("[5/6] AI 升级建议已生成（LLM 模式: %s）" % ("开" if advisor._llm_available() else "关/回退"))

        summary = api_usage_json["summary"]
        coverage = summary["kbCoverage"]
        print("-" * 66)
        print(f"输出目录: {self.out_dir}")
        print(f"  {self.result_filename or 'change_report.json':<22} —— 升级变更清单（系统 {len(change_report.system_changes)} + "
              f"行为 {len(change_report.behavior_changes)}）")
        if self.aux_dir:
            print(f"  {self.aux_dir}/api_usage.json     —— API 使用记录（{summary['totalApiUsages']} 条 / "
                  f"{summary['uniqueApis']} 个唯一 API / {summary['filesScanned']} 个文件）")
            print(f"  {self.aux_dir}/api_call_graph.json—— API 调用图谱（{call_graph['summary']['systemApis']} 个系统 API / "
                  f"{call_graph['summary']['systemApiCallSites']} 个调用点）")
            print(f"  {self.aux_dir}/change_report.csv  —— DevEcoAPIScan 兼容 CSV（{csv_summary['rows']} 行，12 列）")
            if self.scan_cpp_enabled:
                cs = cpp_usage_json["summary"] if cpp_usage_json else {"totalApiUsages": 0, "uniqueApis": 0, "filesScanned": 0}
                cgs = cpp_call_graph["summary"] if cpp_call_graph else {"nativeApis": 0, "nativeApiCallSites": 0}
                print(f"  {self.aux_dir}/cpp_api_usage.json —— C++ 原生 API 使用记录（{cs['totalApiUsages']} 条 / "
                      f"{cs['uniqueApis']} 个唯一 API / {cs['filesScanned']} 个文件）")
                print(f"  {self.aux_dir}/cpp_call_graph.json—— C++ 调用图谱（{cgs['nativeApis']} 个原生 API / "
                      f"{cgs['nativeApiCallSites']} 个调用点）")
        print(f"知识库覆盖：{coverage['directApiMatch'] + coverage['dataLayerOnly']}/"
              f"{coverage['totalKbFiles']} 文件（直接匹配 {coverage['directApiMatch']}，"
              f"数据层 {coverage['dataLayerOnly']}）")
        print("=" * 66)
        return {
            "apiUsage": usages,
            "apiUsageJson": api_usage_json,
            "callGraph": call_graph,
            "changeReport": change_report,
            "cppUsage": cpp_usages,
            "cppUsageJson": cpp_usage_json,
            "cppCallGraph": cpp_call_graph,
        }


def run_scan(**kwargs) -> dict:
    return Scanner(**kwargs).run()


def main(argv: list[str] | None = None):
    import argparse

    parser = argparse.ArgumentParser(
        prog="hoscanner",
        description="HarmonyOS 三方库升级 API 变更扫描工具")
    parser.add_argument("--project", default=DEFAULT_PROJECT,
                        help=f"目标工程根目录（默认 {DEFAULT_PROJECT}）")
    parser.add_argument("--sdk-root", default=DEFAULT_SDK_ROOT,
                        help=f"DevEco Studio SDK 根目录（默认 {DEFAULT_SDK_ROOT}）")
    parser.add_argument("--knowledge-root", default=DEFAULT_KNOWLEDGE_ROOT,
                        help=f"知识库根目录（默认 {DEFAULT_KNOWLEDGE_ROOT}）")
    parser.add_argument("--out", dest="out_dir", default=DEFAULT_OUT_DIR,
                        help="报告输出目录")
    parser.add_argument("--ets-src", dest="ets_src_rel", default=ETS_SRC_REL,
                        help="工程内 ETS 源码相对路径（默认 entry/src/main/ets）")
    parser.add_argument("--cpp-src", dest="cpp_src_rel", default=CPP_SRC_REL,
                        help=f"工程内 C/C++ 原生源码相对路径（默认 {CPP_SRC_REL}）")
    parser.add_argument("--no-cpp", dest="scan_cpp", action="store_false",
                        help="跳过 C/C++ 原生代码扫描（默认启用）")
    parser.add_argument("--from", dest="from_api_version", type=int, default=12,
                        help="源 API 版本（默认 12）")
    parser.add_argument("--to", dest="to_api_version", type=int, default=26,
                        help="目标 API 版本（默认 26）")
    parser.add_argument("--rules", dest="rules_extra_path", default=None,
                        help="额外的规则 JSON 文件（可选）")
    parser.add_argument("--ai", dest="use_ai", action="store_true",
                        help="启用 LLM 升级建议（需配置 HOSCANNER_LLM_BASE_URL / API_KEY）")
    args = parser.parse_args(argv)

    Scanner(**vars(args)).run()


if __name__ == "__main__":
    main()
