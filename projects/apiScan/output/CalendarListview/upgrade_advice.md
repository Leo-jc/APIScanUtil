# HarmonyOS 升级评估与行动建议（AI 辅助）

> 生成方式：确定性规则引擎（未配置 / 未启用 LLM，或 LLM 调用失败后的回退）。升级窗口 API 12 → 26。

## 一、总体结论

- 使用的系统 API：12 个
- 升级区间内变更条目：系统 API 364 条，行为变更 232 条，合计 596 条
- 高影响变更（删除 / 废弃 / 行为变更 / UX 变更）：**80 条**
- 需关注变更（函数 / 接口定义变更）：**440 条**
- 语言分解：ArkTS **596** / C++ **0**（高影响：ArkTS 80 / C++ 0）

## 二、变更按版本分布

| 版本 | 变更数 |
|------|--------|
| 5.0.1(13) | 3 |
| 5.0.2(14) | 2 |
| 5.0.3(15) | 8 |
| 5.0.4(16) | 7 |
| 5.1.0(18) | 96 |
| 5.1.1(19) | 11 |
| 6.0.0(20) | 112 |
| 6.0.1(21) | 34 |
| 6.0.2(22) | 24 |
| 6.1.0(23) | 13 |
| 6.1.1(24) | 6 |
| 26.0.0 Beta2 | 67 |
| 26.0.0(26) | 213 |

## 三、高影响变更清单（需优先处理）

| API | 版本 | 类型 | 语言 | 内容 | 来源 |
|-----|------|------|------|------|------|
| `MODE_AUTO = -1 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_AUTO = -1 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `MODE_DARK = 0 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_DARK = 0 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `MODE_LIGHT = 1 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_LIGHT = 1 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `arc(x: number, y: number, radius: number, startAngle: number, endAngle: number, counterclockwise?: boolean): void` | 5.1.0(18) | 接口行为变更 | ArkTS | CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制：CanvasPath.arc | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `const AUTO_GAIN_TIME: string ×2` | 6.0.1(21) | API废弃版本变更 | ArkTS | const AUTO_GAIN_TIME: string; | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json` |
| `const AUTO_GAIN_TIME_ZONE: string ×2` | 6.0.1(21) | API废弃版本变更 | ArkTS | const AUTO_GAIN_TIME_ZONE: string; | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json` |
| `const DATE_FORMAT: string ×2` | 6.0.1(21) | API废弃版本变更 | ArkTS | const DATE_FORMAT: string; | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json` |
| `day?: string ×5` | 6.0.0(20) | API废弃版本变更 | ArkTS | day?: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `day?: string ×5` | 6.0.0(20) | API废弃版本变更 | ArkTS | day?: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `day?: string ×5` | 6.0.0(20) | API废弃版本变更 | ArkTS | day?: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `declare const Button: ButtonInterface` | 5.1.0(18) | UX视觉布局变更 | ArkTS | 按钮默认值变更为新增圆角矩形类型：unnamed.Button | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `declare const Button: ButtonInterface` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 内置文本的组件文本样式优化：unnamed.Button | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Button: ButtonInterface` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 表单类组件触摸热区最小高度变更：unnamed.Button | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Text: TextInterface ×22` | 26.0.0(26) | UX视觉布局变更 | ArkTS | Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质：unnamed.Text | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Toggle: ToggleInterface ×3` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 表单类组件触摸热区最小高度变更：unnamed.Toggle | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `drawRoundRect(roundRect: RoundRect): void ×2` | 6.0.0(20) | API跨平台权限变更 | ArkTS | drawRoundRect(roundRect: RoundRect): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum ColorMode ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | enum ColorMode | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `fillText(text: string, x: number, y: number, maxWidth?: number): void ×3` | 5.0.1(13) | 接口行为变更 | ArkTS | 画布组件在绘制文本时设置globalCompositeOperation、fillStyle和globalAlpha属性的效果变更：CanvasRenderer | `harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Release.json` |
| `font: string ×3` | 6.0.0(20) | 接口行为变更 | ArkTS | CanvasRenderer的font接口支持自定义字体行为变更：CanvasRenderer.font | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `initialIndex?: number` | 5.0.2(14) | 接口行为变更 | ArkTS | List组件首次创建布局时，Scroller控制器的跳转方法优先级变更为高于initialIndex的优先级：ListOptions.initialIndex | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` |
| `month?: string` | 6.0.0(20) | API废弃版本变更 | ArkTS | month?: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `month?: string` | 6.0.0(20) | API废弃版本变更 | ArkTS | month?: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `month?: string` | 6.0.0(20) | API废弃版本变更 | ArkTS | month?: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `windowStage: window.WindowStage` | 6.0.1(21) | API跨平台权限变更 | ArkTS | windowStage: window.WindowStage; | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json` |
| `year?: string ×3` | 6.0.0(20) | API废弃版本变更 | ArkTS | year?: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `year?: string ×3` | 6.0.0(20) | API废弃版本变更 | ArkTS | year?: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `year?: string ×3` | 6.0.0(20) | API废弃版本变更 | ArkTS | year?: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |

## 四、逐 API 建议

### `Error`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `MODE_AUTO = -1`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_AUTO = -1（共 2 处调用点）

### `MODE_DARK = 0`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_DARK = 0（共 2 处调用点）

### `MODE_LIGHT = 1`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_LIGHT = 1（共 2 处调用点）

### `arc(x: number, y: number, radius: number, startAngle: number, endAngle: number, counterclockwise?: boolean): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.1.0(18)] `接口行为变更`：CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制：CanvasPath.arc

