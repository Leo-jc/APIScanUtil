# HarmonyOS 升级评估与行动建议（AI 辅助）

> 生成方式：确定性规则引擎（未配置 / 未启用 LLM，或 LLM 调用失败后的回退）。升级窗口 API 12 → 26。

## 一、总体结论

- 使用的系统 API：11 个
- 升级区间内变更条目：系统 API 238 条，行为变更 229 条，合计 467 条
- 高影响变更（删除 / 废弃 / 行为变更 / UX 变更）：**47 条**
- 需关注变更（函数 / 接口定义变更）：**342 条**
- 语言分解：ArkTS **467** / C++ **0**（高影响：ArkTS 47 / C++ 0）

## 二、变更按版本分布

| 版本 | 变更数 |
|------|--------|
| 5.0.2(14) | 15 |
| 5.0.3(15) | 8 |
| 5.0.4(16) | 5 |
| 5.1.0(18) | 43 |
| 5.1.1(19) | 5 |
| 6.0.0(20) | 132 |
| 6.0.1(21) | 15 |
| 6.0.2(22) | 39 |
| 6.1.0(23) | 13 |
| 6.1.1(24) | 3 |
| 26.0.0 Beta2 | 36 |
| 26.0.0(26) | 153 |

## 三、高影响变更清单（需优先处理）

