# API Change Assistant 架构与调用链路（面向理解）

本文目标是让一位**对 DevEco Studio 内部并不熟悉**的工程师，读完之后真正理解这个工具“是什么、为什么这样设计、一次扫描从点击到出结果到底走了哪些代码”。粒度到**文件级**，函数级细节只在必要时点出。所有结论均可对照 `src/`、`src-chat/`、`apiscan-engine/` 下的源码核实。

> 配套的速查式索引见 [`README.md`](../README.md)（目录结构、CEF 路由表、文件索引）。本文聚焦“为什么”和“怎么跑通”，与其互补。

---

## 0. 先读这一节：它解决什么问题

HarmonyOS 的 SDK 在每个版本（5.0.0 → 6.x → 26）都会发生**不兼容的 API 变更**：某个方法签名改了、某个组件默认行为变了、某个接口被删除了。开发者把工程从旧 SDK 升到新 SDK 时，代码里用到这些已变更 API 的地方就会失效或行为异常。

靠人工去翻每个版本的 changelog 再回到代码里逐处排查，成本极高。**API Change Assistant** 就是 DevEco Studio 内置的工具，自动完成这件事：

1. 开发者选定“从版本 A 升到版本 B”；
2. 工具合并 A→B 之间所有版本的不兼容变更清单（`VERSION_LIST` 含 30 个版本，磁盘随附其中 29 个 JSON；缺的版本按空变更处理）；
3. 用静态分析引擎扫工程代码，找出实际调用了这些变更 API 的位置；
4. 以树形 + 分页列表展示：哪个 API、在哪个文件第几行、变更类型、影响版本区间、修复状态；
5. 支持跳转代码、按多维度过滤、导出 CSV、标记已修复；
6. 代码改动后行号自动跟随，无需重新扫描；
7. 对未修复项可一键“加入 AI 聊天”，由 CodeGenie 给出适配建议。

它是一个 **IntelliJ 平台插件模块**（不是独立应用），运行在 DevEco Studio 进程内，UI 用内嵌浏览器（JCEF）渲染，底层 ArkTS 扫描靠一个打包好的 Node.js 引擎（ArkAnalyzer）进程外执行。

---

## 1. 必要的基础知识（不理解这些就看不懂后面）

### 1.1 IntelliJ 平台的几个核心概念

这个插件构建在 IntelliJ Platform（DevEco Studio 的底座，版本 2026.1.1）之上。几个反复出现的概念：

- **Action**：菜单/工具栏上的一个动作。`AnAction.update()` 在每次刷新菜单时被调，用来决定这个动作当前“可见且可用”还是“隐藏/禁用”——这是本工具做“仅中国区 + HarmonyOS 工程”可见性控制的钩子。`actionPerformed()` 是点击时执行。
- **ToolWindow**：IDE 侧边/底部的工具窗口（如 Project、Run、Terminal）。通过 `ToolWindowFactory` 延迟创建，注册在 `plugin.xml` 的 `<extensions>` 里。本工具挂在**底部**（`anchor="bottom"`）。
- **Service（`@Service(Level.PROJECT)`）**：IntelliJ 的项目级单例，`project.getService(X.class)` 取实例。CodeChat 侧的 `ApiChangeService`、`APIChangeChatManager` 就是这种。
- **Extension Point（扩展点）**：IntelliJ 的解耦机制。一个插件可以声明一个“扩展点”（接口），别的插件在自己的 `plugin.xml` 里声明“我实现了这个扩展点”，运行期由平台把实现注册进来。**这是本工具“加入 AI 聊天”能力跨插件解耦的关键**（见 §6）。
- **Document / VirtualFile / PsiFile**：IntelliJ 对文件的三层抽象。`VirtualFile` 是文件系统里的文件，`Document` 是可编辑的文本内容（编辑器打开的就是它），`PsiFile` 是 PSI（Program Structure Interface）语法树根。行号跟踪、代码跳转都靠它们。
- **RangeMarker**：IntelliJ 在 `Document` 上建立的“位置标记”，**当文档被编辑时，marker 的 offset 会自动跟着移动**。这是行号实时跟踪的基石（见 §5）。
- **ProgressIndicator / Task.Backgroundable / ProcessCanceledException**：IntelliJ 的后台任务与取消模型。后台任务里周期性调 `ProgressManager.checkCanceled()`，若用户点了取消就抛 `ProcessCanceledException`，任务据此回滚。
- **EDT（Event Dispatch Thread）**：Swing 的 UI 线程。涉及 UI 操作（打开编辑器、弹通知）必须切到 EDT（`invokeLater`/`invokeAndWait`）；耗时扫描必须在池线程（`executeOnPooledThread`）。

### 1.2 JCEF：让前端页面跑在 IDE 里

DevEco Studio 的工具窗口 UI 很多是用 **JCEF（JCEF = JBR + CEF，即 IntelliJ 内嵌的 Chromium Embedded Framework）** 渲染的——本质是一个嵌入 IDE 的浏览器，加载一个本地 HTML（这里是一个 Vue/React 构建的前端工程）。

通信模型是**双向**的：

- **前端 → Java**：前端调 `window.cefQuery({key, data})` 发一个查询，Java 侧 `CefMessageRouterHandler.onQuery` 收到，按 `key` 路由到对应 `CefQueryHandler`，处理后用 `CefQueryCallback.success(json)` 回前端。这是 RPC 风格。
- **Java → 前端**：Java 调 `jbCefBrowser.getCefBrowser().executeJavaScript(...)`，通常派发一个 `CustomEvent`（如 `progressUpdate`、`treeDataUpdate`），前端 `addEventListener` 监听。这是事件推送。

本工具的 `ApiChangeWindow`（`src/.../ApiChangeWindow.java`）就是 JCEF 窗口的封装。

### 1.3 HarmonyOS SDK 与“API 变更数据”

