# hoscanner — HarmonyOS 三方库升级 API 变更扫描工具

用于鸿蒙（HarmonyOS）三方库 / 应用进行 OS 版本升级时的 **API 调用图谱提取** 与
**系统 API 变更 / 行为变更清单扫描**。

## 功能

1. **API 使用记录（api_usage）** —— 规则引擎逐行扫描工程 `.ets` 源码，定位每个系统 API
   的使用位置（文件:行号）与代码片段，并交叉匹配系统 API 变更知识库。
2. **API 调用图谱（api_call_graph）** —— 轻量词法器独立解析源码：提取 `@kit / @ohos`
   导入、函数 / 方法 / 组件边界、每个系统 API 的调用点（调用者 → 被调 API、所属 Kit）。
3. **升级变更清单（change_report）** —— 在升级窗口 `(fromApiVersion, toApiVersion]` 内，
   从知识库 53 个变更清单文件中筛出本工程涉及的系统 API 变更（接口定义 / 行为 / 废弃 /
   新增等）与行为变更（UX 视觉布局等），按 API 分组输出。
4. **C/C++ 原生代码扫描（cpp_api_usage / cpp_call_graph）** —— 对工程 `entry/src/main/cpp`
   下的 C/C++ 原生源码做词法分析，提取 `#include` 依赖与 HarmonyOS Native 接口调用点
   （`OH_*` / `napi_*` / `OHOS_*`），识别原生头文件与 C/C++ 函数边界，产出原生 API 使用
   记录与调用图谱，并纳入升级变更匹配（变更条目标注 `语言: C++`）。可用 `--no-cpp` 跳过。

   **关键技术（移植自 DevEcoAPIScan CppCodeScanner）**：
   * 状态机区域分析（CODE / COMMENT / STRING）—— 给源码每个字符打区域标签，
     API 命中必须在 CODE 区域内，避免注释/字符串中的 API 名误报；
   * 三重校验（check_region + check_pre_char + check_next_char）——
     独立标识符（前驱非字母数字下划线，排除 `MyOH_Foo` 子串）+ 后跟 `(`（函数调用
     而非类型/变量引用），大幅降低误报率。
5. **AI 升级建议（upgrade_advice）** —— 汇总高影响变更（删除 / 废弃 / 行为变更 / UX 变更）
   与分版本分布；可选接入 OpenAI 兼容 LLM 生成自然语言评估（未配置时回退到确定性规则建议）。

## 环境

- Python 3.10+（仅标准库，无第三方依赖）
- DevEco Studio SDK（用于识别系统 API 声明，`--sdk-root`）
- 系统 API 变更知识库（`knowledge/`，53 个 JSON 变更清单，随仓库分发）

## 使用

```bash
# 直接运行（在 skill 根目录下；路径按本机实际位置填写）
python scripts/run_scanner.py \
  --project "<目标工程根目录>" \
  --sdk-root "D:\Application\DevEco Studio\sdk\default" \
  --out output \
  --from 12 --to 26

# 或作为模块（需在 scripts/ 目录下运行）
cd scripts && python -m hoscanner --project <path> --out <dir> [--ets-src ohos_library/src/main/ets] [--ai]
```

| 参数 | 说明 | 默认值 |
|------|------|--------|
| `--project` | 目标工程 / 三方库根目录（必填） | 无（经 `--project` 显式传入） |
| `--sdk-root` | DevEco Studio SDK 根目录 | 环境变量 `HOSCANNER_SDK_ROOT` > `config.json` sdkRoot > 空 |
| `--knowledge-root` | 知识库根目录 | `knowledge`（skill 根目录） |
| `--out` | 报告输出目录 | `output`（skill 根目录） |
| `--ets-src` | 工程内 ETS 源码相对路径 | `entry/src/main/ets` |
| `--cpp-src` | 工程内 C/C++ 原生源码相对路径 | `entry/src/main/cpp` |
| `--no-cpp` | 跳过 C/C++ 原生代码扫描（默认启用 C++ 扫描，加该参数跳过） | 默认启用 |
| `--from` / `--to` | 源 / 目标 API 版本 | `12` / `26` |
| `--rules` | 自定义扫描规则 JSON（可选） | 内置 41 条 ArkTS 规则 + 4 条原生 C 接口规则 |
| `--ai` | 启用 LLM 升级建议（需配环境变量） | 关闭 |

LLM 环境变量（可选，OpenAI 兼容接口）：

