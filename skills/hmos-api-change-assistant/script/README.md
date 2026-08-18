# api-change-scan

直接调用 DevEco Studio 已实现的 `ApiScanUtil` 接口，在命令行输出 **API 变更 + 受影响代码位置**。

## 输出 schema（固定 6 列）

```
ApiDefinition | Language | Changed in SDK Version | Affected Versions | CodeLocation | Guidance link
```

| 列 | 说明 | 来源 |
|----|------|------|
| `ApiDefinition` | 接口签名（如 `height?: string \| number`） | `affectedApis.methodDefinition`，缺省时取 `packageName.interfaceName` |
| `Language` | `ArkTS` / `TypeScript` / `C` 等 | `affectedApis.implementLanguage` |
| `Changed in SDK Version` | 发生变更的 SDK 版本（如 `6.0.0(20) Beta1`） | `interfaceChanges.sdkVersion` |
| `Affected Versions` | `ALL`（非版本隔离）或具体 API level（如 `20`） | `interfaceChanges.apiEffectiveVersion`：`NOT_ISOLATED` → `ALL`，否则取 `apiVersion` |
| `CodeLocation` | 命中的 `文件绝对路径:行号` | Node 扫描器产出的 `absolutePath:line`，grep 回退同样输出绝对路径（扫描根已归一化为绝对路径） |
| `Guidance link` | 官方变更文档链接（锚点定位到该变更 ID） | `ApiScanUtil.getDocumentUrl(change)` 或 `ApiDisplayItem.tutoringUrl` |

## 用法

### macOS / Linux

```bash
脚本与本 README 同目录（即 skill 的 `script/` 目录）。进入该目录后执行：

# 1) 查看合法版本串（须完整匹配 VERSION_LIST）
./api-change-scan.sh --list-versions

# 2) 扫描工程
./api-change-scan.sh \
  --project /path/to/your_harmony_project \
  --start "HarmonyOS_5.1.0(18)_Release" \
  --end   "HarmonyOS_6.0.0(20)_Beta3" \
  --out   /tmp/acs

# 3) 只要变更清单，不扫代码位置
./api-change-scan.sh --start "HarmonyOS_5.1.0(18)_Release" --end "HarmonyOS_6.0.0(20)_Beta3" --no-scan --out /tmp/acs
```

### Windows

```powershell
脚本与本 README 同目录（即 skill 的 `script/` 目录）。进入该目录后执行：

# 1) 查看合法版本串
.\api-change-scan_windows.bat --list-versions

# 2) 扫描工程（支持完整版本名）
.\api-change-scan_windows.bat ^
  --project D:\path\to\your_harmony_project ^
  --start "HarmonyOS_5.1.0(18)_Release" ^
  --end   "HarmonyOS_6.0.0(20)_Beta3" ^
  --out   D:\tmp\acs

# 3) 使用 API Level 数字（所有平台通用）
.\api-change-scan_windows.bat ^
  --project D:\path\to\your_harmony_project ^
  --start 18 --end 20 ^
  --out D:\tmp\acs

# 4) 只要变更清单，不扫代码位置
.\api-change-scan_windows.bat --start 18 --end 20 --no-scan --out D:\tmp\acs
```

> **注意**：PowerShell/CMD 可能吞掉括号（`(` `)`），传入 `"HarmonyOS_5.1.0"` 也能自动解析为 `HarmonyOS_5.1.0(18)_Release`（优先匹配 Release 版本）；该归一化在所有平台生效。

### ArkTS 编译完善（阶段 1 子步骤）

**默认随扫描自动执行**：`--project --start --end` 扫描后即跑 ArkTS 编译（仅编译，不打包/签名），把编译错误/警告中与变更清单匹配的项作为实证并入 `result.csv`。**默认使用 DevEco Studio 自带 hvigor**（`tools\hvigor\bin\hvigorw.bat`），自动注入 DevEco 自带 `tools\node` 的 `NODE_HOME` 与 SDK 根，离线可用，无需工程 wrapper 或网络下载 hvigor。

编译行为按工程类型对齐 `compile-guide.md`：