- HarmonyOS SDK 按“平台版本(API Level)”演进，例如 `5.0.0(12)` 表示平台 5.0.0、API Level 12，最新到 `26.0.0(26)`。括号里的数字是 **API Version**，是匹配 API 的关键。
- SDK 分两路：**ohos**（OpenHarmony 公共能力）和 **hms**（华为专属能力），各自有 `ets`（ArkTS/TS 声明）和 `native/sysroot/usr/include`（C/C++ 头文件）两套。扫描时要同时覆盖两路、两种语言。
- **API 变更清单**：随插件分发的 `resources/apiChange/HarmonyOS_<version>.json`（磁盘 29 个文件；代码中 `VERSION_LIST` 列 30 个版本，缺的 `HarmonyOS_5.0.0(12)_Release` 由 `getApiChangeList` 在 `inputStream==null` 时按空变更列表处理，不影响运行）。每个文件是一个数组，元素结构：
  - `interfaceChanges`：变更元信息——`id`（变更唯一号，如 `CH2026031976074`）、`sdkVersion`、`apiVersion`、`changeType`（“接口行为变更”/“非API变更”等）、`apiEffectiveVersion`（**是否做了版本隔离**，见下）、`changeReasonCategory`、`changeTitle`、`url`。
  - `affectedApis[]`：受此变更影响的 API 列表，每项含 `className`、`methodDefinition`（方法签名，**匹配代码调用的核心字段**）、`completePath`（在 SDK 中的声明路径）、`implementLanguage`（`typeScript`=ArkTS / `c`=C/C++）、`interfaceType`、`interfaceName`（接口名）、`invokeInstance`、`packageName`（包名）、`version`。
  - `isPresent`。
- **版本隔离（`apiEffectiveVersion`）**：HarmonyOS 允许一个变更只对 `targetSdkVersion ≥ 某版本` 的应用生效，称“已隔离（ISOLATED）”。`NOT_ISOLATED`/`COULD_NOT_ISOLATED` 表示对所有应用都生效，`generateScanResult` 中置 `affectedVersions="ALL"` 且 `isIsolated="false"`；`ISOLATED` 时计算展示版本区间并置 `isIsolated="true"`。代码在 `ApiScanUtil.generateScanResult`。

### 1.4 ArkAnalyzer：ArkTS 的静态分析引擎

- **ArkTS** 是 HarmonyOS 的主力应用开发语言，基于 TypeScript 扩展（加了 `@Component`/`@Entry` 等装饰器）。`.ets`/`.ts` 是源码，`.d.ets`/`.d.ts` 是声明文件。
- **ArkAnalyzer** 是华为开源的 ArkTS 静态分析框架（TypeScript 实现），能构建语法树/类型系统、做类型推断、分析 API 调用。本工具的 `apiscan-engine/` 就是把 ArkAnalyzer + 专门的扫描逻辑用 webpack 打包成的**单文件 Node 程序**（`index.js`，约 9.9MB）。
- 为什么用进程外 Node？ArkTS 分析需要完整的 TS 工具链和 ArkAnalyzer 运行时，Java 侧没有等价物；用 `ProcessBuilder` 起 Node 子进程、走文件（CSV）交换结果，是最干净的边界。

### 1.5 CDT 与 C/C++ 扫描

HarmonyOS 应用的 native 部分用 C/C++。C/C++ 扫描走两条路：

- **主路**：`CAPIScanner`（`com.huawei.deveco.programanalysis.apiscan.capiscan.CAPIScanner`，来自另一个 jar，源码不在本仓库）——基于 **CDT（C/C++ Development Tooling，Eclipse 的 C/C++ 解析器）** 做语义级扫描，准确但有边界（嵌套层级过深的文件会被跳过，进入 `failedFiles`）。
- **兜底路**：`CppCodeScanner`（`src/.../CppCodeScanner.java`，**源码在本仓库**）——对 `failedFiles` 二次扫描。方法名 `scanSingleCppFileByGrep` 保留 grep 历史命名，**实际实现是基于状态机的词法分析**（`CodeHandler`/`LineCommentHandler`/`BlockCommentHandler`/`StringHandler` 区分 CODE/COMMENT/STRING 区域，用 `indexOf(interfaceName)` 定位 + `checkPreChar`/`checkNextChar('(')` 上下文校验，并非正则），准确度低于 CDT 但保证覆盖率。两路结果都拼成 CSV。

---

## 2. 四个组件的职责分工（为什么是 4 个 jar）

整个功能横跨 DevEco Studio 的 4 个插件 jar，是“按能力边界解耦”的结果：

| 组件 | 包名 | 职责 | 源码位置 |
|---|---|---|---|
| **project-api-change-assistant**（核心） | `com.huawei.deveco.programanalysis.apiscan` | UI 容器、扫描调度、结果展示、CEF 路由、行号跟踪、勾选状态 | `src/`（42 个 .java） |
| **CodeChat** | `com.huawei.codegenie.chat.apichange` / `.service` | AI 聊天集成：构造 prompt、推送 CodeGenie webview、登录校验 | `src-chat/`（6 个 .java） |
| **ohos-resource** | `com.huawei.deveco.res.ohos.inspector.quickfix` | 编辑器 Inspection 的“运行 API Change Assistant”QuickFix 入口 | `src-res/`（1 个 .java） |
| **arkanalyzer-apiscan**（Node 引擎） | （TypeScript/Node） | 底层 ArkTS 静态扫描 | `apiscan-engine/` |

> 前端 UI（`api-change-assistant-view/index.html`）位于 `com.huawei.ohos` 插件目录，是构建产物，**不在本仓库内**。本仓库聚焦 Java 侧与 Node 引擎侧。

