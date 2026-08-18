#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
run_testset_local.py —— 本地测试集批量扫描驱动

与 run_testset.py 同逻辑，TESTSET 指向 D:\\Projects\\APIScanUtil\\testSet，
源码路径来自每个项目的 扫描项目路径.txt（指向 D:\\Projects\\APIScanUtil\\thirdLibrary\\...）。

输出：
  output/{项目名}_scan_result.json   —— 主结果（扁平 changeList + 结构化明细）
  output/{项目名}/                    —— 辅助文件（api_usage / call_graph / advice）
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

DEFAULT_FROM = 12
DEFAULT_TO = 26


def discover_projects() -> list[str]:
    out = []
    if not os.path.isdir(TESTSET):
        return out
    for name in sorted(os.listdir(TESTSET)):
        d = os.path.join(TESTSET, name)
        if os.path.isdir(d):
            out.append(name)
    return out


def read_project_path(proj_dir: str) -> str:
    for fname in ("项目路径.txt", "扫描项目路径.txt"):
        p = os.path.join(proj_dir, fname)
        if os.path.isfile(p):
            with open(p, encoding="utf-8") as f:
                line = f.readline().strip()
            return line.strip().strip('"').strip("'").strip()
    return ""


def gt_count(proj_dir: str) -> int:
    files = glob.glob(os.path.join(proj_dir, "*_apiChange.json"))
    if not files:
        return 0
    try:
        data = json.load(open(files[0], encoding="utf-8"))
        return len(data) if isinstance(data, list) else 0
    except Exception:
        return 0


def main():
    from hoscanner.scanner import Scanner

    projects = discover_projects()
    os.makedirs(OUTPUT, exist_ok=True)
    print("=" * 70)
    print("hoscanner 测试集批量扫描（本地路径）")
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
        except Exception as e:
            print(f"[{name}] 读取项目路径失败: {e}")
            rows.append((name, "路径错误", 0, 0, 0, gt_count(proj_dir)))
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
        except Exception:
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
