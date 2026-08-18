#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
run_testset.py —— 测试集批量扫描驱动

扁平输出约定：
  {out}/{项目名}_scan_result.json   —— 主结果（升级变更清单）
  {out}/{项目名}/                    —— 辅助文件（api_usage / call_graph / advice）

自动发现 testSet 下每个项目子目录：
  * 读取 项目路径.txt（或 扫描项目路径.txt）取源码路径；
  * 对真实变更清单 *_apiChange.json 保持盲扫（扫描器不读取，仅最后比对用）。

测试集根目录解析优先级：--testset 参数 > APISCAN_TESTSET 环境变量 > config.json testsetPath。
"""
import argparse
import glob
import json
import os
import sys
import traceback

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

HERE = os.path.dirname(os.path.abspath(__file__))            # scripts/
SKILL_ROOT = os.path.dirname(HERE)                            # apiScan/
OUTPUT = os.path.join(SKILL_ROOT, "output")
KNOWLEDGE = os.path.join(SKILL_ROOT, "knowledge")

# 默认升级窗口（API 12 → 26，覆盖 5.0.1(13) ~ 7.0.0(26) 全部变更）
DEFAULT_FROM = 12
DEFAULT_TO = 26


def _load_skill_config() -> dict:
    p = os.path.join(SKILL_ROOT, "config.json")
    if os.path.isfile(p):
        try:
            with open(p, encoding="utf-8") as f:
                return json.load(f)
        except Exception:  # noqa: BLE001
            pass
    return {}


def _resolve_testset(cli_arg: str | None) -> str:
    """测试集根目录三级回退：--testset > APISCAN_TESTSET > config.json testsetPath。"""
    if cli_arg:
        return cli_arg
    env = os.environ.get("APISCAN_TESTSET")
    if env:
        return env
    cfg = _load_skill_config()
    ts = (cfg.get("testsetPath") or "").strip()
    if ts:
        return ts
    return ""


def discover_projects(testset: str) -> list[str]:
    """发现 testSet 下所有含 项目路径.txt 的项目子目录。"""
    out = []
    if not os.path.isdir(testset):
        return out
    for name in sorted(os.listdir(testset)):
        d = os.path.join(testset, name)
        if not os.path.isdir(d):
            continue
        out.append(name)
    return out


def read_project_path(proj_dir: str) -> str:
    """读取项目路径文件，剥离首尾引号。兼容 项目路径.txt / 扫描项目路径.txt。"""
    for fname in ("项目路径.txt", "扫描项目路径.txt"):
        p = os.path.join(proj_dir, fname)
        if os.path.isfile(p):
            with open(p, encoding="utf-8") as f:
                line = f.readline().strip()
            return line.strip().strip('"').strip("'").strip()
    return ""


def gt_count(proj_dir: str) -> int:
    """统计真实清单条目数（仅用于汇总展示，扫描器不读取）。"""
    files = glob.glob(os.path.join(proj_dir, "*_apiChange.json"))
    if not files:
        return 0
    try:
        data = json.load(open(files[0], encoding="utf-8"))
        return len(data) if isinstance(data, list) else 0
    except Exception:  # noqa: BLE001
        return 0


def main():
    ap = argparse.ArgumentParser(description="hoscanner 测试集批量扫描")
    ap.add_argument("--testset", default=None,
                    help="测试集根目录（默认读 APISCAN_TESTSET 环境变量或 config.json testsetPath）")
    ap.add_argument("--from", dest="from_api", type=int, default=DEFAULT_FROM,
                    help=f"源 API 版本（默认 {DEFAULT_FROM}）")
    ap.add_argument("--to", dest="to_api", type=int, default=DEFAULT_TO,
                    help=f"目标 API 版本（默认 {DEFAULT_TO}）")
    args = ap.parse_args()

    testset = _resolve_testset(args.testset)
    if not testset or not os.path.isdir(testset):
        print(f"Error: 测试集目录不存在: {testset or '(未配置)'}", file=sys.stderr)
        print("  请通过 --testset 参数、APISCAN_TESTSET 环境变量或 config.json testsetPath 指定", file=sys.stderr)
        return 1

    from hoscanner.scanner import Scanner

    projects = discover_projects(testset)
    os.makedirs(OUTPUT, exist_ok=True)
    print("=" * 70)
    print("hoscanner 测试集批量扫描")
    print(f"  测试集  : {testset}")
    print(f"  输出目录: {OUTPUT}")
    print(f"  知识库  : {KNOWLEDGE}")
    print(f"  升级窗口: API {args.from_api} → {args.to_api}")
    print(f"  项目数  : {len(projects)} —— {projects}")
    print("=" * 70)

    rows = []
    for name in projects:
        proj_dir = os.path.join(testset, name)
        try:
            src = read_project_path(proj_dir)
        except Exception as e:  # noqa: BLE001
            print(f"[{name}] 读取项目路径失败: {e}")
            rows.append((name, "路径错误", 0, 0, 0, 0))
            continue
        if not src or not os.path.isdir(src):
            print(f"[{name}] 源码目录不存在: {src}")
            rows.append((name, "源码缺失", 0, 0, 0, gt_count(proj_dir)))
            continue
        result_filename = f"{name}_scan_result.json"
        aux_dir = name
        try:
            s = Scanner(
                project=src,
                knowledge_root=KNOWLEDGE,
                out_dir=OUTPUT,
                from_api_version=args.from_api,
                to_api_version=args.to_api,
                use_ai=False,
                result_filename=result_filename,
                aux_dir=aux_dir,
            )
            res = s.run()
            cr = res["changeReport"]
            n_sys = len(cr.system_changes)
            n_beh = len(cr.behavior_changes)
            rows.append((name, "OK", n_sys, n_beh, n_sys + n_beh, gt_count(proj_dir)))
        except Exception:  # noqa: BLE001
            traceback.print_exc()
            rows.append((name, "异常", 0, 0, 0, gt_count(proj_dir)))

    print("\n" + "=" * 70)
    print("扫描汇总")
    print("-" * 70)
    print(f"{'项目':<24}{'状态':<8}{'系统':>6}{'行为':>6}{'合计':>6}{'清单':>6}")
    print("-" * 70)
    for name, status, ns, nb, tot, gt in rows:
        print(f"{name:<24}{status:<8}{ns:>6}{nb:>6}{tot:>6}{gt:>6}")
    print("=" * 70)
    return 0


if __name__ == "__main__":
    sys.exit(main())
