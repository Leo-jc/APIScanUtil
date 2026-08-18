# DevEco Studio — API Change Assistant 完整流程源码

从 `D:\Application\DevEco Studio`（DevEco Studio 26.0.0.621，IntelliJ Platform 2026.1.1）中提取并反编译的 **API Change Assistant（API 变更助手）** 完整源码与资源。

> 反编译产物使用 CFR 0.152 生成，字段/方法体还原度高，但保留了反编译标记（`$$$reportNull$$$0`、`@Generated`、`synthetic` 等）与少量 `Could not load the following classes` 头注释（指向运行期由其它插件提供的依赖）。这些不影响对流程与逻辑的理解。

---

## 1. 这是什么

**API Change Assistant** 是 DevEco Studio 内置的工具窗口（Tool Window，挂在 IDE 底部），用于：

1. 在 HarmonyOS/OpenHarmony SDK **版本之间**扫描工程代码，找出使用了「已发生不兼容变更 API」的位置；
2. 以树形 + 分页列表展示受影响的 API、变更类型、影响的版本区间、代码定位；
3. 支持搜索、多维度过滤（版本/语言/变更类型/修复状态）、导出 CSV；
4. 一键跳转到代码行，并随代码编辑实时跟踪变更行号；
5. 对未修复项可标记「已修复」，并可「加入 AI 聊天」由 CodeGenie（CodeChat）给出适配建议。

可见性约束：仅在 **国家/地区 = CN** 且工程运行时 OS **非 OpenHarmony**（即 HarmonyOS 工程）时启用（见 `ApiChangeAssistantAction.update`）。

---

## 2. 目录结构

```
DevEcoAPIScan/
├── tools/
│   └── cfr-0.152.jar                      # 反编译器（Maven Central 下载）
├── jars/                                  # 原始 jar 拷贝
│   ├── project-api-change-assistant-26.0.0.621.jar   # ★核心 jar
│   ├── CodeChat.jar                       # AI 聊天侧（codegenie-plugin）
│   └── ohos-resource-26.0.0.621.jar       # 编辑器 QuickFix 入口
├── src/                                   # ★核心 jar 反编译源码（42 个 .java）
│   └── com/huawei/deveco/programanalysis/apiscan/
│       ├── actions/        ApiChangeAssistantAction        入口 Action
│       ├── ApiChangeAssistantFactory.java                  ★ToolWindow + CEF 路由中心
│       ├── ApiChangeWindow.java                            JCEF 浏览器窗口
│       ├── ApiScanUtil.java                                ★扫描执行核心
│       ├── CppCodeScanner.java                             C/C++ 源码 grep 扫描器
│       ├── ApiChangeTreeManager / ApiChangeTreeUtil        结果树管理 / 工具
│       ├── ApiChangeLineTracker.java                       ★代码行号实时跟踪
│       ├── ApiNotifyUtil / ApiScanConfigs                  通知 / 扫描配置
│       ├── handler/                                       CEF 请求处理器
│       │   ├── ApiChangeAddToChatHandler                  ★加入 AI 聊天
│       │   ├── ApichangeTreeFileOncheckHandler            勾选/标记已修复
│       │   ├── LoadModuleInfosHandler                     加载模块树
│       │   └── utils/ApiChangeIntelligentService          AI 服务接口（扩展点）
│       ├── bean/                                          数据模型（~20 个）
│       ├── cef/HosCefQueryConstant                        CEF query 常量
│       ├── task/ThreadPoolScheduledExecutor               进度轮询线程池
│       ├── utils/ThemeChangeUtil                          主题切换
│       ├── icon/Icons                                     图标引用
│       └── resources/HosProjectMgmtBundle                 i18n bundle 桥接
├── src-chat/                              # CodeChat.jar 反编译源码（6 个 .java）
│   └── com/huawei/codegenie/chat/
│       ├── apichange/    ApiChangeService / APIChangeChatManager / AskItem / CodeLine / CodeRange
│       └── service/      ApiChangeIntelligentServiceImpl   ★AI 服务实现（扩展点实现）
├── src-res/                              # ohos-resource 反编译源码（1 个 .java）
│   └── com/huawei/deveco/res/ohos/inspector/quickfix/RunApiChangeAssistantQuickFix
├── apiscan-engine/                       # ★底层 ArkTS 扫描引擎（Node.js，已为源码）
│   ├── index.js (9.9MB webpack bundle)   # ArkAnalyzer 打包产物
│   ├── worker.js                          # worker 线程
│   ├── config/arkanalyzer.json            # 扫描配置（扩展名/忽略目录/SDK 目录）
│   ├── SDKConfig.json / configSample.json # SDK 版本与示例配置
│   └── lib/                               # .d.ts 类型声明（ArkUI/ohos-typescript）
├── resources/                            # 核心 jar 内的非类资源
│   ├── apiChange/*.json (30 个)          # 各版本 API 变更数据
│   ├── apiChangeDescription/apiChangePrompts.json  # 161 条 AI 修复提示词
│   ├── messages/HosProjectApichangeMgmt*.properties # 中英文 i18n
│   ├── icons/menu_icons/apiChange/*.svg  # 图标
│   └── META-INF/hos-project-api-change-assistant.xml  # 插件注册
└── docs/
    └── ARCHITECTURE.md                   # 详细架构与流程文档
```

