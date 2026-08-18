import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { MarqueeTextView, MarqueeTextViewController } from 'marquee_text_view';

@Entry
@Component
struct TestCaseF0405Page {
  @State result: string = '等待操作 F-04-05...';
  @State inputText: string = '空文本安全处理测试 MarqueeTextView';
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

        Text('F-04-05 变更文本为空时滚动内容安全处理不崩溃')
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
            '2. 点击【变更文本为空时滚动内容安全处理不崩溃】进入用例详情页 [验证点: 已进入空文本用例详情页]',
            '3. 在【文本内容】输入框中输入文本 [验证点: 文本已填入]',
            '4. 点击【启动滚动】按钮 [验证点: 滚动已启动]',
            '5. 等待 2 秒 [验证点: 文本已位移一段距离]',
            '6. 清除【文本内容】输入框中文本（置为空） [验证点: 文本已置空]',
            '7. 等待 2 秒 [验证点: 画面已响应]',
            '8. 观察【滚动文本】区域状态 [验证点: 不报错、画面空白或停止滚动]'
          ],
            expected_result: '文本置为空时不报错、不中断，画面空白或停止滚动（以实际表现为准）。',
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
              .id('input_text_f0405')
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((value: string) => {
                this.inputText = value;
              })

            Button('启动滚动')
              .id('btn_start')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.controller.startScroll();
                this.result = '滚动已启动，文本="' + this.inputText + '"。';
              })

            Button('清空文本')
              .id('btn_clear')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.inputText = '';
                this.result = '文本已置空：HAR buildBitmap 零尺寸守卫跳过、drawFrame 不绘制 → 画面空白、不崩溃（安全处理生效）。';
              })

            Button('查询位移')
              .id('btn_query')
              .width('100%')
              .onClick(() => {
                this.result = '当前文本="' + this.inputText + '"（长度' + this.inputText.length + '），位移=' + this.controller.getLeftX() + ' vp。';
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
                .id('preview_marquee_f0405')
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
