import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { CalendarDay } from 'library';

@Entry
@Component
struct TestCaseF0108Page {
  @State leapResult: string = '';
  @State janFirstResult: string = '';
  @State dec31Result: string = '';
  @State result: string = '等待操作...';

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
        
        Text('F-01-08 CalendarDay 处理闰年2月29日、年初年末等边缘日期值')
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
            test_steps: '1. 点击【日历日期选择器】进入模块列表页 [验证点: 成功进入模块列表页，日历日期选择器模块可见]; 2. 点击【CalendarDay 处理闰年2月29日、年初年末等边缘日期值】进入用例详情页 [验证点: 成功进入用例详情页，日期构造区域正常展示]; 3. 在【日期构造】区域输入年份【2024】、月份【1】、日期【29】 (API: CalendarDay) [验证点: CalendarDay 显示 day 为29、month 为1（二月）、year 为2024]; 4. 在【日期构造】区域输入年份【2026】、月份【0】、日期【1】 (API: CalendarDay) [验证点: CalendarDay 显示 month 为0（一月）]; 5. 在【日期构造】区域输入年份【2026】、月份【11】、日期【31】 (API: CalendarDay) [验证点: CalendarDay 显示 month 为11（十二月）、day 为31]',
            expected_result: '闰年2月29日的CalendarDay day属性为29、month为1（二月）、year为对应闰年；1月1日month为0；12月31日month为11、day为31',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝
          
          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })
            
            // TODO(actions-F-01-08): 根据测试用例的步骤，填充相应的操作按钮或UI组件：
            // 每类操作触发后都必须更新 this.result（写入规则见下方 TODO(result-F-01-08)）
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
            
            Text('日期构造')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 12 })
              .width('100%')

            // ── Scenario 1: 闰年2月29日 ──
            Text('Scenario 1: 闰年2月29日')
              .fontSize(13)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 4 })
              .width('100%')

            Text('年份: 2024, 月份: 1 (二月), 日期: 29')
              .fontSize(12)
              .fontColor('#666666')
              .margin({ bottom: 4 })
              .width('100%')

            Button('构造2024/1/29')
              .id('btn_leap_construct')
              .onClick((): void => {
                const day: CalendarDay = new CalendarDay(2024, 1, 29);
                const pass: boolean = day.day === 29 && day.month === 1 && day.year === 2024;
                this.leapResult = `toString: ${day.toString()} ✅ day=${day.day}, month=${day.month}, year=${day.year}${pass ? ' ✅' : ' ❌'}`;
                this.result = `闰年2/29: ${this.leapResult}\n年初1/1: ${this.janFirstResult || '未测试'}\n年末12/31: ${this.dec31Result || '未测试'}`;
              })
              .width('100%')
              .margin({ bottom: 8 })

            Text(this.leapResult)
              .id('text_leap_result')
              .fontSize(12)
              .fontColor('#E75F49')
              .margin({ bottom: 12 })
              .width('100%')

            // ── Scenario 2: 年初1月1日 ──
            Text('Scenario 2: 年初1月1日')
              .fontSize(13)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 4 })
              .width('100%')

            Text('年份: 2026, 月份: 0 (一月), 日期: 1')
              .fontSize(12)
              .fontColor('#666666')
              .margin({ bottom: 4 })
              .width('100%')

            Button('构造2026/0/1')
              .id('btn_jan_first_construct')
              .onClick((): void => {
                const day: CalendarDay = new CalendarDay(2026, 0, 1);
                const pass: boolean = day.month === 0;
                this.janFirstResult = `toString: ${day.toString()} ✅ month=0${pass ? ' ✅' : ' ❌'}`;
                this.result = `闰年2/29: ${this.leapResult || '未测试'}\n年初1/1: ${this.janFirstResult}\n年末12/31: ${this.dec31Result || '未测试'}`;
              })
              .width('100%')
              .margin({ bottom: 8 })

            Text(this.janFirstResult)
              .id('text_jan_first_result')
              .fontSize(12)
              .fontColor('#E75F49')
              .margin({ bottom: 12 })
              .width('100%')

            // ── Scenario 3: 年末12月31日 ──
            Text('Scenario 3: 年末12月31日')
              .fontSize(13)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 4 })
              .width('100%')

            Text('年份: 2026, 月份: 11 (十二月), 日期: 31')
              .fontSize(12)
              .fontColor('#666666')
              .margin({ bottom: 4 })
              .width('100%')

            Button('构造2026/11/31')
              .id('btn_dec31_construct')
              .onClick((): void => {
                const day: CalendarDay = new CalendarDay(2026, 11, 31);
                const pass: boolean = day.month === 11 && day.day === 31;
                this.dec31Result = `toString: ${day.toString()} ✅ month=11, day=31${pass ? ' ✅' : ' ❌'}`;
                this.result = `闰年2/29: ${this.leapResult || '未测试'}\n年初1/1: ${this.janFirstResult || '未测试'}\n年末12/31: ${this.dec31Result}`;
              })
              .width('100%')
              .margin({ bottom: 8 })

            Text(this.dec31Result)
              .id('text_dec31_result')
              .fontSize(12)
              .fontColor('#E75F49')
              .margin({ bottom: 8 })
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
      
      // TODO(result-F-01-08): Result 区写入规则 —— 操作触发后 this.result 替换初始占位 '等待操作 F-01-08...'，让 ResultPanel 可读：
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
      // 空状态占位：初始值已设为 '等待操作 F-01-08...'，操作触发后应替换为实际结果
      ResultPanel({ result: this.result })
        .height(120)
    }
    .width('100%')
    .height('100%')
  }
}
