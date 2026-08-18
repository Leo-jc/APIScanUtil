---
name: api-scan
description: 扫描 HarmonyOS 三方库或应用在 OS 版本升级（API Level 升级）场景下涉及的系统 API 变更与行为变更，输出 API 调用图谱、升级变更清单和 AI 升级建议。适用于鸿蒙工程 SDK 升级兼容性评估、ArkTS 与 C/C++ 原生 API 变更定位、DevEcoAPIScan 兼容 CSV 产出、批量扫描测试集并校验召回率。
---

# HarmonyOS API 变更扫描

调用 `scripts/run_scanner.py` 对鸿蒙工程做离线 API 变更扫描：提取 ArkTS 与 C/C++ 原生 API 调用图谱，匹配 53 个变更清单知识库，在升级窗口 `(from, to]` 内产出系统 API 变更 + 行为变更清单，并生成 AI 升级建议。纯 Python 3.10+ 标准库实现，无第三方依赖；LLM 建议可选（缺省走确定性回退，可完全离线）。

## 触发场景

- HarmonyOS 三方库 / 应用 OS 版本升级（API Level 升级）前的 API 兼容性评估
- 定位工程在升级窗口内涉及的系统 API 变更与行为变更（UX 视觉布局等）
- 提取 ArkTS（`@kit`/`@ohos`）与 C/C++ 原生（`OH_*`/`napi_*`/`OHOS_*`）API 调用图谱
- 产出 DevEcoAPIScan 兼容 12 列 CSV，对接既有工具链
- 批量扫描测试集并校验召回率（回归验证）

## 工作流程

扫描由单步 CLI 完成，6 步内部流程（知识库索引 → ArkTS 规则扫描 → 调用图谱 → C++ 原生扫描 → 升级变更匹配+审查 → 报告+AI建议）在 `scripts/hoscanner/scanner.py` 的 `Scanner.run()` 中编排。

### 单工程扫描

在 skill 根目录下运行：

```bash
python scripts/run_scanner.py \
  --project "<目标工程根目录>" \
  --sdk-root "D:\Application\DevEco Studio\sdk\default" \
  --out output \
  --from 12 --to 26
```

完整 CLI 参数：

| 参数 | 说明 | 默认值 |
|------|------|--------|
| `--project` | 目标工程 / 三方库根目录（必填） | 无（`config.json` 不再默认指向某个 demo） |
| `--sdk-root` | DevEco Studio SDK 根目录 | 环境变量 `HOSCANNER_SDK_ROOT` > `config.json` sdkRoot > 空 |
| `--knowledge-root` | 知识库根目录 | `knowledge`（skill 根目录） |
| `--out` | 报告输出目录 | `output`（skill 根目录） |
| `--ets-src` | 工程内 ETS 源码相对路径 | `entry/src/main/ets` |
| `--cpp-src` | 工程内 C/C++ 原生源码相对路径 | `entry/src/main/cpp` |
| `--no-cpp` | 跳过 C/C++ 原生代码扫描（默认启用） | 默认启用 |
| `--from` | 源 API 版本 | `12` |
| `--to` | 目标 API 版本 | `26` |
| `--rules` | 自定义扫描规则 JSON（可选） | 内置 41 条 ArkTS + 4 条原生 C 接口规则 |
| `--ai` | 启用 LLM 升级建议（需配环境变量） | 关闭（走确定性回退） |

工程类型与扫描根：自动发现工程内所有 `{module}/src/main/ets` 和 `{module}/src/main/cpp` 源码根（entry / ohos_library / 其它模块），覆盖三方库多模块结构；同级 `ohos_library/` 自动纳入。

### 批量扫描测试集

```bash
python scripts/run_testset.py --testset <testSet根目录> [--from 12] [--to 26]
```

`--testset` 解析优先级：CLI 参数 > 环境变量 `APISCAN_TESTSET` > `config.json` testsetPath。自动发现 testSet 下每个项目子目录，读取 `项目路径.txt` 取源码路径，逐项目扫描。对真实变更清单 `*_apiChange.json` 保持盲扫（扫描器不读取，仅最后比对用）。

### 覆盖率回归

```bash
python assets/tests/compute_coverage.py     # 召回率 Recall（匹配键 api+codeLocation）
python assets/tests/coverage_to_md.py       # 覆盖率报告 Markdown 化
python assets/tests/compare_change_report.py # 逐项目 matched/missing/extra
python assets/tests/test_cpp_scan.py        # C++ 扫描功能测试
```

