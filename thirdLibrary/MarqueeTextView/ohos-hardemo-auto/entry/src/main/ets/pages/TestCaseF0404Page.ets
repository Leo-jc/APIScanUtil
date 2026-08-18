import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { MarqueeTextView, MarqueeTextViewController } from 'marquee_text_view';

@Entry
@Component
struct TestCaseF0404Page {
  @State result: string = '等待操作 F-04-04...';
  @State inputText: string = '父布局重排测试 MarqueeTextView';
  @State parentWidth: number = 300;
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

        Text('F-04-04 父布局重排引起的布局变化触发位图重建与滚动重启')
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
            '1. 点击【文本与字号变更及自动重建】进入模块列表页 [验证点: 已进入文本与字号变更模块列表页]',
            '2. 点击【父布局重排引起的布局变化触发位图重建与滚动重启】进入用例详情页 [验证点: 已进入父布局重排用例详情页]',
            '3. 在【文本内容】输入框中输入文本 [验证点: 文本已填入]',
            '4. 点击【启动滚动】按钮 [验证点: 滚动已启动]',
            '5. 等待 2 秒 [验证点: 文本已位移一段距离]',
            '6. 拖动【父布局尺寸】滑块改变父布局宽度 [验证点: 父布局宽度已变化]',
            '7. 等待 2 秒 [验证点: 布局已重排]',
            '8. 观察【滚动文本】区域内容与位置 [验证点: 位图重建并从起点滚动]'
          ],
            expected_result: '父布局重排引起布局变化后，自动重建位图并从起点重新滚动，内容与最新布局一致。',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('文本内容')
              .fontSize(14)
              .fontColor('#333333')
              .width('100%')
              .margin({ bottom: 4 })

            TextInput({ placeholder: '输入文本', text: this.inputText })
              .id('input_text_f0404')
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((value: string) => {
                this.inputText = value;
              })

            Text('父布局宽度: ' + this.parentWidth + ' vp')
              .fontSize(14)
              .fontColor('#333333')
              .width('100%')
              .margin({ bottom: 4 })

            Slider({ value: this.parentWidth, min: 120, max: 360, step: 10 })
              .id('slider_width_f0404')
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((value: number) => {
                this.parentWidth = value;
              })

            Button('启动滚动')
              .id('btn_start')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.controller.startScroll();
                this.result = '滚动已启动。拖动滑块改变父布局宽度，将触发 HAR onAreaChange → buildBitmap + restartScroll（从起点重滚）。';
              })

            Button('查询位移')
              .id('btn_query')
              .width('100%')
              .onClick(() => {
                this.result = '父布局宽度=' + this.parentWidth + ' vp，位移=' + this.controller.getLeftX() + ' vp（宽度变化后位移复位为0再滚动）。';
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
                .id('preview_marquee_f0404')
            }
            .backgroundColor('#FFFFFF')
            .border({ width: 1, color: '#E0E0E0' })
            .borderRadius(8)
            .padding(8)
            .width(this.parentWidth)
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