- **鸿蒙原生工程 / 独立模块**：`hvigorw --no-daemon compileArkTS`
- **Flutter 插件**：编译根优先 `example/ohos`（compile-guide §4.1 的官方编译目录），`ohos/` 兜底
- **RN 插件**：定位 `rn.py` / `rnohos.py`（`--rn-py` 指定、工程根、或同仓库 skill 工具目录）后经其编排 `rn.py build har --plugin-root .`（compile-guide §5.1 铁律，禁止裸跑 hvigorw）；未定位到则降级 `compileArkTS` 类型检查并提示，不产出 HAR/HAP
- **ohpm install 一律用官方 registry**（compile-guide §2.1）：`ohpm install --all --registry https://ohpm.openharmony.cn/ohpm/ --strict_ssl true`
- **超时**：RN 构建与 compileArkTS 均 20 分钟（≥ compile-guide §5.6 的 600000ms 要求），ohpm install 3 分钟
- **daemon 关闭**：所有 hvigor 调用带 `--no-daemon`（compile-guide §3.1）

```bash
# 默认：扫描 + 代码位置 + 编译完善（一次调用）
.\api-change-scan_windows.bat ^
  --project D:\path\to\your_harmony_project ^
  --start 18 --end 20 --out D:\tmp\acs

# 只扫不编译（严格顺序变体：先扫，agent 合并后再单独 --compile）
.\api-change-scan_windows.bat --project D:\path\to\your_harmony_project --start 18 --end 20 --no-compile --out D:\tmp\acs

# 独立编译完善（读 out 目录已有 changeList.json + result.json，无需 start/end；agent 合并后单独追加）
.\api-change-scan_windows.bat --compile --project D:\path\to\your_harmony_project --out D:\tmp\acs
```

编译相关参数：

| 参数 | 说明 |
|------|------|
| `--no-compile` | 扫描时跳过编译完善（先扫、agent 合并后再单独 `--compile` 时用） |
| `--compile` | 显式编译；也可独立运行（`--compile --project <工程> --out <目录>`，对已有 out 追加实证行） |
| `--compile-root <目录>` | 覆盖编译工程根（默认：原生工程=根、Flutter=`example/ohos`（`ohos/` 兜底）、RN=`harmony/<模块>`） |
| `--hvigorw <路径>` | 覆盖 hvigorw（默认 DevEco Studio 自带 `tools/hvigor/bin/hvigorw.bat`，工程根 wrapper 仅兜底） |
| `--rn-py <路径>` | RN 插件指定编排脚本 `rn.py` / `rnohos.py`（compile-guide §5.1：RN 必须经其编排，禁止裸跑 hvigorw；不传时自动探测工程根与同仓库 skill 工具目录） |
| `--python <解释器>` | 覆盖 python 解释器（默认 `python`；本机只有 `py` 时用 `--python py`） |

### 合并（阶段 3）

> `--merge` 不调用扫描器/SDK，但仍走同一包装脚本（classpath 需要 DevEco 的 fastjson2 等 jar）。

```bash
# 应用 verify.json 回写 result.json/csv
.\api-change-scan_windows.bat --merge --out D:\tmp\acs

# 同时从主结果剔除 false_positive 行（confidence < 0.5 的误报降级 needs_review，不删）
.\api-change-scan_windows.bat --merge --prune --out D:\tmp\acs
```

| 参数 | 说明 |
|------|------|
| `--merge` | 读 out 目录 `verify.json` 合并回 `result.json/csv`：verdict 按 `rowIndex`（result.json 行下标，推荐）或 `row`（6 列全量，兼容）引用行；`corrected` 应用修正、`supplements` 追加；默认**标注不删**，全量行的 verdict 写入 `result-annotated.csv/json`（6 列 + Verdict/Confidence/Reason） |
| `--prune` | 配合 `--merge`：从主结果剔除 `false_positive` 行（`confidence < 0.5` 的降级 `needs_review` 保留） |
| `--ignore-isolation-filter` | 关闭 ISOLATED 变更的 targetSdkVersion 比对标注（默认：`Affected Versions` 高于工程 targetSdkVersion 的变更组在 relatedChanges.json 标注 `notApplicable`，不删行） |

### ISOLATED 变更的 targetSdk 比对

