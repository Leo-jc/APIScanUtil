#!/usr/bin/env python3
"""CodeScanner CLI - 调用 DevEco Studio 内置代码扫描能力。

退出码说明：
  0 — 扫描成功，未发现 critical/high 级别问题
  1 — 扫描失败（所有引擎失败、路径错误等）
  2 — 扫描成功，但发现 critical 或 high 级别问题
"""

from __future__ import annotations

import argparse
import asyncio
import json
import os
import shutil
import subprocess
import sys
import time
from pathlib import Path

SKILL_ROOT = Path(__file__).resolve().parent.parent

sys.path.insert(0, str(Path(__file__).resolve().parent))

from runner import run_scan, get_default_sdk_path, find_python_exe
from parser import parse_sarif, merge_sarif_files
from formatter import format_markdown_report


def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(
        prog="code-scanner",
        description="Local CodeScanner - Reuse DevEco Studio code scanning capabilities",
        epilog=(
            "退出码: 0=成功无高危问题, 1=扫描失败, 2=成功但发现 critical/high 问题"
        ),
    )
    p.add_argument("-p", "--project", required=True, help="Path to the project to scan")
    p.add_argument("-s", "--sdk", help="Path to SDK directory")
    p.add_argument("-o", "--output", help="Output directory for results (default: <project>/code-scanner-results)")
    p.add_argument("--no-arkts", action="store_true", help="Disable ArkTS resource leak scanning (homeflow)")
    p.add_argument("--no-cpp", action="store_true", help="Disable C/C++ memory leak scanning (cpp-agent)")
    p.add_argument("--no-table", action="store_true", help="Disable console table output (accepted, no effect)")
    p.add_argument("--detail", action="store_true", help="Show detailed issue information (accepted, no effect)")
    p.add_argument("-t", "--timeout", type=int, default=600, help="Per-engine timeout in seconds (default: 600)")
    return p


def _atomic_write(path: Path, content: str) -> None:
    tmp = path.with_suffix(path.suffix + ".tmp")
    try:
        tmp.write_text(content, "utf-8")
        os.replace(str(tmp), str(path))
    except BaseException:
        tmp.unlink(missing_ok=True)
        raise


