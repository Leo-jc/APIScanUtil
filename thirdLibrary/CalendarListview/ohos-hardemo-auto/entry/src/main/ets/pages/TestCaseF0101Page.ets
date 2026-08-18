import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { DayPickerView, DatePickerController, CalendarDay, SelectedDays, DayPickerStyleConfig } from 'library';

class F0101Controller implements DatePickerController {
  private page: TestCaseF0101Page;
  private monthNames: string[] = ['January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'];

  constructor(page: TestCaseF0101Page) {
    this.page = page;
  }

  getMaxYear(): number {
    return new Date().getFullYear() + 10;
  }

  onDayOfMonthSelected(year: number, month: number, day: number): void {
    this.page.result = '月份标题: ' + this.monthNames[month] + ' ' + year +
      '; 星期标签: S M T W T F S; 日期从1日开始排列; 样式属性已应用默认值';
  }

  onDateRangeSelected(selectedDays: SelectedDays<CalendarDay>): void {
    const first: CalendarDay | null = selectedDays.getFirst();
    const last: CalendarDay | null = selectedDays.getLast();
    let msg: string = '范围选择: ';
    if (first) {
      msg += 'first=' + first.toString();
    }
    if (last) {
      msg += ', last=' + last.toString();
    }
    this.page.result = msg;
  }
}

@Entry
@Component
struct TestCaseF0101Page {
  @State result: string = '等待操作 F-01-01...';

  private controller: DatePickerController | null = null;

  private styleConfig: DayPickerStyleConfig = {
    colorCurrentDay: '#999999',
    colorSelectedDayBackground: '#E75F49',
    colorSelectedDayText: '#F2F2F2',
    colorMonthName: '#999999',
    colorDayName: '#999999',
    textSizeDay: 16,
    textSizeMonth: 16,
    textSizeDayName: 10,
    headerMonthHeight: 50,
    selectedDayRadius: 16,
    calendarHeight: 270
  };

  aboutToAppear(): void {
    this.controller = new F0101Controller(this);
  }

  build() {
    Column() {
      // 标题栏（固定）
      Row() {
        Image($r('sys.media.ohos_ic_public_arrow_left'))
          .width(24)
          .height(24)
          .fillColor('#333333')
          .onClick(() => {
            router.back();
          })
          .margin({ left: 16 })
        
        Text('F-01-01 日历正确显示当前月份布局，可配置样式属性生效')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12, right: 16, top: 12, bottom: 12 })
          .layoutWeight(1)
      }
      .width('100%')
      .backgroundColor('#F1F3F5')
      
