---
name: hmos-api-change-assistant
description: 扫描 HarmonyOS 工程在两个 SDK 版本之间的 API 变更，输出受影响的接口签名、代码位置和官方指导文档链接。适用于 HarmonyOS/API Level 升级兼容性评估、SDK 升级影响面分析、ArkTS API 变更定位。
---

# hmos-api-change-assistant

调用 DevEco Studio 内置的 `ApiScanUtil` 接口，输出两个 HarmonyOS SDK 版本之间的 **API 变更清单** 与 **受影响代码位置**，固定 6 列：ApiDefinition / Language / Changed in SDK Version / Affected Versions / CodeLocation / Guidance link。

## 触发场景

- 评估插件/工程在不同 HarmonyOS API Level 之间的兼容性
- 快速了解某工程在 SDK 升级后哪些代码受影响
- 只生成变更清单（不扫代码）或同时扫描代码定位

## 工作流程（三阶段）

| 阶段 | 执行者 | 内容 | 产出 |
|------|--------|------|------|
| **阶段 1 工具扫描+编译** | CLI | 变更清单 + 代码位置 + 编译实证（一次调用） | `changeList.json`、`apiChange/`、`result.csv/json`、`compile.*` 等 |
| **阶段 2 Agent 复核** | Claude 子代理 | 语义复查（逐行 verdict + 补充） | `verify.json` / `verify.md` |
| **阶段 3 汇总** | CLI `--merge` | 应用 verdict 回写结果（默认标注、`--prune` 才删除） | 最终版 `result.csv/json` + `result-annotated.*` |

```bash
# Windows（macOS/Linux 用 api-change-scan.sh，参数一致）
.\script\api-change-scan_windows.bat --list-versions                    # 0) 查看合法版本串
.\script\api-change-scan_windows.bat --project <工程> --start 18 --end 26 --out <out>   # 阶段 1
#        …… 派子代理做阶段 2（模板见 references/verify-prompt.md）……
.\script\api-change-scan_windows.bat --merge --out <out>                # 阶段 3
```

完整 CLI 参数（`--no-scan` / `--no-compile` / `--type` / `--compile-root` / `--hvigorw` / `--rn-py` / `--python` / `--detect` / `--self-test` 等）见 **`script/README.md`**。

## 阶段 1：工具扫描 + 编译（CLI）

`--project --start --end` 一次调用完成三件事：

1. **变更清单**：`ApiScanUtil.getAllApiChanges(start, end)` → `changeList.json`；同时抽取 `apiChange/`（各版本原始变更数据）与 `apiChangePrompts.json`（官方人工策展的变更说明），供阶段 2 交叉比对；
2. **代码位置**：DevEco Node 扫描器（AST 级）优先，失败自动 grep 兜底，自动收窄扫描根、去重 → `result.csv/json` + 阶段 2 预过滤文件（`relatedChanges.json` / `apiChangeSummary.json`）；
3. **编译实证**：自动跑 ArkTS 编译（原生/Flutter 经 DevEco 自带 hvigor `--no-daemon compileArkTS`，Flutter 编译根优先 `example/ohos`；RN 插件定位 `rn.py` / `rnohos.py` 后经其编排 `build har`，禁止裸跑 hvigorw；ohpm install 一律用官方 registry），把编译错误/警告中与变更清单匹配的项并入 result.csv → `compile.*`。`--no-compile` 关停；`--compile` 可对已有 out 独立追加。

> **编译前提**：编译实证以工程**当前** compileSdkVersion 为准。工程已切到目标 SDK 时，编译错误 = 删除/改名 API 的直接证据；工程仍停在旧 SDK（升级前评估）时，`compile.*` 仅反映现状兼容问题，**不代表升级后表现**。

工具链不兼容（hvigor 报 `compileArkTS` 任务未注册）时 fail-fast 跳过并把诊断写入 compile.md，不阻断清单。

**工程类型与扫描根**——CLI 自动识别工程类型（鸿蒙原生/Flutter 插件/RN 插件/独立模块），只扫库自身的 ArkTS，`--project` 直接传插件根目录即可。误判用 `--type` 覆盖，`--detect` 可预先查看识别结果。识别标记、扫描根对照表与决策树见 `script/README.md`。

## 阶段 2：Agent 复核（Claude 子代理）

用 Agent 工具派 **general-purpose** 子代理，提示词模板见 **`references/verify-prompt.md`**——替换 `{PROJECT}` `{OUT}` `{START}` `{END}` `{SCAN_ROOTS}` `{VERIFY_SCOPE}` 占位符后派发。模板内含 verify.json 的严格 schema（按 `rowIndex` 引用 result.json 行的逐行 verdict + confidence + 引用代码行的 reason）。

