import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { SideBar } from 'sidebar';

@Entry
@Component
struct TestCaseF0102Page {
  @State result: string = '等待输入自定义样式配置并点击应用...';
  @State letters: string[] = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M'];
  @State textColor: string = '#000000';
  @State pressedTextColor: string = '#888888';
  @State pressedTextBgColor: string = '#00000000';
  @State textSize: number = 13;
  @State itemSpacing: number = 10;
  @State itemHeight: number = -1;
  @State inputTextColor: string = '';
  @State inputPressedTextColor: string = '';
  @State inputTextSize: string = '';

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

        Text('F-01-02 使用自定义样式呈现字母索引')
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
            '1. 点击【组件构造与样式配置】进入模块列表页 [验证点: 进入模块列表页]',
            '2. 点击【使用自定义样式呈现字母索引】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 在【未选中色】输入框中输入自定义颜色 [验证点: 未选中色输入框显示自定义颜色值]',
            '4. 在【选中色】输入框中输入自定义颜色 [验证点: 选中色输入框显示自定义颜色值]',
            '5. 在【字号】输入框中输入自定义字号 [验证点: 字号输入框显示自定义字号]',
            '6. 观察【字母索引侧边栏】组件的字母渲染外观 [验证点: 字母按自定义颜色/字号渲染]'
          ],
            expected_result: '字母按配置的颜色/字号/间距/高度渲染，外观与传入配置一致',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Row() {
              Text('未选中色')
                .fontSize(14)
                .width(80)
              TextInput({ text: this.inputTextColor })
                .id('input_text_color')
                .width('60%')
                .onChange((value: string) => {
                  this.inputTextColor = value;
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Row() {
              Text('选中色')
                .fontSize(14)
                .width(80)
              TextInput({ text: this.inputPressedTextColor })
                .id('input_pressed_text_color')
                .width('60%')
                .onChange((value: string) => {
                  this.inputPressedTextColor = value;
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Row() {
              Text('字号')
                .fontSize(14)
                .width(80)
              TextInput({ text: this.inputTextSize })
                .id('input_text_size')
                .width('60%')
                .onChange((value: string) => {
                  this.inputTextSize = value;
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Button('应用配置')
              .id('btn_apply_config')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                const colorReg = new RegExp('^#[0-9A-Fa-f]{6}([0-9A-Fa-f]{2})?$');
                if (colorReg.test(this.inputTextColor)) {
                  this.textColor = this.inputTextColor;
                }
                if (colorReg.test(this.inputPressedTextColor)) {
                  this.pressedTextColor = this.inputPressedTextColor;
                }
                const parsedSize = parseInt(this.inputTextSize, 10);
                if (parsedSize > 0) {
                  this.textSize = parsedSize;
                }
                this.result = `当前配置: 未选中色=${this.textColor}, 选中色=${this.pressedTextColor}, 字号=${this.textSize}vp`;
              })

            Text('字母索引侧边栏预览')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 8, bottom: 4 })

            Row() {
              SideBar({
                letters: this.letters,
                textColor: this.textColor,
                pressedTextColor: this.pressedTextColor,
                pressedTextBgColor: this.pressedTextBgColor,
                textSize: this.textSize,
                itemSpacing: this.itemSpacing,
                itemHeight: this.itemHeight
              })
                .id('sidebar_preview')
                .backgroundColor('#F5F5F5')
            }
            .width('100%')
            .height(360)
            .alignItems(VerticalAlign.Center)
            .justifyContent(FlexAlign.Center)
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
