# hoscanner 冗余文件分析

> 分析日期：2026-08-13（已据此完成清理，见末尾"清理执行记录"）
> 分析范围：`projects/apiScan` 仓库全部文件
> 方法：通读全部源码、测试、输出产物与文档后，对照"是否被实际使用 / 是否重复 / 是否过时 / 是否应纳入版本管理"逐项判断。
> 审查：经子 agent 两轮审查通过（首轮指出 6 处遗漏并已修订，复审确认无遗留问题）。

## 一、项目结构概览

```
apiScan/
├── hoscanner/                  # 核心扫描包（仅标准库，无第三方依赖）
│   ├── __init__.py             # 包入口，导出公共 API
│   ├── __main__.py             # python -m hoscanner 入口
│   ├── config.py               # 路径与常量
│   ├── scanner.py              # 扫描编排主流程 + CLI main()
│   ├── kb_index.py             # 知识库索引（53 个变更清单）
│   ├── api_rules.py            # 规则引擎（41 条 ArkTS 规则 + 4 条原生 C 规则）
│   ├── ets_parser.py           # .ets 词法分析 → 调用图谱
│   ├── cpp_parser.py           # C/C++ 词法分析 → 原生 API 调用图谱
│   ├── change_matcher.py       # 升级窗口变更匹配
│   ├── review_agent.py         # 变更条目审查（LLM/启发式）
│   ├── ai_advisor.py           # AI 升级建议（LLM/确定性回退）
│   └── report.py               # JSON/Markdown 报告生成
├── run_scanner.py              # 单工程 CLI 入口
├── run_testset.py              # 批量扫描驱动（E:\ 盘测试集路径）
├── run_testset_local.py        # 批量扫描驱动（D:\ 盘本地路径）
├── knowledge/                  # 知识库（静态，只读）
│   ├── harmonyos_api_changes/        # 24 个系统 API 变更清单
│   └── harmonyos_behavior_changes/   # 29 个行为变更清单
├── tests/                      # 测试与校验脚本
├── output/                     # 扫描输出产物
├── README.md
└── REDUNDANCY_ANALYSIS.md      # 本文档
```

**确认事实**：
- 知识库共 **53** 个 JSON 文件（24 系统 + 29 行为），与 README/代码注释一致。
- `DEFAULT_RULES` 实际 **41** 条，`NATIVE_API_RULES` 实际 **4** 条（README 与代码注释一致）。
- 测试集（`D:\Projects\APIScanUtil\testSet`）当前含 **11** 个项目，覆盖率报告显示 100% 召回（1543/1543，缺失 0）。

## 二、冗余文件判断

按"处理方式"分五类。

### A. 应删除 —— 死代码 / 过时产物 / 重复

| 文件 | 判断 | 依据 |
|------|------|------|
| `hoscanner/__pycache__/*.pyc` | **冗余**，应忽略 | 编译产物，不应纳入版本管理。hoscanner 下 git 已跟踪 11 个 `.pyc`，且因源码改动已过时。应 `.gitignore` 忽略并从版本库移除（全仓库共 13 个：hoscanner 11 + 根目录 1 + tests 1）。 |
| `__pycache__/run_scanner.cpython-314.pyc` | **冗余**，应忽略 | 同上，根目录编译产物。 |
| `tests/__pycache__/*.pyc` | **冗余**，应忽略 | 同上。 |
| `tests/iteration_log.md` | **过时**，建议归档或删除 | 仅记录迭代 1–2（FluidLayout 单项目时期），内容已被 `improvement_report.md` 完全覆盖。testSet 已从 1 个项目增至 11 个，日志不再反映现状。 |
| `.idea/` | **冗余**，应忽略 | IDE 配置目录。git 未跟踪但出现在 untracked，应加入 `.gitignore`。 |

### B. 未被调用的公共 API（死代码，可清理）

以下函数被导出/定义但全仓库无调用方：