**核心 jar 不直接依赖 CodeChat**——它只定义了 `ApiChangeIntelligentService` 扩展点接口，“加入 AI 聊天”的实现由 CodeChat 插件运行期注入。这样：核心扫描能力可以独立存在；用户没装/没启用 CodeGenie 时，扫描照常工作，只是不显示“加入聊天”按钮（`createPagedResult` 里 `isCodeGenieEnable = service != null` 控制按钮可见性）。

---

## 3. 插件装配：从 plugin.xml 到 ToolWindow

装配文件：`resources/META-INF/hos-project-api-change-assistant.xml`。它声明了三件事：

1. **Action**：`id="Api change"` → `ApiChangeAssistantAction`，加到 `ToolsMenu` 末尾。这是用户主动打开工具窗口的入口。
2. **ToolWindow**：`id="API Change Assistant"`、`anchor="bottom"`、`factoryClass=ApiChangeAssistantFactory`、`doNotActivateOnStart="true"`（IDE 启动时不自动激活，省资源）。
3. **扩展点** `apiChangeIntelligentService`：接口 = `ApiChangeIntelligentService`。核心 jar 定义接口，由 CodeChat 插件提供实现 `ApiChangeIntelligentServiceImpl`（接口与实现的匹配已在本仓库源码核实；CodeChat 的 plugin.xml 注册关系不在本仓库，为依据扩展点机制的合理推断）。

装配流程：

```
IDE 启动
  → 加载核心 jar 的 plugin.xml
  → 注册 Action “Api change” 到 ToolsMenu
  → 注册 ToolWindow “API Change Assistant”（factory=ApiChangeAssistantFactory，但不立即创建内容）
  → 注册扩展点 apiChangeIntelligentService（此时无实现，等 CodeChat 注册）

用户点 Tools → Api change
  → ApiChangeAssistantAction.actionPerformed
  → ToolWindowManager.getToolWindow("API Change Assistant").show()
  → 首次显示触发 ApiChangeAssistantFactory.createToolWindowContent
       创建 ApiChangeWindow（JCEF 加载前端 index.html）
       注册 16 个 CefQueryHandler 到 message router
       注册工程同步监听器
```

注意：ToolWindow 的**可用性**是动态的——`ApiChangeAssistantAction.update` + `ApiChangeAssistantFactory.registerAvailableListener` 会在工程同步完成后，根据当前 RuntimeOS 切换 `toolWindow.setAvailable(...)`。

---

## 4. 可见性控制：为什么“仅中国区 + HarmonyOS 工程”

见 `src/.../actions/ApiChangeAssistantAction.java`。`update()`（每次刷新菜单时调）逻辑：

```
if 国家/地区(CountryRegionSetting) != "CN"          → 隐藏，ToolWindow.setAvailable(false)
else if 工程 RuntimeOS == OPEN_HARMONY              → 隐藏（仅 HarmonyOS 工程，纯 OpenHarmony 工程不显示）
else                                                → 显示，ToolWindow.setAvailable(true)
```

两个动态监听点保证状态随工程变化刷新：
- `ApiChangeAssistantFactory.init`：`runAfterOpened` + `runWhenSmart`，工程打开后注册 `OhosSyncDataListener`。
- `ApiChangeAssistantFactory.registerAvailableListener`：`syncSucceed` 回调里，在 EDT 中按 `RuntimeOS` 切 `setAvailable`。`ApiChangeWindow.registerNotifySyncRequiredListener` 也注册了一个同步监听器，作用是同步成功后给前端推 `syncSucceed` 事件（带最新模块树）。

国家/地区来自 `CountryRegionSetting`（IDE 级设置）。这个约束意味着本工具面向中国大陆 HarmonyOS 应用开发者。

---

## 5. 完整调用链路

下面是核心内容。三条主链路 + 通信协议。每条都标到文件级。

### 5.1 通信协议：前端 ↔ Java 怎么对话

`ApiChangeWindow`（`src/.../ApiChangeWindow.java`）是 JCEF 窗口封装，加载的前端位于 `com.huawei.ohos` 插件目录下的 `api-change-assistant-view/index.html`。URL 形如：

```
file:///<plugin>/api-change-assistant-view/index.html#/<eventKey>?theme=dark&countryRegion=CN&localeLanguage=zh&isNewUIEnabled=true
```

**前端 → Java（query）**：`ApiChangeWindow.ApiChangeMessageRouterHandler.onQuery` 解析请求体 `{key, data}`，按 `key` 从 `cefQueryHandlerMap` 取 `CefQueryHandler`，调 `handler.onQuery(data, callback)`，结果经 `CefQueryCallback.success/failure` 回前端。16 个 handler 在 `createToolWindowContent` 里注册（见 README §5 路由表）。

**Java → 前端（事件）**：`ApiChangeWindow` 暴露三处 `executeJavaScript` 派发自定义事件：

| 方法 | 事件名 | 触发时机 |
|---|---|---|
| `sendProgressUpdate(stage, percent, path)` | `progressUpdate` | 扫描进度轮询（每 300ms） |
| `updateLineNumber(detail)` | `treeDataUpdate` | 代码编辑导致行号变化 |
| `OhosSyncDataListener.syncSucceed` | `syncSucceed` | 工程同步完成，带模块树 |

### 5.2 链路 A：扫描（点击扫描 → 出结果）

这是最复杂的一条链路。涉及文件：`ApiChangeAssistantFactory$ApiChangeScanHandler`（内嵌handler）、`ApiScanUtil`、`ApiChangeLineTracker`、`ApiChangeAssistantFactory`（结果处理）、`task/ThreadPoolScheduledExecutor`、Node 引擎 `apiscan-engine/index.js`、`CppCodeScanner`。