### `backgroundColor(color: Optional<ResourceColor>): ArcDotIndicator`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `backgroundColor(color: Optional<ResourceColor>): T`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `backgroundColor(value: ResourceColor): T`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius(radius: Dimension | BorderRadiuses): T`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius(value: Length | BorderRadiuses | LocalizedBorderRadiuses): T`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius: number`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius?: Length`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius?: LengthMetrics`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius?: LengthMetrics | BorderRadiuses | LocalizedBorderRadiuses`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `config: ParticleColorPropertyUpdaterConfigs\[UPDATER\]`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `config: ParticleConfigs\[PARTICLE\]`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `config: ParticlePropertyUpdaterConfigs<TYPE>\[UPDATER\]`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `config: WindowAnimationConfig`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `config?: WindowAnimationConfig`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const AUTO_GAIN_TIME: string`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.1(21)] `API废弃版本变更`：const AUTO_GAIN_TIME: string;（共 2 处调用点）

### `const AUTO_GAIN_TIME_ZONE: string`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.1(21)] `API废弃版本变更`：const AUTO_GAIN_TIME_ZONE: string;（共 2 处调用点）

### `const DATE_FORMAT: string`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.1(21)] `API废弃版本变更`：const DATE_FORMAT: string;（共 2 处调用点）

### `controller: functionalInputComponentManager.FunctionalInputController`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller: loginComponentManager.LoginPanelController`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller: loginComponentManager.LoginWithHuaweiIDButtonController`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller: readerCore.ReaderComponentController`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: FunctionController`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: HdsTabsController`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: SearchController`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: ShaderEffectController`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: TabsController`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: TextClockController`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `day: number`  ℹ️ 关注  （变更 5 条 [ArkTS 5 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `day?: TextStyle`  ℹ️ 关注  （变更 5 条 [ArkTS 5 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `day?: number`  ℹ️ 关注  （变更 5 条 [ArkTS 5 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `day?: string`  ⚠️ 高风险  （变更 15 条 [ArkTS 15 / C++ 0]，其中高影响 15 条 [ArkTS 15 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：day?: string;（共 15 处调用点）

