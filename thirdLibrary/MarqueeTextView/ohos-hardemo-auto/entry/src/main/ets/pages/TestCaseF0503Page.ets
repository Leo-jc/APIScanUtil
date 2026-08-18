import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { MarqueeTextView, MarqueeTextViewController } from 'marquee_text_view';

@Entry
@Component
struct TestCaseF0503Page {
  @State result: string = '等待渲染 F-05-03...';
  @State inputText: string = '这是一段远超一行宽度的超长文本用于测试MarqueeTextView的强制单行不换行特性，无论文本多长都不会折行显示，超出部分通过横向滚动展示';
  @State showComponent: boolean = false;
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

        Text('F-05-03 文本超长时强制单行不换行')
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
            '1. 点击【构造期自定义属性】进入模块列表页 [验证点: 已进入构造期自定义属性模块列表页]',
            '2. 点击【文本超长时强制单行不换行】进入用例详情页 [验证点: 已进入单行强制用例详情页]',
            '3. 在【文本内容】输入框中输入远超一行的长文本 [验证点: 长文本已填入]',
            '4. 点击【渲染组件】按钮 [验证点: 组件已渲染]',
            '5. 等待滚动启动 [验证点: 滚动已启动]',
            '6. 观察【滚动文本】区域行数与显示 [验证点: 单行显示，不换行]'
          ],
            expected_result: '文本超长时强制单行显示，不换行，超出部分通过横向滚动展示。',
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

            TextInput({ placeholder: '输入远超一行的长文本', text: this.inputText })
              .id('input_text_f0503')
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((value: string) => {
                this.inputText = value;
              })

            Button('渲染组件')
              .id('btn_render_f0503')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.showComponent = true;
                this.result = '组件已渲染，文本长度=' + this.inputText.length + ' 字符。MarqueeTextView 基于 Canvas 自绘，强制单行不换行，超出部分横向滚动。';
              })

            Button('查询位移')
              .id('btn_query_f0503')
              .width('100%')
              .onClick(() => {
                this.result = '当前位移 leftX=' + this.controller.getLeftX() + ' vp（文本长度=' + this.inputText.length + '，单行滚动中）。';
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
              if (this.showComponent) {
                MarqueeTextView({
                  text: this.inputText,
                  controller: this.controller,
                  autoStart: true,
                  fontSize: 26,
                  space: 60,
                  fontColor: '#333333'
                })
                  .width('100%')
                  .id('preview_marquee_f0503')
              } else {
                Text('点击"渲染组件"以长文本挂载')
                  .fontSize(12)
                  .fontColor('#999999')
                  .width('100%')
                  .textAlign(TextAlign.Center)
                  .padding(16)
              }
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
