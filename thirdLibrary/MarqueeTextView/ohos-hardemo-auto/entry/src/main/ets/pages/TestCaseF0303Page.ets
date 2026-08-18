import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { MarqueeTextView, MarqueeTextViewController } from 'marquee_text_view';

@Entry
@Component
struct TestCaseF0303Page {
  @State result: string = '等待操作 F-03-03...';
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

        Text('F-03-03 滚动中重复启动，不因重复投递产生异常或多重滚动')
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
            '2. 点击【滚动中重复启动，不因重复投递产生异常或多重滚动】进入用例详情页 [验证点: 已进入重复启动用例详情页]',
            '3. 点击【启动滚动】按钮 [验证点: 滚动已启动]',
            '4. 等待 1 秒后再次点击【启动滚动】按钮 [验证点: 第二次启动已触发]',
            '5. 连续点击【启动滚动】按钮 3 次 [验证点: 已多次触发启动]',
            '6. 观察【滚动文本】区域表现 [验证点: 无多重滚动或速率倍增等异常]'
          ],
            expected_result: '滚动中重复启动不报错、不中断，画面不出现多重滚动或速率倍增等异常（以实际表现为准）。',
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
                this.result = '调用 startScroll()（幂等：已在滚动时不再重复投递帧回调）。当前位移=' + this.controller.getLeftX() + ' vp';
              })

            Button('连续启动3次')
              .id('btn_start_x3')
              .width('100%')
              .onClick(() => {
                this.controller.startScroll();
                this.controller.startScroll();
                this.controller.startScroll();
                this.result = '连续调用 startScroll() 3次：未报错、无多重滚动（HAR 幂等去重，isScrolling 守卫）。位移=' + this.controller.getLeftX() + ' vp';
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
                .id('preview_marquee_f0303')
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
