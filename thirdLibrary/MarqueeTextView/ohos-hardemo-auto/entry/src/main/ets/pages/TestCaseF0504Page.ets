import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { MarqueeTextView, MarqueeTextViewController } from 'marquee_text_view';

@Entry
@Component
struct TestCaseF0504Page {
  @State result: string = '等待渲染 F-05-04...';
  @State inputSpeed: string = '0';
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

        Text('F-05-04 速度为零时文本保持静止不滚动')
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
            level: 'L2',
            preconditions: '应用已启动',
            test_steps: [
            '1. 点击【构造期自定义属性】进入模块列表页 [验证点: 已进入构造期自定义属性模块列表页]',
            '2. 点击【速度为零时文本保持静止不滚动】进入用例详情页 [验证点: 已进入速度为零用例详情页]',
            '3. 在【滚动速度】输入框中输入"0" [验证点: 速度 0 已填入]',
            '4. 点击【渲染组件】按钮 [验证点: 组件已渲染]',
            '5. 等待 5 秒 [验证点: 文本未位移]',
            '6. 观察【滚动文本】区域位移变化 [验证点: 文本保持静止不滚动]'
          ],
            expected_result: '速度为零时文本保持静止不产生位移，不滚动。',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('滚动速度')
              .fontSize(14)
              .fontColor('#333333')
              .width('100%')
              .margin({ bottom: 4 })

            TextInput({ placeholder: '输入滚动速度(如0)', text: this.inputSpeed })
              .id('input_speed_f0504')
              .type(InputType.Normal)
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((value: string) => {
                this.inputSpeed = value;
              })

            Button('渲染组件')
              .id('btn_render_f0504')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                const speedNum: number = Number.parseFloat(this.inputSpeed);
                if (Number.isNaN(speedNum)) {
                  this.result = '错误：请输入有效的数字';
                  return;
                }
                this.showComponent = true;
                this.result = '组件以 speed=' + speedNum + ' vp/帧渲染。speed=0 时每帧位移 (60/fps)*0=0，leftX 保持 0，文本静止。';
              })

            Button('查询位移')
              .id('btn_query_f0504')
              .width('100%')
              .onClick(() => {
                const lx: number = this.controller.getLeftX();
                this.result = '当前位移 leftX=' + lx + ' vp（speed=' + this.inputSpeed + '）。speed=0 时位移应保持 0 不变。';
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
                  text: '速度为零静止测试文本 MarqueeTextView',
                  controller: this.controller,
                  autoStart: true,
                  fontSize: 26,
                  speed: Number.parseFloat(this.inputSpeed),
                  space: 60,
                  fontColor: '#333333'
                })
                  .width('100%')
                  .id('preview_marquee_f0504')
              } else {
                Text('点击"渲染组件"以 speed=0 挂载')
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
