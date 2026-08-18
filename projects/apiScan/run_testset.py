#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
run_testset.py —— 测试集批量扫描驱动

扁平输出约定：
  output/{项目名}_scan_result.json   —— 主结果（升级变更清单）
  output/{项目名}/                    —— 辅助文件（api_usage / call_graph / advice）

自动发现 testSet 下每个项目子目录：
  * 读取 项目路径.txt（或 扫描项目路径.txt）取源码路径；
  * 对真实变更清单 *_apiChange.json 保持盲扫（扫描器不读取，仅最后比对用）。

注：与 run_testset_local.py 仅 TESTSET 路径不同；如需切换测试集位置，
    修改下方 TESTSET 或复制为 run_testset_local.py 改指向其它盘符。
"""
import glob
import json
import os
import sys
import traceback

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

HERE = os.path.dirname(os.path.abspath(__file__))
TESTSET = r"D:\Projects\APIScanUtil\testSet"
OUTPUT = os.path.join(HERE, "output")
KNOWLEDGE = os.path.join(HERE, "knowledge")

# 默认升级窗口（API 12 → 26，覆盖 5.0.1(13) ~ 7.0.0(26) 全部变更）
DEFAULT_FROM = 12
DEFAULT_TO = 26


def discover_projects() -> list[str]:
    """发现 testSet 下所有含 项目路径.txt 的项目子目录。"""
    out = []
    if not os.path.isdir(TESTSET):
        return out
    for name in sorted(os.listdir(TESTSET)):
        d = os.path.join(TESTSET, name)
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
    from hoscanner.scanner import Scanner

    projects = discover_projects()
    os.makedirs(OUTPUT, exist_ok=True)
    print("=" * 70)
    print("hoscanner 测试集批量扫描")
    print(f"  测试集  : {TESTSET}")
    print(f"  输出目录: {OUTPUT}")
    print(f"  知识库  : {KNOWLEDGE}")
    print(f"  升级窗口: API {DEFAULT_FROM} → {DEFAULT_TO}")
    print(f"  项目数  : {len(projects)} —— {projects}")
    print("=" * 70)

    rows = []
    for name in projects:
        proj_dir = os.path.join(TESTSET, name)
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
                from_api_version=DEFAULT_FROM,
                to_api_version=DEFAULT_TO,
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
