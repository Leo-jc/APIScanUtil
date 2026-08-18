# HarmonyOS API 变更中心 — API 使用文档

生成时间：2026-08-17 17:07:08

## 概述

- **API 使用记录数**：25
- **涉及的唯一 API**：10
- **扫描的 .ets 文件数**：4
- **知识库文件总数**：53
- **API 直接匹配的知识文件**：22
- **未被代码直接引用的知识文件**：31

> **统计口径**：知识库共 53 个文件。其中 22 个被代码中的 API 直接引用（即应用代码使用了该文件中出现的 API）；其余 31 个文件未被本次扫描的源码直接命中。

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
| 19 | `TextAttribute.fontWeight` | `entry\src\main\ets\pages\Index.ets:113` | `.fontWeight(FontWeight.Medium)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>…等 12 个文件 |
| 20 | `List/ForEach/ListItem` | `entry\src\main\ets\pages\Index.ets:127` | `ForEach(this.pages, (page: PageData, index: number) => {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json<br>harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json |
| 21 | `TextAttribute.fontWeight` | `entry\src\main\ets\pages\Index.ets:132` | `.fontWeight(FontWeight.Normal)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>…等 12 个文件 |
| 22 | `ScrollableCommonMethod (Scroll)` | `entry\src\main\ets\pages\Index.ets:299` | `Scroll() {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>…等 11 个文件 |
| 23 | `List/ForEach/ListItem` | `entry\src\main\ets\pages\Index.ets:301` | `ForEach(this.logEntries, (entry: LogEntry, index: number) => {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json<br>harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json |
| 24 | `List/ForEach/ListItem` | `ohos_library\src\main\ets\components\DotsIndicator.ets:176` | `ForEach(this.getDotIndices(), (item: number) => {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json<br>harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json |
| 25 | `List/ForEach/ListItem` | `ohos_library\src\main\ets\components\DotsIndicator.ets:197` | `ForEach(this.getDotIndices(), (item: number) => {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json<br>harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json |

## 知识库文件覆盖清单

共 **23** 个知识文件被 API 使用或数据层加载覆盖。

| 目录 | 文件名 | 被引用的 API 数量 |
|------|--------|------------------|
|  | (未在知识库中找到对应文件，可能为 ArkUI 内置 API) | {'ConfigurationConstant.ColorMode', 'setColorMode'} |
| harmonyos_api_changes | HarmonyOS_26.0.0_Beta1.json | {'List/ForEach/ListItem', 'ScrollableCommonMethod (Scroll)', 'TextAttribute.fontWeight', 'import window'} |
| harmonyos_api_changes | HarmonyOS_26.0.0_Beta2.json | {'ScrollableCommonMethod (Scroll)', 'TextAttribute.fontWeight', 'getContext().getApplicationContext', 'hilog.error', 'hilog.info', 'import hilog', 'import window'} |
| harmonyos_api_changes | HarmonyOS_5.0.1(13)_Beta3.json | {'TextAttribute.fontWeight', 'getContext().getApplicationContext'} |
| harmonyos_api_changes | HarmonyOS_5.0.2(14).json | {'ScrollableCommonMethod (Scroll)', 'TextAttribute.fontWeight', 'getContext().getApplicationContext', 'import window'} |
| harmonyos_api_changes | HarmonyOS_5.0.3(15)_Beta1.json | {'hilog.error', 'hilog.info', 'import hilog', 'import window'} |
| harmonyos_api_changes | HarmonyOS_5.0.3(15)_Beta2.json | {'import window'} |
| harmonyos_api_changes | HarmonyOS_5.0.3(15)_Release.json | {'ScrollableCommonMethod (Scroll)'} |
| harmonyos_api_changes | HarmonyOS_5.0.5(17).json | {'import window'} |
| harmonyos_api_changes | HarmonyOS_5.1.0(18).json | {'List/ForEach/ListItem', 'ScrollableCommonMethod (Scroll)', 'TextAttribute.fontWeight', 'import window'} |
| harmonyos_api_changes | HarmonyOS_5.1.1(19)_Beta1.json | {'import window'} |
| harmonyos_api_changes | HarmonyOS_6.0.0(20)_Beta1.json | {'ScrollableCommonMethod (Scroll)', 'TextAttribute.fontWeight', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.0.0(20)_Beta2.json | {'ScrollableCommonMethod (Scroll)', 'TextAttribute.fontWeight', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.0.0(20)_Beta3.json | {'TextAttribute.fontWeight', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.0.1(21)_Beta1.json | {'ScrollableCommonMethod (Scroll)', 'TextAttribute.fontWeight', 'hilog.error', 'hilog.info', 'import hilog', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.0.1(21)_Release.json | {'getContext().getApplicationContext'} |
| harmonyos_api_changes | HarmonyOS_6.0.2(22).json | {'ScrollableCommonMethod (Scroll)', 'TextAttribute.fontWeight', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.1.0(23)_Beta1.json | {'List/ForEach/ListItem', 'TextAttribute.fontWeight', 'getContext().getApplicationContext', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.1.1(24)_Beta1.json | {'getContext().getApplicationContext'} |
| harmonyos_behavior_changes | HarmonyOS_26.0.0(26)_Beta2.json | {'ScrollableCommonMethod (Scroll)'} |
| harmonyos_behavior_changes | HarmonyOS_5.0.2(14)_Beta1.json | {'List/ForEach/ListItem'} |
| harmonyos_behavior_changes | HarmonyOS_5.1.0(18)_Release.json | {'ScrollableCommonMethod (Scroll)'} |
| harmonyos_behavior_changes | HarmonyOS_6.0.0(20)_Beta1.json | {'TextAttribute.fontWeight'} |

---
*本文档由 hoscanner（HarmonyOS 升级 API 变更扫描工具）自动生成。*