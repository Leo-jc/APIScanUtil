# HarmonyOS 升级评估与行动建议（AI 辅助）

> 生成方式：确定性规则引擎（未配置 / 未启用 LLM，或 LLM 调用失败后的回退）。升级窗口 API 12 → 26。

## 一、总体结论

- 使用的系统 API：14 个
- 升级区间内变更条目：系统 API 2519 条，行为变更 332 条，合计 2851 条
- 高影响变更（删除 / 废弃 / 行为变更 / UX 变更）：**225 条**
- 需关注变更（函数 / 接口定义变更）：**1860 条**
- 语言分解：ArkTS **2851** / C++ **0**（高影响：ArkTS 225 / C++ 0）

## 二、变更按版本分布

| 版本 | 变更数 |
|------|--------|
| 5.0.1(13) | 91 |
| 5.0.2(14) | 101 |
| 5.0.3(15) | 114 |
| 5.0.4(16) | 15 |
| 5.0.5(17) | 12 |
| 5.1.0(18) | 540 |
| 5.1.1(19) | 194 |
| 6.0.0(20) | 492 |
| 6.0.1(21) | 71 |
| 6.0.2(22) | 137 |
| 6.1.0(23) | 397 |
| 6.1.1(24) | 49 |
| 26.0.0 Beta2 | 341 |
| 26.0.0(26) | 297 |

## 三、高影响变更清单（需优先处理）

