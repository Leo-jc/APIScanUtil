# CheckerboardDrawable

基于 https://github.com/duanhong169/CheckerboardDrawable.git 开发，适配鸿蒙版本。

一个自定义 HarmonyOS（ArkTS）库，提供棋盘格背景绘制能力。通过 Builder 配置格子尺寸和奇偶颜色，在 Canvas 上绘制可平铺的棋盘格图案，用于表示"透明"背景区域。

## 目录结构

```
CheckerboardDrawable/
├── ohos_library/                        # HAR 源码（库模块）
│   ├── Index.ets                        # 公开 API 导出
│   ├── oh-package.json5                 # 包名：checkerboarddrawable
│   ├── src/main/module.json5           # 模块名：checkerboarddrawable，类型：har
│   ├── src/main/ets/
│   │   ├── CheckerboardDrawable.ets     # 核心类 + Builder + argbToHex 工具函数
│   │   └── components/
│   │       └── CheckerboardBackground.ets # ArkUI 自绘组件
│   └── src/main/resources/
│       └── base/element/               # 资源文件
│
├── ohos_hardemo/                        # Demo 应用
│   ├── build-profile.json5             # 通过 srcPath: "../ohos_library" 引入 HAR 模块（name: checkerboarddrawable）
│   ├── oh-package.json5                # 通过 file:../ohos_library 声明本地依赖
│   ├── AppScope/                        # 应用级配置
│   └── entry/                           # Demo 入口模块
│       ├── src/main/ets/
│       │   ├── entryability/EntryAbility.ets
│       │   └── pages/Index.ets          # Demo 主页面
│       └── src/main/resources/
│           ├── base/element/            # 颜色、字符串、字号资源
│           └── dark/element/             # 深色模式颜色资源
│
└── .ohos-adaptation/                    # 适配文档
    └── 02-implementation-report.md      # 实现报告
```

## 环境要求

- HarmonyOS compatibleSdkVersion: 5.1.1(19) 及以上
- DevEco Studio（内置 hvigor、ohpm 工具链）
- HarmonyOS 运行时

## 快速开始

### 1. 在项目中引用 HAR

在应用的 `oh-package.json5` 中添加本地依赖：

```json
{
  "dependencies": {
    "checkerboarddrawable": "file:../ohos_library"
  }
}
```

在 `build-profile.json5` 的 `modules` 中引入 HAR 模块：

```json5
{
  "modules": [
    {
      "name": "entry",
      "srcPath": "./entry"
    },
    {
      "name": "checkerboarddrawable",
      "srcPath": "../ohos_library"
    }
  ]
}
```

### 2. 使用 CheckerboardDrawable

```typescript
import { CheckerboardDrawable, CheckerboardBackground } from 'checkerboarddrawable';

// 方式一：使用默认配置
let drawable = CheckerboardDrawable.create();

// 方式二：自定义配置（Builder 模式）
let drawable = CheckerboardDrawable.Builder()
  .size(20)
  .colorOdd('#CCCCCC')
  .colorEven('#444444')
  .build();

// 设置透明度（0=完全透明，255=完全不透明）
drawable.setAlpha(128);

// 在 Canvas 上绘制
// drawable.draw(context, width, height);
```

### 3. 使用 CheckerboardBackground 组件

```typescript
import { CheckerboardDrawable, CheckerboardBackground } from 'checkerboarddrawable';

@Entry
@Component
struct MyPage {
  private drawable: CheckerboardDrawable = CheckerboardDrawable.Builder()
    .size(20)
    .colorOdd('#CCCCCC')
    .colorEven('#444444')
    .build();

  build() {
    Stack() {
      // 棋盘格背景
      CheckerboardBackground({ drawable: this.drawable })

      // 上层内容
      Text('Hello World!')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
    }
  }
}
```

### 4. 运行 Demo

```bash
cd ohos_hardemo
ohpm install
hvigorw -e assembleHap --mode module -p product=default -p buildMode=debug --no-daemon
```

编译产物位于 `ohos_hardemo/entry/build/default/outputs/default/entry-default-unsigned.hap`。

## API 参考

### CheckerboardDrawable

棋盘格绘制器，持有格子尺寸、奇偶颜色和透明度配置。

| 方法/属性 | 签名 | 说明 |
|---|---|---|
| `create()` | `static create(): CheckerboardDrawable` | 静态工厂，使用默认参数创建实例（size=40, colorOdd='#FFC2C2C2', colorEven='#FFF3F3F3'） |
| `Builder()` | `static Builder(): CheckerboardDrawableBuilder` | 创建 Builder 实例，用于链式配置后构造 |
| `getSize()` | `getSize(): number` | 获取格子边长（vp） |
| `getColorOdd()` | `getColorOdd(): string` | 获取奇数格颜色（hex 字符串） |
| `getColorEven()` | `getColorEven(): string` | 获取偶数格颜色（hex 字符串） |
| `getAlpha()` | `getAlpha(): number` | 获取透明度（0-255） |
| `getOpacity()` | `getOpacity(): number` | 返回不透明度常量 1（OPAQUE） |
| `setAlpha()` | `setAlpha(alpha: number): void` | 设置透明度（0=透明，255=不透明） |
| `draw()` | `draw(context: CanvasRenderingContext2D, width: number, height: number): void` | 在指定画布上下文上绘制棋盘格图案 |

### CheckerboardDrawableBuilder

链式构建器，对应 Builder 设计模式。

| 方法 | 签名 | 默认值 | 说明 |
|---|---|---|---|
| `size()` | `size(n: number): CheckerboardDrawableBuilder` | 40 | 设置格子边长（vp） |
| `colorOdd()` | `colorOdd(color: string): CheckerboardDrawableBuilder` | '#FFC2C2C2' | 设置奇数格颜色（hex） |
| `colorEven()` | `colorEven(color: string): CheckerboardDrawableBuilder` | '#FFF3F3F3' | 设置偶数格颜色（hex） |
| `build()` | `build(): CheckerboardDrawable` | — | 构造 CheckerboardDrawable 实例 |

### argbToHex

```typescript
function argbToHex(argb: number): string
```

将 ARGB int 颜色转为 hex 字符串。例如 `argbToHex(0xFFC2C2C2)` 返回 `'#FFC2C2C2'`。

### CheckerboardBackground

ArkUI 自定义组件，接收 `CheckerboardDrawable` 实例，通过 Canvas 渲染棋盘格背景。

| 参数 | 类型 | 默认值 | 说明 |
|---|---|---|---|
| `drawable` | `CheckerboardDrawable` | `CheckerboardDrawable.create()` | 棋盘格配置实例 |

| 方法 | 说明 |
|---|---|
| `redraw()` | 手动触发重绘（配置变更后调用） |

### 棋盘格规则

棋盘格图案中，网格位置 `(r, c)` 处：
- `(r + c)` 为偶数 → 使用 `colorOdd`
- `(r + c)` 为奇数 → 使用 `colorEven`

即左上角为 `colorOdd`，与标准棋盘格一致。

## 开源许可

本项目基于 [Apache License 2.0](./LICENSE) 开源。如果在使用过程中有任何问题，可以在GitCode提Issue，会及时跟进。issue地址：[issues](https://gitcode.com/ohos_third_party_lib/CheckerboardDrawable/issues)。
