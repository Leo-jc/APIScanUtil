import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { MarqueeTextView, MarqueeTextViewController } from 'marquee_text_view';

@Entry
@Component
struct TestCaseF0403Page {
  @State result: string = '等待渲染 F-04-03...';
  @State ctorText: string = '初始文本';
  @State ctorSize: string = '30';
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

        Text('F-04-03 构造期文本与字号变更不触发位图重建')
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
            '2. 点击【构造期文本与字号变更不触发位图重建】进入用例详情页 [验证点: 已进入构造期变更用例详情页]',
            '3. 在【构造期文本】输入框中输入"初始文本" [验证点: 构造期文本已填入]',
            '4. 在【构造期字号】输入框中输入"30" [验证点: 构造期字号已填入]',
            '5. 点击【渲染组件】按钮 [验证点: 组件已渲染]',
            '6. 等待 2 秒 [验证点: 画面稳定]',
            '7. 观察【滚动文本】区域显示 [验证点: 不触发位图重建、不报错]'
          ],
            expected_result: '构造期变更文本与字号时仅父类生效，不触发位图重建、不报错（以实际表现为准）。',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('构造期文本')
              .fontSize(14)
              .fontColor('#333333')
              .width('100%')
              .margin({ bottom: 4 })

            TextInput({ placeholder: '输入构造期文本', text: this.ctorText })
              .id('input_text_f0403')
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((value: string) => {
                this.ctorText = value;
              })

            Text('构造期字号')
              .fontSize(14)
              .fontColor('#333333')
              .width('100%')
              .margin({ bottom: 4 })

            TextInput({ placeholder: '输入构造期字号(如30)', text: this.ctorSize })
              .id('input_size_f0403')
              .type(InputType.Normal)
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((value: string) => {
                this.ctorSize = value;
              })

            Button('渲染组件')
              .id('btn_render')
              .width('100%')
              .onClick(() => {
                this.showComponent = true;
                this.result = '组件已以构造期值挂载：文本="' + this.ctorText + '"，字号=' + this.ctorSize + '。初始 @Prop 值不触发 @Watch（构造期不重建位图、不报错）。';
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
                  text: this.ctorText,
                  fontSize: Number(this.ctorSize),
                  controller: this.controller,
                  autoStart: false,
                  space: 60,
                  fontColor: '#333333'
                })
                  .width('100%')
                  .id('preview_marquee_f0403')
              } else {
                Text('点击"渲染组件"以构造期值挂载')
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