---

## 3. 涉及的 4 个组件（jar / 模块）

| 组件 | 来源路径 | 包名 | 职责 |
|---|---|---|---|
| **project-api-change-assistant** | `plugins/harmony/lib/` | `com.huawei.deveco.programanalysis.apiscan` | 主功能：UI、扫描调度、结果展示、路由 |
| **CodeChat** | `plugins/codegenie-plugin/lib/` | `com.huawei.codegenie.chat.apichange` / `.service` | AI 聊天集成：构造 prompt、推送 CodeGenie webview |
| **ohos-resource** | `plugins/openharmony/lib/` | `com.huawei.deveco.res.ohos.inspector.quickfix` | 编辑器 Inspection 的「运行 API Change Assistant」QuickFix |
| **arkanalyzer-apiscan** | `plugins/harmony/arkanalyzer-apiscan/` | （Node.js） | 底层 ArkTS 扫描引擎（ArkAnalyzer 打包） |

> 前端 UI（`api-change-assistant-view/index.html`）位于 `com.huawei.ohos` 插件目录，本次未包含（非 Java，且为构建产物）。

---

## 4. 完整流程（端到端）

```
用户触发                                                  IDE / 进程外
─────────                                                ──────────────
 ToolsMenu → ApiChangeAssistantAction
   │  (仅 CN + 非 OpenHarmony 工程可见)
   ▼
 ToolWindow.show() → ApiChangeAssistantFactory.createToolWindowContent
   │  创建 ApiChangeWindow(JBCefBrowser) 加载 api-change-assistant-view/index.html
   │  注册 15 个 CefQueryHandler 到 message router
   ▼
 前端 Vue/React 页面 ←─CEF {key,data} JSON─→ Java Handler（见 §5 路由表）
   │
   ├─ ChooseApiVersion   → 返回可选起止版本列表 (VERSION_LIST)
   ├─ loadModulesInfo    → 返回工程模块树
   ├─ loadApiScanSetting → 返回 Node 内存/系统配置
   │
   ├─ ApiChangeScan ★扫描
   │     ApiChangeScanHandler.onQuery
   │       → Task.Backgroundable「Scanning for API changes」
   │       → ApiScanUtil.scanData(startVer, endVer, modulePaths, projectPath)
   │           ① getAllApiChanges 合并版本区间内的 apiChange/*.json → ApiChangeItem 列表
   │           ② saveAllDocuments 保存所有已修改文件
   │           ③ ArkTS 扫描：executeApiScan
   │              ProcessBuilder 启动 node index.js
   │                --configPath --apiModifiedPath --logPath --batchSize --tmpPath
   │                --max_old_space_size=<配置>
   │              读取 out/ 下 CSV 结果（行号=文件数）
   │           ④ C++ 扫描：CAPIScanner.getDefault().run(json) （CDT，一次扫描）
   │              + scanCppFilesByGrep（CppCodeScanner，对失败文件二次 grep）
   │           ⑤ 合并 CSV → getApiChangeResult → List<ApiDisplayItem>
   │       → processDisplayItem：unifiedPath 统一路径、建树、分页
   │       → 同步启动进度轮询线程（读 progressArkTs.txt / progressCpp.txt）
   │           通过 sendProgressUpdate → executeJavaScript 派发 progressUpdate 事件
   │       → cefQueryCallback.success(首页 JSON) 回前端
   │
   ├─ loadPageData / getLocation → 分页返回左树/代码定位列表
   ├─ FilterApiChanges          → 按版本/语言/变更类型/修复状态/搜索值过滤
   ├─ SearchContent             → 按 API 定义/代码位置文本搜索
   ├─ CodeLocationJump          → 打开文件、定位行、展开折叠、滚动居中
   ├─ apichangeTreeFileOncheck  → 勾选标记已修复（持久化 .csv 缓存）
   ├─ CsvFileLocation           → 导出 CSV（含 HYPERLINK 公式）
   ├─ DocumentLinkJump / browseSettingHelp → 浏览器打开文档/帮助
   │
   └─ apiChangeAddToChat ★加入 AI 聊天
         ApiChangeAddToChatHandler.onQuery
           → ApiChangeIntelligentService(扩展点) 实例 = ApiChangeIntelligentServiceImpl
           → buildAddtoChatRequest：查 apiChangePrompts.json 取该 changeId 的修复提示
           → handleRequest：
               读取受影响源文件全文 → getCodeLines
               对每处变更行取 ±10 行上下文 → buildAskItem
               buildQuestion 拼 prompt（「请给出不兼容API适配建议…」+ 上下文 + 提示描述）
               校验登录（LoginService.isLogin / getServiceStatement）
           → ApiChangeService.showAPIChangeMessageInWebview
           → APIChangeChatManager.sendWebviewAPIChangeMessage
               构造 ChatMessage(type=SEND_API_CHANGE_MESSAGE, menuTask=API_CHANGE)
               → ChatMessageManager.sendChatMessage → CodeGenie 聊天 webview

  代码编辑时：
   ApiChangeLineTracker（FileEditorManagerListener + DocumentListener）
     用 RangeMarker 跟踪每个变更行 → documentChanged 时重算行号
     → updateTreeManagerInfo 同步树勾选状态
     → ApiChangeWindow.updateLineNumber → executeJavaScript 派发 treeDataUpdate 事件
```