```
前端发 {key:"ApiChangeScan", data: ApiScanParam(startVersion,endVersion,modulePaths,cancel)}
  │
  ▼
ApiChangeScanHandler.onQuery  [ApiChangeAssistantFactory.java 内嵌类]
  ├─ 若 cancel=true → indicatorMap.get(path).cancel() → callback.failure(取消)
  └─ new Task.Backgroundable("Scanning for API changes") { run(...) }
       │  ProgressManager.run(task)  ← 后台任务
       ▼
     dataBackup(projectBasePath)         ← 保存旧结果快照到 *TmpMap，供取消回滚
     indicatorMap.put(path, indicator)
     processQuery(...)
       │
       ├─ submitProcessTask(path)        ← 启进度轮询线程（见下）
       │
       ├─ future = executeOnPooledThread(
       │     ApiScanUtil.scanData(startVersion, endVersion, modulePaths, projectPath))
       │     │                                            ←  扫描主入口 [ApiScanUtil.java]
       │     │
       │     │  ① getAllApiChanges(start, end)
       │     │     遍历 VERSION_LIST(30个版本)，取 (start, end] 区间内所有
       │     │     apiChange/*.json → 合并为 List<ApiChangeItem>
       │     │
       │     │  ② invokeAndWait → saveAllDocuments()
       │     │     保存所有脏文档，确保扫到的是最新代码
       │     │
       │     │  ③ apiScanStageMap.put(path, PROCESSING_ARK_TS)
       │     │     scan(modulePaths, apiChanges, scanArkTSDetail, tmpFolder)
       │     │       prepareConfigFile → 写 configSample.json
       │     │         (projectPath / outPath / sdks[ohos,hms 的 ets 路径])
       │     │       dumpApiChange → 序列化 apiChange.json
       │     │       executeApiScan → ProcessBuilder 启 Node:
       │     │         <ide>/node --max_old_space_size=<配置>
       │     │           <harmony插件>/arkanalyzer-apiscan/index.js
       │     │           --configPath --apiModifiedPath --logPath
       │     │           --batchSize --tmpPath
       │     │         子进程输出被 DiscardStreamConsumer 丢弃（只看退出码+out文件）
       │     │         每 500ms checkCanceled()；取消则 destroyForcibly()
       │     │       readResult → 读 out/ 下唯一 CSV 结果文件
       │     │         （文件名形如 <reportName>Api<Date.now()>_<fileNum>.csv，
       │     │          Java 侧 split("_") 取末段再 split(".") 解析出 fileNum+内容）
       │     │       退出码非0 / 结果空 → 返回 null
       │     │
       │     │  ④ apiScanStageMap.put(path, PROCESSING_CPP)
       │     │     scanCpp(modulePaths, apiChanges, scanCppDetail, tmpFolder)
       │     │       processJsonObject → 组装 {sdkPath:[ohos/hms native include],
       │     │                                  timeout:60, modules:[{path,ninja}],
       │     │                                  apiChanges, tmpPath}
       │     │       CAPIScanner.getDefault().run(json)   ← CDT 主路扫描（另一 jar）
       │     │         返回 {content, fileNum, failedFiles}
       │     │       对 failedFiles 用 CppCodeScanner.scanCppFilesByGrep 二次扫描
       │     │         [src/.../CppCodeScanner.java]（状态机词法分析，非正则；见 §1.5）
       │     │       合并：ArkTS CSV + C++ CSV（含二次扫描结果）
       │     │
       │     │  ⑤ apiScanStageMap.put(path, FINISHED)
       │     │     scanContent = ArkTs CSV + Cpp CSV
       │     │     apiChangeItemMap = 按 changeId 建 Map
       │     │     getApiChangeResult(scanContent, apiChangeItemMap)
       │     │       parseCSVContent  ← opencsv 解析（列：Api Name / Api Type /
       │     │                              ... / Invoke Location(col7) /
       │     │                              ChangeId(col10) / MethodDefinition(col11)）
       │     │       逐行：getLanguage（按 methodDef 反查 apiChangeMap 定语言）
       │     │             isSameAPI（ArkTS 用 completePath+className+
       │     │                       invokeInstance+methodDef；其中 interface 类型时
       │     │                       className 比对需 connectPrefix 拼接 interfaceName；
       │     │                       C/C++ 仅 methodDef）
       │     │             generateScanResult → ApiDisplayItem
       │     │               （apiDefinition / language / location(相对路径) /
       │     │                 changeId / sdkVersion / changeTitle / affectedVersions /
       │     │                 tutoringUrl / isIsolated）
       │     │     返回 Pair<List<ApiDisplayItem>, failedFiles>
       │     │
       │     │  finally: traceSourceVersion(...) + clearProgress(path)
       │     ▼
       │  while(!future.isDone()) future.get(100ms) + checkCanceled()  ← 轮询等扫描完成
       ▼
     futureProcessDisplayItem = executeOnPooledThread(processDisplayItem(...))
       │
       │  unifiedPath(apiDisplayItems, project)   [ApiChangeAssistantFactory.java]
       │    ArkTS: 相对模块路径 → 绝对路径（getAbsolutePathForRelativeApiPath）
       │    C/C++: 绝对路径 → 相对模块路径
       │  apiDisplayItemMap.put(path, items)        ← 存“全量结果”
       │  apiDisplayItemsSearchMap.put(path, items) ← 存“当前过滤结果”（初始=全量）
       │  createTreeDataManager(items, project)     ← 建 ApiChangeTreeManager
       │    .init()                                 ← 初始化勾选状态
       │  apiChangeTreeManagerMap.put(path, manager)
       │  createLeftPagedResult(items, 0, 20, project)  ← 左树第0页，pageSize=20
       │    transferToTree：扁平→三级树（changeId → apiDefinition → 代码位置）
       │    每个二级节点只返回1个三级子节点（懒加载，其余靠 getLocation 按需取）
       │    附 searchParams（树层级 key 供前端搜索）
       │  callback.success(首页 JSON)  ← 回前端
       │    （注：是否显示“加入聊天”按钮的 isCodeGenieEnable 字段
       │      仅由 createPagedResult 设置，本初始路径走 createLeftPagedResult，
       │      前端经分页/搜索/定位的 createPagedResult 路径才会拿到该字段）
       │
       │  ApiChangeLineTracker.setUp(apiScanData, project, contentPanel)  ← 启行号跟踪(见链路B)
       │  记录 failedFiles 日志
       ▼
     removeFromMap(path)  ← 清理 *TmpMap
  │
  ▼ (若取消/异常)
  processException → 取消两个 future + dataRecover(恢复快照) + cancelApiScanProcess
```

