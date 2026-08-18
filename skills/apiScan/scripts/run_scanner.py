#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
run_scanner.py —— hoscanner 命令行入口（直接运行）

用法：
  python run_scanner.py --project <目标工程根目录>
                        --sdk-root "D:\\Application\\DevEco Studio\\sdk\\default"
                        --knowledge-root <knowledge 目录>
                        --out <输出目录>
                        --from 12 --to 26
"""
import sys

from hoscanner.scanner import main

if __name__ == "__main__":
    main(sys.argv[1:])