详细架构、数据模型、扩展点说明见 [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md)。

---

## 5. CEF 请求路由表（前端 ↔ Java）

`ApiChangeAssistantFactory.createToolWindowContent` 注册的 handler（前端以 `{key, data}` 发起 CEF query）：

| key | Handler 类 | 作用 |
|---|---|---|
| `ApiChangeScan` | `ApiChangeScanHandler` | 执行扫描（可带 `cancel:true` 取消） |
| `ChooseApiVersion` | `ChooseApiVersionHandler` | 返回起止版本列表 |
| `loadModulesInfo` | `LoadModuleInfosHandler` | 返回工程模块树 |
| `loadApiScanSetting` / `saveApiScanSetting` | `Load/SaveApiScanSettingHandler` | 读/写 Node 内存配置 |
| `browseSettingHelp` | `SettingHelpHandler` | 打开设置帮助 URL |
| `ChooseDir` | `SelectorHandler`（ohos 通用） | 选择目录 |
| `loadPageData` | `PageDataHandler` | 左树分页 |
| `getLocation` | `GetLocationHandler` | 右侧代码定位分页 |
| `FilterApiChanges` | `FilterApiChangesHandler` | 多维过滤 |
| `SearchContent` | `SearchContentHandler` | 文本搜索 |
| `CodeLocationJump` | `CodeLocationHandler` | 跳转代码行 |
| `apichangeTreeFileOncheck` | `ApichangeTreeFileOncheckHandler` | 勾选/标记已修复 |
| `CsvFileLocation` | `CsvFileLocationHandler` | 导出 CSV |
| `DocumentLinkJump` | `LinkJumpHandler` | 浏览器打开文档链接 |
| `apiChangeAddToChat` | `ApiChangeAddToChatHandler` | 加入 AI 聊天 |
| `/common/getThemeData` | `ThemeHandler`（ohos 通用） | 主题数据 |