规则中 `apiEffectiveVersion: ISOLATED` 表示仅当应用 targetSdkVersion ≥ apiVersion 才生效。扫描时 CLI 读工程 `build-profile.json5` 的 `targetSdkVersion`，把不适用（apiVersion 更高）的变更组在 `relatedChanges.json` 标注 `notApplicable`——**只标注不删行**（升级前预警场景下这些行恰恰是目标）。

### 变更说明数据（apiChangePrompts.json）

扫描时同时从 JAR 抽取 `apiChangeDescription/apiChangePrompts.json`（官方人工策展的变更原因/影响/适配指导），并按 changeId 把摘要挂到 `relatedChanges.json` 变更组的 `curatedPrompt` 字段，作为阶段 2 agent 的优先判定依据。

**编译 fail-fast 预检**：若 hvigor 报 `Task ['compileArkTS'] was not found in the project`（= hvigor 未为工程注册构建任务，工具链不兼容，如 DevEco 自带 hvigor 与工程 `modelVersion` / 本机 SDK 版本不匹配），CLI 直接跳过逐模块重试（重试必然同错），并把诊断（工程 `modelVersion`、`targetSdkVersion` / `compatibleSdkVersion`、本机已装 SDK）写入 `compile.md` 状态后跳过，不阻断清单。模块名从 `build-profile.json5` 的 `modules[].name` 按 JSON5 解析读取，**不会再误用 `targets`/`products`/`buildModeSet` 里的 `name`（如 `"default"`）作为假模块名**去尝试。

## 工程类型识别与扫描范围

三种目标库的根目录结构不同，ArkTS 源码的存放位置也不同。CLI 会自动识别工程类型并**只扫库自身的 ArkTS**（`--project` 直接传插件根目录即可）：

| 类型 | 根目录标记 | 扫描的 ArkTS 根 |
|------|-----------|----------------|
| 鸿蒙原生工程 (HAP/HSP/HAR) | 根有 `build-profile.json5` | 各模块 `src/main/ets`（root-first + 逐模块兜底） |
| Flutter 插件 | 根有 `pubspec.yaml` 且含 `ohos/` | `ohos/`（含根 `Index.ets` + `src/main/ets`，跳过 `example/`、`lib/`） |
| RN 插件 | 根有 `package.json` 且含 `harmony/` | `harmony/` 下每个模块（跳过 JS 侧 `src/`） |
| 独立原生库/模块 | 根有 `oh-package.json5` | 该模块本身 |
| 未知 | 无以上标记 | 回退全根扫描 |

决策树（按序判定，先命中先返回）：

```
① 根有 build-profile.json5      → 鸿蒙原生工程
② 根有 pubspec.yaml + ohos/     → Flutter 插件
③ 根有 package.json + harmony/  → RN 插件
④ 根有 oh-package.json5         → 独立模块
⑤ 都不命中                     → 未知（全根扫描）
```

### 相关参数

```bash
# 只识别类型与扫描根，不扫描（无需 --start/--end）
./api-change-scan.sh --detect --project /path/to/project

# 手动覆盖自动识别（应对误判）
./api-change-scan.sh --project /path/to/project --type flutter --start 18 --end 20

# 自检类型识别与扫描根计算（内置 fixture）
./api-change-scan.sh --self-test
```

Windows 版（`.bat`）参数一致，仅脚本名与换行符不同。`--detect` / `--self-test` 仍通过 DevEco 自带 JBR 运行（包装脚本需定位 DevEco），但不调用扫描器/SDK。

## 它做了什么（全部直接调 DevEco 已实现接口）

| 步骤 | 调用的接口 | 说明 |
|------|-----------|------|
| 变更清单 | `ApiScanUtil.getAllApiChanges(start, end)` | 合并 JAR 内 `apiChange/*.json`，语义 **(start, end]** |
| 原始数据 | 抽取 JAR 内 `apiChange/*.json` | 范围内各版本原始变更数据落到 `out/apiChange/`，供 agent 交叉比对发现遗漏 |
| 阶段 2 预过滤 | 聚合扫描命中 + 压紧原始变更 | 产出 `relatedChanges.json`（命中变更按"变更身份"聚合，供 agent 分组核验）、`apiChangeSummary.json`（各版本原始变更紧凑摘要，供交叉比对） |
| 代码扫描 | DevEco 自带 Node 扫描器 `plugins/harmony/arkanalyzer-apiscan/index.js` | 即 `scanData` 内部 spawn 的同一个 AST 工具 |
| 结果拼装 | `ApiScanUtil.getApiChangeResult(csv, changeMap)` | CSV × 变更表 → 带代码位置的 `ApiDisplayItem` |
| 文档链接 | `ApiScanUtil.getDocumentUrl(change)` | 每条变更对应的官方 changelog 锚点 URL |

