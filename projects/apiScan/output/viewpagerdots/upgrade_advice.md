# HarmonyOS 升级评估与行动建议（AI 辅助）

> 生成方式：确定性规则引擎（未配置 / 未启用 LLM，或 LLM 调用失败后的回退）。升级窗口 API 12 → 26。

## 一、总体结论

- 使用的系统 API：10 个
- 升级区间内变更条目：系统 API 202 条，行为变更 201 条，合计 403 条
- 高影响变更（删除 / 废弃 / 行为变更 / UX 变更）：**56 条**
- 需关注变更（函数 / 接口定义变更）：**266 条**
- 语言分解：ArkTS **403** / C++ **0**（高影响：ArkTS 56 / C++ 0）

## 二、变更按版本分布

| 版本 | 变更数 |
|------|--------|
| 5.0.1(13) | 3 |
| 5.0.2(14) | 6 |
| 5.0.3(15) | 9 |
| 5.0.4(16) | 10 |
| 5.1.0(18) | 57 |
| 5.1.1(19) | 5 |
| 6.0.0(20) | 62 |
| 6.0.1(21) | 20 |
| 6.0.2(22) | 3 |
| 6.1.0(23) | 19 |
| 26.0.0 Beta2 | 36 |
| 26.0.0(26) | 173 |

## 三、高影响变更清单（需优先处理）

| API | 版本 | 类型 | 语言 | 内容 | 来源 |
|-----|------|------|------|------|------|
| `MODE_AUTO = -1 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_AUTO = -1 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `MODE_DARK = 0 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_DARK = 0 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `MODE_LIGHT = 1 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_LIGHT = 1 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `declare const Button: ButtonInterface ×9` | 5.1.0(18) | UX视觉布局变更 | ArkTS | 按钮默认值变更为新增圆角矩形类型：unnamed.Button | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `declare const Button: ButtonInterface ×9` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 内置文本的组件文本样式优化：unnamed.Button | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Button: ButtonInterface ×9` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 表单类组件触摸热区最小高度变更：unnamed.Button | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Text: TextInterface ×3` | 26.0.0(26) | UX视觉布局变更 | ArkTS | Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质：unnamed.Text | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `enum ColorMode ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | enum ColorMode | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `orientation: Orientation ×5` | 5.0.2(14) | 接口行为变更 | ArkTS | 屏幕Display对象rotation和orientation属性变更：display.Display.orientation | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` |
| `scale(sx: number, sy: number): void ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | scale(sx: number, sy: number): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `scale(x: number, y: number): void ×3` | 5.1.0(18) | 接口行为变更 | ArkTS | CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制：CanvasRenderer.sca | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `text?: LocationDescription ×2` | 6.0.0(20) | 接口废弃变更 | ArkTS | 位置控件功能变更：LocationButtonOptions.text | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `text?: PasteDescription ×2` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 内置文本的组件文本样式优化：PasteButtonOptions.text | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `text?: SaveDescription ×2` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 内置文本的组件文本样式优化：SaveButtonOptions.text | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `windowStage: window.WindowStage` | 6.0.1(21) | API跨平台权限变更 | ArkTS | windowStage: window.WindowStage; | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json` |

## 四、逐 API 建议

### `MODE_AUTO = -1`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_AUTO = -1（共 2 处调用点）

### `MODE_DARK = 0`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_DARK = 0（共 2 处调用点）

### `MODE_LIGHT = 1`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_LIGHT = 1（共 2 处调用点）

### `backgroundColor(color: Optional<ResourceColor>): ArcDotIndicator`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `backgroundColor(color: Optional<ResourceColor>): T`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `backgroundColor(value: ResourceColor): T`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller: functionalInputComponentManager.FunctionalInputController`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller: loginComponentManager.LoginPanelController`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller: loginComponentManager.LoginWithHuaweiIDButtonController`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller: readerCore.ReaderComponentController`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: FunctionController`  ℹ️ 关注  （变更 16 条 [ArkTS 16 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: HdsTabsController`  ℹ️ 关注  （变更 16 条 [ArkTS 16 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: SearchController`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: ShaderEffectController`  ℹ️ 关注  （变更 16 条 [ArkTS 16 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: TabsController`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: TextClockController`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare class CommonMethod<T>`  ℹ️ 关注  （变更 148 条 [ArkTS 148 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare const Button: ButtonInterface`  ⚠️ 高风险  （变更 27 条 [ArkTS 27 / C++ 0]，其中高影响 27 条 [ArkTS 27 / C++ 0]）

- [ArkTS] [5.1.0(18)] `UX视觉布局变更`：按钮默认值变更为新增圆角矩形类型：unnamed.Button（共 9 处调用点）
- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：内置文本的组件文本样式优化：unnamed.Button（共 9 处调用点）
- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：表单类组件触摸热区最小高度变更：unnamed.Button（共 9 处调用点）

### `declare const Text: TextInterface`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质：unnamed.Text（共 3 处调用点）

### `declare interface AnimateParam`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum ColorMode`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：enum ColorMode（共 2 处调用点）

### `enum OutputType`  ℹ️ 关注  （变更 11 条 [ArkTS 11 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum PreferStrategy`  ℹ️ 关注  （变更 11 条 [ArkTS 11 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export function getApplicationContext(): ApplicationContext`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fillColor(color: ResourceColor | ColorContent): ImageAttribute`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight(value: number | FontWeight | string): T`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight(value: number | FontWeight | string): TextAttribute`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight: number`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight?: FontWeight`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight?: number | FontWeight | string`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `height?: string | number`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `indicator(value: IndicatorStyle): SubTabBarStyle`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage: LocalStorage): Promise<void>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage: LocalStorage, callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage?: LocalStorage): Promise<void>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `maxLines(line: number): T`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `onChange?: (value: Date) => void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `opacity(value: number | Resource): T`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `orientation: Orientation`  ⚠️ 高风险  （变更 5 条 [ArkTS 5 / C++ 0]，其中高影响 5 条 [ArkTS 5 / C++ 0]）

- [ArkTS] [5.0.2(14)] `接口行为变更`：屏幕Display对象rotation和orientation属性变更：display.Display.orientation（共 5 处调用点）

### `readonly orientation?: Orientation`  ℹ️ 关注  （变更 5 条 [ArkTS 5 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `scale(sx: number, sy: number): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：scale(sx: number, sy: number): void;（共 3 处调用点）

### `scale(sx?: number, sy?: number): Matrix2D`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `scale(value: ScaleOptions): T`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `scale(value: { x?: number; y?: number; z?: number; centerX?: number | string; centerY?: number | string; }): T`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `scale(x: number, y: number): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [5.1.0(18)] `接口行为变更`：CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制：CanvasRenderer.scale（共 3 处调用点）

### `setColorMode(colorMode: ConfigurationConstant.ColorMode): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `text?: LocationDescription`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `接口废弃变更`：位置控件功能变更：LocationButtonOptions.text（共 2 处调用点）

### `text?: PasteDescription`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：内置文本的组件文本样式优化：PasteButtonOptions.text（共 2 处调用点）

### `text?: SaveDescription`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：内置文本的组件文本样式优化：SaveButtonOptions.text（共 2 处调用点）

### `textOverflow(value: { overflow: TextOverflow; }): TextAttribute`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `width?: string | number`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `windowStage: window.WindowStage`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.1(21)] `API跨平台权限变更`：windowStage: window.WindowStage;

### `windowStage?: window.WindowStage`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


---
*本文档由 hoscanner 的 UpgradeAdvisor 自动生成。*