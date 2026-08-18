"""Markdown 报告生成。"""

from __future__ import annotations

from pathlib import Path


def format_markdown_report(parsed: dict) -> str:
    issues = parsed.get("issues", [])
    summary = parsed.get("summary", {})
    engines = parsed.get("engines", [])
    metadata = parsed.get("metadata")

    lines: list[str] = []

    lines.append("# CodeScanner Analysis Report")
    lines.append("")

    if metadata:
        lines.append("## Scan Info")
        lines.append("")
        lines.append(f"- **Project:** {metadata.get('projectPath', '')}")
        lines.append(f"- **SDK:** {metadata.get('sdkPath', '')}")
        lines.append(f"- **Scan Time:** {metadata.get('scanTime', '')}")
        lines.append(f"- **Total Duration:** {metadata.get('totalDurationMs', 0) / 1000:.1f}s")
        engine_durations = metadata.get("engineDurations")
        if engine_durations:
            dur_parts = [f"{k}: {v / 1000:.1f}s" for k, v in engine_durations.items()]
            lines.append(f"- **Engine Duration:** {', '.join(dur_parts)}")
        lines.append("")

    lines.append(f"**Engines:** {', '.join(engines)}")
    lines.append("")

    # 引擎执行状态（含失败/超时引擎说明）
    if metadata:
        engine_results = metadata.get("engineResults")
        if engine_results:
            failed_engines = [r for r in engine_results if not r.get("success")]
            if failed_engines:
                lines.append("## Engine Failures")
                lines.append("")
                for r in failed_engines:
                    tool = r.get("toolId") or r.get("name") or "unknown"
                    if r.get("timedOut"):
                        dur = r.get("durationMs", 0) / 1000
                        lines.append(f"- **{tool}**: Timed out after {dur:.1f}s")
                    else:
                        err = r.get("error") or f"exit code {r.get('exitCode', '?')}"
                        lines.append(f"- **{tool}**: {err}")
                    lines.append("")
            # 显示所有引擎的执行摘要
            lines.append("## Engine Summary")
            lines.append("")
            lines.append("| Engine | Status | Duration | Error |")
            lines.append("|--------|--------|----------|-------|")
            for r in engine_results:
                tool = r.get("toolId") or r.get("name") or "unknown"
                status = "OK" if r.get("success") else ("Timeout" if r.get("timedOut") else "Failed")
                dur = f"{r.get('durationMs', 0) / 1000:.1f}s"
                err = r.get("error") or ""
                if not r.get("success") and not err:
                    err = f"exit code {r.get('exitCode', '?')}"
                lines.append(f"| {tool} | {status} | {dur} | {err} |")
            lines.append("")

    lines.append(f"**Total Issues:** {summary.get('total', 0)}")
    lines.append("")

    if summary.get("total", 0) > 0:
        lines.append("## Severity Distribution")
        lines.append("")
        lines.append("| Severity | Count |")
        lines.append("|----------|-------|")
        lines.append(f"| Critical | {summary.get('critical', 0)} |")
        lines.append(f"| High     | {summary.get('high', 0)} |")
        lines.append(f"| Medium   | {summary.get('medium', 0)} |")
        lines.append(f"| Low      | {summary.get('low', 0)} |")
        lines.append("")

    if issues:
        lines.append("## Issue List")
        lines.append("")
        lines.append("| # | Severity | Rule | Class | File | Line | Description |")
        lines.append("|---|----------|------|-------|------|------|-------------|")
        for i, issue in enumerate(issues):
            file_name = Path(issue["file"]).name if issue.get("file") else ""
            desc = issue.get("description") or "-"
            lines.append(
                f"| {i + 1} | **{issue.get('severity', '').upper()}** "
                f"| {issue.get('ruleId', '')} "
                f"| {issue.get('simpleName', '')} "
                f"| {file_name} "
                f"| {issue.get('line', 0)} "
                f"| {desc} |"
            )
        lines.append("")

        lines.append("## Issue Details")
        lines.append("")
        for issue in issues:
            lines.append(f"### [{issue.get('severity', '').upper()}] {issue.get('simpleName', '')}")
            lines.append("")
            lines.append(f"- **Rule:** {issue.get('ruleId', '')}")
            col_part = f":{issue['column']}" if issue.get("column") else ""
            lines.append(f"- **File:** `{issue.get('file', '')}:{issue.get('line', 0)}{col_part}`")
            if issue.get("description"):
                lines.append(f"- **Detail:** {issue['description']}")
            if issue.get("ruleDescription"):
                lines.append(f"- **Info:** {issue['ruleDescription']}")
            if issue.get("engine"):
                lines.append(f"- **Engine:** {issue['engine']}")
            lines.append("")

            path_steps = issue.get("pathSteps") or []
            if path_steps:
                lines.append("**Data Flow:**")
                lines.append("")
                for step in path_steps:
                    lines.append(f"{step['step']}. `{step['file']}:{step['line']}` — {step['message']}")
                lines.append("")
    else:
        lines.append("No issues found.")
        lines.append("")

    return "\n".join(lines)
