# hoscanner 项目实现逻辑与核心技术总结

> 生成日期：2026-08-16
> 仓库路径：`E:\Agent\APIScanUtil\projects\apiScan`
> 适用版本：知识库 53 个变更清单 + 41 条 ArkTS 规则 + 4 条原生 C 接口规则 + 11 项目测试集（100% 召回，1543/1543）

---

## 一、项目定位

`hoscanner` 是面向 **HarmonyOS（鸿蒙）三方库 / 应用在 OS 版本升级场景**的 **API 调用图谱提取** 与 **系统 API 变更 / 行为变更清单扫描** 工具。

- **输入**：一个鸿蒙工程根目录（含 `entry/src/main/ets` 的 ArkTS 源码与 `entry/src/main/cpp` 的 C/C++ 原生源码）+ 系统 API 变更知识库（53 个 JSON）+ 升级版本窗口 `(from, to]`。
- **输出**：API 使用记录、调用图谱、升级变更清单（JSON / Markdown / CSV）、AI 升级建议。
- **依赖**：纯 Python 3.10+ 标准库（无第三方依赖），LLM 接入可选（OpenAI 兼容接口）。

工具整体对标 **DevEco Studio 内置的 APIScan 能力**，关键算法（C/C++ 状态机区域分析、三重校验、CSV 12 列格式）均与之对齐，目标是 **可批量、可离线、可程序化集成** 地复现并扩展其能力。

---

## 二、整体架构

```
                       ┌─────────────────────────────────────┐
                       │           scanner.Scanner           │  ← 编排主流程
                       │   (run() 6 步骤 + CLI main())       │
                       └───────────────┬─────────────────────┘
                                       │
        ┌──────────────┬───────────────┼───────────────┬──────────────┐
        ▼              ▼               ▼               ▼              ▼
   kb_index.py    api_rules.py    ets_parser.py    cpp_parser.py  change_matcher.py
   知识库索引     规则引擎(41)    ArkTS 词法       C++ 词法        升级窗口匹配
                  NATIVE_API_RULES 调用图谱         原生 API 调用图谱
                                       │               │
                                       └───────┬───────┘
                                               │
                                       region_lexer.py
                                       C/C++ 状态机区域分析
                                       + 三重校验（移植自
                                         DevEcoAPIScan CppCodeScanner）

                                  ┌────────────┴────────────┐
                                  ▼                         ▼
                              report.py                 ai_advisor.py
                              JSON/MD/CSV               LLM 建议 + 确定性回退
```

### 目录与模块职责

| 模块 | 职责 |
|------|------|
| `hoscanner/scanner.py` | `Scanner` 类 + `main()` CLI 入口，编排 6 步扫描流程 |
| `hoscanner/config.py` | 默认路径常量、源码相对路径、C++ 扩展名、排除目录、原生 API 前缀、知识库目录名兼容映射 |
| `hoscanner/kb_index.py` | 加载并索引 53 个变更清单 JSON，构建关键词索引 + 签名精确索引 |
| `hoscanner/api_rules.py` | ArkTS 规则引擎（41 条）+ 原生 C 接口规则（4 条） |
| `hoscanner/ets_parser.py` | .ets 词法分析 → API 调用图谱（导入、函数边界、调用点） |
| `hoscanner/cpp_parser.py` | C/C++ 词法分析 → 原生 API（`OH_*` / `napi_*` / `OHOS_*`）调用图谱 |
| `hoscanner/region_lexer.py` | C/C++ 状态机区域分析 + 三重校验（核心技术） |
| `hoscanner/change_matcher.py` | 升级窗口 `(from, to]` 变更匹配，按 API 分组、按语言分类 |
| `hoscanner/review_agent.py` | 变更条目审查与误报过滤（LLM 可选 + 启发式回退） |
| `hoscanner/report.py` | JSON / Markdown / CSV 报告生成（含 C++ 专属报告） |
| `hoscanner/ai_advisor.py` | AI 升级建议（LLM 可选 + 确定性规则回退） |
| `run_scanner.py` | 单工程 CLI 薄包装 |
| `run_testset.py` / `run_testset_local.py` | 批量扫描测试集驱动（仅 `TESTSET` 路径差异） |
| `knowledge/` | 24 个系统 API 变更 + 29 个行为变更清单（只读） |
| `tests/` | 覆盖率校验、对比、C++ 扫描功能测试 |

