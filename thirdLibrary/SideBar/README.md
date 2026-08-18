如果在使用过程中有任何问题，可以在GitCode提Issue，会及时跟进。issue地址：[issues](https://gitcode.com/ohos_third_party_lib/SideBar/issues)。

# SideBar 鸿蒙字母索引侧边栏

基于 https://github.com/Leo199206/SideBar 开发，适配鸿蒙版本

HarmonyOS（ArkTS）字母索引侧边栏控件。通过 Canvas 自绘字母列表，监听触摸/滑动按 Y 坐标计算选中字母并回调，可配合列表实现快速定位（类似微信联系人字母索引效果）。API 灵活，可自定义配置不同颜色及样式。

## 目录结构

```
SideBar/
├── ohos_library/                      # HAR 源码（模块名 sidebar）
│   ├── src/main/ets/components/SideBar.ets        # 自绘字母索引组件
│   ├── src/main/ets/interface/SideBarListener.ets # 交互回调接口
│   ├── src/main/resources/                         # HAR 资源
│   └── Index.ets                                   # 公开 API 导出
├── ohos_hardemo/                      # Demo 应用
│   ├── entry/                         # Demo 入口模块
│   │   └── src/main/ets/
│   │       ├── pages/Index.ets       # 主页面（列表 + 侧边栏 + 提示气泡）
│   │       ├── pages/Settings.ets     # 样式配置页
│   │       └── components/HintBubble.ets
│   ├── build-profile.json5           # 通过 srcPath: "../ohos_library" 引入 HAR 模块
│   └── oh-package.json5              # 通过 file:../ohos_library 声明本地依赖
└── README.md
```

HAR 源码位于根目录 `ohos_library/`，Demo 位于 `ohos_hardemo/entry/`。`ohos_hardemo/build-profile.json5` 中通过 `srcPath: "../ohos_library"` 引入 HAR 模块（modules 段 name=sidebar）；`ohos_hardemo/oh-package.json5` 中通过 `file:../ohos_library` 声明本地依赖（dependencies 段 key 为 sidebar）。模块名默认为 library，可根据需要自行修改（本工程已改为 sidebar）。

## 环境要求

- HarmonyOS compatibleSdkVersion：5.1.1(19) 及以上
- DevEco Studio / Hvigor 构建工具
- 开发语言：ArkTS（.ets）

## 快速开始

1. 在工程根目录的 `oh-package.json5` 中添加本地依赖：

```json5
{
  "dependencies": {
    "sidebar": "file:../ohos_library"
  }
}
```

2. 在 `build-profile.json5` 中引入 HAR 模块：

```json5
{
  "modules": [
    { "name": "entry", "srcPath": "./entry" },
    { "name": "sidebar", "srcPath": "../ohos_library" }
  ]
}
```

3. 在页面中引入并使用：

```typescript
import { SideBar, SideBarListener } from 'sidebar';

@Entry
@Component
struct Index {
  @State letters: string[] = ['A','B','C','D','E','F'];

  build() {
    Stack() {
      SideBar({
        letters: this.letters,
        textColor: '#000000',
        pressedTextColor: '#FFFFFF',
        pressedTextBgColor: '#FF8800',
        textSize: 14,
        itemSpacing: 10,
        itemHeight: 0, // 0=回退字号
        onSideBarListener: {
          onSideTouchState: (isTouch: boolean) => {
            // 按下 true / 抬起 false，用于控制提示气泡显示隐藏
          },
          onSideSelected: (position: number, currentY: number, selectedValue: string) => {
            // 选中变化回调，可滚动列表到 selectedValue 位置
          }
        }
      })
        .width(50)
    }
    .alignContent(Alignment.End)
  }
}
```

## API 参考

### SideBar 组件

字母索引侧边栏，Canvas 自绘字母列表，监听触摸/滑动选择，通过回调通知选中项与触摸状态。

| 参数 | 类型 | 默认值 | 说明 |
|---|---|---|---|
| letters | string[] | [] | 索引内容列表，运行态可变（修改即触发重绘） |
| textColor | string | '#000000' | 未选中文字颜色（'#RRGGBB' 或 '#RRGGBBAA'） |
| pressedTextColor | string | '#FFFFFF' | 选中文字颜色 |
| pressedTextBgColor | string | '#FF8800' | 选中背景颜色 |
| textSize | number | 13 | 字号（vp） |
| itemSpacing | number | 10 | 文字间距（vp） |
| itemHeight | number | -1 | 文字行高基准（vp），<=0 时回退为 textSize |
| callbackEnabled | boolean | true | 是否向宿主发送交互回调，关闭后仅保留视觉高亮 |
| onSideBarListener | SideBarListener \| null | null | 交互回调，置 null 后仅产生视觉高亮，不再发出回调 |

### SideBarListener 接口

| 回调 | 签名 | 说明 |
|---|---|---|
| onSideTouchState | (isTouch: boolean) => void | 按下时回调 true；抬起/取消时回调 false，用于显示/隐藏提示气泡 |
| onSideSelected | (position: number, currentY: number, selectedValue: string) => void | 选中项变化回调，position 为索引，currentY 为选中项在父布局的 Y 坐标（vp），selectedValue 为选中字符串 |

### 已定义样式属性

| 属性 | 说明 |
|---|---|
| textColor | 未选中字体颜色 |
| pressedTextColor | 按下时选中字体颜色 |
| pressedTextBgColor | 按下时选中背景颜色 |
| textSize | 字体大小 |
| itemSpacing | item 间距，默认 10 |
| itemHeight | item 高度基准，不设置（<=0）时默认取字号 |

## 开源许可

SideBar is under the Apache License Version 2.0. See the [LICENSE](LICENSE) file for details.