**进度上报**（`ApiChangeScanHandler.submitProcessTask` + `executeProgress`）：

```
ThreadPoolScheduledExecutor 每 300ms 轮询
  读 <tmpPath>/processArkTs.txt 或 progressCpp.txt
    （文件由 Node 引擎 / C++ 扫描器写入，内容 {totalNum, finishedNum, currentModule, currentPercent?}）
  计算 percent = finishedNum/totalNum*100
    （ArkTS 阶段还加 currentPercent/totalNum 的细粒度增量）
  apiChangeWindow.sendProgressUpdate(stage, percent, currentModule)
    → executeJavaScript 派发 progressUpdate 事件给前端

阶段状态机（apiScanStageMap）：
  STARTED → PROCESSING_ARK_TS → PROCESSING_CPP → FINISHED
```

> **Node 引擎侧契约**（`apiscan-engine/index.js` 的 `run` 函数，已核实）：`getAffectedApis(cliOptions)`（从 `--apiModifiedPath` 加载变更清单）→ 解析 CLI → 加载 `configSample.json` → `buildSdkScene(sdks)` 构建 SDK 语法树场景 → 按 `batchSize/100` MB 切分工程文件为多个 task → 写 `processArkTs.txt`（初始 `{totalNum}`）→ 线程池并发扫描 → `sdkScene.inferTypes()` 类型推断 → `apiChangesFilter(affectedApis, sdkScene, report)` 过滤受影响 API → 写 CSV 到 `out/<reportName>Api<Date.now()>_<fileNum>.csv`。CLI 选项由 `parseCliOptions`（commander）解析，含 `--configPath --apiModifiedPath --outPath --tmpPath --logPath --batchSize` 等。

### 5.3 链路 B：行号实时跟踪（编辑代码后行号自动跟随）

涉及文件：`ApiChangeLineTracker`（`src/.../ApiChangeLineTracker.java`）、`ApiChangeTreeManager`、`ApiChangeTreeUtil`、`ApiChangeWindow`、bean `ApiMarker`/`ApiLineChangeData`。

扫描完成时 `processDisplayItem` 末尾调 `apiChangeLineTracker.setUp(...)`：

```
setUp(apiScanData, project, contentPanel)
  ├─ 清空 fileToMarkers
  ├─ 创建 DocumentListener（documentChanged → sendCodeLineNumberChanges）
  ├─ addEditorChangeListener(project)  ← 订阅 FileEditorManagerListener
  │     fileOpened/selectionChanged → setTrackerOnFile + addListenerOnFile
  │     fileClosed → removeListenerOnFile
  └─ 对当前已打开的编辑器立即挂载
```

**建标记**（`setTrackerOnFile` → `addApiMarkers`）：

```
对当前打开文件，在 apiScanData 中找命中该文件的 ApiDisplayItem
  对每个命中行：
    lineText = document 取该行文本
    跳过行首空白，得 contentStart..lineEnd
    document.createRangeMarker(contentStart, lineEnd)
      setGreedyToLeft/Right(false)  ← 只跟踪该行内容区间
    markers.add(ApiMarker(rangeMarker, filePath, oldLineNumber, apiDisplayItem))
  fileToMarkers.put(virtualFile, markers)
```

**重算行号**（`sendCodeLineNumberChanges`，documentChanged 时触发）：

```
对 fileToMarkers.get(file) 的每个 marker：
  newLine = document.getLineNumber(marker.getStartOffset()) + 1   ← RangeMarker 自动跟移后的新行号
  若 oldLine != newLine：
    marker.setOldLineNumber(newLine)
    apiDisplayItem.setLocation(filePath + ":" + newLine)
    oldKey = generateKey(item, oldLine)   ← SHA-256(changeId-apiDefinition-filePath-line)
    newKey = generateKey(item, newLine)
    记 ApiLineChangeData(filePath, newKey, oldKey, oldLine, newLine)

排序：若为新增行(isAdd) → 按旧行号降序；否则升序
  ← 避免行号偏移连锁影响（先处理靠后的新增/先处理靠前的删除）

对每个 apiLineChangeData：
  updateTreeManagerInfo(item, oldKey)
    → ApiChangeTreeManager.syncApiDisplayItemChange  ← 同步勾选状态到新 key
  ApiChangeTreeUtil.processLineChange(project, oldKey, newKey)  ← 更新内部 key 映射
  contentPanel.updateLineNumber(apiLineChangeData)
    → executeJavaScript 派发 treeDataUpdate 事件给前端
```

效果：用户改代码后，扫描结果的行号定位与“已修复”勾选自动跟随，无需重新扫描。这是用 IntelliJ `RangeMarker` 的“编辑即跟移”特性实现的——marker 的 offset 在文档编辑时由平台自动维护。

### 5.4 链路 C：加入 AI 聊天（未修复项 → CodeGenie 适配建议）

这是跨 3 个 jar 的链路：核心 jar → 扩展点 → CodeChat jar。涉及文件：`ApiChangeAddToChatHandler`（核心）、`ApiChangeIntelligentService`（核心接口）、`ApiChangeIntelligentServiceImpl`（CodeChat 实现）、`ApiChangeService` + `APIChangeChatManager`（CodeChat 推送）、资源 `apiChangePrompts.json`。

