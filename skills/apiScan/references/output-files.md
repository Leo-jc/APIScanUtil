# 输出文件字段速查

扫描产出 1 个主结果 + 辅助目录下 8 个文件。所有 JSON 均为 UTF-8 编码。

## 主结果：`{项目名}_scan_result.json`

默认名 `change_report.json`，批量扫描时命名为 `{项目名}_scan_result.json`。顶层结构：

| 字段 | 类型 | 说明 |
|------|------|------|
| `title` | string | 报告标题 |
| `upgradeWindow` | object | `{fromApiVersion, toApiVersion, note}` —— 升级窗口 |
| `summary` | object | 汇总：`usedApis` / `systemChangeCount` / `behaviorChangeCount` / `totalChangeCount` / `distinctApiCount` / `languageBreakdown`（ArkTS vs C++）/ `review`（verified/false_positive/review 计数） |
| `systemChanges` | list[object] | 系统 API 变更条目（接口定义 / 行为 / 废弃 / 新增等） |
| `behaviorChanges` | list[object] | 行为变更条目（UX 视觉布局等） |
| `changeList` | list[object] | 扁平变更清单（system + behavior 合并，DevEcoAPIScan 兼容） |
| `perApi` | object | 按 API 聚合：key=API 签名，value=关联变更条目列表 |

每个变更条目（`systemChanges`/`behaviorChanges` 元素）字段：

| 字段 | 说明 |
|------|------|
| `api` | API 签名 |
| `codeLocation` | 代码位置（file:line） |
| `category` | 语义类型（component_decl/commonmethod/method/field/ctor/system/class_decl） |
| `kbFile` | 知识库文件名 |
| `version` / `apiVersion` / `subVersion` | 变更版本 |
| `op` | 操作类型（删除API/废弃/接口行为变更/UX视觉布局变更/函数变更/新增API 等） |
| `decl` / `url` / `source` | 声明 / 文档链接 / 来源 |
| `evidenceUrl` | 证据 URL |
| `impact` | 影响 |
| `snippet` | 使用点源码片段 |
| `reviewVerdict` | 审查结论（verified/false_positive/review） |
| `reviewReason` | 审查理由 |
| `language` | ArkTS 或 C++ |

## 辅助目录：`{项目名}/`

### `api_usage.json`

ArkTS API 使用记录。结构：`{summary, apiUsages}`。

| 字段 | 说明 |
|------|------|
| `summary` | `{totalApiUsages, uniqueApis, filesScanned, kbCoverage}` —— 覆盖统计 |
| `apiUsages[]` | 每条：`{api, file, line, snippet, kbSources}` |

`kbCoverage`：`{totalKbFiles, directApiMatch, dataLayerOnly}` —— 知识库覆盖统计。

### `api_usage.md`

可读 API 使用文档（与参考文档格式一致的 Markdown 表格）。

### `api_call_graph.json`

ArkTS 调用图谱。结构：`{summary, files}`。

| 字段 | 说明 |
|------|------|
| `summary` | `{systemApis, systemApiCallSites, ...}` |
| `files[]` | 每个文件：`{path, relPath, imports[], callSites[], functions[], fieldTypes}` |

`callSites[]` 元素：`{line, qualified, base, name, isConstructor, caller, kind, kit}` —— kind 取值 `system`/`arkui_component`/`arkui_attribute`/`local`。

### `cpp_api_usage.json` / `cpp_api_usage.md`

C++ 原生 API 使用记录。结构与 `api_usage.json` 同构，每条记录额外字段 `language="C++"`。

### `cpp_call_graph.json`

C/C++ 调用图谱。结构：`{summary, files}`。

| 字段 | 说明 |
|------|------|
| `summary` | `{nativeApis, nativeApiCallSites, ...}` |
| `files[]` | 每个文件：`{path, relPath, imports[], callSites[]}` —— imports 为 `#include`，kit='Native' 表示原生头 |

### `change_report.md`

升级变更报告（Markdown）。按 API 分组展示，含审查结论标注，过滤 `false_positive` 条目。

### `change_report.csv`

DevEcoAPIScan 兼容 12 列 CSV：

| 列 | 说明 |
|------|------|
| Api Name | API 名称 |
| Type | 类型 |
| Path | 路径 |
| Prefix | 前缀 |
| Params | 参数 |
| Args | 参数列表 |
| Invoke Method | 调用方法 |
| Location | 代码位置 |
| Key | 匹配键 |
| Instance | 调用实例 |
| ChangeId | 变更 ID |
| MethodDefinition | 方法定义 |

### `upgrade_advice.md`

AI 升级评估与行动建议（Markdown）。四节：总体结论 / 变更按版本分布 / 高影响变更清单 / 逐 API 建议。LLM 模式（DeepSeek）或确定性回退。
