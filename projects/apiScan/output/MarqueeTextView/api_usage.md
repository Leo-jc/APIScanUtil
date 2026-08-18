# HarmonyOS API 变更中心 — API 使用文档

生成时间：2026-08-17 17:06:56

## 概述

- **API 使用记录数**：37
- **涉及的唯一 API**：14
- **扫描的 .ets 文件数**：4
- **知识库文件总数**：53
- **API 直接匹配的知识文件**：30
- **未被代码直接引用的知识文件**：23

> **统计口径**：知识库共 53 个文件。其中 30 个被代码中的 API 直接引用（即应用代码使用了该文件中出现的 API）；其余 23 个文件未被本次扫描的源码直接命中。

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
| 19 | `import hilog` | `entry\src\main\ets\pages\Index.ets:2` | `import { hilog } from '@kit.PerformanceAnalysisKit';` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 20 | `getUIContext()` | `entry\src\main\ets\pages\Index.ets:51` | `const host: common.UIAbilityContext = this.getUIContext().getHostContext() as co` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.4(16).json<br>…等 18 个文件 |
| 21 | `hilog.info` | `entry\src\main\ets\pages\Index.ets:80` | `hilog.info(DOMAIN, TAG, '%{public}s', msg);` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json |
| 22 | `ScrollableCommonMethod (Scroll)` | `entry\src\main\ets\pages\Index.ets:187` | `Scroll() {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>…等 11 个文件 |
| 23 | `TextAttribute.fontWeight` | `entry\src\main\ets\pages\Index.ets:193` | `.fontWeight(FontWeight.Bold)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>…等 12 个文件 |
| 24 | `CommonMethod.borderRadius` | `entry\src\main\ets\pages\Index.ets:224` | `.borderRadius(8)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>…等 25 个文件 |
| 25 | `CommonMethod.borderRadius` | `entry\src\main\ets\pages\Index.ets:230` | `.borderRadius($r('app.float.card_radius'))` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>…等 25 个文件 |
| 26 | `CommonMethod.borderRadius` | `entry\src\main\ets\pages\Index.ets:301` | `.borderRadius($r('app.float.card_radius'))` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>…等 25 个文件 |
| 27 | `CommonMethod.borderRadius` | `entry\src\main\ets\pages\Index.ets:321` | `.borderRadius(8)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>…等 25 个文件 |
| 28 | `CommonMethod.borderRadius` | `entry\src\main\ets\pages\Index.ets:422` | `.borderRadius($r('app.float.card_radius'))` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>…等 25 个文件 |
| 29 | `CommonMethod.borderRadius` | `entry\src\main\ets\pages\Index.ets:463` | `.borderRadius(14)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>…等 25 个文件 |
| 30 | `ScrollableCommonMethod (Scroll)` | `entry\src\main\ets\pages\Index.ets:515` | `Scroll() {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>…等 11 个文件 |
| 31 | `List/ForEach/ListItem` | `entry\src\main\ets\pages\Index.ets:517` | `ForEach(this.logs, (item: string) => {` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json<br>harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json |
| 32 | `CommonMethod.borderRadius` | `entry\src\main\ets\pages\Index.ets:532` | `.borderRadius(8)` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>…等 25 个文件 |
| 33 | `CommonMethod.borderRadius` | `entry\src\main\ets\pages\Index.ets:542` | `.borderRadius($r('app.float.card_radius'))` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Release.json<br>harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>…等 25 个文件 |
| 34 | `import display` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:1` | `import { displaySync } from '@kit.ArkGraphics2D';` | harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.0.4(16).json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json<br>…等 8 个文件 |
| 35 | `import display` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:2` | `import { display, UIContext } from '@kit.ArkUI';` | harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.0.4(16).json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json<br>…等 8 个文件 |
| 36 | `display.getDefaultDisplaySync` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:304` | `const d: display.Display = display.getDefaultDisplaySync();` | harmonyos_api_changes/HarmonyOS_5.0.2(14).json<br>harmonyos_api_changes/HarmonyOS_5.0.4(16).json<br>harmonyos_api_changes/HarmonyOS_5.1.0(18).json<br>harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json<br>harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json<br>…等 8 个文件 |
| 37 | `getUIContext()` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:338` | `const uiCtx: UIContext = this.getUIContext();` | harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json<br>harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json<br>harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json<br>harmonyos_api_changes/HarmonyOS_5.0.4(16).json<br>…等 18 个文件 |

## 知识库文件覆盖清单

共 **31** 个知识文件被 API 使用或数据层加载覆盖。

| 目录 | 文件名 | 被引用的 API 数量 |
|------|--------|------------------|
|  | (未在知识库中找到对应文件，可能为 ArkUI 内置 API) | {'ConfigurationConstant.ColorMode', 'setColorMode'} |
| harmonyos_api_changes | HarmonyOS_26.0.0_Beta1.json | {'CommonMethod.borderRadius', 'List/ForEach/ListItem', 'ScrollableCommonMethod (Scroll)', 'TextAttribute.fontWeight', 'getUIContext()', 'import window'} |
| harmonyos_api_changes | HarmonyOS_26.0.0_Beta2.json | {'CommonMethod.borderRadius', 'ScrollableCommonMethod (Scroll)', 'TextAttribute.fontWeight', 'getContext().getApplicationContext', 'getUIContext()', 'hilog.error', 'hilog.info', 'import hilog', 'import window'} |
| harmonyos_api_changes | HarmonyOS_5.0.1(13)_Beta3.json | {'CommonMethod.borderRadius', 'TextAttribute.fontWeight', 'getContext().getApplicationContext', 'getUIContext()'} |
| harmonyos_api_changes | HarmonyOS_5.0.1(13)_Release.json | {'CommonMethod.borderRadius'} |
| harmonyos_api_changes | HarmonyOS_5.0.2(14).json | {'CommonMethod.borderRadius', 'ScrollableCommonMethod (Scroll)', 'TextAttribute.fontWeight', 'display.getDefaultDisplaySync', 'getContext().getApplicationContext', 'import display', 'import window'} |
| harmonyos_api_changes | HarmonyOS_5.0.3(15)_Beta1.json | {'hilog.error', 'hilog.info', 'import hilog', 'import window'} |
| harmonyos_api_changes | HarmonyOS_5.0.3(15)_Beta2.json | {'CommonMethod.borderRadius', 'getUIContext()', 'import window'} |
| harmonyos_api_changes | HarmonyOS_5.0.3(15)_Release.json | {'CommonMethod.borderRadius', 'ScrollableCommonMethod (Scroll)'} |
| harmonyos_api_changes | HarmonyOS_5.0.4(16).json | {'display.getDefaultDisplaySync', 'getUIContext()', 'import display'} |
| harmonyos_api_changes | HarmonyOS_5.0.5(17).json | {'CommonMethod.borderRadius', 'getUIContext()', 'import window'} |
| harmonyos_api_changes | HarmonyOS_5.1.0(18).json | {'CommonMethod.borderRadius', 'List/ForEach/ListItem', 'ScrollableCommonMethod (Scroll)', 'TextAttribute.fontWeight', 'display.getDefaultDisplaySync', 'getUIContext()', 'import display', 'import window'} |
| harmonyos_api_changes | HarmonyOS_5.1.1(19)_Beta1.json | {'CommonMethod.borderRadius', 'display.getDefaultDisplaySync', 'import display', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.0.0(20)_Beta1.json | {'CommonMethod.borderRadius', 'ScrollableCommonMethod (Scroll)', 'TextAttribute.fontWeight', 'getUIContext()', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.0.0(20)_Beta2.json | {'CommonMethod.borderRadius', 'ScrollableCommonMethod (Scroll)', 'TextAttribute.fontWeight', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.0.0(20)_Beta3.json | {'CommonMethod.borderRadius', 'TextAttribute.fontWeight', 'display.getDefaultDisplaySync', 'getUIContext()', 'import display', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.0.1(21)_Beta1.json | {'CommonMethod.borderRadius', 'ScrollableCommonMethod (Scroll)', 'TextAttribute.fontWeight', 'getUIContext()', 'hilog.error', 'hilog.info', 'import hilog', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.0.1(21)_Release.json | {'CommonMethod.borderRadius', 'display.getDefaultDisplaySync', 'getContext().getApplicationContext', 'import display'} |
| harmonyos_api_changes | HarmonyOS_6.0.2(22).json | {'CommonMethod.borderRadius', 'ScrollableCommonMethod (Scroll)', 'TextAttribute.fontWeight', 'display.getDefaultDisplaySync', 'getUIContext()', 'import display', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.1.0(23)_Beta1.json | {'CommonMethod.borderRadius', 'List/ForEach/ListItem', 'TextAttribute.fontWeight', 'display.getDefaultDisplaySync', 'getContext().getApplicationContext', 'getUIContext()', 'import display', 'import window'} |
| harmonyos_api_changes | HarmonyOS_6.1.0(23)_Beta2.json | {'getUIContext()'} |
| harmonyos_api_changes | HarmonyOS_6.1.1(24)_Beta1.json | {'CommonMethod.borderRadius', 'getContext().getApplicationContext', 'getUIContext()'} |
| harmonyos_behavior_changes | HarmonyOS_26.0.0(26)_Beta1.json | {'CommonMethod.borderRadius', 'getUIContext()'} |
| harmonyos_behavior_changes | HarmonyOS_26.0.0(26)_Beta2.json | {'ScrollableCommonMethod (Scroll)'} |
| harmonyos_behavior_changes | HarmonyOS_5.0.1(13)_Beta3.json | {'CommonMethod.borderRadius'} |
| harmonyos_behavior_changes | HarmonyOS_5.0.1(13)_Release.json | {'CommonMethod.borderRadius', 'getUIContext()'} |
| harmonyos_behavior_changes | HarmonyOS_5.0.2(14)_Beta1.json | {'CommonMethod.borderRadius', 'List/ForEach/ListItem'} |
| harmonyos_behavior_changes | HarmonyOS_5.0.3(15)_Beta2.json | {'CommonMethod.borderRadius', 'getUIContext()'} |
| harmonyos_behavior_changes | HarmonyOS_5.1.0(18)_Release.json | {'CommonMethod.borderRadius', 'ScrollableCommonMethod (Scroll)', 'getUIContext()'} |
| harmonyos_behavior_changes | HarmonyOS_6.0.0(20)_Beta1.json | {'TextAttribute.fontWeight'} |
| harmonyos_behavior_changes | HarmonyOS_6.0.0(20)_Beta2.json | {'CommonMethod.borderRadius'} |

---
*本文档由 hoscanner（HarmonyOS 升级 API 变更扫描工具）自动生成。*