```
前端发 {key:"apiChangeAddToChat", data:{type, apiDisplayItem}}
  │  type 可为 "fileNode"（整文件所有命中）或单条
  ▼
ApiChangeAddToChatHandler.onQuery  [src/.../handler/ApiChangeAddToChatHandler.java]
  ├─ ApiChangeIntelligentService.getInstance(project)
  │    ← ExtensionPointName "com.huawei.harmony.apiChangeIntelligentService"
  │    ← 拿 CodeChat 注册的 ApiChangeIntelligentServiceImpl
  │    若 service==null → callback.failure(-1, "Service not available")（CodeGenie 未启用）
  ├─ 解析 {type, apiDisplayItem}
  └─ service.handleRequest(project, buildAddtoChatRequest(node, type))
       │
       │  buildAddtoChatRequest:
       │    fileNode → getApiDisplayItemsToAsk 取同 changeId+apiDefinition+filePath 的所有项
       │    单条 → 只含该项
       │    apiChangeFixPromptsMap.get(changeId)  ← 静态初始化时读 apiChangePrompts.json
       │      （161 条，按 changeId 索引，取 ApiChangeFixPrompt{changeId,description,additionPrompt}）
       │    组装 AddToChatRequest(prompt, filePath, apiDisplayItems)
       ▼
  ApiChangeIntelligentServiceImpl.handleRequest  [src-chat/.../service/ApiChangeIntelligentServiceImpl.java]
    ├─ readFile(filePath)  ← LocalFileSystem + FileDocumentManager（走 IDE 文档缓存）
    │    取源文件全文
    ├─ getCodeLines(sourceCode)  ← 按行切分，记每行 [startIndex, endIndex]（O(1)取上下文）
    ├─ getAskItemList：
    │    对每个变更行 buildAskItem → 取 [line-10, line+10] 上下文
    │      记 CodeRange + changeLines，封装 AskItem(range, content, changeLines)
    ├─ buildQuestion(askItemList)：
    │    拼 PROMPT_HEAD("请给出不兼容API适配建议…"）+ 各 AskItem 的 JSON
    │    超 80000 字符则分多条
    │    每条追加 PROMPT_END("可以参考如下变更文档") + prompt.description（适配指导）
    ├─ 组装 message = {message:[问题列表], fixApiInfo, promptShow}
    │    （fixApiInfo = 文件名；仅当 askItemList.size()==1 时追加 ":line-line"）
    └─ intelligentToWebView(project, message)
         ├─ checkLoginStatus：
         │    LoginService.isLogin() 未登录 → 弹登录提示，return
         │    getServiceStatement() 未同意服务条款 → 提示同意，return
         └─ ApiChangeService.getInstance(project).showAPIChangeMessageInWebview(message)
              │                                    [src-chat/.../apichange/ApiChangeService.java]
              │  切 EDT
              ▼
            ChatMessageUtil.showChatToolWindow(project)  ← 激活 CodeGenie 聊天面板
            若 ChatMessageManager 未初始化：
              setApiChangeFixChat(true) + setApiChangeFixMessage(message)  ← 暂存，待初始化后消费
            否则：
              APIChangeChatManager.getInstance(project).init()  ← createSessions 建会话
              .sendWebviewAPIChangeMessage(message)
                │                                    [src-chat/.../apichange/APIChangeChatManager.java]
                │  构造 ChatMessage：
                │    type = SEND_API_CHANGE_MESSAGE
                │    menuTask = TaskTypeEnum.API_CHANGE
                │    answerId = sessionId
                │    chatId, apiChangeMessage
                ▼
              ChatMessageManager.sendChatMessage(json, false, false)
                ← 推到 CodeGenie 聊天 webview，由 AI 侧消费并生成适配建议
```

**关键设计**：核心 jar 通过扩展点 `apiChangeIntelligentService` 解耦 CodeGenie——它不知道 CodeGenie 的存在，只定义接口，运行期由平台注入实现。这使扫描能力可独立工作，AI 能力可按需启用。`createPagedResult` 里的 `isCodeGenieEnable = service != null` 让前端据此决定是否显示“加入聊天”按钮。

---

## 6. 结果展示模型与勾选状态

### 6.1 扁平列表 → 三级树

`ApiChangeTreeUtil.transferToTree(pageItems, project)` 把 `List<ApiDisplayItem>` 转成三级树（见 `ApiChangeAssistantFactory.createLeftPagedResult`）：

- **一级**：变更 ID（`changeId`）
- **二级**：API 定义（`apiDefinition`，方法签名）
- **三级**：代码位置（文件:行）

右侧详情（`groupCodeLocationsByFile`）把三级叶子按文件再聚合成 `fileNode`，便于按文件查看。

### 6.2 分页

- **左树**：`createLeftPagedResult`，`pageSize=20`；每个二级节点只返回 1 个三级子节点（懒加载，其余靠 `getLocation` 按需取）。
- **右侧定位列表**：`GetLocationHandler` 按 `changeID + methodDefinition` 过滤后分页。
- **过滤**：`FilterApiChangesHandler` 按 apiVersion / changeId / language / apiId / changeType / fixStatus / searchValue 过滤，结果存入 `apiDisplayItemsSearchMap`（后续分页/搜索都基于这个“当前可见集”）。
- **搜索**：`SearchContentHandler` 按 API 定义 / 代码位置文本搜索，结果也存入 `apiDisplayItemsSearchMap`。

### 6.3 勾选状态（已修复标记）

`ApiChangeTreeManager`（`src/.../ApiChangeTreeManager.java`）维护每棵子树的勾选状态。key 由 `changeId-apiDefinition-filePath-line` 经 SHA-256 生成（`ApiChangeTreeUtil.generateSha256`），保证唯一且不泄露路径。

`ApichangeTreeFileOncheckHandler`（`src/.../handler/ApichangeTreeFileOncheckHandler.java`）：
- 前端勾选 → `handleStatus(key, checked, type)` 更新状态并持久化（缓存文件为**项目目录下** `<projectPath>/.idea/apichange/apiChangeCache.csv`）。
- 返回 `ApiChangeOnCheckedResponse` 告知父子节点联动状态。
- `FilterApiChangesHandler` 据此过滤 Fixed / Unfixed。