| API | 版本 | 类型 | 语言 | 内容 | 来源 |
|-----|------|------|------|------|------|
| `MODE_AUTO = -1 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_AUTO = -1 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `MODE_DARK = 0 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_DARK = 0 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `MODE_LIGHT = 1 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_LIGHT = 1 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `declare const Slider: SliderInterface ×2` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 内置文本的组件文本样式优化：unnamed.Slider | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Text: TextInterface ×18` | 26.0.0(26) | UX视觉布局变更 | ArkTS | Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质：unnamed.Text | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `enum ColorMode ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | enum ColorMode | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `function create(createParameters: CreateParameters): Promise<CreateResult>` | 6.1.0(23) | 权限变更 | ArkTS | function create(createParameters: CreateParameters): Promise<CreateResult>; | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `getAlpha(): number ×2` | 6.0.0(20) | API跨平台权限变更 | ArkTS | getAlpha(): number; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `getColorFilter(): ColorFilter ×2` | 6.0.0(20) | API跨平台权限变更 | ArkTS | getColorFilter(): ColorFilter; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `getSize(): number ×4` | 6.0.0(20) | API跨平台权限变更 | ArkTS | getSize(): number; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `globalAlpha: number ×2` | 5.1.0(18) | 接口行为变更 | ArkTS | CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制：CanvasRenderer.glo | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `setAlpha(alpha: number): void ×2` | 6.0.0(20) | API跨平台权限变更 | ArkTS | setAlpha(alpha: number): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `setColorFilter(filter: ColorFilter): void ×2` | 6.0.0(20) | API跨平台权限变更 | ArkTS | setColorFilter(filter: ColorFilter): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `static create(blurRadius: number, x: number, y: number, color: common2D.Color | number): ShadowLayer` | 6.0.0(20) | API跨平台权限变更 | ArkTS | static create(blurRadius: number, x: number, y: number, color: common2D.Color \| | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `static create(blurRadius: number, x: number, y: number, color: common2D.Color): ShadowLayer` | 6.0.0(20) | API跨平台权限变更 | ArkTS | static create(blurRadius: number, x: number, y: number, color: common2D.Color):  | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `static create(options: AnimatorOptions): AnimatorResult` | 5.1.0(18) | API废弃版本变更 | ArkTS | static create(options: AnimatorOptions): AnimatorResult; | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` |
| `windowStage: window.WindowStage` | 6.0.1(21) | API跨平台权限变更 | ArkTS | windowStage: window.WindowStage; | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json` |

## 四、逐 API 建议

### `Error`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `MODE_AUTO = -1`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_AUTO = -1（共 2 处调用点）

### `MODE_DARK = 0`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_DARK = 0（共 2 处调用点）

### `MODE_LIGHT = 1`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_LIGHT = 1（共 2 处调用点）

### `backgroundColor(color: Optional<ResourceColor>): ArcDotIndicator`  ℹ️ 关注  （变更 7 条 [ArkTS 7 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `backgroundColor(color: Optional<ResourceColor>): T`  ℹ️ 关注  （变更 7 条 [ArkTS 7 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `backgroundColor(value: ResourceColor): T`  ℹ️ 关注  （变更 7 条 [ArkTS 7 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius(radius: Dimension | BorderRadiuses): T`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius(value: Length | BorderRadiuses | LocalizedBorderRadiuses): T`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius: number`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius?: Length`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius?: LengthMetrics`  ℹ️ 关注  （变更 16 条 [ArkTS 16 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius?: LengthMetrics | BorderRadiuses | LocalizedBorderRadiuses`  ℹ️ 关注  （变更 16 条 [ArkTS 16 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `build(): Paragraph`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `build(): VibratorPattern`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `build(): void`  ℹ️ 关注  （变更 30 条 [ArkTS 30 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `build(builder: WrappedBuilder<Args>, config: BuildOptions, ...args: Args): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `builder: CustomBuilder`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `builder?: CustomBuilder`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `clip(value: boolean | CircleAttribute | EllipseAttribute | PathAttribute | RectAttribute): T`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare class CommonMethod<T>`  ℹ️ 关注  （变更 133 条 [ArkTS 133 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare const Slider: SliderInterface`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：内置文本的组件文本样式优化：unnamed.Slider（共 2 处调用点）

### `declare const Text: TextInterface`  ⚠️ 高风险  （变更 18 条 [ArkTS 18 / C++ 0]，其中高影响 18 条 [ArkTS 18 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质：unnamed.Text（共 18 处调用点）

### `drawable?: DrawableDescriptor`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum ColorMode`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：enum ColorMode（共 2 处调用点）

### `enum OutputType`  ℹ️ 关注  （变更 11 条 [ArkTS 11 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum PreferStrategy`  ℹ️ 关注  （变更 11 条 [ArkTS 11 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export function getApplicationContext(): ApplicationContext`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight(value: number | FontWeight | string): T`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight(value: number | FontWeight | string): TextAttribute`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight: number`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight?: FontWeight`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight?: number | FontWeight | string`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function create(): ImageProcessor`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function create(config: FloatViewConfiguration): Promise<FloatViewController>`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function create(config: FloatingBallConfiguration): Promise<FloatingBallController>`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function create(createParameters: CreateParameters): Promise<CreateResult>`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `权限变更`：function create(createParameters: CreateParameters): Promise<CreateResult>;

### `getAlpha(): number`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：getAlpha(): number;（共 2 处调用点）

### `getColorFilter(): ColorFilter`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：getColorFilter(): ColorFilter;（共 2 处调用点）

### `getOpacity(): number | Record<number, number>`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `getSize(): number`  ⚠️ 高风险  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 4 条 [ArkTS 4 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：getSize(): number;（共 4 处调用点）

### `globalAlpha: number`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [5.1.0(18)] `接口行为变更`：CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制：CanvasRenderer.globalAlpha（共 2 处调用点）

### `loadContent(path: string, callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage: LocalStorage): Promise<void>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage: LocalStorage, callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage?: LocalStorage): Promise<void>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `maxLines(line: number): T`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `onAreaChange(event: (oldValue: Area, newValue: Area) => void): T`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `onChange?: (value: Date) => void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `setAlpha(alpha: number): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：setAlpha(alpha: number): void;（共 2 处调用点）

### `setColorFilter(filter: ColorFilter): void`  ⚠️ 高风险  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：setColorFilter(filter: ColorFilter): void;（共 2 处调用点）

### `setColorMode(colorMode: ConfigurationConstant.ColorMode): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `static create(blurRadius: number, x: number, y: number, color: common2D.Color | number): ShadowLayer`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：static create(blurRadius: number, x: number, y: number, color: common2D.Color | number): ShadowLayer;

### `static create(blurRadius: number, x: number, y: number, color: common2D.Color): ShadowLayer`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：static create(blurRadius: number, x: number, y: number, color: common2D.Color): ShadowLayer;

### `static create(encoding?: string): TextEncoder`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `static create(encoding?: string, options?: TextDecoderOptions): TextDecoder`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `static create(options: AnimatorOptions): AnimatorResult`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.1.0(18)] `API废弃版本变更`：static create(options: AnimatorOptions): AnimatorResult;

### `static create(strategy: PerfTestStrategy): PerfTest`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `static create<T>(): CustomEnvKey<T>`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `static create<T>(arrayLength: number, initialValue: T): Array<T>`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `value: string`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `value: string | Resource`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `value?: string`  ℹ️ 关注  （变更 28 条 [ArkTS 28 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `value?: string | string[]`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `windowStage: window.WindowStage`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.1(21)] `API跨平台权限变更`：windowStage: window.WindowStage;

### `windowStage?: window.WindowStage`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


---
*本文档由 hoscanner 的 UpgradeAdvisor 自动生成。*