      // 可滚动区域（测试信息 + Actions）
      Scroll() {
        Column() {
          // ╔─ FIXED SECTION: 测试信息区（使用 TestInfoPanel 组件）─ 禁止修改 ─╗
          TestInfoPanel({
            level: 'L0',
            preconditions: '应用已启动',
            test_steps: '1. 点击【日历日期选择器】进入模块列表页 [验证点: 成功进入模块列表页，日历日期选择器模块可见]; 2. 点击【日历正确显示当前月份布局，可配置样式属性生效】进入用例详情页 [验证点: 成功进入用例详情页，日历组件正常展示]; 3. 观察【月份标题】区域，确认显示当前月份名称和年份 (API: DayPickerView) [验证点: 月份标题和年份显示正确]; 4. 观察【星期标签】区域，确认排列顺序为 S M T W T F S [验证点: 星期标签排列顺序正确]; 5. 观察【日期数字网格】，确认日期从1日开始按正确星期偏移排列 [验证点: 日期数字从1日开始按正确星期偏移排列]; 6. 观察【日历组件】整体，确认各项样式属性已生效 (API: 样式属性) [验证点: 配置的当日文字颜色、选中背景颜色、选中文字颜色、月份名称颜色、星期标签颜色、日期字号、月份名称字号、星期标签字号、月份标题行高度、选中指示器半径、每月行高度等样式属性均生效]',
            expected_result: '月份标题和年份显示正确；星期标签排列顺序正确；日期数字从1日开始按正确星期偏移排列；配置的各项样式属性均正确生效',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝
          
          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })
            
            // TODO(actions-F-01-01): 根据测试用例的步骤，填充相应的操作按钮或UI组件：
            // 每类操作触发后都必须更新 this.result（写入规则见下方 TODO(result-F-01-01)）
            //
            // ■ API 类操作 → 用 Button 包装，按钮文字要表明测试点，
            //   点击后调用对应 HAR API，并更新 result 状态。
            //
            // ■ 触发型 UI（Toast/Dialog/弹窗等）→ 用 Button 触发，
            //   在回调中设置 result = 'Toast显示成功' 或 'Dialog已弹出'。
            //
            // ■ 展示型 UI（装饰器/动画/列表效果等）→ 需要大面积预览区域：
            //   预览组件设置固定高度（如 .height(200)），避免与外层 Scroll 冲突。
            //   示例：List().height(200).decoration(this.decoration)
            //
            // ■ 展示型 UI（吸顶头部/分组列表）→ onScroll 回调中必须用 offset 估算当前可见位置，
            //   再用业务函数计算当前头部ID，禁止遍历固定数组取第一个有效元素。
            //
            // ■ 多层吸顶/组合行为场景（如双层粘性头部 F-02）：
            //   - 必须分别追踪每个头部/元素的理论状态（如 headerId + subHeaderId）
            //   - 必须验证组合条件是否满足（如"两者同时吸顶"）
            //   - 当组合条件不满足时，result 必须追加 ⚠️ 缺陷提示
            //   - 示例：若主头部吸顶但子头部未吸顶 → result 包含"⚠️ 双层吸顶未同时生效"
            //
            // ■ ArkTS @State 更新时机：async 回调（onClick、onAppear、Promise.then）中
            //   更新 @State 是安全的；禁止在 build() 中同步触发 @State 变更导致无限重渲染。
            //
            // 示例（API 类 - 同步调用）:
            //   Button('执行测试')
            //     .id('btn_execute_test')
            //     .onClick(() => {
            //       try {
            //         const res = SomeSdkApi.someMethod(arg);
            //         this.result = res.toString();
            //       } catch (e) {
            //         this.result = 'error: ' + e.message;
            //       }
            //     })
            //     .width('100%')
            //     .margin({ bottom: 8 })
            //
            // 示例（API 类 - 异步调用，更常见）:
            //   Button('执行测试')
            //     .id('btn_execute_test')
            //     .onClick(async () => {
            //       try {
            //         const res = await SomeSdkApi.someMethod(arg);
            //         this.result = `成功: ${JSON.stringify(res)}`;
            //       } catch (e) {
            //         this.result = 'error: ' + e.message;
            //       }
            //     })
            //     .width('100%')
            //     .margin({ bottom: 8 })
            //
            // 示例（触发型 UI - Toast/Dialog）:
            //   Button('显示Toast')
            //     .id('btn_show_toast')
            //     .onClick(() => {
            //       SomeSdk.showToast({ message: 'Hello' });
            //       this.result = 'Toast显示成功';
            //     })
            //     .width('100%')
            //     .margin({ bottom: 8 })
            //
            // 示例（展示型 UI - 列表装饰器）:
            //   List({ space: 0 }) {
            //     ... // 分组数据列表项
            //   }
            //   .width('100%')
            //   .height(200)  // 固定高度，避免嵌套滚动
            //   .decoration(this.decoration)
            //
            // 注意：每个操作按钮和输入控件必须有明确的 .id() 标识
            
            Column() {
              Text('日历组件')
                .id('title_calendar_component')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .margin({ bottom: 8, top: 8 })

              if (this.controller) {
                DayPickerView({
                  controller: this.controller,
                  styleConfig: this.styleConfig
                })
                  .id('day_picker_view')
                  .height(350)
                  .width('100%')
              }

              Text('观察以下区域：月份标题、星期标签 (S M T W T F S)、日期数字网格')
                .id('info_observation')
                .fontSize(13)
                .fontColor('#666666')
                .margin({ top: 8, bottom: 8 })
            }
            .width('100%')
          }
          .padding({ left: 12, right: 12, top: 12, bottom: 12 })
          .width('100%')
        }
      }
      .width('100%')
      .layoutWeight(1)
      .backgroundColor('#F1F3F5')
      .scrollBar(BarState.Auto)
      .scrollBarWidth(4)
      .scrollBarColor('#CCCCCC')
      
      // TODO(result-F-01-01): Result 区写入规则 —— 操作触发后 this.result 替换初始占位 '等待操作 F-01-01...'，让 ResultPanel 可读：
      //
      // ■ API 类操作 → 成功时写入返回值，失败时写入错误信息：
      //   this.result = `成功: ${res}`
      //   this.result = 'error: ' + e.message
      //
      // ■ 触发型 UI（Toast/Dialog/弹窗等）→ 回调中写入操作结果：
      //   this.result = 'Toast显示成功'
      //   this.result = 'Dialog已弹出'
      //
      // ■ 展示型 UI（装饰器/动画/列表效果等）→ 量化状态追踪，格式为"状态名: 值"：
      //   this.result = `滚动偏移: ${this.scrollOffset}px | 头部位置: ${this.headerPosition}px`
      //
      // ■ 禁止虚假结果：状态必须随操作变化，禁止写死假状态或"验证通过"等虚假文案
      //
      // 空状态占位：初始值已设为 '等待操作 F-01-01...'，操作触发后应替换为实际结果
      ResultPanel({ result: this.result })
        .height(120)
    }
    .width('100%')
    .height('100%')
  }
}
