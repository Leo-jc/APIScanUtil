如果在使用过程中有任何问题，可以在GitCode提Issue，会及时跟进。issue地址：[issues](https://gitcode.com/ohos_third_party_lib/InsLoadingAnimation/issues)。

# InsLoadingAnimation

基于 https://github.com/qintong91/InsLoadingAnimation.git 开发，适配鸿蒙版本

InsLoadingAnimation 是仿 Instagram / 微博 头像点击加载动画的 HarmonyOS（ArkTS）库：以圆形头像为中心，外围环绕一条带渐变色的进度弧并进行旋转 / 伸缩动画，提供 `LOADING` / `CLICKED` / `UNCLICKED` 三种状态切换，按下时有 0.9 缩放反馈。

## 环境要求

- DevEco Studio 6.0.0 及以上
- HarmonyOS SDK `compatibleSdkVersion = 5.1.1(19)`，`targetSdkVersion = 6.0.2(22)`
- ArkTS / ArkUI 声明式开发范式（Stage 模型）

## 快速开始

本仓库为 `library`（HAR）+ `entry`（HAP）双模块工程，位于 `ohos_hardemo/`。

```bash
cd ohos_hardemo
ohpm install
# 编译 HAR
hvigorw -e assembleHar --mode module -p module=library@default -p product=default --no-daemon
# 编译 HAP（无需签名）
hvigorw -e assembleHap --mode module -p product=default -p buildMode=debug -p module=entry --no-daemon
```

在自身工程中使用本 HAR：将 `library.har` 加入 `oh-package.json5` 依赖，或在源码依赖场景下引用本地 `library` 模块。

```json5
// 你的模块 oh-package.json5
{
  "dependencies": {
    "library": "file:../library"
  }
}
```

```ts
import { InsLoadingView, InsLoadingController, InsStatus } from 'library';
```

### 最小用法

```ts
@State controller: InsLoadingController = new InsLoadingController();

build() {
  Stack() {
    InsLoadingView({
      imageSrc: 'common/images/pink.jpg', // 相对于 entry 模块 ets 目录
      status: InsStatus.LOADING,           // 默认 LOADING
      startColor: '#FFF700C2',            // 默认起始色
      endColor: '#FFFFD900',               // 默认结束色
      circleDuration: 2000,               // 默认进度弧时长 ms
      rotateDuration: 10000,               // 默认旋转时长 ms
      sideLength: 260,
      controller: this.controller,
    })
      .onClick(() => { /* 点击交互 */ })
  }
  .aspectRatio(1)
}
```

## API 参考

### `InsLoadingView` 组件（对应 Android `InsLoadingView`）

构造期参数（`@Prop`，与 Android `declare-styleable` 一一对应）：

| 参数 | 类型 | 默认值 | 说明 |
|---|---|---|---|
| `status` | `InsStatus` | `LOADING` | 初始状态，对应 `app:status` |
| `startColor` | `string` | `'#FFF700C2'` | 进度弧渐变起始色，对应 `app:start_color` |
| `endColor` | `string` | `'#FFFFD900'` | 进度弧渐变结束色，对应 `app:end_color` |
| `circleDuration` | `number` | `2000` | 进度弧伸缩动画时长（ms），对应 `app:circle_duration` |
| `rotateDuration` | `number` | `10000` | 整体旋转动画时长（ms），对应 `app:rotate_duration` |
| `imageSrc` | `string` | `''` | 头像图片路径，相对于 entry 模块 ets 目录（如 `'common/images/pink.jpg'`） |
| `sideLength` | `number` | `0` | 显式边长（vp）；为 0 时填满父容器并按 `aspectRatio(1)` 取正方形 |
| `controller` | `InsLoadingController` | `null` | 命令式控制器，用于运行态修改 |

### `InsStatus` 枚举（对应 Android `InsLoadingView.Status`）

| 成员 | 值 | 说明 |
|---|---|---|
| `LOADING` | 0 | 已点击并加载中，圆环旋转 / 伸缩动画运行 |
| `CLICKED` | 1 | 已点击并加载完成，圆环停止且为浅灰色 |
| `UNCLICKED` | 2 | 尚未点击，圆环停止且为完整渐变静态圆环 |

### `InsLoadingController`（对应 Android 运行态 setter）

所有方法链式返回 `this`，与 Android `setCircleDuration/setRotateDuration` 返回 `this` 一致。

| 方法 | 说明 | 对应 Android |
|---|---|---|
| `setStatus(status: InsStatus)` | 运行态切换状态，触发绘制分支与动画启停 | `setStatus(Status)` |
| `getStatus(): InsStatus` | 查询当前状态 | `getStatus()` |
| `setStartColor(color: string)` | 运行态设置起始色，重建渐变并重绘 | `setStartColor(int)` |
| `setEndColor(color: string)` | 运行态设置结束色，重建渐变并重绘 | `setEndColor(int)` |
| `setCircleDuration(ms: number)` | 运行态设置进度弧动画时长，重置动画 | `setCircleDuration(int)` |
| `setRotateDuration(ms: number)` | 运行态设置整体旋转时长，重置动画 | `setRotateDuration(int)` |
| `setImageSrc(src: string)` | 运行态切换头像图片源，重建画笔并重绘 | `setImageDrawable(Drawable)` |
| `onStatusChange(listener)` | 注册状态变化监听器 | 外部监听状态 |

颜色参数为 ARGB 十六进制字符串（如 `'#FFF700C2'`），与 Android `Color.parseColor` 兼容。

### Demo

`ohos_hardemo/entry` 提供完整可运行 Demo，覆盖所有公开 API：

- 居中放置 `InsLoadingView`，点击在 `UNCLICKED → LOADING → CLICKED → UNCLICKED` 间循环，并以轻提示反馈
- 长按触发“long click”轻提示
- 颜色预设按钮（运行态调用 `setStartColor/setEndColor`）
- 进度弧时长 / 旋转时长滑块（运行态调用 `setCircleDuration/setRotateDuration`）
- 头像图片源切换 `pink / eric / srv`（运行态调用 `setImageSrc`）
- 三态直选按钮 + 一键重置
- 日志区显示每次操作的真实返回值、状态变化与副作用

> Demo 头像图片位于 `entry/src/main/ets/common/images/`（`entry` 模块 `build-profile.json5` 已开启 `copyCodeResource`，确保 `ImageBitmap(string)` 路径能正确打包）。

## 开源许可

```
Copyright 2017 Qin Tong

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