最终把 `ApiDisplayItem` 映射到上述 6 列，写 `result.csv` / `result.json`，终端打印表格。

## 输出文件（`--out` 目录）

| 文件 | 内容 |
|------|------|
| `changeList.json` | 完整变更清单（`affectedApis` + `interfaceChanges`），权威数据 |
| `apiChange/` | **（start, end] 范围内各版本的原始变更数据**，从 DevEco jar 抽取，与 changeList.json 同源；供 agent 交叉比对 |
| `apiChangePrompts.json` | 官方人工策展的变更说明（变更原因/影响/适配指导），按 changeId，供 agent 判定引用 |
| `relatedChanges.json` | **阶段 2 分组核验的紧凑输入**：命中变更按"变更身份"聚合（apiDefinition / changedInSdk / affectedVersions / guidance / changeId / changeType / curatedPrompt / notApplicable / hitCount / locations） |
| `apiChangeSummary.json` | **阶段 2 交叉比对的紧凑摘要**：各版本原始变更的 id / sdkVersion / changeTitle / changeType / API tokens，免读 apiChange/ 原始大文件 |
| `result.csv` | **6 列**结果（主交付物；合并后为最终版） |
| `result.json` | 同内容的 JSON 数组 |
| `result-annotated.csv` / `result-annotated.json` | `--merge` 产物：6 列 + Verdict/Confidence/Reason，全量行可审计 |
| `compile.log` | hvigor 原始编译输出（阶段 1） |
| `compile.json` | 编译错误/警告 × 变更清单匹配结果（`matched` 数组 + `unmatchedCount`） |
| `compile.md` | 编译阶段摘要报告（编译问题总数 / 匹配 / 未匹配 / 状态） |
| `scan/` | Node 扫描器配置文件（`config-*.json`）和中间产出（CSV） |
| `scan.log` | Node 扫描器日志（排查用） |

> `verify.json` / `verify.md` 由 skill 层的 agent 语义复查（阶段 2）产出，不在 CLI 生成范围内。

## 扫描策略

代码位置扫描按以下优先级执行：

1. **Node 扫描器优先**：调用 DevEco 内置 `arkanalyzer-apiscan` 做 AST 级别精确扫描
2. **按类型收窄扫描根**：Flutter/RN/独立模块只扫库自身的 ArkTS 根（`ohos/`、`harmony/<模块>/`），跳过 `example/`、`lib/`、`src/` 等非库代码；RN 多模块逐个扫描并合并。鸿蒙原生工程/未知类型保持现有 root-first + 逐模块兜底
3. **grep 回退**：Node 扫描器不可用时（如 SDK 不全、未 hvigor 同步），自动回退到基于变更清单 API 名的 grep 近似定位；**grep 搜索根与 Node 扫描根一致**（收窄到 ArkTS 根，避免 RN 的 JS 侧 `.ts` 被误扫）。grep 匹配前会剥离行内注释与字符串字面量（含跨行块注释），从源头减少 `// backToTop 已废弃` 这类误报
4. **自动去重**：按全部 6 列去重，保留顺序
5. **只扫 ArkTS/TS**：扫描器与 grep 兜底均只覆盖工程 ArkTS/TS 源文件（`.ets/.ts/.d.ets/.d.ts`），不扫 JS/C++/Native 与 `oh_modules`/`node_modules`/`build` 等构建产物

## 让 AST 扫描器跑通的两个关键点

直接 `node index.js` 会崩，必须满足：

