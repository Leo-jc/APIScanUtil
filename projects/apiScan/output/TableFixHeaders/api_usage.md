# HarmonyOS API 变更中心 — API 使用文档

生成时间：2026-08-17 17:07:06

## 概述

- **API 使用记录数**：47
- **涉及的唯一 API**：13
- **扫描的 .ets 文件数**：8
- **知识库文件总数**：53
- **API 直接匹配的知识文件**：27
- **未被代码直接引用的知识文件**：26

> **统计口径**：知识库共 53 个文件。其中 27 个被代码中的 API 直接引用（即应用代码使用了该文件中出现的 API）；其余 26 个文件未被本次扫描的源码直接命中。

## API 使用详情

| # | API | 代码位置 | 片段 | 来源知识文件 |
|---|-----|----------|------|-------------|
| 1 | `ConfigurationConstant.ColorMode` | `entry\src\main\ets\entryability\EntryAbility.ets:1` | `import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.Ab` | (未在知识库中找到对应文件，可能为 ArkUI 内置 API) |
| 2 | `import hilog` | `entry\src\main\ets\entryability\EntryAbility.ets:2` | `import { hilog } from '@kit.PerformanceAnalysisKit';` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 3 | `import window` | `entry\src\main\ets\entryability\EntryAbility.ets:3` | `import { window } from '@kit.ArkUI';` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json<br>…等 14 个文件 |
| 4 | `getContext().getApplicationContext` | `entry\src\main\ets\entryability\EntryAbility.ets:10` | `this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMod` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json<br>harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json<br>…等 6 个文件 |
| 5 | `setColorMode` | `entry\src\main\ets\entryability\EntryAbility.ets:10` | `this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMod` | (未在知识库中找到对应文件，可能为 ArkUI 内置 API) |
| 6 | `ConfigurationConstant.ColorMode` | `entry\src\main\ets\entryability\EntryAbility.ets:10` | `this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMod` | (未在知识库中找到对应文件，可能为 ArkUI 内置 API) |
| 7 | `hilog.error` | `entry\src\main\ets\entryability\EntryAbility.ets:12` | `hilog.error(DOMAIN, 'testTag', 'Failed to set colorMode. Cause: %{public}s', JSO` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 8 | `hilog.info` | `entry\src\main\ets\entryability\EntryAbility.ets:14` | `hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 9 | `hilog.info` | `entry\src\main\ets\entryability\EntryAbility.ets:18` | `hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 10 | `hilog.info` | `entry\src\main\ets\entryability\EntryAbility.ets:23` | `hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 11 | `hilog.error` | `entry\src\main\ets\entryability\EntryAbility.ets:27` | `hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', ` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 12 | `hilog.info` | `entry\src\main\ets\entryability\EntryAbility.ets:30` | `hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 13 | `hilog.info` | `entry\src\main\ets\entryability\EntryAbility.ets:36` | `hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 14 | `hilog.info` | `entry\src\main\ets\entryability\EntryAbility.ets:41` | `hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground');` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 15 | `hilog.info` | `entry\src\main\ets\entryability\EntryAbility.ets:46` | `hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 16 | `import hilog` | `entry\src\main\ets\entrybackupability\EntryBackupAbility.ets:1` | `import { hilog } from '@kit.PerformanceAnalysisKit';` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 17 | `hilog.info` | `entry\src\main\ets\entrybackupability\EntryBackupAbility.ets:8` | `hilog.info(DOMAIN, 'testTag', 'onBackup ok');` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 18 | `hilog.info` | `entry\src\main\ets\entrybackupability\EntryBackupAbility.ets:13` | `hilog.info(DOMAIN, 'testTag', 'onRestore ok %{public}s', JSON.stringify(bundleVe` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 19 | `import router` | `entry\src\main\ets\pages\FamilyTablePage.ets:20` | `import { router } from '@kit.ArkUI';` | harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Beta3.json |
| 20 | `router.back` | `entry\src\main\ets\pages\FamilyTablePage.ets:43` | `router.back();` | harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Beta3.json |
| 21 | `TextAttribute.fontWeight` | `entry\src\main\ets\pages\FamilyTablePage.ets:48` | `.fontWeight(FontWeight.Bold)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>…等 12 个文件 |
| 22 | `TextAttribute.fontWeight` | `entry\src\main\ets\pages\FamilyTablePage.ets:85` | `.fontWeight(FontWeight.Medium)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>…等 12 个文件 |
| 23 | `CommonMethod.borderRadius` | `entry\src\main\ets\pages\FamilyTablePage.ets:97` | `.borderRadius({ topLeft: 12, topRight: 12 })` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>…等 25 个文件 |
| 24 | `import router` | `entry\src\main\ets\pages\Index.ets:17` | `import { router } from '@kit.ArkUI';` | harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Beta3.json |
| 25 | `TextAttribute.fontWeight` | `entry\src\main\ets\pages\Index.ets:41` | `.fontWeight(FontWeight.Bold)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>…等 12 个文件 |
| 26 | `List/ForEach/ListItem` | `entry\src\main\ets\pages\Index.ets:55` | `List({ space: 12 }) {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json<br>harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json |
| 27 | `List/ForEach/ListItem` | `entry\src\main\ets\pages\Index.ets:56` | `ForEach(this.demos, (item: DemoEntry, index: number) => {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json<br>harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json |
| 28 | `List/ForEach/ListItem` | `entry\src\main\ets\pages\Index.ets:57` | `ListItem() {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json<br>harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json |
| 29 | `CommonMethod.borderRadius` | `entry\src\main\ets\pages\Index.ets:63` | `.borderRadius(12)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>…等 25 个文件 |
| 30 | `TextAttribute.fontWeight` | `entry\src\main\ets\pages\Index.ets:77` | `.fontWeight(FontWeight.Bold)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>…等 12 个文件 |
| 31 | `TextAttribute.fontWeight` | `entry\src\main\ets\pages\Index.ets:85` | `.fontWeight(FontWeight.Medium)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>…等 12 个文件 |
| 32 | `router.pushUrl` | `entry\src\main\ets\pages\Index.ets:129` | `router.pushUrl({` | harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Beta3.json |
| 33 | `import router` | `entry\src\main\ets\pages\SimpleTablePage.ets:19` | `import { router } from '@kit.ArkUI';` | harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Beta3.json |
| 34 | `router.back` | `entry\src\main\ets\pages\SimpleTablePage.ets:58` | `router.back();` | harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Beta3.json |
| 35 | `TextAttribute.fontWeight` | `entry\src\main\ets\pages\SimpleTablePage.ets:63` | `.fontWeight(FontWeight.Bold)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>…等 12 个文件 |
| 36 | `TextAttribute.fontWeight` | `entry\src\main\ets\pages\SimpleTablePage.ets:101` | `.fontWeight(FontWeight.Medium)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>…等 12 个文件 |
| 37 | `CommonMethod.borderRadius` | `entry\src\main\ets\pages\SimpleTablePage.ets:113` | `.borderRadius({ topLeft: 12, topRight: 12 })` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>…等 25 个文件 |
| 38 | `import router` | `entry\src\main\ets\pages\StyleTablePage.ets:20` | `import { router } from '@kit.ArkUI';` | harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Beta3.json |
| 39 | `router.back` | `entry\src\main\ets\pages\StyleTablePage.ets:44` | `router.back();` | harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Beta3.json |
| 40 | `TextAttribute.fontWeight` | `entry\src\main\ets\pages\StyleTablePage.ets:49` | `.fontWeight(FontWeight.Bold)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>…等 12 个文件 |
| 41 | `TextAttribute.fontWeight` | `entry\src\main\ets\pages\StyleTablePage.ets:86` | `.fontWeight(FontWeight.Medium)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>…等 12 个文件 |
| 42 | `CommonMethod.borderRadius` | `entry\src\main\ets\pages\StyleTablePage.ets:98` | `.borderRadius({ topLeft: 12, topRight: 12 })` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>…等 25 个文件 |
| 43 | `TextAttribute.fontWeight` | `library\src\main\ets\components\MainPage.ets:10` | `.fontWeight(FontWeight.Bold)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>…等 12 个文件 |
| 44 | `List/ForEach/ListItem` | `library\src\main\ets\tablefixheaders\TableFixHeaders.ets:572` | `ForEach(this.getVisibleColumns(), (col: number) => {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json<br>harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json |
| 45 | `List/ForEach/ListItem` | `library\src\main\ets\tablefixheaders\TableFixHeaders.ets:591` | `ForEach(this.getVisibleRows(), (row: number) => {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json<br>harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json |
| 46 | `List/ForEach/ListItem` | `library\src\main\ets\tablefixheaders\TableFixHeaders.ets:609` | `ForEach(this.getVisibleRows(), (row: number) => {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json<br>harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json |
| 47 | `List/ForEach/ListItem` | `library\src\main\ets\tablefixheaders\TableFixHeaders.ets:611` | `ForEach(this.getVisibleColumns(), (col: number) => {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json<br>harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json |

## 知识库文件覆盖清单

共 **28** 个知识文件被 API 使用或数据层加载覆盖。

| 目录 | 文件名 | 被引用的 API 数量 |
|------|--------|------------------|
|  | (未在知识库中找到对应文件，可能为 ArkUI 内置 API) | {'ConfigurationConstant.ColorMode', 'setColorMode'} |
| harmonyos_api_changes | HarmonyOS_26.0.0_Beta1.json | {'CommonMethod.borderRadius', 'List/ForEach/ListItem', 'TextAttribute.fontWeight', 'import window'} |
| harmonyos_api_changes | HarmonyOS_26.0.0_Beta2.json | {'CommonMethod.borderRadius', 'TextAttribute.fontWeight', 'getContext().getApplicationContext', 'hilog.error', 'hilog.info', 'import hilog', 'import window'} |
| harmonyos_api_changes | HarmonyOS_5.0.1(13)_Beta3.json | {'CommonMethod.borderRadius', 'TextAttribute.fontWeight', 'getContext().getApplicationContext'} |
| harmonyos_api_changes | HarmonyOS_5.0.1(13)_Release.json | {'CommonMethod.borderRadius'} |
| harmonyos_api_changes | HarmonyOS_5.0.2(14).json | {'CommonMethod.borderRadius', 'TextAttribute.fontWeight', 'getContext().getApplicationContext', 'import window'} |
| harmonyos_api_changes | HarmonyOS_5.0.3(15)_Beta1.json | {'hilog.error', 'hilog.info', 'import hilog', 'import window'} |
| harmonyos_api_changes | HarmonyOS_5.0.3(15)_Beta2.json | {'CommonMethod.borderRadius', 'import window'} |
| harmonyos_api_changes | HarmonyOS_5.0.3(15)_Release.json | {'CommonMethod.borderRadius'} |
| harmonyos_api_changes | HarmonyOS_5.0.5(17).json | {'CommonMethod.borderRadius', 'import window'} |
| harmonyos_api_changes | HarmonyOS_5.1.0(18).json | {'CommonMethod.borderRadius', 'List/ForEach/ListItem', 'TextAttribute.fontWeight', 'import router', 'import window', 'router.back', 'router.pushUrl'} |
| harmonyos_api_changes | HarmonyOS_5.1.1(19)_Beta1.json | {'CommonMethod.borderRadius', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.0.0(20)_Beta1.json | {'CommonMethod.borderRadius', 'TextAttribute.fontWeight', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.0.0(20)_Beta2.json | {'CommonMethod.borderRadius', 'TextAttribute.fontWeight', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.0.0(20)_Beta3.json | {'CommonMethod.borderRadius', 'TextAttribute.fontWeight', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.0.1(21)_Beta1.json | {'CommonMethod.borderRadius', 'TextAttribute.fontWeight', 'hilog.error', 'hilog.info', 'import hilog', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.0.1(21)_Release.json | {'CommonMethod.borderRadius', 'getContext().getApplicationContext'} |
| harmonyos_api_changes | HarmonyOS_6.0.2(22).json | {'CommonMethod.borderRadius', 'TextAttribute.fontWeight', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.1.0(23)_Beta1.json | {'CommonMethod.borderRadius', 'List/ForEach/ListItem', 'TextAttribute.fontWeight', 'getContext().getApplicationContext', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.1.1(24)_Beta1.json | {'CommonMethod.borderRadius', 'getContext().getApplicationContext'} |
| harmonyos_behavior_changes | HarmonyOS_26.0.0(26)_Beta1.json | {'CommonMethod.borderRadius'} |
| harmonyos_behavior_changes | HarmonyOS_5.0.1(13)_Beta3.json | {'CommonMethod.borderRadius', 'import router', 'router.back', 'router.pushUrl'} |
| harmonyos_behavior_changes | HarmonyOS_5.0.1(13)_Release.json | {'CommonMethod.borderRadius'} |
| harmonyos_behavior_changes | HarmonyOS_5.0.2(14)_Beta1.json | {'CommonMethod.borderRadius', 'List/ForEach/ListItem'} |
| harmonyos_behavior_changes | HarmonyOS_5.0.3(15)_Beta2.json | {'CommonMethod.borderRadius'} |
| harmonyos_behavior_changes | HarmonyOS_5.1.0(18)_Release.json | {'CommonMethod.borderRadius'} |
| harmonyos_behavior_changes | HarmonyOS_6.0.0(20)_Beta1.json | {'TextAttribute.fontWeight'} |
| harmonyos_behavior_changes | HarmonyOS_6.0.0(20)_Beta2.json | {'CommonMethod.borderRadius'} |

---
*本文档由 hoscanner（HarmonyOS 升级 API 变更扫描工具）自动生成。*