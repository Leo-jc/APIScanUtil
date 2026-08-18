import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { CheckerboardBackground, CheckerboardDrawable, CheckerboardDrawableBuilder } from 'checkerboarddrawable';

@Entry
@Component
struct TestCaseF0104Page {
  @State result: string = '等待操作 F-01-04...';
  @State inputSize: string = '80';
  @State inputColorOdd: string = '#FFCC6600';
  @State inputColorEven: string = '#FF0066CC';
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

        Text('F-01-04 同时自定义尺寸与颜色生成组合纹理')
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
            '1. 点击【棋盘格背景纹理构造】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【同时自定义尺寸与颜色生成组合纹理】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 在【格子尺寸】输入框中输入"80" [验证点: 输入框显示数值 80]',
            '4. 在【奇数格颜色】输入框中输入自定义颜色值 [验证点: 奇数格颜色输入框显示自定义颜色值]',
            '5. 在【偶数格颜色】输入框中输入另一颜色值 [验证点: 偶数格颜色输入框显示另一颜色值]',
            '6. 点击【生成棋盘格】按钮 [验证点: 预览区域呈现组合参数的棋盘格]',
            '7. 观察【预览】区域呈现的棋盘格背景 [验证点: 格子变大且配色为自定义双色，三项参数同时生效无相互冲突]'
          ],
            expected_result: '预览区域三项自定义参数同时生效，格子变大且配色为自定义双色，尺寸与配色组合呈现无冲突',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('格子尺寸')
              .fontSize(14)
              .margin({ bottom: 4 })

            TextInput({ placeholder: '输入格子尺寸(如80)', text: this.inputSize })
              .id('input_size')
              .type(InputType.Normal)
              .width('100%')
              .onChange((v: string) => {
                this.inputSize = v;
              })
              .margin({ bottom: 8 })

            Text('奇数格颜色')
              .fontSize(14)
              .margin({ bottom: 4 })

            TextInput({ placeholder: '输入颜色(如#FFCC6600)', text: this.inputColorOdd })
              .id('input_color_odd')
              .type(InputType.Normal)
              .width('100%')
              .onChange((v: string) => {
                this.inputColorOdd = v;
              })
              .margin({ bottom: 8 })

            Text('偶数格颜色')
              .fontSize(14)
              .margin({ bottom: 4 })

            TextInput({ placeholder: '输入颜色(如#FF0066CC)', text: this.inputColorEven })
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
                  let n: number = Number.parseInt(this.inputSize);
                  let drawable: CheckerboardDrawable = new CheckerboardDrawableBuilder()
                    .size(n)
                    .colorOdd(this.inputColorOdd)
                    .colorEven(this.inputColorEven)
                    .build();
                  this.cellSize = drawable.getSize();
                  this.colorOdd = drawable.getColorOdd();
                  this.colorEven = drawable.getColorEven();
                  this.hasPreview = true;
                  this.result = 'build(size=' + n + ',colorOdd,colorEven) → 构造成功\n' +
                    'size=' + this.cellSize + ' (纹理周期 ' + (this.cellSize * 2) + '×' + (this.cellSize * 2) + ')\n' +
                    'colorOdd=' + this.colorOdd + '\n' +
                    'colorEven=' + this.colorEven;
                } catch (e) {
                  this.result = 'build: error: ' + (e as Error).message;
                }
              })
              .margin({ bottom: 12 })

            // 预览区（渲染验证）
            Text('预览')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ bottom: 4 })

            Stack() {
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
                  .fontColor('#999999')
              }
            }
            .width('100%')
            .height(200)
            .backgroundColor('#FFFFFF')
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
