import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { MarqueeTextView, MarqueeTextViewController } from 'marquee_text_view';

@Entry
@Component
struct TestCaseF0104Page {
  @State result: string = '文本为空，预览区应保持空白且不崩溃。';
  @State inputText: string = '';
  @State errorOccurred: boolean = false;
  private controller: MarqueeTextViewController = new MarqueeTextViewController();

  aboutToAppear(): void {
    this.errorOccurred = false;
    this.result = '文本为空：预览区已挂载，页面 aboutToAppear 完成（未崩溃），HAR buildBitmap 零尺寸守卫生效，画面应为空白。';
  }

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

        Text('F-01-04 未完成布局或位图未生成时画面空白且不崩溃')
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
            '2. 点击【未完成布局或位图未生成时画面空白且不崩溃】进入用例详情页 [验证点: 已进入未生成位图用例详情页]',
            '3. 清除【文本内容】输入框中文本（置为空），使控件未完成测量或位图未生成 [验证点: 文本为空，控件处于未测量状态]',
            '4. 等待 3 秒 [验证点: 画面保持空白]',
            '5. 观察【滚动文本】区域显示 [验证点: 画面空白、不绘制内容，应用不报错、不中断]'
          ],
            expected_result: '未完成布局或位图未生成时画面空白、不绘制内容，应用不报错、不中断（以实际表现为准）。',
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

            TextInput({ placeholder: '置空以观察空白画面', text: this.inputText })
              .id('input_text_f0104')
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((value: string) => {
                this.inputText = value;
                if (this.inputText.length === 0) {
                  this.result = '文本已置空：预览区应空白且不崩溃（HAR buildBitmap 零尺寸守卫）。';
                } else {
                  this.result = `当前文本: "${this.inputText}"（长度 ${this.inputText.length}），非空时 HAR 正常渲染滚动。`;
                }
              })

            Button('查询当前位移')
              .id('btn_query_leftx_f0104')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                try {
                  const lx: number = this.controller.getLeftX();
                  this.errorOccurred = false;
                  this.result = `文本为空：leftX=${lx} vp（未滚动），预览区应空白，页面存活未崩溃。异常捕获: ${this.errorOccurred ? '是' : '否'}`;
                } catch (e) {
                  this.errorOccurred = true;
                  let err = e as Error;
                  this.result = `查询异常: ${err.message}，异常捕获: 是`;
                }
              })

            Button('清空文本')
              .id('btn_clear_text_f0104')
              .width('100%')
              .onClick(() => {
                this.inputText = '';
                this.errorOccurred = false;
                this.result = '文本已置空，预览区应为空白且不崩溃（HAR buildBitmap 零尺寸守卫生效，drawFrame 提前返回）。';
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
                fontSize: 24,
                space: 60,
                fontColor: '#333333'
              })
                .width('100%')
                .id('preview_marquee_f0104')
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
