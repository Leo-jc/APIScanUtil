如果在使用过程中有任何问题，可以在GitCode提Issue，会及时跟进。issue地址：[issues](https://gitcode.com/ohos_third_party_lib/FluidLayout/issues)。

# FluidLayout

基于 https://github.com/ifynn/FluidLayout 开发，适配鸿蒙版本

## 项目介绍

FluidLayout 是 HarmonyOS（ArkTS）流式布局容器。子项从左到右依次排列，超出可用宽度（扣除左右内边距）自动换行，多行自上而下堆叠；支持容器级与逐子项级的垂直对齐（Top / Center / Bottom），常用于标签云、标签流等场景。该组件以 ArkUI 自定义布局（`onMeasureSize` / `onPlaceChildren`）实现，换行与对齐算法完整、可配置、运行态可变。

支持的能力：
- 流式换行排列，多行自上而下堆叠
- 容器级默认垂直对齐（Top / Center / Bottom），运行态可切换
- 逐子项垂直对齐覆盖（单子项可单独指定，覆盖容器默认，同一行内可混合）
- 子项四向外边距、容器四向内边距，均参与换行判定与行高计算
- 子项可见性控制（不可见项不占位、不参与测量与布局）
- 高度随内容自适应，便于外层可滚动容器嵌套

## 目录结构

```
FluidLayout/
├── ohos_library/                    # HAR 源码（流式布局组件）
│   ├── Index.ets                    # 对外导出入口
│   ├── oh-package.json5             # 模块名 fluidlayout
│   ├── build-profile.json5
│   └── src/main/
│       ├── module.json5             # module.name = fluidlayout，type = har
│       └── ets/components/
│           └── FluidLayout.ets      # FluidLayout 组件及类型定义
└── ohos_hardemo/                    # Demo 应用
    ├── build-profile.json5          # 通过 srcPath: "../ohos_library" 引入 HAR 模块
    ├── oh-package.json5             # 通过 "fluidlayout": "file:../ohos_library" 声明本地依赖
    └── entry/                       # Demo 模块
        └── src/main/ets/pages/
            └── Index.ets            # 可滚动标签流 + 操作按钮 + 日志区
```

HAR 源码位于根目录 `ohos_library/`，Demo 位于 `ohos_hardemo/entry/`。`ohos_hardemo/build-profile.json5` 通过 `srcPath: "../ohos_library"` 引入 HAR 模块（模块名 `fluidlayout`），`ohos_hardemo/oh-package.json5` 通过 `fluidlayout: "file:../ohos_library"` 声明本地依赖。模块名默认为 `library`，可根据需要自行修改。

## 环境要求

- HarmonyOS SDK：compatibleSdkVersion `5.1.1(19)` 及以上，targetSdkVersion `6.0.2(22)`
- DevEco Studio
- ArkTS / ArkUI（Stage 模型）

## 快速开始

1. 在 `ohos_hardemo/` 下安装依赖并编译：

```bash
cd ohos_hardemo
ohpm install
hvigorw -e assembleHap --mode module -p product=default -p buildMode=debug --no-daemon
```

2. 将生成的 HAP 安装到设备运行 Demo。

3. 在自己的工程中引用本 HAR：将 `ohos_library/` 作为本地依赖加入工程，在 `oh-package.json5` 声明：

```json5
{
  "dependencies": {
    "fluidlayout": "file:../ohos_library"
  }
}
```

并在工程级 `build-profile.json5` 的 `modules` 中加入：

```json5
{
  "name": "fluidlayout",
  "srcPath": "../ohos_library"
}
```

4. 在页面中使用 `FluidLayout`：

```ets
import { FluidLayout, FluidGravity, FluidItem } from 'fluidlayout';

@Entry
@Component
struct Index {
  @State items: FluidItem[] = [
    { data: '标签一', gravity: null, margin: { left: 12, top: 12, right: 12, bottom: 12 }, visible: true },
    { data: '标签二', gravity: FluidGravity.Bottom, margin: { left: 12, top: 12, right: 12, bottom: 12 }, visible: true }
  ];

  @Builder
  tagBuilder(item: FluidItem, index: number) {
    Text(item.data)
      .fontSize(13)
      .borderRadius(3)
      .padding(4)
      .border({ width: '1px', color: '#999999' })
  }

  build() {
    Scroll() {
      FluidLayout({
        gravity: FluidGravity.Center,
        items: this.items,
        fluidPadding: { left: 5, top: 5, right: 5, bottom: 5 },
        itemBuilder: (item: FluidItem, index: number) => {
          this.tagBuilder(item, index)
        }
      })
        .width('100%')
    }
  }
}
```

> 说明：`itemBuilder` 需通过箭头函数 `(item, index) => { this.tagBuilder(item, index) }` 传入，以使 `@Builder` 内的 `this` 保持在调用方组件，从而访问其状态变量。

## API 参考

### `FluidLayout` 组件

流式布局容器，通过 `onMeasureSize` / `onPlaceChildren` 自定义布局实现。

| 参数 | 类型 | 必填 | 默认值 | 说明 |
| --- | --- | --- | --- | --- |
| `gravity` | `FluidGravity` | 否 | `FluidGravity.Top` | 容器级默认垂直对齐，运行态可变。对应 `setGravity`。 |
| `items` | `FluidItem[]` | 否 | `[]` | 子项数据数组，运行态可变（增删 / 改对齐 / 改可见性）。对应 `addView` / `removeAllViews`。 |
| `fluidPadding` | `FluidPadding` | 否 | `{left:0,top:0,right:0,bottom:0}` | 容器四向内边距（vp），参与换行判定与最终尺寸。对应 `setPadding`。 |
| `itemBuilder` | `(item: FluidItem, index: number) => void` | 否 | 默认渲染 `Text(item.data)` | 子项构建器，`index` 为 `items` 原始下标（含不可见项）。 |

> `fluidPadding` 不使用 `padding` 命名，以避免与 `CustomComponent` 基类的 `padding()` 通用属性方法冲突。

### `FluidGravity` 枚举

垂直对齐方式。

| 成员 | 说明 |
| --- | --- |
| `Top` | 贴行顶对齐 |
| `Center` | 行内垂直居中对齐 |
| `Bottom` | 贴行底对齐 |

### `FluidItem` 子项描述

| 属性 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| `data` | `string` | `''` | 子项业务数据，供 `itemBuilder` 渲染。 |
| `gravity` | `FluidGravity \| null` | `null` | 逐子项垂直对齐；`null` 表示回退容器级 `gravity`（对应 `LayoutParams.gravity = -1`）。 |
| `margin` | `FluidMargin` | `{0,0,0,0}` | 子项四向外边距（vp）。 |
| `visible` | `boolean` | `true` | 是否可见；`false` 时不参与测量与布局（对应 `View.GONE`，全程不占位）。 |

### `FluidMargin` / `FluidPadding`

四向外边距 / 内边距，均为 `number`（vp），字段：`left`、`top`、`right`、`bottom`。

### 布局语义

- 子项从左到右排列，当 `已用行宽 + 当前子项宽(含左右margin) > 可用宽(容器宽−左右内边距)` 时，当前子项换到下一行行首；多行自上而下堆叠。
- 行高 = 行内各子项（含上下 margin）的最大值。
- 子项 `gravity` 优先于容器 `gravity`；`Top` 贴行顶，`Center` 行内居中（`行高−上下margin−子项高` 的剩余空间对半），`Bottom` 贴行底。
- 容器宽度约束为有限值时撑满约束宽，否则取最长行宽 + 左右内边距；高度同理。

## 开源许可

```
Copyright Fynn

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