Java → 前端用 `JBCefBrowser.executeJavaScript` 派发自定义事件：`progressUpdate`（扫描进度）、`treeDataUpdate`（行号变更）、`syncSucceed`（工程同步完成）。

---

## 6. 如何重现提取

```bash
# 1. 定位核心 jar（在所有插件 jar 中搜索 apichange 类名）
cd "D:/Application/DevEco Studio/plugins"
find . -maxdepth 3 -name "*.jar" | while read j; do
  unzip -l "$j" | grep -i "apichange" >/dev/null && echo "$j"
done

# 2. 反编译核心 jar
java -jar tools/cfr-0.152.jar jars/project-api-change-assistant-26.0.0.621.jar --outputdir src

# 3. 反编译关联 jar 的指定类（先 unzip 出 class 再逐个反编译）
unzip -o jars/CodeChat.jar "com/huawei/codegenie/chat/apichange/*.class" \
      "com/huawei/codegenie/chat/service/ApiChangeIntelligentServiceImpl.class" -d chat-classes/
java -jar tools/cfr-0.152.jar chat-classes/com/.../X.class --outputdir src-chat

# 4. 解出非类资源
unzip -o jars/project-api-change-assistant-26.0.0.621.jar "apiChange/*" "apiChangeDescription/*" \
      "messages/*" "icons/*" "META-INF/*.xml" -d resources/

# 5. 拷贝 Node 引擎（已是源码）
cp -r "D:/Application/DevEco Studio/plugins/harmony/arkanalyzer-apiscan" apiscan-engine
```

---

## 7. 关键源码索引

| 关注点 | 文件 |
|---|---|
| 入口与可见性控制 | `src/.../actions/ApiChangeAssistantAction.java` |
| ToolWindow 创建 + CEF 路由 | `src/.../ApiChangeAssistantFactory.java` |
| JCEF 窗口与 JS 桥 | `src/.../ApiChangeWindow.java` |
| 扫描主流程（ArkTS+C++） | `src/.../ApiScanUtil.java` |
| C/C++ grep 扫描器 | `src/.../CppCodeScanner.java` |
| 代码行号实时跟踪 | `src/.../ApiChangeLineTracker.java` |
| 结果树管理/勾选状态 | `src/.../ApiChangeTreeManager.java`、`ApiChangeTreeUtil.java` |
| 加入 AI 聊天入口 | `src/.../handler/ApiChangeAddToChatHandler.java` |
| AI 服务接口（扩展点） | `src/.../handler/utils/ApiChangeIntelligentService.java` |
| AI 服务实现（prompt 构造） | `src-chat/.../service/ApiChangeIntelligentServiceImpl.java` |
| 聊天消息推送 | `src-chat/.../apichange/ApiChangeService.java`、`APIChangeChatManager.java` |
| 编辑器 QuickFix 入口 | `src-res/.../quickfix/RunApiChangeAssistantQuickFix.java` |
| 底层 ArkTS 扫描引擎 | `apiscan-engine/index.js`、`worker.js`、`config/arkanalyzer.json` |
| 版本变更数据 | `resources/apiChange/HarmonyOS_*.json` |
| AI 修复提示词 | `resources/apiChangeDescription/apiChangePrompts.json` |
| 插件注册 | `resources/META-INF/hos-project-api-change-assistant.xml` |
| 国际化 | `resources/messages/HosProjectApichangeMgmt_zh_CN.properties` |
