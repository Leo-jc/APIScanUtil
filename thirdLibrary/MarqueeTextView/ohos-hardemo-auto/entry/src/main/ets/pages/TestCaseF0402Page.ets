import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { MarqueeTextView, MarqueeTextViewController } from 'marquee_text_view';

@Entry
@Component
struct TestCaseF0402Page {
  @State result: string = '等待操作 F-04-02...';
  @State inputText: string = '字号变更测试 MarqueeTextView';
  @State inputSize: string = '20';
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

        Text('F-04-02 运行期变更字号后字号变化生效并从起点重滚')
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
            test_steps: [
            '1. 点击【文本与字号变更及自动重建】进入模块列表页 [验证点: 已进入文本与字号变更模块列表页]',
            '2. 点击【运行期变更字号后字号变化生效并从起点重滚】进入用例详情页 [验证点: 已进入变更字号用例详情页]',
            '3. 在【文本内容】输入框中输入文本 [验证点: 文本已填入]',
            '4. 在【字号】输入框中输入"20" [验证点: 字号 20 已填入]',
            '5. 点击【启动滚动】按钮 [验证点: 滚动已启动]',
            '6. 等待 2 秒 [验证点: 文本以字号 20 滚动]',
            '7. 在【字号】输入框中清除并输入"40" [验证点: 字号 40 已填入]',
            '8. 等待 2 秒 [验证点: 字号已变化]',
            '9. 观察【滚动文本】区域字号与位置 [验证点: 字号变大生效，位移复位从起点滚动]'
          ],
            expected_result: '字号变化在滚动中生效（文本变大），位移复位为 0 并从起点重新滚动。',
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
              .id('input_text_f0402')
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((value: string) => {
                this.inputText = value;
              })

            Text('字号')
              .fontSize(14)
              .fontColor('#333333')
              .width('100%')
              .margin({ bottom: 4 })

            TextInput({ placeholder: '输入字号(如20)', text: this.inputSize })
              .id('input_size_f0402')
              .type(InputType.Normal)
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((value: string) => {
                this.inputSize = value;
              })

            Button('启动滚动')
              .id('btn_start')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.controller.startScroll();
                this.result = '滚动已启动，字号=' + this.inputSize + '。修改字号输入框将触发重建重滚。';
              })

            Button('查询位移')
              .id('btn_query')
              .width('100%')
              .onClick(() => {
                this.result = '当前字号=' + this.inputSize + '，位移=' + this.controller.getLeftX() + ' vp（字号变化后位移复位为0再滚动）。';
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
                fontSize: Number(this.inputSize),
                controller: this.controller,
                autoStart: false,
                space: 60,
                fontColor: '#333333'
              })
                .width('100%')
                .id('preview_marquee_f0402')
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
