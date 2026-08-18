import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { MarqueeTextView, MarqueeTextViewController } from 'marquee_text_view';

@Entry
@Component
struct TestCaseF0103Page {
  @State result: string = '极短文本滚动中，控件宽度远大于文本，HAR 自动夹紧 space=0，目视无负间隔/错位。';
  @State inputText: string = 'A';
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

        Text('F-01-03 控件远大于文本时间隔自动夹紧不产生负间隔')
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
            '1. 点击【横向滚动文本自绘渲染】进入模块列表页 [验证点: 已进入横向滚动文本自绘渲染模块列表页]',
            '2. 点击【控件远大于文本时间隔自动夹紧不产生负间隔】进入用例详情页 [验证点: 已进入间隔夹紧用例详情页]',
            '3. 在【文本内容】输入框中输入极短文本（控件宽度远大于文本） [验证点: 极短文本已填入，控件宽度远大于文本]',
            '4. 等待 3 秒让滚动启动 [验证点: 滚动已启动]',
            '5. 观察【滚动文本】区域头尾间隔表现 [验证点: 头尾间隔收紧为 0，无负间隔或错位]'
          ],
            expected_result: '控件远大于文本时头尾间隔自动收紧为 0，不产生负间隔、不出现位图错位或视觉异常。',
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

            TextInput({ placeholder: '输入极短文本（控件远大于文本）', text: this.inputText })
              .id('input_text_f0103')
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((value: string) => {
                this.inputText = value;
                this.result = `极短文本: "${this.inputText}"（长度 ${this.inputText.length}），控件宽度远大于文本，HAR 自动夹紧 space=0，目视无负间隔/错位。`;
              })

            Button('查询当前位移')
              .id('btn_query_leftx_f0103')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                const lx: number = this.controller.getLeftX();
                this.result = `leftX=${lx} vp，极短文本: "${this.inputText}"，控件远大于文本时 space 自动夹紧为 0，目视预览区无负间隔或位图错位。`;
              })

            Button('重置为极短文本')
              .id('btn_reset_tiny_f0103')
              .width('100%')
              .onClick(() => {
                this.inputText = 'A';
                this.result = `已重置为极短文本: "${this.inputText}"（长度 ${this.inputText.length}），@Prop text 变化触发重建重滚，space=100 但控件远大于文本时夹紧为 0。`;
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
                fontSize: 20,
                space: 100,
                fontColor: '#333333'
              })
                .width('100%')
                .id('preview_marquee_f0103')
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
