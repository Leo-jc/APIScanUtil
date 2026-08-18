import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { MarqueeTextView, MarqueeTextViewController } from 'marquee_text_view';

@Entry
@Component
struct TestCaseF0201Page {
  @State result: string = '等待启动滚动 F-02-01...';
  @State inputText: string = '帧驱动恒定速率滚动文本示例 Hello Marquee';
  @State isRunning: boolean = false;
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

        Text('F-02-01 文本以恒定速率持续向左横向滚动')
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
            '1. 点击【帧驱动滚动动画与速率归一化】进入模块列表页 [验证点: 已进入帧驱动滚动动画模块列表页]',
            '2. 点击【文本以恒定速率持续向左横向滚动】进入用例详情页 [验证点: 已进入恒定速率滚动用例详情页]',
            '3. 在【文本内容】输入框中输入文本 [验证点: 文本已填入输入框]',
            '4. 点击【启动滚动】按钮 [验证点: 滚动已启动]',
            '5. 等待 5 秒 [验证点: 文本持续向左位移]',
            '6. 观察【滚动文本】区域位移变化 [验证点: 文本每帧向左位移并重绘，持续滚动无卡顿]'
          ],
            expected_result: '文本每帧向左位移并重绘，持续向左横向滚动，无卡顿、无停顿。',
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
              .id('input_text_f0201')
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((value: string) => {
                this.inputText = value;
              })

            Button('启动滚动')
              .id('btn_start_f0201')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.controller.startScroll();
                this.isRunning = true;
                this.result = '滚动已启动，观察预览区每帧向左位移。当前位移 leftX=' + this.controller.getLeftX() + ' vp';
              })

            Button('查询当前位移')
              .id('btn_query_f0201')
              .width('100%')
              .onClick(() => {
                this.result = '当前位移 leftX=' + this.controller.getLeftX() + ' vp（持续向左递减，HAR displaySync 帧驱动重绘）。';
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
                .id('preview_marquee_f0201')
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