---

## 三、核心实现逻辑（扫描器编排 6 步）

`Scanner.run()` 主流程按以下顺序执行：

### Step 1：知识库索引
`KnowledgeBase._load()` 顺序加载 `knowledge/harmonyos_api_changes/`（24 个，dict）与 `knowledge/harmonyos_behavior_changes/`（29 个，dict 或兼容 list 结构）。构建三类索引：
- `kb_index`：关键词（API 类名 / 类名.接口名 / 接口名）→ 变更记录集合
- `sig_index`：归一化签名 → 变更记录集合，供 O(1) 精确匹配
- `file_meta` / `file_records`：文件元信息与变更条目

### Step 2：ArkTS 规则扫描（逐行正则）
`RuleEngine` 用内置 `DEFAULT_RULES`（41 条 `(label, pattern, kb_candidates)` 三元组）逐行 `.search` 匹配 `.ets` 源码，输出 API 使用记录（位置、片段、命中的知识库候选词）。自动跳过注释行、数据行。可通过 `--rules` 追加自定义规则 JSON。

### Step 3：ArkTS 调用图谱
`ets_parser.analyze_src_roots()` 自实现词法器（ident/num/str/punct/op，跳过 `//` `/* */` 模板串与转义），提取：
- `@kit.X` / `@ohos.*` 导入（经 `_KIT_ALIASES` 归一化为 kit 名）
- 函数 / 方法 / ArkUI 组件边界（`_ScopeTracker` 基于 brace-depth + paren-depth 启发式）
- 调用点（`name(.name)*` 链式 + 必须跟 `(` 才算调用）
- 分类 `_classify`：system / arkui_component / arkui_attribute / local

### Step 4：C/C++ 原生扫描（可选，默认开启）
`cpp_parser.analyze_cpp_src_roots()` 扫描 `src/main/cpp`：
- `#include` 依赖提取（正则 `#include\s*[<"]([^>"]+)[>"]`），按文件名模式分类为 Native 头 / 系统头 / 本地头
- 原生 API 调用点：`OH_*` / `napi_*` / `OHOS_*` 标识符，经 `region_lexer` 三重校验
- C/C++ 函数边界：`_CppScopeTracker` 维护 brace/paren 深度与栈，识别函数定义

可用 `--no-cpp` 跳过。

### Step 5：升级窗口变更匹配
`ChangeMatcher` 取 `usage ∩ 知识库`，按窗口 `from_api_version < apiVersion <= to_api_version`（左开右闭）筛选变更：
- 系统 API 变更：声明类（class/interface/declare）+ 方法签名变更 + 新增 / 删除 / 废弃
- 行为变更：`affectedApis` 命中调用点的，含 `interfaceChanges[]` 与 UX 视觉布局变化
- 噪声过滤：丢弃 Array/Map/Promise 原型方法等通用方法名
- 分层匹配：component_decl / commonmethod / method / ctor / field / class_decl / system 各有不同匹配规则，对齐 DevEcoAPIScan `isSameArkTsAPI`
- 按 API 分组 + 语言分类（ArkTS / C++），按 `(apiVersion, version)` 排序

### Step 6：审查、报告、AI 建议
- **review_report**：对变更条目做误报过滤（标记 `false_positive`、`[存疑]`），支持 LLM 审查（失败回退确定性启发式）
- **report.py**：写 JSON / Markdown / CSV（DevEcoAPIScan 兼容 12 列）
- **UpgradeAdvisor**：生成 `upgrade_advice.md`，LLM 可选（OpenAI 兼容接口），未配置则走确定性规则建议

---

## 四、核心技术

