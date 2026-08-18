#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
hoscanner —— HarmonyOS 三方库升级 API 变更扫描工具

对目标鸿蒙工程（应用 / 三方库源码）做 OS 版本升级时：

  1. 提取 API 调用图谱（哪些系统 API 被使用、调用位置、所属 @kit 模块、调用者函数）；
  2. 结合系统 API 变更知识库（本地 knowledge/ 下 53 个变更清单文件）
     扫描出升级过程中涉及的系统 API 变更与行为变更清单；
  3. 输出 api_usage / api_call_graph / change_report 三类报告（JSON + Markdown）。

本工具为独立实现：不依赖 DevEco Studio 内部编译产物，仅需源码与 SDK 声明路径。
"""
from .config import *
from .scanner import Scanner, run_scan, scan_cpp
from .ai_advisor import UpgradeAdvisor
from .cpp_parser import CppAnalyzer, analyze_cpp_project, analyze_cpp_src_roots
from .api_rules import NATIVE_API_RULES
