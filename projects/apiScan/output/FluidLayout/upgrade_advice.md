# HarmonyOS 升级评估与行动建议（AI 辅助）

> 生成方式：确定性规则引擎（未配置 / 未启用 LLM，或 LLM 调用失败后的回退）。升级窗口 API 12 → 26。

## 一、总体结论

- 使用的系统 API：11 个
- 升级区间内变更条目：系统 API 106 条，行为变更 140 条，合计 246 条
- 高影响变更（删除 / 废弃 / 行为变更 / UX 变更）：**35 条**
- 需关注变更（函数 / 接口定义变更）：**169 条**
- 语言分解：ArkTS **246** / C++ **0**（高影响：ArkTS 35 / C++ 0）

## 二、变更按版本分布

| 版本 | 变更数 |
|------|--------|
| 5.0.2(14) | 1 |
| 5.0.3(15) | 3 |
| 5.0.4(16) | 1 |
| 5.1.0(18) | 27 |
| 5.1.1(19) | 5 |
| 6.0.0(20) | 34 |
| 6.0.1(21) | 13 |
| 6.0.2(22) | 11 |
| 26.0.0 Beta2 | 18 |
| 26.0.0(26) | 133 |

## 三、高影响变更清单（需优先处理）

| API | 版本 | 类型 | 语言 | 内容 | 来源 |
|-----|------|------|------|------|------|
| `MODE_AUTO = -1 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_AUTO = -1 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `MODE_DARK = 0 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_DARK = 0 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `MODE_LIGHT = 1 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_LIGHT = 1 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `declare const Button: ButtonInterface ×5` | 5.1.0(18) | UX视觉布局变更 | ArkTS | 按钮默认值变更为新增圆角矩形类型：unnamed.Button | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `declare const Button: ButtonInterface ×5` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 内置文本的组件文本样式优化：unnamed.Button | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Button: ButtonInterface ×5` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 表单类组件触摸热区最小高度变更：unnamed.Button | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Text: TextInterface ×10` | 26.0.0(26) | UX视觉布局变更 | ArkTS | Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质：unnamed.Text | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Toggle: ToggleInterface` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 表单类组件触摸热区最小高度变更：unnamed.Toggle | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `enum ColorMode ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | enum ColorMode | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `windowStage: window.WindowStage` | 6.0.1(21) | API跨平台权限变更 | ArkTS | windowStage: window.WindowStage; | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json` |

## 四、逐 API 建议

### `MODE_AUTO = -1`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_AUTO = -1（共 2 处调用点）

### `MODE_DARK = 0`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_DARK = 0（共 2 处调用点）

### `MODE_LIGHT = 1`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_LIGHT = 1（共 2 处调用点）

### `backgroundColor(color: Optional<ResourceColor>): ArcDotIndicator`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `backgroundColor(color: Optional<ResourceColor>): T`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `backgroundColor(value: ResourceColor): T`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius(radius: Dimension | BorderRadiuses): T`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius(value: Length | BorderRadiuses | LocalizedBorderRadiuses): T`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius: number`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius?: Length`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius?: LengthMetrics`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius?: LengthMetrics | BorderRadiuses | LocalizedBorderRadiuses`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare class CommonMethod<T>`  ℹ️ 关注  （变更 112 条 [ArkTS 112 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare const Button: ButtonInterface`  ⚠️ 高风险  （变更 15 条 [ArkTS 15 / C++ 0]，其中高影响 15 条 [ArkTS 15 / C++ 0]）

- [ArkTS] [5.1.0(18)] `UX视觉布局变更`：按钮默认值变更为新增圆角矩形类型：unnamed.Button（共 5 处调用点）
- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：内置文本的组件文本样式优化：unnamed.Button（共 5 处调用点）
- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：表单类组件触摸热区最小高度变更：unnamed.Button（共 5 处调用点）

### `declare const Text: TextInterface`  ⚠️ 高风险  （变更 10 条 [ArkTS 10 / C++ 0]，其中高影响 10 条 [ArkTS 10 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质：unnamed.Text（共 10 处调用点）

### `declare const Toggle: ToggleInterface`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：表单类组件触摸热区最小高度变更：unnamed.Toggle

### `enum ColorMode`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：enum ColorMode（共 2 处调用点）

### `enum OutputType`  ℹ️ 关注  （变更 11 条 [ArkTS 11 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum PreferStrategy`  ℹ️ 关注  （变更 11 条 [ArkTS 11 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export function getApplicationContext(): ApplicationContext`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight(value: number | FontWeight | string): T`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight(value: number | FontWeight | string): TextAttribute`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight: number`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight?: FontWeight`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight?: number | FontWeight | string`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `layout(width: number): Promise<void>`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage: LocalStorage): Promise<void>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage: LocalStorage, callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage?: LocalStorage): Promise<void>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `onChange?: (value: Date) => void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `setColorMode(colorMode: ConfigurationConstant.ColorMode): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `visibility?: Visibility`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `visibility?: number`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `windowStage: window.WindowStage`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.1(21)] `API跨平台权限变更`：windowStage: window.WindowStage;

### `windowStage?: window.WindowStage`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


---
*本文档由 hoscanner 的 UpgradeAdvisor 自动生成。*