async def main() -> int:
    args = build_parser().parse_args()

    # 启动时探测并记录 Python 可执行文件
    python_exe = find_python_exe()
    print(f"  Python:   {python_exe}")

    project_path = Path(args.project).resolve()
    sdk_path = Path(args.sdk).resolve() if args.sdk else None
    output_dir = Path(args.output).resolve() if args.output else project_path / "code-scanner-results"
    timeout_ms = max(1, args.timeout) * 1000

    if not project_path.is_dir():
        print(f"Error: 项目路径不存在: {project_path}", file=sys.stderr)
        return 1

    # Git 仓库可用性检测
    git_available = False
    try:
        result = subprocess.run(
            ["git", "rev-parse", "--is-inside-work-tree"],
            capture_output=True, text=True, cwd=str(project_path), timeout=10,
        )
        git_available = result.returncode == 0
    except Exception:
        pass
    if not git_available:
        print(f"  Warning: 项目不是 Git 仓库，阶段二将无法搜索 Git 历史模式")
        print(f"  (路径: {project_path})\n")

    if not sdk_path:
        sdk_path = get_default_sdk_path(SKILL_ROOT)
    if not sdk_path or not sdk_path.is_dir():
        print(f"Error: SDK 路径不存在: {sdk_path or '(未解析)'}", file=sys.stderr)
        print("  设置 DEVECO_ROOT 环境变量、编辑 config.json、或使用 --sdk 参数。", file=sys.stderr)
        return 1

    output_dir.mkdir(parents=True, exist_ok=True)

    arkts_enabled = not args.no_arkts
    cpp_enabled = not args.no_cpp
    engines = []
    if arkts_enabled:
        engines.append("Homeflow (ArkTS)")
    if cpp_enabled:
        engines.append("CodeScanner C++")

    print("\n  CodeScanner - Local Scan")
    print("  ─────────────────────────")
    print(f"  Project:  {project_path}")
    print(f"  SDK:      {sdk_path}")
    print(f"  Output:   {output_dir}")
    print(f"  Timeout:  {args.timeout}s per engine")
    print(f"  Engines:  {', '.join(engines)}")
    print("")

    scan_start = time.monotonic()

    scan_result = await run_scan(
        project_path=project_path,
        sdk_path=sdk_path,
        output_dir=output_dir,
        no_arkts=not arkts_enabled,
        no_cpp=not cpp_enabled,
        timeout_ms=timeout_ms,
        skill_root=SKILL_ROOT,
    )

    results = scan_result.get("results", [])
    log_dir = scan_result.get("logDir")
    scan_end = time.monotonic()

    failed_engines = [r for r in results if not r.get("success")]
    all_failed = len(failed_engines) == len(results) and len(results) > 0

    if all_failed:
        print("\n所有扫描引擎失败。详情:", file=sys.stderr)
        for r in failed_engines:
            if r.get("timed_out"):
                print(f"  [{r.get('toolId')}] 超时，耗时 {r.get('durationMs', 0) / 1000:.1f}s", file=sys.stderr)
            else:
                err_msg = r.get("error") or f"exit code {r.get('exitCode')}"
                print(f"  [{r.get('toolId')}] {err_msg}", file=sys.stderr)
        if log_dir:
            print(f"\n查看日志: {log_dir}\n", file=sys.stderr)
        # 仍然生成报告文件（包含引擎失败信息），而不是直接退出
        print("仍将生成包含引擎失败信息的报告文件...")
    elif failed_engines:
        print("\nWarning: 部分引擎失败:")
        for r in failed_engines:
            if r.get("timed_out"):
                print(f"  [{r.get('toolId')}] 超时，耗时 {r.get('durationMs', 0) / 1000:.1f}s")
            else:
                err_msg = r.get("error") or f"exit code {r.get('exitCode')}"
                print(f"  [{r.get('toolId')}] {err_msg}")
        print("")

    # 构建引擎元数据（无论成功/失败都记录）
    engine_durations = {}
    for r in results:
        tid = r.get("toolId")
        if tid and r.get("duration_ms") is not None:
            engine_durations[tid] = r["duration_ms"]

    metadata = {
        "projectPath": str(project_path),
        "sdkPath": str(sdk_path),
        "scanTime": time.strftime("%Y-%m-%dT%H:%M:%S.000Z", time.gmtime()),
        "totalDurationMs": int((scan_end - scan_start) * 1000),
        "engineDurations": engine_durations,
        "engineResults": [
            {
                "toolId": r.get("toolId"),
                "name": r.get("name") or r.get("toolId"),
                "success": r.get("success"),
                "timedOut": r.get("timed_out", False),
                "error": r.get("error"),
                "exitCode": r.get("exitCode"),
                "durationMs": r.get("duration_ms"),
            }
            for r in results
        ],
    }

    # 收集成功的报告文件，解析 SARIF
    report_files = [r["reportPath"] for r in results if r.get("success") and r.get("reportPath")]
    if report_files:
        merged_sarif = merge_sarif_files([Path(p) for p in report_files])
        for rp in report_files:
            try:
                src = Path(rp)
                dest = Path(log_dir) / src.name
                shutil.move(str(src), str(dest))
            except Exception as exc:
                print(f"Warning: 无法移动 {Path(rp).name} 到 logs: {exc}")
        try:
            parsed = parse_sarif(merged_sarif)
        except Exception as exc:
            print(f"SARIF 解析失败: {exc}", file=sys.stderr)
            parsed = {"issues": [], "engines": [], "summary": {"total": 0, "critical": 0, "high": 0, "medium": 0, "low": 0}}
    else:
        # 无 SARIF 报告（所有引擎失败或无输出）
        parsed = {"issues": [], "engines": [], "summary": {"total": 0, "critical": 0, "high": 0, "medium": 0, "low": 0}}

    parsed["metadata"] = metadata

    json_path = output_dir / "report.json"
    _atomic_write(json_path, json.dumps(parsed, indent=2, ensure_ascii=False))
    print(f"JSON report:  {json_path}")

    md_path = output_dir / "report.md"
    _atomic_write(md_path, format_markdown_report(parsed))
    print(f"MD report:    {md_path}")

    print("\nOutput files:")
    print(f"  {json_path}")
    print(f"  {md_path}")

    if not args.output:
        print('\n  Tip: Add "code-scanner-results/" to your .gitignore')

    if all_failed:
        print(f"  [X] 所有扫描引擎失败 (退出码=1)")
        print("")
        return 1
    if parsed["summary"].get("critical", 0) > 0 or parsed["summary"].get("high", 0) > 0:
        print(f"  [!] 发现 {parsed['summary'].get('critical', 0)} critical, "
              f"{parsed['summary'].get('high', 0)} high 级别问题 (退出码=2)")
        print("")
        return 2
    print("")
    return 0


if __name__ == "__main__":
    sys.exit(asyncio.run(main()))
