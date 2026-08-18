# HarmonyOS 升级评估与行动建议（AI 辅助）

> 生成方式：确定性规则引擎（未配置 / 未启用 LLM，或 LLM 调用失败后的回退）。升级窗口 API 12 → 26。

## 一、总体结论

- 使用的系统 API：18 个
- 升级区间内变更条目：系统 API 4668 条，行为变更 884 条，合计 5552 条
- 高影响变更（删除 / 废弃 / 行为变更 / UX 变更）：**646 条**
- 需关注变更（函数 / 接口定义变更）：**3867 条**
- 语言分解：ArkTS **5552** / C++ **0**（高影响：ArkTS 646 / C++ 0）

## 二、变更按版本分布

| 版本 | 变更数 |
|------|--------|
| 5.0.1(13) | 162 |
| 5.0.2(14) | 186 |
| 5.0.3(15) | 210 |
| 5.0.4(16) | 26 |
| 5.0.5(17) | 14 |
| 5.1.0(18) | 1093 |
| 5.1.1(19) | 137 |
| 6.0.0(20) | 993 |
| 6.0.1(21) | 91 |
| 6.0.2(22) | 266 |
| 6.1.0(23) | 854 |
| 6.1.1(24) | 78 |
| 26.0.0 Beta2 | 760 |
| 26.0.0(26) | 682 |

## 三、高影响变更清单（需优先处理）