| 符号 | 定义位置 | 状态 |
|------|----------|------|
| `analyze_project()` | `ets_parser.py:696` | `scanner.py` import 它但实际用的是 `analyze_src_roots()`（第 286–287 行）。**import 死引用**，函数本身无调用方。 |
| `analyze_cpp_project()` | `cpp_parser.py:431` | 仅在 `__init__.py` 导出与 `test_cpp_scan.py` import；无实际调用（扫描器用 `analyze_cpp_src_roots()`）。 |
| `run_scan()` | `scanner.py:398` | 仅在 `__init__.py` 导出；无调用方（外部入口用 `Scanner.run()` 或 `main()`）。 |
| `gen_api_usage_md()` 的 `kb_scan_order` 参数 | `report.py:78` | 函数签名参数，全仓库无调用方传入该参数。 |
| `sdk_ets_api_dir(sdk_root)` | `config.py:56` | 全仓库（含 .py/.md）无调用方。 |
| `sdk_kit_dir(sdk_root)` | `config.py:61` | 全仓库（含 .py/.md）无调用方。 |

> 处理建议：上述函数若作为"库公共 API"保留供外部使用，可在文档标注为"公共 API"；否则可删除以减少维护面。`scanner.py:21` 对 `analyze_project` 的 import 是确定性的死引用，应移除。

### C. 功能重复 / 路径不一致 —— 需统一