---

## 7. 关键 Bean 一览

数据模型集中在 `src/.../bean/`（约 20 个）。核心的：

| Bean | 文件 | 作用 |
|---|---|---|
| `ApiChangeItem` | `bean/ApiChangeItem.java` | 一个变更：`interfaceChanges` + `affectedApis[]` + `isPresent`；内嵌 `InterfaceChange` |
| `ApiDisplayItem` | `bean/ApiDisplayItem.java` | 扁平展示项：apiDefinition, language, affectedVersions, location(相对路径), tutoringUrl, sdkVersion, changeId, changeTitle, changeType, isIsolated, absolutePath |
| `TreeApiDisplayItem` | `bean/TreeApiDisplayItem.java` | 树节点：title, subtitle, key(sha256), checked, type, children, childrenCount, apiDisplayItem；带 builder |
| `ApiScanData` | `bean/ApiScanData.java` | 一次扫描的完整数据：displayItem[] + tree[] + treeSelect + checkedKeys[] |
| `ApiScanParam` | `bean/ApiScanParam.java` | 前端扫描请求：startVersion, endVersion, modulePaths[], pageSize, cancel（record/不可变） |
| `ApiChangeFilterParams` | `bean/ApiChangeFilterParams.java` | 过滤参数：apiVersion, changeId, language, apiId, changeType, fixStatus, searchValue, pageSize |
| `AddToChatRequest` | `bean/AddToChatRequest.java` | AI 请求：prompt(ApiChangeFixPrompt), filePath, apiDisplayItems[] |
| `ApiChangeFixPrompt` | `bean/ApiChangeFixPrompt.java` | 修复提示：changeId, description, additionPrompt |
| `ApiMarker` | `bean/ApiMarker.java` | 行跟踪：rangeMarker, filePath, oldLineNumber, apiDisplayItem（可变 class，有 setter，行号变化时更新 oldLineNumber） |
| `ApiLineChangeData` | `bean/ApiLineChangeData.java` | 行变更：filePath, key(new), oldKey, oldLineNumber, newLineNumber（record） |
| `ModuleNode` | `bean/ModuleNode.java` | 模块树：path, title, value, children |
| `ProcessStatusEnum` | `bean/ProcessStatusEnum.java` | 阶段枚举：STARTED/PROCESSING_ARK_TS/PROCESSING_CPP/FINISHED/FAILED（FAILED 为异常分支，正常状态机见 §5.2） |

---

## 8. 配置与资源清单

| 资源 | 文件 | 说明 |
|---|---|---|
| 版本变更数据 | `resources/apiChange/HarmonyOS_*.json` (磁盘 29 个；VERSION_LIST 30 个版本) | 各版本 API 变更结构化数据（affectedApis + interfaceChanges）；缺失版本按空变更处理 |
| AI 修复提示 | `resources/apiChangeDescription/apiChangePrompts.json` | 161 条 changeId → 适配指导（中文 Markdown），用于 AI prompt |
| 中文 i18n | `resources/messages/HosProjectApichangeMgmt_zh_CN.properties` | CSV 表头、通知文案、工具窗口标题等 |
| ArkTS 扫描配置 | `apiscan-engine/config/arkanalyzer.json` | supportFileExts=[.ets,.ts,.d.ets,.d.ts]、ignoreFileNames(oh_modules/build/.cxx/...)、sdkGlobalFolders、tsconfig |
| SDK 版本映射 | `apiscan-engine/SDKConfig.json` | SDK 版本→路径映射 |
| Node 引擎入口 | `apiscan-engine/index.js` (9.9MB webpack bundle) | ArkAnalyzer 打包产物，CLI 解析 + 扫描 + 类型推断 + 过滤 + CSV 输出 |
| Node worker | `apiscan-engine/worker.js` | worker 线程（同为 webpack bundle，未深入核实内部结构） |
| 类型声明 | `apiscan-engine/lib/` | .d.ts（ArkUI 组件声明 + ohos-typescript 标准 lib） |
| 插件注册 | `resources/META-INF/hos-project-api-change-assistant.xml` | Action + ToolWindow + 扩展点声明 |
| IDE 配置 | `ApiScanConfigs`（`src/.../ApiScanConfigs.java`） | 仅 `maxOldSpaceSize`（Node 内存）持久化（`ProjectMgmtPropertiesComponent`，key=`API_SCAN_MAX_OLD_SPACE_SIZE`）；`batchSize` 由其推导（≤3072→1000，每超 1024 增 500）、`systemMemory` 运行时读系统内存，二者均为计算值无 setter |

### ArkTS 扫描配置（`arkanalyzer.json`）字段含义

- `supportFileExts`：扫描的文件扩展名（`.ets`/`.ts`/`.d.ets`/`.d.ts`）。
- `ignoreFileNames`：扫描时忽略的目录/文件（依赖产物、构建产物、测试、预览）。
- `sdkGlobalFolders`：SDK 中作为全局类型来源的目录（`component`、`@internal`）。
- `isScanAbc`：是否扫描 ABC（Ark Bytecode）字节码——配置里 `true`，但 Node 引擎 `run` 里 `sceneCfg.getOptions().isScanAbc = false`（实际关闭，只扫源码）。
- `enableLeadingComments`/`enableBuiltIn`：注释/内置处理开关。
- `tsconfig`：TS 编译配置文件名（`tsconfig.json`）。

---

## 9. 依赖的外部类（运行期由其它插件提供）

反编译头注释 `Could not load the following classes` 列出的类均来自 DevEco 其它插件 jar，核心 jar 运行期通过类加载器隔离访问：

