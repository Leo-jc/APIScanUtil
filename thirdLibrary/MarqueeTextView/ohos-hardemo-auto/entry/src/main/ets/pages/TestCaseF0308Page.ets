import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { MarqueeTextView, MarqueeTextViewController } from 'marquee_text_view';

@Entry
@Component
struct TestCaseF0308Page {
  @State result: string = '等待操作 F-03-08（未滚动状态）...';
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

        Text('F-03-08 未滚动时重复暂停或停止，无可观测变化')
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
            '2. 点击【未滚动时重复暂停或停止，无可观测变化】进入用例详情页 [验证点: 已进入未滚动幂等用例详情页]',
            '3. 不点击启动，直接点击【暂停滚动】按钮 [验证点: 无报错]',
            '4. 点击【停止滚动】按钮 [验证点: 无报错]',
            '5. 连续点击【暂停滚动】与【停止滚动】按钮各 2 次 [验证点: 均无报错]',
            '6. 观察【滚动文本】区域状态 [验证点: 位移保持 0，无变化]'
          ],
            expected_result: '未滚动时暂停或停止，位移保持 0，无报错、无残留（以实际表现为准）。',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('暂停滚动(未启动)')
              .id('btn_pause')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.controller.pauseScroll();
                this.result = '未滚动时调用 pauseScroll()：无报错（幂等）。位移=' + this.controller.getLeftX() + ' vp。';
              })

            Button('停止滚动(未启动)')
              .id('btn_stop')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.controller.stopScroll();
                this.result = '未滚动时调用 stopScroll()：无报错（幂等）。位移=' + this.controller.getLeftX() + ' vp。';
              })

            Button('连续暂停+停止各2次')
              .id('btn_multi')
              .width('100%')
              .onClick(() => {
                this.controller.pauseScroll();
                this.controller.pauseScroll();
                this.controller.stopScroll();
                this.controller.stopScroll();
                this.result = '连续暂停2次+停止2次：均无报错。位移=' + this.controller.getLeftX() + ' vp（保持0，无变化）。';
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
                .id('preview_marquee_f0308')
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