```bash
export HOSCANNER_LLM_BASE_URL="https://api.deepseek.com/v1"
export HOSCANNER_LLM_API_KEY="sk-xxx"
export HOSCANNER_LLM_MODEL="deepseek-chat"
```

## 输出

| 文件 | 内容 |
|------|------|
| `api_usage.json` | API 使用记录（summary + 每条 API 的位置 / 片段 / 来源知识文件） |
| `api_usage.md` | 可读 API 使用文档（与参考文档格式一致） |
| `api_call_graph.json` | API 调用图谱（文件 → 函数 → 系统 API 调用点） |
| `cpp_api_usage.json` | C++ 原生 API 使用记录（`OH_*`/`napi_*`/`OHOS_*` + 原生头 include） |
| `cpp_api_usage.md` | 可读 C++ 原生 API 使用文档 |
| `cpp_call_graph.json` | C/C++ 调用图谱（文件 → 原生 API 调用点 + include） |
| `change_report.json` | 升级变更清单（系统 API 变更 + 行为变更，按 API 分组，含语言分解） |
| `change_report.md` | 可读升级变更报告 |
| `change_report.csv` | DevEcoAPIScan 兼容 CSV（12 列：Api Name/Type/Path/Prefix/Params/Args/Invoke Method/Location/Key/Instance/ChangeId/MethodDefinition） |
| `upgrade_advice.md` | AI 升级评估与行动建议 |

## 测试与覆盖校验

批量扫描测试集（`testSet/` 下各项目），并校验扫描结果对真实变更清单的覆盖率：

```bash
# 批量扫描（输出 output/{项目名}_scan_result.json + output/{项目名}/ 辅助文件）
python scripts/run_testset.py --testset <testSet根目录>

# 覆盖率校验（召回率 Recall，匹配键 (api, codeLocation)，产出 coverage_report.json/md）
python assets/tests/compute_coverage.py
python assets/tests/coverage_to_md.py

# 快速对比（逐项目 matched/missing/extra，产出 comparison_aggregate.json）
python assets/tests/compare_change_report.py

# 参考文档覆盖校验（需提供参考 api_usage.json，docs/ 不随仓库分发）
python assets/tests/verify_coverage.py --scanned output/{项目}/api_usage.json --reference <参考 api_usage.json>
```

当前测试集 11 个项目，整体召回率 100%（命中 1543 / 真实清单 1543，缺失 0）。
覆盖率口径详见 `assets/output/coverage_report.md`。

## 目录结构

```
apiScan/
├── SKILL.md                # skill 入口文档
├── config.json             # 外部化配置（sdkRoot / testsetPath / 默认升级窗口）
├── knowledge/              # 系统 API 变更知识库（53 个 JSON，只读）
├── scripts/                # 可执行代码
│   ├── run_scanner.py      # 单工程命令行入口
│   ├── run_testset.py      # 测试集批量扫描驱动
│   └── hoscanner/          # 工具包（独立实现，仅标准库）
│       ├── __main__.py     # python -m hoscanner 入口
│       ├── config.py      # 路径 / 常量（读 config.json）
│       ├── kb_index.py    # 知识库索引（53 个变更清单文件）
│       ├── api_rules.py   # 扫描规则引擎（内置 41 条 ArkTS 规则 + 4 条原生 C 接口规则）
│       ├── ets_parser.py  # .ets 词法分析 → API 调用图谱
│       ├── cpp_parser.py  # C/C++ 词法分析 → 原生 API（OH_*/napi_*）调用图谱
│       ├── region_lexer.py # C/C++ 状态机区域分析 + 三重校验（移植自 DevEcoAPIScan CppCodeScanner）
│       ├── change_matcher.py # 升级窗口变更匹配（系统 API 变更 / 行为变更，ArkTS + C++）
│       ├── review_agent.py   # 变更条目审查（LLM 可选，确定性回退）
│       ├── report.py      # JSON / Markdown / CSV 报告生成（含 C++ 专属报告）
│       ├── ai_advisor.py  # AI 升级建议（LLM 可选，确定性回退）
│       └── scanner.py     # 扫描编排主流程
├── references/             # 文档
│   ├── README.md          # 本文件（工具使用完整说明）
│   ├── PROJECT_SUMMARY.md # 技术实现总结
│   ├── REDUNDANCY_ANALYSIS.md # 历史清理记录
│   └── output-files.md    # 输出文件字段速查
└── assets/                 # 只读参考数据
    ├── output/            # 11 项目历史扫描结果 + coverage_report（回归基线）
    └── tests/             # 覆盖率校验脚本 + C++ fixtures
```
