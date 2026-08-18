import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { MarqueeTextView, MarqueeTextViewController } from 'marquee_text_view';

@Entry
@Component
struct TestCaseF0501Page {
  @State result: string = '等待渲染 F-05-01...';
  @State inputSpace: string = '200';
  @State inputSpeed: string = '1.0';
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

        Text('F-05-01 提供自定义属性时滚动间隔与速度按属性值生效')
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
            '2. 点击【提供自定义属性时滚动间隔与速度按属性值生效】进入用例详情页 [验证点: 已进入属性值生效用例详情页]',
            '3. 在【滚动间隔】输入框中输入"200" [验证点: 间隔 200 已填入]',
            '4. 在【滚动速度】输入框中输入"1.0" [验证点: 速度 1.0 已填入]',
            '5. 点击【渲染组件】按钮 [验证点: 组件已渲染]',
            '6. 等待滚动启动 [验证点: 滚动已启动]',
            '7. 观察【滚动文本】区域间隔与速度表现 [验证点: 间隔与速度与配置一致]'
          ],
            expected_result: '间隔按 200 生效、速度按 1.0 生效，滚动间隔与速度与配置一致。',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('滚动间隔')
              .fontSize(14)
              .fontColor('#333333')
              .width('100%')
              .margin({ bottom: 4 })

            TextInput({ placeholder: '输入滚动间隔(如200)', text: this.inputSpace })
              .id('input_space_f0501')
              .type(InputType.Normal)
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((value: string) => {
                this.inputSpace = value;
              })

            Text('滚动速度')
              .fontSize(14)
              .fontColor('#333333')
              .width('100%')
              .margin({ bottom: 4 })

            TextInput({ placeholder: '输入滚动速度(如1.0)', text: this.inputSpeed })
              .id('input_speed_f0501')
              .type(InputType.Normal)
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((value: string) => {
                this.inputSpeed = value;
              })

            Button('渲染组件')
              .id('btn_render_f0501')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                const spaceNum: number = Number.parseFloat(this.inputSpace);
                const speedNum: number = Number.parseFloat(this.inputSpeed);
                if (Number.isNaN(spaceNum) || Number.isNaN(speedNum)) {
                  this.result = '错误：请输入有效的数字（间隔和速度）';
                  return;
                }
                this.showComponent = true;
                this.result = '组件以构造期属性渲染：space=' + spaceNum + ' vp，speed=' + speedNum + ' vp/帧。autoStart=true 自动启动滚动，目视预览区间隔与速度。';
              })

            Button('查询位移')
              .id('btn_query_f0501')
              .width('100%')
              .onClick(() => {
                this.result = '当前位移 leftX=' + this.controller.getLeftX() + ' vp（space=' + this.inputSpace + '，speed=' + this.inputSpeed + '）。';
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
                  text: 'Hello MarqueeTextView 构造期属性测试文本',
                  controller: this.controller,
                  autoStart: true,
                  fontSize: 26,
                  space: Number.parseFloat(this.inputSpace),
                  speed: Number.parseFloat(this.inputSpeed),
                  fontColor: '#333333'
                })
                  .width('100%')
                  .id('preview_marquee_f0501')
              } else {
                Text('点击"渲染组件"以构造期属性值挂载')
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