1. **传 `--tmpPath=<可写目录>`** — 扫描器要往那写进度文件 `processArkTs.txt`；不传则 `cliOptions.tmpPath` 为 `undefined`，`path.join(undefined)` 直接崩（报错 `SourceEntry.ts:93`）。
2. **CWD = index.js 所在目录（工具目录）** — worker 线程按 CWD 解析 `worker.js`，CWD 不对会报 `Cannot find module '.../ApiScan.worker.ts'`。

脚本已内置这两点（给每个扫描目标建独立 `tmpPath`、`ProcessBuilder.directory(工具目录)`）。

## 依赖

| 项目 | macOS / Linux | Windows |
|------|--------------|---------|
| DevEco 安装目录 | Java 入口自动探测：依次读环境变量 `DEVECO_HOME`→`DEV_DIR`→`TOOL_HOME`→类路径推导→常见安装路径（macOS `/Applications/DevEco-Studio.app/Contents`） | 同一探测逻辑，常见路径含 `D:\DevEcoStudio`、`C:\Program Files\Huawei\DevEco Studio` 等；三个环境变量任一可用 |
| Java 运行时 | DevEco 自带 JBR：`jbr/Contents/Home/bin/java\|javac` | DevEco 自带 JBR：`jbr\bin\java.exe\|javac.exe` |
| classpath | `lib/*` + `plugins/*/lib/*`（`:` 分隔） | `lib\*` + `plugins\*\lib\*`（`;` 分隔，通配符避免 CMD 行长限制） |
| Node 扫描器 | `tools/node/bin/node` + `plugins/harmony/arkanalyzer-apiscan/index.js` | `tools\node\node.exe` 或 `tools\node\bin\node.exe` + 同 `index.js` |
| 额外 JDK | 无需 | 无需 |

## 版本串格式

须完整匹配 `ApiScanUtil.VERSION_LIST`，例如：
- `HarmonyOS_5.1.0(18)_Release`
- `HarmonyOS_6.0.0(20)_Beta3`
- `HarmonyOS_5.0.3(15)_Beta2`

先 `--list-versions` 查看（不同 DevEco 版本覆盖的 API level 范围不同）。

### 便捷输入（所有平台通用）

- **API Level 数字快捷方式**：直接传 `--start 18 --end 20`，自动映射为对应版本（优先选 Release）
- **括号丢失自动修复**：PowerShell/CMD 可能吞掉括号，传 `"HarmonyOS_5.1.0"` 自动解析为 `HarmonyOS_5.1.0(18)_Release`

## 文件

| 文件 | 说明 |
|------|------|
| `ApiChangeCli.java` | 跨平台 (macOS/Linux/Windows) Java 入口（包路径 `com.huawei.deveco.programanalysis.apiscan.ApiScanUtil`，支持 API Level 映射和括号修复） |
| `api-change-scan.sh` | macOS/Linux shell 包装：自编译 + 转发参数 |
| `api-change-scan_windows.bat` | Windows bat 包装：自动检测 DevEco、通配符 classpath、自编译 + 转发参数 |
| `README.md` | 本文档 |

## 故障排查