`assets/tests/` 下的 TESTSET 默认指向开发者本机路径，可通过环境变量 `APISCAN_TESTSET` 覆盖。`HERE` 两层 dirname 到 `assets/`，`OUTPUT` 指向 `assets/output/`（回归基线）。

## 输出文件清单

主结果（`--out` 目录）：`{项目名}_scan_result.json`（或默认 `change_report.json`）—— 扁平 changeList + 结构化明细。

辅助目录（`--out/{项目名}/`）：

| 文件 | 内容 |
|------|------|
| `api_usage.json` / `.md` | ArkTS API 使用记录（位置 / 片段 / 来源知识文件） |
| `api_call_graph.json` | ArkTS 调用图谱（文件 → 函数 → 系统 API 调用点） |
| `cpp_api_usage.json` / `.md` | C++ 原生 API 使用记录（`OH_*`/`napi_*`/`OHOS_*` + 原生头 include） |
| `cpp_call_graph.json` | C/C++ 调用图谱（文件 → 原生 API 调用点 + include） |
| `change_report.md` | 升级变更报告（按 API 分组，过滤 false_positive） |
| `change_report.csv` | DevEcoAPIScan 兼容 12 列 CSV |
| `upgrade_advice.md` | AI 升级评估与行动建议 |

字段结构详见 `references/output-files.md`。

## 环境要求

- **Python 3.10+**：仅标准库，无第三方依赖。Windows 环境下若 `python` 命令异常（退出码 49），使用 `py -3` 替代。
- **SDK 根目录**：通过 `--sdk-root` 参数 / `HOSCANNER_SDK_ROOT` 环境变量 / `config.json` sdkRoot 配置。SDK 仅用于识别系统 API 声明，扫描器本身不读取 SDK 文件。
- **知识库**：随 skill 分发（`knowledge/`，53 个 JSON 变更清单，覆盖 HarmonyOS 5.0.1(13) ~ 26.0.0(26)）。
- **可选 LLM**（OpenAI 兼容接口，用于 AI 升级建议与变更审查）：
  ```bash
  export HOSCANNER_LLM_BASE_URL="https://api.deepseek.com/v1"
  export HOSCANNER_LLM_API_KEY="sk-xxx"
  export HOSCANNER_LLM_MODEL="deepseek-chat"
  ```
  三者缺省或调用失败时走确定性规则回退，可完全离线运行。

## 已知限制

- C/C++ 扫描依赖状态机区域分析 + 三重校验，误报率低但非零（组件特化属性重载在调用点无组件线索时标 REVIEW，不静默丢弃）。技术细节见 `references/PROJECT_SUMMARY.md`。
- 知识库覆盖 53 个变更清单（API 12 → 26），新版本需更新 `knowledge/`。
- LLM 升级建议与变更审查为可选，未配置或失败时回退确定性规则（`references/PROJECT_SUMMARY.md`）。
- SDK 根路径仅用于打印/传递，扫描器不直接读取 SDK 文件，与 `ohos-scan-leak` 那种需要 SDK 内引擎的用途不同。

## 与同域其它 skill 的边界

- **本 skill（api-scan）**：离线静态扫描，提取调用图谱 + 匹配变更知识库，产出变更清单与 AI 建议。不调用 DevEco 编译器。
- `hmos-api-change-assistant`：调用 DevEco Studio 内置 `ApiScanUtil` 接口 + 编译实证（AST 级扫描 + hvigor 编译），产出 6 列变更清单 + Agent 复核。需要 DevEco 运行时。
- `ohos-scan-leak`：资源泄漏与无界增长扫描，与 API 变更无交集。

## 资源

- `references/README.md` —— 工具使用完整说明、CLI 参数表、输出文件清单（何时读取：需了解完整使用方式、输出格式时）
- `references/PROJECT_SUMMARY.md` —— 技术实现总结：6 步流程、C++ 状态机、变更匹配分层 T1-T7、噪声过滤（何时读取：需理解内部实现、排查匹配结果时）
- `references/output-files.md` —— 输出文件字段速查（何时读取：解析 JSON 字段、对接工具链时）
- `references/REDUNDANCY_ANALYSIS.md` —— 历史清理记录（何时读取：排查为何某文件被移除时）
- `assets/output/` —— 11 项目历史扫描结果 + coverage_report（召回率 100%，1543/1543）（何时读取：回归对比、验证功能不变性时）
- `assets/tests/` —— 覆盖率校验脚本 + C++ fixtures（何时读取：验证召回率、运行 C++ 测试时）
