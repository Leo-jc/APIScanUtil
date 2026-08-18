import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { DayPickerView, DatePickerController, CalendarDay, SelectedDays } from 'library';

class NotificationController implements DatePickerController {
  private onNotifyDay: (year: number, month: number, day: number) => void = () => {};
  private onNotifyRange: (range: SelectedDays<CalendarDay>) => void = () => {};

  setDayCallback(cb: (year: number, month: number, day: number) => void): void {
    this.onNotifyDay = cb;
  }

  setRangeCallback(cb: (range: SelectedDays<CalendarDay>) => void): void {
    this.onNotifyRange = cb;
  }

  getMaxYear(): number {
    return new Date().getFullYear();
  }

  onDayOfMonthSelected(year: number, month: number, day: number): void {
    this.onNotifyDay(year, month, day);
  }

  onDateRangeSelected(selectedDays: SelectedDays<CalendarDay>): void {
    this.onNotifyRange(selectedDays);
  }
}

@Entry
@Component
struct TestCaseF0106Page {
  @State result: string = '等待操作...';
  @State notificationReceived: boolean = false;
  @State clickArea: string = '';
  private controller: NotificationController = new NotificationController();

  aboutToAppear(): void {
    this.controller.setDayCallback((year: number, month: number, day: number): void => {
      this.notificationReceived = true;
      this.result = `选中日期: ${year}/${month + 1}/${day}`;
    });
    this.controller.setRangeCallback((range: SelectedDays<CalendarDay>): void => {
      this.notificationReceived = true;
      const first: CalendarDay | null = range.getFirst();
      const last: CalendarDay | null = range.getLast();
      this.result = `范围选中: ${first?.toString()} ~ ${last?.toString()}`;
    });
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
        
        Text('F-01-06 点击日期网格有效区域以外的空白处无选中事件')
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
            level: 'L1',
            preconditions: '应用已启动',
            test_steps: '1. 点击【日历日期选择器】进入模块列表页 [验证点: 成功进入模块列表页，日历日期选择器模块可见]; 2. 点击【点击日期网格有效区域以外的空白处无选中事件】进入用例详情页 [验证点: 成功进入用例详情页，日历组件正常展示]; 3. 点击【月份标题】区域 (API: DayPickerView) [验证点: 无日期选中标记出现]; 4. 点击【星期标签】区域 (API: DayPickerView) [验证点: 无日期选中标记出现]; 5. 点击【日期网格边界】空白处 (API: DayPickerView) [验证点: 无日期选中标记出现]; 6. 观察【宿主通知结果】面板 [验证点: 宿主未收到日期选中通知]',
            expected_result: '点击月份标题区域、星期标签区域、日期网格边界空白处均无日期选中标记出现，宿主未收到日期选中通知',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝
          
          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })
            
            // TODO(actions-F-01-06): 根据测试用例的步骤，填充相应的操作按钮或UI组件：
            // 每类操作触发后都必须更新 this.result（写入规则见下方 TODO(result-F-01-06)）
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
            
            Text('点击测试区域')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })
              .width('100%')

            DayPickerView({ controller: this.controller })
              .id('day_picker_view')
              .height(300)
              .width('100%')
              .margin({ bottom: 12 })

            Button('月份标题')
              .id('btn_month_title')
              .onClick((): void => {
                this.clickArea = '月份标题';
                this.result = `点击${this.clickArea}: 无日期选中标记; 宿主通知: ${this.notificationReceived ? '已收到' : '未收到'}`;
              })
              .width('100%')
              .margin({ bottom: 8 })

            Button('星期标签')
              .id('btn_week_label')
              .onClick((): void => {
                this.clickArea = '星期标签';
                this.result = `点击${this.clickArea}: 无日期选中标记; 宿主通知: ${this.notificationReceived ? '已收到' : '未收到'}`;
              })
              .width('100%')
              .margin({ bottom: 8 })

            Button('日期网格边界')
              .id('btn_grid_border')
              .onClick((): void => {
                this.clickArea = '日期网格边界';
                this.result = `点击${this.clickArea}: 无日期选中标记; 宿主通知: ${this.notificationReceived ? '已收到' : '未收到'}`;
              })
              .width('100%')
              .margin({ bottom: 12 })

            Text('宿主通知结果')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })
              .width('100%')

            Text(this.notificationReceived ? '已收到通知' : '未收到通知')
              .id('text_notification_state')
              .fontSize(14)
              .fontColor(this.notificationReceived ? '#E75F49' : '#999999')
              .width('100%')
              .margin({ bottom: 8 })
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
      
      // TODO(result-F-01-06): Result 区写入规则 —— 操作触发后 this.result 替换初始占位 '等待操作 F-01-06...'，让 ResultPanel 可读：
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
      // 空状态占位：初始值已设为 '等待操作 F-01-06...'，操作触发后应替换为实际结果
      ResultPanel({ result: this.result })
        .height(120)
    }
    .width('100%')
    .height('100%')
  }
}