| 文件组 | 问题 | 建议 |
|--------|------|------|
| `run_testset.py` vs `run_testset_local.py` | **逻辑近乎完全重复**（仅 `TESTSET` 路径与标题文案不同：`E:\Agent\huawei\testSet` vs `D:\Projects\APIScanUtil\testSet`）。 | 合并为一个脚本，`TESTSET` 路径改为 CLI 参数或环境变量，提供 `--testset` 选项。 |
| `tests/compare_change_report.py` vs `tests/compute_coverage.py` | **功能高度重叠**：两者都做"扫描结果 vs 真实清单 (api, codeLocation) 匹配 → matched/missing/extra → 聚合 JSON"。`compute_coverage.py` 是 `compare_change_report.py` 的增强版（多了召回率、缺失按类型分类、多余按 category 分类、缺口模式分析）。 | 保留 `compute_coverage.py` + `coverage_to_md.py`，删除 `compare_change_report.py`（其产出 `comparison_aggregate.json` 已被 `coverage_report.json` 覆盖）。或明确二者分工（前者快速对比、后者覆盖率报告），但当前二者口径几乎一致，重复维护。 |
| **TESTSET 路径不一致** | `run_testset.py` 与 `tests/compare_change_report.py` 硬编码 `E:\Agent\huawei\testSet`（**该路径不存在**，已迁移至 `D:\`）；`run_testset_local.py`、`tests/compute_coverage.py`、`tests/coverage_to_md.py` 用 `D:\Projects\APIScanUtil\testSet`。 | 全部统一为本地实际路径，或改为相对仓库可解析的路径。`run_testset.py` 与 `compare_change_report.py` 当前运行必失败（路径不存在）。 |
| **DEFAULT_PROJECT 过时路径** | `config.py:14` `DEFAULT_PROJECT = r"E:\Agent\huawei\projects\TestDemo"` 指向不存在的 E:\ 路径，且作为 `Scanner` 默认值与 README 参数表默认值，影响默认行为。 | 改为本地实际路径或要求 CLI 必传 `--project`。 |
| `output/comparison_aggregate.json` vs `output/coverage_report.json` | 由上述两套脚本分别产出，内容重叠。 | 统一为一份覆盖率报告。 |

### D. 过时文档内容 —— 需更新

| 文件 | 问题 | 建议 |
|------|------|------|
| `README.md` | (1) 参数表 `--rules` 写"内置 41 条规则"但未提 C++ 原生规则（4 条）；(2) `--no-cpp` 默认值标注"默认启用"语义含糊；(3) 引用 `E:\Agent\huawei\knowledge`、`E:\Agent\huawei\projects\...` 等不存在的旧绝对路径；(4) "测试与覆盖校验"小节引用 `docs/` 目录，**该目录不存在**（`verify_coverage.py` 默认参考路径 `docs/api_usage.json` 也指向不存在的 docs）；(5) 校验项数字（162 条、39 API、53/32/21）为旧 TestDemo 数据，与当前 11 项目测试集脱节。 | 更新路径为相对/本地路径；删除或修正 `docs/` 引用；更新规则数与覆盖说明。 |
| `tests/improvement_report.md` | 复现命令仍写 `cd E:\Agent\huawei\projects\apiScan`（路径不存在）；仅描述 FluidLayout 单项目结果。 | 更新路径与项目数；或降级为历史归档。 |
| `tests/iteration_log.md` | 见 A 类。 | 归档或删除。 |
| `run_testset.py:6` 注释 | 引用已删除的 `prompt.txt`（"遵循 prompt.txt 的扁平输出约定"）。 | 删除该注释引用，`prompt.txt` 已不存在。 |
| `hoscanner/report.py:96` | api_usage.md 模板硬编码 `scripts/generate_data.py`、`KnowledgeStore.ets`、`SCAN_ORDER` 等说明，属早期数据层方案的残留话术，与当前扫描器实际行为（直接扫描源码）不符（`report.py:39` 同有 `KnowledgeStore.ets` 引用）。 | 修正说明文案，移除对不存在脚本/数据层的引用。 |
| `hoscanner/config.py:17` 注释 | 注释"知识库两个目录（与 `scripts/generate_data.py / generate_docs.py` 约定一致）"属早期数据层方案残留，引用不存在的脚本。 | 移除残留脚本引用。 |
| `hoscanner/config.py:20` 注释数字 | 注释写"行为 / UX 变更清单（list 结构，**30** 个文件）"，实际为 **29** 个。 | 修正为 29。 |
| `tests/verify_coverage.py` docstring | docstring（:5-13）引用 `E:\Agent\huawei\projects\deepResearch\docs` 与 162 条/39 API/6 文件旧 TestDemo 数据，默认参考路径 `docs/api_usage.json`（:23）也不存在。 | 更新 docstring 路径与数字，与 README 同步处理（脚本本身支持 `--reference` 参数可用）。 |

### E. 应加入 .gitignore 的产物

仓库当前**没有 `.gitignore` 文件**。应创建，至少忽略：

```gitignore
__pycache__/
*.pyc
.idea/
.vscode/
output/          # 产物，可按需保留或忽略；当前已跟踪部分产物
_test_out_*/     # test_cpp_scan.py 产生的临时输出目录
```

> 注：`output/` 是否纳入版本管理取决于团队策略（当前部分产物已跟踪）。建议：保留 `output/` 中的覆盖率报告（`coverage_report.*`）作为基线证据，其余项目扫描产物按需忽略。

## 三、处理优先级

| 优先级 | 项 | 理由 |
|--------|----|------|
| P0 | 创建 `.gitignore` + 移除已跟踪的 `__pycache__`/`.idea` | 防止产物持续污染版本库 |
| P0 | 统一 `TESTSET` 路径（`run_testset.py`、`compare_change_report.py` 当前指向不存在的 `E:\` 路径，脚本无法运行） | 可用性阻断 |
| P1 | 合并 `run_testset.py` / `run_testset_local.py` | 消除重复维护 |
| P1 | 厘清 `compare_change_report.py` 与 `compute_coverage.py` 的去留 | 消除重复脚本 |
| P1 | 清理死代码：`scanner.py:21` 对 `analyze_project` 的 import；评估 `run_scan`/`analyze_cpp_project` 是否保留为公共 API | 降低维护面 |
| P2 | 更新 README 路径、规则数、`docs/` 引用、覆盖校验说明 | 文档准确性 |
| P2 | 修正 `report.py` 模板中的 `scripts/generate_data.py`/`KnowledgeStore` 残留话术 | 输出文案准确性 |
| P3 | 归档/删除 `iteration_log.md`、`improvement_report.md` 历史内容 | 减少过时信息 |

## 四、非冗余（确认保留）

以下经核查确属实际使用，**不应**误删：

- `hoscanner/` 全部模块（`config/scanner/kb_index/api_rules/ets_parser/cpp_parser/change_matcher/review_agent/ai_advisor/report`）：均被 `scanner.run()` 主流程调用。
- `knowledge/` 53 个 JSON：静态知识库，`kb_index.py` 实际加载。
- `tests/test_cpp_scan.py` + `tests/fixtures/cpp_sample/`：C++ 扫描功能测试与夹具，实际运行。
- `tests/verify_coverage.py`：参考文档覆盖校验（虽默认 `docs/` 路径不存在，但支持 `--reference` 参数覆盖，脚本本身可用）。
- `tests/compute_coverage.py` + `coverage_to_md.py`：当前覆盖率报告生成链，产出 `coverage_report.json/md`，11 项目 100% 召回。
- `run_scanner.py`：单工程 CLI 入口。

## 五、清理执行记录（2026-08-13）

依据上述分析完成清理，决策与执行情况：

| 项 | 处理 | 结果 |
|----|------|------|
| `.gitignore` | 新建，忽略 `__pycache__/`、`*.pyc`、`.idea/`、`.vscode/`、`_test_out_*/` | 已创建；`output/` 按决策保持现状不忽略 |
| 已跟踪的 13 个 `.pyc` | `git rm --cached` 从版本库移除（磁盘文件保留） | 已移除，后续由 `.gitignore` 忽略 |
| `analyze_project` 死 import | `scanner.py:21` 改为 import `analyze_src_roots`，并删除 run() 内重复的局部 import | 已清理 |
| `sdk_ets_api_dir()` / `sdk_kit_dir()` 死函数 | 从 `config.py` 删除 | 已删除（全仓库无调用方） |
| `run_scan` / `analyze_cpp_project` / `kb_scan_order` 参数 | 按决策保留为公共 API | 保留 |
| `TESTSET` 路径不一致 | `run_testset.py`、`tests/compare_change_report.py` 的 `E:\` 路径改为 `D:\Projects\APIScanUtil\testSet` | 已统一，脚本可运行 |
| `DEFAULT_PROJECT` 过时路径 | `config.py` 改为实际存在的 FluidLayout 源码路径 | 已修正 |
| `compare_change_report.py` vs `compute_coverage.py` | 按决策保留二者，在 `compare_change_report.py` 顶部注释明确分工 | 已加分工说明 |
| `iteration_log.md` / `improvement_report.md` | 按决策直接删除 | 已删除 |
| `prompt.txt` 残留注释 | `run_testset.py` docstring 移除引用 | 已清理 |
| `report.py` 残留话术 | `:39` note、`:96` 模板中 `scripts/generate_data.py`/`KnowledgeStore.ets`/`SCAN_ORDER` 改写为实际口径 | 已修正；重新运行 `run_testset_local.py` 刷新全部 11 项目 `output/*/api_usage.*` 产物，验证无残留 |
| `config.py` 残留注释 | `:17` 移除 `scripts/generate_data.py/generate_docs.py` 引用；`:20` "30 个文件" 改为 29；`_PKG_PARENT` 注释 `deepResearch/` 改为 `apiScan/` | 已修正 |
| README 过时内容 | 路径改为相对/本地、规则数补 C++ 4 条、`--no-cpp` 说明明确、删除 `docs/` 引用、覆盖校验更新为 11 项目 100% 召回、目录结构更新 | 已重写 |
| `verify_coverage.py` docstring | 移除 `E:\` 路径与 162/39/6 旧数据，说明默认 `docs/` 不随仓库分发 | 已修正 |
| `run_scanner.py` docstring | 移除 `E:\` 示例路径 | 已修正 |
| `kb_index.py` docstring | `E:\Agent\huawei\knowledge` → `knowledge_root`，`apiChange/` → `harmonyos_behavior_changes/` | 已修正 |
| `api_rules.py` / `kb_index.py` 残留脚本引用 | 移除 `scripts/generate_docs.py` / `generate_data.py` 引用 | 已修正 |

**验证**：
- `py_compile` 全部模块通过；`test_cpp_scan.py` 8/8 通过。
- 端到端扫描 FluidLayout 正常（系统 106 + 行为 143 = 249 条；知识库 53 文件）。
- `compare_change_report.py`（原 E:\ 路径失败）现 11 项目全部覆盖、缺失 0。
- `compute_coverage.py` 召回率 1543/1543 = 100%。

