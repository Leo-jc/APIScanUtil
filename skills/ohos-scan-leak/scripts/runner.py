"""DevEco Studio 发现与扫描引擎调度。"""

from __future__ import annotations

import asyncio
import json
import logging
import os
import shutil
import signal
import subprocess
import sys
import time
from pathlib import Path

log = logging.getLogger("codescanner.runner")

# ---------------------------------------------------------------------------
# Python 可执行文件发现
# ---------------------------------------------------------------------------

_resolved_python: str | None = None


def _test_python_exe(exe: str, *args: str) -> bool:
    """测试一个 Python 可执行文件是否能正常工作（退出码 0）。"""
    try:
        result = subprocess.run(
            [exe, *args, "-c", "import sys; print(sys.version)"],
            capture_output=True,
            timeout=15,
            text=True,
        )
        return result.returncode == 0
    except Exception:
        return False


def find_python_exe() -> str:
    """查找可用的 Python 可执行文件。

    Windows 上 python/python3 可能异常退出（退出码 49），
    而 py -3 Launcher 通常正常工作。按优先级搜索：
    1. 当前进程 (sys.executable)
    2. py -3 (Windows Python Launcher)
    3. python3 / python
    """
    global _resolved_python
    if _resolved_python is not None:
        return _resolved_python

    candidates: list[tuple[str, list[str]]] = []

    # 1. 当前进程
    if sys.executable:
        candidates.append((sys.executable, []))

    # 2. Windows Python Launcher
    if os.name == "nt":
        py_exe = shutil.which("py")
        if py_exe:
            candidates.append((py_exe, ["-3"]))

    # 3. python3 / python
    for name in ("python3", "python"):
        found = shutil.which(name)
        if found:
            candidates.append((found, []))

    for exe, extra_args in candidates:
        if _test_python_exe(exe, *extra_args):
            _resolved_python = exe
            log.info("[python] 使用 %s%s", exe, f" {' '.join(extra_args)}" if extra_args else "")
            return exe

    # 回退：如果都不可用，返回 sys.executable（可能有问题但至少不会 None）
    _resolved_python = sys.executable or "python"
    log.warning("[python] 未找到可正常工作的 Python，回退到 %s", _resolved_python)
    return _resolved_python

# ---------------------------------------------------------------------------
# DevEco Studio 路径发现
# ---------------------------------------------------------------------------

_CANDIDATE_DEVECO_ROOTS: list[Path] = (
    [
        Path("D:\\DevEcoStudio"),
        Path("C:\\Program Files\\Huawei\\DevEcoStudio"),
        Path("C:\\Program Files (x86)\\Huawei\\DevEcoStudio"),
        Path("C:\\DevEcoStudio"),
        Path.home() / "AppData" / "Local" / "Huawei" / "DevEcoStudio",
        Path.home() / "DevEcoStudio",
    ]
    if os.name == "nt"
    else [
        Path("/opt/DevEcoStudio"),
        Path("/usr/local/DevEcoStudio"),
        Path.home() / "DevEcoStudio",
        Path("/Applications/DevEcoStudio.app/Contents"),
    ]
)


def load_config(skill_root: Path) -> dict:
    p = skill_root / "config.json"
    if p.is_file():
        try:
            return json.loads(p.read_text("utf-8"))
        except Exception as exc:
            log.error("[config] config.json 解析失败: %s", exc)
    return {}


def find_deveco_root() -> Path | None:
    for candidate in _CANDIDATE_DEVECO_ROOTS:
        if candidate.is_dir() and (candidate / "plugins" / "codescanner").is_dir():
            return candidate
    return None


def get_deveco_root(skill_root: Path) -> Path | None:
    cfg = load_config(skill_root)
    cfg_root = (cfg.get("devecoRoot") or "").strip() or None
    root = os.environ.get("DEVECO_ROOT") or cfg_root or find_deveco_root()
    if not root:
        log.error("[config] 未在任何已知位置找到 DevEco Studio。")
        log.error("[config] 请执行以下操作之一:")
        log.error("  1. 编辑 config.json 设置 devecoRoot 为 DevEco Studio 安装路径")
        log.error("  2. 设置环境变量: DEVECO_ROOT=<path>")
        log.error("[config] 已搜索: %s", ", ".join(str(p) for p in _CANDIDATE_DEVECO_ROOTS))
    return Path(root) if root else None


def get_plugin_root(skill_root: Path) -> Path | None:
    root = get_deveco_root(skill_root)
    return root / "plugins" / "codescanner" if root else None


def get_default_sdk_path(skill_root: Path) -> Path | None:
    root = get_deveco_root(skill_root)
    return root / "sdk" if root else None


