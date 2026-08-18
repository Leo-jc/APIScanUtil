import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { CheckerboardBackground, CheckerboardDrawable, CheckerboardDrawableBuilder } from 'checkerboarddrawable';

@Entry
@Component
struct TestCaseF0106Page {
  @State result: string = '等待操作 F-01-06...';
  @State inputColorOdd: string = '#80CCCCCC';
  @State inputColorEven: string = '#80F3F3F3';
  @State cellSize: number = 40;
  @State colorOdd: string = '#FFC2C2C2';
  @State colorEven: string = '#FFF3F3F3';
  @State hasPreview: boolean = false;

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

        Text('F-01-06 半透明颜色生成半透明纹理')
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
            '1. 点击【棋盘格背景纹理构造】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【半透明颜色生成半透明纹理】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 在【奇数格颜色】输入框中输入半透明颜色值"#80CCCCCC" [验证点: 奇数格颜色输入框显示半透明颜色值]',
            '4. 在【偶数格颜色】输入框中输入半透明颜色值"#80F3F3F3" [验证点: 偶数格颜色输入框显示半透明颜色值]',
            '5. 点击【生成棋盘格】按钮 [验证点: 预览区域呈现半透明棋盘格]',
            '6. 观察【预览】区域棋盘格与底层叠加效果 [验证点: 格子半透明，底层内容透出，呈现叠加效果]'
          ],
            expected_result: '预览区域棋盘格格子半透明，底层内容透出，呈现叠加效果',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('奇数格颜色')
              .fontSize(14)
              .margin({ bottom: 4 })

            TextInput({ placeholder: '#80CCCCCC', text: this.inputColorOdd })
              .id('input_color_odd')
              .type(InputType.Normal)
              .width('100%')
              .onChange((v: string) => {
                this.inputColorOdd = v;
              })
              .margin({ bottom: 12 })

            Text('偶数格颜色')
              .fontSize(14)
              .margin({ bottom: 4 })

            TextInput({ placeholder: '#80F3F3F3', text: this.inputColorEven })
              .id('input_color_even')
              .type(InputType.Normal)
              .width('100%')
              .onChange((v: string) => {
                this.inputColorEven = v;
              })
              .margin({ bottom: 12 })

            Button('生成棋盘格')
              .id('btn_build')
              .width('100%')
              .onClick(() => {
                try {
                  let drawable: CheckerboardDrawable = new CheckerboardDrawableBuilder()
                    .size(this.cellSize)
                    .colorOdd(this.inputColorOdd)
                    .colorEven(this.inputColorEven)
                    .build();
                  this.colorOdd = drawable.getColorOdd();
                  this.colorEven = drawable.getColorEven();
                  this.hasPreview = true;
                  this.result = 'build() → 构造成功\n' +
                    'colorOdd=' + this.colorOdd + ' (Alpha=0x80 半透明)\n' +
                    'colorEven=' + this.colorEven + ' (Alpha=0x80 半透明)';
                } catch (e) {
                  this.result = 'build: error: ' + (e as Error).message;
                }
              })
              .margin({ bottom: 12 })

            // 预览区（渲染验证）：底层彩色背景 + 半透明棋盘格叠加
            Text('预览')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ bottom: 4 })

            Stack() {
              Column() {
                Text('底层背景')
                  .fontColor('#FFFFFF')
                  .fontSize(16)
              }
              .width('100%')
              .height('100%')
              .backgroundColor('#FF3366CC')
              .justifyContent(FlexAlign.Center)

              if (this.hasPreview) {
                CheckerboardBackground({
                  cellSize: this.cellSize,
                  colorOdd: this.colorOdd,
                  colorEven: this.colorEven,
                  alpha: 255,
                  filterString: 'none'
                })
              } else {
                Text('点击「生成棋盘格」生成预览')
                  .fontSize(12)
                  .fontColor('#FFFFFF')
              }
            }
            .width('100%')
            .height(200)
            .borderRadius(8)
            .clip(true)
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
