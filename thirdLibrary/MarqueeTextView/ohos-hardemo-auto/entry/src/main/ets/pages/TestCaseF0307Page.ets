import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { MarqueeTextView, MarqueeTextViewController } from 'marquee_text_view';

@Entry
@Component
struct TestCaseF0307Page {
  @State result: string = '等待操作 F-03-07...';
  @State inputText: string = '滚动控制 API 测试文本 MarqueeTextView';
  private controller: MarqueeTextViewController = new MarqueeTextViewController();

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

        Text('F-03-07 重启滚动，先复位再从起点重新滚动')
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
            test_steps: [
            '1. 点击【滚动控制 API】进入模块列表页 [验证点: 已进入滚动控制模块列表页]',
            '2. 点击【重启滚动，先复位再从起点重新滚动】进入用例详情页 [验证点: 已进入重启滚动用例详情页]',
            '3. 点击【启动滚动】按钮 [验证点: 滚动已启动]',
            '4. 等待 2 秒 [验证点: 文本已位移一段距离]',
            '5. 点击【重启滚动】按钮 [验证点: 画面复位后重新滚动]',
            '6. 观察【滚动文本】区域位置 [验证点: 先复位为 0 再从起点滚动]'
          ],
            expected_result: '重启后位移先复位为 0 再启动，画面从左对齐起点重新滚动，行为等价于停止后再启动。',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('启动滚动')
              .id('btn_start')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.controller.startScroll();
                this.result = '滚动已启动，位移=' + this.controller.getLeftX() + ' vp。';
              })

            Button('重启滚动')
              .id('btn_restart')
              .width('100%')
              .onClick(() => {
                this.controller.restartScroll();
                this.result = '调用 restartScroll()（=stopScroll+startScroll）：先复位为0再启动。当前位移=' + this.controller.getLeftX() + ' vp（从起点重新滚动）。';
              })
          }
          .padding({ left: 12, right: 12, top: 12, bottom: 12 })
          .width('100%')

          // 滚动文本预览区
          Column() {
            Text('滚动文本预览区')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor('#333333')
              .margin({ bottom: 8 })
              .width('100%')

            Column() {
              MarqueeTextView({
                text: this.inputText,
                controller: this.controller,
                autoStart: false,
                fontSize: 26,
                space: 60,
                fontColor: '#333333'
              })
                .width('100%')
                .id('preview_marquee_f0307')
            }
            .backgroundColor('#FFFFFF')
            .border({ width: 1, color: '#E0E0E0' })
            .borderRadius(8)
            .padding(8)
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

      ResultPanel({ result: this.result })
        .height(120)
    }
    .width('100%')
    .height('100%')
  }
}
