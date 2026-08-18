import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { DayPickerView, DatePickerController, CalendarDay, SelectedDays } from 'library';

class RangeController implements DatePickerController {
  private onDaySelected: (year: number, month: number, day: number) => void = () => {};
  private onRangeSelected: (range: SelectedDays<CalendarDay>) => void = () => {};

  setDayCallback(cb: (year: number, month: number, day: number) => void): void {
    this.onDaySelected = cb;
  }

  setRangeCallback(cb: (range: SelectedDays<CalendarDay>) => void): void {
    this.onRangeSelected = cb;
  }

  getMaxYear(): number {
    return new Date().getFullYear();
  }

  onDayOfMonthSelected(year: number, month: number, day: number): void {
    this.onDaySelected(year, month, day);
  }

  onDateRangeSelected(selectedDays: SelectedDays<CalendarDay>): void {
    this.onRangeSelected(selectedDays);
  }
}

@Entry
@Component
struct TestCaseF0107Page {
  @State result: string = '等待操作...';
  @State rangeInfo: string = '未选择';
  private controller: RangeController = new RangeController();

  aboutToAppear(): void {
    this.controller.setDayCallback((year: number, month: number, day: number): void => {
      this.rangeInfo = `单日选中: ${year}/${month + 1}/${day}`;
    });
    this.controller.setRangeCallback((range: SelectedDays<CalendarDay>): void => {
      const first: CalendarDay | null = range.getFirst();
      const last: CalendarDay | null = range.getLast();
      if (first !== null && last !== null) {
        this.rangeInfo = `跨月份范围: ${first.toString()} ~ ${last.toString()}`;
      }
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
        
        Text('F-01-07 日期范围选择可跨越月份边界')
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
            test_steps: '1. 点击【日历日期选择器】进入模块列表页 [验证点: 成功进入模块列表页，日历日期选择器模块可见]; 2. 点击【日期范围选择可跨越月份边界】进入用例详情页 [验证点: 成功进入用例详情页，日历组件正常展示]; 3. 向上滑动【日历组件】切换到上个月份视图 (API: DayPickerView) [验证点: 上月日历视图正确显示]; 4. 在上月【日期数字网格】中点击最后一天（如【31】） [验证点: 上月最后一天显示选中标记]; 5. 向下滑动【日历组件】切换回当前月份视图 (API: DayPickerView) [验证点: 当前月份视图正确显示]; 6. 在当月【日期数字网格】中点击第一天（如【1】） (API: DatePickerController.onDateRangeSelected) [验证点: 当月第一天显示选中标记，跨月份首尾日期均正确高亮]; 7. 观察【宿主通知结果】面板 [验证点: 宿主收到包含跨月份首尾日期的范围通知]',
            expected_result: '上月最后一天被选中显示选中标记；下月第一天被选中显示选中标记；两个选中标记在不同月份的视图上均正确呈现；宿主收到包含跨月份首尾日期的范围通知',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝
          
          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })
            
            // TODO(actions-F-01-07): 根据测试用例的步骤，填充相应的操作按钮或UI组件：
            // 每类操作触发后都必须更新 this.result（写入规则见下方 TODO(result-F-01-07)）
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
            
            DayPickerView({
              controller: this.controller,
              styleConfig: { firstMonth: 0, lastMonth: 11 }
            })
              .id('day_picker_view')
              .height(300)
              .width('100%')
              .margin({ bottom: 12 })

            Text('操作步骤说明')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })
              .width('100%')

            Text('1. 向上滑动日历切换到上个月')
              .id('text_step1')
              .fontSize(13)
              .margin({ bottom: 4 })
              .width('100%')

            Text('2. 点击上月最后一天（如31日）')
              .id('text_step2')
              .fontSize(13)
              .margin({ bottom: 4 })
              .width('100%')

            Text('3. 向下滑动回到当前月')
              .id('text_step3')
              .fontSize(13)
              .margin({ bottom: 4 })
              .width('100%')

            Text('4. 点击当月第一天（如1日）')
              .id('text_step4')
              .fontSize(13)
              .margin({ bottom: 12 })
              .width('100%')

            Text('宿主通知结果')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })
              .width('100%')

            Text(this.rangeInfo)
              .id('text_range_info')
              .fontSize(14)
              .fontColor('#E75F49')
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
      
      // TODO(result-F-01-07): Result 区写入规则 —— 操作触发后 this.result 替换初始占位 '等待操作 F-01-07...'，让 ResultPanel 可读：
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
      // 空状态占位：初始值已设为 '等待操作 F-01-07...'，操作触发后应替换为实际结果
      ResultPanel({ result: this.result })
        .height(120)
    }
    .width('100%')
    .height('100%')
  }
}
