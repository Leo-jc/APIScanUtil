import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { DayPickerView, DatePickerController, CalendarDay, SelectedDays, DayPickerStyleConfig } from 'library';

class F0104Controller implements DatePickerController {
  private page: TestCaseF0104Page;

  constructor(page: TestCaseF0104Page) {
    this.page = page;
  }

  getMaxYear(): number {
    return new Date().getFullYear() + 10;
  }

  onDayOfMonthSelected(year: number, month: number, day: number): void {
    this.page.selectedFirst = new CalendarDay(year, month, day).toString();
    this.page.selectedLast = '';
    this.page.result = '默认: ' + this.page.defaultDayResult + '; 构造: ' +
      this.page.constructedDayResult + '; first=' + this.page.selectedFirst + '; last=' + this.page.selectedLast;
  }

  onDateRangeSelected(selectedDays: SelectedDays<CalendarDay>): void {
    const first: CalendarDay | null = selectedDays.getFirst();
    const last: CalendarDay | null = selectedDays.getLast();
    if (first) {
      this.page.selectedFirst = first.toString();
    }
    if (last) {
      this.page.selectedLast = last.toString();
    }
    this.page.result = '默认: ' + this.page.defaultDayResult + '; 构造: ' +
      this.page.constructedDayResult + '; first=' + this.page.selectedFirst + '; last=' + this.page.selectedLast;
  }
}

@Entry
@Component
struct TestCaseF0104Page {
  @State result: string = '等待操作 F-01-04...';
  @State inputYear: string = '2026';
  @State inputMonth: string = '6';
  @State inputDay: string = '15';
  @State defaultDayResult: string = '';
  @State constructedDayResult: string = '';
  @State selectedFirst: string = '';
  @State selectedLast: string = '';

  private controller: DatePickerController | null = null;

