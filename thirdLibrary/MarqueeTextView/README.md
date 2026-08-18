# MarqueeTextView

基于 https://github.com/dreamgyf/MarqueeTextView 开发，适配鸿蒙版本

走马灯式横向滚动文本组件（HarmonyOS ArkTS / ArkUI）。无论文本内容是否超过一行，组件都会持续向左横向滚动，并在头尾之间保持不小于 `space` 的间隔以实现无缝衔接循环滚动；以屏幕刷新率为基准驱动每帧位移，保证不同刷新率设备滚动速率一致。

## 目录结构

```
.
├── ohos_library/                      # HAR 源码（模块名 marquee_text_view）
│   ├── Index.ets                       # 导出 MarqueeTextView 与 MarqueeTextViewController
│   ├── oh-package.json5              # name: marquee_text_view
│   ├── build-profile.json5
│   ├── hvigorfile.ts
│   ├── obfuscation-rules.txt / consumer-rules.txt
│   └── src/main/
│       ├── module.json5               # module.name = marquee_text_view, type = har
│       ├── ets/marquee/
│       │   ├── MarqueeTextView.ets    # 组件实现（Canvas 自绘 + displaySync 帧动画 + 离屏双缓冲）
│       │   └── MarqueeTextViewController.ets  # 命令式滚动控制器
│       └── resources/base/element/    # 库默认资源（字号 / 间隔 / 速度等）
│
├── ohos_hardemo/                       # Demo 应用
│   ├── AppScope/app.json5             # bundleName: com.dreamgyf.marqueetextview
│   ├── build-profile.json5           # 通过 modules[].srcPath: "../ohos_library" 引入 HAR 模块（name: marquee_text_view）
│   ├── oh-package.json5              # 通过 "marquee_text_view": "file:../ohos_library" 声明本地依赖
│   ├── hvigorfile.ts / hvigor/
│   └── entry/                         # Demo 入口模块
│       └── src/main/ets/pages/Index.ets   # 演示页（预览 + 配置 + 滚动控制 + 日志）
│
├── LICENSE                             # Apache-2.0
└── README.md
```

> 模块名称默认为 `marquee_text_view`，可根据需要自行修改（需同步 `ohos_library/oh-package.json5` 的 `name`、`ohos_library/src/main/module.json5` 的 `module.name`、`ohos_hardemo/build-profile.json5` 中 HAR 模块的 `name`、`ohos_hardemo/oh-package.json5` 的依赖键，以及 Demo 中 HAR import 路径）。

## 环境要求

- HarmonyOS（ArkTS）Stage 模型
- `compatibleSdkVersion`：5.1.1(19)
- `targetSdkVersion`：6.0.2(22)
- DevEco Studio（用于编辑与编译）或命令行 `ohpm` + `hvigorw`

## 快速开始

1. 在工程根目录安装依赖：

```bash
cd ohos_hardemo
ohpm install
```

2. 编译生成 HAP：

```bash
hvigorw -e assembleHap --mode module -p product=default -p buildMode=debug --no-daemon
```

3. 在页面中使用组件：

```typescript
import { MarqueeTextView, MarqueeTextViewController } from 'marquee_text_view';

@Entry
@Component
struct Index {
  private controller: MarqueeTextViewController = new MarqueeTextViewController();

  build() {
    MarqueeTextView({
      text: 'Hello World!',
      fontSize: 30,
      fontColor: '#FF1A1A1A',
      space: 100,
      speed: 0.5,
      autoStart: true,
      controller: this.controller
    })
      .width('100%')
  }
}
```

## API 参考

### MarqueeTextView 组件参数

| 参数 | 类型 | 默认值 | 单位 | 说明 |
| --- | --- | --- | --- | --- |
| `text` | string | `''` | — | 滚动文本内容；运行期变化会重建位图并从起点重滚。 |
| `fontSize` | number | `16` | vp | 字号；运行期变化会重建位图并从起点重滚。 |
| `fontColor` | string | `'#000000'` | CSS 颜色串 | 文字颜色（如 `'#000000'`、`'rgba(0,0,0,1)'`）。 |
| `fontWeight` | number | `400` | — | 字重（100/300/400/500/700/900 等）。 |
| `fontStyle` | number | `0` | — | `0`=Normal，`1`=Italic。 |
| `fontFamily` | string | `'sans-serif'` | — | 字体族（`'sans-serif'`、`'serif'`、`'monospace'` 或已注册自定义字体名）。 |
| `space` | number | `100` | vp | 头尾最小间隔；控件远大于文本时自动夹紧为 0。 |
| `speed` | number | `0.5` | vp/帧(60Hz 基准) | 滚动速度；每秒滚动约 `60*speed` vp，高刷设备经刷新率归一后速率一致。 |
| `autoStart` | boolean | `true` | — | 组件就绪后是否自动开始滚动。 |
| `controller` | MarqueeTextViewController | `new ...()` | — | 命令式控制器，用于在外部调用启停控制方法。 |

### MarqueeTextViewController 方法

| 方法 | 说明 |
| --- | --- |
| `startScroll()` | 开始/恢复滚动（幂等：已在滚动时不再重复投递）。 |
| `pauseScroll()` | 暂停滚动，画面静止于当前位置，不复位。 |
| `stopScroll()` | 停止滚动并复位到起始位置。 |
| `restartScroll()` | 复位后重新开始滚动。 |

### 实现要点

- **自绘双缓冲**：组件将文本绘制到 `OffscreenCanvas` 并 `transferToImageBitmap` 缓存为 `ImageBitmap`，再由 `Canvas` 组件以 `drawImage` 双份错位贴图实现头尾无缝衔接。
- **帧驱动与速率归一**：使用 `@kit.ArkGraphics2D` 的 `displaySync` 按屏幕刷新率驱动每帧位移 `leftX -= (60/refreshRate) * speed`，保证不同刷新率设备每秒滚动距离一致。
- **响应式更新**：`text`/`fontSize`/`fontColor`/`fontWeight`/`fontStyle`/`fontFamily` 变化会自动重新测量文本、重建位图并从起点重滚；`space`/`speed` 变化在下一帧自然生效。
- **生命周期**：组件销毁时停止帧回调并取消订阅，避免泄漏。

## 开源许可

本项目基于 [Apache License 2.0](./LICENSE) 发布。如果在使用过程中有任何问题，可以在GitCode提Issue，会及时跟进。issue地址：[issues](https://gitcode.com/ohos_third_party_lib/MarqueeTextView/issues)。
