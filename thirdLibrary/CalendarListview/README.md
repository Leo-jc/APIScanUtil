# CalendarListview

基于 [https://github.com/traex/CalendarListview](https://github.com/traex/CalendarListview) 开发，适配鸿蒙版本。

轻量级日历日期选择器 HarmonyOS（ArkTS）库。提供可滚动的按月日历视图，支持单选和日期范围选择，全部通过 Canvas 自定义绘制实现。零外部依赖。

## 环境要求

- DevEco Studio 5.0+（或兼容 IDE）
- compatibleSdkVersion：5.1.1（API 19）
- targetSdkVersion：6.0.2（API 22）
- hvigor 版本：与 DevEco Studio 捆绑
- Node.js：详见 DevEco Studio 环境要求

> 注：详细构建环境配置见 ohos-hardemo 工程配置。

## 编译依赖

本库为零依赖库，无需额外 ohpm 依赖。库模块声明见 `ohos-hardemo/library/oh-package.json5`。

## 快速开始 / 安装

### 方式一：本地 HAR 依赖

将 `ohos-hardemo/library` 目录复制到项目目录，在宿主模块的 `oh-package.json5` 中添加：

```json5
"dependencies": {
  "@traex/calendarlistview": "file:../library"
}
```

### 方式二：直接集成源码

将 `ohos-hardemo/library/src/main/ets/` 下的模型、组件、工具类复制到项目中使用。

## 初始化和宿主接入

宿主需实现 `DatePickerController` 接口，并将实例传入 `DayPickerView` 组件：

```ets
import { DayPickerView, DatePickerController, DayPickerStyleConfig } from '@traex/calendarlistview'

@Entry
@Component
struct CalendarPage {
  private controller: DatePickerController = {
    getMaxYear: (): number => 2030,
    onDayOfMonthSelected: (year: number, month: number, day: number): void => {
      console.info(`Selected: ${year}-${month + 1}-${day}`)
    },
    onDateRangeSelected: (selectedDays: SelectedDays<CalendarDay>): void => {
      console.info(`Range: ${selectedDays.getFirst()} ~ ${selectedDays.getLast()}`)
    }
  }

  build() {
    Column() {
      DayPickerView({ controller: this.controller })
    }
    .width('100%')
    .height('100%')
  }
}
```

## API 参考

| 导出符号 | 类型 | 说明 |
|---------|------|------|
| `DayPickerView` | @Component | 主入口日历组件，传入 controller 和可选 styleConfig |
| `DatePickerController` | interface | 宿主契约接口：getMaxYear / onDayOfMonthSelected / onDateRangeSelected |
| `CalendarDay` | class | 日期数据模型（year, month 0-indexed, day） |
| `SelectedDays<CalendarDay>` | class | 日期范围容器（first / last） |
| `CalendarUtils` | class | 日期计算工具（getDaysInMonth） |
| `DayPickerStyleConfig` | type | 样式配置接口（20 个可选属性） |

### DayPickerView Props

| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| controller | DatePickerController | 是 | 宿主控制器接口 |
| styleConfig | DayPickerStyleConfig | 否 | 样式配置对象 |

### DayPickerStyleConfig 属性

| 属性 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| colorCurrentDay | string | '#ff999999' | 当日日期文字颜色 |
| colorSelectedDayBackground | string | '#E75F49' | 选中日期背景颜色 |
| colorSelectedDayText | string | '#fff2f2f2' | 选中日期文字颜色 |
| colorPreviousDay | string | '#ff999999' | 当月过去日期文字颜色 |
| colorNormalDay | string | '#ff999999' | 普通日期文字颜色 |
| colorMonthName | string | '#ff999999' | 月份名称文字颜色 |
| colorDayName | string | '#ff999999' | 星期标签文字颜色 |
| textSizeDay | number | 16 | 日期数字字号（vp） |
| textSizeMonth | number | 16 | 月份名称字号（vp） |
| textSizeDayName | number | 10 | 星期标签字号（vp） |
| headerMonthHeight | number | 50 | 月份标题行高度（vp） |
| selectedDayRadius | number | 16 | 选中指示器半径（vp） |
| calendarHeight | number | 270 | 每个月份行的高度（vp） |
| drawRoundRect | boolean | false | 选中指示器使用圆角矩形替代圆形 |
| enablePreviousDay | boolean | true | 启用当月过去日期可点击 |
| currentDaySelected | boolean | false | 初始化时默认选中当天 |

## 已支持能力

- 按月分页的垂直滚动日历视图
- 单日选择与日期范围选择
- 20 种样式属性可定制
- Canvas 自绘渲染（圆形/圆角矩形选中指示器）
- 触摸交互日期选择
- 日期区间状态管理（first → last → reset）

## 未支持/裁剪能力

| 能力 | 说明 |
|------|------|
| ViewHolder | ArkUI 声明式开发无 ViewHolder 概念，ListItem 声明即复用 |
| XML 属性解析 | 替换为 DayPickerStyleConfig 接口对象传参 |
| Java Calendar / Time | 替换为 JS Date + CalendarUtils 工具类 |
| Serializable | ArkTS 自动序列化 |

## 注意事项

- 所有月份（month）参数为 **0-indexed**（0=January，11=December），与 JS Date.getMonth() 语义一致。
- `roundRect` API 需 SDK 20+（API 20），当前 compatibleSdkVersion 为 19；若在 API 19 设备上运行，选中圆角矩形可能不可用，建议升级 compatibleSdkVersion 或使用圆形指示器（默认）。
- `DayPickerView` 的 `getSelectedDays()` 方法在 ArkTS @Component 中可通过 controller 回调获取选中状态。
- 本库为纯 UI 组件库，**无需任何权限**。

## Demo 运行方式

1. 进入 demo 工程目录：
```bash
cd ohos-hardemo
```

2. 安装依赖（首次编译前执行）：
```bash
ohpm install
```

3. 编译 HAP：
```bash
hvigorw assembleHap --mode module -p product=default -p buildMode=debug --no-daemon
```

4. 产物路径：`ohos-hardemo/entry/build/default/outputs/default/entry-default-unsigned.hap`

5. 安装到模拟器或真机：
```bash
hdc install ohos-hardemo/entry/build/default/outputs/default/entry-default-unsigned.hap
```

6. 打开应用查看日历 Demo，点击日期验证交互，展开样式配置面板调整样式。

## 如何贡献

1. Fork 本仓库
2. 创建特性分支：`git checkout -b feature/your-feature`
3. 提交修改：`git commit -m 'Add some feature'`
4. 推送到分支：`git push origin feature/your-feature`
5. 创建 Pull Request

## 开源许可

本项目基于 MIT License 许可，详见 [LICENSE.txt](LICENSE.txt)。如果在使用过程中有任何问题，可以在GitCode提Issue，会及时跟进。issue地址：[issues](https://gitcode.com/ohos_third_party_lib/CalendarListview/issues)。
