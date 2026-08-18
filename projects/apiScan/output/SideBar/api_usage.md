# HarmonyOS API 变更中心 — API 使用文档

生成时间：2026-08-17 17:07:02

## 概述

- **API 使用记录数**：34
- **涉及的唯一 API**：14
- **扫描的 .ets 文件数**：5
- **知识库文件总数**：53
- **API 直接匹配的知识文件**：27
- **未被代码直接引用的知识文件**：26

> **统计口径**：知识库共 53 个文件。其中 27 个被代码中的 API 直接引用（即应用代码使用了该文件中出现的 API）；其余 26 个文件未被本次扫描的源码直接命中。

## API 使用详情

| # | API | 代码位置 | 片段 | 来源知识文件 |
|---|-----|----------|------|-------------|
| 1 | `CommonMethod.borderRadius` | `entry\src\main\ets\components\HintBubble.ets:39` | `.borderRadius({ topLeft: 8, topRight: 0, bottomRight: 0, bottomLeft: 8 })` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>…等 25 个文件 |
| 2 | `ConfigurationConstant.ColorMode` | `entry\src\main\ets\entryability\EntryAbility.ets:1` | `import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.Ab` | (未在知识库中找到对应文件，可能为 ArkUI 内置 API) |
| 3 | `import hilog` | `entry\src\main\ets\entryability\EntryAbility.ets:2` | `import { hilog } from '@kit.PerformanceAnalysisKit';` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 4 | `import window` | `entry\src\main\ets\entryability\EntryAbility.ets:3` | `import { window } from '@kit.ArkUI';` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json<br>…等 14 个文件 |
| 5 | `getContext().getApplicationContext` | `entry\src\main\ets\entryability\EntryAbility.ets:10` | `this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMod` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json<br>harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json<br>…等 6 个文件 |
| 6 | `setColorMode` | `entry\src\main\ets\entryability\EntryAbility.ets:10` | `this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMod` | (未在知识库中找到对应文件，可能为 ArkUI 内置 API) |
| 7 | `ConfigurationConstant.ColorMode` | `entry\src\main\ets\entryability\EntryAbility.ets:10` | `this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMod` | (未在知识库中找到对应文件，可能为 ArkUI 内置 API) |
| 8 | `hilog.error` | `entry\src\main\ets\entryability\EntryAbility.ets:12` | `hilog.error(DOMAIN, 'testTag', 'Failed to set colorMode. Cause: %{public}s', JSO` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 9 | `hilog.info` | `entry\src\main\ets\entryability\EntryAbility.ets:14` | `hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 10 | `hilog.info` | `entry\src\main\ets\entryability\EntryAbility.ets:18` | `hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 11 | `hilog.info` | `entry\src\main\ets\entryability\EntryAbility.ets:23` | `hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 12 | `hilog.error` | `entry\src\main\ets\entryability\EntryAbility.ets:27` | `hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', ` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 13 | `hilog.info` | `entry\src\main\ets\entryability\EntryAbility.ets:30` | `hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 14 | `hilog.info` | `entry\src\main\ets\entryability\EntryAbility.ets:36` | `hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 15 | `hilog.info` | `entry\src\main\ets\entryability\EntryAbility.ets:41` | `hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground');` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 16 | `hilog.info` | `entry\src\main\ets\entryability\EntryAbility.ets:46` | `hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 17 | `import hilog` | `entry\src\main\ets\entrybackupability\EntryBackupAbility.ets:1` | `import { hilog } from '@kit.PerformanceAnalysisKit';` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 18 | `hilog.info` | `entry\src\main\ets\entrybackupability\EntryBackupAbility.ets:8` | `hilog.info(DOMAIN, 'testTag', 'onBackup ok');` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 19 | `hilog.info` | `entry\src\main\ets\entrybackupability\EntryBackupAbility.ets:13` | `hilog.info(DOMAIN, 'testTag', 'onRestore ok %{public}s', JSON.stringify(bundleVe` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 20 | `import router` | `entry\src\main\ets\pages\Index.ets:1` | `import { router } from '@kit.ArkUI';` | harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Beta3.json |
| 21 | `Scroller.scrollToIndex (backToTop)` | `entry\src\main\ets\pages\Index.ets:53` | `this.scroller.scrollToIndex(index, true, ScrollAlign.START);` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>…等 12 个文件 |
| 22 | `router.pushUrl` | `entry\src\main\ets\pages\Index.ets:91` | `router.pushUrl({ url: 'pages/Settings' });` | harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Beta3.json |
| 23 | `List/ForEach/ListItem` | `entry\src\main\ets\pages\Index.ets:102` | `List({ scroller: this.scroller }) {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json<br>harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json |
| 24 | `List/ForEach/ListItem` | `entry\src\main\ets\pages\Index.ets:103` | `ForEach(this.listData, (item: FlatItem, index: number) => {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json<br>harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json |
| 25 | `List/ForEach/ListItem` | `entry\src\main\ets\pages\Index.ets:104` | `ListItem() {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json<br>harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json |
| 26 | `import router` | `entry\src\main\ets\pages\Settings.ets:1` | `import { router } from '@kit.ArkUI';` | harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Beta3.json |
| 27 | `router.back` | `entry\src\main\ets\pages\Settings.ets:37` | `router.back();` | harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Beta3.json |
| 28 | `ScrollableCommonMethod (Scroll)` | `entry\src\main\ets\pages\Settings.ets:51` | `Scroll() {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>…等 11 个文件 |
| 29 | `List/ForEach/ListItem` | `entry\src\main\ets\pages\Settings.ets:60` | `ForEach(TEXT_COLOR_OPTIONS, (color: string) => {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json<br>harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json |
| 30 | `CommonMethod.borderRadius` | `entry\src\main\ets\pages\Settings.ets:69` | `.borderRadius(18)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>…等 25 个文件 |
| 31 | `List/ForEach/ListItem` | `entry\src\main\ets\pages\Settings.ets:90` | `ForEach(PRESSED_TEXT_COLOR_OPTIONS, (color: string) => {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json<br>harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json |
| 32 | `CommonMethod.borderRadius` | `entry\src\main\ets\pages\Settings.ets:99` | `.borderRadius(18)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>…等 25 个文件 |
| 33 | `List/ForEach/ListItem` | `entry\src\main\ets\pages\Settings.ets:120` | `ForEach(PRESSED_BG_COLOR_OPTIONS, (color: string) => {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json<br>harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json |
| 34 | `CommonMethod.borderRadius` | `entry\src\main\ets\pages\Settings.ets:129` | `.borderRadius(18)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>…等 25 个文件 |

## 知识库文件覆盖清单

共 **28** 个知识文件被 API 使用或数据层加载覆盖。

| 目录 | 文件名 | 被引用的 API 数量 |
|------|--------|------------------|
|  | (未在知识库中找到对应文件，可能为 ArkUI 内置 API) | {'ConfigurationConstant.ColorMode', 'setColorMode'} |
| harmonyos_api_changes | HarmonyOS_26.0.0_Beta1.json | {'CommonMethod.borderRadius', 'List/ForEach/ListItem', 'ScrollableCommonMethod (Scroll)', 'Scroller.scrollToIndex (backToTop)', 'import window'} |
| harmonyos_api_changes | HarmonyOS_26.0.0_Beta2.json | {'CommonMethod.borderRadius', 'ScrollableCommonMethod (Scroll)', 'Scroller.scrollToIndex (backToTop)', 'getContext().getApplicationContext', 'hilog.error', 'hilog.info', 'import hilog', 'import window'} |
| harmonyos_api_changes | HarmonyOS_5.0.1(13)_Beta3.json | {'CommonMethod.borderRadius', 'getContext().getApplicationContext'} |
| harmonyos_api_changes | HarmonyOS_5.0.1(13)_Release.json | {'CommonMethod.borderRadius'} |
| harmonyos_api_changes | HarmonyOS_5.0.2(14).json | {'CommonMethod.borderRadius', 'ScrollableCommonMethod (Scroll)', 'Scroller.scrollToIndex (backToTop)', 'getContext().getApplicationContext', 'import window'} |
| harmonyos_api_changes | HarmonyOS_5.0.3(15)_Beta1.json | {'hilog.error', 'hilog.info', 'import hilog', 'import window'} |
| harmonyos_api_changes | HarmonyOS_5.0.3(15)_Beta2.json | {'CommonMethod.borderRadius', 'import window'} |
| harmonyos_api_changes | HarmonyOS_5.0.3(15)_Release.json | {'CommonMethod.borderRadius', 'ScrollableCommonMethod (Scroll)', 'Scroller.scrollToIndex (backToTop)'} |
| harmonyos_api_changes | HarmonyOS_5.0.5(17).json | {'CommonMethod.borderRadius', 'import window'} |
| harmonyos_api_changes | HarmonyOS_5.1.0(18).json | {'CommonMethod.borderRadius', 'List/ForEach/ListItem', 'ScrollableCommonMethod (Scroll)', 'Scroller.scrollToIndex (backToTop)', 'import router', 'import window', 'router.back', 'router.pushUrl'} |
| harmonyos_api_changes | HarmonyOS_5.1.1(19)_Beta1.json | {'CommonMethod.borderRadius', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.0.0(20)_Beta1.json | {'CommonMethod.borderRadius', 'ScrollableCommonMethod (Scroll)', 'Scroller.scrollToIndex (backToTop)', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.0.0(20)_Beta2.json | {'CommonMethod.borderRadius', 'ScrollableCommonMethod (Scroll)', 'Scroller.scrollToIndex (backToTop)', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.0.0(20)_Beta3.json | {'CommonMethod.borderRadius', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.0.1(21)_Beta1.json | {'CommonMethod.borderRadius', 'ScrollableCommonMethod (Scroll)', 'Scroller.scrollToIndex (backToTop)', 'hilog.error', 'hilog.info', 'import hilog', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.0.1(21)_Release.json | {'CommonMethod.borderRadius', 'getContext().getApplicationContext'} |
| harmonyos_api_changes | HarmonyOS_6.0.2(22).json | {'CommonMethod.borderRadius', 'ScrollableCommonMethod (Scroll)', 'Scroller.scrollToIndex (backToTop)', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.1.0(23)_Beta1.json | {'CommonMethod.borderRadius', 'List/ForEach/ListItem', 'Scroller.scrollToIndex (backToTop)', 'getContext().getApplicationContext', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.1.1(24)_Beta1.json | {'CommonMethod.borderRadius', 'getContext().getApplicationContext'} |
| harmonyos_behavior_changes | HarmonyOS_26.0.0(26)_Beta1.json | {'CommonMethod.borderRadius'} |
| harmonyos_behavior_changes | HarmonyOS_26.0.0(26)_Beta2.json | {'ScrollableCommonMethod (Scroll)', 'Scroller.scrollToIndex (backToTop)'} |
| harmonyos_behavior_changes | HarmonyOS_5.0.1(13)_Beta3.json | {'CommonMethod.borderRadius', 'import router', 'router.back', 'router.pushUrl'} |
| harmonyos_behavior_changes | HarmonyOS_5.0.1(13)_Release.json | {'CommonMethod.borderRadius'} |
| harmonyos_behavior_changes | HarmonyOS_5.0.2(14)_Beta1.json | {'CommonMethod.borderRadius', 'List/ForEach/ListItem'} |
| harmonyos_behavior_changes | HarmonyOS_5.0.3(15)_Beta2.json | {'CommonMethod.borderRadius'} |
| harmonyos_behavior_changes | HarmonyOS_5.1.0(18)_Release.json | {'CommonMethod.borderRadius', 'ScrollableCommonMethod (Scroll)', 'Scroller.scrollToIndex (backToTop)'} |
| harmonyos_behavior_changes | HarmonyOS_6.0.0(20)_Beta2.json | {'CommonMethod.borderRadius'} |

---
*本文档由 hoscanner（HarmonyOS 升级 API 变更扫描工具）自动生成。*