### 4.1 C/C++ 状态机区域分析 + 三重校验（移植自 DevEcoAPIScan CppCodeScanner）

**这是 C++ 扫描的关键技术，直接决定误报率**。

#### 4.1.1 四态状态机区域分析（`region_lexer.analyze_regions`）

对源码每个字符打区域标签，输出与源码等长的 `RegionType[]`。状态转移：

| 状态 | 进入条件 | 退出条件 | 标签 |
|------|----------|----------|------|
| **CODE** | 初始态 | 遇 `"` → STRING；遇 `//` → COMMENT（行）；遇 `/*` → COMMENT（块） | CODE |
| **SINGLE_LINE_COMMENT** | CODE 中遇 `//` | `src.find('\n', i)` 到行尾整段填 COMMENT，回 CODE | COMMENT |
| **MULTI_LINE_COMMENT** | CODE 中遇 `/*` | 逐字符填 COMMENT，遇 `*/` 后两字符均填 COMMENT 再回 CODE；未闭合 break | COMMENT |
| **STRING** | CODE 中遇 `"` | 逐字符填 STRING，遇未转义 `"` 回 CODE；`escape = (not escape) and (c == '\\')` 翻转转义 | STRING |

`split_lines` 手动遍历处理 `\r` / `\r\n` / `\n`，对齐 Java `\R` 语义，保留每行字符索引范围供行号反查。

#### 4.1.2 三重校验

| 校验 | 类型 | 逻辑 | 作用 |
|------|------|------|------|
| `check_region(region_types, idx)` | **硬门槛** | `region_types[idx] == CODE` | 排除注释 / 字符串中的 API 名误报 |
| `check_pre_char(src, idx)` | **硬门槛** | 前驱字符非 `[A-Za-z0-9_]` | 排除 `MyOH_Foo` 这类子串误报，确保是独立标识符 |
| `check_next_char(src, idx)` | **软校验** | 从 `idx+1` 跳过空白/控制字符，看下一非空字符是否 `(` | 区分函数调用（`is_call=True`）vs 类型/变量引用（`OH_NativeBuffer* buf`，`is_call=False`，避免覆盖率下降） |

`cpp_parser._extract_calls` 实际只强制前两项，第三项决定 `CallSite.is_call` 字段。

#### 4.1.3 原生 API 前缀识别

`config.NATIVE_API_PREFIXES = ("OH_", "napi_", "OHOS_")`。`_is_native_name(name)`：`napi_` 需小写开头；其余走 `name.startswith(...)`。`OHOS_` 涵盖旧版 C 宏 / 类型前缀。

#### 4.1.4 #include 提取与原生头识别