def resolve_sdk_path(sdk_path: Path) -> Path:
    """验证并修正 SDK 路径，确保 Homeflow 能正确解析。

    Homeflow 要求 SDK 路径指向包含 default/openharmony/ets 子目录结构的
    上层目录（如 D:\\DevEcoStudio\\sdk），而不是指向 default/ 或 openharmony/ 子目录。

    修正逻辑：向上回溯直到找到包含 "default/" 子目录的目录，
    因为 Homeflow 需要在该路径下找到 default/openharmony/ets 结构。
    """
    # 向上回溯：找到包含 default/ 子目录的最深路径
    # 正确层级：sdk/ 包含 default/ 和/或 openharmony/
    # 过深层级：sdk/default/ 包含 openharmony/ — 仍然不是顶层
    # 过深层级：sdk/default/openharmony/ 包含 ets/ — 不是顶层

    current = sdk_path

    # 首先检查路径是否已经是有效顶层（包含 default/ 且不直接是 default/ 本身的子目录）
    if (current / "default" / "openharmony" / "ets").is_dir():
        # 这就是 Homeflow 需要的层级
        log.info("[sdk] SDK 路径验证通过: %s", current)
        return current

    # 向上回溯，寻找包含 default/openharmony/ets 的路径
    for _ in range(6):  # 最多回溯 6 层
        if (current / "default" / "openharmony" / "ets").is_dir():
            log.warning("[sdk] SDK 路径过深，自动修正: %s → %s", sdk_path, current)
            print(f"Warning: SDK 路径过深，已自动修正为: {current}")
            return current
        parent = current.parent
        if parent == current:
            break
        current = parent

    # 如果找不到完整结构，尝试宽松匹配：包含 default/ 目录即可
    current = sdk_path
    for _ in range(6):
        if (current / "default").is_dir():
            log.warning("[sdk] SDK 路径修正（宽松匹配）: %s → %s", sdk_path, current)
            print(f"Warning: SDK 路径已修正为: {current}")
            return current
        parent = current.parent
        if parent == current:
            break
        current = parent

    # 无法修正
    log.warning("[sdk] SDK 路径结构无法识别: %s，Homeflow 可能无法工作", sdk_path)
    print(f"Warning: SDK 路径结构无法识别: {sdk_path}")
    print("  Homeflow 要求 SDK 路径指向包含 default/openharmony/ets 子目录的上层目录")
    print("  正确示例: D:\\DevEcoStudio\\sdk")
    return sdk_path


def get_cpp_agent_exe(skill_root: Path) -> Path | None:
    pr = get_plugin_root(skill_root)
    if not pr:
        return None
    exe_name = "codescanner-cpp.exe" if os.name == "nt" else "codescanner-cpp"
    return pr / "cpp-agent" / "release" / exe_name


def get_homeflow_cli(skill_root: Path) -> Path | None:
    pr = get_plugin_root(skill_root)
    return pr / "homeflow" / "dist" / "cli" / "index.js" if pr else None


# ---------------------------------------------------------------------------
# 子进程执行
# ---------------------------------------------------------------------------


async def run_process(
    cmd: list[str],
    *,
    timeout_ms: int = 600_000,
    cwd: Path | None = None,
) -> dict:
    start = time.monotonic()
    timed_out = False

    try:
        proc = await asyncio.create_subprocess_exec(
            *cmd,
            stdin=asyncio.subprocess.DEVNULL,
            stdout=asyncio.subprocess.PIPE,
            stderr=asyncio.subprocess.PIPE,
            cwd=cwd,
        )
    except Exception as exc:
        return {
            "success": False,
            "error": str(exc),
            "stdout": "",
            "stderr": "",
            "duration_ms": 0,
            "timed_out": False,
        }

    try:
        stdout_bytes, stderr_bytes = await asyncio.wait_for(
            proc.communicate(), timeout=timeout_ms / 1000
        )
    except asyncio.TimeoutError:
        timed_out = True
        if os.name == "nt":
            proc.kill()
        else:
            proc.send_signal(signal.SIGTERM)
            try:
                await asyncio.wait_for(proc.communicate(), timeout=3)
            except asyncio.TimeoutError:
                proc.kill()
                await proc.communicate()
        stdout_bytes = b""
        stderr_bytes = b""

    duration_ms = int((time.monotonic() - start) * 1000)
    code = proc.returncode

    return {
        "success": code == 0 and not timed_out,
        "exitCode": code,
        "stdout": stdout_bytes.decode("utf-8", errors="replace"),
        "stderr": stderr_bytes.decode("utf-8", errors="replace"),
        "duration_ms": duration_ms,
        "timed_out": timed_out,
    }


# ---------------------------------------------------------------------------
# 扫描引擎
# ---------------------------------------------------------------------------


