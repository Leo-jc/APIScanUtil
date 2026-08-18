# HarmonyOS 升级评估与行动建议（AI 辅助）

> 生成方式：确定性规则引擎（未配置 / 未启用 LLM，或 LLM 调用失败后的回退）。升级窗口 API 12 → 26。

## 一、总体结论

- 使用的系统 API：14 个
- 升级区间内变更条目：系统 API 3331 条，行为变更 414 条，合计 3745 条
- 高影响变更（删除 / 废弃 / 行为变更 / UX 变更）：**159 条**
- 需关注变更（函数 / 接口定义变更）：**2852 条**
- 语言分解：ArkTS **3745** / C++ **0**（高影响：ArkTS 159 / C++ 0）

## 二、变更按版本分布

| 版本 | 变更数 |
|------|--------|
| 5.0.1(13) | 91 |
| 5.0.2(14) | 149 |
| 5.0.3(15) | 160 |
| 5.0.4(16) | 12 |
| 5.0.5(17) | 13 |
| 5.1.0(18) | 859 |
| 5.1.1(19) | 86 |
| 6.0.0(20) | 580 |
| 6.0.1(21) | 81 |
| 6.0.2(22) | 191 |
| 6.1.0(23) | 635 |
| 6.1.1(24) | 42 |
| 26.0.0 Beta2 | 489 |
| 26.0.0(26) | 357 |

## 三、高影响变更清单（需优先处理）