`tokenize` 把行首 `#` 开头整行（含 `\` 续行）收为 `pp` token。`_extract_includes` 用正则取头名，`os.path.basename` 取 base。分类：
- 命中 `_NATIVE_HEADER_RE`（`native_window|buffer|image|surface|vsync_\w+` / `oh_\w+` / `ark_\w+` / `napi(.h|/)` / `arkui_\w+` / `drawing_\w+`）或 base 为 `napi.h` / `arkui/native_interface.h` → `kit="Native"`
- 无路径且 `.h` → `kit="system"`
- 其余 → `kit=None`（本地 / 第三方头）

#### 4.1.5 C/C++ 函数边界识别

`_CppScopeTracker` 维护 `_brace_depth` / `_paren_depth` / `_stack` / `_pending`。`looks_like_function_def(idx)` 启发式：标识符（非关键字）→ 跟随 `::` 链取最末方法名 → 跳过 `<...>` 模板 → 匹配 `(...)` 括号配对 → 同行后接 `{`（允许中间 const/override/noexcept）即判为函数定义名。仅在 `_paren_depth==0` 且前驱非 `.` / `->` / `::` 且无 `_pending` 时识别。`)` 后若紧跟 `{` 设 `_pending=(name, brace_depth)`，待真正 `begin_brace` 才压栈作为 `current` caller；`}` 配对出栈。原生调用点的 `caller` 即取 `tracker.current`。

### 4.2 ArkTS 规则引擎 + 词法分析双层架构

**两层并行设计，互补而非替代**：

- **规则引擎层（`api_rules.py`，41 条）**：纯正则逐行匹配，快速产出 API 使用记录用于知识库交叉匹配。依赖 `\b` 词边界与 `\.method\b` 锚定。规则三元组 `(label, pattern, kb_candidates)`，可经 `--rules` 追加。
- **词法分析层（`ets_parser.py`）**：token 级结构化解析，避免误报——字符串 / 注释跳过；调用必须跟 `(`；前驱 `.` 跳过 `detect_function_head`（区分方法调用 vs 函数定义）；控制流关键字与 ArkUI 组件名排除；同一行返回类型注解不跨行扫描。

调用图谱数据结构：`FileAnalysis`（imports / call_sites / functions / field_types）→ `CallSite`（line / qualified / base / name / is_constructor / caller / kind / kit / is_chain_attr / chain_component）。

### 4.3 升级窗口变更匹配（对齐 DevEcoAPIScan `isSameArkTsAPI`）

- **窗口条件**：`from_api_version < apiVersion <= to_api_version`（左开右闭）
- **噪声过滤**：`_GENERIC_NOISE_METHOD_NAMES` 丢弃 Array / Map / Promise 原型方法与 `name/type/value/width` 等业务字段名；声明类（`declare class/const/interface`、`constructor(`）与携带 `cls` 的行为变更例外保留
- **分层匹配 `_match_use_points`**（按 `_record_category_hint`）：
  - `component_decl` → 组件构造点
  - `commonmethod` → 所有 `arkui_attribute` 点
  - `method` → 同名属性点（组件特化重载 `XAttribute/XModifier` 限定 `chain_component==X`）
  - `ctor` → `new X(`
  - `field` → 成员访问点 + `XOptions` → 组件构造行
  - `class_decl` → 引用点 + `this.field` 类型匹配
  - `system` → 符号索引命中
- **invokeInstance 二次过滤**：`XAttribute` / `XModifier` 映射组件名匹配 `chain_component`
- **分类**：`apiChange` / `harmonyos_behavior_changes` → `behavior_change`；其余 → `system_change`
- **分组 `per_api()`**：按 `api` 聚合，分 system/behavior 列表 + locations 集合，按 `(apiVersion, version)` 排序。去重键含 `codeLocation`，同一变更在不同使用行不合并

### 4.4 知识库索引与签名精确匹配

`KnowledgeBase` 构建三种索引：

- **关键词索引**（`kb_index`）：API 类用 `className`；行为变更用 `className`、`className.interfaceName`、`interfaceName` 三种 → `set(相对路径)`
- **签名精确索引**（`sig_index`）：归一化签名（去空白 / 分号，优先 `old.apiDeclaration`）→ records，供 O(1) 精确匹配
- **文件元信息**（`file_meta` / `file_records`）：版本、kit、变更类型等

`match_kb_files(candidates)` 按候选关键词查文件；`dedup_records()` 按 `(version, kit, cls, op, decl)` 去重。

### 4.5 DevEcoAPIScan 兼容 CSV 输出

12 列 CSV（`\r\n` 行尾，全字段双引号转义）：

| 列 | 映射源 |
|----|--------|
| Api Name | api |
| Api Type | op（空则回退 `"system"`） |
| Api File Path | kbFile |
| Api Prefix | `_extract_prefix(api)` |
| Api Params | 空 |
| API Args | snippet |
| Invoke Method | language 字段（ArkTS / C++） |
| Invoke Location | codeLocation |
| Api Key | `api@codeLocation` |
| Invoke Instance | `_extract_invoke_instance` |
| ChangeId | version |
| MethodDefinition | api |

误报过滤；`(api, codeLocation)` 去重。

### 4.6 LLM 可选接入 + 确定性回退

**两处使用 LLM，失败均回退确定性策略**：

1. **review_report**：变更条目审查，`use_llm=self.use_ai`，失败回退启发式
2. **UpgradeAdvisor**：升级建议生成

**LLM 调用**：`urllib.request` POST `/chat/completions`（OpenAI 兼容），system 角色 = 鸿蒙迁移专家，temperature 0.2，max_tokens 2000，60s 超时。Prompt 含升级窗口 + 高影响变更样本前 80 条。

**确定性回退**：`_deterministic_advice()` 按规则生成：
- 总体结论
- 版本分布表
- 高影响清单（`CRITICAL_OPS`：删除 / 废弃 / 行为变更 / UX / 权限；`WARN_OPS`：函数 / 接口定义 / 新增）
- 逐 API 建议

**环境变量**：

| 变量 | 默认值 | 用途 |
|------|--------|------|
| `HOSCANNER_LLM_BASE_URL` | `https://api.deepseek.com/v1` | OpenAI 兼容端点 |
| `HOSCANNER_LLM_API_KEY` | — | Bearer token |
| `HOSCANNER_LLM_MODEL` | `deepseek-chat` | 模型名 |

三者全缺省或调用失败即走确定性回退，**可完全离线运行**。

---

## 五、数据流与产物

```
工程源码 (.ets/.ts)  ──┐
                       │
                       ├──→ RuleEngine (41 规则)        ──→ api_usage.json/md
                       │                                  (位置 + 片段 + 知识库候选)
                       │
                       ├──→ ets_parser.analyze_src_roots ──→ api_call_graph.json
                       │   (词法分析)                       (文件 → 函数 → 调用点)
                       │
                       │            ┌────────────────────┐
                       │            │  KnowledgeBase     │
                       │            │  (53 个 JSON)      │
                       │            │  - 关键词索引      │
                       │            │  - 签名精确索引    │
                       │            └─────────┬──────────┘
                       │                      │
                       │                      ▼
                       │            ChangeMatcher ──→ change_report.json/md
                       │            (窗口匹配 + 分组)     (system/behavior 按 API)
                       │                                  + change_report.csv (12 列)
                       │
C/C++ 源码 (.c/.cc/.cpp/.h) ──→ region_lexer  ──→ cpp_parser ──→ cpp_api_usage.json/md
                               (状态机)            (原生 API)    + cpp_call_graph.json

                                                          ↓
                                                   upgrade_advice.md
                                                   (LLM 或确定性回退)
```

### 产物清单

| 文件 | 内容 |
|------|------|
| `api_usage.json` / `.md` | API 使用记录（summary + 每条 API 的位置 / 片段 / 来源知识文件） |
| `api_call_graph.json` | API 调用图谱（文件 → 函数 → 系统 API 调用点） |
| `cpp_api_usage.json` / `.md` | C++ 原生 API 使用记录（`OH_*` / `napi_*` / `OHOS_*` + 原生头 include） |
| `cpp_call_graph.json` | C/C++ 调用图谱（文件 → 原生 API 调用点 + include） |
| `change_report.json` / `.md` | 升级变更清单（系统 API 变更 + 行为变更，按 API 分组，含语言分解） |
| `change_report.csv` | DevEcoAPIScan 兼容 CSV（12 列） |
| `upgrade_advice.md` | AI 升级评估与行动建议 |

---

## 六、关键路径与配置

### CLI 参数

| 参数 | 说明 | 默认值 |
|------|------|--------|
| `--project` | 目标工程根目录 | `D:\Projects\APIScanUtil\thirdLibrary\FluidLayout\ohos_hardemo` |
| `--sdk-root` | DevEco Studio SDK 根目录 | `D:\Application\DevEco Studio\sdk\default` |
| `--knowledge-root` | 知识库根目录 | `knowledge`（包同级目录） |
| `--out` | 报告输出目录 | `output`（包同级目录） |
| `--ets-src` | 工程内 ETS 源码相对路径 | `entry/src/main/ets` |
| `--cpp-src` | 工程内 C/C++ 原生源码相对路径 | `entry/src/main/cpp` |
| `--no-cpp` | 跳过 C/C++ 扫描 | 默认启用 C++ |
| `--from` / `--to` | 源 / 目标 API 版本 | `12` / `26` |
| `--rules` | 自定义扫描规则 JSON | 内置 41 + 4 条 |
| `--ai` | 启用 LLM 升级建议 | 关闭 |

### 路径发现逻辑

- `knowledge_root` = `apiScan/knowledge`，`KnowledgeBase._load` 优先新目录名 `harmonyos_*_changes`，缺失回退旧名 `apiChange`
- `sdk_root` 仅传递 / 打印，scanner.py 未直接读取 SDK 文件
- `_discover_src_roots` 自动发现多模块并扩展到同级 `ohos_library`
- 排除目录：`oh_modules` / `build` / `.cxx` / `.preview` / `node_modules` / `.git`（C++ 额外排 `third_party`）

---

## 七、测试与覆盖率校验

11 个项目测试集，整体召回率 **100%**（命中 1543 / 真实清单 1543，缺失 0）。

### 校验脚本链

| 脚本 | 用途 | 产物 |
|------|------|------|
| `tests/compute_coverage.py` | 召回率 Recall，匹配键 `(api, codeLocation)`，缺失按类型分类、多余按 category 分类、缺口模式分析 | `coverage_report.json` |
| `tests/coverage_to_md.py` | 覆盖率报告 Markdown 化 | `coverage_report.md` |
| `tests/compare_change_report.py` | 快速对比（matched / missing / extra，与 `compute_coverage.py` 分工：前者快速对比，后者覆盖率报告） | `comparison_aggregate.json` |
| `tests/verify_coverage.py` | 参考文档覆盖校验（需提供参考 `api_usage.json`，`docs/` 不随仓库分发） | — |
| `tests/test_cpp_scan.py` | C++ 扫描功能测试（8/8 通过） | — |

### 批量驱动

- `run_testset_local.py`：本地路径批量扫描 `testSet/` 下各项目
- `run_testset.py`：E:\ 盘路径版本（与 `run_testset_local.py` 仅 `TESTSET` 路径与标题文案不同）

---

## 八、技术亮点小结

1. **零第三方依赖**：纯 Python 3.10+ 标准库实现，便于集成与离线运行
2. **C++ 状态机 + 三重校验**：移植 DevEcoAPIScan CppCodeScanner，四态状态机（CODE / SINGLE_LINE_COMMENT / MULTI_LINE_COMMENT / STRING）逐字符打区域标签（CODE / COMMENT / STRING 三种），再加三重校验，有效降低 C/C++ 原生 API 误报率
3. **ArkTS 双层架构**：规则引擎（快速）+ 词法分析（结构化），互补而非替代
4. **变更匹配对齐 DevEcoAPIScan**：分层匹配 + invokeInstance 二次过滤 + 噪声过滤，与官方 `isSameArkTsAPI` 语义对齐
5. **DevEcoAPIScan 兼容 CSV**：12 列格式直接对接既有工具链
6. **LLM 可选 + 确定性回退**：环境变量三件套配置，缺省或失败自动回退，保证离线可用
7. **多模块自动发现**：`_discover_src_roots` 自动扩展到同级 `ohos_library`，无需手动列举
8. **知识库签名精确索引**：`sig_index` 提供 O(1) 精确匹配，关键词索引兜底模糊匹配

---

## 九、已知历史与决策

详见 `REDUNDANCY_ANALYSIS.md` 的清理执行记录（2026-08-13）。关键决策：
- `.gitignore` 已创建，忽略 `__pycache__/` / `*.pyc` / `.idea/` / `.vscode/` / `_test_out_*/`
- 已跟踪的 13 个 `.pyc` 已从版本库移除
- 死代码 `analyze_project` import 已清理
- `TESTSET` 路径已统一为本地实际路径
- README 与各模块 docstring 中的过时路径、规则数、`docs/` 引用已修正