  aboutToAppear(): void {
    this.controller = new F0104Controller(this);
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
        
        Text('F-01-04 CalendarDay 日期对象可表达指定日期，SelectedDays 选择容器正确追踪选中状态')
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
            test_steps: '1. 点击【日历日期选择器】进入模块列表页 [验证点: 成功进入模块列表页，日历日期选择器模块可见]; 2. 点击【CalendarDay 日期对象可表达指定日期，SelectedDays 选择容器正确追踪选中状态】进入用例详情页 [验证点: 成功进入用例详情页，日期构造区域和选中状态面板正常展示]; 3. 观察【CalendarDay 默认结果】区域 (API: CalendarDay 默认构造) [验证点: 默认 CalendarDay 表示当前日期]; 4. 在【日期构造】区域输入年份【2026】、月份【6】、日期【15】 (API: CalendarDay 指定构造) [验证点: CalendarDay 显示年2026、月6、日15，字符串格式为 { year: 2026, month: 6, day: 15 }]; 5. 在【日历组件】上点击日期【15】 [验证点: 日期【15】显示选中标记]; 6. 观察【选中状态】面板 (API: SelectedDays) [验证点: 第一次选中后 first 显示为日期15、last 显示为空]; 7. 在【日历组件】上点击日期【20】 [验证点: 日期【20】显示选中标记]; 8. 观察【选中状态】面板 (API: SelectedDays) [验证点: 第二次选中后 first 不变为15、last 显示为日期20]; 9. 在【日历组件】上点击日期【25】 [验证点: 日期【25】显示选中标记，之前的选中标记更新]; 10. 观察【选中状态】面板 (API: SelectedDays) [验证点: 第三次选中后 first 变为日期25、last 显示为空]',
            expected_result: '默认 CalendarDay 表示当前日期；指定年月日构造的 CalendarDay year/month/day 属性与输入一致；第一次选中后 first 为选中日期且 last 为空；第二次选中不同日期后 first 不变、last 为第二日期；第三次选中新日期后 first 变为新日期、last 为空',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝
          
          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })
            
            // TODO(actions-F-01-04): 根据测试用例的步骤，填充相应的操作按钮或UI组件：
            // 每类操作触发后都必须更新 this.result（写入规则见下方 TODO(result-F-01-04)）
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
              // ── CalendarDay 默认结果 ──
              Text('CalendarDay 默认结果')
                .id('title_default_calendar_day')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .margin({ bottom: 8, top: 8 })

              Button('显示默认 CalendarDay')
                .id('btn_show_default_day')
                .onClick(() => {
                  const d: CalendarDay = new CalendarDay();
                  this.defaultDayResult = d.toString();
                  this.result = `默认: ${this.defaultDayResult}; 构造: ${this.constructedDayResult}; first=${this.selectedFirst}; last=${this.selectedLast}`;
                })
                .width('100%')
                .margin({ bottom: 8 })

              Text(this.defaultDayResult)
                .id('text_default_day_result')
                .fontSize(13)
                .fontColor('#333333')
                .margin({ bottom: 8 })

              // ── 日期构造 ──
              Text('日期构造')
                .id('title_date_construction')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .margin({ bottom: 8, top: 8 })

              Row() {
                TextInput({ text: this.inputYear, placeholder: '年份' })
                  .id('input_year')
                  .onChange((value: string) => {
                    this.inputYear = value;
                  })
                  .layoutWeight(1)
                  .margin({ right: 4 })

                TextInput({ text: this.inputMonth, placeholder: '月份' })
                  .id('input_month')
                  .onChange((value: string) => {
                    this.inputMonth = value;
                  })
                  .layoutWeight(1)
                  .margin({ left: 4, right: 4 })

                TextInput({ text: this.inputDay, placeholder: '日期' })
                  .id('input_day')
                  .onChange((value: string) => {
                    this.inputDay = value;
                  })
                  .layoutWeight(1)
                  .margin({ left: 4 })
              }
              .width('100%')
              .margin({ bottom: 4 })

              Button('构造')
                .id('btn_construct_day')
                .onClick(() => {
                  const y: number = parseInt(this.inputYear);
                  const m: number = parseInt(this.inputMonth);
                  const d: number = parseInt(this.inputDay);
                  if (isNaN(y) || isNaN(m) || isNaN(d)) {
                    this.constructedDayResult = '输入无效';
                  } else {
                    const cd: CalendarDay = new CalendarDay(y, m - 1, d);
                    this.constructedDayResult = cd.toString();
                  }
                  this.result = `默认: ${this.defaultDayResult}; 构造: ${this.constructedDayResult}; first=${this.selectedFirst}; last=${this.selectedLast}`;
                })
                .width('100%')
                .margin({ bottom: 8 })

              Text(this.constructedDayResult)
                .id('text_constructed_day_result')
                .fontSize(13)
                .fontColor('#333333')
                .margin({ bottom: 8 })

              // ── 日历组件 ──
              Text('日历组件')
                .id('title_calendar_component')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .margin({ bottom: 8, top: 8 })

              if (this.controller) {
                DayPickerView({
                  controller: this.controller
                })
                  .id('day_picker_view')
                  .height(350)
                  .width('100%')
              }

              // ── 选中状态 ──
              Text('选中状态')
                .id('title_selection_status')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .margin({ bottom: 8, top: 8 })

              Row() {
                Text(`first=${this.selectedFirst}`)
                  .id('text_selected_first')
                  .fontSize(13)
                  .fontColor('#333333')
              }
              .width('100%')
              .margin({ bottom: 2 })

              Row() {
                Text(`last=${this.selectedLast}`)
                  .id('text_selected_last')
                  .fontSize(13)
                  .fontColor('#333333')
              }
              .width('100%')
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
      
      // TODO(result-F-01-04): Result 区写入规则 —— 操作触发后 this.result 替换初始占位 '等待操作 F-01-04...'，让 ResultPanel 可读：
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
      // 空状态占位：初始值已设为 '等待操作 F-01-04...'，操作触发后应替换为实际结果
      ResultPanel({ result: this.result })
        .height(120)
    }
    .width('100%')
    .height('100%')
  }
}
