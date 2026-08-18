"""SARIF 解析与合并。"""

from __future__ import annotations

import json
import sys
from pathlib import Path
from urllib.parse import unquote


def file_uri_to_path(uri: str) -> str:
    if not uri or not uri.startswith("file:///"):
        return uri
    p = uri[len("file:///"):]
    if sys.platform == "win32":
        p = unquote(p).replace("/", "\\")
    else:
        p = "/" + unquote(p)
    return p


def _to_severity(level: str | None) -> str:
    match level:
        case "error":
            return "critical"
        case "warning":
            return "high"
        case "note":
            return "medium"
        case _:
            return "low"


def _extract_class(result: dict) -> tuple[str, str]:
    props = result.get("properties") or {}
    if props.get("className"):
        parts = props["className"].split(".")
        return props["className"], parts[-1]
    ll = (result.get("locations") or [{}])[0].get("logicalLocations") or [{}]
    if ll:
        first = ll[0]
        fqn = first.get("fullyQualifiedName")
        if fqn:
            name = first.get("name") or fqn.split(".")[-1]
            return fqn, name
    rule_id = result.get("ruleId", "")
    if rule_id:
        parts = rule_id.split(".")
        return rule_id, parts[-1]
    return "Unknown", "Unknown"


def _get_location(result: dict) -> dict:
    loc = (result.get("locations") or [{}])[0]
    phys = loc.get("physicalLocation") or {}
    artifact = phys.get("artifactLocation") or {}
    region = phys.get("region") or {}
    uri = artifact.get("uri", "")
    line = region.get("startLine", 0)
    col = region.get("startColumn")
    return {"file": file_uri_to_path(uri), "line": line, "column": col}


def _get_path_steps(result: dict) -> list[dict]:
    flows = result.get("codeFlows") or []
    if not flows:
        return []
    thread = (flows[0].get("threadFlows") or [{}])[0].get("locations") or []
    steps = []
    for idx, tfl in enumerate(thread):
        loc = tfl.get("location") or {}
        phys = loc.get("physicalLocation") or {}
        artifact = phys.get("artifactLocation") or {}
        region = phys.get("region") or {}
        msg = loc.get("message") or {}
        steps.append({
            "step": idx + 1,
            "file": file_uri_to_path(artifact.get("uri", "")),
            "line": region.get("startLine", 0),
            "message": msg.get("text") or f"Step {idx + 1}",
        })
    return steps


def _parse_result(result: dict, index: int) -> dict:
    class_name, simple_name = _extract_class(result)
    location = _get_location(result)
    return {
        "id": result.get("guid") or (result.get("fingerprints") or {}).get("primaryLocationLineHash") or f"issue-{index}",
        "ruleId": result.get("ruleId") or "unknown",
        "severity": _to_severity(result.get("level")),
        "className": class_name,
        "simpleName": simple_name,
        "description": (result.get("message") or {}).get("text", ""),
        "file": location["file"],
        "line": location["line"],
        "column": location["column"],
        "pathSteps": _get_path_steps(result),
    }


def parse_sarif(sarif: dict) -> dict:
    issues: list[dict] = []
    engines: list[str] = []

    runs = sarif.get("runs")
    if not runs or not isinstance(runs, list):
        return {"issues": issues, "engines": engines, "summary": {"total": 0}}

    for run in runs:
        engine_name = (run.get("tool") or {}).get("driver", {}).get("name", "Unknown")
        rules = ((run.get("tool") or {}).get("driver") or {}).get("rules") or []
        rule_map = {r["id"]: r for r in rules if "id" in r}
        engines.append(engine_name)

        for i, r in enumerate(run.get("results") or []):
            issue = _parse_result(r, i)
            rule = rule_map.get(issue["ruleId"], {})
            issue["ruleDescription"] = (rule.get("shortDescription") or {}).get("text") or (rule.get("fullDescription") or {}).get("text", "")
            issue["engine"] = engine_name
            issues.append(issue)

    summary = {
        "total": len(issues),
        "critical": sum(1 for i in issues if i["severity"] == "critical"),
        "high": sum(1 for i in issues if i["severity"] == "high"),
        "medium": sum(1 for i in issues if i["severity"] == "medium"),
        "low": sum(1 for i in issues if i["severity"] == "low"),
    }

    return {"issues": issues, "engines": engines, "summary": summary}


def parse_sarif_file(file_path: Path) -> dict:
    return parse_sarif(json.loads(file_path.read_text("utf-8")))


def merge_sarif_files(file_paths: list[Path]) -> dict:
    all_runs: list[dict] = []
    for fp in file_paths:
        if not fp:
            continue
        try:
            sarif = json.loads(fp.read_text("utf-8"))
            if sarif.get("runs"):
                all_runs.extend(sarif["runs"])
        except Exception as exc:
            print(f"读取 SARIF 文件失败 {fp}: {exc}", file=sys.stderr)
    return {
        "version": "2.1.0",
        "$schema": "https://json.schemastore.org/sarif-2.1.0.json",
        "runs": all_runs,
    }
