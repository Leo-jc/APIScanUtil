import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { MarqueeTextView, MarqueeTextViewController } from 'marquee_text_view';

@Entry
@Component
struct TestCaseF0101Page {
  @State result: string = '短文本循环滚动中，观察预览区头尾衔接处是否无空白断裂。';
  @State inputText: string = 'Hi';
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

        Text('F-01-01 短文本时头尾无缝衔接循环滚动')
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
            '1. 点击【横向滚动文本自绘渲染】进入模块列表页 [验证点: 已进入横向滚动文本自绘渲染模块列表页]',
            '2. 点击【短文本时头尾无缝衔接循环滚动】进入用例详情页 [验证点: 已进入短文本循环滚动用例详情页]',
            '3. 在【文本内容】输入框中输入短于控件宽度的文本 [验证点: 短文本已填入文本内容输入框]',
            '4. 等待 3 秒让滚动启动 [验证点: 滚动已启动，文本开始位移]',
            '5. 观察【滚动文本】区域显示 [验证点: 可见头尾衔接的循环滚动，衔接处无空白断裂]'
          ],
            expected_result: '文本以头尾无缝衔接的方式循环滚动，衔接处无空白断裂，周期归一时无明显跳跃。',
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

            TextInput({ placeholder: '输入短文本', text: this.inputText })
              .id('input_text_f0101')
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((value: string) => {
                this.inputText = value;
                this.result = `当前文本: "${this.inputText}"（长度 ${this.inputText.length}），@Prop text 变化触发重建重滚，目视预览区头尾衔接。`;
              })

            Button('查询当前位移')
              .id('btn_query_leftx_f0101')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                const lx: number = this.controller.getLeftX();
                this.result = `leftX=${lx} vp（负值表示已向左滚动），文本: "${this.inputText}"（长度 ${this.inputText.length}），目视预览区头尾衔接无断裂。`;
              })

            Button('重置为短文本')
              .id('btn_reset_short_f0101')
              .width('100%')
              .onClick(() => {
                this.inputText = 'Hi';
                this.result = `已重置为短文本: "${this.inputText}"（长度 ${this.inputText.length}），@Prop text 变化触发重建重滚。`;
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
                autoStart: true,
                fontSize: 30,
                space: 60,
                fontColor: '#333333'
              })
                .width('100%')
                .id('preview_marquee_f0101')
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
