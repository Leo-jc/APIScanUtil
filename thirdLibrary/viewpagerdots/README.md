# ViewPager Dots

基于 https://github.com/afollestad/viewpagerdots 开发，适配鸿蒙版本。

一个轻量级的 HarmonyOS（ArkTS）Swiper 指示圆点库。圆点可以替换为任意图片资源，动画和外观均可自定义。

---

## 项目介绍

viewpagerdots 提供一个 `DotsIndicator` 组件，用于为 `Swiper` 显示指示圆点条。选中页对应的圆点放大并提高不透明度，未选中圆点缩小并降低不透明度，切换页面时通过属性动画过渡。所有可配置项（尺寸、间距、颜色、着色、图片、方向、对齐、动画）均保持可配。

### 特性

- 圆点尺寸、间距、颜色可配
- 运行时动态着色（`setDotTint` / `setDotTintRes`）
- 运行时切换圆点图片（`setDotDrawable`）
- 指示条方向（水平 / 垂直）可配
- 指示条整体对齐方式可配
- 选中 / 未选中态属性动画过渡（缩放 + 不透明度）
- 通过 `@Observed` 控制器实现响应式刷新，调用方法即生效

---

## 目录结构

```
viewpagerdots/
├── ohos_library/                  # HAR 源码（库本体）
│   ├── Index.ets                  # 公开 API 导出
│   ├── oh-package.json5           # HAR 包配置，name = "viewpagerdots"
│   ├── build-profile.json5
│   ├── hvigorfile.ts
│   └── src/main/
│       ├── module.json5           # 模块配置，module.name = "viewpagerdots"
│       ├── ets/components/
│       │   └── DotsIndicator.ets  # DotsIndicator 组件 + Controller + 枚举
│       └── resources/
│           ├── base/element/
│           │   ├── color.json     # 默认圆点颜色
│           │   ├── float.json     # 默认尺寸资源
│           │   └── string.json
│           └── base/media/
│               └── black_dot.svg  # 默认圆点图片资源（供 setDotDrawable 使用）
│
├── ohos_hardemo/                  # Demo 应用
│   ├── build-profile.json5        # 通过 srcPath: "../ohos_library" 引入 HAR 模块
│   ├── oh-package.json5           # 通过 "viewpagerdots": "file:../ohos_library" 声明本地依赖
│   ├── AppScope/
│   │   └── app.json5              # bundleName = com.afollestad.viewpagerdots.sample
│   └── entry/                     # Demo 入口模块
│       ├── src/main/
│       │   ├── module.json5
│       │   ├── ets/
│       │   │   ├── pages/Index.ets        # 主页面
│       │   │   └── entryability/          # Ability 入口
│       │   └── resources/                 # 颜色 / 字号 / 字符串资源
│       └── oh-package.json5
│
├── LICENSE.md                     # Apache-2.0 许可证
└── README.md
```

> HAR 源码位于根目录 `ohos_library/`，Demo 位于 `ohos_hardemo/entry/`。
> `ohos_hardemo/build-profile.json5` 通过 `srcPath: "../ohos_library"` 引入 HAR 模块，
> `ohos_hardemo/oh-package.json5` 通过 `file:../ohos_library` 声明本地依赖。
> HAR 模块名称为 `viewpagerdots`，可根据需要自行修改。

---

## 环境要求

- HarmonyOS compatibleSdkVersion 5.1.1(API 19) 及以上
- DevEco Studio（推荐最新稳定版）
- HarmonyOS SDK（Stage 模型）

---

## 快速开始

### 1. 添加依赖

在你的模块 `oh-package.json5` 中添加：

```json5
{
  "dependencies": {
    "viewpagerdots": "file:../ohos_library"
}
```

如果你的 HAR 已发布到 ohpm 仓库，也可使用：

```json5
{
  "dependencies": {
    "viewpagerdots": "^1.0.0"
  }
}
```

### 2. 在页面中使用

