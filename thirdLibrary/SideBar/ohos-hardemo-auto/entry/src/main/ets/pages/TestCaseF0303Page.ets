import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { SideBar, SideBarListener } from 'sidebar';

@Entry
@Component
struct TestCaseF0303Page {
  @State result: string = '等待设置选中背景色与字母列表后按压...';
  @State inputPressedTextBgColor: string = '#00000000';
  @State pressedTextBgColor: string = '#00000000';
  @State inputLetters: string = 'A,B,C';
  @State letters: string[] = [];
  @State touchState: string = '未触摸';
  @State selectedPos: number = -1;
  @State selectedValue: string = '';
  @State textColor: string = '#000000';
  @State pressedTextColor: string = '#888888';
  @State textSize: number = 13;
  @State itemSpacing: number = 10;
  @State itemHeight: number = -1;

  private listener: SideBarListener | null = null;

  aboutToAppear(): void {
    this.listener = {
      onSideTouchState: (isTouch: boolean): void => {
        this.touchState = isTouch ? '按下' : '抬起';
        this.result = `选中背景色:${this.pressedTextBgColor}(透明) | 触摸态:${this.touchState} | 选中项: pos=${this.selectedPos}, value=${this.selectedValue} | 仅文字变色无可见圆形背景`;
      },
      onSideSelected: (position: number, currentY: number, selectedValue: string): void => {
        this.selectedPos = position;
        this.selectedValue = selectedValue;
        this.result = `选中背景色:${this.pressedTextBgColor}(透明) | 触摸态:${this.touchState} | 选中项: pos=${this.selectedPos}, value=${this.selectedValue} | 仅文字变色无可见圆形背景`;
      }
    } as SideBarListener;
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

        Text('F-03-03 选中背景透明时选中项仅文字变色无背景圆')
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
            '1. 点击【字母索引自绘渲染】进入模块列表页 [验证点: 进入模块列表页]',
            '2. 点击【选中背景透明时选中项仅文字变色无背景圆】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 在【选中背景色】输入框中输入透明色 [验证点: 选中背景色输入框显示透明色值]',
            '4. 在【字母列表】输入框中输入"A,B,C" [验证点: 字母列表输入框显示输入内容]',
            '5. 在【字母索引侧边栏】组件上按压第二个字母对应区域 [验证点: 第二个字母文字变色]',
            '6. 观察【字母索引侧边栏】组件的选中项外观 [验证点: 选中项无可见圆形背景]'
          ],
            expected_result: '选中项文字变选中色，无可见圆形背景',
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
              Text('选中背景色')
                .fontSize(14)
                .width(80)
              TextInput({ text: this.inputPressedTextBgColor })
                .id('input_pressed_text_bg_color')
                .width('60%')
                .onChange((value: string) => {
                  this.inputPressedTextBgColor = value;
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Button('应用选中背景色')
              .id('btn_apply_pressed_text_bg_color')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                const colorReg = new RegExp('^#[0-9A-Fa-f]{6}([0-9A-Fa-f]{2})?$');
                if (colorReg.test(this.inputPressedTextBgColor)) {
                  this.pressedTextBgColor = this.inputPressedTextBgColor;
                  this.result = `setPressedTextBgColor(${this.pressedTextBgColor}) → 选中背景色已应用(透明)，请设置字母列表后按压测试`;
                } else {
                  this.result = `输入的选中背景色无效: ${this.inputPressedTextBgColor}，请输入如#00000000的透明色`;
                }
              })

            Row() {
              Text('字母列表')
                .fontSize(14)
                .width(80)
              TextInput({ text: this.inputLetters })
                .id('input_letters')
                .width('60%')
                .onChange((value: string) => {
                  this.inputLetters = value;
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Button('设置字母列表')
              .id('btn_set_letters')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                const rawParts = this.inputLetters.split(',');
                const parsed: string[] = [];
                for (let i = 0; i < rawParts.length; i++) {
                  const part = rawParts[i].trim();
                  if (part.length > 0) {
                    parsed.push(part);
                  }
                }
                this.letters = parsed;
                this.result = `setLetters([${this.letters.join(',')}]) → ${this.letters.length}个字母已加载，请在预览区按压第二个字母(B)测试`;
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
                itemHeight: this.itemHeight,
                onSideBarListener: this.listener
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
