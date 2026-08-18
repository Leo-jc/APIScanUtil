import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { MarqueeTextView, MarqueeTextViewController } from 'marquee_text_view';

@Entry
@Component
struct TestCaseF0502Page {
  @State result: string = '等待渲染 F-05-02...';
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

        Text('F-05-02 未提供自定义属性时滚动间隔与速度按默认值生效')
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
            '1. 点击【构造期自定义属性】进入模块列表页 [验证点: 已进入构造期自定义属性模块列表页]',
            '2. 点击【未提供自定义属性时滚动间隔与速度按默认值生效】进入用例详情页 [验证点: 已进入默认值生效用例详情页]',
            '3. 不输入任何属性，直接点击【渲染组件】按钮 [验证点: 组件以默认值渲染]',
            '4. 等待滚动启动 [验证点: 滚动已启动]',
            '5. 观察【滚动文本】区域间隔与速度表现 [验证点: 间隔与速度与默认值一致]'
          ],
            expected_result: '间隔按默认值、速度按默认值生效，滚动行为与默认配置一致。',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('未提供自定义属性，组件将以 HAR 默认值渲染：space=100 vp，speed=0.5 vp/帧')
              .fontSize(13)
              .fontColor('#666666')
              .width('100%')
              .margin({ bottom: 8 })

            Button('渲染组件')
              .id('btn_render_f0502')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.showComponent = true;
                this.result = '组件以 HAR 默认值渲染：space=100 vp（默认），speed=0.5 vp/帧（默认）。autoStart=true 自动启动滚动。';
              })

            Button('查询位移')
              .id('btn_query_f0502')
              .width('100%')
              .onClick(() => {
                this.result = '当前位移 leftX=' + this.controller.getLeftX() + ' vp（默认 space=100，speed=0.5）。';
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
                  text: 'Hello MarqueeTextView 默认属性测试文本',
                  controller: this.controller,
                  autoStart: true,
                  fontSize: 26,
                  fontColor: '#333333'
                })
                  .width('100%')
                  .id('preview_marquee_f0502')
              } else {
                Text('点击"渲染组件"以默认值挂载')
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