- `com.huawei.deveco.projectmgmt.ohos.cef.*` — CEF 桥（`CefQueryHandler`、`ThemeHandler`、`SelectorHandler`、`CefMessageRouterHandlerProxy`）（harmony 插件）
- `com.huawei.deveco.projectmodel.ohos.*` — 工程模型（`ProjectModel`、`ModuleModel`、`ProjectModelManager`、`RuntimeOS`、`OhosSyncDataListener`）（openharmony 插件）
- `com.huawei.deveco.sdkmanager.*` — SDK 版本（`HosSdkVersion`、`ApiVersion`、`SimpleHosVersionMapper`、`ComponentConstants`）（openharmony 插件）
- `com.huawei.deveco.common.country.setting.CountryRegionSetting` — 国家/地区设置
- `com.huawei.deveco.common.ide.InnerToolsLocationUtil` — IDE 内置工具（node、sdk）路径
- `com.huawei.deveco.programanalysis.apiscan.capiscan.CAPIScanner` — C/C++ 扫描器（另一 jar）
- `com.huawei.codegenie.*` — CodeGenie/CodeChat（codegenie-plugin）

这些类的源码不在本仓库，但调用方式已从反编译代码还原。

---

## 10. 关键文件索引（按关注点）

| 关注点 | 文件 |
|---|---|
| 入口与可见性控制 | `src/.../actions/ApiChangeAssistantAction.java` |
| ToolWindow 创建 + CEF 路由 + 16 个 Handler | `src/.../ApiChangeAssistantFactory.java` |
| JCEF 窗口与 JS 桥 | `src/.../ApiChangeWindow.java` |
| 扫描主流程（ArkTS+C++ + 结果转换） | `src/.../ApiScanUtil.java` |
| C/C++ grep 兜底扫描器 | `src/.../CppCodeScanner.java` |
| 代码行号实时跟踪 | `src/.../ApiChangeLineTracker.java` |
| 结果树管理 / 勾选状态 | `src/.../ApiChangeTreeManager.java`、`ApiChangeTreeUtil.java` |
| 加入 AI 聊天入口 | `src/.../handler/ApiChangeAddToChatHandler.java` |
| AI 服务接口（扩展点） | `src/.../handler/utils/ApiChangeIntelligentService.java` |
| AI 服务实现（prompt 构造） | `src-chat/.../service/ApiChangeIntelligentServiceImpl.java` |
| 聊天消息推送 | `src-chat/.../apichange/ApiChangeService.java`、`APIChangeChatManager.java` |
| 编辑器 QuickFix 入口 | `src-res/.../quickfix/RunApiChangeAssistantQuickFix.java` |
| 进度轮询线程池 | `src/.../task/ThreadPoolScheduledExecutor.java` |
| 通知 | `src/.../ApiNotifyUtil.java` |
| 扫描配置持久化 | `src/.../ApiScanConfigs.java` |
| 底层 ArkTS 扫描引擎 | `apiscan-engine/index.js`、`worker.js`、`config/arkanalyzer.json` |
| 版本变更数据 | `resources/apiChange/HarmonyOS_*.json` |
| AI 修复提示词 | `resources/apiChangeDescription/apiChangePrompts.json` |
| 插件注册 | `resources/META-INF/hos-project-api-change-assistant.xml` |
| 国际化 | `resources/messages/HosProjectApichangeMgmt_zh_CN.properties` |

---

## 11. 一图总览

```
┌─────────────────────────────── DevEco Studio (IntelliJ Platform) ───────────────────────────────┐
│                                                                                                   │
│  ToolsMenu → ApiChangeAssistantAction                                                             │
│    └─ 可见性：仅 CN + 非 OpenHarmony 工程                                                          │
│                                                                                                   │
│  ToolWindow "API Change Assistant" (bottom)                                                       │
│    └─ ApiChangeAssistantFactory.createToolWindowContent                                           │
│         └─ ApiChangeWindow (JCEF)  ──加载──>  api-change-assistant-view/index.html (前端,不在仓库) │
│              ↕ CEF query {key,data} / CustomEvent                                                  │
│              │ 16 个 CefQueryHandler                                                              │
│              │  ├─ ApiChangeScan ──> Task.Backgroundable ──> ApiScanUtil.scanData                  │
│              │  │                                        ├─ ArkTS: Node 子进程 (apiscan-engine)     │
│              │  │                                        │    configSample.json + apiChange.json   │
│              │  │                                        │    → out/*.csv                          │
│              │  │                                        │    进度: processArkTs.txt                │
│              │  │                                        ├─ C++: CAPIScanner(CDT) + CppCodeScanner  │
│              │  │                                        │    进度: progressCpp.txt                │
│              │  │                                        └─ 合并 CSV → getApiChangeResult           │
│              │  │                                           → List<ApiDisplayItem>                 │
│              │  ├─ loadPageData/Filter/Search ──> 三级树分页 + 过滤                                │
│              │  ├─ CodeLocationJump ──> 打开编辑器/定位行/展开折叠                                  │
│              │  ├─ apichangeTreeFileOncheck ──> 勾选状态(.csv 持久化, SHA-256 key)                 │
│              │  └─ apiChangeAddToChat ──> 扩展点 ApiChangeIntelligentService                       │
│              │                                            │                                       │
│  编辑代码时:                                          ┌─────┘                                       │
│  ApiChangeLineTracker                              │                                               │
│   RangeMarker 自动跟移 → documentChanged            ▼                                               │
│   → 重算行号 → treeDataUpdate 事件          ApiChangeIntelligentServiceImpl (CodeChat jar)        │
│                                            ├─ 读源文件 + 取±10行上下文                              │
│                                            ├─ 拼 prompt + apiChangePrompts.json(161条)           │
│                                            └─ ApiChangeService → APIChangeChatManager            │
│                                                 → ChatMessageManager.sendChatMessage              │
│                                                   → CodeGenie 聊天 webview (AI 适配建议)           │
└───────────────────────────────────────────────────────────────────────────────────────────────────┘
```