子代理输入要点：`relatedChanges.json`（按变更身份聚合的组，含 `changeType`/`changeId`/`curatedPrompt` 官方策展说明/`notApplicable` 标注）是主输入，按组判定 + 组内抽查提速；`apiChangeSummary.json` 用于交叉比对遗漏；只有个别条目需要深读时才打开 `changeList.json` / `apiChange/*.json` 大文件。

verdict 语义：`confirmed`（真实命中）/ `false_positive`（误报）/ `corrected`（位置或签名修正）；另有 `supplements` 补充扫描器遗漏的调用点。

## 阶段 3：汇总（CLI `--merge`）

阶段 2 完成后执行（不依赖 IDE 运行时/SDK，但仍走同一包装脚本）：

```bash
.\script\api-change-scan_windows.bat --merge --out <out>           # 默认：标注不删
.\script\api-change-scan_windows.bat --merge --prune --out <out>   # 可选：剔除误报行
```

- **默认标注不删**：所有行保留，`corrected` 修正直接应用到主结果、`supplements` 追加；全量行的 verdict 写入 `result-annotated.csv/json`（6 列 + Verdict/Confidence/Reason）供人工审计；
- `--prune` 才从主结果剔除 `false_positive` 行（`confidence < 0.5` 的误报降级 `needs_review`，永不删除）；
- `rowIndex` 越界或未匹配到 result 行的 verdict 逐条告警，不中断。

**严格顺序变体**（先扫不编译 → agent 复核+汇总 → 再补编译实证）：

```bash
.\script\api-change-scan_windows.bat --project <工程> --start 18 --end 26 --no-compile --out <out>
# …… 阶段 2 + --merge ……
.\script\api-change-scan_windows.bat --compile --project <工程> --out <out>
```

## skill 层开关（由 Claude 识别，不是 CLI 参数）

| 开关 | 说明 |
|------|------|
| `--no-verify` | 跳过阶段 2 Agent 复核 |
| `--verify-behavior-only` | 阶段 2 只对 `changeType ∈ {接口行为变更, UX交互行为变更}` 的组做完整判定，其余组轻量抽查（大变更集下省 token；默认全量复查） |

## 输出标准

固定 6 列：`ApiDefinition / Language / Changed in SDK Version / Affected Versions / CodeLocation / Guidance link`。列含义、来源与示例见 `script/README.md`。

## 输出文件（`--out` 目录）

- 主交付物：`result.csv` / `result.json`（阶段 3 后为最终版）
- 阶段 2 输入：`relatedChanges.json`（分组）/ `apiChangeSummary.json`（交叉比对摘要）
- 审计产物：`result-annotated.csv/json`（6 列 + Verdict/Confidence/Reason）
- 其余中间产物（`changeList.json`、`apiChange/`、`apiChangePrompts.json`、`compile.*`、`scan/` 等）的完整清单见 `script/README.md`

## 产物生命周期

`result.json` 与 `result.csv` 是同一份行数据的两种视图，永远同步。演进：

| 阶段 | result.json/csv 状态 |
|------|---------------------|
| 阶段 1 后 | 首次版：清单 + 代码位置 + 编译实证 |
| 阶段 3 后 | 最终版：采纳 corrected、追加 supplement；false_positive 默认保留（标注在 result-annotated.*），`--prune` 时剔除 |

## 环境要求

- **DevEco Studio** 已安装（自动探测常见路径；环境变量 `DEVECO_HOME` / `DEV_DIR` / `TOOL_HOME` 可覆盖）
- 脚本用 DevEco 自带 JBR 编译运行 Java，无需额外 JDK；编译用自带 hvigor + node，离线可用
- 检测方式与故障排查见 `script/README.md`

## 已知限制（skill 层）

- 阶段 2 边界：agent 以 relatedChanges/apiChangeSummary 为紧凑输入，"工程是否受影响"的判定依赖 agent 对源码的分析；依赖具备 Agent 工具的宿主环境
- CLI 层限制（仅 ArkTS/TS、版本串匹配、编译近似匹配、子进程超时等）见 `script/README.md` 已知限制

## 资源

- `script/ApiChangeCli.java` — 跨平台 Java 入口（扫描/编译/汇总）
- `script/api-change-scan.sh` / `api-change-scan_windows.bat` — 包装脚本（自编译 + 转发参数）
- `script/README.md` — CLI 完整参数、决策树、故障排查
- `references/verify-prompt.md` — 阶段 2 子代理提示词模板（含 verify.json schema）
