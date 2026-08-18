# InsLoadingAnimation ohos_hardemo — 项目 API 使用清单（全量）

> 由 **patched 扫描器** 生成：去除「是否系统 API」门槛 + 跳过变更清单 join，
> 报项目使用的所有 API（项目自定义 + 系统 API），仅排除语言级内置（es2015 / built-in：Array/Promise/String 等）。
> 已剔除类型推断噪音（未解析声明 / 编译器临时名 / 未定位调用位置）。

## 一、概览

- 扫描对象：`ohos_hardemo/entry` 模块
- 原始命中：1670 处；剔除噪音：817 处；有效 API 使用点：**853 处**
- 不同 API（按声明文件+名称+定义去重）：**191 个**

| 来源 | 使用点数 |
| --- | --- |
| 系统 API | 605 |
| 项目自定义 | 248 |

**剔除的噪音明细**：

| 噪音类型 | 数量 |
| --- | --- |
| 未解析声明(%unk) | 595 |
| 调用位置未定位(:-1) | 116 |
| 编译器临时名(%开头) | 106 |

## 二、API 使用明细（按来源分组）

### 系统 API（605 处）

| API 名称 | 类型 | 声明文件 | 方法定义 / 签名 | 调用位置 |
| --- | --- | --- | --- | --- |
| `UIAbility` | Class | `api/@ohos.app.ability.UIAbility.d.ts` | `@ohos/api/@ohos.app.ability.UIAbility.d.ts: UIAbility` | `entry/src/main/ets/entryability/EntryAbility.ets:8` |
| `UIAbility` | Class | `api/@ohos.app.ability.UIAbility.d.ts` | `@ohos/api/@ohos.app.ability.UIAbility.d.ts: UIAbility` | `entry/src/main/ets/entryability/EntryAbility.ets:17` |
| `UIAbility` | Class | `api/@ohos.app.ability.UIAbility.d.ts` | `@ohos/api/@ohos.app.ability.UIAbility.d.ts: UIAbility` | `entry/src/main/ets/entryability/EntryAbility.ets:21` |
| `UIAbility` | Class | `api/@ohos.app.ability.UIAbility.d.ts` | `@ohos/api/@ohos.app.ability.UIAbility.d.ts: UIAbility` | `entry/src/main/ets/entryability/EntryAbility.ets:34` |
| `UIAbility` | Class | `api/@ohos.app.ability.UIAbility.d.ts` | `@ohos/api/@ohos.app.ability.UIAbility.d.ts: UIAbility` | `entry/src/main/ets/entryability/EntryAbility.ets:39` |
| `UIAbility` | Class | `api/@ohos.app.ability.UIAbility.d.ts` | `@ohos/api/@ohos.app.ability.UIAbility.d.ts: UIAbility` | `entry/src/main/ets/entryability/EntryAbility.ets:44` |
| `onCreate` | Method | `api/@ohos.app.ability.UIAbility.d.ts` | `@ohos/api/@ohos.app.ability.UIAbility.d.ts: UIAbility.onCreate(@ohos/api/@ohos.app.ability.Want.d.ts: Want, @ohos/api/@ohos.app.ability.AbilityConstant.d.ts: AbilityConstant.LaunchParam)` | `entry/src/main/ets/entryability/EntryAbility.ets:8` |
| `ColorMode` | Enum | `api/@ohos.app.ability.ConfigurationConstant.d.ts` | `@ohos/api/@ohos.app.ability.ConfigurationConstant.d.ts: ConfigurationConstant.ColorMode` | `entry/src/main/ets/entryability/EntryAbility.ets:10` |
| `COLOR_MODE_NOT_SET` | EnumValue | `api/@ohos.app.ability.ConfigurationConstant.d.ts` | `@ohos/api/@ohos.app.ability.ConfigurationConstant.d.ts: ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET` | `entry/src/main/ets/entryability/EntryAbility.ets:10` |
| `context` | Property | `api/@ohos.app.ability.UIAbility.d.ts` | `@ohos/api/@ohos.app.ability.UIAbility.d.ts: UIAbility.context` | `entry/src/main/ets/entryability/EntryAbility.ets:10` |
| `UIAbilityContext` | Class | `api/application/UIAbilityContext.d.ts` | `@ohos/api/application/UIAbilityContext.d.ts: UIAbilityContext` | `entry/src/main/ets/entryability/EntryAbility.ets:10` |
| `Context` | Class | `api/application/Context.d.ts` | `@ohos/api/application/Context.d.ts: Context` | `entry/src/main/ets/entryability/EntryAbility.ets:10` |
| `getApplicationContext` | Method | `api/application/Context.d.ts` | `@ohos/api/application/Context.d.ts: Context.getApplicationContext()` | `entry/src/main/ets/entryability/EntryAbility.ets:10` |
| `ApplicationContext` | Class | `api/application/ApplicationContext.d.ts` | `@ohos/api/application/ApplicationContext.d.ts: ApplicationContext` | `entry/src/main/ets/entryability/EntryAbility.ets:10` |
| `setColorMode` | Method | `api/application/ApplicationContext.d.ts` | `@ohos/api/application/ApplicationContext.d.ts: ApplicationContext.setColorMode(@ohos/api/@ohos.app.ability.ConfigurationConstant.d.ts: ConfigurationConstant.ColorMode)` | `entry/src/main/ets/entryability/EntryAbility.ets:10` |
| `hilog` | Namespace | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog` | `entry/src/main/ets/entryability/EntryAbility.ets:12` |
| `hilog` | Namespace | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog` | `entry/src/main/ets/entryability/EntryAbility.ets:14` |
| `hilog` | Namespace | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog` | `entry/src/main/ets/entryability/EntryAbility.ets:18` |
| `hilog` | Namespace | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog` | `entry/src/main/ets/entryability/EntryAbility.ets:23` |
| `hilog` | Namespace | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog` | `entry/src/main/ets/entryability/EntryAbility.ets:36` |
| `hilog` | Namespace | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog` | `entry/src/main/ets/entryability/EntryAbility.ets:41` |
| `hilog` | Namespace | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog` | `entry/src/main/ets/entryability/EntryAbility.ets:46` |
| `hilog` | Namespace | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog` | `entry/src/main/ets/entryability/EntryAbility.ets:27` |
| `hilog` | Namespace | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog` | `entry/src/main/ets/entryability/EntryAbility.ets:30` |
| `hilog` | Namespace | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog` | `entry/src/main/ets/entrybackupability/EntryBackupAbility.ets:8` |
| `hilog` | Namespace | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog` | `entry/src/main/ets/entrybackupability/EntryBackupAbility.ets:13` |
| `hilog` | Namespace | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog` | `entry/src/ohosTest/ets/test/Ability.test.ets:27` |
| `error` | Method | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog.%dflt.error(number, string, string, any[])` | `entry/src/main/ets/entryability/EntryAbility.ets:12` |
| `error` | Method | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog.%dflt.error(number, string, string, any[])` | `entry/src/main/ets/entryability/EntryAbility.ets:27` |
| `info` | Method | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog.%dflt.info(number, string, string, any[])` | `entry/src/main/ets/entryability/EntryAbility.ets:14` |
| `info` | Method | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog.%dflt.info(number, string, string, any[])` | `entry/src/main/ets/entryability/EntryAbility.ets:18` |
| `info` | Method | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog.%dflt.info(number, string, string, any[])` | `entry/src/main/ets/entryability/EntryAbility.ets:23` |
| `info` | Method | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog.%dflt.info(number, string, string, any[])` | `entry/src/main/ets/entryability/EntryAbility.ets:36` |
| `info` | Method | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog.%dflt.info(number, string, string, any[])` | `entry/src/main/ets/entryability/EntryAbility.ets:41` |
| `info` | Method | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog.%dflt.info(number, string, string, any[])` | `entry/src/main/ets/entryability/EntryAbility.ets:46` |
| `info` | Method | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog.%dflt.info(number, string, string, any[])` | `entry/src/main/ets/entryability/EntryAbility.ets:30` |
| `info` | Method | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog.%dflt.info(number, string, string, any[])` | `entry/src/main/ets/entrybackupability/EntryBackupAbility.ets:8` |
| `info` | Method | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog.%dflt.info(number, string, string, any[])` | `entry/src/main/ets/entrybackupability/EntryBackupAbility.ets:13` |
| `info` | Method | `api/@ohos.hilog.d.ts` | `@ohos/api/@ohos.hilog.d.ts: hilog.%dflt.info(number, string, string, any[])` | `entry/src/ohosTest/ets/test/Ability.test.ets:27` |
| `onDestroy` | Method | `api/@ohos.app.ability.UIAbility.d.ts` | `@ohos/api/@ohos.app.ability.UIAbility.d.ts: UIAbility.onDestroy()` | `entry/src/main/ets/entryability/EntryAbility.ets:17` |
| `onWindowStageCreate` | Method | `api/@ohos.app.ability.UIAbility.d.ts` | `@ohos/api/@ohos.app.ability.UIAbility.d.ts: UIAbility.onWindowStageCreate(@ohos/api/@ohos.window.d.ts: window.WindowStage)` | `entry/src/main/ets/entryability/EntryAbility.ets:21` |
| `WindowStage` | Interface | `api/@ohos.window.d.ts` | `@ohos/api/@ohos.window.d.ts: window.WindowStage` | `entry/src/main/ets/entryability/EntryAbility.ets:25` |
| `loadContent` | Method | `api/@ohos.window.d.ts` | `@ohos/api/@ohos.window.d.ts: window.WindowStage.loadContent(string, @ohos/api/@ohos.base.d.ts: AsyncCallback<void,void>)` | `entry/src/main/ets/entryability/EntryAbility.ets:25` |
| `onWindowStageDestroy` | Method | `api/@ohos.app.ability.UIAbility.d.ts` | `@ohos/api/@ohos.app.ability.UIAbility.d.ts: UIAbility.onWindowStageDestroy()` | `entry/src/main/ets/entryability/EntryAbility.ets:34` |
| `onForeground` | Method | `api/@ohos.app.ability.UIAbility.d.ts` | `@ohos/api/@ohos.app.ability.UIAbility.d.ts: UIAbility.onForeground()` | `entry/src/main/ets/entryability/EntryAbility.ets:39` |
| `onBackground` | Method | `api/@ohos.app.ability.UIAbility.d.ts` | `@ohos/api/@ohos.app.ability.UIAbility.d.ts: UIAbility.onBackground()` | `entry/src/main/ets/entryability/EntryAbility.ets:44` |
| `code` | Property | `api/@ohos.base.d.ts` | `@ohos/api/@ohos.base.d.ts: BusinessError.code` | `entry/src/main/ets/entryability/EntryAbility.ets:26` |
| `BackupExtensionAbility` | Class | `api/@ohos.application.BackupExtensionAbility.d.ts` | `@ohos/api/@ohos.application.BackupExtensionAbility.d.ts: BackupExtensionAbility` | `entry/src/main/ets/entrybackupability/EntryBackupAbility.ets:7` |
| `BackupExtensionAbility` | Class | `api/@ohos.application.BackupExtensionAbility.d.ts` | `@ohos/api/@ohos.application.BackupExtensionAbility.d.ts: BackupExtensionAbility` | `entry/src/main/ets/entrybackupability/EntryBackupAbility.ets:12` |
| `onBackup` | Method | `api/@ohos.application.BackupExtensionAbility.d.ts` | `@ohos/api/@ohos.application.BackupExtensionAbility.d.ts: BackupExtensionAbility.onBackup()` | `entry/src/main/ets/entrybackupability/EntryBackupAbility.ets:7` |
| `onRestore` | Method | `api/@ohos.application.BackupExtensionAbility.d.ts` | `@ohos/api/@ohos.application.BackupExtensionAbility.d.ts: BackupExtensionAbility.onRestore(@ohos/api/@ohos.application.BackupExtensionAbility.d.ts: BundleVersion)` | `entry/src/main/ets/entrybackupability/EntryBackupAbility.ets:12` |
| `Scroller` | Class | `component/scroll.d.ts` | `@ohos/component/scroll.d.ts: Scroller` | `entry/src/main/ets/pages/Index.ets:1` |
| `Scroller` | Class | `component/scroll.d.ts` | `@ohos/component/scroll.d.ts: Scroller` | `entry/src/main/ets/pages/Index.ets:350` |
| `Scroller` | Class | `component/scroll.d.ts` | `@ohos/component/scroll.d.ts: Scroller` | `entry/src/main/ets/pages/Index.ets:322` |
| `Entry` | Property | `component/common.d.ts` | `@ohos/component/common.d.ts: %dflt.%dflt()#Entry` | `entry/src/main/ets/pages/Index.ets:76` |
| `Component` | Property | `component/common.d.ts` | `@ohos/component/common.d.ts: %dflt.%dflt()#Component` | `entry/src/main/ets/pages/Index.ets:77` |
| `constructor` | Method | `component/scroll.d.ts` | `@ohos/component/scroll.d.ts: Scroller.constructor()` | `entry/src/main/ets/pages/Index.ets:350` |
| `promptAction` | Namespace | `api/@ohos.promptAction.d.ts` | `@ohos/api/@ohos.promptAction.d.ts: promptAction` | `entry/src/main/ets/pages/Index.ets:110` |
| `showToast` | Method | `api/@ohos.promptAction.d.ts` | `@ohos/api/@ohos.promptAction.d.ts: promptAction.%dflt.showToast(@ohos/api/@ohos.promptAction.d.ts: promptAction.ShowToastOptions)` | `entry/src/main/ets/pages/Index.ets:110` |
| `Start` | EnumValue | `component/enums.d.ts` | `@ohos/component/enums.d.ts: HorizontalAlign.Start` | `entry/src/main/ets/pages/Index.ets:347` |
| `Start` | EnumValue | `component/enums.d.ts` | `@ohos/component/enums.d.ts: HorizontalAlign.Start` | `entry/src/main/ets/pages/Index.ets:333` |
| `ColumnInterface` | Interface | `component/column.d.ts` | `@ohos/component/column.d.ts: ColumnInterface` | `entry/src/main/ets/pages/Index.ets:115` |
| `ColumnInterface` | Interface | `component/column.d.ts` | `@ohos/component/column.d.ts: ColumnInterface` | `entry/src/main/ets/pages/Index.ets:323` |
| `constructor` | Method | `component/column.d.ts` | `@ohos/component/column.d.ts: ColumnInterface.create(@ohos/component/column.d.ts: ColumnOptions)` | `entry/src/main/ets/pages/Index.ets:115` |
| `constructor` | Method | `component/column.d.ts` | `@ohos/component/column.d.ts: ColumnInterface.create(@ohos/component/column.d.ts: ColumnOptions)` | `entry/src/main/ets/pages/Index.ets:323` |
| `Column` | Property | `component/column.d.ts` | `@ohos/component/column.d.ts: %dflt.%dflt()#Column` | `entry/src/main/ets/pages/Index.ets:115` |
| `Column` | Property | `component/column.d.ts` | `@ohos/component/column.d.ts: %dflt.%dflt()#Column` | `entry/src/main/ets/pages/Index.ets:323` |
| `ColumnAttribute` | Class | `component/column.d.ts` | `@ohos/component/column.d.ts: ColumnAttribute` | `entry/src/main/ets/pages/Index.ets:115` |
| `ColumnAttribute` | Class | `component/column.d.ts` | `@ohos/component/column.d.ts: ColumnAttribute` | `entry/src/main/ets/pages/Index.ets:323` |
| `ColumnAttribute` | Class | `component/column.d.ts` | `@ohos/component/column.d.ts: ColumnAttribute` | `entry/src/main/ets/pages/Index.ets:333` |
| `ColumnAttribute` | Class | `component/column.d.ts` | `@ohos/component/column.d.ts: ColumnAttribute` | `entry/src/main/ets/pages/Index.ets:347` |
| `Center` | EnumValue | `component/enums.d.ts` | `@ohos/component/enums.d.ts: TextAlign.Center` | `entry/src/main/ets/pages/Index.ets:122` |
| `Center` | EnumValue | `component/enums.d.ts` | `@ohos/component/enums.d.ts: TextAlign.Center` | `entry/src/main/ets/pages/Index.ets:129` |
| `Bold` | EnumValue | `component/enums.d.ts` | `@ohos/component/enums.d.ts: FontWeight.Bold` | `entry/src/main/ets/pages/Index.ets:119` |
| `TextInterface` | Interface | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface` | `entry/src/main/ets/pages/Index.ets:117` |
| `TextInterface` | Interface | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface` | `entry/src/main/ets/pages/Index.ets:125` |
| `TextInterface` | Interface | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface` | `entry/src/main/ets/pages/Index.ets:157` |
| `TextInterface` | Interface | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface` | `entry/src/main/ets/pages/Index.ets:163` |
| `TextInterface` | Interface | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface` | `entry/src/main/ets/pages/Index.ets:169` |
| `TextInterface` | Interface | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface` | `entry/src/main/ets/pages/Index.ets:191` |
| `TextInterface` | Interface | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface` | `entry/src/main/ets/pages/Index.ets:195` |
| `TextInterface` | Interface | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface` | `entry/src/main/ets/pages/Index.ets:220` |
| `TextInterface` | Interface | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface` | `entry/src/main/ets/pages/Index.ets:224` |
| `TextInterface` | Interface | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface` | `entry/src/main/ets/pages/Index.ets:248` |
| `TextInterface` | Interface | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface` | `entry/src/main/ets/pages/Index.ets:316` |
| `TextInterface` | Interface | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface` | `entry/src/main/ets/pages/Index.ets:325` |
| `constructor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface.create(string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource, @ohos/component/text.d.ts: TextOptions)` | `entry/src/main/ets/pages/Index.ets:117` |
| `constructor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface.create(string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource, @ohos/component/text.d.ts: TextOptions)` | `entry/src/main/ets/pages/Index.ets:125` |
| `constructor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface.create(string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource, @ohos/component/text.d.ts: TextOptions)` | `entry/src/main/ets/pages/Index.ets:157` |
| `constructor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface.create(string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource, @ohos/component/text.d.ts: TextOptions)` | `entry/src/main/ets/pages/Index.ets:163` |
| `constructor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface.create(string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource, @ohos/component/text.d.ts: TextOptions)` | `entry/src/main/ets/pages/Index.ets:169` |
| `constructor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface.create(string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource, @ohos/component/text.d.ts: TextOptions)` | `entry/src/main/ets/pages/Index.ets:191` |
| `constructor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface.create(string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource, @ohos/component/text.d.ts: TextOptions)` | `entry/src/main/ets/pages/Index.ets:195` |
| `constructor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface.create(string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource, @ohos/component/text.d.ts: TextOptions)` | `entry/src/main/ets/pages/Index.ets:220` |
| `constructor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface.create(string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource, @ohos/component/text.d.ts: TextOptions)` | `entry/src/main/ets/pages/Index.ets:224` |
| `constructor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface.create(string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource, @ohos/component/text.d.ts: TextOptions)` | `entry/src/main/ets/pages/Index.ets:248` |
| `constructor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface.create(string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource, @ohos/component/text.d.ts: TextOptions)` | `entry/src/main/ets/pages/Index.ets:316` |
| `constructor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextInterface.create(string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource, @ohos/component/text.d.ts: TextOptions)` | `entry/src/main/ets/pages/Index.ets:325` |
| `Text` | Property | `component/text.d.ts` | `@ohos/component/text.d.ts: %dflt.%dflt()#Text` | `entry/src/main/ets/pages/Index.ets:117` |
| `Text` | Property | `component/text.d.ts` | `@ohos/component/text.d.ts: %dflt.%dflt()#Text` | `entry/src/main/ets/pages/Index.ets:125` |
| `Text` | Property | `component/text.d.ts` | `@ohos/component/text.d.ts: %dflt.%dflt()#Text` | `entry/src/main/ets/pages/Index.ets:157` |
| `Text` | Property | `component/text.d.ts` | `@ohos/component/text.d.ts: %dflt.%dflt()#Text` | `entry/src/main/ets/pages/Index.ets:163` |
| `Text` | Property | `component/text.d.ts` | `@ohos/component/text.d.ts: %dflt.%dflt()#Text` | `entry/src/main/ets/pages/Index.ets:169` |
| `Text` | Property | `component/text.d.ts` | `@ohos/component/text.d.ts: %dflt.%dflt()#Text` | `entry/src/main/ets/pages/Index.ets:191` |
| `Text` | Property | `component/text.d.ts` | `@ohos/component/text.d.ts: %dflt.%dflt()#Text` | `entry/src/main/ets/pages/Index.ets:195` |
| `Text` | Property | `component/text.d.ts` | `@ohos/component/text.d.ts: %dflt.%dflt()#Text` | `entry/src/main/ets/pages/Index.ets:220` |
| `Text` | Property | `component/text.d.ts` | `@ohos/component/text.d.ts: %dflt.%dflt()#Text` | `entry/src/main/ets/pages/Index.ets:224` |
| `Text` | Property | `component/text.d.ts` | `@ohos/component/text.d.ts: %dflt.%dflt()#Text` | `entry/src/main/ets/pages/Index.ets:248` |
| `Text` | Property | `component/text.d.ts` | `@ohos/component/text.d.ts: %dflt.%dflt()#Text` | `entry/src/main/ets/pages/Index.ets:316` |
| `Text` | Property | `component/text.d.ts` | `@ohos/component/text.d.ts: %dflt.%dflt()#Text` | `entry/src/main/ets/pages/Index.ets:325` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:117` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:118` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:119` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:120` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:122` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:125` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:126` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:127` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:129` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:157` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:158` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:159` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:160` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:163` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:164` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:165` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:169` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:170` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:171` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:191` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:192` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:193` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:195` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:196` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:197` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:199` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:220` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:221` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:222` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:224` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:225` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:226` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:228` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:248` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:249` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:250` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:316` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:317` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:318` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:319` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:325` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:326` |
| `TextAttribute` | Class | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute` | `entry/src/main/ets/pages/Index.ets:327` |
| `fontSize` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontSize(number|string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource)` | `entry/src/main/ets/pages/Index.ets:118` |
| `fontSize` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontSize(number|string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource)` | `entry/src/main/ets/pages/Index.ets:126` |
| `fontSize` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontSize(number|string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource)` | `entry/src/main/ets/pages/Index.ets:158` |
| `fontSize` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontSize(number|string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource)` | `entry/src/main/ets/pages/Index.ets:164` |
| `fontSize` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontSize(number|string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource)` | `entry/src/main/ets/pages/Index.ets:170` |
| `fontSize` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontSize(number|string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource)` | `entry/src/main/ets/pages/Index.ets:192` |
| `fontSize` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontSize(number|string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource)` | `entry/src/main/ets/pages/Index.ets:196` |
| `fontSize` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontSize(number|string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource)` | `entry/src/main/ets/pages/Index.ets:221` |
| `fontSize` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontSize(number|string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource)` | `entry/src/main/ets/pages/Index.ets:225` |
| `fontSize` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontSize(number|string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource)` | `entry/src/main/ets/pages/Index.ets:249` |
| `fontSize` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontSize(number|string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource)` | `entry/src/main/ets/pages/Index.ets:317` |
| `fontSize` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontSize(number|string|@ohos/component/units.d.ts: %dflt.%dflt()#Resource)` | `entry/src/main/ets/pages/Index.ets:326` |
| `fontWeight` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontWeight(number|@ohos/component/enums.d.ts: FontWeight|@ohos/component/units.d.ts: %dflt.%dflt()#ResourceStr)` | `entry/src/main/ets/pages/Index.ets:119` |
| `fontWeight` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontWeight(number|@ohos/component/enums.d.ts: FontWeight|@ohos/component/units.d.ts: %dflt.%dflt()#ResourceStr)` | `entry/src/main/ets/pages/Index.ets:159` |
| `fontWeight` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontWeight(number|@ohos/component/enums.d.ts: FontWeight|@ohos/component/units.d.ts: %dflt.%dflt()#ResourceStr)` | `entry/src/main/ets/pages/Index.ets:318` |
| `fontColor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:120` |
| `fontColor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:127` |
| `fontColor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:160` |
| `fontColor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:165` |
| `fontColor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:171` |
| `fontColor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:193` |
| `fontColor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:197` |
| `fontColor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:222` |
| `fontColor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:226` |
| `fontColor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:250` |
| `fontColor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:319` |
| `fontColor` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.fontColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:327` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:121` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:123` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:128` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:130` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:152` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:153` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:161` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:166` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:172` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:173` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:186` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:187` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:194` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:198` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:201` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:203` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:223` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:227` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:230` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:232` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:251` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:252` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:266` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:267` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:274` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:275` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:276` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:277` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:279` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:280` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:284` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:285` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:286` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:287` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:289` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:290` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:294` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:295` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:296` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:297` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:299` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:300` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:302` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:303` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:308` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:309` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:310` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:312` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:313` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:320` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:321` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:332` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:335` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:336` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:337` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:338` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:339` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:343` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:344` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:345` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:346` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:179` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:180` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:181` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:183` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:258` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:259` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:260` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:261` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:263` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:328` |
| `CommonMethod` | Class | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod` | `entry/src/main/ets/pages/Index.ets:329` |
| `width` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.width(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:121` |
| `width` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.width(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:128` |
| `width` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.width(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:152` |
| `width` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.width(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:172` |
| `width` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.width(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:186` |
| `width` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.width(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:198` |
| `width` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.width(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:201` |
| `width` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.width(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:203` |
| `width` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.width(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:227` |
| `width` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.width(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:230` |
| `width` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.width(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:232` |
| `width` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.width(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:251` |
| `width` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.width(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:266` |
| `width` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.width(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:302` |
| `width` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.width(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:309` |
| `width` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.width(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:320` |
| `width` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.width(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:332` |
| `width` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.width(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:335` |
| `width` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.width(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:343` |
| `width` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.width(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:328` |
| `textAlign` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.textAlign(@ohos/component/enums.d.ts: TextAlign)` | `entry/src/main/ets/pages/Index.ets:122` |
| `textAlign` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.textAlign(@ohos/component/enums.d.ts: TextAlign)` | `entry/src/main/ets/pages/Index.ets:129` |
| `textAlign` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.textAlign(@ohos/component/enums.d.ts: TextAlign)` | `entry/src/main/ets/pages/Index.ets:199` |
| `textAlign` | Method | `component/text.d.ts` | `@ohos/component/text.d.ts: TextAttribute.textAlign(@ohos/component/enums.d.ts: TextAlign)` | `entry/src/main/ets/pages/Index.ets:228` |
| `padding` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.padding(@ohos/component/units.d.ts: %dflt.%dflt()#Padding|@ohos/component/units.d.ts: %dflt.%dflt()#Length|@ohos/component/units.d.ts: LocalizedPadding)` | `entry/src/main/ets/pages/Index.ets:123` |
| `padding` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.padding(@ohos/component/units.d.ts: %dflt.%dflt()#Padding|@ohos/component/units.d.ts: %dflt.%dflt()#Length|@ohos/component/units.d.ts: LocalizedPadding)` | `entry/src/main/ets/pages/Index.ets:130` |
| `padding` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.padding(@ohos/component/units.d.ts: %dflt.%dflt()#Padding|@ohos/component/units.d.ts: %dflt.%dflt()#Length|@ohos/component/units.d.ts: LocalizedPadding)` | `entry/src/main/ets/pages/Index.ets:339` |
| `padding` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.padding(@ohos/component/units.d.ts: %dflt.%dflt()#Padding|@ohos/component/units.d.ts: %dflt.%dflt()#Length|@ohos/component/units.d.ts: LocalizedPadding)` | `entry/src/main/ets/pages/Index.ets:346` |
| `padding` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.padding(@ohos/component/units.d.ts: %dflt.%dflt()#Padding|@ohos/component/units.d.ts: %dflt.%dflt()#Length|@ohos/component/units.d.ts: LocalizedPadding)` | `entry/src/main/ets/pages/Index.ets:329` |
| `Center` | EnumValue | `component/enums.d.ts` | `@ohos/component/enums.d.ts: Alignment.Center` | `entry/src/main/ets/pages/Index.ets:154` |
| `Center` | EnumValue | `component/enums.d.ts` | `@ohos/component/enums.d.ts: Alignment.Center` | `entry/src/main/ets/pages/Index.ets:133` |
| `StackInterface` | Interface | `component/stack.d.ts` | `@ohos/component/stack.d.ts: StackInterface` | `entry/src/main/ets/pages/Index.ets:133` |
| `constructor` | Method | `component/stack.d.ts` | `@ohos/component/stack.d.ts: StackInterface.create(@ohos/component/stack.d.ts: StackOptions)` | `entry/src/main/ets/pages/Index.ets:133` |
| `Stack` | Property | `component/stack.d.ts` | `@ohos/component/stack.d.ts: %dflt.%dflt()#Stack` | `entry/src/main/ets/pages/Index.ets:133` |
| `StackAttribute` | Class | `component/stack.d.ts` | `@ohos/component/stack.d.ts: StackAttribute` | `entry/src/main/ets/pages/Index.ets:133` |
| `StackAttribute` | Class | `component/stack.d.ts` | `@ohos/component/stack.d.ts: StackAttribute` | `entry/src/main/ets/pages/Index.ets:154` |
| `LongPressGesture` | Property | `component/gesture.d.ts` | `@ohos/component/gesture.d.ts: %dflt.%dflt()#LongPressGesture` | `entry/src/main/ets/pages/Index.ets:134` |
| `LongPressGestureInterface` | Interface | `component/gesture.d.ts` | `@ohos/component/gesture.d.ts: LongPressGestureInterface` | `entry/src/main/ets/pages/Index.ets:134` |
| `constructor` | Method | `component/gesture.d.ts` | `@ohos/component/gesture.d.ts: LongPressGestureInterface.create(@ohos/component/gesture.d.ts: %AC0)` | `entry/src/main/ets/pages/Index.ets:134` |
| `onAction` | Method | `component/gesture.d.ts` | `@ohos/component/gesture.d.ts: LongPressGestureInterface.onAction(@ohos/component/gesture.d.ts: LongPressGestureInterface.%AM0(@ohos/component/gesture.d.ts: GestureEvent))` | `entry/src/main/ets/pages/Index.ets:134` |
| `height` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.height(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:153` |
| `height` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.height(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:274` |
| `height` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.height(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:284` |
| `height` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.height(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:294` |
| `height` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.height(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:308` |
| `height` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.height(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:344` |
| `height` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.height(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:179` |
| `height` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.height(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:258` |
| `alignContent` | Method | `component/stack.d.ts` | `@ohos/component/stack.d.ts: StackAttribute.alignContent(@ohos/component/enums.d.ts: Alignment)` | `entry/src/main/ets/pages/Index.ets:154` |
| `Medium` | EnumValue | `component/enums.d.ts` | `@ohos/component/enums.d.ts: FontWeight.Medium` | `entry/src/main/ets/pages/Index.ets:159` |
| `Medium` | EnumValue | `component/enums.d.ts` | `@ohos/component/enums.d.ts: FontWeight.Medium` | `entry/src/main/ets/pages/Index.ets:318` |
| `margin` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.margin(@ohos/component/units.d.ts: %dflt.%dflt()#Margin|@ohos/component/units.d.ts: %dflt.%dflt()#Length|@ohos/component/units.d.ts: %dflt.%dflt()#LocalizedMargin)` | `entry/src/main/ets/pages/Index.ets:161` |
| `margin` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.margin(@ohos/component/units.d.ts: %dflt.%dflt()#Margin|@ohos/component/units.d.ts: %dflt.%dflt()#Length|@ohos/component/units.d.ts: %dflt.%dflt()#LocalizedMargin)` | `entry/src/main/ets/pages/Index.ets:166` |
| `margin` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.margin(@ohos/component/units.d.ts: %dflt.%dflt()#Margin|@ohos/component/units.d.ts: %dflt.%dflt()#Length|@ohos/component/units.d.ts: %dflt.%dflt()#LocalizedMargin)` | `entry/src/main/ets/pages/Index.ets:173` |
| `margin` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.margin(@ohos/component/units.d.ts: %dflt.%dflt()#Margin|@ohos/component/units.d.ts: %dflt.%dflt()#Length|@ohos/component/units.d.ts: %dflt.%dflt()#LocalizedMargin)` | `entry/src/main/ets/pages/Index.ets:187` |
| `margin` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.margin(@ohos/component/units.d.ts: %dflt.%dflt()#Margin|@ohos/component/units.d.ts: %dflt.%dflt()#Length|@ohos/component/units.d.ts: %dflt.%dflt()#LocalizedMargin)` | `entry/src/main/ets/pages/Index.ets:252` |
| `margin` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.margin(@ohos/component/units.d.ts: %dflt.%dflt()#Margin|@ohos/component/units.d.ts: %dflt.%dflt()#Length|@ohos/component/units.d.ts: %dflt.%dflt()#LocalizedMargin)` | `entry/src/main/ets/pages/Index.ets:267` |
| `margin` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.margin(@ohos/component/units.d.ts: %dflt.%dflt()#Margin|@ohos/component/units.d.ts: %dflt.%dflt()#Length|@ohos/component/units.d.ts: %dflt.%dflt()#LocalizedMargin)` | `entry/src/main/ets/pages/Index.ets:276` |
| `margin` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.margin(@ohos/component/units.d.ts: %dflt.%dflt()#Margin|@ohos/component/units.d.ts: %dflt.%dflt()#Length|@ohos/component/units.d.ts: %dflt.%dflt()#LocalizedMargin)` | `entry/src/main/ets/pages/Index.ets:286` |
| `margin` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.margin(@ohos/component/units.d.ts: %dflt.%dflt()#Margin|@ohos/component/units.d.ts: %dflt.%dflt()#Length|@ohos/component/units.d.ts: %dflt.%dflt()#LocalizedMargin)` | `entry/src/main/ets/pages/Index.ets:296` |
| `margin` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.margin(@ohos/component/units.d.ts: %dflt.%dflt()#Margin|@ohos/component/units.d.ts: %dflt.%dflt()#Length|@ohos/component/units.d.ts: %dflt.%dflt()#LocalizedMargin)` | `entry/src/main/ets/pages/Index.ets:303` |
| `margin` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.margin(@ohos/component/units.d.ts: %dflt.%dflt()#Margin|@ohos/component/units.d.ts: %dflt.%dflt()#Length|@ohos/component/units.d.ts: %dflt.%dflt()#LocalizedMargin)` | `entry/src/main/ets/pages/Index.ets:313` |
| `margin` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.margin(@ohos/component/units.d.ts: %dflt.%dflt()#Margin|@ohos/component/units.d.ts: %dflt.%dflt()#Length|@ohos/component/units.d.ts: %dflt.%dflt()#LocalizedMargin)` | `entry/src/main/ets/pages/Index.ets:321` |
| `margin` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.margin(@ohos/component/units.d.ts: %dflt.%dflt()#Margin|@ohos/component/units.d.ts: %dflt.%dflt()#Length|@ohos/component/units.d.ts: %dflt.%dflt()#LocalizedMargin)` | `entry/src/main/ets/pages/Index.ets:180` |
| `margin` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.margin(@ohos/component/units.d.ts: %dflt.%dflt()#Margin|@ohos/component/units.d.ts: %dflt.%dflt()#Length|@ohos/component/units.d.ts: %dflt.%dflt()#LocalizedMargin)` | `entry/src/main/ets/pages/Index.ets:260` |
| `FlexInterface` | Interface | `component/flex.d.ts` | `@ohos/component/flex.d.ts: FlexInterface` | `entry/src/main/ets/pages/Index.ets:174` |
| `constructor` | Method | `component/flex.d.ts` | `@ohos/component/flex.d.ts: FlexInterface.create(@ohos/component/flex.d.ts: FlexOptions)` | `entry/src/main/ets/pages/Index.ets:174` |
| `Flex` | Property | `component/flex.d.ts` | `@ohos/component/flex.d.ts: %dflt.%dflt()#Flex` | `entry/src/main/ets/pages/Index.ets:174` |
| `FlexAttribute` | Class | `component/flex.d.ts` | `@ohos/component/flex.d.ts: FlexAttribute` | `entry/src/main/ets/pages/Index.ets:174` |
| `ForEachInterface` | Interface | `component/for_each.d.ts` | `@ohos/component/for_each.d.ts: ForEachInterface` | `entry/src/main/ets/pages/Index.ets:175` |
| `ForEachInterface` | Interface | `component/for_each.d.ts` | `@ohos/component/for_each.d.ts: ForEachInterface` | `entry/src/main/ets/pages/Index.ets:254` |
| `ForEachInterface` | Interface | `component/for_each.d.ts` | `@ohos/component/for_each.d.ts: ForEachInterface` | `entry/src/main/ets/pages/Index.ets:324` |
| `constructor` | Method | `component/for_each.d.ts` | `@ohos/component/for_each.d.ts: ForEachInterface.create(any[], @ohos/component/for_each.d.ts: ForEachInterface.%AM0(any, number), @ohos/component/for_each.d.ts: ForEachInterface.%AM1(any, number))` | `entry/src/main/ets/pages/Index.ets:175` |
| `constructor` | Method | `component/for_each.d.ts` | `@ohos/component/for_each.d.ts: ForEachInterface.create(any[], @ohos/component/for_each.d.ts: ForEachInterface.%AM0(any, number), @ohos/component/for_each.d.ts: ForEachInterface.%AM1(any, number))` | `entry/src/main/ets/pages/Index.ets:254` |
| `constructor` | Method | `component/for_each.d.ts` | `@ohos/component/for_each.d.ts: ForEachInterface.create(any[], @ohos/component/for_each.d.ts: ForEachInterface.%AM0(any, number), @ohos/component/for_each.d.ts: ForEachInterface.%AM1(any, number))` | `entry/src/main/ets/pages/Index.ets:324` |
| `ForEach` | Property | `component/for_each.d.ts` | `@ohos/component/for_each.d.ts: %dflt.%dflt()#ForEach` | `entry/src/main/ets/pages/Index.ets:175` |
| `ForEach` | Property | `component/for_each.d.ts` | `@ohos/component/for_each.d.ts: %dflt.%dflt()#ForEach` | `entry/src/main/ets/pages/Index.ets:254` |
| `ForEach` | Property | `component/for_each.d.ts` | `@ohos/component/for_each.d.ts: %dflt.%dflt()#ForEach` | `entry/src/main/ets/pages/Index.ets:324` |
| `ForEachAttribute` | Class | `component/for_each.d.ts` | `@ohos/component/for_each.d.ts: ForEachAttribute` | `entry/src/main/ets/pages/Index.ets:175` |
| `ForEachAttribute` | Class | `component/for_each.d.ts` | `@ohos/component/for_each.d.ts: ForEachAttribute` | `entry/src/main/ets/pages/Index.ets:254` |
| `ForEachAttribute` | Class | `component/for_each.d.ts` | `@ohos/component/for_each.d.ts: ForEachAttribute` | `entry/src/main/ets/pages/Index.ets:324` |
| `RowInterface` | Interface | `component/row.d.ts` | `@ohos/component/row.d.ts: RowInterface` | `entry/src/main/ets/pages/Index.ets:190` |
| `RowInterface` | Interface | `component/row.d.ts` | `@ohos/component/row.d.ts: RowInterface` | `entry/src/main/ets/pages/Index.ets:219` |
| `RowInterface` | Interface | `component/row.d.ts` | `@ohos/component/row.d.ts: RowInterface` | `entry/src/main/ets/pages/Index.ets:253` |
| `RowInterface` | Interface | `component/row.d.ts` | `@ohos/component/row.d.ts: RowInterface` | `entry/src/main/ets/pages/Index.ets:270` |
| `constructor` | Method | `component/row.d.ts` | `@ohos/component/row.d.ts: RowInterface.create(@ohos/component/row.d.ts: RowOptions)` | `entry/src/main/ets/pages/Index.ets:190` |
| `constructor` | Method | `component/row.d.ts` | `@ohos/component/row.d.ts: RowInterface.create(@ohos/component/row.d.ts: RowOptions)` | `entry/src/main/ets/pages/Index.ets:219` |
| `constructor` | Method | `component/row.d.ts` | `@ohos/component/row.d.ts: RowInterface.create(@ohos/component/row.d.ts: RowOptions)` | `entry/src/main/ets/pages/Index.ets:253` |
| `constructor` | Method | `component/row.d.ts` | `@ohos/component/row.d.ts: RowInterface.create(@ohos/component/row.d.ts: RowOptions)` | `entry/src/main/ets/pages/Index.ets:270` |
| `Row` | Property | `component/row.d.ts` | `@ohos/component/row.d.ts: %dflt.%dflt()#Row` | `entry/src/main/ets/pages/Index.ets:190` |
| `Row` | Property | `component/row.d.ts` | `@ohos/component/row.d.ts: %dflt.%dflt()#Row` | `entry/src/main/ets/pages/Index.ets:219` |
| `Row` | Property | `component/row.d.ts` | `@ohos/component/row.d.ts: %dflt.%dflt()#Row` | `entry/src/main/ets/pages/Index.ets:253` |
| `Row` | Property | `component/row.d.ts` | `@ohos/component/row.d.ts: %dflt.%dflt()#Row` | `entry/src/main/ets/pages/Index.ets:270` |
| `RowAttribute` | Class | `component/row.d.ts` | `@ohos/component/row.d.ts: RowAttribute` | `entry/src/main/ets/pages/Index.ets:190` |
| `RowAttribute` | Class | `component/row.d.ts` | `@ohos/component/row.d.ts: RowAttribute` | `entry/src/main/ets/pages/Index.ets:219` |
| `RowAttribute` | Class | `component/row.d.ts` | `@ohos/component/row.d.ts: RowAttribute` | `entry/src/main/ets/pages/Index.ets:253` |
| `RowAttribute` | Class | `component/row.d.ts` | `@ohos/component/row.d.ts: RowAttribute` | `entry/src/main/ets/pages/Index.ets:270` |
| `layoutWeight` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.layoutWeight(number|string)` | `entry/src/main/ets/pages/Index.ets:194` |
| `layoutWeight` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.layoutWeight(number|string)` | `entry/src/main/ets/pages/Index.ets:223` |
| `layoutWeight` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.layoutWeight(number|string)` | `entry/src/main/ets/pages/Index.ets:275` |
| `layoutWeight` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.layoutWeight(number|string)` | `entry/src/main/ets/pages/Index.ets:285` |
| `layoutWeight` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.layoutWeight(number|string)` | `entry/src/main/ets/pages/Index.ets:295` |
| `layoutWeight` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.layoutWeight(number|string)` | `entry/src/main/ets/pages/Index.ets:336` |
| `layoutWeight` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.layoutWeight(number|string)` | `entry/src/main/ets/pages/Index.ets:259` |
| `End` | EnumValue | `component/enums.d.ts` | `@ohos/component/enums.d.ts: TextAlign.End` | `entry/src/main/ets/pages/Index.ets:199` |
| `End` | EnumValue | `component/enums.d.ts` | `@ohos/component/enums.d.ts: TextAlign.End` | `entry/src/main/ets/pages/Index.ets:228` |
| `SliderInterface` | Interface | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderInterface` | `entry/src/main/ets/pages/Index.ets:202` |
| `SliderInterface` | Interface | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderInterface` | `entry/src/main/ets/pages/Index.ets:231` |
| `constructor` | Method | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderInterface.create(@ohos/component/slider.d.ts: SliderOptions)` | `entry/src/main/ets/pages/Index.ets:202` |
| `constructor` | Method | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderInterface.create(@ohos/component/slider.d.ts: SliderOptions)` | `entry/src/main/ets/pages/Index.ets:231` |
| `Slider` | Property | `component/slider.d.ts` | `@ohos/component/slider.d.ts: %dflt.%dflt()#Slider` | `entry/src/main/ets/pages/Index.ets:202` |
| `Slider` | Property | `component/slider.d.ts` | `@ohos/component/slider.d.ts: %dflt.%dflt()#Slider` | `entry/src/main/ets/pages/Index.ets:231` |
| `SliderAttribute` | Class | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderAttribute` | `entry/src/main/ets/pages/Index.ets:202` |
| `SliderAttribute` | Class | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderAttribute` | `entry/src/main/ets/pages/Index.ets:204` |
| `SliderAttribute` | Class | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderAttribute` | `entry/src/main/ets/pages/Index.ets:205` |
| `SliderAttribute` | Class | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderAttribute` | `entry/src/main/ets/pages/Index.ets:206` |
| `SliderAttribute` | Class | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderAttribute` | `entry/src/main/ets/pages/Index.ets:207` |
| `SliderAttribute` | Class | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderAttribute` | `entry/src/main/ets/pages/Index.ets:231` |
| `SliderAttribute` | Class | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderAttribute` | `entry/src/main/ets/pages/Index.ets:233` |
| `SliderAttribute` | Class | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderAttribute` | `entry/src/main/ets/pages/Index.ets:234` |
| `SliderAttribute` | Class | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderAttribute` | `entry/src/main/ets/pages/Index.ets:235` |
| `SliderAttribute` | Class | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderAttribute` | `entry/src/main/ets/pages/Index.ets:236` |
| `blockColor` | Method | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderAttribute.blockColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:204` |
| `blockColor` | Method | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderAttribute.blockColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:233` |
| `selectedColor` | Method | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderAttribute.selectedColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:205` |
| `selectedColor` | Method | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderAttribute.selectedColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:234` |
| `trackColor` | Method | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderAttribute.trackColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor|@ohos/component/common.d.ts: LinearGradient)` | `entry/src/main/ets/pages/Index.ets:206` |
| `trackColor` | Method | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderAttribute.trackColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor|@ohos/component/common.d.ts: LinearGradient)` | `entry/src/main/ets/pages/Index.ets:235` |
| `onChange` | Method | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderAttribute.onChange(@ohos/component/slider.d.ts: SliderAttribute.%AM0(number, @ohos/component/slider.d.ts: SliderChangeMode))` | `entry/src/main/ets/pages/Index.ets:207` |
| `onChange` | Method | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderAttribute.onChange(@ohos/component/slider.d.ts: SliderAttribute.%AM0(number, @ohos/component/slider.d.ts: SliderChangeMode))` | `entry/src/main/ets/pages/Index.ets:236` |
| `Capsule` | EnumValue | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonType.Capsule` | `entry/src/main/ets/pages/Index.ets:272` |
| `Capsule` | EnumValue | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonType.Capsule` | `entry/src/main/ets/pages/Index.ets:282` |
| `Capsule` | EnumValue | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonType.Capsule` | `entry/src/main/ets/pages/Index.ets:292` |
| `Capsule` | EnumValue | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonType.Capsule` | `entry/src/main/ets/pages/Index.ets:306` |
| `Capsule` | EnumValue | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonType.Capsule` | `entry/src/main/ets/pages/Index.ets:177` |
| `Capsule` | EnumValue | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonType.Capsule` | `entry/src/main/ets/pages/Index.ets:256` |
| `ButtonInterface` | Interface | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonInterface` | `entry/src/main/ets/pages/Index.ets:271` |
| `ButtonInterface` | Interface | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonInterface` | `entry/src/main/ets/pages/Index.ets:281` |
| `ButtonInterface` | Interface | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonInterface` | `entry/src/main/ets/pages/Index.ets:291` |
| `ButtonInterface` | Interface | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonInterface` | `entry/src/main/ets/pages/Index.ets:305` |
| `ButtonInterface` | Interface | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonInterface` | `entry/src/main/ets/pages/Index.ets:176` |
| `ButtonInterface` | Interface | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonInterface` | `entry/src/main/ets/pages/Index.ets:255` |
| `constructor` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonInterface.create(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceStr, @ohos/component/button.d.ts: ButtonOptions)` | `entry/src/main/ets/pages/Index.ets:271` |
| `constructor` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonInterface.create(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceStr, @ohos/component/button.d.ts: ButtonOptions)` | `entry/src/main/ets/pages/Index.ets:281` |
| `constructor` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonInterface.create(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceStr, @ohos/component/button.d.ts: ButtonOptions)` | `entry/src/main/ets/pages/Index.ets:291` |
| `constructor` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonInterface.create(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceStr, @ohos/component/button.d.ts: ButtonOptions)` | `entry/src/main/ets/pages/Index.ets:305` |
| `constructor` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonInterface.create(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceStr, @ohos/component/button.d.ts: ButtonOptions)` | `entry/src/main/ets/pages/Index.ets:176` |
| `constructor` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonInterface.create(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceStr, @ohos/component/button.d.ts: ButtonOptions)` | `entry/src/main/ets/pages/Index.ets:255` |
| `Button` | Property | `component/button.d.ts` | `@ohos/component/button.d.ts: %dflt.%dflt()#Button` | `entry/src/main/ets/pages/Index.ets:271` |
| `Button` | Property | `component/button.d.ts` | `@ohos/component/button.d.ts: %dflt.%dflt()#Button` | `entry/src/main/ets/pages/Index.ets:281` |
| `Button` | Property | `component/button.d.ts` | `@ohos/component/button.d.ts: %dflt.%dflt()#Button` | `entry/src/main/ets/pages/Index.ets:291` |
| `Button` | Property | `component/button.d.ts` | `@ohos/component/button.d.ts: %dflt.%dflt()#Button` | `entry/src/main/ets/pages/Index.ets:305` |
| `Button` | Property | `component/button.d.ts` | `@ohos/component/button.d.ts: %dflt.%dflt()#Button` | `entry/src/main/ets/pages/Index.ets:176` |
| `Button` | Property | `component/button.d.ts` | `@ohos/component/button.d.ts: %dflt.%dflt()#Button` | `entry/src/main/ets/pages/Index.ets:255` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:271` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:272` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:273` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:278` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:281` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:282` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:283` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:288` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:291` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:292` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:293` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:298` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:305` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:306` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:307` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:311` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:176` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:177` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:178` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:182` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:255` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:256` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:257` |
| `ButtonAttribute` | Class | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute` | `entry/src/main/ets/pages/Index.ets:262` |
| `type` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute.type(@ohos/component/button.d.ts: ButtonType)` | `entry/src/main/ets/pages/Index.ets:272` |
| `type` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute.type(@ohos/component/button.d.ts: ButtonType)` | `entry/src/main/ets/pages/Index.ets:282` |
| `type` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute.type(@ohos/component/button.d.ts: ButtonType)` | `entry/src/main/ets/pages/Index.ets:292` |
| `type` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute.type(@ohos/component/button.d.ts: ButtonType)` | `entry/src/main/ets/pages/Index.ets:306` |
| `type` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute.type(@ohos/component/button.d.ts: ButtonType)` | `entry/src/main/ets/pages/Index.ets:177` |
| `type` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute.type(@ohos/component/button.d.ts: ButtonType)` | `entry/src/main/ets/pages/Index.ets:256` |
| `fontSize` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute.fontSize(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:273` |
| `fontSize` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute.fontSize(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:283` |
| `fontSize` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute.fontSize(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:293` |
| `fontSize` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute.fontSize(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:307` |
| `fontSize` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute.fontSize(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:178` |
| `fontSize` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute.fontSize(@ohos/component/units.d.ts: %dflt.%dflt()#Length)` | `entry/src/main/ets/pages/Index.ets:257` |
| `backgroundColor` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.backgroundColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:277` |
| `backgroundColor` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.backgroundColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:287` |
| `backgroundColor` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.backgroundColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:297` |
| `backgroundColor` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.backgroundColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:310` |
| `backgroundColor` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.backgroundColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:337` |
| `backgroundColor` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.backgroundColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:345` |
| `backgroundColor` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.backgroundColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:181` |
| `backgroundColor` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.backgroundColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:261` |
| `fontColor` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute.fontColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:278` |
| `fontColor` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute.fontColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:288` |
| `fontColor` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute.fontColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:298` |
| `fontColor` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute.fontColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:311` |
| `fontColor` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute.fontColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:182` |
| `fontColor` | Method | `component/button.d.ts` | `@ohos/component/button.d.ts: ButtonAttribute.fontColor(@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor)` | `entry/src/main/ets/pages/Index.ets:262` |
| `border` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.border(@ohos/component/units.d.ts: BorderOptions)` | `entry/src/main/ets/pages/Index.ets:279` |
| `border` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.border(@ohos/component/units.d.ts: BorderOptions)` | `entry/src/main/ets/pages/Index.ets:289` |
| `border` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.border(@ohos/component/units.d.ts: BorderOptions)` | `entry/src/main/ets/pages/Index.ets:299` |
| `border` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.border(@ohos/component/units.d.ts: BorderOptions)` | `entry/src/main/ets/pages/Index.ets:338` |
| `onClick` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.onClick(@ohos/component/common.d.ts: CommonMethod.%AM1(@ohos/component/common.d.ts: ClickEvent))` | `entry/src/main/ets/pages/Index.ets:280` |
| `onClick` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.onClick(@ohos/component/common.d.ts: CommonMethod.%AM1(@ohos/component/common.d.ts: ClickEvent))` | `entry/src/main/ets/pages/Index.ets:290` |
| `onClick` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.onClick(@ohos/component/common.d.ts: CommonMethod.%AM1(@ohos/component/common.d.ts: ClickEvent))` | `entry/src/main/ets/pages/Index.ets:300` |
| `onClick` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.onClick(@ohos/component/common.d.ts: CommonMethod.%AM1(@ohos/component/common.d.ts: ClickEvent))` | `entry/src/main/ets/pages/Index.ets:312` |
| `onClick` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.onClick(@ohos/component/common.d.ts: CommonMethod.%AM1(@ohos/component/common.d.ts: ClickEvent))` | `entry/src/main/ets/pages/Index.ets:183` |
| `onClick` | Method | `component/common.d.ts` | `@ohos/component/common.d.ts: CommonMethod.onClick(@ohos/component/common.d.ts: CommonMethod.%AM1(@ohos/component/common.d.ts: ClickEvent))` | `entry/src/main/ets/pages/Index.ets:263` |
| `Auto` | EnumValue | `component/enums.d.ts` | `@ohos/component/enums.d.ts: BarState.Auto` | `entry/src/main/ets/pages/Index.ets:341` |
| `Spring` | EnumValue | `component/enums.d.ts` | `@ohos/component/enums.d.ts: EdgeEffect.Spring` | `entry/src/main/ets/pages/Index.ets:340` |
| `ScrollInterface` | Interface | `component/scroll.d.ts` | `@ohos/component/scroll.d.ts: ScrollInterface` | `entry/src/main/ets/pages/Index.ets:322` |
| `constructor` | Method | `component/scroll.d.ts` | `@ohos/component/scroll.d.ts: ScrollInterface.create(@ohos/component/scroll.d.ts: Scroller)` | `entry/src/main/ets/pages/Index.ets:322` |
| `Scroll` | Property | `component/scroll.d.ts` | `@ohos/component/scroll.d.ts: %dflt.%dflt()#Scroll` | `entry/src/main/ets/pages/Index.ets:322` |
| `ScrollAttribute` | Class | `component/scroll.d.ts` | `@ohos/component/scroll.d.ts: ScrollAttribute` | `entry/src/main/ets/pages/Index.ets:322` |
| `ScrollAttribute` | Class | `component/scroll.d.ts` | `@ohos/component/scroll.d.ts: ScrollAttribute` | `entry/src/main/ets/pages/Index.ets:340` |
| `ScrollAttribute` | Class | `component/scroll.d.ts` | `@ohos/component/scroll.d.ts: ScrollAttribute` | `entry/src/main/ets/pages/Index.ets:341` |
| `alignItems` | Method | `component/column.d.ts` | `@ohos/component/column.d.ts: ColumnAttribute.alignItems(@ohos/component/enums.d.ts: HorizontalAlign)` | `entry/src/main/ets/pages/Index.ets:333` |
| `alignItems` | Method | `component/column.d.ts` | `@ohos/component/column.d.ts: ColumnAttribute.alignItems(@ohos/component/enums.d.ts: HorizontalAlign)` | `entry/src/main/ets/pages/Index.ets:347` |
| `edgeEffect` | Method | `component/scroll.d.ts` | `@ohos/component/scroll.d.ts: ScrollAttribute.edgeEffect(@ohos/component/enums.d.ts: EdgeEffect, @ohos/component/common.d.ts: EdgeEffectOptions)` | `entry/src/main/ets/pages/Index.ets:340` |
| `scrollBar` | Method | `component/scroll.d.ts` | `@ohos/component/scroll.d.ts: ScrollAttribute.scrollBar(@ohos/component/enums.d.ts: BarState)` | `entry/src/main/ets/pages/Index.ets:341` |
| `Moving` | EnumValue | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderChangeMode.Moving` | `entry/src/main/ets/pages/Index.ets:208` |
| `Moving` | EnumValue | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderChangeMode.Moving` | `entry/src/main/ets/pages/Index.ets:237` |
| `Click` | EnumValue | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderChangeMode.Click` | `entry/src/main/ets/pages/Index.ets:208` |
| `Click` | EnumValue | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderChangeMode.Click` | `entry/src/main/ets/pages/Index.ets:237` |
| `State` | Property | `component/common.d.ts` | `@ohos/component/common.d.ts: %dflt.%dflt()#State` | `entry/src/main/ets/pages/Index.ets:82` |
| `State` | Property | `component/common.d.ts` | `@ohos/component/common.d.ts: %dflt.%dflt()#State` | `entry/src/main/ets/pages/Index.ets:83` |
| `State` | Property | `component/common.d.ts` | `@ohos/component/common.d.ts: %dflt.%dflt()#State` | `entry/src/main/ets/pages/Index.ets:84` |
| `State` | Property | `component/common.d.ts` | `@ohos/component/common.d.ts: %dflt.%dflt()#State` | `entry/src/main/ets/pages/Index.ets:85` |
| `State` | Property | `component/common.d.ts` | `@ohos/component/common.d.ts: %dflt.%dflt()#State` | `entry/src/main/ets/pages/Index.ets:86` |
| `State` | Property | `component/common.d.ts` | `@ohos/component/common.d.ts: %dflt.%dflt()#State` | `entry/src/main/ets/pages/Index.ets:87` |
| `Resource` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#Resource` | `entry/src/main/ets/pages/Index.ets:110` |
| `message` | Property | `api/@ohos.promptAction.d.ts` | `@ohos/api/@ohos.promptAction.d.ts: promptAction.ShowToastOptions.message` | `entry/src/main/ets/pages/Index.ets:110` |
| `duration` | Property | `api/@ohos.promptAction.d.ts` | `@ohos/api/@ohos.promptAction.d.ts: promptAction.ShowToastOptions.duration` | `entry/src/main/ets/pages/Index.ets:110` |
| `bottom` | Property | `api/@ohos.promptAction.d.ts` | `@ohos/api/@ohos.promptAction.d.ts: promptAction.ShowToastOptions.bottom` | `entry/src/main/ets/pages/Index.ets:110` |
| `Length` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#Length` | `entry/src/main/ets/pages/Index.ets:346` |
| `Length` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#Length` | `entry/src/main/ets/pages/Index.ets:180` |
| `Length` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#Length` | `entry/src/main/ets/pages/Index.ets:260` |
| `Length` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#Length` | `entry/src/main/ets/pages/Index.ets:279` |
| `Length` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#Length` | `entry/src/main/ets/pages/Index.ets:276` |
| `Length` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#Length` | `entry/src/main/ets/pages/Index.ets:289` |
| `Length` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#Length` | `entry/src/main/ets/pages/Index.ets:286` |
| `Length` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#Length` | `entry/src/main/ets/pages/Index.ets:299` |
| `Length` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#Length` | `entry/src/main/ets/pages/Index.ets:296` |
| `Length` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#Length` | `entry/src/main/ets/pages/Index.ets:338` |
| `Length` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#Length` | `entry/src/main/ets/pages/Index.ets:329` |
| `left` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: %AC0.left` | `entry/src/main/ets/pages/Index.ets:346` |
| `left` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: %AC0.left` | `entry/src/main/ets/pages/Index.ets:260` |
| `left` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: %AC0.left` | `entry/src/main/ets/pages/Index.ets:276` |
| `left` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: %AC0.left` | `entry/src/main/ets/pages/Index.ets:286` |
| `left` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: %AC0.left` | `entry/src/main/ets/pages/Index.ets:296` |
| `left` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: %AC0.left` | `entry/src/main/ets/pages/Index.ets:329` |
| `right` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: %AC0.right` | `entry/src/main/ets/pages/Index.ets:346` |
| `right` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: %AC0.right` | `entry/src/main/ets/pages/Index.ets:180` |
| `right` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: %AC0.right` | `entry/src/main/ets/pages/Index.ets:260` |
| `right` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: %AC0.right` | `entry/src/main/ets/pages/Index.ets:276` |
| `right` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: %AC0.right` | `entry/src/main/ets/pages/Index.ets:286` |
| `right` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: %AC0.right` | `entry/src/main/ets/pages/Index.ets:296` |
| `right` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: %AC0.right` | `entry/src/main/ets/pages/Index.ets:329` |
| `LengthMetrics` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#LengthMetrics` | `entry/src/main/ets/pages/Index.ets:346` |
| `LengthMetrics` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#LengthMetrics` | `entry/src/main/ets/pages/Index.ets:123` |
| `LengthMetrics` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#LengthMetrics` | `entry/src/main/ets/pages/Index.ets:130` |
| `LengthMetrics` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#LengthMetrics` | `entry/src/main/ets/pages/Index.ets:161` |
| `LengthMetrics` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#LengthMetrics` | `entry/src/main/ets/pages/Index.ets:166` |
| `LengthMetrics` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#LengthMetrics` | `entry/src/main/ets/pages/Index.ets:173` |
| `LengthMetrics` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#LengthMetrics` | `entry/src/main/ets/pages/Index.ets:187` |
| `LengthMetrics` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#LengthMetrics` | `entry/src/main/ets/pages/Index.ets:180` |
| `LengthMetrics` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#LengthMetrics` | `entry/src/main/ets/pages/Index.ets:252` |
| `LengthMetrics` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#LengthMetrics` | `entry/src/main/ets/pages/Index.ets:267` |
| `LengthMetrics` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#LengthMetrics` | `entry/src/main/ets/pages/Index.ets:303` |
| `LengthMetrics` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#LengthMetrics` | `entry/src/main/ets/pages/Index.ets:313` |
| `LengthMetrics` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#LengthMetrics` | `entry/src/main/ets/pages/Index.ets:321` |
| `LengthMetrics` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#LengthMetrics` | `entry/src/main/ets/pages/Index.ets:329` |
| `bottom` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedPadding.bottom` | `entry/src/main/ets/pages/Index.ets:346` |
| `bottom` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedPadding.bottom` | `entry/src/main/ets/pages/Index.ets:123` |
| `bottom` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedPadding.bottom` | `entry/src/main/ets/pages/Index.ets:130` |
| `bottom` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedPadding.bottom` | `entry/src/main/ets/pages/Index.ets:161` |
| `bottom` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedPadding.bottom` | `entry/src/main/ets/pages/Index.ets:166` |
| `bottom` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedPadding.bottom` | `entry/src/main/ets/pages/Index.ets:173` |
| `bottom` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedPadding.bottom` | `entry/src/main/ets/pages/Index.ets:187` |
| `bottom` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedPadding.bottom` | `entry/src/main/ets/pages/Index.ets:180` |
| `bottom` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedPadding.bottom` | `entry/src/main/ets/pages/Index.ets:252` |
| `bottom` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedPadding.bottom` | `entry/src/main/ets/pages/Index.ets:267` |
| `bottom` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedPadding.bottom` | `entry/src/main/ets/pages/Index.ets:303` |
| `bottom` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedPadding.bottom` | `entry/src/main/ets/pages/Index.ets:313` |
| `bottom` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedPadding.bottom` | `entry/src/main/ets/pages/Index.ets:321` |
| `bottom` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedPadding.bottom` | `entry/src/main/ets/pages/Index.ets:329` |
| `top` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedPadding.top` | `entry/src/main/ets/pages/Index.ets:123` |
| `top` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedPadding.top` | `entry/src/main/ets/pages/Index.ets:161` |
| `top` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedPadding.top` | `entry/src/main/ets/pages/Index.ets:252` |
| `top` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedPadding.top` | `entry/src/main/ets/pages/Index.ets:329` |
| `Alignment` | Enum | `component/enums.d.ts` | `@ohos/component/enums.d.ts: Alignment` | `entry/src/main/ets/pages/Index.ets:133` |
| `alignContent` | Property | `component/stack.d.ts` | `@ohos/component/stack.d.ts: StackOptions.alignContent` | `entry/src/main/ets/pages/Index.ets:133` |
| `repeat` | Property | `component/gesture.d.ts` | `@ohos/component/gesture.d.ts: %AC0.repeat` | `entry/src/main/ets/pages/Index.ets:148` |
| `fingers` | Property | `component/gesture.d.ts` | `@ohos/component/gesture.d.ts: %AC0.fingers` | `entry/src/main/ets/pages/Index.ets:148` |
| `duration` | Property | `component/gesture.d.ts` | `@ohos/component/gesture.d.ts: %AC0.duration` | `entry/src/main/ets/pages/Index.ets:148` |
| `Wrap` | EnumValue | `component/enums.d.ts` | `@ohos/component/enums.d.ts: FlexWrap.Wrap` | `entry/src/main/ets/pages/Index.ets:174` |
| `FlexWrap` | Enum | `component/enums.d.ts` | `@ohos/component/enums.d.ts: FlexWrap` | `entry/src/main/ets/pages/Index.ets:174` |
| `wrap` | Property | `component/flex.d.ts` | `@ohos/component/flex.d.ts: FlexOptions.wrap` | `entry/src/main/ets/pages/Index.ets:174` |
| `Start` | EnumValue | `component/enums.d.ts` | `@ohos/component/enums.d.ts: FlexAlign.Start` | `entry/src/main/ets/pages/Index.ets:174` |
| `FlexAlign` | Enum | `component/enums.d.ts` | `@ohos/component/enums.d.ts: FlexAlign` | `entry/src/main/ets/pages/Index.ets:174` |
| `justifyContent` | Property | `component/flex.d.ts` | `@ohos/component/flex.d.ts: FlexOptions.justifyContent` | `entry/src/main/ets/pages/Index.ets:174` |
| `value` | Property | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderOptions.value` | `entry/src/main/ets/pages/Index.ets:202` |
| `value` | Property | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderOptions.value` | `entry/src/main/ets/pages/Index.ets:231` |
| `min` | Property | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderOptions.min` | `entry/src/main/ets/pages/Index.ets:202` |
| `min` | Property | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderOptions.min` | `entry/src/main/ets/pages/Index.ets:231` |
| `max` | Property | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderOptions.max` | `entry/src/main/ets/pages/Index.ets:202` |
| `max` | Property | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderOptions.max` | `entry/src/main/ets/pages/Index.ets:231` |
| `step` | Property | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderOptions.step` | `entry/src/main/ets/pages/Index.ets:202` |
| `step` | Property | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderOptions.step` | `entry/src/main/ets/pages/Index.ets:231` |
| `InSet` | EnumValue | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderStyle.InSet` | `entry/src/main/ets/pages/Index.ets:202` |
| `InSet` | EnumValue | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderStyle.InSet` | `entry/src/main/ets/pages/Index.ets:231` |
| `SliderStyle` | Enum | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderStyle` | `entry/src/main/ets/pages/Index.ets:202` |
| `SliderStyle` | Enum | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderStyle` | `entry/src/main/ets/pages/Index.ets:231` |
| `style` | Property | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderOptions.style` | `entry/src/main/ets/pages/Index.ets:202` |
| `style` | Property | `component/slider.d.ts` | `@ohos/component/slider.d.ts: SliderOptions.style` | `entry/src/main/ets/pages/Index.ets:231` |
| `EdgeWidths` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#EdgeWidths` | `entry/src/main/ets/pages/Index.ets:279` |
| `EdgeWidths` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#EdgeWidths` | `entry/src/main/ets/pages/Index.ets:289` |
| `EdgeWidths` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#EdgeWidths` | `entry/src/main/ets/pages/Index.ets:299` |
| `EdgeWidths` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#EdgeWidths` | `entry/src/main/ets/pages/Index.ets:338` |
| `LocalizedEdgeWidths` | Interface | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedEdgeWidths` | `entry/src/main/ets/pages/Index.ets:279` |
| `LocalizedEdgeWidths` | Interface | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedEdgeWidths` | `entry/src/main/ets/pages/Index.ets:289` |
| `LocalizedEdgeWidths` | Interface | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedEdgeWidths` | `entry/src/main/ets/pages/Index.ets:299` |
| `LocalizedEdgeWidths` | Interface | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedEdgeWidths` | `entry/src/main/ets/pages/Index.ets:338` |
| `width` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: BorderOptions.width` | `entry/src/main/ets/pages/Index.ets:279` |
| `width` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: BorderOptions.width` | `entry/src/main/ets/pages/Index.ets:289` |
| `width` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: BorderOptions.width` | `entry/src/main/ets/pages/Index.ets:299` |
| `width` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: BorderOptions.width` | `entry/src/main/ets/pages/Index.ets:338` |
| `EdgeColors` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#EdgeColors` | `entry/src/main/ets/pages/Index.ets:279` |
| `EdgeColors` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#EdgeColors` | `entry/src/main/ets/pages/Index.ets:289` |
| `EdgeColors` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#EdgeColors` | `entry/src/main/ets/pages/Index.ets:299` |
| `EdgeColors` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#EdgeColors` | `entry/src/main/ets/pages/Index.ets:338` |
| `ResourceColor` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor` | `entry/src/main/ets/pages/Index.ets:279` |
| `ResourceColor` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor` | `entry/src/main/ets/pages/Index.ets:289` |
| `ResourceColor` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor` | `entry/src/main/ets/pages/Index.ets:299` |
| `ResourceColor` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#ResourceColor` | `entry/src/main/ets/pages/Index.ets:338` |
| `LocalizedEdgeColors` | Interface | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedEdgeColors` | `entry/src/main/ets/pages/Index.ets:279` |
| `LocalizedEdgeColors` | Interface | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedEdgeColors` | `entry/src/main/ets/pages/Index.ets:289` |
| `LocalizedEdgeColors` | Interface | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedEdgeColors` | `entry/src/main/ets/pages/Index.ets:299` |
| `LocalizedEdgeColors` | Interface | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedEdgeColors` | `entry/src/main/ets/pages/Index.ets:338` |
| `color` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: BorderOptions.color` | `entry/src/main/ets/pages/Index.ets:279` |
| `color` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: BorderOptions.color` | `entry/src/main/ets/pages/Index.ets:289` |
| `color` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: BorderOptions.color` | `entry/src/main/ets/pages/Index.ets:299` |
| `color` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: BorderOptions.color` | `entry/src/main/ets/pages/Index.ets:338` |
| `BorderRadiuses` | TypeAlias | `component/units.d.ts` | `@ohos/component/units.d.ts: %dflt.%dflt()#BorderRadiuses` | `entry/src/main/ets/pages/Index.ets:338` |
| `LocalizedBorderRadiuses` | Interface | `component/units.d.ts` | `@ohos/component/units.d.ts: LocalizedBorderRadiuses` | `entry/src/main/ets/pages/Index.ets:338` |
| `radius` | Property | `component/units.d.ts` | `@ohos/component/units.d.ts: BorderOptions.radius` | `entry/src/main/ets/pages/Index.ets:338` |

### 项目自定义（248 处）

| API 名称 | 类型 | 声明文件 | 方法定义 / 签名 | 调用位置 |
| --- | --- | --- | --- | --- |
| `EntryAbility` | Class | `src/main/ets/entryability/EntryAbility.ets` | `@entry/src/main/ets/entryability/EntryAbility.ets: EntryAbility` | `entry/src/main/ets/entryability/EntryAbility.ets:8` |
| `EntryAbility` | Class | `src/main/ets/entryability/EntryAbility.ets` | `@entry/src/main/ets/entryability/EntryAbility.ets: EntryAbility` | `entry/src/main/ets/entryability/EntryAbility.ets:17` |
| `EntryAbility` | Class | `src/main/ets/entryability/EntryAbility.ets` | `@entry/src/main/ets/entryability/EntryAbility.ets: EntryAbility` | `entry/src/main/ets/entryability/EntryAbility.ets:21` |
| `EntryAbility` | Class | `src/main/ets/entryability/EntryAbility.ets` | `@entry/src/main/ets/entryability/EntryAbility.ets: EntryAbility` | `entry/src/main/ets/entryability/EntryAbility.ets:34` |
| `EntryAbility` | Class | `src/main/ets/entryability/EntryAbility.ets` | `@entry/src/main/ets/entryability/EntryAbility.ets: EntryAbility` | `entry/src/main/ets/entryability/EntryAbility.ets:39` |
| `EntryAbility` | Class | `src/main/ets/entryability/EntryAbility.ets` | `@entry/src/main/ets/entryability/EntryAbility.ets: EntryAbility` | `entry/src/main/ets/entryability/EntryAbility.ets:44` |
| `onCreate` | Method | `src/main/ets/entryability/EntryAbility.ets` | `@entry/src/main/ets/entryability/EntryAbility.ets: EntryAbility.onCreate(@ohos/api/@ohos.app.ability.Want.d.ts: Want, @ohos/api/@ohos.app.ability.AbilityConstant.d.ts: AbilityConstant.LaunchParam)` | `entry/src/main/ets/entryability/EntryAbility.ets:8` |
| `onDestroy` | Method | `src/main/ets/entryability/EntryAbility.ets` | `@entry/src/main/ets/entryability/EntryAbility.ets: EntryAbility.onDestroy()` | `entry/src/main/ets/entryability/EntryAbility.ets:17` |
| `onWindowStageCreate` | Method | `src/main/ets/entryability/EntryAbility.ets` | `@entry/src/main/ets/entryability/EntryAbility.ets: EntryAbility.onWindowStageCreate(@ohos/api/@ohos.window.d.ts: window.WindowStage)` | `entry/src/main/ets/entryability/EntryAbility.ets:21` |
| `onWindowStageDestroy` | Method | `src/main/ets/entryability/EntryAbility.ets` | `@entry/src/main/ets/entryability/EntryAbility.ets: EntryAbility.onWindowStageDestroy()` | `entry/src/main/ets/entryability/EntryAbility.ets:34` |
| `onForeground` | Method | `src/main/ets/entryability/EntryAbility.ets` | `@entry/src/main/ets/entryability/EntryAbility.ets: EntryAbility.onForeground()` | `entry/src/main/ets/entryability/EntryAbility.ets:39` |
| `onBackground` | Method | `src/main/ets/entryability/EntryAbility.ets` | `@entry/src/main/ets/entryability/EntryAbility.ets: EntryAbility.onBackground()` | `entry/src/main/ets/entryability/EntryAbility.ets:44` |
| `EntryBackupAbility` | Class | `src/main/ets/entrybackupability/EntryBackupAbility.ets` | `@entry/src/main/ets/entrybackupability/EntryBackupAbility.ets: EntryBackupAbility` | `entry/src/main/ets/entrybackupability/EntryBackupAbility.ets:7` |
| `EntryBackupAbility` | Class | `src/main/ets/entrybackupability/EntryBackupAbility.ets` | `@entry/src/main/ets/entrybackupability/EntryBackupAbility.ets: EntryBackupAbility` | `entry/src/main/ets/entrybackupability/EntryBackupAbility.ets:12` |
| `onBackup` | Method | `src/main/ets/entrybackupability/EntryBackupAbility.ets` | `@entry/src/main/ets/entrybackupability/EntryBackupAbility.ets: EntryBackupAbility.onBackup()` | `entry/src/main/ets/entrybackupability/EntryBackupAbility.ets:7` |
| `onRestore` | Method | `src/main/ets/entrybackupability/EntryBackupAbility.ets` | `@entry/src/main/ets/entrybackupability/EntryBackupAbility.ets: EntryBackupAbility.onRestore(@ohos/api/@ohos.application.BackupExtensionAbility.d.ts: BundleVersion)` | `entry/src/main/ets/entrybackupability/EntryBackupAbility.ets:12` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC1$%dflt.%dflt.constructor()` | `entry/src/main/ets/pages/Index.ets:38` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC2$%dflt.%dflt.constructor()` | `entry/src/main/ets/pages/Index.ets:39` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC3$%dflt.%dflt.constructor()` | `entry/src/main/ets/pages/Index.ets:40` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC4$%dflt.%dflt.constructor()` | `entry/src/main/ets/pages/Index.ets:41` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC5$%dflt.%dflt.constructor()` | `entry/src/main/ets/pages/Index.ets:45` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC6$%dflt.%dflt.constructor()` | `entry/src/main/ets/pages/Index.ets:46` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC7$%dflt.%dflt.constructor()` | `entry/src/main/ets/pages/Index.ets:47` |
| `statusName` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %dflt.statusName(InsStatus)` | `entry/src/main/ets/pages/Index.ets:50` |
| `statusName` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %dflt.statusName(InsStatus)` | `entry/src/main/ets/pages/Index.ets:157` |
| `statusName` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %dflt.statusName(InsStatus)` | `entry/src/main/ets/pages/Index.ets:92` |
| `nextStatus` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %dflt.nextStatus(InsStatus)` | `entry/src/main/ets/pages/Index.ets:59` |
| `nextStatus` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %dflt.nextStatus(InsStatus)` | `entry/src/main/ets/pages/Index.ets:354` |
| `formatTime` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %dflt.formatTime(@built-in/lib.es5.d.ts: Date)` | `entry/src/main/ets/pages/Index.ets:68` |
| `formatTime` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %dflt.formatTime(@built-in/lib.es5.d.ts: Date)` | `entry/src/main/ets/pages/Index.ets:101` |
| `name` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ColorPreset.name` | `entry/src/main/ets/pages/Index.ets:21` |
| `name` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ColorPreset.name` | `entry/src/main/ets/pages/Index.ets:176` |
| `start` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ColorPreset.start` | `entry/src/main/ets/pages/Index.ets:22` |
| `start` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ColorPreset.start` | `entry/src/main/ets/pages/Index.ets:364` |
| `start` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ColorPreset.start` | `entry/src/main/ets/pages/Index.ets:366` |
| `start` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ColorPreset.start` | `entry/src/main/ets/pages/Index.ets:380` |
| `start` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ColorPreset.start` | `entry/src/main/ets/pages/Index.ets:137` |
| `end` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ColorPreset.end` | `entry/src/main/ets/pages/Index.ets:23` |
| `end` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ColorPreset.end` | `entry/src/main/ets/pages/Index.ets:365` |
| `end` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ColorPreset.end` | `entry/src/main/ets/pages/Index.ets:366` |
| `end` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ColorPreset.end` | `entry/src/main/ets/pages/Index.ets:381` |
| `end` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ColorPreset.end` | `entry/src/main/ets/pages/Index.ets:138` |
| `name` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ImagePreset.name` | `entry/src/main/ets/pages/Index.ets:27` |
| `name` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ImagePreset.name` | `entry/src/main/ets/pages/Index.ets:84` |
| `name` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ImagePreset.name` | `entry/src/main/ets/pages/Index.ets:370` |
| `name` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ImagePreset.name` | `entry/src/main/ets/pages/Index.ets:373` |
| `name` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ImagePreset.name` | `entry/src/main/ets/pages/Index.ets:386` |
| `name` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ImagePreset.name` | `entry/src/main/ets/pages/Index.ets:262` |
| `name` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ImagePreset.name` | `entry/src/main/ets/pages/Index.ets:261` |
| `name` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ImagePreset.name` | `entry/src/main/ets/pages/Index.ets:255` |
| `src` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ImagePreset.src` | `entry/src/main/ets/pages/Index.ets:28` |
| `src` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ImagePreset.src` | `entry/src/main/ets/pages/Index.ets:83` |
| `src` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ImagePreset.src` | `entry/src/main/ets/pages/Index.ets:374` |
| `src` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ImagePreset.src` | `entry/src/main/ets/pages/Index.ets:375` |
| `src` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ImagePreset.src` | `entry/src/main/ets/pages/Index.ets:376` |
| `src` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ImagePreset.src` | `entry/src/main/ets/pages/Index.ets:387` |
| `src` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: ImagePreset.src` | `entry/src/main/ets/pages/Index.ets:388` |
| `id` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: LogEntry.id` | `entry/src/main/ets/pages/Index.ets:32` |
| `id` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: LogEntry.id` | `entry/src/main/ets/pages/Index.ets:330` |
| `text` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: LogEntry.text` | `entry/src/main/ets/pages/Index.ets:33` |
| `text` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: LogEntry.text` | `entry/src/main/ets/pages/Index.ets:325` |
| `time` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: LogEntry.time` | `entry/src/main/ets/pages/Index.ets:34` |
| `time` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: LogEntry.time` | `entry/src/main/ets/pages/Index.ets:325` |
| `controller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC0.controller` | `entry/src/main/ets/pages/Index.ets:1` |
| `logId` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC0.logId` | `entry/src/main/ets/pages/Index.ets:1` |
| `currentStatus` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC0.currentStatus` | `entry/src/main/ets/pages/Index.ets:1` |
| `currentImageSrc` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC0.currentImageSrc` | `entry/src/main/ets/pages/Index.ets:1` |
| `currentImageName` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC0.currentImageName` | `entry/src/main/ets/pages/Index.ets:1` |
| `circleDuration` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC0.circleDuration` | `entry/src/main/ets/pages/Index.ets:1` |
| `rotateDuration` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC0.rotateDuration` | `entry/src/main/ets/pages/Index.ets:1` |
| `logs` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC0.logs` | `entry/src/main/ets/pages/Index.ets:1` |
| `LogEntry` | Interface | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: LogEntry` | `entry/src/main/ets/pages/Index.ets:1` |
| `LogEntry` | Interface | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: LogEntry` | `entry/src/main/ets/pages/Index.ets:103` |
| `LogEntry` | Interface | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: LogEntry` | `entry/src/main/ets/pages/Index.ets:104` |
| `LogEntry` | Interface | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: LogEntry` | `entry/src/main/ets/pages/Index.ets:105` |
| `LogEntry` | Interface | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: LogEntry` | `entry/src/main/ets/pages/Index.ets:324` |
| `LogEntry` | Interface | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: LogEntry` | `entry/src/main/ets/pages/Index.ets:87` |
| `scroller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC0.scroller` | `entry/src/main/ets/pages/Index.ets:1` |
| `controller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.controller` | `entry/src/main/ets/pages/Index.ets:90` |
| `controller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.controller` | `entry/src/main/ets/pages/Index.ets:353` |
| `controller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.controller` | `entry/src/main/ets/pages/Index.ets:355` |
| `controller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.controller` | `entry/src/main/ets/pages/Index.ets:364` |
| `controller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.controller` | `entry/src/main/ets/pages/Index.ets:365` |
| `controller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.controller` | `entry/src/main/ets/pages/Index.ets:375` |
| `controller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.controller` | `entry/src/main/ets/pages/Index.ets:380` |
| `controller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.controller` | `entry/src/main/ets/pages/Index.ets:381` |
| `controller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.controller` | `entry/src/main/ets/pages/Index.ets:384` |
| `controller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.controller` | `entry/src/main/ets/pages/Index.ets:385` |
| `controller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.controller` | `entry/src/main/ets/pages/Index.ets:388` |
| `controller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.controller` | `entry/src/main/ets/pages/Index.ets:389` |
| `controller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.controller` | `entry/src/main/ets/pages/Index.ets:212` |
| `controller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.controller` | `entry/src/main/ets/pages/Index.ets:241` |
| `controller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.controller` | `entry/src/main/ets/pages/Index.ets:280` |
| `controller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.controller` | `entry/src/main/ets/pages/Index.ets:290` |
| `controller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.controller` | `entry/src/main/ets/pages/Index.ets:300` |
| `controller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.controller` | `entry/src/main/ets/pages/Index.ets:79` |
| `controller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.controller` | `entry/src/main/ets/pages/Index.ets:142` |
| `logId` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.logId` | `entry/src/main/ets/pages/Index.ets:80` |
| `logId` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.logId` | `entry/src/main/ets/pages/Index.ets:99` |
| `currentStatus` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.currentStatus` | `entry/src/main/ets/pages/Index.ets:157` |
| `currentStatus` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.currentStatus` | `entry/src/main/ets/pages/Index.ets:91` |
| `currentStatus` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.currentStatus` | `entry/src/main/ets/pages/Index.ets:82` |
| `currentImageSrc` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.currentImageSrc` | `entry/src/main/ets/pages/Index.ets:374` |
| `currentImageSrc` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.currentImageSrc` | `entry/src/main/ets/pages/Index.ets:387` |
| `currentImageSrc` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.currentImageSrc` | `entry/src/main/ets/pages/Index.ets:83` |
| `currentImageSrc` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.currentImageSrc` | `entry/src/main/ets/pages/Index.ets:135` |
| `currentImageName` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.currentImageName` | `entry/src/main/ets/pages/Index.ets:370` |
| `currentImageName` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.currentImageName` | `entry/src/main/ets/pages/Index.ets:373` |
| `currentImageName` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.currentImageName` | `entry/src/main/ets/pages/Index.ets:386` |
| `currentImageName` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.currentImageName` | `entry/src/main/ets/pages/Index.ets:262` |
| `currentImageName` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.currentImageName` | `entry/src/main/ets/pages/Index.ets:261` |
| `currentImageName` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.currentImageName` | `entry/src/main/ets/pages/Index.ets:84` |
| `circleDuration` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.circleDuration` | `entry/src/main/ets/pages/Index.ets:195` |
| `circleDuration` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.circleDuration` | `entry/src/main/ets/pages/Index.ets:382` |
| `circleDuration` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.circleDuration` | `entry/src/main/ets/pages/Index.ets:210` |
| `circleDuration` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.circleDuration` | `entry/src/main/ets/pages/Index.ets:211` |
| `circleDuration` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.circleDuration` | `entry/src/main/ets/pages/Index.ets:85` |
| `circleDuration` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.circleDuration` | `entry/src/main/ets/pages/Index.ets:139` |
| `circleDuration` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.circleDuration` | `entry/src/main/ets/pages/Index.ets:202` |
| `rotateDuration` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.rotateDuration` | `entry/src/main/ets/pages/Index.ets:224` |
| `rotateDuration` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.rotateDuration` | `entry/src/main/ets/pages/Index.ets:383` |
| `rotateDuration` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.rotateDuration` | `entry/src/main/ets/pages/Index.ets:239` |
| `rotateDuration` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.rotateDuration` | `entry/src/main/ets/pages/Index.ets:240` |
| `rotateDuration` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.rotateDuration` | `entry/src/main/ets/pages/Index.ets:86` |
| `rotateDuration` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.rotateDuration` | `entry/src/main/ets/pages/Index.ets:140` |
| `rotateDuration` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.rotateDuration` | `entry/src/main/ets/pages/Index.ets:231` |
| `logs` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.logs` | `entry/src/main/ets/pages/Index.ets:103` |
| `logs` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.logs` | `entry/src/main/ets/pages/Index.ets:104` |
| `logs` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.logs` | `entry/src/main/ets/pages/Index.ets:105` |
| `logs` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.logs` | `entry/src/main/ets/pages/Index.ets:324` |
| `logs` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.logs` | `entry/src/main/ets/pages/Index.ets:87` |
| `scroller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.scroller` | `entry/src/main/ets/pages/Index.ets:322` |
| `scroller` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.scroller` | `entry/src/main/ets/pages/Index.ets:350` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:74` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:89` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:94` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:97` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:109` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:111` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:114` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:352` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:356` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:359` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:360` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:363` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:366` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:369` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:376` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:379` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:390` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:92` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:149` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:146` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:183` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:213` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:242` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:263` |
| `Index` | Struct | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index` | `entry/src/main/ets/pages/Index.ets:312` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.constructor(@entry/src/main/ets/pages/Index.ets: Index, @ohos/component/common_ts_ets_api.d.ts: LocalStorage)` | `entry/src/main/ets/pages/Index.ets:74` |
| `aboutToAppear` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.aboutToAppear()` | `entry/src/main/ets/pages/Index.ets:89` |
| `appendLog` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.appendLog(string)` | `entry/src/main/ets/pages/Index.ets:94` |
| `appendLog` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.appendLog(string)` | `entry/src/main/ets/pages/Index.ets:97` |
| `appendLog` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.appendLog(string)` | `entry/src/main/ets/pages/Index.ets:111` |
| `appendLog` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.appendLog(string)` | `entry/src/main/ets/pages/Index.ets:366` |
| `appendLog` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.appendLog(string)` | `entry/src/main/ets/pages/Index.ets:376` |
| `appendLog` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.appendLog(string)` | `entry/src/main/ets/pages/Index.ets:390` |
| `appendLog` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.appendLog(string)` | `entry/src/main/ets/pages/Index.ets:92` |
| `appendLog` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.appendLog(string)` | `entry/src/main/ets/pages/Index.ets:213` |
| `appendLog` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.appendLog(string)` | `entry/src/main/ets/pages/Index.ets:242` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC8$Index.appendLog.constructor()` | `entry/src/main/ets/pages/Index.ets:102` |
| `showToast` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.showToast(string)` | `entry/src/main/ets/pages/Index.ets:109` |
| `showToast` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.showToast(string)` | `entry/src/main/ets/pages/Index.ets:356` |
| `showToast` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.showToast(string)` | `entry/src/main/ets/pages/Index.ets:360` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC9$Index.showToast.constructor()` | `entry/src/main/ets/pages/Index.ets:110` |
| `build` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.build()` | `entry/src/main/ets/pages/Index.ets:114` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC10$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:346` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC11$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:123` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC12$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:130` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC13$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:133` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC14$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:148` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC15$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:143` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC16$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:161` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC17$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:166` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC18$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:173` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC19$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:187` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC20$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:174` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC22$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:202` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC23$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:231` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC24$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:252` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC25$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:267` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC27$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:303` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC28$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:279` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC29$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:276` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC30$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:289` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC31$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:286` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC32$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:299` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC33$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:296` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC34$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:313` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC35$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:321` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC36$Index.build.constructor()` | `entry/src/main/ets/pages/Index.ets:338` |
| `onAvatarClick` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.onAvatarClick()` | `entry/src/main/ets/pages/Index.ets:352` |
| `onAvatarClick` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.onAvatarClick()` | `entry/src/main/ets/pages/Index.ets:146` |
| `onAvatarLongPress` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.onAvatarLongPress()` | `entry/src/main/ets/pages/Index.ets:359` |
| `onAvatarLongPress` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.onAvatarLongPress()` | `entry/src/main/ets/pages/Index.ets:149` |
| `onColorPreset` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.onColorPreset(@entry/src/main/ets/pages/Index.ets: ColorPreset)` | `entry/src/main/ets/pages/Index.ets:363` |
| `onColorPreset` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.onColorPreset(@entry/src/main/ets/pages/Index.ets: ColorPreset)` | `entry/src/main/ets/pages/Index.ets:183` |
| `onImagePreset` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.onImagePreset(@entry/src/main/ets/pages/Index.ets: ImagePreset)` | `entry/src/main/ets/pages/Index.ets:369` |
| `onImagePreset` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.onImagePreset(@entry/src/main/ets/pages/Index.ets: ImagePreset)` | `entry/src/main/ets/pages/Index.ets:263` |
| `onReset` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.onReset()` | `entry/src/main/ets/pages/Index.ets:379` |
| `onReset` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: Index.onReset()` | `entry/src/main/ets/pages/Index.ets:312` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC21$Index.%AM3$build.constructor()` | `entry/src/main/ets/pages/Index.ets:180` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC26$Index.%AM7$build.constructor()` | `entry/src/main/ets/pages/Index.ets:260` |
| `constructor` | Method | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC37$Index.%AM13$build.constructor()` | `entry/src/main/ets/pages/Index.ets:329` |
| `name` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC1$%dflt.%dflt.name` | `entry/src/main/ets/pages/Index.ets:38` |
| `start` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC1$%dflt.%dflt.start` | `entry/src/main/ets/pages/Index.ets:38` |
| `end` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC1$%dflt.%dflt.end` | `entry/src/main/ets/pages/Index.ets:38` |
| `name` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC2$%dflt.%dflt.name` | `entry/src/main/ets/pages/Index.ets:39` |
| `start` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC2$%dflt.%dflt.start` | `entry/src/main/ets/pages/Index.ets:39` |
| `end` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC2$%dflt.%dflt.end` | `entry/src/main/ets/pages/Index.ets:39` |
| `name` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC3$%dflt.%dflt.name` | `entry/src/main/ets/pages/Index.ets:40` |
| `start` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC3$%dflt.%dflt.start` | `entry/src/main/ets/pages/Index.ets:40` |
| `end` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC3$%dflt.%dflt.end` | `entry/src/main/ets/pages/Index.ets:40` |
| `name` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC4$%dflt.%dflt.name` | `entry/src/main/ets/pages/Index.ets:41` |
| `start` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC4$%dflt.%dflt.start` | `entry/src/main/ets/pages/Index.ets:41` |
| `end` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC4$%dflt.%dflt.end` | `entry/src/main/ets/pages/Index.ets:41` |
| `name` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC5$%dflt.%dflt.name` | `entry/src/main/ets/pages/Index.ets:45` |
| `src` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC5$%dflt.%dflt.src` | `entry/src/main/ets/pages/Index.ets:45` |
| `name` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC6$%dflt.%dflt.name` | `entry/src/main/ets/pages/Index.ets:46` |
| `src` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC6$%dflt.%dflt.src` | `entry/src/main/ets/pages/Index.ets:46` |
| `name` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC7$%dflt.%dflt.name` | `entry/src/main/ets/pages/Index.ets:47` |
| `src` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC7$%dflt.%dflt.src` | `entry/src/main/ets/pages/Index.ets:47` |
| `id` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC8$Index.appendLog.id` | `entry/src/main/ets/pages/Index.ets:99` |
| `text` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC8$Index.appendLog.text` | `entry/src/main/ets/pages/Index.ets:100` |
| `time` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC8$Index.appendLog.time` | `entry/src/main/ets/pages/Index.ets:101` |
| `imageSrc` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC15$Index.build.imageSrc` | `entry/src/main/ets/pages/Index.ets:135` |
| `status` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC15$Index.build.status` | `entry/src/main/ets/pages/Index.ets:136` |
| `startColor` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC15$Index.build.startColor` | `entry/src/main/ets/pages/Index.ets:137` |
| `endColor` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC15$Index.build.endColor` | `entry/src/main/ets/pages/Index.ets:138` |
| `sideLength` | Property | `src/main/ets/pages/Index.ets` | `@entry/src/main/ets/pages/Index.ets: %AC15$Index.build.sideLength` | `entry/src/main/ets/pages/Index.ets:141` |
| `abilityTest` | Method | `src/ohosTest/ets/test/Ability.test.ets` | `@entry/src/ohosTest/ets/test/Ability.test.ets: %dflt.abilityTest()` | `entry/src/ohosTest/ets/test/Ability.test.ets:4` |
| `abilityTest` | Method | `src/ohosTest/ets/test/Ability.test.ets` | `@entry/src/ohosTest/ets/test/Ability.test.ets: %dflt.abilityTest()` | `entry/src/ohosTest/ets/test/List.test.ets:4` |
| `testsuite` | Method | `src/ohosTest/ets/test/List.test.ets` | `@entry/src/ohosTest/ets/test/List.test.ets: %dflt.testsuite()` | `entry/src/ohosTest/ets/test/List.test.ets:3` |
| `testsuite` | Method | `src/test/List.test.ets` | `@entry/src/test/List.test.ets: %dflt.testsuite()` | `entry/src/test/List.test.ets:3` |
| `localUnitTest` | Method | `src/test/LocalUnit.test.ets` | `@entry/src/test/LocalUnit.test.ets: %dflt.localUnitTest()` | `entry/src/test/List.test.ets:4` |
| `localUnitTest` | Method | `src/test/LocalUnit.test.ets` | `@entry/src/test/LocalUnit.test.ets: %dflt.localUnitTest()` | `entry/src/test/LocalUnit.test.ets:3` |