| API | 版本 | 类型 | 语言 | 内容 | 来源 |
|-----|------|------|------|------|------|
| `MODE_AUTO = -1 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_AUTO = -1 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `MODE_DARK = 0 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_DARK = 0 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `MODE_LIGHT = 1 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_LIGHT = 1 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `Map = 5 ×4` | 6.0.1(21) | API废弃版本变更 | ArkTS | Map = 5 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` |
| `declare const Button: ButtonInterface ×13` | 5.1.0(18) | UX视觉布局变更 | ArkTS | 按钮默认值变更为新增圆角矩形类型：unnamed.Button | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `declare const Button: ButtonInterface ×13` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 内置文本的组件文本样式优化：unnamed.Button | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Button: ButtonInterface ×13` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 表单类组件触摸热区最小高度变更：unnamed.Button | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Text: TextInterface ×23` | 26.0.0(26) | UX视觉布局变更 | ArkTS | Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质：unnamed.Text | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare type HdsSceneFinishCallback = () => void ×13` | 6.0.2(22) | API卡片权限变更 | ArkTS | declare type HdsSceneFinishCallback = () => void; | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` |
| `declare type MonitorDecorator = (value: string, ...args: string\[\]) => MethodDecorator ×13` | 6.1.0(23) | API卡片权限变更 | ArkTS | declare type MonitorDecorator = (value: string, ...args: string\[\]) => MethodDe | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `declare type WithThemeInterface = (options: WithThemeOptions) => WithThemeAttribute ×13` | 26.0.0(26) | 接口行为变更 | ArkTS | WithTheme相关组件行为变更：unnamed.WithThemeInterface | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `enum ColorMode ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | enum ColorMode | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `function back(index: number, params?: Object): void ×2` | 5.1.0(18) | API废弃版本变更 | ArkTS | function back(index: number, params?: Object): void; | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` |
| `function back(options?: RouterOptions): void ×2` | 5.1.0(18) | API废弃版本变更 | ArkTS | function back(options?: RouterOptions): void; | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` |
| `function pushUrl(options: RouterOptions): Promise<void> ×2` | 5.1.0(18) | API废弃版本变更 | ArkTS | function pushUrl(options: RouterOptions): Promise<void>; | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` |
| `function pushUrl(options: RouterOptions, callback: AsyncCallback<void>): void ×2` | 5.1.0(18) | API废弃版本变更 | ArkTS | function pushUrl(options: RouterOptions, callback: AsyncCallback<void>): void; | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` |
| `function pushUrl(options: RouterOptions, mode: RouterMode): Promise<void> ×2` | 5.1.0(18) | API废弃版本变更 | ArkTS | function pushUrl(options: RouterOptions, mode: RouterMode): Promise<void>; | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` |
| `function pushUrl(options: RouterOptions, mode: RouterMode, callback: AsyncCallback<void>): void ×2` | 5.1.0(18) | API废弃版本变更 | ArkTS | function pushUrl(options: RouterOptions, mode: RouterMode, callback: AsyncCallba | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` |
| `get(field: string): number ×6` | 6.0.0(20) | 接口行为变更 | ArkTS | 泰国、沙特阿拉伯、阿富汗和伊朗的默认历法变更：i18n.Calendar.get | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `getData(): Promise<PasteData> ×2` | 26.0.0 Beta2 | 权限变更 | ArkTS | getData(): Promise<PasteData>; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` |
| `getData(callback: AsyncCallback<PasteData>): void ×2` | 26.0.0 Beta2 | 权限变更 | ArkTS | getData(callback: AsyncCallback<PasteData>): void; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` |
| `initialIndex?: number` | 5.0.2(14) | 接口行为变更 | ArkTS | List组件首次创建布局时，Scroller控制器的跳转方法优先级变更为高于initialIndex的优先级：ListOptions.initialIndex | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` |
| `model: string ×9` | 6.0.0(20) | API废弃版本变更 | ArkTS | model: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `type LocationButtonCallback = (event: ClickEvent, result: LocationButtonOnClickResult, error?: BusinessError<void>) => void ×13` | 6.0.0(20) | 接口废弃变更 | ArkTS | 位置控件功能变更：unnamed.LocationButtonCallback | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `windowStage: window.WindowStage` | 6.0.1(21) | API跨平台权限变更 | ArkTS | windowStage: window.WindowStage; | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json` |

## 四、逐 API 建议

### `MODE_AUTO = -1`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_AUTO = -1（共 2 处调用点）

### `MODE_DARK = 0`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_DARK = 0（共 2 处调用点）

### `MODE_LIGHT = 1`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_LIGHT = 1（共 2 处调用点）

### `Map = 5`  ⚠️ 高风险  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 4 条 [ArkTS 4 / C++ 0]）

- [ArkTS] [6.0.1(21)] `API废弃版本变更`：Map = 5（共 4 处调用点）

### `backgroundColor(color: Optional<ResourceColor>): ArcDotIndicator`  ℹ️ 关注  （变更 27 条 [ArkTS 27 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `backgroundColor(color: Optional<ResourceColor>): T`  ℹ️ 关注  （变更 27 条 [ArkTS 27 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `backgroundColor(value: ResourceColor): T`  ℹ️ 关注  （变更 27 条 [ArkTS 27 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius(radius: Dimension | BorderRadiuses): T`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius(value: Length | BorderRadiuses | LocalizedBorderRadiuses): T`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius: number`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius?: Length`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius?: LengthMetrics`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius?: LengthMetrics | BorderRadiuses | LocalizedBorderRadiuses`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `cachedCount(count: number, show: boolean): GridAttribute`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `cachedCount(count: number, show: boolean): ListAttribute`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `columnsGap(value: LengthMetrics | undefined): T`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `columnsGap(value: LengthMetrics): T`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `columnsTemplate(value: string): GridAttribute`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare class CommonMethod<T>`  ℹ️ 关注  （变更 295 条 [ArkTS 295 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare const Button: ButtonInterface`  ⚠️ 高风险  （变更 39 条 [ArkTS 39 / C++ 0]，其中高影响 39 条 [ArkTS 39 / C++ 0]）

- [ArkTS] [5.1.0(18)] `UX视觉布局变更`：按钮默认值变更为新增圆角矩形类型：unnamed.Button（共 13 处调用点）
- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：内置文本的组件文本样式优化：unnamed.Button（共 13 处调用点）
- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：表单类组件触摸热区最小高度变更：unnamed.Button（共 13 处调用点）

### `declare const Text: TextInterface`  ⚠️ 高风险  （变更 23 条 [ArkTS 23 / C++ 0]，其中高影响 23 条 [ArkTS 23 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质：unnamed.Text（共 23 处调用点）

### `declare type AccessibilityActionInterceptCallback = (action: AccessibilityAction) => AccessibilityActionInterceptResult`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type AccessibilityFocusCallback = (isFocus: boolean) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type AccessibilityTransparentCallback = (event: TouchEvent) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type AnimationEndHandler = (index: number, event: SwiperAnimationEvent) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type AnimationStartHandler = (index: number, targetIndex: number, event: SwiperAnimationEvent) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ArcScrollIndexHandler = (start: number, end: number, center: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ArcSliderChangeHandler = (progress: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ArcSliderEnlargeHandler = (isEnlarged: boolean) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ArcSliderTouchHandler = (event: TouchEvent) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type AreaChangeCallback = (oldValue: Area, newValue: Area) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type BuilderCallback = (...args: Args) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type BusinessError<T> = import('../api/@ohos.base').BusinessError<T>`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type CommonModifier = import('../api/arkui/CommonModifier').CommonModifier`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ContentWillScrollCallback = (result: SwiperContentWillScrollResult) => boolean`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type CustomBuilderT<T> = (t: T) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type CustomBuilderWithId = (id: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type DataLoadParams = import('../api/@ohos.data.unifiedDataChannel').default.DataLoadParams`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type DataSyncOptions = import('../api/@ohos.data.unifiedDataChannel').default.GetDataParams`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type DidScrollCallback = (yOffset: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type DragSpringLoadingConfiguration = import('../api/@ohos.arkui.dragController').default.DragSpringLoadingConfiguration`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type DrawableDescriptor = import('../api/@ohos.arkui.drawableDescriptor').DrawableDescriptor`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type EditableTextOnChangeCallback = (value: string, previewText?: PreviewText) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type EnvDecorator = (value: SystemProperties) => PropertyDecorator`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type FinishAnimationHandler = () => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type FontVariation = import('../api/@ohos.graphics.text').default.FontVariation`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type FrameNode = import('../api/arkui/FrameNode').FrameNode`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type GestureCollectInterceptCallback = (recognizers: Array<GestureRecognizer>, touchRecognizers?: Array<TouchRecognizer>) => GestureCollectIntervention`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type GestureRecognizerJudgeBeginCallback = (event: BaseGestureEvent, current: GestureRecognizer, recognizers: Array<GestureRecognizer>) => GestureJudgeResult`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type GestureSwipeHandler = (index: number, event: SwiperAnimationEvent) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type HdsListItemCardInterface = (options: HdsListItemCardOptions) => HdsListItemCardAttribute`  ℹ️ 关注  （变更 26 条 [ArkTS 26 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type HdsSceneFinishCallback = () => void`  ⚠️ 高风险  （变更 39 条 [ArkTS 39 / C++ 0]，其中高影响 13 条 [ArkTS 13 / C++ 0]）

- [ArkTS] [6.0.2(22)] `API卡片权限变更`：declare type HdsSceneFinishCallback = () => void;（共 13 处调用点）

### `declare type HdsTabsInterface = (options?: HdsTabsOptions) => HdsTabsAttribute`  ℹ️ 关注  （变更 26 条 [ArkTS 26 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type HdsVisualComponentInterface = () => HdsVisualComponentAttribute`  ℹ️ 关注  （变更 26 条 [ArkTS 26 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ImageMatrix = import('../api/@ohos.matrix4').default.Matrix4Transit`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ImmersiveMode = import('../api/@ohos.promptAction').ImmersiveMode`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type IndexChangedHandler = (index: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type InitCallback = () => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type InputEventListener = (event: RawInputEventWrapper) => InputEventInterceptResult`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type InputMethodExtraConfig = import('../api/@ohos.inputMethod.ExtraConfig').InputMethodExtraConfig`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type InterceptionCallback = (from: NavPathInfo | NavBar, to: NavPathInfo | NavBar, pathStack: NavPathStack, operation: NavigationOperation, isAnimated: boolean) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type LevelMode = import('../api/@ohos.promptAction').LevelMode`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type LevelOrder = import('../api/@ohos.promptAction').LevelOrder`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type Material = import('../api/@ohos.arkui.uiMaterial').default.Material`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type Matrix4Transit = import('../api/@ohos.matrix4').default.Matrix4Transit`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type MenuCallback = (start: number, end: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type MonitorDecorator = (value: string, ...args: string\[\]) => MethodDecorator`  ⚠️ 高风险  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 13 条 [ArkTS 13 / C++ 0]）

- [ArkTS] [6.1.0(23)] `API卡片权限变更`：declare type MonitorDecorator = (value: string, ...args: string\[\]) => MethodDecorator;（共 13 处调用点）

### `declare type NavDestinationBuildFunction = (name: string, param?: object) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type NavDestinationTransitionDelegate = (operation: NavigationOperation, isEnter: boolean) => Array<NavDestinationTransition> | undefined`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type NodeRenderStateChangeCallback = (state: NodeRenderState, node?: FrameNode) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnActionCallback = () => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnActionTextClickCallback = () => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnAlphabetIndexerPopupSelectCallback = (index: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnAlphabetIndexerRequestPopupDataCallback = (index: number) => Array<string>`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnAlphabetIndexerSelectCallback = (index: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnChangeCallback = (value: boolean) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnChangedCallback = (callbackParam: CallbackParamV2) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnCheckboxChangeCallback = (value: boolean) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnCheckboxGroupChangeCallback = (value: CheckboxGroupResult) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnContainerCallback = () => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnContentScrollCallback = (totalOffsetX: number, totalOffsetY: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnDidStopDraggingCallback = (willFling: boolean) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnDragEventCallback = (event: DragEvent, extraParams?: string) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnFoldStatusChangeCallback = (event: OnFoldStatusChangeInfo) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnGetPreviewBadgeCallback = () => boolean | number`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnGridScrollIndexCallback = (first: number, last: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnHomeShowOnTopCallback = (name: string) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnHoverCallback = (status: boolean, event: HoverEvent) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnHoverStatusChangeCallback = (param: HoverEventParam) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnItemDragStartCallback = (event: ItemDragInfo, itemIndex: number) => CustomBuilder`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnListScrollIndexCallback = (start: number, end: number, center: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnNativeLoadCallback = (event?: object) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnNavigationModeChangeCallback = (mode: NavigationMode) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnNeedSoftkeyboardCallback = () => boolean`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnPasteCallback = (content: string, event: PasteEvent) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnPasteCallback = (pasteValue: string, event: PasteEvent) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnRadioChangeCallback = (isChecked: boolean) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnRatingChangeCallback = (rating: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnScrollEdgeCallback = (side: Edge) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnScrollFrameBeginCallback = (offset: number, state: ScrollState) => OnScrollFrameBeginHandlerResult`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSelectCallback = (index: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSelectCallback = (index: number, selectStr: string) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSelectCallback = (index: number, selectValue: string) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnStateChangeCallback = (state: SwipeActionState) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSubmitCallback = (enterKey: EnterKeyType, event: SubmitEvent) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSwiperAnimationEndCallback = (index: number, extraInfo: SwiperAnimationEvent) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSwiperAnimationStartCallback = (index: number, targetIndex: number, extraInfo: SwiperAnimationEvent) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSwiperGestureSwipeCallback = (index: number, extraInfo: SwiperAnimationEvent) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTabsAnimationEndCallback = (index: number, extraInfo: TabsAnimationEvent) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTabsAnimationStartCallback = (index: number, targetIndex: number, extraInfo: TabsAnimationEvent) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTabsContentDidScrollCallback = (selectedIndex: number, index: number, position: number, mainAxisLength: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTabsContentWillChangeCallback = (currentIndex: number, comingIndex: number) => boolean`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTabsGestureSwipeCallback = (index: number, extraInfo: TabsAnimationEvent) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTextPickerChangeCallback = (selectItem: string | string\[\], index: number | number\[\]) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTextSelectionChangeCallback = (selectionStart: number, selectionEnd: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTimePickerChangeCallback = (result: TimePickerResult) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTipClickCallback = () => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnUIPickerComponentCallback = (selectedIndex: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnVisibleIndexesChangeCallback = (start: number, end: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnWaterFlowScrollIndexCallback = (first: number, last: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnWillStopDraggingCallback = (velocity: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type Orientation = import('../api/@ohos.window').default.Orientation`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type PageTransitionCallback = (type: RouteType, progress: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type PanListenerCallback = (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type Paragraph = import('../api/@ohos.graphics.text').default.Paragraph`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type PopupStateChangeCallback = (event: PopupStateChangeParam) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type PromptActionCommonState = import('../api/@ohos.promptAction').promptAction.CommonState`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type PromptActionDialogController = import('../api/@ohos.promptAction').promptAction.DialogController`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type RectHeightStyle = import('../api/@ohos.graphics.text').default.RectHeightStyle`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type RectWidthStyle = import('../api/@ohos.graphics.text').default.RectWidthStyle`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type RepeatInterface = <T>(arr: RepeatArray<T>) => RepeatAttribute<T>`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type RequestDownloadInfo = import('../api/@ohos.request.cacheDownload').default.DownloadInfo`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type RestoreStateCallback = (savedState: Record<string, Object> | null) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ReuseIdCallback = () => string`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type SaveStateCallback = () => Record<string, Object> | null`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ScaleCallback = (scale: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ScrollOnDidZoomCallback = (scale: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type SearchSubmitCallback = (searchContent: string, event?: SubmitEvent) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ShouldRecognizerParallelWithCallback = (current: GestureRecognizer, others: Array<GestureRecognizer>) => GestureRecognizer`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type SpringLoadingContext = import('../api/@ohos.arkui.dragController').default.SpringLoadingContext`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type SwipeActionCallback = () => void`  ℹ️ 关注  （变更 26 条 [ArkTS 26 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type SystemUiMaterial = import('../api/@ohos.arkui.uiMaterial').default.Material`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TabsCustomContentTransitionCallback = (from: number, to: number) => TabContentAnimatedTransition | undefined`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TaskCallback = () => T`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TextAreaSubmitCallback = (enterKeyType: EnterKeyType, event?: SubmitEvent) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TextBox = import('../api/@ohos.graphics.text').default.TextBox`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TextPickerEnterSelectedAreaCallback = (value: string | string\[\], index: number | number\[\]) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TextPickerScrollStopCallback = (value: string | string\[\], index: number | number\[\]) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TouchTestDoneCallback = (event: BaseGestureEvent, recognizers: Array<GestureRecognizer>) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type UIMaterial = import('../api/@ohos.arkui.uiMaterial').uiMaterial`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type UIStatesChangeHandler = (node: FrameNode, currentUIStates: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type Vector2T<T> = import('../api/arkui/Graphics').Vector2T<T>`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type VisibleAreaChangeCallback = (isVisible: boolean, currentRatio: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type WindowEventListener = (windowId: number, event: window.WindowEventType) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type WithThemeInterface = (options: WithThemeOptions) => WithThemeAttribute`  ⚠️ 高风险  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 13 条 [ArkTS 13 / C++ 0]）

- [ArkTS] [26.0.0(26)] `接口行为变更`：WithTheme相关组件行为变更：unnamed.WithThemeInterface（共 13 处调用点）

### `enum ColorMode`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：enum ColorMode（共 2 处调用点）

### `enum OutputType`  ℹ️ 关注  （变更 11 条 [ArkTS 11 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum PreferStrategy`  ℹ️ 关注  （变更 11 条 [ArkTS 11 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export function getApplicationContext(): ApplicationContext`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ArrayListComparatorFn<T> = (firstValue: T, secondValue: T) => number`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ClickCallback = () => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ClientConnectionCloseCallback = (clientConnection: WebSocketConnection, closeReason: CloseResult) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ContentCoding = 'aes128gcm' | 'br' | 'compress' | 'deflate' | 'exi' | 'gzip' | 'pack200-gzip' | 'x-compress' | 'x-gzip' | 'zstd' | (string \& NonNullable<unknown>)`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ContentType = 'application/json' | 'text/plain' | 'multipart/form-data' | 'application/octet-stream' | 'application/x-www-form-urlencoded' | (string \& NonNullable<unknown>)`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type CurrentAlbumDeletedCallback = () => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type DynamicDnsRule = (host: string, port: number) => IpAddress\[\]`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type DynamicExclusionRule = (url: URLOrString) => boolean`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type EmptyAreaClickCallback = () => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ErrorCallback = (pickerError: PickerError) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ErrorHandler = (errObject: Error) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ExceedMaxSelectedCallback = (exceedMaxCountType: MaxCountType) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type FreezeObserver = () => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type GSTileRequestCallback = (tiles: GSTile\[\]) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type GetDataCallback = (maxSize: number) => ArrayBuffer | Promise<ArrayBuffer>`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type GlobalObserver = (reason: GlobalError) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type HttpMethod = 'GET' | 'POST' | 'HEAD' | 'PUT' | 'DELETE' | 'PATCH' | 'OPTIONS' | (string \& NonNullable<unknown>)`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type HttpVersionSelectCallback = (url: URL) => HttpVersion`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type IncomingDataCallback = (incomingData: ArrayBuffer) => void | Promise<void>`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ItemClickedNotifyCallback = (itemInfo: ItemInfo, clickType: ClickType) => void`  ℹ️ 关注  （变更 39 条 [ArkTS 39 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ItemsDeletedCallback = (baseItemInfos: Array<BaseItemInfo>) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ListComparatorFn<T> = (firstValue: T, secondValue: T) => number`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type MovingPhotoBadgeStateChangedCallback = (uri: string, state: photoAccessHelper.MovingPhotoBadgeStateType) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnAuthenticationChallenge = (info: AuthenticationChallengeInfo\[\], response: Response, challengeCount: number) => ServerAuthentication | null`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnCanceled = () => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnCanceled = (request?: Request) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnClosed = () => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnCounterV2HoverCallback = (isHover: boolean) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDataCallback = (method: AgentOperation, context: RequestContext) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDataEnd = () => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDataEnd = (request?: Request) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDataReceive = (incomingData: ArrayBuffer) => number | void | Promise<void>`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDataReceive = (incomingData: ArrayBuffer, request?: Request) => number | void | Promise<void>`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDateCounterV2ChangeCallback = (date: CounterV2DateData) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDownloadProgress = (totalSize: number, transferredSize: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDownloadProgress = (totalSize: number, transferredSize: number, request?: Request) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnHeaderReceive = (headers: ResponseHeaders) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnHeaderReceive = (headers: ResponseHeaders, request?: Request) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnInlineCounterV2Change = (value: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnMenuItemClickWithTextCallback = (menuItem: TextMenuItem, value: string) => boolean`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnPickerStateCallback = (state: AVCastPickerState) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnRequestFailureFn = (name: string, failureCode: AbilityStartFailureCode, failureMessage: string) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnRequestSuccessFn = (name: string) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnSelectedIndexChange = (selectedIndex: number) => void`  ℹ️ 关注  （变更 26 条 [ArkTS 26 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnSelectedIndexesChange = (selectedIndexes: number\[\]) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnStatusCodeReceive = (statusCode: number, request?: Request) => void`  ℹ️ 关注  （变更 26 条 [ArkTS 26 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnTimeInfo = (timeInfo: TimeInfo) => void`  ℹ️ 关注  （变更 26 条 [ArkTS 26 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnTimeInfo = (timeInfo: TimeInfo, request?: Request) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnUploadProgress = (totalSize: number, transferredSize: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnUploadProgress = (totalSize: number, transferredSize: number, request?: Request) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type PhotoBrowserChangeStartCallback = (targetPhotoInfo: BaseItemInfo) => void`  ℹ️ 关注  （变更 39 条 [ArkTS 39 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type PhotoBrowserZoomCallback = (scale: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type PinchGridSwitchedCallback = (gridLevel: photoAccessHelper.GridLevel) => void`  ℹ️ 关注  （变更 39 条 [ArkTS 39 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ProxySender = (data: string) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type RecentPhotoCheckInfoCallback = (recentPhotoExists: boolean, info: RecentPhotoInfo) => void`  ℹ️ 关注  （变更 26 条 [ArkTS 26 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ResourceUsageObserver = (resourceType: ResourceType, resourceSize: number, detailInfo?: Record<string, number>) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ResponseHeaders = { \[k: string\]: string | string\[\] | undefined; 'accept-ranges'?: 'none' | 'bytes' | (string \& NonNullable<unknown>); 'allow'?: HttpMethod | HttpMethod\[\]; 'cache-control'?: string | string\[\]; 'content-encoding'?: ContentCoding; 'content-range'?: string; 'content-type'?: ContentType; 'date'?: string; 'etag'?: string; 'expires'?: string; 'location'?: string; 'retry-after'?: string; 'set-cookie'?: string | string\[\]; 'server'?: string; 'www-authenticate'?: string | string\[\]; }`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ResponseValidationCallback = (response: Response) => boolean | Promise<boolean>`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ScrollStopAtEndCallback = () => void`  ℹ️ 关注  （变更 39 条 [ArkTS 39 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ScrollStopAtStartCallback = () => void`  ℹ️ 关注  （变更 39 条 [ArkTS 39 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type SearchKeyCallback = (results: SearchResultData\[\]) => boolean`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type SetPreviewTextCallback = (text: string, range: Range) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type SizeChangeCallback = (size: window.Size, keyboardArea?: KeyboardArea) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type SubHeaderV2OperationItemAction = () => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type SubHeaderV2SelectOnSelect = (selectedIndex: number, selectedContent?: string) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type SubHeaderV2TitleBuilder = () => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type TargetFileCallback = (request: Request, suggestedPath: Path) => TargetFile | Promise<TargetFile>`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ToolBarV2ItemAction = (index: number) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type UpReadState = (readState: ReadStateCode) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ValidationCallback = (context: ValidationContext) => boolean | Promise<boolean>`  ℹ️ 关注  （变更 26 条 [ArkTS 26 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type customInfoWindowCallback = (markerDelegate: map.MarkerDelegate) => void`  ℹ️ 关注  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type videoPlayStateChangedCallback = (state: VideoPlayerState) => void`  ℹ️ 关注  （变更 26 条 [ArkTS 26 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight(value: number | FontWeight | string): T`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight(value: number | FontWeight | string): TextAttribute`  ℹ️ 关注  （变更 24 条 [ArkTS 24 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute`  ℹ️ 关注  （变更 24 条 [ArkTS 24 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight: number`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight?: FontWeight`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight?: number | FontWeight | string`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function back(index: number, params?: Object): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [5.1.0(18)] `API废弃版本变更`：function back(index: number, params?: Object): void;（共 2 处调用点）

### `function back(options?: RouterOptions): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [5.1.0(18)] `API废弃版本变更`：function back(options?: RouterOptions): void;（共 2 处调用点）

### `function pushUrl(options: RouterOptions): Promise<void>`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [5.1.0(18)] `API废弃版本变更`：function pushUrl(options: RouterOptions): Promise<void>;（共 2 处调用点）

### `function pushUrl(options: RouterOptions, callback: AsyncCallback<void>): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [5.1.0(18)] `API废弃版本变更`：function pushUrl(options: RouterOptions, callback: AsyncCallback<void>): void;（共 2 处调用点）

### `function pushUrl(options: RouterOptions, mode: RouterMode): Promise<void>`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [5.1.0(18)] `API废弃版本变更`：function pushUrl(options: RouterOptions, mode: RouterMode): Promise<void>;（共 2 处调用点）

### `function pushUrl(options: RouterOptions, mode: RouterMode, callback: AsyncCallback<void>): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [5.1.0(18)] `API废弃版本变更`：function pushUrl(options: RouterOptions, mode: RouterMode, callback: AsyncCallback<void>): void;（共 2 处调用点）

### `get(field: string): number`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 6 条 [ArkTS 6 / C++ 0]）

- [ArkTS] [6.0.0(20)] `接口行为变更`：泰国、沙特阿拉伯、阿富汗和伊朗的默认历法变更：i18n.Calendar.get（共 6 处调用点）

### `getData(): ArrayBuffer`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `getData(): Promise<PasteData>`  ⚠️ 高风险  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：getData(): Promise<PasteData>;（共 2 处调用点）

### `getData(): mapCommon.WeightedLatLng\[\]`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `getData(callback: AsyncCallback<PasteData>): void`  ⚠️ 高风险  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：getData(callback: AsyncCallback<PasteData>): void;（共 2 处调用点）

### `getData(type: string): Promise<ValueType>`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `getModel(): string`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `initialIndex?: number`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.0.2(14)] `接口行为变更`：List组件首次创建布局时，Scroller控制器的跳转方法优先级变更为高于initialIndex的优先级：ListOptions.initialIndex

### `loadContent(path: string, callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage: LocalStorage): Promise<void>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage: LocalStorage, callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage?: LocalStorage): Promise<void>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `maxLines(line: number): T`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `model: string`  ⚠️ 高风险  （变更 18 条 [ArkTS 18 / C++ 0]，其中高影响 9 条 [ArkTS 9 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：model: string;（共 9 处调用点）

### `model?: string`  ℹ️ 关注  （变更 9 条 [ArkTS 9 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `opacity(value: number | Resource): T`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `readonly model?: string`  ℹ️ 关注  （变更 44 条 [ArkTS 44 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `readonly totalCount?: number`  ℹ️ 关注  （变更 10 条 [ArkTS 10 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `rowsGap(value: LengthMetrics | undefined): T`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `rowsGap(value: LengthMetrics): T`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `setColorMode(colorMode: ConfigurationConstant.ColorMode): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `setModel(model: string): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `space(space: LengthMetrics): DotIndicator`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `textOverflow(value: { overflow: TextOverflow; }): TextAttribute`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `totalCount: number`  ℹ️ 关注  （变更 20 条 [ArkTS 20 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `type LocationButtonCallback = (event: ClickEvent, result: LocationButtonOnClickResult, error?: BusinessError<void>) => void`  ⚠️ 高风险  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 13 条 [ArkTS 13 / C++ 0]）

- [ArkTS] [6.0.0(20)] `接口废弃变更`：位置控件功能变更：unnamed.LocationButtonCallback（共 13 处调用点）

### `windowStage: window.WindowStage`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.1(21)] `API跨平台权限变更`：windowStage: window.WindowStage;

### `windowStage?: window.WindowStage`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


---
*本文档由 hoscanner 的 UpgradeAdvisor 自动生成。*