### `declare class CommonMethod<T>`  ℹ️ 关注  （变更 186 条 [ArkTS 186 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare const Button: ButtonInterface`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [5.1.0(18)] `UX视觉布局变更`：按钮默认值变更为新增圆角矩形类型：unnamed.Button
- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：内置文本的组件文本样式优化：unnamed.Button
- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：表单类组件触摸热区最小高度变更：unnamed.Button

### `declare const Text: TextInterface`  ⚠️ 高风险  （变更 22 条 [ArkTS 22 / C++ 0]，其中高影响 22 条 [ArkTS 22 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质：unnamed.Text（共 22 处调用点）

### `declare const Toggle: ToggleInterface`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：表单类组件触摸热区最小高度变更：unnamed.Toggle（共 3 处调用点）

### `drawRoundRect(roundRect: RoundRect): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：drawRoundRect(roundRect: RoundRect): void;（共 2 处调用点）

### `enum ColorMode`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：enum ColorMode（共 2 处调用点）

### `enum OutputType`  ℹ️ 关注  （变更 25 条 [ArkTS 25 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum PreferStrategy`  ℹ️ 关注  （变更 25 条 [ArkTS 25 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export function getApplicationContext(): ApplicationContext`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fillText(text: string, x: number, y: number, maxWidth?: number): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [5.0.1(13)] `接口行为变更`：画布组件在绘制文本时设置globalCompositeOperation、fillStyle和globalAlpha属性的效果变更：CanvasRenderer.fillText（共 3 处调用点）

### `first: boolean`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `font: string`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `接口行为变更`：CanvasRenderer的font接口支持自定义字体行为变更：CanvasRenderer.font（共 3 处调用点）

### `fontWeight(value: number | FontWeight | string): T`  ℹ️ 关注  （变更 5 条 [ArkTS 5 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight(value: number | FontWeight | string): TextAttribute`  ℹ️ 关注  （变更 10 条 [ArkTS 10 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute`  ℹ️ 关注  （变更 10 条 [ArkTS 10 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight: number`  ℹ️ 关注  （变更 5 条 [ArkTS 5 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight?: FontWeight`  ℹ️ 关注  （变更 5 条 [ArkTS 5 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight?: number | FontWeight | string`  ℹ️ 关注  （变更 5 条 [ArkTS 5 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function config(workoutConfig: WorkoutConfig): Promise<void>`  ℹ️ 关注  （变更 22 条 [ArkTS 22 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `initialIndex?: number`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.0.2(14)] `接口行为变更`：List组件首次创建布局时，Scroller控制器的跳转方法优先级变更为高于initialIndex的优先级：ListOptions.initialIndex

### `loadContent(path: string, callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage: LocalStorage): Promise<void>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage: LocalStorage, callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage?: LocalStorage): Promise<void>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `maxLines(line: number): T`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `month: number`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `month?: TextStyle`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `month?: number`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `month?: string`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：month?: string;（共 3 处调用点）

### `onAreaChange(event: (oldValue: Area, newValue: Area) => void): T`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `onChange?: (value: Date) => void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `range: \[ ResourceColor, ResourceColor \]`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `range: \[ TYPE, TYPE \]`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `readonly canvasWidth?: number`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `readonly config: AssetDownloadConfig`  ℹ️ 关注  （变更 22 条 [ArkTS 22 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `readonly timestamp: number`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `roundRect(x: number, y: number, w: number, h: number, radii?: number | Array<number>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `setColorMode(colorMode: ConfigurationConstant.ColorMode): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `textOverflow(value: { overflow: TextOverflow; }): TextAttribute`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `updated?: boolean`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `windowStage: window.WindowStage`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.1(21)] `API跨平台权限变更`：windowStage: window.WindowStage;

### `windowStage?: window.WindowStage`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `year: number`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `year?: TextStyle`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `year?: number`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `year?: string`  ⚠️ 高风险  （变更 9 条 [ArkTS 9 / C++ 0]，其中高影响 9 条 [ArkTS 9 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：year?: string;（共 9 处调用点）

---
*本文档由 hoscanner 的 UpgradeAdvisor 自动生成。*