```typescript
import { DotsIndicator, DotsIndicatorController, DotsOrientation, DotsGravity } from 'viewpagerdots';

@Entry
@Component
struct Index {
  @State controller: DotsIndicatorController = new DotsIndicatorController();
  @State selectedIndex: number = 0;

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Swiper() {
        // 你的页面内容
      }
      .indicator(false)
      .onChange((index: number) => {
        this.selectedIndex = index;
      })

      DotsIndicator({
        controller: this.controller,
        selectedIndex: this.selectedIndex,
        pageCount: 4,
      })
        .width('100%')
        .height(48)
    }
  }
}
```

---

## API 参考

### DotsIndicator 组件

| 参数 | 类型 | 默认值 | 说明 |
|---|---|---|---|
| `controller` | `DotsIndicatorController` | — | 运行时状态控制器，承载 setDotTint / setDotTintRes / setDotDrawable |
| `selectedIndex` | `number` | `0` | 当前选中页索引，由 Swiper.onChange 驱动 |
| `pageCount` | `number` | `0` | 总页数 |
| `dotWidth` | `number` | `5` | 单个圆点宽度（vp） |
| `dotHeight` | `number` | `5` | 单个圆点高度（vp） |
| `dotMargin` | `number` | `5` | 圆点间距（vp，每侧） |
| `dotColor` | `ResourceColor` | `'#000000'` | 默认圆点颜色（Circle 渲染模式） |
| `orientation` | `DotsOrientation` | `HORIZONTAL` | 指示条方向 |
| `gravity` | `DotsGravity` | `CENTER` | 指示条整体对齐方式 |

### DotsIndicatorController

运行时修改圆点外观的控制器。以 `@State` 持有实例，传入 `DotsIndicator`，调用方法后自动触发响应式刷新。

```typescript
@State controller: DotsIndicatorController = new DotsIndicatorController();
```

#### setDotTint(color: ResourceColor): void

给所有圆点着色。

```typescript
this.controller.setDotTint('#FAFAFA');        // 白色
this.controller.setDotTint($r('app.color.white'));  // 资源色
```

#### setDotTintRes(colorRes: Resource): void

从颜色资源着色。

```typescript
this.controller.setDotTintRes($r('app.color.black'));
```

#### setDotDrawable(indicatorRes: Resource, unselectedIndicatorRes?: Resource): void

切换圆点为图片资源渲染模式。`unselectedIndicatorRes` 省略时与 `indicatorRes` 一致。

```typescript
this.controller.setDotDrawable($r('app.media.black_dot'));
this.controller.setDotDrawable($r('app.media.my_dot'), $r('app.media.my_dot_unselected'));
```

> **注意**：图片模式下，`setDotTint` 通过 `fillColor` 着色，仅对 SVG 矢量图生效；PNG 位图无法着色。默认 Circle 渲染模式（未调用 setDotDrawable）下，`setDotTint` 直接修改填充色，无此限制。

### DotsOrientation 枚举

| 成员 | 值 | 说明 |
|---|---|---|
| `HORIZONTAL` | `0` | 水平排列 |
| `VERTICAL` | `1` | 垂直排列 |

### DotsGravity 枚举

| 成员 | 说明 |
|---|---|
| `TOP` / `BOTTOM` / `LEFT` / `RIGHT` | 向各边对齐 |
| `CENTER` | 居中（默认） |
| `CENTER_VERTICAL` / `CENTER_HORIZONTAL` | 单轴居中 |
| `START` / `END` | 起始 / 结束对齐 |
| `FILL` / `FILL_HORIZONTAL` / `FILL_VERTICAL` | 均匀填充 |

---

## 开源许可

本项目基于 Apache License 2.0 开源，详见 [LICENSE.md](LICENSE.md)。如果在使用过程中有任何问题，可以在GitCode提Issue，会及时跟进。issue地址：[issues](https://gitcode.com/ohos_third_party_lib/viewpagerdots/issues)。

Copyright 2018 Aidan Follestad

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