| API | 版本 | 类型 | 语言 | 内容 | 来源 |
|-----|------|------|------|------|------|
| `MODE_AUTO = -1 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_AUTO = -1 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `MODE_DARK = 0 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_DARK = 0 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `MODE_LIGHT = 1 ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | MODE_LIGHT = 1 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `animateTo(value: AnimateParam, event: () => void): void ×3` | 5.0.1(13) | 接口行为变更 | ArkTS | 动画接口在播放次数为无限循环时的行为变更：UIContext.animateTo | `harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Release.json` |
| `arc(x: number, y: number, radius: number, startAngle: number, endAngle: number, counterclockwise?: boolean): void ×3` | 5.1.0(18) | 接口行为变更 | ArkTS | CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制：CanvasPath.arc | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `barOverlap(value: boolean): TabsAttribute ×2` | 5.0.1(13) | UX视觉布局变更 | ArkTS | Tabs组件barOverlap接口默认效果变更：TabsAttribute.barOverlap | `harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Beta3.json` |
| `baseName: string` | 6.0.0(20) | API废弃版本变更 | ArkTS | baseName: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `bindSheet(isShow: boolean, builder: CustomBuilder, options?: SheetOptions): T ×4` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 内置文本的组件文本样式优化：CommonMethod.bindSheet | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `blendMode(value: BlendMode, type?: BlendApplyType): T` | 5.1.0(18) | 接口行为变更 | ArkTS | XComponent设置为Texture模式使用blendMode接口的行为由不生效变更为正常生效：CommonMethod.blendMode | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `blendMode(value: BlendMode, type?: BlendApplyType): T` | 5.1.0(18) | UX视觉布局变更 | ArkTS | 修复blendMode接口离屏模式会影响组件设置的不透明度的问题：CommonMethod.blendMode | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `borderRadius(value: Length | BorderRadiuses | LocalizedBorderRadiuses): T` | 5.0.2(14) | 接口行为变更 | ArkTS | Image组件的borderRadius接口支持动态修改：CommonMethod.borderRadius | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` |
| `calendar: string` | 6.0.0(20) | API废弃版本变更 | ArkTS | calendar: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `caseFirst: string` | 6.0.0(20) | API废弃版本变更 | ArkTS | caseFirst: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `class Brush ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | class Brush | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `class Canvas ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | class Canvas | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `class ColorFilter ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | class ColorFilter | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `class Font ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | class Font | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `class ImageFilter ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | class ImageFilter | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `class Lattice ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | class Lattice | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `class MaskFilter ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | class MaskFilter | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `class Matrix ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | class Matrix | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `class Path ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | class Path | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `class PathEffect ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | class PathEffect | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `class PathIterator ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | class PathIterator | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `class Pen ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | class Pen | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `class Region ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | class Region | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `class RoundRect ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | class RoundRect | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `class SamplingOptions ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | class SamplingOptions | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `class ShaderEffect ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | class ShaderEffect | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `class ShadowLayer ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | class ShadowLayer | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `class TextBlob ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | class TextBlob | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `class Tool ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | class Tool | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `class Typeface ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | class Typeface | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `close(): Promise<void> ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | close(): Promise<void>; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `close(): void ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | close(): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `close(): void ×3` | 26.0.0 Beta2 | 权限变更 | ArkTS | close(): void; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `collation: string` | 6.0.0(20) | API废弃版本变更 | ArkTS | collation: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `color(value: ResourceColor | LinearGradient): ProgressAttribute<Type>` | 6.1.0(23) | 接口行为变更 | ArkTS | Progress组件color属性设置渐变色规格变更：ProgressAttribute.color | `harmonyos_behavior_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `columns?: number | GridRowColumnOption` | 6.0.0(20) | 接口行为变更 | ArkTS | GridRow组件columns参数和GridCol组件span参数默认值变更：GridRowOptions.columns | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `const CAPTURE_MODE_FRONT_LENS_NIGHT_VIEW: number = 7 ×3` | 26.0.0 Beta2 | 删除API | ArkTS | const CAPTURE_MODE_FRONT_LENS_NIGHT_VIEW: number = 7; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `const CAPTURE_MODE_LIGHT_GRAFFITI: number = 10 ×3` | 26.0.0 Beta2 | 删除API | ArkTS | const CAPTURE_MODE_LIGHT_GRAFFITI: number = 10; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `const CAPTURE_MODE_MOVING_PHOTO: number = 20 ×3` | 26.0.0 Beta2 | 删除API | ArkTS | const CAPTURE_MODE_MOVING_PHOTO: number = 20; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `const CAPTURE_MODE_PANORAMA: number = 8 ×3` | 26.0.0 Beta2 | 删除API | ArkTS | const CAPTURE_MODE_PANORAMA: number = 8; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `const CAPTURE_MODE_PORTRAIT: number = 23 ×3` | 26.0.0 Beta2 | 删除API | ArkTS | const CAPTURE_MODE_PORTRAIT: number = 23; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `const CAPTURE_MODE_PROFESSIONAL: number = 2 ×3` | 26.0.0 Beta2 | 删除API | ArkTS | const CAPTURE_MODE_PROFESSIONAL: number = 2; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `const CAPTURE_MODE_REAR_LENS_NIGHT_VIEW: number = 42 ×3` | 26.0.0 Beta2 | 删除API | ArkTS | const CAPTURE_MODE_REAR_LENS_NIGHT_VIEW: number = 42; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `const CAPTURE_MODE_SILKY_WATER: number = 11 ×3` | 26.0.0 Beta2 | 删除API | ArkTS | const CAPTURE_MODE_SILKY_WATER: number = 11; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `const CAPTURE_MODE_SNAP_SHOT: number = 62 ×3` | 26.0.0 Beta2 | 删除API | ArkTS | const CAPTURE_MODE_SNAP_SHOT: number = 62; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `const CAPTURE_MODE_STAR_TRACK: number = 12 ×3` | 26.0.0 Beta2 | 删除API | ArkTS | const CAPTURE_MODE_STAR_TRACK: number = 12; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `const CAPTURE_MODE_SUPER_MACRO: number = 47 ×3` | 26.0.0 Beta2 | 删除API | ArkTS | const CAPTURE_MODE_SUPER_MACRO: number = 47; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `const CAPTURE_MODE_TAIL_LIGHT: number = 9 ×3` | 26.0.0 Beta2 | 删除API | ArkTS | const CAPTURE_MODE_TAIL_LIGHT: number = 9; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `const CAPTURE_MODE_WIDEAPERTURE: number = 19 ×3` | 26.0.0 Beta2 | 删除API | ArkTS | const CAPTURE_MODE_WIDEAPERTURE: number = 19; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `const XMAGE_WATERMARK_MODE_AT_THE_BOTTOM: number = 9 ×3` | 26.0.0 Beta2 | 删除API | ArkTS | const XMAGE_WATERMARK_MODE_AT_THE_BOTTOM: number = 9; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `const XMAGE_WATERMARK_MODE_BORDER: number = 10 ×3` | 26.0.0 Beta2 | 删除API | ArkTS | const XMAGE_WATERMARK_MODE_BORDER: number = 10; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `constructor(comparator?: (firstValue: K, secondValue: K) => boolean)` | 6.0.0(20) | 接口行为变更 | ArkTS | TreeSet/TreeMap扩容导致比较器丢失问题正向修复：TreeMap.constructor | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `constructor(comparator?: (firstValue: T, secondValue: T) => boolean)` | 6.0.0(20) | 接口行为变更 | ArkTS | TreeSet/TreeMap扩容导致比较器丢失问题正向修复：TreeSet.constructor | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `declare const Button: ButtonInterface ×28` | 5.1.0(18) | UX视觉布局变更 | ArkTS | 按钮默认值变更为新增圆角矩形类型：unnamed.Button | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `declare const Button: ButtonInterface ×28` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 内置文本的组件文本样式优化：unnamed.Button | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Button: ButtonInterface ×28` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 表单类组件触摸热区最小高度变更：unnamed.Button | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const NavDestination: NavDestinationInterface` | 5.0.1(13) | UX视觉布局变更 | ArkTS | NavDestination的Dialog模式默认支持系统动画：unnamed.NavDestination | `harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Release.json` |
| `declare const Navigation: NavigationInterface` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 内置文本的组件文本样式优化：unnamed.Navigation | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Select: SelectInterface` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 内置文本的组件文本样式优化：unnamed.Select | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Select: SelectInterface` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 表单类组件触摸热区最小高度变更：unnamed.Select | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Slider: SliderInterface ×2` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 内置文本的组件文本样式优化：unnamed.Slider | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Text: TextInterface ×72` | 26.0.0(26) | UX视觉布局变更 | ArkTS | Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质：unnamed.Text | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const TextClock: TextClockInterface ×2` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 内置文本的组件文本样式优化：unnamed.TextClock | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare const Toggle: ToggleInterface` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 表单类组件触摸热区最小高度变更：unnamed.Toggle | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `declare function animateTo(value: AnimateParam, event: () => void): void ×3` | 5.0.1(13) | 接口行为变更 | ArkTS | 动画接口在播放次数为无限循环时的行为变更：unnamed.animateTo | `harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Release.json` |
| `declare function animateTo(value: AnimateParam, event: () => void): void ×3` | 5.1.0(18) | API废弃版本变更 | ArkTS | declare function animateTo(value: AnimateParam, event: () => void): void; | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` |
| `declare type HdsSceneFinishCallback = () => void ×14` | 6.0.2(22) | API卡片权限变更 | ArkTS | declare type HdsSceneFinishCallback = () => void; | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` |
| `declare type MonitorDecorator = (value: string, ...args: string\[\]) => MethodDecorator ×14` | 6.1.0(23) | API卡片权限变更 | ArkTS | declare type MonitorDecorator = (value: string, ...args: string\[\]) => MethodDe | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `declare type WithThemeInterface = (options: WithThemeOptions) => WithThemeAttribute ×14` | 26.0.0(26) | 接口行为变更 | ArkTS | WithTheme相关组件行为变更：unnamed.WithThemeInterface | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `drawImage( image: ImageBitmap | PixelMap, sx: number, sy: number, sw: number, sh: number, dx: number, dy: number, dw: number, dh: number, ): void` | 5.1.0(18) | 接口行为变更 | ArkTS | CanvasRenderingContext2D的drawImage接口默认单位变更：CanvasRenderer.drawImage | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `drawImage(pixelmap: image.PixelMap, left: number, top: number, samplingOptions?: SamplingOptions): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | drawImage(pixelmap: image.PixelMap, left: number, top: number, samplingOptions?: | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `drawPixelMapMesh(pixelmap: image.PixelMap, meshWidth: number, meshHeight: number, vertices: Array<number>, vertOffset: number, colors: Array<number>, colorOffset: number): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | drawPixelMapMesh(pixelmap: image.PixelMap, meshWidth: number, meshHeight: number | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum BlendMode ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum BlendMode | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum BlurType ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum BlurType | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum CapStyle ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum CapStyle | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum ClipOp ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum ClipOp | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum ColorMode ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | enum ColorMode | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `enum CornerPos ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum CornerPos | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum FilterMode ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum FilterMode | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum FontEdging ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum FontEdging | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum FontHinting ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum FontHinting | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum FontMetricsFlags ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum FontMetricsFlags | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum JoinStyle ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum JoinStyle | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum PathDashStyle ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum PathDashStyle | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum PathDirection ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum PathDirection | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum PathFillType ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum PathFillType | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum PathIteratorVerb ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum PathIteratorVerb | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum PathMeasureMatrixFlags ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum PathMeasureMatrixFlags | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum PathOp ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum PathOp | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum PointMode ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum PointMode | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum RectType ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum RectType | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum RegionOp ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum RegionOp | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum ScaleToFit ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum ScaleToFit | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum ShadowFlag ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum ShadowFlag | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum SrcRectConstraint ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum SrcRectConstraint | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum TextEncoding ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum TextEncoding | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `enum TileMode ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | enum TileMode | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `export class DateTimeFormat ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | export class DateTimeFormat | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `export class Locale ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | export class Locale | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `export class PluralRules ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | export class PluralRules | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `export class RelativeTimeFormat ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | export class RelativeTimeFormat | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `export function getDisplayCountry(country: string, locale: string, sentenceCase?: boolean): string` | 6.1.0(23) | 接口行为变更 | ArkTS | 全球化接口与运行时接口本地化显示优化及换行能力增强：i18n.getDisplayCountry | `harmonyos_behavior_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `export function getDisplayLanguage(language: string, locale: string, sentenceCase?: boolean): string` | 6.1.0(23) | 接口行为变更 | ArkTS | 全球化接口与运行时接口本地化显示优化及换行能力增强：i18n.getDisplayLanguage | `harmonyos_behavior_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `export interface DateTimeOptions ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | export interface DateTimeOptions | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `export interface LocaleOptions ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | export interface LocaleOptions | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `export interface PluralRulesOptions ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | export interface PluralRulesOptions | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `export interface RelativeTimeFormatInputOptions ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | export interface RelativeTimeFormatInputOptions | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `export interface RelativeTimeFormatResolvedOptions ×2` | 6.0.0(20) | API废弃版本变更 | ArkTS | export interface RelativeTimeFormatResolvedOptions | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `fastConvertToJSObject(xml: string, options?: ConvertOptions): Object` | 26.0.0(26) | 接口行为变更 | ArkTS | 修复ConvertXML的fastConvertToJSObject接口解析时丢失同级text节点的问题：xml.ConvertXML.fastConvertT | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `format(date: Date): StyledString ×3` | 6.1.0(23) | 接口行为变更 | ArkTS | 全球化接口与运行时接口本地化显示优化及换行能力增强：i18n.StyledDateTimeFormat.format | `harmonyos_behavior_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `format(date: Date): string ×3` | 5.0.1(13) | 接口行为变更 | ArkTS | 时间日期格式“十一月”格式化结果错误问题修改：intl.DateTimeFormat.format | `harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Beta3.json` |
| `format(date: Date): string ×3` | 6.0.0(20) | API废弃版本变更 | ArkTS | format(date: Date): string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `format(date: Date): string ×3` | 6.0.0(20) | API废弃版本变更 | ArkTS | format(date: Date): string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `format(date: Date): string ×3` | 6.0.0(20) | API废弃版本变更 | ArkTS | format(date: Date): string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `format(date: Date): string ×3` | 6.0.0(20) | 接口行为变更 | ArkTS | 泰国、沙特阿拉伯、阿富汗和伊朗的默认历法变更：intl.DateTimeFormat.format | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `format(date: Date): string ×3` | 6.1.0(23) | 接口行为变更 | ArkTS | 全球化接口与运行时接口本地化显示优化及换行能力增强：i18n.SimpleDateTimeFormat.format | `harmonyos_behavior_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `format(date: Date): string ×3` | 6.1.0(23) | 接口行为变更 | ArkTS | 全球化接口与运行时接口本地化显示优化及换行能力增强：intl.DateTimeFormat.format | `harmonyos_behavior_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `format(number: number): string ×3` | 6.0.0(20) | API废弃版本变更 | ArkTS | format(number: number): string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `format(number: number): string ×3` | 6.0.0(20) | API废弃版本变更 | ArkTS | format(number: number): string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `format(value: double, unit: string): string ×3` | 6.1.0(23) | 接口行为变更 | ArkTS | 全球化接口与运行时接口本地化显示优化及换行能力增强：intl.RelativeTimeFormat.format | `harmonyos_behavior_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `format(value: number, unit: string): string ×3` | 6.0.0(20) | API废弃版本变更 | ArkTS | format(value: number, unit: string): string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `format(value: number, unit: string): string ×3` | 6.0.0(20) | API废弃版本变更 | ArkTS | format(value: number, unit: string): string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `format(value: number, unit: string): string ×3` | 6.0.0(20) | API废弃版本变更 | ArkTS | format(value: number, unit: string): string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `format: string ×3` | 5.0.2(14) | 接口行为变更 | ArkTS | image接口Heif格式类型变更：image.PackingOption.format | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` |
| `function createEffect(): VisualEffect` | 6.1.1(24) | API卡片权限变更 | ArkTS | function createEffect(): VisualEffect; | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Release.json` |
| `function showToast(options: ShowToastOptions): void ×7` | 5.1.0(18) | API废弃版本变更 | ArkTS | function showToast(options: ShowToastOptions): void; | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` |
| `function showToast(options: ShowToastOptions): void ×7` | 26.0.0(26) | UX视觉布局变更 | ArkTS | Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质：promptAction.showToast | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `function showToast(options: ShowToastOptions): void ×7` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 内置文本的组件文本样式优化：promptAction.showToast | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `get(field: string): number` | 6.0.0(20) | 接口行为变更 | ArkTS | 泰国、沙特阿拉伯、阿富汗和伊朗的默认历法变更：i18n.Calendar.get | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `getEvents(callback: AsyncCallback<Event\[\]>): void` | 6.1.0(23) | 权限变更 | ArkTS | getEvents(callback: AsyncCallback<Event\[\]>): void; | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `getEvents(callback: AsyncCallback<Event\[\]>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | getEvents(callback: AsyncCallback<Event\[\]>): void; | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `getEvents(eventFilter: EventFilter, eventKey: (keyof Event)\[\], callback: AsyncCallback<Event\[\]>): void` | 6.1.0(23) | 权限变更 | ArkTS | getEvents(eventFilter: EventFilter, eventKey: (keyof Event)\[\], callback: Async | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `getEvents(eventFilter: EventFilter, eventKey: (keyof Event)\[\], callback: AsyncCallback<Event\[\]>): void` | 26.0.0 Beta2 | 权限变更 | ArkTS | getEvents(eventFilter: EventFilter, eventKey: (keyof Event)\[\], callback: Async | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `getEvents(eventFilter?: EventFilter, eventKey?: (keyof Event)\[\]): Promise<Event\[\]>` | 6.1.0(23) | 权限变更 | ArkTS | getEvents(eventFilter?: EventFilter, eventKey?: (keyof Event)\[\]): Promise<Even | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `getEvents(eventFilter?: EventFilter, eventKey?: (keyof Event)\[\]): Promise<Event\[\]>` | 26.0.0 Beta2 | 权限变更 | ArkTS | getEvents(eventFilter?: EventFilter, eventKey?: (keyof Event)\[\]): Promise<Even | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` |
| `getKeyboardAvoidMode(): KeyboardAvoidMode` | 5.1.0(18) | 接口行为变更 | ArkTS | getKeyboardAvoidMode接口返回值变更：UIContext.getKeyboardAvoidMode | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `hourCycle: string` | 6.0.0(20) | API废弃版本变更 | ArkTS | hourCycle: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `initialIndex?: number` | 5.0.2(14) | 接口行为变更 | ArkTS | List组件首次创建布局时，Scroller控制器的跳转方法优先级变更为高于initialIndex的优先级：ListOptions.initialIndex | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` |
| `interface Color` | 6.0.0(20) | 删除API | ArkTS | interface Color | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `interface FontMetrics ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | interface FontMetrics | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `interface PackingOptionsForSequence ×3` | 5.0.1(13) | 删除API | ArkTS | interface PackingOptionsForSequence | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Release.json` |
| `interface TextBlobRunBuffer ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | interface TextBlobRunBuffer | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `interface VisualEffect` | 6.0.2(22) | API卡片权限变更 | ArkTS | interface VisualEffect | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` |
| `invert(matrix: Matrix): Boolean` | 6.0.0(20) | API跨平台权限变更 | ArkTS | invert(matrix: Matrix): Boolean; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `isEqual(matrix: Matrix): Boolean` | 6.0.0(20) | API跨平台权限变更 | ArkTS | isEqual(matrix: Matrix): Boolean; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `isIdentity(): Boolean` | 6.0.0(20) | API跨平台权限变更 | ArkTS | isIdentity(): Boolean; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `isVisible(): boolean` | 5.0.3(15) | 接口行为变更 | ArkTS | FrameNode被UINode包裹时isVisible接口返回值发生变更：FrameNode.isVisible | `harmonyos_behavior_changes/HarmonyOS_5.0.3(15)_Beta1.json` |
| `language: string` | 6.0.0(20) | API废弃版本变更 | ArkTS | language: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `locale: string` | 6.0.0(20) | API废弃版本变更 | ArkTS | locale: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `locale: string` | 6.0.0(20) | API废弃版本变更 | ArkTS | locale: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `locale: string` | 6.0.0(20) | API废弃版本变更 | ArkTS | locale: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `locale?: Intl.Locale` | 6.0.0(20) | 删除API | ArkTS | locale?: Intl.Locale; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `locale?: string` | 6.0.0(20) | API废弃版本变更 | ArkTS | locale?: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `locale?: string` | 6.0.0(20) | API废弃版本变更 | ArkTS | locale?: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` |
| `locale?: string` | 6.0.0(20) | API废弃版本变更 | ArkTS | locale?: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `maximize(): Locale` | 6.0.0(20) | API废弃版本变更 | ArkTS | maximize(): Locale; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `maximize(): Locale` | 6.1.0(23) | 接口行为变更 | ArkTS | 全球化接口与运行时接口本地化显示优化及换行能力增强：intl.Locale.maximize | `harmonyos_behavior_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `mimeType: string ×3` | 5.0.2(14) | 接口行为变更 | ArkTS | image接口Heif格式类型变更：image.ImageInfo.mimeType | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` |
| `mimeType: string ×3` | 6.0.0(20) | 接口行为变更 | ArkTS | ImageInfo对象mimeType返回值变更：image.ImageInfo.mimeType | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `moveTo(x: number, y: number): void` | 5.1.0(18) | 接口行为变更 | ArkTS | CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制：CanvasPath.moveTo | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `moveTo(x: number, y: number): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | moveTo(x: number, y: number): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `navDestination(builder: (name: string, param: unknown) => void): NavigationAttribute` | 5.0.1(13) | UX视觉布局变更 | ArkTS | NavDestination的Dialog模式默认支持系统动画：NavigationAttribute.navDestination | `harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Release.json` |
| `numberingSystem: string` | 6.0.0(20) | API废弃版本变更 | ArkTS | numberingSystem: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `numeric: boolean` | 6.0.0(20) | API废弃版本变更 | ArkTS | numeric: boolean; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `onDisAppear(event: () => void): T` | 5.1.0(18) | 接口行为变更 | ArkTS | 页面退出场景自定义组件删除前移：CommonMethod.onDisAppear | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `onMouse(event: (event: MouseEvent) => void): T` | 5.0.1(13) | 接口行为变更 | ArkTS | 鼠标按键处理行为变更：CommonMethod.onMouse | `harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Release.json` |
| `readonly supportedFormats: Array<string> ×2` | 5.0.2(14) | 接口行为变更 | ArkTS | image接口Heif格式类型变更：image.ImagePacker.supportedFormats | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` |
| `readonly supportedFormats: Array<string> ×2` | 5.0.2(14) | 接口行为变更 | ArkTS | image接口Heif格式类型变更：image.ImageSource.supportedFormats | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` |
| `region: string` | 6.0.0(20) | API废弃版本变更 | ArkTS | region: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `renderFit(fitMode: RenderFit): T` | 5.1.0(18) | API卡片权限变更 | ArkTS | renderFit(fitMode: RenderFit): T; | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` |
| `renderFit(fitMode: RenderFit): T` | 5.1.0(18) | 接口行为变更 | ArkTS | XComponent组件上使用renderFit接口显示效果变更：CommonMethod.renderFit | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `reset(): void ×2` | 6.0.0(20) | API跨平台权限变更 | ArkTS | reset(): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `restore(): void ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | restore(): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `reuse(options: ReuseOptions): T` | 26.0.0(26) | 接口行为变更 | ArkTS | @ReusableV2组件复用的reuse属性支持动态复用标识：CommonMethod.reuse | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `rotate(angle: number): void ×3` | 5.1.0(18) | 接口行为变更 | ArkTS | CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制：CanvasRenderer.rot | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `rotate(degrees: number, sx: number, sy: number): void ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | rotate(degrees: number, sx: number, sy: number): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `save(): number ×3` | 6.0.0(20) | API跨平台权限变更 | ArkTS | save(): number; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `scale(sx: number, sy: number): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | scale(sx: number, sy: number): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `scale(x: number, y: number): void` | 5.1.0(18) | 接口行为变更 | ArkTS | CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制：CanvasRenderer.sca | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `script: string` | 6.0.0(20) | API废弃版本变更 | ArkTS | script: string; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `searchButton(value: ResourceStr, option?: SearchButtonOptions): SearchAttribute` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 内置文本的组件文本样式优化：SearchAttribute.searchButton | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `showCounter(value: boolean, options?: InputCounterOptions): TextInputAttribute ×2` | 5.0.1(13) | UX视觉布局变更 | ArkTS | TextInput组件在非标准字体场景下showCounter接口布局变更：TextInputAttribute.showCounter | `harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Beta3.json` |
| `showToast(options: promptAction.ShowToastOptions): void ×7` | 26.0.0(26) | UX视觉布局变更 | ArkTS | Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质：PromptAction.showToast | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `showToast(options: promptAction.ShowToastOptions): void ×7` | 26.0.0(26) | UX视觉布局变更 | ArkTS | 内置文本的组件文本样式优化：PromptAction.showToast | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `span?: number | GridColColumnOption` | 6.0.0(20) | 接口行为变更 | ArkTS | GridRow组件columns参数和GridCol组件span参数默认值变更：GridColOptions.span | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `static close() ×3` | 5.1.0(18) | API废弃版本变更 | ArkTS | static close(); | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` |
| `static createLinearGradient(startPt: common2D.Point, endPt: common2D.Point, colors: Array<number>, mode: TileMode, pos?: Array<number> | null, matrix?: Matrix | null): ShaderEffect` | 6.0.0(20) | API跨平台权限变更 | ArkTS | static createLinearGradient(startPt: common2D.Point, endPt: common2D.Point, colo | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `static getDisplayCountry(country: string, locale: string, sentenceCase?: boolean): string` | 5.0.1(13) | 接口行为变更 | ArkTS | 国家、地区本地化名称变更：i18n.System.getDisplayCountry | `harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Beta3.json` |
| `static getDisplayCountry(country: string, locale: string, sentenceCase?: boolean): string` | 6.1.0(23) | 接口行为变更 | ArkTS | 全球化接口与运行时接口本地化显示优化及换行能力增强：i18n.System.getDisplayCountry | `harmonyos_behavior_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `static getDisplayLanguage(language: string, locale: string, sentenceCase?: boolean): string` | 6.1.0(23) | 接口行为变更 | ArkTS | 全球化接口与运行时接口本地化显示优化及换行能力增强：i18n.System.getDisplayLanguage | `harmonyos_behavior_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `static readonly matchParent: LayoutPolicy` | 6.0.0(20) | 接口行为变更 | ArkTS | width和height支持的matchParent接口规格变更：LayoutPolicy.matchParent | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` |
| `static readonly matchParent: LayoutPolicy` | 26.0.0(26) | 接口行为变更 | ArkTS | LayoutPolicy.matchParent父组件为Row、Column、Flex组件时，单方向设置matchParent的子组件布局行为变更：Layout | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` |
| `transform(a: number, b: number, c: number, d: number, e: number, f: number): void` | 5.1.0(18) | 接口行为变更 | ArkTS | CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制：CanvasRenderer.tra | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |
| `transform(matrix: Matrix): void` | 6.0.0(20) | API跨平台权限变更 | ArkTS | transform(matrix: Matrix): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `transform(text: string): string` | 6.1.0(23) | 接口行为变更 | ArkTS | 全球化接口与运行时接口本地化显示优化及换行能力增强：i18n.Transliterator.transform | `harmonyos_behavior_changes/HarmonyOS_6.1.0(23)_Beta1.json` |
| `translate(dx: number, dy: number): void ×2` | 6.0.0(20) | API跨平台权限变更 | ArkTS | translate(dx: number, dy: number): void; | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` |
| `translate(x: number, y: number): void ×2` | 5.1.0(18) | 接口行为变更 | ArkTS | CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制：CanvasRenderer.tra | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` |

> …共 646 条高影响变更（折叠为 203 行），其余见 `change_report.json` / 第四节逐 API 建议。

## 四、逐 API 建议

### `MODE_AUTO = -1`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_AUTO = -1（共 2 处调用点）

### `MODE_DARK = 0`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_DARK = 0（共 2 处调用点）

### `MODE_LIGHT = 1`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：MODE_LIGHT = 1（共 2 处调用点）

### `abstract cancel(chatId: number): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `addColorStop(offset: number, color: string): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `animateTo(value: AnimateParam, event: () => void): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [5.0.1(13)] `接口行为变更`：动画接口在播放次数为无限循环时的行为变更：UIContext.animateTo（共 3 处调用点）

### `arc(x: number, y: number, radius: number, startAngle: number, endAngle: number, counterclockwise?: boolean): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [5.1.0(18)] `接口行为变更`：CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制：CanvasPath.arc（共 3 处调用点）

### `backToTop(backToTop: boolean): T`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `backgroundColor(color: Optional<ResourceColor>): ArcDotIndicator`  ℹ️ 关注  （变更 27 条 [ArkTS 27 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `backgroundColor(color: Optional<ResourceColor>): T`  ℹ️ 关注  （变更 27 条 [ArkTS 27 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `backgroundColor(value: ResourceColor): T`  ℹ️ 关注  （变更 27 条 [ArkTS 27 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `barOverlap(value: boolean): TabsAttribute`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [5.0.1(13)] `UX视觉布局变更`：Tabs组件barOverlap接口默认效果变更：TabsAttribute.barOverlap（共 2 处调用点）

### `baseName: string`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：baseName: string;

### `baselineOffset(value: number | string): TextAttribute`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `bind(id: string): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `bindSheet(isShow: boolean, builder: CustomBuilder, options?: SheetOptions): T`  ⚠️ 高风险  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 4 条 [ArkTS 4 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：内置文本的组件文本样式优化：CommonMethod.bindSheet（共 4 处调用点）

### `bindTabsToNestedScrollable(tabsController: TabsController, parentScroller: Scroller, childScroller: Scroller): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `bindTabsToScrollable(tabsController: TabsController, scroller: Scroller): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `blendMode(value: BlendMode, type?: BlendApplyType): T`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [5.1.0(18)] `接口行为变更`：XComponent设置为Texture模式使用blendMode接口的行为由不生效变更为正常生效：CommonMethod.blendMode
- [ArkTS] [5.1.0(18)] `UX视觉布局变更`：修复blendMode接口离屏模式会影响组件设置的不透明度的问题：CommonMethod.blendMode

### `borderRadius(radius: Dimension | BorderRadiuses): T`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius(value: Length | BorderRadiuses | LocalizedBorderRadiuses): T`  ⚠️ 高风险  （变更 13 条 [ArkTS 13 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.0.2(14)] `接口行为变更`：Image组件的borderRadius接口支持动态修改：CommonMethod.borderRadius

### `borderRadius: number`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius?: Length`  ℹ️ 关注  （变更 12 条 [ArkTS 12 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius?: LengthMetrics`  ℹ️ 关注  （变更 24 条 [ArkTS 24 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `borderRadius?: LengthMetrics | BorderRadiuses | LocalizedBorderRadiuses`  ℹ️ 关注  （变更 24 条 [ArkTS 24 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `buffer: ArrayBuffer`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `buffer: Uint8Array`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `calendar: string`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：calendar: string;

### `cancel(): Promise<void>`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `cancel(): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `cancel(requestToCancel?: Request | Request\[\]): void`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `cancel(runId: number): Promise<void>`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `cancel: UrpcCancel`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `cancel?: () => void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `caseFirst: string`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：caseFirst: string;

### `class ArkTSVM`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class AutoFinalizerCleaner`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class AvisMetadata`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class Brush`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：class Brush（共 3 处调用点）

### `class Canvas`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：class Canvas（共 3 处调用点）

### `class ColorFilter`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：class ColorFilter（共 3 处调用点）

### `class DngMetadata`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class ExifMetadata`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class Font`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：class Font（共 3 处调用点）

### `class GifMetadata`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class HeifsMetadata`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class ImageFilter`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：class ImageFilter（共 3 处调用点）

### `class JfifMetadata`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class Lattice`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：class Lattice（共 3 处调用点）

### `class MakerNoteHuaweiMetadata`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class MaskFilter`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：class MaskFilter（共 3 处调用点）

### `class Matrix`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：class Matrix（共 3 处调用点）

### `class Path`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：class Path（共 3 处调用点）

### `class PathEffect`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：class PathEffect（共 3 处调用点）

### `class PathIterator`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：class PathIterator（共 3 处调用点）

### `class PdfData`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class Pen`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：class Pen（共 3 处调用点）

### `class PngMetadata`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class PointUtils`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class PrefetchOptions`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class ProxyConfig`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class ProxyController`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class ProxyRule`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class RectUtils`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class Region`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：class Region（共 3 处调用点）

### `class RoundRect`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：class RoundRect（共 3 处调用点）

### `class SamplingOptions`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：class SamplingOptions（共 3 处调用点）

### `class ShaderEffect`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：class ShaderEffect（共 3 处调用点）

### `class ShadowLayer`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：class ShadowLayer（共 3 处调用点）

### `class TextBlob`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：class TextBlob（共 3 处调用点）

### `class TiffMetadata`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class Tool`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：class Tool（共 3 处调用点）

### `class Typeface`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：class Typeface（共 3 处调用点）

### `class TypefaceArguments`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class UserAgentBrandVersion`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class UserAgentMetadata`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class WebPMetadata`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class XMPMetadata`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class XmlDynamicSerializer`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `class XmlSAXParser`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `clip(value: boolean | CircleAttribute | EllipseAttribute | PathAttribute | RectAttribute): T`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `close(): Promise<void>`  ⚠️ 高风险  （变更 24 条 [ArkTS 24 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：close(): Promise<void>;（共 3 处调用点）

### `close(): void`  ⚠️ 高风险  （变更 30 条 [ArkTS 30 / C++ 0]，其中高影响 6 条 [ArkTS 6 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：close(): void;（共 3 处调用点）
- [ArkTS] [26.0.0 Beta2] `权限变更`：close(): void;（共 3 处调用点）

### `close(callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `close(connection: WebSocketConnection, options?: webSocket.WebSocketCloseOptions): Promise<boolean>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `close: SourceCloseCallback`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `collation: string`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：collation: string;

### `color(value: ResourceColor | LinearGradient): ProgressAttribute<Type>`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `接口行为变更`：Progress组件color属性设置渐变色规格变更：ProgressAttribute.color

### `columns?: number | GridRowColumnOption`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `接口行为变更`：GridRow组件columns参数和GridCol组件span参数默认值变更：GridRowOptions.columns

### `const CAPTURE_MODE_FRONT_LENS_NIGHT_VIEW: number`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const CAPTURE_MODE_FRONT_LENS_NIGHT_VIEW: number = 7`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `删除API`：const CAPTURE_MODE_FRONT_LENS_NIGHT_VIEW: number = 7;（共 3 处调用点）

### `const CAPTURE_MODE_LIGHT_GRAFFITI: number`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const CAPTURE_MODE_LIGHT_GRAFFITI: number = 10`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `删除API`：const CAPTURE_MODE_LIGHT_GRAFFITI: number = 10;（共 3 处调用点）

### `const CAPTURE_MODE_MOVING_PHOTO: number`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const CAPTURE_MODE_MOVING_PHOTO: number = 20`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `删除API`：const CAPTURE_MODE_MOVING_PHOTO: number = 20;（共 3 处调用点）

### `const CAPTURE_MODE_PANORAMA: number`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const CAPTURE_MODE_PANORAMA: number = 8`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `删除API`：const CAPTURE_MODE_PANORAMA: number = 8;（共 3 处调用点）

### `const CAPTURE_MODE_PORTRAIT: number`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const CAPTURE_MODE_PORTRAIT: number = 23`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `删除API`：const CAPTURE_MODE_PORTRAIT: number = 23;（共 3 处调用点）

### `const CAPTURE_MODE_PROFESSIONAL: number`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const CAPTURE_MODE_PROFESSIONAL: number = 2`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `删除API`：const CAPTURE_MODE_PROFESSIONAL: number = 2;（共 3 处调用点）

### `const CAPTURE_MODE_REAR_LENS_NIGHT_VIEW: number`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const CAPTURE_MODE_REAR_LENS_NIGHT_VIEW: number = 42`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `删除API`：const CAPTURE_MODE_REAR_LENS_NIGHT_VIEW: number = 42;（共 3 处调用点）

### `const CAPTURE_MODE_SILKY_WATER: number`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const CAPTURE_MODE_SILKY_WATER: number = 11`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `删除API`：const CAPTURE_MODE_SILKY_WATER: number = 11;（共 3 处调用点）

### `const CAPTURE_MODE_SNAP_SHOT: number`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const CAPTURE_MODE_SNAP_SHOT: number = 62`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `删除API`：const CAPTURE_MODE_SNAP_SHOT: number = 62;（共 3 处调用点）

### `const CAPTURE_MODE_STAR_TRACK: number`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const CAPTURE_MODE_STAR_TRACK: number = 12`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `删除API`：const CAPTURE_MODE_STAR_TRACK: number = 12;（共 3 处调用点）

### `const CAPTURE_MODE_SUPER_MACRO: number`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const CAPTURE_MODE_SUPER_MACRO: number = 47`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `删除API`：const CAPTURE_MODE_SUPER_MACRO: number = 47;（共 3 处调用点）

### `const CAPTURE_MODE_TAIL_LIGHT: number`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const CAPTURE_MODE_TAIL_LIGHT: number = 9`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `删除API`：const CAPTURE_MODE_TAIL_LIGHT: number = 9;（共 3 处调用点）

### `const CAPTURE_MODE_WIDEAPERTURE: number`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const CAPTURE_MODE_WIDEAPERTURE: number = 19`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `删除API`：const CAPTURE_MODE_WIDEAPERTURE: number = 19;（共 3 处调用点）

### `const DUBLIN_CORE: XMPNamespace`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const EXIF: XMPNamespace`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const TIFF: XMPNamespace`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const XMAGE_WATERMARK_MODE_AT_THE_BOTTOM: number`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const XMAGE_WATERMARK_MODE_AT_THE_BOTTOM: number = 9`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `删除API`：const XMAGE_WATERMARK_MODE_AT_THE_BOTTOM: number = 9;（共 3 处调用点）

### `const XMAGE_WATERMARK_MODE_BORDER: number`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const XMAGE_WATERMARK_MODE_BORDER: number = 10`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [26.0.0 Beta2] `删除API`：const XMAGE_WATERMARK_MODE_BORDER: number = 10;（共 3 处调用点）

### `const XMP_BASIC: XMPNamespace`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `const XMP_RIGHTS: XMPNamespace`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `constructor(comparator?: (firstValue: K, secondValue: K) => boolean)`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `接口行为变更`：TreeSet/TreeMap扩容导致比较器丢失问题正向修复：TreeMap.constructor

### `constructor(comparator?: (firstValue: T, secondValue: T) => boolean)`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `接口行为变更`：TreeSet/TreeMap扩容导致比较器丢失问题正向修复：TreeSet.constructor

### `content: string`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `content?: string`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller: functionalInputComponentManager.FunctionalInputController`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller: loginComponentManager.LoginPanelController`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller: loginComponentManager.LoginWithHuaweiIDButtonController`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller: readerCore.ReaderComponentController`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: FunctionController`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: HdsTabsController`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: SearchController`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: ShaderEffectController`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: TabsController`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `controller?: TextClockController`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `createAnimator(options: AnimatorOptions): AnimatorResult`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `createEffect(params: EffectParameters): Promise<Effect>`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare class CommonMethod<T>`  ℹ️ 关注  （变更 496 条 [ArkTS 496 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare class CustomDialogController`  ℹ️ 关注  （变更 10 条 [ArkTS 10 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare const Button: ButtonInterface`  ⚠️ 高风险  （变更 84 条 [ArkTS 84 / C++ 0]，其中高影响 84 条 [ArkTS 84 / C++ 0]）

- [ArkTS] [5.1.0(18)] `UX视觉布局变更`：按钮默认值变更为新增圆角矩形类型：unnamed.Button（共 28 处调用点）
- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：内置文本的组件文本样式优化：unnamed.Button（共 28 处调用点）
- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：表单类组件触摸热区最小高度变更：unnamed.Button（共 28 处调用点）

### `declare const NavDestination: NavDestinationInterface`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.0.1(13)] `UX视觉布局变更`：NavDestination的Dialog模式默认支持系统动画：unnamed.NavDestination

### `declare const Navigation: NavigationInterface`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：内置文本的组件文本样式优化：unnamed.Navigation

### `declare const Select: SelectInterface`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：内置文本的组件文本样式优化：unnamed.Select
- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：表单类组件触摸热区最小高度变更：unnamed.Select

### `declare const Slider: SliderInterface`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：内置文本的组件文本样式优化：unnamed.Slider（共 2 处调用点）

### `declare const Text: TextInterface`  ⚠️ 高风险  （变更 72 条 [ArkTS 72 / C++ 0]，其中高影响 72 条 [ArkTS 72 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质：unnamed.Text（共 72 处调用点）

### `declare const TextClock: TextClockInterface`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：内置文本的组件文本样式优化：unnamed.TextClock（共 2 处调用点）

### `declare const Toggle: ToggleInterface`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：表单类组件触摸热区最小高度变更：unnamed.Toggle

### `declare const Video: VideoInterface`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare function animateTo(value: AnimateParam, event: () => void): void`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 6 条 [ArkTS 6 / C++ 0]）

- [ArkTS] [5.1.0(18)] `API废弃版本变更`：declare function animateTo(value: AnimateParam, event: () => void): void;（共 3 处调用点）
- [ArkTS] [5.0.1(13)] `接口行为变更`：动画接口在播放次数为无限循环时的行为变更：unnamed.animateTo（共 3 处调用点）

### `declare interface AnimateParam`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type AccessibilityActionInterceptCallback = (action: AccessibilityAction) => AccessibilityActionInterceptResult`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type AccessibilityFocusCallback = (isFocus: boolean) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type AccessibilityTransparentCallback = (event: TouchEvent) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type AnimationEndHandler = (index: number, event: SwiperAnimationEvent) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type AnimationStartHandler = (index: number, targetIndex: number, event: SwiperAnimationEvent) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ArcScrollIndexHandler = (start: number, end: number, center: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ArcSliderChangeHandler = (progress: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ArcSliderEnlargeHandler = (isEnlarged: boolean) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ArcSliderTouchHandler = (event: TouchEvent) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type AreaChangeCallback = (oldValue: Area, newValue: Area) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type BuilderCallback = (...args: Args) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type BusinessError<T> = import('../api/@ohos.base').BusinessError<T>`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type CommonModifier = import('../api/arkui/CommonModifier').CommonModifier`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ContentWillScrollCallback = (result: SwiperContentWillScrollResult) => boolean`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type CustomBuilderT<T> = (t: T) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type CustomBuilderWithId = (id: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type DataLoadParams = import('../api/@ohos.data.unifiedDataChannel').default.DataLoadParams`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type DataSyncOptions = import('../api/@ohos.data.unifiedDataChannel').default.GetDataParams`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type DidScrollCallback = (yOffset: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type DragSpringLoadingConfiguration = import('../api/@ohos.arkui.dragController').default.DragSpringLoadingConfiguration`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type DrawableDescriptor = import('../api/@ohos.arkui.drawableDescriptor').DrawableDescriptor`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type EditableTextOnChangeCallback = (value: string, previewText?: PreviewText) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type EnvDecorator = (value: SystemProperties) => PropertyDecorator`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type FinishAnimationHandler = () => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type FontVariation = import('../api/@ohos.graphics.text').default.FontVariation`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type FrameNode = import('../api/arkui/FrameNode').FrameNode`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type GestureCollectInterceptCallback = (recognizers: Array<GestureRecognizer>, touchRecognizers?: Array<TouchRecognizer>) => GestureCollectIntervention`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type GestureRecognizerJudgeBeginCallback = (event: BaseGestureEvent, current: GestureRecognizer, recognizers: Array<GestureRecognizer>) => GestureJudgeResult`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type GestureSwipeHandler = (index: number, event: SwiperAnimationEvent) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type HdsListItemCardInterface = (options: HdsListItemCardOptions) => HdsListItemCardAttribute`  ℹ️ 关注  （变更 28 条 [ArkTS 28 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type HdsSceneFinishCallback = () => void`  ⚠️ 高风险  （变更 42 条 [ArkTS 42 / C++ 0]，其中高影响 14 条 [ArkTS 14 / C++ 0]）

- [ArkTS] [6.0.2(22)] `API卡片权限变更`：declare type HdsSceneFinishCallback = () => void;（共 14 处调用点）

### `declare type HdsTabsInterface = (options?: HdsTabsOptions) => HdsTabsAttribute`  ℹ️ 关注  （变更 28 条 [ArkTS 28 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type HdsVisualComponentInterface = () => HdsVisualComponentAttribute`  ℹ️ 关注  （变更 28 条 [ArkTS 28 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ImageMatrix = import('../api/@ohos.matrix4').default.Matrix4Transit`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ImmersiveMode = import('../api/@ohos.promptAction').ImmersiveMode`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type IndexChangedHandler = (index: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type InitCallback = () => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type InputEventListener = (event: RawInputEventWrapper) => InputEventInterceptResult`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type InputMethodExtraConfig = import('../api/@ohos.inputMethod.ExtraConfig').InputMethodExtraConfig`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type InterceptionCallback = (from: NavPathInfo | NavBar, to: NavPathInfo | NavBar, pathStack: NavPathStack, operation: NavigationOperation, isAnimated: boolean) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type LevelMode = import('../api/@ohos.promptAction').LevelMode`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type LevelOrder = import('../api/@ohos.promptAction').LevelOrder`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type Material = import('../api/@ohos.arkui.uiMaterial').default.Material`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type Matrix4Transit = import('../api/@ohos.matrix4').default.Matrix4Transit`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type MenuCallback = (start: number, end: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type MonitorDecorator = (value: string, ...args: string\[\]) => MethodDecorator`  ⚠️ 高风险  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 14 条 [ArkTS 14 / C++ 0]）

- [ArkTS] [6.1.0(23)] `API卡片权限变更`：declare type MonitorDecorator = (value: string, ...args: string\[\]) => MethodDecorator;（共 14 处调用点）

### `declare type NavDestinationBuildFunction = (name: string, param?: object) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type NavDestinationTransitionDelegate = (operation: NavigationOperation, isEnter: boolean) => Array<NavDestinationTransition> | undefined`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type NodeRenderStateChangeCallback = (state: NodeRenderState, node?: FrameNode) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnActionCallback = () => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnActionTextClickCallback = () => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnAlphabetIndexerPopupSelectCallback = (index: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnAlphabetIndexerRequestPopupDataCallback = (index: number) => Array<string>`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnAlphabetIndexerSelectCallback = (index: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnChangeCallback = (value: boolean) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnChangedCallback = (callbackParam: CallbackParamV2) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnCheckboxChangeCallback = (value: boolean) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnCheckboxGroupChangeCallback = (value: CheckboxGroupResult) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnContainerCallback = () => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnContentScrollCallback = (totalOffsetX: number, totalOffsetY: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnDidStopDraggingCallback = (willFling: boolean) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnDragEventCallback = (event: DragEvent, extraParams?: string) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnFoldStatusChangeCallback = (event: OnFoldStatusChangeInfo) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnGetPreviewBadgeCallback = () => boolean | number`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnGridScrollIndexCallback = (first: number, last: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnHomeShowOnTopCallback = (name: string) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnHoverCallback = (status: boolean, event: HoverEvent) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnHoverStatusChangeCallback = (param: HoverEventParam) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnItemDragStartCallback = (event: ItemDragInfo, itemIndex: number) => CustomBuilder`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnListScrollIndexCallback = (start: number, end: number, center: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnNativeLoadCallback = (event?: object) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnNavigationModeChangeCallback = (mode: NavigationMode) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnNeedSoftkeyboardCallback = () => boolean`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnPasteCallback = (content: string, event: PasteEvent) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnPasteCallback = (pasteValue: string, event: PasteEvent) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnRadioChangeCallback = (isChecked: boolean) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnRatingChangeCallback = (rating: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnScrollEdgeCallback = (side: Edge) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnScrollFrameBeginCallback = (offset: number, state: ScrollState) => OnScrollFrameBeginHandlerResult`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSelectCallback = (index: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSelectCallback = (index: number, selectStr: string) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSelectCallback = (index: number, selectValue: string) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnStateChangeCallback = (state: SwipeActionState) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSubmitCallback = (enterKey: EnterKeyType, event: SubmitEvent) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSwiperAnimationEndCallback = (index: number, extraInfo: SwiperAnimationEvent) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSwiperAnimationStartCallback = (index: number, targetIndex: number, extraInfo: SwiperAnimationEvent) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnSwiperGestureSwipeCallback = (index: number, extraInfo: SwiperAnimationEvent) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTabsAnimationEndCallback = (index: number, extraInfo: TabsAnimationEvent) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTabsAnimationStartCallback = (index: number, targetIndex: number, extraInfo: TabsAnimationEvent) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTabsContentDidScrollCallback = (selectedIndex: number, index: number, position: number, mainAxisLength: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTabsContentWillChangeCallback = (currentIndex: number, comingIndex: number) => boolean`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTabsGestureSwipeCallback = (index: number, extraInfo: TabsAnimationEvent) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTextPickerChangeCallback = (selectItem: string | string\[\], index: number | number\[\]) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTextSelectionChangeCallback = (selectionStart: number, selectionEnd: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTimePickerChangeCallback = (result: TimePickerResult) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnTipClickCallback = () => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnUIPickerComponentCallback = (selectedIndex: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnVisibleIndexesChangeCallback = (start: number, end: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnWaterFlowScrollIndexCallback = (first: number, last: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type OnWillStopDraggingCallback = (velocity: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type Orientation = import('../api/@ohos.window').default.Orientation`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type PageTransitionCallback = (type: RouteType, progress: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type PanListenerCallback = (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type Paragraph = import('../api/@ohos.graphics.text').default.Paragraph`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type PopupStateChangeCallback = (event: PopupStateChangeParam) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type PromptActionCommonState = import('../api/@ohos.promptAction').promptAction.CommonState`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type PromptActionDialogController = import('../api/@ohos.promptAction').promptAction.DialogController`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type RectHeightStyle = import('../api/@ohos.graphics.text').default.RectHeightStyle`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type RectWidthStyle = import('../api/@ohos.graphics.text').default.RectWidthStyle`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type RepeatInterface = <T>(arr: RepeatArray<T>) => RepeatAttribute<T>`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type RequestDownloadInfo = import('../api/@ohos.request.cacheDownload').default.DownloadInfo`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type RestoreStateCallback = (savedState: Record<string, Object> | null) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ReuseIdCallback = () => string`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type SaveStateCallback = () => Record<string, Object> | null`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ScaleCallback = (scale: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ScrollOnDidZoomCallback = (scale: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type SearchSubmitCallback = (searchContent: string, event?: SubmitEvent) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type ShouldRecognizerParallelWithCallback = (current: GestureRecognizer, others: Array<GestureRecognizer>) => GestureRecognizer`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type SpringLoadingContext = import('../api/@ohos.arkui.dragController').default.SpringLoadingContext`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type SwipeActionCallback = () => void`  ℹ️ 关注  （变更 28 条 [ArkTS 28 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type SystemUiMaterial = import('../api/@ohos.arkui.uiMaterial').default.Material`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TabsCustomContentTransitionCallback = (from: number, to: number) => TabContentAnimatedTransition | undefined`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TaskCallback = () => T`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TextAreaSubmitCallback = (enterKeyType: EnterKeyType, event?: SubmitEvent) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TextBox = import('../api/@ohos.graphics.text').default.TextBox`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TextPickerEnterSelectedAreaCallback = (value: string | string\[\], index: number | number\[\]) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TextPickerScrollStopCallback = (value: string | string\[\], index: number | number\[\]) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type TouchTestDoneCallback = (event: BaseGestureEvent, recognizers: Array<GestureRecognizer>) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type UIMaterial = import('../api/@ohos.arkui.uiMaterial').uiMaterial`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type UIStatesChangeHandler = (node: FrameNode, currentUIStates: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type Vector2T<T> = import('../api/arkui/Graphics').Vector2T<T>`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type VisibleAreaChangeCallback = (isVisible: boolean, currentRatio: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type WindowEventListener = (windowId: number, event: window.WindowEventType) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `declare type WithThemeInterface = (options: WithThemeOptions) => WithThemeAttribute`  ⚠️ 高风险  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 14 条 [ArkTS 14 / C++ 0]）

- [ArkTS] [26.0.0(26)] `接口行为变更`：WithTheme相关组件行为变更：unnamed.WithThemeInterface（共 14 处调用点）

### `decodeSync(src: Uint8Array | string, options?: Type): Uint8Array`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `drawImage( image: ImageBitmap | PixelMap, sx: number, sy: number, sw: number, sh: number, dx: number, dy: number, dw: number, dh: number, ): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.1.0(18)] `接口行为变更`：CanvasRenderingContext2D的drawImage接口默认单位变更：CanvasRenderer.drawImage

### `drawImage(pixelmap: image.PixelMap, left: number, top: number, samplingOptions?: SamplingOptions): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：drawImage(pixelmap: image.PixelMap, left: number, top: number, samplingOptions?: SamplingOptions): void;

### `drawPixelMapMesh(pixelmap: image.PixelMap, meshWidth: number, meshHeight: number, vertices: Array<number>, vertOffset: number, colors: Array<number>, colorOffset: number): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：drawPixelMapMesh(pixelmap: image.PixelMap, meshWidth: number, meshHeight: number, vertices: Array<number>, vertOffset: number, colors: Array<number>, colorOffset: number): void;

### `enum AllocatorType`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum ArkWebEngineVersion`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum AuxiliaryPictureType`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum AvisPropertyKey`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum BlanklessFrameInterpolationState`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum BlendMode`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum BlendMode（共 3 处调用点）

### `enum BlurType`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum BlurType（共 3 处调用点）

### `enum CapStyle`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum CapStyle（共 3 处调用点）

### `enum ClipOp`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum ClipOp（共 3 处调用点）

### `enum ColorMode`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：enum ColorMode（共 2 处调用点）

### `enum ControllerAttachState`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum CornerPos`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum CornerPos（共 3 处调用点）

### `enum CropAndScaleStrategy`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum DngPropertyKey`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum FilterMode`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum FilterMode（共 3 处调用点）

### `enum FocusMode`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum FontEdging`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum FontEdging（共 3 处调用点）

### `enum FontHinting`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum FontHinting（共 3 处调用点）

### `enum FontMetricsFlags`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum FontMetricsFlags（共 3 处调用点）

### `enum FragmentMapPropertyKey`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum GifPropertyKey`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum HeifsPropertyKey`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum JfifPropertyKey`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum JoinStyle`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum JoinStyle（共 3 处调用点）

### `enum MetadataType`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum Orientation`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum OutputType`  ℹ️ 关注  （变更 11 条 [ArkTS 11 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum PathDashStyle`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum PathDashStyle（共 3 处调用点）

### `enum PathDirection`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum PathDirection（共 3 处调用点）

### `enum PathFillType`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum PathFillType（共 3 处调用点）

### `enum PathIteratorVerb`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum PathIteratorVerb（共 3 处调用点）

### `enum PathMeasureMatrixFlags`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum PathMeasureMatrixFlags（共 3 处调用点）

### `enum PathOp`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum PathOp（共 3 处调用点）

### `enum PngPropertyKey`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum PointMode`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum PointMode（共 3 处调用点）

### `enum PreferStrategy`  ℹ️ 关注  （变更 11 条 [ArkTS 11 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum PressureLevel`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum ProxySchemeFilter`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum RectType`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum RectType（共 3 处调用点）

### `enum RegionOp`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum RegionOp（共 3 处调用点）

### `enum ScaleToFit`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum ScaleToFit（共 3 处调用点）

### `enum ScrollbarMode`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum ShadowFlag`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum ShadowFlag（共 3 处调用点）

### `enum SiteIsolationMode`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum SrcRectConstraint`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum SrcRectConstraint（共 3 处调用点）

### `enum TextEncoding`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum TextEncoding（共 3 处调用点）

### `enum TiffPropertyKey`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum TileMode`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：enum TileMode（共 3 处调用点）

### `enum UserAgentFormFactor`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum VertexMode`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum WebBlanklessErrorCode`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum WebDestroyMode`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum WebHttpCookieSameSitePolicy`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum WebPPropertyKey`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum WebSoftKeyboardBehaviorMode`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum XMPTagType`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `enum XmageColorMode`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `events: Array<VibratorEvent>`  ℹ️ 关注  （变更 5 条 [ArkTS 5 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export class AdvancedMeasureFormat`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export class ChineseCalendar`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export class DateTimeFormat`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：export class DateTimeFormat（共 2 处调用点）

### `export class ISO8601DateTimeFormat`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export class Locale`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：export class Locale（共 2 处调用点）

### `export class PluralRules`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：export class PluralRules（共 2 处调用点）

### `export class RelativeTimeFormat`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：export class RelativeTimeFormat（共 2 处调用点）

### `export class SimpleDateTimeFormat`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export class SimpleNumberFormat`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export class StyledDateTimeFormat`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export class StyledNumberFormat`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export class SymbolDateTimeFormat`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export class SymbolNumberFormat`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export class ZoneOffsetTransition`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export class ZoneRules`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export enum TemperatureType`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export enum UnitUsage`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export enum WeekDay`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export function getApplicationContext(): ApplicationContext`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export function getDisplayCountry(country: string, locale: string, sentenceCase?: boolean): string`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `接口行为变更`：全球化接口与运行时接口本地化显示优化及换行能力增强：i18n.getDisplayCountry

### `export function getDisplayLanguage(language: string, locale: string, sentenceCase?: boolean): string`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `接口行为变更`：全球化接口与运行时接口本地化显示优化及换行能力增强：i18n.getDisplayLanguage

### `export interface AdvancedMeasureFormatOptions`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export interface ChineseCalendarTime`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export interface DateTimeOptions`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：export interface DateTimeOptions（共 2 处调用点）

### `export interface EncodingInfo`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export interface ISO8601DateTimeFormatOptions`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export interface LocaleOptions`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：export interface LocaleOptions（共 2 处调用点）

### `export interface PluralRulesOptions`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：export interface PluralRulesOptions（共 2 处调用点）

### `export interface RelativeTimeFormatInputOptions`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：export interface RelativeTimeFormatInputOptions（共 2 处调用点）

### `export interface RelativeTimeFormatResolvedOptions`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：export interface RelativeTimeFormatResolvedOptions（共 2 处调用点）

### `export interface ResolvedSymbolDateTimeFormatOptions`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export interface ResolvedSymbolNumberFormatOptions`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export interface StyledDateTimeFormatOptions`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export interface StyledNumberFormatOptions`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export interface SymbolDateTimeFormatOptions`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export interface SymbolNumberFormatOptions`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ArrayListComparatorFn<T> = (firstValue: T, secondValue: T) => number`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ClickCallback = () => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ClientConnectionCloseCallback = (clientConnection: WebSocketConnection, closeReason: CloseResult) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ContentCoding = 'aes128gcm' | 'br' | 'compress' | 'deflate' | 'exi' | 'gzip' | 'pack200-gzip' | 'x-compress' | 'x-gzip' | 'zstd' | (string \& NonNullable<unknown>)`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ContentType = 'application/json' | 'text/plain' | 'multipart/form-data' | 'application/octet-stream' | 'application/x-www-form-urlencoded' | (string \& NonNullable<unknown>)`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type CurrentAlbumDeletedCallback = () => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type DynamicDnsRule = (host: string, port: number) => IpAddress\[\]`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type DynamicExclusionRule = (url: URLOrString) => boolean`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type EmptyAreaClickCallback = () => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ErrorCallback = (pickerError: PickerError) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ErrorHandler = (errObject: Error) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ExceedMaxSelectedCallback = (exceedMaxCountType: MaxCountType) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type FreezeObserver = () => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type GSTileRequestCallback = (tiles: GSTile\[\]) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type GetDataCallback = (maxSize: number) => ArrayBuffer | Promise<ArrayBuffer>`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type GlobalObserver = (reason: GlobalError) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type HttpMethod = 'GET' | 'POST' | 'HEAD' | 'PUT' | 'DELETE' | 'PATCH' | 'OPTIONS' | (string \& NonNullable<unknown>)`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type HttpVersionSelectCallback = (url: URL) => HttpVersion`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type IncomingDataCallback = (incomingData: ArrayBuffer) => void | Promise<void>`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ItemClickedNotifyCallback = (itemInfo: ItemInfo, clickType: ClickType) => void`  ℹ️ 关注  （变更 42 条 [ArkTS 42 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ItemsDeletedCallback = (baseItemInfos: Array<BaseItemInfo>) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ListComparatorFn<T> = (firstValue: T, secondValue: T) => number`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type MovingPhotoBadgeStateChangedCallback = (uri: string, state: photoAccessHelper.MovingPhotoBadgeStateType) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnAuthenticationChallenge = (info: AuthenticationChallengeInfo\[\], response: Response, challengeCount: number) => ServerAuthentication | null`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnCanceled = () => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnCanceled = (request?: Request) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnClosed = () => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnCounterV2HoverCallback = (isHover: boolean) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDataCallback = (method: AgentOperation, context: RequestContext) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDataEnd = () => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDataEnd = (request?: Request) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDataReceive = (incomingData: ArrayBuffer) => number | void | Promise<void>`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDataReceive = (incomingData: ArrayBuffer, request?: Request) => number | void | Promise<void>`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDateCounterV2ChangeCallback = (date: CounterV2DateData) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDownloadProgress = (totalSize: number, transferredSize: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnDownloadProgress = (totalSize: number, transferredSize: number, request?: Request) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnHeaderReceive = (headers: ResponseHeaders) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnHeaderReceive = (headers: ResponseHeaders, request?: Request) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnInlineCounterV2Change = (value: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnMenuItemClickWithTextCallback = (menuItem: TextMenuItem, value: string) => boolean`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnPickerStateCallback = (state: AVCastPickerState) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnRequestFailureFn = (name: string, failureCode: AbilityStartFailureCode, failureMessage: string) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnRequestSuccessFn = (name: string) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnSelectedIndexChange = (selectedIndex: number) => void`  ℹ️ 关注  （变更 28 条 [ArkTS 28 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnSelectedIndexesChange = (selectedIndexes: number\[\]) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnStatusCodeReceive = (statusCode: number, request?: Request) => void`  ℹ️ 关注  （变更 28 条 [ArkTS 28 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnTimeInfo = (timeInfo: TimeInfo) => void`  ℹ️ 关注  （变更 28 条 [ArkTS 28 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnTimeInfo = (timeInfo: TimeInfo, request?: Request) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnUploadProgress = (totalSize: number, transferredSize: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type OnUploadProgress = (totalSize: number, transferredSize: number, request?: Request) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type PhotoBrowserChangeStartCallback = (targetPhotoInfo: BaseItemInfo) => void`  ℹ️ 关注  （变更 42 条 [ArkTS 42 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type PhotoBrowserZoomCallback = (scale: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type PinchGridSwitchedCallback = (gridLevel: photoAccessHelper.GridLevel) => void`  ℹ️ 关注  （变更 42 条 [ArkTS 42 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ProxySender = (data: string) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type RecentPhotoCheckInfoCallback = (recentPhotoExists: boolean, info: RecentPhotoInfo) => void`  ℹ️ 关注  （变更 28 条 [ArkTS 28 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ResourceUsageObserver = (resourceType: ResourceType, resourceSize: number, detailInfo?: Record<string, number>) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ResponseHeaders = { \[k: string\]: string | string\[\] | undefined; 'accept-ranges'?: 'none' | 'bytes' | (string \& NonNullable<unknown>); 'allow'?: HttpMethod | HttpMethod\[\]; 'cache-control'?: string | string\[\]; 'content-encoding'?: ContentCoding; 'content-range'?: string; 'content-type'?: ContentType; 'date'?: string; 'etag'?: string; 'expires'?: string; 'location'?: string; 'retry-after'?: string; 'set-cookie'?: string | string\[\]; 'server'?: string; 'www-authenticate'?: string | string\[\]; }`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ResponseValidationCallback = (response: Response) => boolean | Promise<boolean>`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ScrollStopAtEndCallback = () => void`  ℹ️ 关注  （变更 42 条 [ArkTS 42 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ScrollStopAtStartCallback = () => void`  ℹ️ 关注  （变更 42 条 [ArkTS 42 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type SearchKeyCallback = (results: SearchResultData\[\]) => boolean`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type SetPreviewTextCallback = (text: string, range: Range) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type SizeChangeCallback = (size: window.Size, keyboardArea?: KeyboardArea) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type SubHeaderV2OperationItemAction = () => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type SubHeaderV2SelectOnSelect = (selectedIndex: number, selectedContent?: string) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type SubHeaderV2TitleBuilder = () => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type TargetFileCallback = (request: Request, suggestedPath: Path) => TargetFile | Promise<TargetFile>`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ToolBarV2ItemAction = (index: number) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type UpReadState = (readState: ReadStateCode) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type ValidationCallback = (context: ValidationContext) => boolean | Promise<boolean>`  ℹ️ 关注  （变更 28 条 [ArkTS 28 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type customInfoWindowCallback = (markerDelegate: map.MarkerDelegate) => void`  ℹ️ 关注  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `export type videoPlayStateChangedCallback = (state: VideoPlayerState) => void`  ℹ️ 关注  （变更 28 条 [ArkTS 28 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fastConvertToJSObject(xml: string, options?: ConvertOptions): Object`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0(26)] `接口行为变更`：修复ConvertXML的fastConvertToJSObject接口解析时丢失同级text节点的问题：xml.ConvertXML.fastConvertToJSObject

### `fontWeight(value: number | FontWeight | string): T`  ℹ️ 关注  （变更 22 条 [ArkTS 22 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight(value: number | FontWeight | string): TextAttribute`  ℹ️ 关注  （变更 44 条 [ArkTS 44 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute`  ℹ️ 关注  （变更 44 条 [ArkTS 44 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight: number`  ℹ️ 关注  （变更 22 条 [ArkTS 22 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight?: FontWeight`  ℹ️ 关注  （变更 22 条 [ArkTS 22 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `fontWeight?: number | FontWeight | string`  ℹ️ 关注  （变更 22 条 [ArkTS 22 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `format(date: Date): StyledString`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.1.0(23)] `接口行为变更`：全球化接口与运行时接口本地化显示优化及换行能力增强：i18n.StyledDateTimeFormat.format（共 3 处调用点）

### `format(date: Date): string`  ⚠️ 高风险  （变更 27 条 [ArkTS 27 / C++ 0]，其中高影响 21 条 [ArkTS 21 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：format(date: Date): string;（共 9 处调用点）
- [ArkTS] [5.0.1(13)] `接口行为变更`：时间日期格式“十一月”格式化结果错误问题修改：intl.DateTimeFormat.format（共 3 处调用点）
- [ArkTS] [6.0.0(20)] `接口行为变更`：泰国、沙特阿拉伯、阿富汗和伊朗的默认历法变更：intl.DateTimeFormat.format（共 3 处调用点）
- [ArkTS] [6.1.0(23)] `接口行为变更`：全球化接口与运行时接口本地化显示优化及换行能力增强：i18n.SimpleDateTimeFormat.format（共 3 处调用点）
- [ArkTS] [6.1.0(23)] `接口行为变更`：全球化接口与运行时接口本地化显示优化及换行能力增强：intl.DateTimeFormat.format（共 3 处调用点）

### `format(message: NdefMessage): Promise<void>`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `format(num: number): string`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `format(number: number): string`  ⚠️ 高风险  （变更 9 条 [ArkTS 9 / C++ 0]，其中高影响 6 条 [ArkTS 6 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：format(number: number): string;（共 6 处调用点）

### `format(number: string): string`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `format(value: double, unit: string): string`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.1.0(23)] `接口行为变更`：全球化接口与运行时接口本地化显示优化及换行能力增强：intl.RelativeTimeFormat.format（共 3 处调用点）

### `format(value: number): StyledString`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `format(value: number): string`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `format(value: number, unit: string): string`  ⚠️ 高风险  （变更 9 条 [ArkTS 9 / C++ 0]，其中高影响 9 条 [ArkTS 9 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：format(value: number, unit: string): string;（共 9 处调用点）

### `format(value: string): TextClockAttribute`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `format: ImageFormat`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `format: string`  ⚠️ 高风险  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [5.0.2(14)] `接口行为变更`：image接口Heif格式类型变更：image.PackingOption.format（共 3 处调用点）

### `format?: TimeFormat`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function bind(floatViewController: FloatViewController, floatingBallController: floatingBall.FloatingBallController, floatingBallParams: floatingBall.FloatingBallParams): Promise<void>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function byteLength(string: string | Buffer | TypedArray | DataView | ArrayBuffer | SharedArrayBuffer, encoding?: BufferEncoding): number`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function byteLength(value: string | FastBuffer | TypedArray | DataView | ArrayBuffer | SharedArrayBuffer, encoding?: BufferEncoding): number`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function cancel(group: TaskGroup): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function cancel(task: Task): void`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function cancel(taskId: number): void`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function cancel(url: string)`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function close(portId: number): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function createEffect(): VisualEffect`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.1(24)] `API卡片权限变更`：function createEffect(): VisualEffect;

### `function format(format: string, ...args: Object\[\]): string`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function open(portId: number): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function release(): Promise<boolean>`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function release(): Promise<void>`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `function showToast(options: ShowToastOptions): void`  ⚠️ 高风险  （变更 21 条 [ArkTS 21 / C++ 0]，其中高影响 21 条 [ArkTS 21 / C++ 0]）

- [ArkTS] [5.1.0(18)] `API废弃版本变更`：function showToast(options: ShowToastOptions): void;（共 7 处调用点）
- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质：promptAction.showToast（共 7 处调用点）
- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：内置文本的组件文本样式优化：promptAction.showToast（共 7 处调用点）

### `function unbind(floatViewController: FloatViewController, floatingBallController: floatingBall.FloatingBallController): Promise<void>`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `get(field: string): number`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `接口行为变更`：泰国、沙特阿拉伯、阿富汗和伊朗的默认历法变更：i18n.Calendar.get

### `getEvents(callback: AsyncCallback<Event\[\]>): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.1.0(23)] `权限变更`：getEvents(callback: AsyncCallback<Event\[\]>): void;
- [ArkTS] [26.0.0 Beta2] `权限变更`：getEvents(callback: AsyncCallback<Event\[\]>): void;

### `getEvents(eventFilter: EventFilter, eventKey: (keyof Event)\[\], callback: AsyncCallback<Event\[\]>): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.1.0(23)] `权限变更`：getEvents(eventFilter: EventFilter, eventKey: (keyof Event)\[\], callback: AsyncCallback<Event\[\]>): void;
- [ArkTS] [26.0.0 Beta2] `权限变更`：getEvents(eventFilter: EventFilter, eventKey: (keyof Event)\[\], callback: AsyncCallback<Event\[\]>): void;

### `getEvents(eventFilter?: EventFilter, eventKey?: (keyof Event)\[\]): Promise<Event\[\]>`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.1.0(23)] `权限变更`：getEvents(eventFilter?: EventFilter, eventKey?: (keyof Event)\[\]): Promise<Event\[\]>;
- [ArkTS] [26.0.0 Beta2] `权限变更`：getEvents(eventFilter?: EventFilter, eventKey?: (keyof Event)\[\]): Promise<Event\[\]>;

### `getFrameNodeByUniqueId(id: number): FrameNode | null`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `getKeyboardAvoidMode(): KeyboardAvoidMode`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.1.0(18)] `接口行为变更`：getKeyboardAvoidMode接口返回值变更：UIContext.getKeyboardAvoidMode

### `getOriginalUrl(): string`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `getReferrerUrl(): string`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `getUIContext(): UIContext`  ℹ️ 关注  （变更 9 条 [ArkTS 9 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `getUniqueId(): number`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `hourCycle: string`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：hourCycle: string;

### `initialIndex?: number`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.0.2(14)] `接口行为变更`：List组件首次创建布局时，Scroller控制器的跳转方法优先级变更为高于initialIndex的优先级：ListOptions.initialIndex

### `inputText(p: Point, text: string): Promise<void>`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `inputText(text: string): Promise<void>`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface AutoFinalizer`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface AuxiliaryPicture`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface AuxiliaryPictureInfo`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface BinaryBufferInfo`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface BlanklessFrameInterpolationInfo`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface BlanklessInfo`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface BlanklessLoadingParam`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface Color`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `删除API`：interface Color

### `interface DecodingOptionsForPicture`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface DecodingOptionsForThumbnail`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface FontFeature`  ℹ️ 关注  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface FontMetrics`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：interface FontMetrics（共 3 处调用点）

### `interface HdrComposeOptions`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface HeapMemoryInfo`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface HeapMemoryThreshold`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface ImageBufferData`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface ImageMetadata`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface ImageRawData`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface ImageReceiverOptions`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface Metadata`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface MultithreadingDetectionOptions`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface PackingOptionsForSequence`  ⚠️ 高风险  （变更 9 条 [ArkTS 9 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [5.0.1(13)] `删除API`：interface PackingOptionsForSequence（共 3 处调用点）

### `interface PackingOptionsForTiff`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface PackingSizeLimit`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface PdfConfiguration`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface Picture`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface ScrollOffset`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface SecurityParams`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface TextBlobRunBuffer`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：interface TextBlobRunBuffer（共 3 处调用点）

### `interface VisualEffect`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.2(22)] `API卡片权限变更`：interface VisualEffect

### `interface WebHttpCookie`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface XMPEnumerateOptions`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface XMPNamespace`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface XMPTag`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `interface XmlSAXHandler`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `invalidate(): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `invert(): Matrix2D`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `invert(matrix: Matrix): Boolean`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：invert(matrix: Matrix): Boolean;

### `invert(value: number | InvertOptions): T`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `isEqual(matrix: Matrix): Boolean`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：isEqual(matrix: Matrix): Boolean;

### `isEqual(other: Region): boolean`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `isEqual(path: Path): boolean`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `isIdentity(): Boolean`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：isIdentity(): Boolean;

### `isVisible(): boolean`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.0.3(15)] `接口行为变更`：FrameNode被UINode包裹时isVisible接口返回值发生变更：FrameNode.isVisible

### `isVisible: boolean`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `language: string`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：language: string;

### `letterSpacing(value: number | string): TextAttribute`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage: LocalStorage): Promise<void>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage: LocalStorage, callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `loadContent(path: string, storage?: LocalStorage): Promise<void>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `locale: string`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：locale: string;（共 3 处调用点）

### `locale?: Intl.Locale`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `删除API`：locale?: Intl.Locale;

### `locale?: string`  ⚠️ 高风险  （变更 5 条 [ArkTS 5 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：locale?: string;（共 3 处调用点）

### `maximize(): Locale`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：maximize(): Locale;
- [ArkTS] [6.1.0(23)] `接口行为变更`：全球化接口与运行时接口本地化显示优化及换行能力增强：intl.Locale.maximize

### `maximize(presentation?: MaximizePresentation): Promise<void>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `menus(value: Array<NavigationMenuItem> | CustomBuilder): NavDestinationAttribute`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `menus(value: Array<NavigationMenuItem> | CustomBuilder): NavigationAttribute`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `mimeType: string`  ⚠️ 高风险  （变更 6 条 [ArkTS 6 / C++ 0]，其中高影响 6 条 [ArkTS 6 / C++ 0]）

- [ArkTS] [5.0.2(14)] `接口行为变更`：image接口Heif格式类型变更：image.ImageInfo.mimeType（共 3 处调用点）
- [ArkTS] [6.0.0(20)] `接口行为变更`：ImageInfo对象mimeType返回值变更：image.ImageInfo.mimeType（共 3 处调用点）

### `moveTo(displayId: number, displayX: number, displayY: number): Promise<void>`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `moveTo(targetParent: FrameNode, index?: number): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `moveTo(x: number, y: number): void`  ⚠️ 高风险  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：moveTo(x: number, y: number): void;
- [ArkTS] [5.1.0(18)] `接口行为变更`：CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制：CanvasPath.moveTo

### `navDestination(builder: (name: string, param: unknown) => void): NavigationAttribute`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.0.1(13)] `UX视觉布局变更`：NavDestination的Dialog模式默认支持系统动画：NavigationAttribute.navDestination

### `numberingSystem: string`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：numberingSystem: string;

### `numeric: boolean`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：numeric: boolean;

### `onChange?: (value: Date) => void`  ℹ️ 关注  （变更 5 条 [ArkTS 5 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `onDisAppear(event: () => void): T`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.1.0(18)] `接口行为变更`：页面退出场景自定义组件删除前移：CommonMethod.onDisAppear

### `onMouse(event: (event: MouseEvent) => void): T`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.0.1(13)] `接口行为变更`：鼠标按键处理行为变更：CommonMethod.onMouse

### `onVisibleAreaChange(ratios: Array<number>, event: (isVisible: boolean, currentRatio: number) => void): T`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `onVisibleAreaChange(ratios: Array<number>, event: VisibleAreaChangeCallback, measureFromViewport: boolean): T`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `open(): Promise<void>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `open(callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `open(config?: SerialConfigs): Promise<void>`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `open(isSecureEnabled: boolean): Promise<bigint>`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `open(type: CameraConcurrentType): Promise<void>`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `open: SourceOpenCallback`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `parseXml(option: ParseOptions): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `play(): void`  ℹ️ 关注  （变更 8 条 [ArkTS 8 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `play(soundType: systemSoundManager.SystemSoundType): Promise<void>`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `pushPathByName(name: string, param: Object, animated?: boolean, policy?: SplitPolicy): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `pushPathByName(name: string, param: Object, onPop?: base.Callback<PopInfo>, animated?: boolean, policy?: SplitPolicy): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `readonly buffer: ArrayBuffer`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `readonly canvas: FrameNode`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `readonly format: ARImageFormat`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `readonly format: CameraFormat`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `readonly pixelMap: image.PixelMap`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `readonly reuseId?: string`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `readonly supportedFormats: Array<string>`  ⚠️ 高风险  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 4 条 [ArkTS 4 / C++ 0]）

- [ArkTS] [5.0.2(14)] `接口行为变更`：image接口Heif格式类型变更：image.ImagePacker.supportedFormats（共 2 处调用点）
- [ArkTS] [5.0.2(14)] `接口行为变更`：image接口Heif格式类型变更：image.ImageSource.supportedFormats（共 2 处调用点）

### `region: string`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：region: string;

### `release(): Promise<void>`  ℹ️ 关注  （变更 5 条 [ArkTS 5 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `release(): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `release(callback: AsyncCallback<void>): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `renderFit(fitMode: Optional<RenderFit>): T`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `renderFit(fitMode: RenderFit): T`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [5.1.0(18)] `API卡片权限变更`：renderFit(fitMode: RenderFit): T;
- [ArkTS] [5.1.0(18)] `接口行为变更`：XComponent组件上使用renderFit接口显示效果变更：CommonMethod.renderFit

### `reset(): Promise<void>`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `reset(): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：reset(): void;（共 2 处调用点）

### `reset(options: AnimatorOptions): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `restore(): Promise<void>`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `restore(): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：restore(): void;（共 3 处调用点）

### `reuse(): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `reuse(options: ReuseOptions): T`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0(26)] `接口行为变更`：@ReusableV2组件复用的reuse属性支持动态复用标识：CommonMethod.reuse

### `reuse(param?: Object): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `rotate(angle: number): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [5.1.0(18)] `接口行为变更`：CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制：CanvasRenderer.rotate（共 3 处调用点）

### `rotate(degrees: number, sx: number, sy: number): void`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：rotate(degrees: number, sx: number, sy: number): void;（共 3 处调用点）

### `rotate(options: Optional<RotateOptions>): T`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `rotate(rx?: number, ry?: number): Matrix2D`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `rotate(value: RotateOptions): T`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `save(): number`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：save(): number;（共 3 处调用点）

### `scale(sx: number, sy: number): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：scale(sx: number, sy: number): void;

### `scale(sx?: number, sy?: number): Matrix2D`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `scale(value: ScaleOptions): T`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `scale(value: { x?: number; y?: number; z?: number; centerX?: number | string; centerY?: number | string; }): T`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `scale(x: number, y: number): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.1.0(18)] `接口行为变更`：CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制：CanvasRenderer.scale

### `script: string`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API废弃版本变更`：script: string;

### `searchButton(value: ResourceStr, option?: SearchButtonOptions): SearchAttribute`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：内置文本的组件文本样式优化：SearchAttribute.searchButton

### `searchButton(value: string, option?: SearchButtonOptions): SearchAttribute`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `selected(value: number | Resource): SelectAttribute`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `setColorMode(colorMode: ConfigurationConstant.ColorMode): void`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `showCounter(value: boolean, options?: InputCounterOptions): TextInputAttribute`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [5.0.1(13)] `UX视觉布局变更`：TextInput组件在非标准字体场景下showCounter接口布局变更：TextInputAttribute.showCounter（共 2 处调用点）

### `showToast(options: promptAction.ShowToastOptions): void`  ⚠️ 高风险  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 14 条 [ArkTS 14 / C++ 0]）

- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质：PromptAction.showToast（共 7 处调用点）
- [ArkTS] [26.0.0(26)] `UX视觉布局变更`：内置文本的组件文本样式优化：PromptAction.showToast（共 7 处调用点）

### `span?: number | GridColColumnOption`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `接口行为变更`：GridRow组件columns参数和GridCol组件span参数默认值变更：GridColOptions.span

### `static close()`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [5.1.0(18)] `API废弃版本变更`：static close();（共 3 处调用点）

### `static createLinearGradient(startPt: common2D.Point, endPt: common2D.Point, colors: Array<number>, mode: TileMode, pos?: Array<number> | null, matrix?: Matrix | null): ShaderEffect`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：static createLinearGradient(startPt: common2D.Point, endPt: common2D.Point, colors: Array<number>, mode: TileMode, pos?: Array<number> | null, matrix?: Matrix | null): ShaderEffec…

### `static enableLocalHandleDetection(): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `static getDisplayCountry(country: string, locale: string, sentenceCase?: boolean): string`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [5.0.1(13)] `接口行为变更`：国家、地区本地化名称变更：i18n.System.getDisplayCountry
- [ArkTS] [6.1.0(23)] `接口行为变更`：全球化接口与运行时接口本地化显示优化及换行能力增强：i18n.System.getDisplayCountry

### `static getDisplayLanguage(language: string, locale: string, sentenceCase?: boolean): string`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `接口行为变更`：全球化接口与运行时接口本地化显示优化及换行能力增强：i18n.System.getDisplayLanguage

### `static getInstance(): TreeListenerManagerV2`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `static isEqual(rect: common2D.Rect, other: common2D.Rect): boolean`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `static readonly matchParent: LayoutPolicy`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `接口行为变更`：width和height支持的matchParent接口规格变更：LayoutPolicy.matchParent
- [ArkTS] [26.0.0(26)] `接口行为变更`：LayoutPolicy.matchParent父组件为Row、Column、Flex组件时，单方向设置matchParent的子组件布局行为变更：LayoutPolicy.matchParent

### `stroke(value: ResourceColor | ColorMetrics): T`  ℹ️ 关注  （变更 4 条 [ArkTS 4 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `tabBar(value: SubTabBarStyle | BottomTabBarStyle): TabContentAttribute`  ℹ️ 关注  （变更 5 条 [ArkTS 5 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `tabBar(value: string | Resource | CustomBuilder | { icon?: string | Resource; text?: string | Resource; }): TabContentAttribute`  ℹ️ 关注  （变更 5 条 [ArkTS 5 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `title(value: string | CustomBuilder | NavDestinationCommonTitle | NavDestinationCustomTitle | Resource, options?: NavigationTitleOptions): NavDestinationAttribute`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `transform(a: number, b: number, c: number, d: number, e: number, f: number): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [5.1.0(18)] `接口行为变更`：CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制：CanvasRenderer.transform

### `transform(matrix: Mat4x4): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `transform(matrix: Matrix): void`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：transform(matrix: Matrix): void;

### `transform(text: string): string`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.1.0(23)] `接口行为变更`：全球化接口与运行时接口本地化显示优化及换行能力增强：i18n.Transliterator.transform

### `transform(value: object): T`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `translate(dx: number, dy: number): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [6.0.0(20)] `API跨平台权限变更`：translate(dx: number, dy: number): void;（共 2 处调用点）

### `translate(tx?: number, ty?: number): Matrix2D`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `translate(value: TranslateOptions): T`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `translate(value: { x?: number | string; y?: number | string; z?: number | string; }): T`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `translate(x: number, y: number): void`  ⚠️ 高风险  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 2 条 [ArkTS 2 / C++ 0]）

- [ArkTS] [5.1.0(18)] `接口行为变更`：CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制：CanvasRenderer.translate（共 2 处调用点）

### `type LocationButtonCallback = (event: ClickEvent, result: LocationButtonOnClickResult, error?: BusinessError<void>) => void`  ⚠️ 高风险  （变更 14 条 [ArkTS 14 / C++ 0]，其中高影响 14 条 [ArkTS 14 / C++ 0]）

- [ArkTS] [6.0.0(20)] `接口废弃变更`：位置控件功能变更：unnamed.LocationButtonCallback（共 14 处调用点）

### `uiContext?: Context`  ℹ️ 关注  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `unbind(): void`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `value?: string`  ℹ️ 关注  （变更 2 条 [ArkTS 2 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `windowStage: window.WindowStage`  ⚠️ 高风险  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 1 条 [ArkTS 1 / C++ 0]）

- [ArkTS] [6.0.1(21)] `API跨平台权限变更`：windowStage: window.WindowStage;

### `windowStage?: window.WindowStage`  ℹ️ 关注  （变更 1 条 [ArkTS 1 / C++ 0]，其中高影响 0 条 [ArkTS 0 / C++ 0]）


### `zIndex(value: number): T`  ⚠️ 高风险  （变更 3 条 [ArkTS 3 / C++ 0]，其中高影响 3 条 [ArkTS 3 / C++ 0]）

- [ArkTS] [5.0.2(14)] `接口行为变更`：修复zIndex接口会影响组件在3D变换中的透视效果的错误行为：CommonMethod.zIndex（共 3 处调用点）

---
*本文档由 hoscanner 的 UpgradeAdvisor 自动生成。*