| API | 版本 | 类型 | 语言 | 内容 | 来源 |
|-----|------|------|------|------|------|
| `MODE_AUTO = -1 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_AUTO = -1 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `MODE_DARK = 0 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_DARK = 0 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `MODE_LIGHT = 1 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_LIGHT = 1 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `const ANIMATOR_DURATION_SCALE: string` | 6.0.1(21) | API废弃版本变更 | ArkTS | const ANIMATOR_DURATION_SCALE: string; | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json` |
| `const DEFAULT_SCREEN_ROTATION: string` | 6.0.1(21) | API废弃版本变更 | ArkTS | const DEFAULT_SCREEN_ROTATION: string; | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json` |
| `const DISPLAY_INVERSION_STATUS: string` | 6.0.1(21) | API废弃版本变更 | ArkTS | const DISPLAY_INVERSION_STATUS: string; | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json` |
| `const TRANSITION_ANIMATION_SCALE: string` | 6.0.1(21) | API废弃版本变更 | ArkTS | const TRANSITION_ANIMATION_SCALE: string; | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json` |
| `const WINDOW_ANIMATION_SCALE: string` | 6.0.1(21) | API废弃版本变更 | ArkTS | const WINDOW_ANIMATION_SCALE: string; | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json` |
| `declare const Button: ButtonInterface ×6` | 5.1.0(18) | UX视觉布局变更 | ArkTS | 按钮默认值变更为新增圆角矩形类型：unnamed.Button | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `declare const Button: ButtonInterface ×6` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 内置文本的组件文本样式优化：unnamed.Button | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Button: ButtonInterface ×6` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 表单类组件触摸热区最小高度变更：unnamed.Button | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Slider: SliderInterface` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 内置文本的组件文本样式优化：unnamed.Slider | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Text: TextInterface ×18` | 26.0.0(26) | UX视觉布局变更 | ArkTS | Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质：unnamed.Text | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Toggle: ToggleInterface ×4` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 表单类组件触摸热区最小高度变更：unnamed.Toggle | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare function getContext(component?: Object): Context ×2` | 5.1.0(18) | API废弃版本变更 | ArkTS | declare function getContext(component?: Object): Context; | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` |
| `declare type HdsSceneFinishCallback = () => void ×6` | 6.0.2(22) | API卡片权限变更 | ArkTS | declare type HdsSceneFinishCallback = () => void; | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` |
| `declare type MonitorDecorator = (value: string, ...args: string\[\]) => MethodDecorator ×6` | 6.1.0(23) | API卡片权限变更 | ArkTS | declare type MonitorDecorator = (value: string, ...args: string\[\]) => MethodDe | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `declare type WithThemeInterface = (options: WithThemeOptions) => WithThemeAttribute ×6` | 26.0.0(26) | 接口行为变更 | ArkTS | WithTheme相关组件行为变更：unnamed.WithThemeInterface | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `drawImage( image: ImageBitmap | PixelMap, sx: number, sy: number, sw: number, sh: number, dx: number, dy: number, dw: number, dh: number, ): void ×4` | 5.1.0(18) | 接口行为变更 | ArkTS | CanvasRenderingContext2D的drawImage接口默认单位变更：CanvasRenderer.drawImage | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `drawImage(pixelmap: image.PixelMap, left: number, top: number, samplingOptions?: SamplingOptions): void ×4` | 6.0.0(20) | API跨平台权限变更 | ArkTS | drawImage(pixelmap: image.PixelMap, left: number, top: number, samplingOptions?: | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum ColorMode ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | enum ColorMode | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `enum FoldDisplayMode` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum FoldDisplayMode | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum FoldStatus` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum FoldStatus | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `fillText(text: string, x: number, y: number, maxWidth?: number): void` | 5.0.1(13) | 接口行为变更 | ArkTS | 画布组件在绘制文本时设置globalCompositeOperation、fillStyle和globalAlpha属性的效果变更：CanvasRenderer | `harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Release.json` |
| `font: string ×2` | 6.0.0(20) | 接口行为变更 | ArkTS | CanvasRenderer的font接口支持自定义字体行为变更：CanvasRenderer.font | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `function create(createParameters: CreateParameters): Promise<CreateResult>` | 6.1.0(23) | 权限变更 | ArkTS | function create(createParameters: CreateParameters): Promise<CreateResult>; | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `function off(type: 'BLEDeviceFind', callback?: Callback<Array<ScanResult>>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | function off(type: 'BLEDeviceFind', callback?: Callback<Array<ScanResult>>): voi | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `function off(type: 'accessibilityStateChange', callback?: Callback<boolean>): void` | 6.1.0(23) | API卡片权限变更 | ArkTS | function off(type: 'accessibilityStateChange', callback?: Callback<boolean>): vo | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `function off(type: 'add' | 'remove' | 'change', callback?: Callback<number>): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | function off(type: 'add' \| 'remove' \| 'change', callback?: Callback<number>):  | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `function off(type: 'bluetoothDeviceFind', callback?: Callback<Array<string>>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | function off(type: 'bluetoothDeviceFind', callback?: Callback<Array<string>>): v | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `function off(type: 'bondStateChange', callback?: Callback<BondStateParam>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | function off(type: 'bondStateChange', callback?: Callback<BondStateParam>): void | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `function off(type: 'connectNotify', callback?: Callback<ConnectNotification>): void` | 6.1.0(23) | 权限变更 | ArkTS | function off(type: 'connectNotify', callback?: Callback<ConnectNotification>): v | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `function off(type: 'deviceSelected', token: number): void` | 6.0.2(22) | API废弃版本变更 | ArkTS | function off(type: 'deviceSelected', token: number): void; | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` |
| `function off(type: 'deviceUnselected', token: number): void` | 6.0.2(22) | API废弃版本变更 | ArkTS | function off(type: 'deviceUnselected', token: number): void; | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` |
| `function off(type: 'discovery', callback?: Callback<DiscoveryResult>): void` | 6.1.0(23) | 权限变更 | ArkTS | function off(type: 'discovery', callback?: Callback<DiscoveryResult>): void; | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `function off(type: 'error', callback?: Callback<ReturnResult>): void` | 6.1.0(23) | 权限变更 | ArkTS | function off(type: 'error', callback?: Callback<ReturnResult>): void; | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `function off(type: 'filePreloadStateChanged', callback?: Callback<FilePreloadStatusInfo>): void` | 26.0.0 Beta2 | API废弃版本变更 | ArkTS | function off(type: 'filePreloadStateChanged', callback?: Callback<FilePreloadSta | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` |
| `function off(type: 'foldAngleChange', callback?: Callback<Array<number>>): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | function off(type: 'foldAngleChange', callback?: Callback<Array<number>>): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `function off(type: 'foldDisplayModeChange', callback?: Callback<FoldDisplayMode>): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | function off(type: 'foldDisplayModeChange', callback?: Callback<FoldDisplayMode> | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `function off(type: 'foldStatusChange', callback?: Callback<FoldStatus>): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | function off(type: 'foldStatusChange', callback?: Callback<FoldStatus>): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `function off(type: 'gnssFenceStatusChange', request: GeofenceRequest, want: WantAgent): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | function off(type: 'gnssFenceStatusChange', request: GeofenceRequest, want: Want | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `function off(type: 'locationChange', callback?: Callback<Location>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | function off(type: 'locationChange', callback?: Callback<Location>): void; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `function off(type: 'operatingHandChanged', callback?: Callback<OperatingHandStatus>): void` | 6.0.0(20) | 权限变更 | ArkTS | function off(type: 'operatingHandChanged', callback?: Callback<OperatingHandStat | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `function off(type: 'operatingHandChanged', callback?: Callback<OperatingHandStatus>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | function off(type: 'operatingHandChanged', callback?: Callback<OperatingHandStat | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `function off(type: 'pinRequired', callback?: Callback<PinRequiredParam>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | function off(type: 'pinRequired', callback?: Callback<PinRequiredParam>): void; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `function off(type: 'receivePackageInfo', callback?: Callback<PackageInfo>): void` | 6.1.0(23) | 权限变更 | ArkTS | function off(type: 'receivePackageInfo', callback?: Callback<PackageInfo>): void | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `function off(type: 'screenReaderStateChange', callback?: Callback<boolean>): void` | 6.1.0(23) | API卡片权限变更 | ArkTS | function off(type: 'screenReaderStateChange', callback?: Callback<boolean>): voi | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `function off(type: 'stateChange', callback?: Callback<BluetoothState>): void` | 5.1.0(18) | 权限变更 | ArkTS | function off(type: 'stateChange', callback?: Callback<BluetoothState>): void; | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` |
| `function off(type: 'stateChange', callback?: Callback<BluetoothState>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | function off(type: 'stateChange', callback?: Callback<BluetoothState>): void; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `function off(type: 'touchGuideStateChange', callback?: Callback<boolean>): void` | 6.1.0(23) | API卡片权限变更 | ArkTS | function off(type: 'touchGuideStateChange', callback?: Callback<boolean>): void; | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `function off(type: 'touchModeChange', callback?: Callback<string>): void` | 6.1.0(23) | API卡片权限变更 | ArkTS | function off(type: 'touchModeChange', callback?: Callback<string>): void; | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `function off(type: 'transferNotify', callback?: Callback<TransferNotification>): void` | 6.1.0(23) | 权限变更 | ArkTS | function off(type: 'transferNotify', callback?: Callback<TransferNotification>): | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `function off(type: 'userAgeGroupDetected', callback?: Callback<UserClassification>): void` | 6.1.1(24) | API废弃版本变更 | ArkTS | function off(type: 'userAgeGroupDetected', callback?: Callback<UserClassificatio | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` |
| `function on(type: 'BLEDeviceFind', callback: Callback<Array<ScanResult>>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | function on(type: 'BLEDeviceFind', callback: Callback<Array<ScanResult>>): void; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `function on(type: 'accessibilityStateChange', callback: Callback<boolean>): void` | 6.1.0(23) | API卡片权限变更 | ArkTS | function on(type: 'accessibilityStateChange', callback: Callback<boolean>): void | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `function on(type: 'add' | 'remove' | 'change', callback: Callback<number>): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | function on(type: 'add' \| 'remove' \| 'change', callback: Callback<number>): vo | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `function on(type: 'bluetoothDeviceFind', callback: Callback<Array<string>>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | function on(type: 'bluetoothDeviceFind', callback: Callback<Array<string>>): voi | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `function on(type: 'bondStateChange', callback: Callback<BondStateParam>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | function on(type: 'bondStateChange', callback: Callback<BondStateParam>): void; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `function on(type: 'connectNotify', callback: Callback<ConnectNotification>): void` | 6.1.0(23) | 权限变更 | ArkTS | function on(type: 'connectNotify', callback: Callback<ConnectNotification>): voi | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `function on(type: 'deviceSelected', token: number, callback: Callback<Array<ContinuationResult>>): void` | 6.0.2(22) | API废弃版本变更 | ArkTS | function on(type: 'deviceSelected', token: number, callback: Callback<Array<Cont | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` |
| `function on(type: 'deviceUnselected', token: number, callback: Callback<Array<ContinuationResult>>): void` | 6.0.2(22) | API废弃版本变更 | ArkTS | function on(type: 'deviceUnselected', token: number, callback: Callback<Array<Co | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` |
| `function on(type: 'discovery', callback: Callback<DiscoveryResult>): void` | 6.1.0(23) | 权限变更 | ArkTS | function on(type: 'discovery', callback: Callback<DiscoveryResult>): void; | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `function on(type: 'discoveryResult', callback: Callback<Array<DiscoveryResult>>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | function on(type: 'discoveryResult', callback: Callback<Array<DiscoveryResult>>) | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `function on(type: 'error', callback: Callback<ReturnResult>): void` | 6.1.0(23) | 权限变更 | ArkTS | function on(type: 'error', callback: Callback<ReturnResult>): void; | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `function on(type: 'filePreloadStateChanged', callback: Callback<FilePreloadStatusInfo>): void` | 26.0.0 Beta2 | API废弃版本变更 | ArkTS | function on(type: 'filePreloadStateChanged', callback: Callback<FilePreloadStatu | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` |
| `function on(type: 'foldAngleChange', callback: Callback<Array<number>>): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | function on(type: 'foldAngleChange', callback: Callback<Array<number>>): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `function on(type: 'foldDisplayModeChange', callback: Callback<FoldDisplayMode>): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | function on(type: 'foldDisplayModeChange', callback: Callback<FoldDisplayMode>): | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `function on(type: 'foldStatusChange', callback: Callback<FoldStatus>): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | function on(type: 'foldStatusChange', callback: Callback<FoldStatus>): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `function on(type: 'operatingHandChanged', callback: Callback<OperatingHandStatus>): void` | 6.0.0(20) | 权限变更 | ArkTS | function on(type: 'operatingHandChanged', callback: Callback<OperatingHandStatus | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `function on(type: 'operatingHandChanged', callback: Callback<OperatingHandStatus>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | function on(type: 'operatingHandChanged', callback: Callback<OperatingHandStatus | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `function on(type: 'pinRequired', callback: Callback<PinRequiredParam>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | function on(type: 'pinRequired', callback: Callback<PinRequiredParam>): void; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `function on(type: 'receivePackageInfo', callback: Callback<PackageInfo>): void` | 6.1.0(23) | 权限变更 | ArkTS | function on(type: 'receivePackageInfo', callback: Callback<PackageInfo>): void; | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `function on(type: 'screenReaderStateChange', callback: Callback<boolean>): void` | 6.1.0(23) | API卡片权限变更 | ArkTS | function on(type: 'screenReaderStateChange', callback: Callback<boolean>): void; | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `function on(type: 'stateChange', callback: Callback<BluetoothState>): void` | 5.1.0(18) | 权限变更 | ArkTS | function on(type: 'stateChange', callback: Callback<BluetoothState>): void; | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` |
| `function on(type: 'stateChange', callback: Callback<BluetoothState>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | function on(type: 'stateChange', callback: Callback<BluetoothState>): void; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `function on(type: 'touchGuideStateChange', callback: Callback<boolean>): void` | 6.1.0(23) | API卡片权限变更 | ArkTS | function on(type: 'touchGuideStateChange', callback: Callback<boolean>): void; | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `function on(type: 'touchModeChange', callback: Callback<string>): void` | 6.1.0(23) | API卡片权限变更 | ArkTS | function on(type: 'touchModeChange', callback: Callback<string>): void; | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `function on(type: 'transferNotify', callback: Callback<TransferNotification>): void` | 6.1.0(23) | 权限变更 | ArkTS | function on(type: 'transferNotify', callback: Callback<TransferNotification>): v | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `function on(type: 'userAgeGroupDetected', callback: Callback<UserClassification>): void` | 6.1.1(24) | API废弃版本变更 | ArkTS | function on(type: 'userAgeGroupDetected', callback: Callback<UserClassification> | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` |
| `getColorSync(resource: Resource): number` | 6.0.0(20) | API废弃版本变更 | ArkTS | getColorSync(resource: Resource): number; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `measureText(text: string, encoding: TextEncoding): number` | 6.0.0(20) | API跨平台权限变更 | ArkTS | measureText(text: string, encoding: TextEncoding): number; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `off(event: 'pause', callback?: (progress: Progress) => void): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | off(event: 'pause', callback?: (progress: Progress) => void): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `off(event: 'remove', callback?: (progress: Progress) => void): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | off(event: 'remove', callback?: (progress: Progress) => void): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `off(event: 'response', callback?: Callback<HttpResponse>): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | off(event: 'response', callback?: Callback<HttpResponse>): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `off(event: 'resume', callback?: (progress: Progress) => void): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | off(event: 'resume', callback?: (progress: Progress) => void): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `off(event: 'statistics', observer?: Callback<SqlExecutionInfo>): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | off(event: 'statistics', observer?: Callback<SqlExecutionInfo>): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `off(type: "headerReceive", callback?: AsyncCallback<Object>): void` | 6.1.0(23) | API废弃版本变更 | ArkTS | off(type: "headerReceive", callback?: AsyncCallback<Object>): void; | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta2.json` |
| `off(type: 'BLECharacteristicChange', callback?: Callback<BLECharacteristic>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | off(type: 'BLECharacteristicChange', callback?: Callback<BLECharacteristic>): vo | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `off(type: 'BLEConnectionStateChange', callback?: Callback<BLEConnectChangedState>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | off(type: 'BLEConnectionStateChange', callback?: Callback<BLEConnectChangedState | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `off(type: 'availableDeviceChange', callback?: Callback<DeviceChangeAction>): void` | 5.1.0(18) | 接口行为变更 | ArkTS | 音频框架识别USB音频设备类型行为变更：audio.AudioRoutingManager.off | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `off(type: 'characteristicRead', callback?: Callback<CharacteristicReadRequest>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | off(type: 'characteristicRead', callback?: Callback<CharacteristicReadRequest>): | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `off(type: 'characteristicWrite', callback?: Callback<CharacteristicWriteRequest>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | off(type: 'characteristicWrite', callback?: Callback<CharacteristicWriteRequest> | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `off(type: 'connectStateChange', callback?: Callback<BLEConnectChangedState>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | off(type: 'connectStateChange', callback?: Callback<BLEConnectChangedState>): vo | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `off(type: 'connectionStateChange', callback?: Callback<StateChangeParam>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | off(type: 'connectionStateChange', callback?: Callback<StateChangeParam>): void; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `off(type: 'dataChange', keys: Array<string>, callback?: Callback<Record<string, ValueType>>): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | off(type: 'dataChange', keys: Array<string>, callback?: Callback<Record<string,  | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `off(type: 'descriptorRead', callback?: Callback<DescriptorReadRequest>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | off(type: 'descriptorRead', callback?: Callback<DescriptorReadRequest>): void; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `off(type: 'descriptorWrite', callback?: Callback<DescriptorWriteRequest>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | off(type: 'descriptorWrite', callback?: Callback<DescriptorWriteRequest>): void; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `off(type: 'inputStart', callback?: (kbController: KeyboardController, textInputClient: TextInputClient) => void): void` | 6.1.0(23) | API废弃版本变更 | ArkTS | off(type: 'inputStart', callback?: (kbController: KeyboardController, textInputC | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `off(type: 'keyboardShow' | 'keyboardHide', callback?: () => void): void` | 6.1.0(23) | API废弃版本变更 | ArkTS | off(type: 'keyboardShow' \| 'keyboardHide', callback?: () => void): void; | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `off(type: 'playFromAssetId', callback?: (assetId: number) => void): void` | 6.0.0(20) | API废弃版本变更 | ArkTS | off(type: 'playFromAssetId', callback?: (assetId: number) => void): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `off(type: 'volumeChange', callback?: Callback<VolumeEvent>): void` | 6.0.0(20) | API废弃版本变更 | ArkTS | off(type: 'volumeChange', callback?: Callback<VolumeEvent>): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `on(event: 'pause', callback: (progress: Progress) => void): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | on(event: 'pause', callback: (progress: Progress) => void): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `on(event: 'remove', callback: (progress: Progress) => void): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | on(event: 'remove', callback: (progress: Progress) => void): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `on(event: 'response', callback: Callback<HttpResponse>): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | on(event: 'response', callback: Callback<HttpResponse>): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `on(event: 'resume', callback: (progress: Progress) => void): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | on(event: 'resume', callback: (progress: Progress) => void): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `on(event: 'statistics', observer: Callback<SqlExecutionInfo>): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | on(event: 'statistics', observer: Callback<SqlExecutionInfo>): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `on(type: "headerReceive", callback: AsyncCallback<Object>): void` | 6.1.0(23) | API废弃版本变更 | ArkTS | on(type: "headerReceive", callback: AsyncCallback<Object>): void; | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta2.json` |
| `on(type: 'BLECharacteristicChange', callback: Callback<BLECharacteristic>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | on(type: 'BLECharacteristicChange', callback: Callback<BLECharacteristic>): void | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `on(type: 'BLEConnectionStateChange', callback: Callback<BLEConnectChangedState>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | on(type: 'BLEConnectionStateChange', callback: Callback<BLEConnectChangedState>) | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `on(type: 'BLEDeviceFind', callback: Callback<ScanReport>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | on(type: 'BLEDeviceFind', callback: Callback<ScanReport>): void; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `on(type: 'availableDeviceChange', deviceUsage: DeviceUsage, callback: Callback<DeviceChangeAction>): void` | 5.1.0(18) | 接口行为变更 | ArkTS | 音频框架识别USB音频设备类型行为变更：audio.AudioRoutingManager.on | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `on(type: 'characteristicRead', callback: Callback<CharacteristicReadRequest>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | on(type: 'characteristicRead', callback: Callback<CharacteristicReadRequest>): v | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `on(type: 'characteristicWrite', callback: Callback<CharacteristicWriteRequest>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | on(type: 'characteristicWrite', callback: Callback<CharacteristicWriteRequest>): | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `on(type: 'connectStateChange', callback: Callback<BLEConnectChangedState>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | on(type: 'connectStateChange', callback: Callback<BLEConnectChangedState>): void | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `on(type: 'connectionStateChange', callback: Callback<BLEConnectionChangeState>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | on(type: 'connectionStateChange', callback: Callback<BLEConnectionChangeState>): | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `on(type: 'connectionStateChange', callback: Callback<StateChangeParam>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | on(type: 'connectionStateChange', callback: Callback<StateChangeParam>): void; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `on(type: 'dataChange', keys: Array<string>, callback: Callback<Record<string, ValueType>>): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | on(type: 'dataChange', keys: Array<string>, callback: Callback<Record<string, Va | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `on(type: 'descriptorRead', callback: Callback<DescriptorReadRequest>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | on(type: 'descriptorRead', callback: Callback<DescriptorReadRequest>): void; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `on(type: 'descriptorWrite', callback: Callback<DescriptorWriteRequest>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | on(type: 'descriptorWrite', callback: Callback<DescriptorWriteRequest>): void; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `on(type: 'error', callback: ErrorCallback): void` | 5.0.2(14) | 接口行为变更 | ArkTS | AVErrorCode枚举值变更：media.AVPlayer.on | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` |
| `on(type: 'inputStart', callback: (kbController: KeyboardController, textInputClient: TextInputClient) => void): void` | 6.1.0(23) | API废弃版本变更 | ArkTS | on(type: 'inputStart', callback: (kbController: KeyboardController, textInputCli | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `on(type: 'keyboardShow' | 'keyboardHide', callback: () => void): void` | 6.1.0(23) | API废弃版本变更 | ArkTS | on(type: 'keyboardShow' \| 'keyboardHide', callback: () => void): void; | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `on(type: 'playFromAssetId', callback: (assetId: number) => void): void` | 6.0.0(20) | API废弃版本变更 | ArkTS | on(type: 'playFromAssetId', callback: (assetId: number) => void): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `on(type: 'screenshot', callback: Callback<void>): void` | 5.0.3(15) | 接口行为变更 | ArkTS | 系统录屏应用调用的截屏接口变更：window.Window.on | `harmonyos_behavior_changes/HarmonyOS_5.0.3(15)_Beta1.json` |
| `on(type: 'volumeChange', callback: Callback<VolumeEvent>): void` | 6.0.0(20) | API废弃版本变更 | ArkTS | on(type: 'volumeChange', callback: Callback<VolumeEvent>): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `on(type: 'windowStatusChange', callback: Callback<WindowStatusType>): void` | 5.0.2(14) | 接口行为变更 | ArkTS | 在PC/2in1设备上getWindowStatus和on('windowStatusChange')接口在窗口最大化状态返回值变更：window.Window | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` |
| `start(): void ×2` | 6.0.0(20) | 接口行为变更 | ArkTS | @ohos.useriam.userAuth限制应用从后台发起带交互界面的身份认证变更：userAuth.UserAuthInstance.start | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `static create(blurRadius: number, x: number, y: number, color: common2D.Color | number): ShadowLayer` | 6.0.0(20) | API跨平台权限变更 | ArkTS | static create(blurRadius: number, x: number, y: number, color: common2D.Color \| | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `static create(blurRadius: number, x: number, y: number, color: common2D.Color): ShadowLayer` | 6.0.0(20) | API跨平台权限变更 | ArkTS | static create(blurRadius: number, x: number, y: number, color: common2D.Color):  | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `static create(options: AnimatorOptions): AnimatorResult` | 5.1.0(18) | API废弃版本变更 | ArkTS | static create(options: AnimatorOptions): AnimatorResult; | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` |
| `static measureText(options: MeasureOptions): number` | 5.1.0(18) | API废弃版本变更 | ArkTS | static measureText(options: MeasureOptions): number; | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` |
| `stop(): void ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | stop(): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `text?: LocationDescription ×7` | 6.0.0(20) | 接口废弃变更 | ArkTS | 位置控件功能变更：LocationButtonOptions.text | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `text?: PasteDescription ×7` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 内置文本的组件文本样式优化：PasteButtonOptions.text | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `text?: SaveDescription ×7` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 内置文本的组件文本样式优化：SaveButtonOptions.text | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `type LocationButtonCallback = (event: ClickEvent, result: LocationButtonOnClickResult, error?: BusinessError<void>) => void ×6` | 6.0.0(20) | 接口废弃变更 | ArkTS | 位置控件功能变更：unnamed.LocationButtonCallback | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `windowStage: window.WindowStage` | 6.0.1(21) | API跨平台权限变更 | ArkTS | windowStage: window.WindowStage; | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json` |

## 四、逐 API 建议

### `MODE_AUTO = -1`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_AUTO = -1（共 2 处调用点）

### `MODE_DARK = 0`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_DARK = 0（共 2 处调用点）

### `MODE_LIGHT = 1`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_LIGHT = 1（共 2 处调用点）

### `backgroundColor(color: Optional<ResourceColor>): ArcDotIndicator`  ℹ️ 关注  （变更 15 条 [ArkTS 15 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `backgroundColor(color: Optional<ResourceColor>): T`  ℹ️ 关注  （变更 15 条 [ArkTS 15 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `backgroundColor(value: ResourceColor): T`  ℹ️ 关注  （变更 15 条 [ArkTS 15 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `bind(id: string): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `blockColor(value: ResourceColor): SliderAttribute`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius(radius: Dimension | BorderRadiuses): T`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius(value: Length | BorderRadiuses | LocalizedBorderRadiuses): T`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius: number`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius?: Length`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius?: LengthMetrics`  ℹ️ 关注  （变更 16 条 [ArkTS 16 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius?: LengthMetrics | BorderRadiuses | LocalizedBorderRadiuses`  ℹ️ 关注  （变更 16 条 [ArkTS 16 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const ANIMATOR_DURATION_SCALE: string`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.1(21)] `API废弃版本变更`：const ANIMATOR_DURATION_SCALE: string;

### `const DEFAULT_SCREEN_ROTATION: string`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.1(21)] `API废弃版本变更`：const DEFAULT_SCREEN_ROTATION: string;

### `const DISPLAY_INVERSION_STATUS: string`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.1(21)] `API废弃版本变更`：const DISPLAY_INVERSION_STATUS: string;

### `const TRANSITION_ANIMATION_SCALE: string`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.1(21)] `API废弃版本变更`：const TRANSITION_ANIMATION_SCALE: string;

### `const WINDOW_ANIMATION_SCALE: string`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.1(21)] `API废弃版本变更`：const WINDOW_ANIMATION_SCALE: string;

### `controller: functionalInputComponentManager.FunctionalInputController`  ℹ️ 关注  （变更 7 条 [ArkTS 7 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller: loginComponentManager.LoginPanelController`  ℹ️ 关注  （变更 7 条 [ArkTS 7 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller: loginComponentManager.LoginWithHuaweiIDButtonController`  ℹ️ 关注  （变更 7 条 [ArkTS 7 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller: readerCore.ReaderComponentController`  ℹ️ 关注  （变更 7 条 [ArkTS 7 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: FunctionController`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: HdsTabsController`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: SearchController`  ℹ️ 关注  （变更 7 条 [ArkTS 7 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: ShaderEffectController`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: TabsController`  ℹ️ 关注  （变更 7 条 [ArkTS 7 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: TextClockController`  ℹ️ 关注  （变更 7 条 [ArkTS 7 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare class CommonMethod<T>`  ℹ️ 关注  （变更 242 条 [ArkTS 242 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare const Button: ButtonInterface`  ⚠️ 高风险  （变更 18 条 [ArkTS 18 / C++ 0]，其中高影响 18 条 [ArkTS 18 / C++ 0]）

- [ArkTS] [5.1.0(18)] `UX视觉布局变更`：按钮默认值变更为新增圆角矩形类型：unnamed.Button（共 6 处调用点）
- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：内置文本的组件文本样式优化：unnamed.Button（共 6 处调用点）
- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：表单类组件触摸热区最小高度变更：unnamed.Button（共 6 处调用点）

### `declare const Slider: SliderInterface`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：内置文本的组件文本样式优化：unnamed.Slider

### `declare const Text: TextInterface`  ⚠️ 高风险  （变更 18 条 [ArkTS 18 / C++ 0]，其中高影响 18 条 [ArkTS 18 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质：unnamed.Text（共 18 处调用点）

### `declare const Toggle: ToggleInterface`  ⚠️ 高风险  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 4 条 [ArkTS 4 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：表单类组件触摸热区最小高度变更：unnamed.Toggle（共 4 处调用点）

### `declare function getContext(component?: Object): Context`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [5.1.0(18)] `API废弃版本变更`：declare function getContext(component?: Object): Context;（共 2 处调用点）

### `declare type AccessibilityActionInterceptCallback = (action: AccessibilityAction) => AccessibilityActionInterceptResult`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type AccessibilityFocusCallback = (isFocus: boolean) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type AccessibilityTransparentCallback = (event: TouchEvent) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type AnimationEndHandler = (index: number, event: SwiperAnimationEvent) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type AnimationStartHandler = (index: number, targetIndex: number, event: SwiperAnimationEvent) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ArcScrollIndexHandler = (start: number, end: number, center: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ArcSliderChangeHandler = (progress: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ArcSliderEnlargeHandler = (isEnlarged: boolean) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ArcSliderTouchHandler = (event: TouchEvent) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type AreaChangeCallback = (oldValue: Area, newValue: Area) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type BuilderCallback = (...args: Args) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type BusinessError<T> = import('../api/@ohos.base').BusinessError<T>`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type CommonModifier = import('../api/arkui/CommonModifier').CommonModifier`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ContentWillScrollCallback = (result: SwiperContentWillScrollResult) => boolean`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type CustomBuilderT<T> = (t: T) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type CustomBuilderWithId = (id: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type DataLoadParams = import('../api/@ohos.data.unifiedDataChannel').default.DataLoadParams`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type DataSyncOptions = import('../api/@ohos.data.unifiedDataChannel').default.GetDataParams`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type DidScrollCallback = (yOffset: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type DragSpringLoadingConfiguration = import('../api/@ohos.arkui.dragController').default.DragSpringLoadingConfiguration`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type DrawableDescriptor = import('../api/@ohos.arkui.drawableDescriptor').DrawableDescriptor`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type EditableTextOnChangeCallback = (value: string, previewText?: PreviewText) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type EnvDecorator = (value: SystemProperties) => PropertyDecorator`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type FinishAnimationHandler = () => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type FontVariation = import('../api/@ohos.graphics.text').default.FontVariation`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type FrameNode = import('../api/arkui/FrameNode').FrameNode`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type GestureCollectInterceptCallback = (recognizers: Array<GestureRecognizer>, touchRecognizers?: Array<TouchRecognizer>) => GestureCollectIntervention`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type GestureRecognizerJudgeBeginCallback = (event: BaseGestureEvent, current: GestureRecognizer, recognizers: Array<GestureRecognizer>) => GestureJudgeResult`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type GestureSwipeHandler = (index: number, event: SwiperAnimationEvent) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type HdsListItemCardInterface = (options: HdsListItemCardOptions) => HdsListItemCardAttribute`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type HdsSceneFinishCallback = () => void`  ⚠️ 高风险  （变更 18 条 [ArkTS 18 / C++ 0]，其中高影响 6 条 [ArkTS 6 / C++ 0]）

- [ArkTS] [6.0.2(22)] `API卡片权限变更`：declare type HdsSceneFinishCallback = () => void;（共 6 处调用点）

### `declare type HdsTabsInterface = (options?: HdsTabsOptions) => HdsTabsAttribute`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type HdsVisualComponentInterface = () => HdsVisualComponentAttribute`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ImageMatrix = import('../api/@ohos.matrix4').default.Matrix4Transit`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ImmersiveMode = import('../api/@ohos.promptAction').ImmersiveMode`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type IndexChangedHandler = (index: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type InitCallback = () => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type InputEventListener = (event: RawInputEventWrapper) => InputEventInterceptResult`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type InputMethodExtraConfig = import('../api/@ohos.inputMethod.ExtraConfig').InputMethodExtraConfig`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type InterceptionCallback = (from: NavPathInfo | NavBar, to: NavPathInfo | NavBar, pathStack: NavPathStack, operation: NavigationOperation, isAnimated: boolean) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type LevelMode = import('../api/@ohos.promptAction').LevelMode`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type LevelOrder = import('../api/@ohos.promptAction').LevelOrder`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type Material = import('../api/@ohos.arkui.uiMaterial').default.Material`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type Matrix4Transit = import('../api/@ohos.matrix4').default.Matrix4Transit`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type MenuCallback = (start: number, end: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type MonitorDecorator = (value: string, ...args: string\[\]) => MethodDecorator`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 6 条 [ArkTS 6 / C++ 0]）

- [ArkTS] [6.1.0(23)] `API卡片权限变更`：declare type MonitorDecorator = (value: string, ...args: string\[\]) => MethodDecorator;（共 6 处调用点）

### `declare type NavDestinationBuildFunction = (name: string, param?: object) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type NavDestinationTransitionDelegate = (operation: NavigationOperation, isEnter: boolean) => Array<NavDestinationTransition> | undefined`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type NodeRenderStateChangeCallback = (state: NodeRenderState, node?: FrameNode) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnActionCallback = () => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnActionTextClickCallback = () => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnAlphabetIndexerPopupSelectCallback = (index: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnAlphabetIndexerRequestPopupDataCallback = (index: number) => Array<string>`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnAlphabetIndexerSelectCallback = (index: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnChangeCallback = (value: boolean) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnChangedCallback = (callbackParam: CallbackParamV2) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnCheckboxChangeCallback = (value: boolean) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnCheckboxGroupChangeCallback = (value: CheckboxGroupResult) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnContainerCallback = () => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnContentScrollCallback = (totalOffsetX: number, totalOffsetY: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnDidStopDraggingCallback = (willFling: boolean) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnDragEventCallback = (event: DragEvent, extraParams?: string) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnFoldStatusChangeCallback = (event: OnFoldStatusChangeInfo) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnGetPreviewBadgeCallback = () => boolean | number`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnGridScrollIndexCallback = (first: number, last: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnHomeShowOnTopCallback = (name: string) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnHoverCallback = (status: boolean, event: HoverEvent) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnHoverStatusChangeCallback = (param: HoverEventParam) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnItemDragStartCallback = (event: ItemDragInfo, itemIndex: number) => CustomBuilder`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnListScrollIndexCallback = (start: number, end: number, center: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnNativeLoadCallback = (event?: object) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnNavigationModeChangeCallback = (mode: NavigationMode) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnNeedSoftkeyboardCallback = () => boolean`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnPasteCallback = (content: string, event: PasteEvent) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnPasteCallback = (pasteValue: string, event: PasteEvent) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnRadioChangeCallback = (isChecked: boolean) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnRatingChangeCallback = (rating: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnScrollEdgeCallback = (side: Edge) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnScrollFrameBeginCallback = (offset: number, state: ScrollState) => OnScrollFrameBeginHandlerResult`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSelectCallback = (index: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSelectCallback = (index: number, selectStr: string) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSelectCallback = (index: number, selectValue: string) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnStateChangeCallback = (state: SwipeActionState) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSubmitCallback = (enterKey: EnterKeyType, event: SubmitEvent) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSwiperAnimationEndCallback = (index: number, extraInfo: SwiperAnimationEvent) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSwiperAnimationStartCallback = (index: number, targetIndex: number, extraInfo: SwiperAnimationEvent) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSwiperGestureSwipeCallback = (index: number, extraInfo: SwiperAnimationEvent) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTabsAnimationEndCallback = (index: number, extraInfo: TabsAnimationEvent) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTabsAnimationStartCallback = (index: number, targetIndex: number, extraInfo: TabsAnimationEvent) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTabsContentDidScrollCallback = (selectedIndex: number, index: number, position: number, mainAxisLength: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTabsContentWillChangeCallback = (currentIndex: number, comingIndex: number) => boolean`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTabsGestureSwipeCallback = (index: number, extraInfo: TabsAnimationEvent) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTextPickerChangeCallback = (selectItem: string | string\[\], index: number | number\[\]) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTextSelectionChangeCallback = (selectionStart: number, selectionEnd: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTimePickerChangeCallback = (result: TimePickerResult) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTipClickCallback = () => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnUIPickerComponentCallback = (selectedIndex: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnVisibleIndexesChangeCallback = (start: number, end: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnWaterFlowScrollIndexCallback = (first: number, last: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnWillStopDraggingCallback = (velocity: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type Orientation = import('../api/@ohos.window').default.Orientation`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type PageTransitionCallback = (type: RouteType, progress: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type PanListenerCallback = (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type Paragraph = import('../api/@ohos.graphics.text').default.Paragraph`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type PopupStateChangeCallback = (event: PopupStateChangeParam) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type PromptActionCommonState = import('../api/@ohos.promptAction').promptAction.CommonState`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type PromptActionDialogController = import('../api/@ohos.promptAction').promptAction.DialogController`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type RectHeightStyle = import('../api/@ohos.graphics.text').default.RectHeightStyle`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type RectWidthStyle = import('../api/@ohos.graphics.text').default.RectWidthStyle`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type RepeatInterface = <T>(arr: RepeatArray<T>) => RepeatAttribute<T>`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type RequestDownloadInfo = import('../api/@ohos.request.cacheDownload').default.DownloadInfo`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type RestoreStateCallback = (savedState: Record<string, Object> | null) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ReuseIdCallback = () => string`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type SaveStateCallback = () => Record<string, Object> | null`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ScaleCallback = (scale: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ScrollOnDidZoomCallback = (scale: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type SearchSubmitCallback = (searchContent: string, event?: SubmitEvent) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ShouldRecognizerParallelWithCallback = (current: GestureRecognizer, others: Array<GestureRecognizer>) => GestureRecognizer`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type SpringLoadingContext = import('../api/@ohos.arkui.dragController').default.SpringLoadingContext`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type SwipeActionCallback = () => void`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type SystemUiMaterial = import('../api/@ohos.arkui.uiMaterial').default.Material`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TabsCustomContentTransitionCallback = (from: number, to: number) => TabContentAnimatedTransition | undefined`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TaskCallback = () => T`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TextAreaSubmitCallback = (enterKeyType: EnterKeyType, event?: SubmitEvent) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TextBox = import('../api/@ohos.graphics.text').default.TextBox`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TextPickerEnterSelectedAreaCallback = (value: string | string\[\], index: number | number\[\]) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TextPickerScrollStopCallback = (value: string | string\[\], index: number | number\[\]) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TouchTestDoneCallback = (event: BaseGestureEvent, recognizers: Array<GestureRecognizer>) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type UIMaterial = import('../api/@ohos.arkui.uiMaterial').uiMaterial`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type UIStatesChangeHandler = (node: FrameNode, currentUIStates: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type Vector2T<T> = import('../api/arkui/Graphics').Vector2T<T>`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type VisibleAreaChangeCallback = (isVisible: boolean, currentRatio: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type WindowEventListener = (windowId: number, event: window.WindowEventType) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type WithThemeInterface = (options: WithThemeOptions) => WithThemeAttribute`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 6 条 [ArkTS 6 / C++ 0]）

- [ArkTS] [26.0.0(26)] `接口行为变更`：WithTheme相关组件行为变更：unnamed.WithThemeInterface（共 6 处调用点）

### `drawImage( image: ImageBitmap | PixelMap, sx: number, sy: number, sw: number, sh: number, dx: number, dy: number, dw: number, dh: number, ): void`  ⚠️ 高风险  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 4 条 [ArkTS 4 / C++ 0]）

- [ArkTS] [5.1.0(18)] `接口行为变更`：CanvasRenderingContext2D的drawImage接口默认单位变更：CanvasRenderer.drawImage（共 4 处调用点）

### `drawImage(pixelmap: image.PixelMap, left: number, top: number, samplingOptions?: SamplingOptions): void`  ⚠️ 高风险  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 4 条 [ArkTS 4 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：drawImage(pixelmap: image.PixelMap, left: number, top: number, samplingOptions?: SamplingOptions): void;（共 4 处调用点）

### `enum ColorMode`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：enum ColorMode（共 2 处调用点）

### `enum CornerType`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum DisplaySourceMode`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum FoldDisplayMode`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum FoldDisplayMode

### `enum FoldStatus`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum FoldStatus

### `enum OutputType`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum PreferStrategy`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum ScreenShape`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export function getApplicationContext(): ApplicationContext`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ArrayListComparatorFn<T> = (firstValue: T, secondValue: T) => number`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ClickCallback = () => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ClientConnectionCloseCallback = (clientConnection: WebSocketConnection, closeReason: CloseResult) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ContentCoding = 'aes128gcm' | 'br' | 'compress' | 'deflate' | 'exi' | 'gzip' | 'pack200-gzip' | 'x-compress' | 'x-gzip' | 'zstd' | (string \& NonNullable<unknown>)`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ContentType = 'application/json' | 'text/plain' | 'multipart/form-data' | 'application/octet-stream' | 'application/x-www-form-urlencoded' | (string \& NonNullable<unknown>)`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type CurrentAlbumDeletedCallback = () => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type DynamicDnsRule = (host: string, port: number) => IpAddress\[\]`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type DynamicExclusionRule = (url: URLOrString) => boolean`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type EmptyAreaClickCallback = () => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ErrorCallback = (pickerError: PickerError) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ErrorHandler = (errObject: Error) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ExceedMaxSelectedCallback = (exceedMaxCountType: MaxCountType) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type FreezeObserver = () => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type GSTileRequestCallback = (tiles: GSTile\[\]) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type GetDataCallback = (maxSize: number) => ArrayBuffer | Promise<ArrayBuffer>`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type GlobalObserver = (reason: GlobalError) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type HttpMethod = 'GET' | 'POST' | 'HEAD' | 'PUT' | 'DELETE' | 'PATCH' | 'OPTIONS' | (string \& NonNullable<unknown>)`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type HttpVersionSelectCallback = (url: URL) => HttpVersion`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type IncomingDataCallback = (incomingData: ArrayBuffer) => void | Promise<void>`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ItemClickedNotifyCallback = (itemInfo: ItemInfo, clickType: ClickType) => void`  ℹ️ 关注  （变更 18 条 [ArkTS 18 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ItemsDeletedCallback = (baseItemInfos: Array<BaseItemInfo>) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ListComparatorFn<T> = (firstValue: T, secondValue: T) => number`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type MovingPhotoBadgeStateChangedCallback = (uri: string, state: photoAccessHelper.MovingPhotoBadgeStateType) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnAuthenticationChallenge = (info: AuthenticationChallengeInfo\[\], response: Response, challengeCount: number) => ServerAuthentication | null`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnCanceled = () => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnCanceled = (request?: Request) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnClosed = () => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnCounterV2HoverCallback = (isHover: boolean) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDataCallback = (method: AgentOperation, context: RequestContext) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDataEnd = () => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDataEnd = (request?: Request) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDataReceive = (incomingData: ArrayBuffer) => number | void | Promise<void>`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDataReceive = (incomingData: ArrayBuffer, request?: Request) => number | void | Promise<void>`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDateCounterV2ChangeCallback = (date: CounterV2DateData) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDownloadProgress = (totalSize: number, transferredSize: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDownloadProgress = (totalSize: number, transferredSize: number, request?: Request) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnHeaderReceive = (headers: ResponseHeaders) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnHeaderReceive = (headers: ResponseHeaders, request?: Request) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnInlineCounterV2Change = (value: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnMenuItemClickWithTextCallback = (menuItem: TextMenuItem, value: string) => boolean`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnPickerStateCallback = (state: AVCastPickerState) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnRequestFailureFn = (name: string, failureCode: AbilityStartFailureCode, failureMessage: string) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnRequestSuccessFn = (name: string) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnSelectedIndexChange = (selectedIndex: number) => void`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnSelectedIndexesChange = (selectedIndexes: number\[\]) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnStatusCodeReceive = (statusCode: number, request?: Request) => void`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnTimeInfo = (timeInfo: TimeInfo) => void`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnTimeInfo = (timeInfo: TimeInfo, request?: Request) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnUploadProgress = (totalSize: number, transferredSize: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnUploadProgress = (totalSize: number, transferredSize: number, request?: Request) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type PhotoBrowserChangeStartCallback = (targetPhotoInfo: BaseItemInfo) => void`  ℹ️ 关注  （变更 18 条 [ArkTS 18 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type PhotoBrowserZoomCallback = (scale: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type PinchGridSwitchedCallback = (gridLevel: photoAccessHelper.GridLevel) => void`  ℹ️ 关注  （变更 18 条 [ArkTS 18 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ProxySender = (data: string) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type RecentPhotoCheckInfoCallback = (recentPhotoExists: boolean, info: RecentPhotoInfo) => void`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ResourceUsageObserver = (resourceType: ResourceType, resourceSize: number, detailInfo?: Record<string, number>) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ResponseHeaders = { \[k: string\]: string | string\[\] | undefined; 'accept-ranges'?: 'none' | 'bytes' | (string \& NonNullable<unknown>); 'allow'?: HttpMethod | HttpMethod\[\]; 'cache-control'?: string | string\[\]; 'content-encoding'?: ContentCoding; 'content-range'?: string; 'content-type'?: ContentType; 'date'?: string; 'etag'?: string; 'expires'?: string; 'location'?: string; 'retry-after'?: string; 'set-cookie'?: string | string\[\]; 'server'?: string; 'www-authenticate'?: string | string\[\]; }`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ResponseValidationCallback = (response: Response) => boolean | Promise<boolean>`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ScrollStopAtEndCallback = () => void`  ℹ️ 关注  （变更 18 条 [ArkTS 18 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ScrollStopAtStartCallback = () => void`  ℹ️ 关注  （变更 18 条 [ArkTS 18 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type SearchKeyCallback = (results: SearchResultData\[\]) => boolean`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type SetPreviewTextCallback = (text: string, range: Range) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type SizeChangeCallback = (size: window.Size, keyboardArea?: KeyboardArea) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type SubHeaderV2OperationItemAction = () => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type SubHeaderV2SelectOnSelect = (selectedIndex: number, selectedContent?: string) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type SubHeaderV2TitleBuilder = () => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type TargetFileCallback = (request: Request, suggestedPath: Path) => TargetFile | Promise<TargetFile>`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ToolBarV2ItemAction = (index: number) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type UpReadState = (readState: ReadStateCode) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ValidationCallback = (context: ValidationContext) => boolean | Promise<boolean>`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type customInfoWindowCallback = (markerDelegate: map.MarkerDelegate) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type videoPlayStateChangedCallback = (state: VideoPlayerState) => void`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fillText(text: string, x: number, y: number, maxWidth?: number): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.0.1(13)] `接口行为变更`：画布组件在绘制文本时设置globalCompositeOperation、fillStyle和globalAlpha属性的效果变更：CanvasRenderer.fillText

### `font: string`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `接口行为变更`：CanvasRenderer的font接口支持自定义字体行为变更：CanvasRenderer.font（共 2 处调用点）

### `fontWeight(value: number | FontWeight | string): T`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight(value: number | FontWeight | string): TextAttribute`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight: number`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight?: FontWeight`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight?: number | FontWeight | string`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function bind(floatViewController: FloatViewController, floatingBallController: floatingBall.FloatingBallController, floatingBallParams: floatingBall.FloatingBallParams): Promise<void>`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function create(): ImageProcessor`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function create(config: FloatViewConfiguration): Promise<FloatViewController>`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function create(config: FloatingBallConfiguration): Promise<FloatingBallController>`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function create(createParameters: CreateParameters): Promise<CreateResult>`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `权限变更`：function create(createParameters: CreateParameters): Promise<CreateResult>;

### `function off(event: 'dataReceive', capability: RecvCapabilityRegistry, callback?: Callback<ReceivableTarget>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(event: 'gesturesShare', callback?: Callback<SharableTarget>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(event: 'gesturesShare', capability: SendCapabilityRegistry, callback?: Callback<SharableTarget>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(event: 'knockShare', capability: SendCapabilityRegistry, callback?: Callback<SharableTarget>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'BLEDeviceFind', callback?: Callback<Array<ScanResult>>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：function off(type: 'BLEDeviceFind', callback?: Callback<Array<ScanResult>>): void;

### `function off(type: 'acbStateChange', callback?: Callback<AcbStateParam>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'accessibilityStateChange', callback?: Callback<boolean>): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `API卡片权限变更`：function off(type: 'accessibilityStateChange', callback?: Callback<boolean>): void;

### `function off(type: 'add' | 'remove' | 'change', callback?: Callback<number>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：function off(type: 'add' | 'remove' | 'change', callback?: Callback<number>): void;

### `function off(type: 'advertisingStateChange', callback?: Callback<AdvertisingStateChangeInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'applicationState', observerId: number): Promise<void>`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'applicationState', observerId: number, callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'auditEventOccur', auditEventInfo: AuditEventInfo, callback?: Callback<AuditEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'bluetoothDeviceFind', callback?: Callback<Array<string>>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：function off(type: 'bluetoothDeviceFind', callback?: Callback<Array<string>>): void;

### `function off(type: 'bluetoothScanResultChange', callback?: Callback<BluetoothScanResult>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'bondStateChange', callback?: Callback<BondStateParam>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：function off(type: 'bondStateChange', callback?: Callback<BondStateParam>): void;

### `function off(type: 'brightnessInfoChange', callback?: BrightnessCallback<number, BrightnessInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'cachedGnssLocationsChange', callback?: Callback<Array<Location>>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'callStateChangeEx', callback?: Callback<TelCallState>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'channelStateChange', channelId: number, callback?: Callback<ChannelStateInfo>): void`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'complete', callback?: Callback<DownloadCompletedInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'connect', sessionId: number, callback?: Callback<EventCallbackInfo>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'connectNotify', callback?: Callback<ConnectNotification>): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `权限变更`：function off(type: 'connectNotify', callback?: Callback<ConnectNotification>): void;

### `function off(type: 'connectionStateChange', callback?: Callback<ConnectionStateParam>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'connectionStateChanged', callback?: Callback<ConnectionResult>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'continuousTaskActive', callback?: Callback<ContinuousTaskActiveInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'continuousTaskCancel', callback?: Callback<ContinuousTaskCancelInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'continuousTaskSuspend', callback?: Callback<ContinuousTaskSuspendInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'deviceConnect', callback?: Callback<ContinuationResult>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'deviceDisconnect', callback?: Callback<string>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'deviceFound', callback?: Callback<Array<ScanResults>>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'deviceSelected', token: number): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.2(22)] `API废弃版本变更`：function off(type: 'deviceSelected', token: number): void;

### `function off(type: 'deviceUnselected', token: number): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.2(22)] `API废弃版本变更`：function off(type: 'deviceUnselected', token: number): void;

### `function off(type: 'disconnect', sessionId: number, callback?: Callback<EventCallbackInfo>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'discovery', callback?: Callback<DiscoveryResult>): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `权限变更`：function off(type: 'discovery', callback?: Callback<DiscoveryResult>): void;

### `function off(type: 'discoveryResult', callback?: Callback<Array<DiscoveryResult>>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'distributedMessageReceive', callback?: DistributedMessageCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'dlpAntiPeep', callback?: Callback<DlpAntiPeepStatus>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'doubleTap', receiver?: Callback<DoubleTapEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'downloadCancel', callback?: Callback<DownloadCancelData>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'downloadComplete', callback?: Callback<DownloadCompleteData>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'downloadProgress', callback?: Callback<DownloadProgressData>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'downloadStart', callback?: Callback<DownloadStartData>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'downloadStatus', callback?: Callback<DownloadStatusData>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'error', callback?: Callback<ReturnResult>): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `权限变更`：function off(type: 'error', callback?: Callback<ReturnResult>): void;

### `function off(type: 'fail', callback?: Callback<DownloadFailedInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'filePreloadStateChanged', callback?: Callback<FilePreloadStatusInfo>): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `API废弃版本变更`：function off(type: 'filePreloadStateChanged', callback?: Callback<FilePreloadStatusInfo>): void;

### `function off(type: 'foldAngleChange', callback?: Callback<Array<number>>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：function off(type: 'foldAngleChange', callback?: Callback<Array<number>>): void;

### `function off(type: 'foldDisplayModeChange', callback?: Callback<FoldDisplayMode>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：function off(type: 'foldDisplayModeChange', callback?: Callback<FoldDisplayMode>): void;

### `function off(type: 'foldStatusChange', callback?: Callback<FoldStatus>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：function off(type: 'foldStatusChange', callback?: Callback<FoldStatus>): void;

### `function off(type: 'freeze', observer?: FreezeObserver): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'globalErrorOccurred', observer?: GlobalObserver): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'globalUnhandledRejectionDetected', observer?: GlobalObserver): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'gnssFenceStatusChange', request: GeofenceRequest, want: WantAgent): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：function off(type: 'gnssFenceStatusChange', request: GeofenceRequest, want: WantAgent): void;

### `function off(type: 'handoverChange', callback?: Callback<HandoverInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'holdingHandChanged', callback?: Callback<HoldingHandStatus>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'hotkeyChange', hotkeyOptions: HotkeyOptions, callback?: Callback<HotkeyOptions>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'hotspotStateChange', callback?: Callback<number>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'keyPressed', callback?: Callback<KeyEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'locationChange', callback?: Callback<Location>): void`  ⚠️ 高风险  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：function off(type: 'locationChange', callback?: Callback<Location>): void;

### `function off(type: 'miniGameAddictionPrevented', callback?: Callback<string>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'multiPathRecommendation', callback?: Callback<MultiPathRecommendationInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'multiPathStateChange', callback?: Callback<MultiPathStateInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'netQosChange', callback?: Callback<Array<NetworkQos>>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'netSceneChange', callback?: Callback<Array<NetworkScene>>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'operatingHandChanged', callback?: Callback<OperatingHandStatus>): void`  ⚠️ 高风险  （变更 5 条 [ArkTS 5 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `权限变更`：function off(type: 'operatingHandChanged', callback?: Callback<OperatingHandStatus>): void;
- [ArkTS] [26.0.0 Beta2] `权限变更`：function off(type: 'operatingHandChanged', callback?: Callback<OperatingHandStatus>): void;

### `function off(type: 'operationSubmitMetadata', bundleName: string, callback?: Callback<number>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'pairingStateChange', callback?: Callback<PairingStateParam>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'pause', callback?: Callback<AssetDownloadTask>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'pinRequired', callback?: Callback<PinRequiredParam>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：function off(type: 'pinRequired', callback?: Callback<PinRequiredParam>): void;

### `function off(type: 'prepareContinue', context: Context, callback?: AsyncCallback<ContinueResultInfo>): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'printerChange', callback?: PrinterChangeCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'progress', callback?: Callback<DownloadProgressInfo\[\]>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'readData', callback?: Callback<DataParams>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'readProgress', callback?: Callback<ReadProgress>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'readerModeWithInterval', elementName: ElementName, callback?: Callback<TagInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'receiveData', channelId: number, callback?: Callback<DataInfo>): void`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'receiveData', sessionId: number, callback?: Callback<EventCallbackInfo>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'receiveMessage', sessionId: number, callback?: Callback<EventCallbackInfo>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'receivePackageInfo', callback?: Callback<PackageInfo>): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `权限变更`：function off(type: 'receivePackageInfo', callback?: Callback<PackageInfo>): void;

### `function off(type: 'requestMore', callback: Callback<string>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'rightMenuClick', callback?: Callback<emitter.EventData>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'scanDeviceFound', callback?: Callback<ScannerDevice>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'scanDeviceSync', callback?: Callback<ScannerSyncDevice>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'screenReaderStateChange', callback?: Callback<boolean>): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `API卡片权限变更`：function off(type: 'screenReaderStateChange', callback?: Callback<boolean>): void;

### `function off(type: 'selectionCompleted', callback?: Callback<SelectionInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'sensorStatusChange', callback?: Callback<SensorStatusEvent>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'serviceDie', callback?: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'squeeze', receiver?: Callback<SqueezeEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'stateChange', callback?: Callback<BluetoothState>): void`  ⚠️ 高风险  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [5.1.0(18)] `权限变更`：function off(type: 'stateChange', callback?: Callback<BluetoothState>): void;
- [ArkTS] [26.0.0 Beta2] `权限变更`：function off(type: 'stateChange', callback?: Callback<BluetoothState>): void;

### `function off(type: 'stateChange', callback?: Callback<NearlinkState>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'stateChanged', callback?: Callback<ServiceState>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'statusBarIconClick', callback?: Callback<emitter.EventData>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'steadyStandingDetect', callback?: Callback<SteadyStandingStatus>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'superPrivacyModeChange', callback?: Callback<SuperPrivacyMode>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'tokenUpdate', callback?: Callback<string>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'touchGuideStateChange', callback?: Callback<boolean>): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `API卡片权限变更`：function off(type: 'touchGuideStateChange', callback?: Callback<boolean>): void;

### `function off(type: 'touchModeChange', callback?: Callback<string>): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `API卡片权限变更`：function off(type: 'touchModeChange', callback?: Callback<string>): void;

### `function off(type: 'transferNotify', callback?: Callback<TransferNotification>): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `权限变更`：function off(type: 'transferNotify', callback?: Callback<TransferNotification>): void;

### `function off(type: 'updateChange', callback?: Callback<UpdateSessionState>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: 'userAgeGroupDetected', callback?: Callback<UserClassification>): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.1(24)] `API废弃版本变更`：function off(type: 'userAgeGroupDetected', callback?: Callback<UserClassification>): void;

### `function off(type: 'vibratorStateChange', callback?: Callback<VibratorStatusEvent>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.ACCELEROMETER, sensorInfoParam?: SensorInfoParam, callback?: Callback<AccelerometerResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.ACCELEROMETER_UNCALIBRATED, sensorInfoParam?: SensorInfoParam, callback?: Callback<AccelerometerUncalibratedResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.AMBIENT_LIGHT, sensorInfoParam?: SensorInfoParam, callback?: Callback<LightResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.AMBIENT_TEMPERATURE, sensorInfoParam?: SensorInfoParam, callback?: Callback<AmbientTemperatureResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.BAROMETER, sensorInfoParam?: SensorInfoParam, callback?: Callback<BarometerResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.FUSION_PRESSURE, sensorInfoParam?: SensorInfoParam, callback?: Callback<FusionPressureResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.GRAVITY, sensorInfoParam?: SensorInfoParam, callback?: Callback<GravityResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.GYROSCOPE, sensorInfoParam?: SensorInfoParam, callback?: Callback<GyroscopeResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.GYROSCOPE_UNCALIBRATED, sensorInfoParam?: SensorInfoParam, callback?: Callback<GyroscopeUncalibratedResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.HALL, sensorInfoParam?: SensorInfoParam, callback?: Callback<HallResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.HEART_RATE, sensorInfoParam?: SensorInfoParam, callback?: Callback<HeartRateResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.HUMIDITY, sensorInfoParam?: SensorInfoParam, callback?: Callback<HumidityResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.LINEAR_ACCELEROMETER, sensorInfoParam?: SensorInfoParam, callback?: Callback<LinearAccelerometerResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.MAGNETIC_FIELD, sensorInfoParam?: SensorInfoParam, callback?: Callback<MagneticFieldResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.MAGNETIC_FIELD_UNCALIBRATED, sensorInfoParam?: SensorInfoParam, callback?: Callback<MagneticFieldUncalibratedResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.ORIENTATION, sensorInfoParam?: SensorInfoParam, callback?: Callback<OrientationResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.PEDOMETER, sensorInfoParam?: SensorInfoParam, callback?: Callback<PedometerResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.PEDOMETER_DETECTION, sensorInfoParam?: SensorInfoParam, callback?: Callback<PedometerDetectionResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.PROXIMITY, sensorInfoParam?: SensorInfoParam, callback?: Callback<ProximityResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.ROTATION_VECTOR, sensorInfoParam?: SensorInfoParam, callback?: Callback<RotationVectorResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.SIGNIFICANT_MOTION, sensorInfoParam?: SensorInfoParam, callback?: Callback<SignificantMotionResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function off(type: SensorId.WEAR_DETECTION, sensorInfoParam?: SensorInfoParam, callback?: Callback<WearDetectionResponse>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(event: 'dataReceive', capability: RecvCapabilityRegistry, callback: Callback<ReceivableTarget>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(event: 'gesturesShare', callback: Callback<SharableTarget>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(event: 'gesturesShare', capability: SendCapabilityRegistry, callback: Callback<SharableTarget>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(event: 'knockShare', capability: SendCapabilityRegistry, callback: Callback<SharableTarget>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'BLEDeviceFind', callback: Callback<Array<ScanResult>>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：function on(type: 'BLEDeviceFind', callback: Callback<Array<ScanResult>>): void;

### `function on(type: 'acbStateChange', callback: Callback<AcbStateParam>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'accessibilityStateChange', callback: Callback<boolean>): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `API卡片权限变更`：function on(type: 'accessibilityStateChange', callback: Callback<boolean>): void;

### `function on(type: 'add' | 'remove' | 'change', callback: Callback<number>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：function on(type: 'add' | 'remove' | 'change', callback: Callback<number>): void;

### `function on(type: 'advertisingStateChange', callback: Callback<AdvertisingStateChangeInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'applicationState', observer: ApplicationStateObserver): number`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'applicationState', observer: ApplicationStateObserver, bundleNameList: Array<string>): number`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'auditEventOccur', auditEventInfo: AuditEventInfo, callback: Callback<AuditEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'bluetoothDeviceFind', callback: Callback<Array<string>>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：function on(type: 'bluetoothDeviceFind', callback: Callback<Array<string>>): void;

### `function on(type: 'bluetoothScanResultChange', callback: Callback<BluetoothScanResult>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'bondStateChange', callback: Callback<BondStateParam>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：function on(type: 'bondStateChange', callback: Callback<BondStateParam>): void;

### `function on(type: 'brightnessInfoChange', callback: BrightnessCallback<number, BrightnessInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'cachedGnssLocationsChange', request: CachedGnssLocationsRequest, callback: Callback<Array<Location>>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'callStateChangeEx', callback: Callback<TelCallState>, options?: ObserverOptions): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'channelStateChange', channelId: number, callback: Callback<ChannelStateInfo>): void`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'complete', callback: Callback<DownloadCompletedInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'connect', sessionId: number, callback: Callback<EventCallbackInfo>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'connectNotify', callback: Callback<ConnectNotification>): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `权限变更`：function on(type: 'connectNotify', callback: Callback<ConnectNotification>): void;

### `function on(type: 'connectionStateChange', callback: Callback<ConnectionStateParam>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'connectionStateChanged', callback: Callback<ConnectionResult>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'continuousTaskActive', callback: Callback<ContinuousTaskActiveInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'continuousTaskCancel', callback: Callback<ContinuousTaskCancelInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'continuousTaskSuspend', callback: Callback<ContinuousTaskSuspendInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'deviceConnect', callback: Callback<ContinuationResult>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'deviceDisconnect', callback: Callback<string>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'deviceFound', callback: Callback<Array<ScanResults>>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'deviceSelected', token: number, callback: Callback<Array<ContinuationResult>>): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.2(22)] `API废弃版本变更`：function on(type: 'deviceSelected', token: number, callback: Callback<Array<ContinuationResult>>): void;

### `function on(type: 'deviceStateChanged', callback: Callback<DeviceInfo>, scope: Array<DeviceInfoType>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'deviceUnselected', token: number, callback: Callback<Array<ContinuationResult>>): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.2(22)] `API废弃版本变更`：function on(type: 'deviceUnselected', token: number, callback: Callback<Array<ContinuationResult>>): void;

### `function on(type: 'disconnect', sessionId: number, callback: Callback<EventCallbackInfo>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'discovery', callback: Callback<DiscoveryResult>): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `权限变更`：function on(type: 'discovery', callback: Callback<DiscoveryResult>): void;

### `function on(type: 'discoveryResult', callback: Callback<Array<DiscoveryResult>>): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：function on(type: 'discoveryResult', callback: Callback<Array<DiscoveryResult>>): void;

### `function on(type: 'distributedMessageReceive', callee: Callee, callback: DistributedMessageCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'dlpAntiPeep', callback: Callback<DlpAntiPeepStatus>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'doubleTap', receiver: Callback<DoubleTapEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'downloadCancel', callback: Callback<DownloadCancelData>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'downloadComplete', callback: Callback<DownloadCompleteData>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'downloadProgress', callback: Callback<DownloadProgressData>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'downloadStart', callback: Callback<DownloadStartData>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'downloadStatus', callback: Callback<DownloadStatusData>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'error', callback: Callback<ReturnResult>): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `权限变更`：function on(type: 'error', callback: Callback<ReturnResult>): void;

### `function on(type: 'fail', callback: Callback<DownloadFailedInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'filePreloadStateChanged', callback: Callback<FilePreloadStatusInfo>): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `API废弃版本变更`：function on(type: 'filePreloadStateChanged', callback: Callback<FilePreloadStatusInfo>): void;

### `function on(type: 'foldAngleChange', callback: Callback<Array<number>>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：function on(type: 'foldAngleChange', callback: Callback<Array<number>>): void;

### `function on(type: 'foldDisplayModeChange', callback: Callback<FoldDisplayMode>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：function on(type: 'foldDisplayModeChange', callback: Callback<FoldDisplayMode>): void;

### `function on(type: 'foldStatusChange', callback: Callback<FoldStatus>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：function on(type: 'foldStatusChange', callback: Callback<FoldStatus>): void;

### `function on(type: 'freeze', observer: FreezeObserver): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'globalErrorOccurred', observer: GlobalObserver): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'globalUnhandledRejectionDetected', observer: GlobalObserver): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'handoverChange', callback: Callback<HandoverInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'holdingHandChanged', callback: Callback<HoldingHandStatus>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'hotkeyChange', hotkeyOptions: HotkeyOptions, callback: Callback<HotkeyOptions>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'hotspotStateChange', callback: Callback<number>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'keyPressed', options: KeyPressedConfig, callback: Callback<KeyEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'locationChange', request: LocationRequest | ContinuousLocationRequest, callback: Callback<Location>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'miniGameAddictionPrevented', callback: Callback<string>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'multiPathRecommendation', callback: Callback<MultiPathRecommendationInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'multiPathStateChange', callback: Callback<MultiPathStateInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'netQosChange', callback: Callback<Array<NetworkQos>>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'netSceneChange', callback: Callback<Array<NetworkScene>>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'operatingHandChanged', callback: Callback<OperatingHandStatus>): void`  ⚠️ 高风险  （变更 5 条 [ArkTS 5 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `权限变更`：function on(type: 'operatingHandChanged', callback: Callback<OperatingHandStatus>): void;
- [ArkTS] [26.0.0 Beta2] `权限变更`：function on(type: 'operatingHandChanged', callback: Callback<OperatingHandStatus>): void;

### `function on(type: 'operationSubmitMetadata', bundleName: string, callback: Callback<number>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'pairingStateChange', callback: Callback<PairingStateParam>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'pause', callback: Callback<AssetDownloadTask>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'pinRequired', callback: Callback<PinRequiredParam>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：function on(type: 'pinRequired', callback: Callback<PinRequiredParam>): void;

### `function on(type: 'prepareContinue', context: Context, callback: AsyncCallback<ContinueResultInfo>): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'printerChange', callback: PrinterChangeCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'progress', callback: Callback<DownloadProgressInfo\[\]>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'readData', callback: Callback<DataParams>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'readProgress', callback: Callback<ReadProgress>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'readerModeWithInterval', elementName: ElementName, discTech: number\[\], callback: Callback<TagInfo>, interval: number): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'receiveData', channelId: number, callback: Callback<DataInfo>): void`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'receiveData', sessionId: number, callback: Callback<EventCallbackInfo>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'receiveMessage', sessionId: number, callback: Callback<EventCallbackInfo>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'receivePackageInfo', callback: Callback<PackageInfo>): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `权限变更`：function on(type: 'receivePackageInfo', callback: Callback<PackageInfo>): void;

### `function on(type: 'requestMore', callback: Callback<string>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'rightMenuClick', callback: Callback<emitter.EventData>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'scanDeviceFound', callback: Callback<ScannerDevice>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'scanDeviceSync', callback: Callback<ScannerSyncDevice>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'screenReaderStateChange', callback: Callback<boolean>): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `API卡片权限变更`：function on(type: 'screenReaderStateChange', callback: Callback<boolean>): void;

### `function on(type: 'selectionCompleted', callback: Callback<SelectionInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'sensorStatusChange', callback: Callback<SensorStatusEvent>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'serviceDie', callback: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'squeeze', receiver: Callback<SqueezeEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'stateChange', callback: Callback<BluetoothState>): void`  ⚠️ 高风险  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [5.1.0(18)] `权限变更`：function on(type: 'stateChange', callback: Callback<BluetoothState>): void;
- [ArkTS] [26.0.0 Beta2] `权限变更`：function on(type: 'stateChange', callback: Callback<BluetoothState>): void;

### `function on(type: 'stateChange', callback: Callback<NearlinkState>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'stateChanged', callback: Callback<ServiceState>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'statusBarIconClick', callback: Callback<emitter.EventData>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'steadyStandingDetect', callback: Callback<SteadyStandingStatus>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'superPrivacyModeChange', callback: Callback<SuperPrivacyMode>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'tokenUpdate', ability: Ability, callback: Callback<string>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'touchGuideStateChange', callback: Callback<boolean>): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `API卡片权限变更`：function on(type: 'touchGuideStateChange', callback: Callback<boolean>): void;

### `function on(type: 'touchModeChange', callback: Callback<string>): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `API卡片权限变更`：function on(type: 'touchModeChange', callback: Callback<string>): void;

### `function on(type: 'transferNotify', callback: Callback<TransferNotification>): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `权限变更`：function on(type: 'transferNotify', callback: Callback<TransferNotification>): void;

### `function on(type: 'updateChange', callback: Callback<UpdateSessionState>, timeout?: number): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: 'userAgeGroupDetected', callback: Callback<UserClassification>): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.1(24)] `API废弃版本变更`：function on(type: 'userAgeGroupDetected', callback: Callback<UserClassification>): void;

### `function on(type: 'vibratorStateChange', callback: Callback<VibratorStatusEvent>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function on(type: SensorId.FUSION_PRESSURE, callback: Callback<FusionPressureResponse>, options?: Options): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function stop(): Promise<void>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function unbind(floatViewController: FloatViewController, floatingBallController: floatingBall.FloatingBallController): Promise<void>`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `getColorSync(resource: Resource): number`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：getColorSync(resource: Resource): number;

### `getUIContext(): UIContext`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `host: string`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `host?: string`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface BrightnessInfo`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface Position`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface RelativePosition`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface RoundedCorner`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface VirtualScreenConfig`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage: LocalStorage): Promise<void>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage: LocalStorage, callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage?: LocalStorage): Promise<void>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `measureText(text: string, encoding: TextEncoding): number`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：measureText(text: string, encoding: TextEncoding): number;

### `off(event: 'batchDownload', callback?: Callback<MultiDownloadProgress>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(event: 'completed', callback?: (progress: Progress) => void): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(event: 'dataChange', uris: string\[\], config: DataProxyConfig, callback?: AsyncCallback<DataProxyChangeInfo\[\]>): DataProxyResult\[\]`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(event: 'failed', callback?: (progress: Progress) => void): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(event: 'faultOccur', callback?: Callback<Faults>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(event: 'pause', callback?: (progress: Progress) => void): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：off(event: 'pause', callback?: (progress: Progress) => void): void;

### `off(event: 'perfStat', observer?: Callback<SqlExecutionInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(event: 'progress', callback?: (progress: Progress) => void): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(event: 'remove', callback?: (progress: Progress) => void): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：off(event: 'remove', callback?: (progress: Progress) => void): void;

### `off(event: 'response', callback?: Callback<HttpResponse>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：off(event: 'response', callback?: Callback<HttpResponse>): void;

### `off(event: 'resume', callback?: (progress: Progress) => void): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：off(event: 'resume', callback?: (progress: Progress) => void): void;

### `off(event: 'sqliteErrorOccurred', observer?: Callback<ExceptionMessage>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(event: 'statistics', observer?: Callback<SqlExecutionInfo>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：off(event: 'statistics', observer?: Callback<SqlExecutionInfo>): void;

### `off(event: 'wait', callback?: Callback<WaitingReason>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(event: string, callback?: Callback<emitter.EventData>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(eventId: string): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(eventId: string, callback: Callback<EventData>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(eventType: 'uiExtensionSecureLimitChange', callback?: Callback<boolean>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(eventType: 'windowStageClose', callback?: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(eventType: 'windowStageLifecycleEvent', callback?: Callback<WindowStageLifecycleEventType>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: "headerReceive", callback?: AsyncCallback<Object>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `API废弃版本变更`：off(type: "headerReceive", callback?: AsyncCallback<Object>): void;

### `off(type: 'BLECharacteristicChange', callback?: Callback<BLECharacteristic>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：off(type: 'BLECharacteristicChange', callback?: Callback<BLECharacteristic>): void;

### `off(type: 'BLEConnectionStateChange', callback?: Callback<BLEConnectChangedState>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：off(type: 'BLEConnectionStateChange', callback?: Callback<BLEConnectChangedState>): void;

### `off(type: 'BLEDeviceFind', callback?: Callback<ScanReport>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'activeStatusChange', callback?: Callback<boolean>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'afterPanEnd', callback?: PanListenerCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'afterPanStart', callback?: PanListenerCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'agentDialogClosed', callback?: Callback<void>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'agentDialogOpened', callback?: Callback<void>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'amplitudeUpdate', callback?: Callback<Array<Number>>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'appVolumeChange', callback?: Callback<VolumeEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'attachOptionsDidChange', callback?: Callback<AttachOptions>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'audioCapturerChange'): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'audioCapturerChange', callback?: Callback<AudioCapturerChangeInfoArray>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'audioInterrupt', callback?: Callback<InterruptEvent>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'audioRendererChange'): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'audioRendererChange', callback?: Callback<AudioRendererChangeInfoArray>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'audioSceneChange', callback?: Callback<AudioScene>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'audioSessionDeactivated', callback?: Callback<AudioSessionDeactivatedEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'audioSessionStateChanged', callback?: Callback<AudioSessionStateChangedEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'authTip', callback?: AuthTipCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'autoDeviceSwitchStatusChange', callback?: AsyncCallback<AutoDeviceSwitchStatus>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'availableAreaChange', callback?: Callback<Rect>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'availableDeviceChange', callback?: Callback<DeviceChangeAction>): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.1.0(18)] `接口行为变更`：音频框架识别USB音频设备类型行为变更：audio.AudioRoutingManager.off

### `off(type: 'avoidAreaChange', callback?: Callback<AvoidAreaInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'beforePanEnd', callback?: PanListenerCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'beforePanStart', callback?: PanListenerCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'bitrateDone', callback?: Callback<number>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'callingDisplayDidChange', callback?: Callback<number>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'cameraOcclusionDetection', callback?: AsyncCallback<CameraOcclusionDetectionResult>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'cameraStatus', callback?: AsyncCallback<CameraStatusInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'cancel', callback?: Callback<string>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'captureEnd', callback?: AsyncCallback<CaptureEndInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'captureReady', callback?: AsyncCallback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'captureStartWithInfo', callback?: AsyncCallback<CaptureStartInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'castControlAudioRendererError', callback?: ErrorCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'castControlDecodingError', callback?: ErrorCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'castControlDrmError', callback?: ErrorCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'castControlGenericError', callback?: ErrorCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'castControlIoError', callback?: ErrorCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'castControlParsingError', callback?: ErrorCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'change', callback?: (sessionId: string, fields: Array<string>) => void): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'characteristicRead', callback?: Callback<CharacteristicReadRequest>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：off(type: 'characteristicRead', callback?: Callback<CharacteristicReadRequest>): void;

### `off(type: 'characteristicWrite', callback?: Callback<CharacteristicWriteRequest>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：off(type: 'characteristicWrite', callback?: Callback<CharacteristicWriteRequest>): void;

### `off(type: 'click', callback?: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'close', callback?: ClientConnectionCloseCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'complete', callback?: Callback<VoiceInfo>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'complete', callback?: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'connect', callback?: Callback<WebSocketConnection>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'connectResult', callback?: Callback<ConnectResult>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'connectStateChange', callback?: Callback<BLEConnectChangedState>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：off(type: 'connectStateChange', callback?: Callback<BLEConnectChangedState>): void;

### `off(type: 'connectionAccepted', callback?: Callback<Connection>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'connectionStateChange', callback?: Callback<ConnectionChangeState>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'connectionStateChange', callback?: Callback<StateChangeParam>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：off(type: 'connectionStateChange', callback?: Callback<StateChangeParam>): void;

### `off(type: 'controlCenterEffectStatusChange', callback?: AsyncCallback<ControlCenterStatusInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'controllerAttachStateChange', callback?: Callback<ControllerAttachState>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'currentInputDeviceChanged', callback?: Callback<CurrentInputDeviceChangedEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'currentOutputDeviceChanged', callback?: Callback<CurrentOutputDeviceChangedEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'cursorMoveInText', callback?: ErrorCallback): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'cursorMoveOutText', callback?: ErrorCallback): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'customDataChange', callback?: Callback<Record<string, Object>>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'dataChange', keys: Array<string>, callback?: Callback<Record<string, ValueType>>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：off(type: 'dataChange', keys: Array<string>, callback?: Callback<Record<string, ValueType>>): void;

### `off(type: 'dataReceived', callback?: Callback<ArrayBuffer>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'descriptorRead', callback?: Callback<DescriptorReadRequest>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：off(type: 'descriptorRead', callback?: Callback<DescriptorReadRequest>): void;

### `off(type: 'descriptorWrite', callback?: Callback<DescriptorWriteRequest>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：off(type: 'descriptorWrite', callback?: Callback<DescriptorWriteRequest>): void;

### `off(type: 'destroyed', callback?: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'discardTypingText', callback?: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'disconnected', callback?: Callback<number>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'displayIdChange', callback?: Callback<number>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'drawChildren', callback?: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'durationUpdate', callback?: Callback<number>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'endOfStream', callback?: Callback<void>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'error', callback?: ErrorCallback): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'error', callback?: ErrorCallback<BusinessError>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'error', camera: CameraDevice, callback?: ErrorCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'errorOccurred', callback?: Callback<ErrorInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'estimatedCaptureDuration', callback?: AsyncCallback<number>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'finishTextPreview', callback?: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'focusStateChange', callback?: AsyncCallback<FocusState>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'foldStatusChange', callback?: AsyncCallback<FoldStatusInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'frameEnd', callback?: AsyncCallback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'frameMetricsMeasured', callback?: Callback<FrameMetrics>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'frameShutter', callback?: AsyncCallback<FrameShutterInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'frameShutterEnd', callback?: AsyncCallback<FrameShutterEndInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'frameStart', callback?: AsyncCallback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'freeWindowModeChange', callback?: Callback<boolean>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'hceCmd', callback?: AsyncCallback<number\[\]>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'hidden', callback?: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'imageArrival', callback?: AsyncCallback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'imageRelease', callback?: AsyncCallback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'indoorMapEnter', callback?: Callback<IndoorMapInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'indoorMapExit', callback?: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'inputStart', callback?: (kbController: KeyboardController, textInputClient: TextInputClient) => void): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `API废弃版本变更`：off(type: 'inputStart', callback?: (kbController: KeyboardController, textInputClient: TextInputClient) => void): void;

### `off(type: 'keyboardDidHide', callback?: Callback<KeyboardInfo>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'keyboardDidShow', callback?: Callback<KeyboardInfo>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'keyboardShow' | 'keyboardHide', callback?: () => void): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `API废弃版本变更`：off(type: 'keyboardShow' | 'keyboardHide', callback?: () => void): void;

### `off(type: 'keyboardWillHide', callback?: Callback<KeyboardInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'keyboardWillShow', callback?: Callback<KeyboardInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'kiaCompress', callback?: Callback<string>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'kiaCopy', callback?: Callback<string>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'kiaRename', callback?: Callback<string>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'macroStatusChanged', callback?: AsyncCallback<boolean>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'markReach'): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'markerClusterClick', callback?: Callback<MarkerClusterInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'massPointOverlayClick', callback?: MassPointOverlayCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'messageReceive', callback?: Callback<WebSocketMessage>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'metadataObjectsAvailable', callback?: AsyncCallback<Array<MetadataObject>>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'micBlockStatusChanged', callback?: Callback<DeviceBlockStatusInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'mtuChange', callback?: Callback<number>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'navDestinationUpdateByUniqueId', navigationUniqueId: number, callback?: Callback<observer.NavDestinationInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'nodeRenderState', nodeIdentity: NodeIdentity, callback?: NodeRenderStateChangeCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'objectSearchPanelVisibilityChange', callback?: Callback<ObjectSearchPanelVisibility>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'occlusionStateChanged', callback?: Callback<OcclusionState>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'onAttach', callback?: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'onDetach', callback?: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'openInfo', callback?: AsyncCallback<WebSocketOpenInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'periodReach'): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'photoAlbumChange', callback?: Callback<AlbumChangeInfos>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'photoAssetAvailable', callback?: AsyncCallback<photoAccessHelper.PhotoAsset>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'photoAvailable', callback?: AsyncCallback<Photo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'photoChange', callback?: Callback<PhotoAssetChangeInfos>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'pickerStateChange', callback?: Callback<AVCastPickerState>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'pipWindowSizeChange', callback?: Callback<PiPWindowSize>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'playFinishedWithStreamId'): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'playFromAssetId', callback?: (assetId: number) => void): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：off(type: 'playFromAssetId', callback?: (assetId: number) => void): void;

### `off(type: 'playWithAssetId', callback?: Callback<string>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'playbackRateDone', callback?: OnPlaybackRateDone): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'progress', callback?: Callback<string>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'progressChanged', callback?: ProgressObserver): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'progressUpdate', callback?: Callback<number>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'propertyChange', callback?: Callback<Property>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'propertyRead', callback?: Callback<PropertyReadRequest>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'propertyWrite', callback?: Callback<PropertyWriteRequest>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'rectChange', callback?: Callback<RectChangeOptions>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'rectChangeInGlobalDisplay', callback?: Callback<RectChangeOptions>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'ringerModeChange', callback?: Callback<AudioRingMode>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'rotationChange', callback?: RotationChangeCallback<RotationChangeInfo, RotationChangeResult | void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'screenshotAppEvent', callback?: Callback<ScreenshotEventType>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'seiMessageReceived', payloadTypes?: Array<number>, callback?: OnSeiMessageHandle): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'selfPermissionStateChange', permissionList: Array<Permissions>, callback?: Callback<PermissionStateChangeInfo>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'serverStopped', callback?: Callback<number>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'serviceChange', callback?: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'setPreviewText', callback?: SetPreviewTextCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'setTargetLoopMode', callback?: Callback<LoopMode>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'shareCompleted', callback?: Callback<ShareOperationResult>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'sizeChange', callback?: Callback<window.Size>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'smartMobilityEvent', smartMobilityTypes: SmartMobilityType\[\], callback?: Callback<SmartMobilityEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'smartMobilityStatus', smartMobilityTypes: SmartMobilityType\[\], callback?: Callback<SmartMobilityInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'smoothZoomInfoAvailable', callback?: AsyncCallback<SmoothZoomInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'spatializationEnabledChangeForCurrentDevice', callback?: Callback<boolean>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'speedDone', callback?: Callback<number>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'start', callback?: Callback<string>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'startRenderFrame', callback?: Callback<void>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'stateChange', callback?: Callback<AudioState>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'stateChange', callback?: Callback<FloatingBallState>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'status', callback?: (sessionId: string, networkId: string, status: 'online' | 'offline') => void): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'statusChange', callback?: Callback<AudioLoopbackStatus>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'streamVolumeChange', callback?: Callback<StreamVolumeEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'superResolutionChanged', callback?: OnSuperResolutionChanged): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'systemDensityChange', callback?: Callback<number>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'systemPressureLevelChange', callback?: AsyncCallback<SystemPressureLevel>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'tabChange', callback?: Callback<observer.TabContentInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'tabChange', config: observer.ObserverOptions, callback?: Callback<observer.TabContentInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'textChange', callback?: Callback<observer.TextChangeEventInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'textChange', identity: observer.ObserverOptions, callback?: Callback<observer.TextChangeEventInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'torchStatusChange', callback?: AsyncCallback<TorchStatusInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'volumeChange', callback?: Callback<VolumeEvent>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：off(type: 'volumeChange', callback?: Callback<VolumeEvent>): void;

### `off(type: 'volumeChange', callback?: Callback<number>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'windowHighlightChange', callback?: Callback<boolean>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'windowSizeChange', callback?: Callback<window.Size>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'windowSizeLayoutBreakpointChange', callback?: Callback<observer.WindowSizeLayoutBreakpointInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'windowStatusDidChange', callback?: Callback<WindowStatusType>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: 'windowWillClose', callback?: Callback<void, Promise<boolean>>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off(type: string, listener?: WorkerEventListener): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `off<T>(eventId: string, callback: Callback<GenericEventData<T>>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(event: 'batchDownload', callback: Callback<MultiDownloadProgress>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(event: 'completed', callback: (progress: Progress) => void): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(event: 'dataChange', uris: string\[\], config: DataProxyConfig, callback: AsyncCallback<DataProxyChangeInfo\[\]>): DataProxyResult\[\]`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(event: 'failed', callback: (progress: Progress) => void): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(event: 'faultOccur', callback: Callback<Faults>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(event: 'pause', callback: (progress: Progress) => void): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：on(event: 'pause', callback: (progress: Progress) => void): void;

### `on(event: 'perfStat', observer: Callback<SqlExecutionInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(event: 'progress', callback: (progress: Progress) => void): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(event: 'remove', callback: (progress: Progress) => void): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：on(event: 'remove', callback: (progress: Progress) => void): void;

### `on(event: 'response', callback: Callback<HttpResponse>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：on(event: 'response', callback: Callback<HttpResponse>): void;

### `on(event: 'resume', callback: (progress: Progress) => void): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：on(event: 'resume', callback: (progress: Progress) => void): void;

### `on(event: 'sqliteErrorOccurred', observer: Callback<ExceptionMessage>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(event: 'statistics', observer: Callback<SqlExecutionInfo>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：on(event: 'statistics', observer: Callback<SqlExecutionInfo>): void;

### `on(event: 'wait', callback: Callback<WaitingReason>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(event: string, callback: Callback<emitter.EventData>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(eventId: string, callback: Callback<EventData>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(eventType: 'uiExtensionSecureLimitChange', callback: Callback<boolean>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(eventType: 'windowStageClose', callback: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(eventType: 'windowStageLifecycleEvent', callback: Callback<WindowStageLifecycleEventType>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: "headerReceive", callback: AsyncCallback<Object>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `API废弃版本变更`：on(type: "headerReceive", callback: AsyncCallback<Object>): void;

### `on(type: 'BLECharacteristicChange', callback: Callback<BLECharacteristic>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：on(type: 'BLECharacteristicChange', callback: Callback<BLECharacteristic>): void;

### `on(type: 'BLEConnectionStateChange', callback: Callback<BLEConnectChangedState>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：on(type: 'BLEConnectionStateChange', callback: Callback<BLEConnectChangedState>): void;

### `on(type: 'BLEDeviceFind', callback: Callback<ScanReport>): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：on(type: 'BLEDeviceFind', callback: Callback<ScanReport>): void;

### `on(type: 'accountChange', owners: Array<string>, callback: Callback<Array<AppAccountInfo>>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'activeStatusChange', callback: Callback<boolean>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'afterPanEnd', callback: PanListenerCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'afterPanStart', callback: PanListenerCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'agentDialogClosed', callback: Callback<void>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'agentDialogOpened', callback: Callback<void>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'amplitudeUpdate', callback: Callback<Array<Number>>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'appVolumeChange', callback: Callback<VolumeEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'attachOptionsDidChange', callback: Callback<AttachOptions>): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'audioSceneChange', callback: Callback<AudioScene>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'audioSessionDeactivated', callback: Callback<AudioSessionDeactivatedEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'audioSessionStateChanged', callback: Callback<AudioSessionStateChangedEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'authTip', callback: AuthTipCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'autoDeviceSwitchStatusChange', callback: AsyncCallback<AutoDeviceSwitchStatus>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'availableAreaChange', callback: Callback<Rect>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'availableDeviceChange', deviceUsage: DeviceUsage, callback: Callback<DeviceChangeAction>): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.1.0(18)] `接口行为变更`：音频框架识别USB音频设备类型行为变更：audio.AudioRoutingManager.on

### `on(type: 'avoidAreaChange', callback: Callback<AvoidAreaInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'beforePanEnd', callback: PanListenerCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'beforePanStart', callback: PanListenerCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'callingDisplayDidChange', callback: Callback<number>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'cameraOcclusionDetection', callback: AsyncCallback<CameraOcclusionDetectionResult>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'cameraStatus', callback: AsyncCallback<CameraStatusInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'cancel', callback: Callback<string>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'captureEnd', callback: AsyncCallback<CaptureEndInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'captureReady', callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'captureStartWithInfo', callback: AsyncCallback<CaptureStartInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'castControlAudioRendererError', callback: ErrorCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'castControlDecodingError', callback: ErrorCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'castControlDrmError', callback: ErrorCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'castControlGenericError', callback: ErrorCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'castControlIoError', callback: ErrorCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'castControlParsingError', callback: ErrorCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'change', callback: (sessionId: string, fields: Array<string>) => void): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'characteristicRead', callback: Callback<CharacteristicReadRequest>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：on(type: 'characteristicRead', callback: Callback<CharacteristicReadRequest>): void;

### `on(type: 'characteristicWrite', callback: Callback<CharacteristicWriteRequest>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：on(type: 'characteristicWrite', callback: Callback<CharacteristicWriteRequest>): void;

### `on(type: 'click', callback: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'close', callback: ClientConnectionCloseCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'complete', callback: Callback<VoiceInfo>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'complete', callback: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'connect', callback: Callback<WebSocketConnection>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'connectResult', callback: Callback<ConnectResult>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'connectStateChange', callback: Callback<BLEConnectChangedState>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：on(type: 'connectStateChange', callback: Callback<BLEConnectChangedState>): void;

### `on(type: 'connectionAccepted', callback: Callback<Connection>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'connectionStateChange', callback: Callback<BLEConnectionChangeState>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：on(type: 'connectionStateChange', callback: Callback<BLEConnectionChangeState>): void;

### `on(type: 'connectionStateChange', callback: Callback<ConnectionChangeState>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'connectionStateChange', callback: Callback<StateChangeParam>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：on(type: 'connectionStateChange', callback: Callback<StateChangeParam>): void;

### `on(type: 'controlCenterEffectStatusChange', callback: AsyncCallback<ControlCenterStatusInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'controllerAttachStateChange', callback: Callback<ControllerAttachState>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'currentInputDeviceChanged', callback: Callback<CurrentInputDeviceChangedEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'currentOutputDeviceChanged', callback: Callback<CurrentOutputDeviceChangedEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'cursorMoveInText', callback: Callback<void>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'cursorMoveOutText', callback: Callback<void>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'customDataChange', callback: Callback<Record<string, Object>>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'dataChange', keys: Array<string>, callback: Callback<Record<string, ValueType>>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：on(type: 'dataChange', keys: Array<string>, callback: Callback<Record<string, ValueType>>): void;

### `on(type: 'dataReceived', callback: Callback<ArrayBuffer>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'descriptorRead', callback: Callback<DescriptorReadRequest>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：on(type: 'descriptorRead', callback: Callback<DescriptorReadRequest>): void;

### `on(type: 'descriptorWrite', callback: Callback<DescriptorWriteRequest>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `权限变更`：on(type: 'descriptorWrite', callback: Callback<DescriptorWriteRequest>): void;

### `on(type: 'destroyed', callback: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'discardTypingText', callback: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'disconnected', callback: Callback<number>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'displayIdChange', callback: Callback<number>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'drawChildren', callback: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'error', callback: ErrorCallback): void`  ⚠️ 高风险  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.0.2(14)] `接口行为变更`：AVErrorCode枚举值变更：media.AVPlayer.on

### `on(type: 'error', callback: ErrorCallback<BusinessError>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'error', camera: CameraDevice, callback: ErrorCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'errorOccurred', callback: Callback<ErrorInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'estimatedCaptureDuration', callback: AsyncCallback<number>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'finishTextPreview', callback: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'focusStateChange', callback: AsyncCallback<FocusState>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'foldStatusChange', callback: AsyncCallback<FoldStatusInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'frameEnd', callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'frameMetricsMeasured', callback: Callback<FrameMetrics>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'frameShutter', callback: AsyncCallback<FrameShutterInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'frameShutterEnd', callback: AsyncCallback<FrameShutterEndInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'frameStart', callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'freeWindowModeChange', callback: Callback<boolean>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'hceCmd', callback: AsyncCallback<number\[\]>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'hidden', callback: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'indoorMapEnter', callback: Callback<IndoorMapInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'indoorMapExit', callback: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'inputStart', callback: (kbController: KeyboardController, textInputClient: TextInputClient) => void): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `API废弃版本变更`：on(type: 'inputStart', callback: (kbController: KeyboardController, textInputClient: TextInputClient) => void): void;

### `on(type: 'keyboardDidHide', callback: Callback<KeyboardInfo>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'keyboardDidShow', callback: Callback<KeyboardInfo>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'keyboardShow' | 'keyboardHide', callback: () => void): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `API废弃版本变更`：on(type: 'keyboardShow' | 'keyboardHide', callback: () => void): void;

### `on(type: 'keyboardWillHide', callback: Callback<KeyboardInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'keyboardWillShow', callback: Callback<KeyboardInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'kiaCompress', callback: Callback<string>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'kiaCopy', callback: Callback<string>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'kiaRename', callback: Callback<string>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'macroStatusChanged', callback: AsyncCallback<boolean>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'markerClusterClick', callback: Callback<MarkerClusterInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'massPointOverlayClick', callback: MassPointOverlayCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'messageReceive', callback: Callback<WebSocketMessage>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'metadataObjectsAvailable', callback: AsyncCallback<Array<MetadataObject>>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'micBlockStatusChanged', callback: Callback<DeviceBlockStatusInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'mtuChange', callback: Callback<number>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'navDestinationUpdateByUniqueId', navigationUniqueId: number, callback: Callback<observer.NavDestinationInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'nodeRenderState', nodeIdentity: NodeIdentity, callback: NodeRenderStateChangeCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'objectSearchPanelVisibilityChange', callback: Callback<ObjectSearchPanelVisibility>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'occlusionStateChanged', callback: Callback<OcclusionState>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'onAttach', callback: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'onDetach', callback: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'openInfo', callback: AsyncCallback<WebSocketOpenInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'photoAlbumChange', callback: Callback<AlbumChangeInfos>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'photoAssetAvailable', callback: AsyncCallback<photoAccessHelper.PhotoAsset>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'photoAvailable', callback: AsyncCallback<Photo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'photoChange', callback: Callback<PhotoAssetChangeInfos>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'pickerStateChange', callback: Callback<AVCastPickerState>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'pipWindowSizeChange', callback: Callback<PiPWindowSize>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'playFinishedWithStreamId', callback: Callback<number>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'playFromAssetId', callback: (assetId: number) => void): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：on(type: 'playFromAssetId', callback: (assetId: number) => void): void;

### `on(type: 'playWithAssetId', callback: Callback<string>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'playbackRateDone', callback: OnPlaybackRateDone): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'progress', callback: Callback<string>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'progressChanged', callback: ProgressObserver): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'progressUpdate', callback: Callback<number>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'propertyChange', callback: Callback<Property>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'propertyRead', callback: Callback<PropertyReadRequest>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'propertyWrite', callback: Callback<PropertyWriteRequest>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'rectChange', reasons: number, callback: Callback<RectChangeOptions>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'rectChangeInGlobalDisplay', callback: Callback<RectChangeOptions>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'rotationChange', callback: RotationChangeCallback<RotationChangeInfo, RotationChangeResult | void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'screenshot', callback: Callback<void>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.0.3(15)] `接口行为变更`：系统录屏应用调用的截屏接口变更：window.Window.on

### `on(type: 'screenshotAppEvent', callback: Callback<ScreenshotEventType>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'seiMessageReceived', payloadTypes: Array<number>, callback: OnSeiMessageHandle): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'selfPermissionStateChange', permissionList: Array<Permissions>, callback: Callback<PermissionStateChangeInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'serverStopped', callback: Callback<number>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'serviceChange', callback: Callback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'setPreviewText', callback: SetPreviewTextCallback): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'setTargetLoopMode', callback: Callback<LoopMode>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'shareCompleted', callback: Callback<ShareOperationResult>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'sizeChange', callback: Callback<window.Size>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'smartMobilityEvent', smartMobilityTypes: SmartMobilityType\[\], callback: Callback<SmartMobilityEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'smartMobilityStatus', smartMobilityTypes: SmartMobilityType\[\], callback: Callback<SmartMobilityInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'smoothZoomInfoAvailable', callback: AsyncCallback<SmoothZoomInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'spatializationEnabledChangeForCurrentDevice', callback: Callback<boolean>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'start', callback: Callback<string>): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'stateChange', callback: Callback<FloatingBallState>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'status', callback: (sessionId: string, networkId: string, status: 'online' | 'offline') => void): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'statusChange', callback: Callback<AudioLoopbackStatus>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'streamVolumeChange', streamUsage: StreamUsage, callback: Callback<StreamVolumeEvent>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'superResolutionChanged', callback: OnSuperResolutionChanged): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'systemDensityChange', callback: Callback<number>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'systemPressureLevelChange', callback: AsyncCallback<SystemPressureLevel>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'tabChange', callback: Callback<observer.TabContentInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'tabChange', config: observer.ObserverOptions, callback: Callback<observer.TabContentInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'textChange', callback: Callback<observer.TextChangeEventInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'textChange', identity: observer.ObserverOptions, callback: Callback<observer.TextChangeEventInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'torchStatusChange', callback: AsyncCallback<TorchStatusInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'volumeChange', callback: Callback<VolumeEvent>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：on(type: 'volumeChange', callback: Callback<VolumeEvent>): void;

### `on(type: 'windowHighlightChange', callback: Callback<boolean>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'windowSizeChange', callback: Callback<window.Size>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'windowSizeLayoutBreakpointChange', callback: Callback<observer.WindowSizeLayoutBreakpointInfo>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'windowStatusChange', callback: Callback<WindowStatusType>): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.0.2(14)] `接口行为变更`：在PC/2in1设备上getWindowStatus和on('windowStatusChange')接口在窗口最大化状态返回值变更：window.Window.on

### `on(type: 'windowStatusDidChange', callback: Callback<WindowStatusType>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: 'windowWillClose', callback: Callback<void, Promise<boolean>>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on(type: string, listener: WorkerEventListener): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on<T>(eventId: string, callback: Callback<GenericEventData<T>>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `on?: On`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `onAreaChange(event: (oldValue: Area, newValue: Area) => void): T`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `onChange?: (value: Date) => void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `onStart(requestId: string, response: StartResponse): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `onStart(strategyName: string): Promise<void>`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `onStop(requestId: string, response: StopResponse): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `onStop(strategyName: string): Promise<void>`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `onStop?: OnStopFn`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `selectedColor(value: ResourceColor): SliderAttribute`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `setColorMode(colorMode: ConfigurationConstant.ColorMode): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `space(space: LengthMetrics): DotIndicator`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `start(): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `接口行为变更`：@ohos.useriam.userAuth限制应用从后台发起带交互界面的身份认证变更：userAuth.UserAuthInstance.start（共 2 处调用点）

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


### `static measureText(options: MeasureOptions): number`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.1.0(18)] `API废弃版本变更`：static measureText(options: MeasureOptions): number;

### `stop(): Promise<boolean>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `stop(): Promise<void>`  ℹ️ 关注  （变更 9 条 [ArkTS 9 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `stop(): void`  ⚠️ 高风险  （变更 18 条 [ArkTS 18 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：stop(): void;（共 3 处调用点）

### `stop(callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `text?: LocationDescription`  ⚠️ 高风险  （变更 7 条 [ArkTS 7 / C++ 0]，其中高影响 7 条 [ArkTS 7 / C++ 0]）

- [ArkTS] [6.0.0(20)] `接口废弃变更`：位置控件功能变更：LocationButtonOptions.text（共 7 处调用点）

### `text?: PasteDescription`  ⚠️ 高风险  （变更 7 条 [ArkTS 7 / C++ 0]，其中高影响 7 条 [ArkTS 7 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：内置文本的组件文本样式优化：PasteButtonOptions.text（共 7 处调用点）

### `text?: SaveDescription`  ⚠️ 高风险  （变更 7 条 [ArkTS 7 / C++ 0]，其中高影响 7 条 [ArkTS 7 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：内置文本的组件文本样式优化：SaveButtonOptions.text（共 7 处调用点）

### `type LocationButtonCallback = (event: ClickEvent, result: LocationButtonOnClickResult, error?: BusinessError<void>) => void`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 6 条 [ArkTS 6 / C++ 0]）

- [ArkTS] [6.0.0(20)] `接口废弃变更`：位置控件功能变更：unnamed.LocationButtonCallback（共 6 处调用点）

### `unbind(): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `windowStage: window.WindowStage`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.1(21)] `API跨平台权限变更`：windowStage: window.WindowStage;

### `windowStage?: window.WindowStage`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


---
*本文档由 hoscanner 的 UpgradeAdvisor 自动生成。*