async def run_homeflow(
    *,
    project_path: Path,
    sdk_path: Path,
    output_dir: Path,
    log_dir: Path,
    timeout_ms: int,
    skill_root: Path,
) -> dict:
    cli_path = get_homeflow_cli(skill_root)
    report_path = output_dir / "homeflow.sarif"

    if not cli_path or not cli_path.is_file():
        return {
            "success": False,
            "toolId": "homeflow",
            "error": f"Homeflow CLI 未找到{(': ' + str(cli_path)) if cli_path else ''}",
        }

    node_exe = shutil.which("node")
    if not node_exe:
        return {
            "success": False,
            "toolId": "homeflow",
            "error": "node 可执行文件未找到，请确保 Node.js 已安装并在 PATH 中",
        }

    cmd = [
        node_exe,
        "--max-old-space-size=16384",
        str(cli_path),
        "--projectPath", str(project_path),
        "--sdkPath", str(sdk_path),
        "--reportFilePath", str(report_path),
        "--logPath", str(log_dir),
    ]

    print("[homeflow] 启动 ArkTS 资源泄漏分析...")
    result = await run_process(cmd, timeout_ms=timeout_ms)
    result.update(
        toolId="homeflow",
        name="Homeflow (ArkTS)",
        reportPath=str(report_path) if report_path.is_file() else None,
    )
    return result


async def run_cpp_agent(
    *,
    project_path: Path,
    scope: Path,
    output_dir: Path,
    log_dir: Path,
    timeout_ms: int,
    skill_root: Path,
) -> dict:
    exe_path = get_cpp_agent_exe(skill_root)
    report_path = output_dir / "codescanner-cpp.sarif"

    if not exe_path or not exe_path.is_file():
        return {
            "success": False,
            "toolId": "cpp-agent",
            "error": f"codescanner-cpp 未找到{(': ' + str(exe_path)) if exe_path else ''}",
        }
    if not scope.is_dir():
        return {
            "success": False,
            "toolId": "cpp-agent",
            "error": f"Scope 路径不存在: {scope}",
        }

    cmd = [
        str(exe_path),
        f"--scope={scope}",
        f"--project-root={project_path}",
        "--reporter=sarif",
        "--checkers=MemoryAndResourceLeakChecker",
        f"--reportFilePath={report_path}",
        f"--logPath={log_dir / 'codescanner-cpp.log'}",
    ]

    print("[cpp-agent] 启动 C/C++ 内存泄漏分析...")
    result = await run_process(cmd, timeout_ms=timeout_ms)
    result.update(
        toolId="cpp-agent",
        name="CodeScanner C++",
        reportPath=str(report_path) if report_path.is_file() else None,
    )
    return result


async def run_scan(
    *,
    project_path: Path,
    sdk_path: Path | None,
    output_dir: Path,
    no_arkts: bool,
    no_cpp: bool,
    timeout_ms: int,
    skill_root: Path,
) -> dict:
    if not sdk_path:
        sdk_path = get_default_sdk_path(skill_root)
    if not sdk_path:
        return {
            "results": [],
            "error": "SDK 路径未解析，请先配置 DevEco Studio 路径。",
        }

    # 验证并修正 SDK 路径
    sdk_path = resolve_sdk_path(sdk_path)

    log_dir = output_dir / "logs"
    log_dir.mkdir(parents=True, exist_ok=True)
    output_dir.mkdir(parents=True, exist_ok=True)

    tasks: list[asyncio.Task] = []
    if not no_arkts:
        tasks.append(
            asyncio.create_task(
                run_homeflow(
                    project_path=project_path,
                    sdk_path=sdk_path,
                    output_dir=output_dir,
                    log_dir=log_dir,
                    timeout_ms=timeout_ms,
                    skill_root=skill_root,
                )
            )
        )
    if not no_cpp:
        tasks.append(
            asyncio.create_task(
                run_cpp_agent(
                    project_path=project_path,
                    scope=project_path,
                    output_dir=output_dir,
                    log_dir=log_dir,
                    timeout_ms=timeout_ms,
                    skill_root=skill_root,
                )
            )
        )

    if not tasks:
        print("无扫描引擎启用。使用 --no-arkts 和 --no-cpp 控制。")
        return {"results": []}

    print(f"\n启动 {len(tasks)} 个引擎扫描...\n")
    results = await asyncio.gather(*tasks)

    for r in results:
        tid = r.get("toolId", "?")
        if r.get("success"):
            print(f"[{tid}] 完成，耗时 {r['duration_ms'] / 1000:.1f}s")
        elif r.get("timed_out"):
            print(f"[{tid}] 超时，耗时 {r['duration_ms'] / 1000:.1f}s", file=sys.stderr)
        else:
            err_msg = r.get("error") or f"exit code {r.get('exitCode')}"
            print(f"[{tid}] 失败: {err_msg}", file=sys.stderr)
            stderr_text = r.get("stderr", "").strip()
            if stderr_text:
                for line in stderr_text.splitlines()[-5:]:
                    print(f"  {line}", file=sys.stderr)

    return {"results": results, "sdkPath": str(sdk_path), "outputDir": str(output_dir), "logDir": str(log_dir)}