| 问题 | 原因 | 解决 |
|------|------|------|
| `path.join(undefined)` / `SourceEntry.ts:93` | 未传 `--tmpPath` | 脚本已内置，若手动调 node 需加 `--tmpPath=<可写目录>` |
| `Cannot find module '.../ApiScan.worker.ts'` | CWD 不是 `index.js` 所在目录 | 脚本已内置 `ProcessBuilder.directory(工具目录)` |
| `ERROR: 找不到 DevEco 安装目录` | 环境变量未设置且默认路径不存在 | 设置 `DEVECO_HOME` / `DEV_DIR` / `TOOL_HOME`（三平台均按此顺序读取）；Windows 常见带空格路径如 `D:\DevEco Studio`、`C:\DevEco Studio` 已自动识别 |
| 中文 / 符号输出乱码（`Ϸ`、`ɨ`、`?` 等） | Windows 中文控制台默认 cp936，或 javac 按 cp936 读 UTF-8 源码 | 已内置修复：bat 执行 `chcp 65001` + `JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8`、`javac -encoding UTF-8`、Java 强制 UTF-8 stdout；手动直调 java 时须同样加 `-encoding` / `-Dfile.encoding=UTF-8` 并 `chcp 65001` |
| Windows 路径含空格被截断（`D:\DevEco \jbr\...`） | 旧 bat 未正确处理带空格的 DevEco 安装目录 | 已修复：直接调用 bat 即可（路径已全部加引号）；勿用 `cmd /c "set \"X=Y z\" && bat"` 这类易错的手工转义 |
| `ERROR: 编译失败` | classpath 不完整或缺少 DevEco JAR | 确认 DevEco 安装完整，`lib/` 和 `plugins/*/lib/` 下有 JAR |
| `ERROR: 版本 'xxx' 不在 VERSION_LIST 中` | 版本串不匹配 | `--list-versions` 查看合法取值 |
| Node 扫描器未产出 CSV | 工程未 hvigor 同步或 SDK 不全 | 自动回退 grep；或先在 DevEco 中 Sync 工程 |
| grep 未命中任何结果 | 变更 API 名未在源码中直接引用 | 正常，该 API 可能未被工程使用 |
| `ERROR: 缺少 ...\changeList.json` | `--compile` 前未跑过完整扫描 | 先跑一次 `--project ... --start ... --end ...`（或 `--no-scan`）生成变更清单 |
| `compile.json` 未匹配 0 条 | 工程无 build-profile / 找不到 hvigorw / 编译错误与变更 API 无关 | 查看 `compile.md` 的状态与 `compile.log`；无编译根时会跳过并记录原因 |
| `ohpm install` 失败 | 无网络或包仓库不可达 | 手动 `ohpm install --all --registry https://ohpm.openharmony.cn/ohpm/ --strict_ssl true` 后重试，或接受编译阶段降级（不影响清单） |
| Windows 括号被吞 | PowerShell 解析 `()` 为表达式 | Windows 版已支持自动修复，或改用 `cmd /c` 执行 |
| `扫描超时(15分钟), 已强制结束` | 超大工程 Node 扫描超时被 kill（防挂死） | 自动走 grep 兜底，清单不受影响；需要 AST 精度时可按模块拆小工程再扫 |
| `编译超时(20分钟), 已强制结束` | 超大工程 compileArkTS 超时被 kill | 编译实证缺失但清单完整；可先手动构建一次（增量缓存）再重跑 `--compile` |

## 已知限制

- `ApiScanUtil.scanData` 全量接口内部依赖 IDE 运行时（`ApplicationManager.invokeAndWait` 等），无法脱离 IDE 进程调用；本工具拆成可独立运行的 `getAllApiChanges` + Node 扫描器 + `getApiChangeResult` 三段直调，效果等价（ArkTS）。
- 扫描器覆盖 ArkTS/TS（`.ets/.ts/.d.ets/.d.ts`）。C++/Native 的扫描分支（`scanCpp`）在 IDE 内走 ninja + Eclipse CDT，本工具未覆盖。
- 若 Node 扫描器在某工程仍失败（如 SDK 不全），会自动回退到基于变更清单 API 名的 grep 近似定位，输出会标注。
- grep 回退为近似匹配，按 `interfaceName` 分词搜索，每 token 上限 30 处、总上限 1000 行。
- 编译完善仅跑 ArkTS 编译（原生/Flutter：`compileArkTS`；RN 插件：`rn.py build har` 编排，不打包/签名）；依赖工程已配置 build-profile/hvigor，缺 `oh_modules` 时需能联网 `ohpm install`（官方 registry）；编译错误与变更清单的匹配为近似 token 匹配（取最长命中 token）。RN 走 rn.py 时错误位置可能指向 `.rn-build/har_wrapper/` 副本，匹配的是库代码本体。
- **子进程超时**（防挂死，超时强制结束进程树，不阻断清单）：Node 扫描 15 分钟/目标、`compileArkTS` 20 分钟/编译根、`ohpm install` 3 分钟。超大工程超时后对应证据缺失（扫描超时走 grep 兜底、编译超时无编译实证），可拆小扫描根或分模块重试。
- **工具链不兼容时 fail-fast**：hvigor 报 `Task ['compileArkTS'] was not found in the project`（构建任务未注册）会直接跳过逐模块重试并写诊断到 `compile.md`，不阻断清单；此时无法取得编译实证，属预期行为。
