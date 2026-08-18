import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { CheckerboardBackground, CheckerboardDrawable, CheckerboardDrawableBuilder } from 'checkerboarddrawable';

@Entry
@Component
struct TestCaseF0102Page {
  @State result: string = '等待操作 F-01-02...';
  @State inputSize: string = '20';
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

        Text('F-01-02 自定义格子尺寸生成对应尺寸纹理')
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
            '2. 点击【自定义格子尺寸生成对应尺寸纹理】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 在【格子尺寸】输入框中输入"20" [验证点: 输入框显示数值 20]',
            '4. 点击【生成棋盘格】按钮 [验证点: 预览区域呈现尺寸变化后的棋盘格]',
            '5. 观察【预览】区域呈现的棋盘格背景 [验证点: 格子变小、密度变高，纹理边长随尺寸变为 40×40]'
          ],
            expected_result: '预览区域棋盘格格子变小、密度变高，纹理边长随自定义尺寸变为 size×2，视觉变化正确',
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

            TextInput({ placeholder: '输入格子尺寸(如20)', text: this.inputSize })
              .id('input_size')
              .type(InputType.Normal)
              .width('100%')
              .onChange((v: string) => {
                this.inputSize = v;
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
                    .colorOdd(this.colorOdd)
                    .colorEven(this.colorEven)
                    .build();
                  let size: number = drawable.getSize();
                  this.cellSize = size;
                  this.hasPreview = true;
                  this.result = 'build(size=' + n + ') → 构造成功\n' +
                    'size=' + size + ' (纹理周期 ' + (size * 2) + '×' + (size * 2) + ')\n' +
                    'colorOdd=' + drawable.getColorOdd() + '\n' +
                    'colorEven=' + drawable.getColorEven();
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
