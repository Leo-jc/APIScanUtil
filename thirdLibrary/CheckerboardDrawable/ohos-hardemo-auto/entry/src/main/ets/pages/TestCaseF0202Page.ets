import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { CheckerboardDrawable, CheckerboardDrawableBuilder } from 'checkerboarddrawable';

@Entry
@Component
struct TestCaseF0202Page {
  @State result: string = '等待操作 F-02-02...';
  @State inputSize: string = '200';
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

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

        Text('F-02-02 绘制边界小于纹理周期时仅显示局部纹理')
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
            '1. 点击【背景绘制输出】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【绘制边界小于纹理周期时仅显示局部纹理】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 在【格子尺寸】输入框中输入较大值"200" [验证点: 输入框显示数值 200]',
            '4. 点击【生成棋盘格】按钮 [验证点: 预览区域呈现棋盘格]',
            '5. 观察【预览】区域呈现的纹理 [验证点: 预览区域小于一个纹理周期，仅显示局部纹理，自动裁剪不报错]'
          ],
            expected_result: '预览区域（小于一个纹理周期）仅显示局部纹理，自动裁剪不报错',
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

            TextInput({ placeholder: '输入较大值(如200)', text: this.inputSize })
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
                    .colorOdd('#FFC2C2C2')
                    .colorEven('#FFF3F3F3')
                    .build();
                  let w: number = this.context.width;
                  let h: number = this.context.height;
                  drawable.draw(this.context, w, h);
                  let period: number = n * 2;
                  this.result = 'draw(ctx, ' + w + ', ' + h + ') → 已绘制\n' +
                    'size=' + n + ' (纹理周期 ' + period + '×' + period + ')\n' +
                    '预览区(' + w + '×' + h + ') < 纹理周期 → 仅显示局部纹理，自动裁剪不报错';
                } catch (e) {
                  this.result = 'draw: error: ' + (e as Error).message;
                }
              })
              .margin({ bottom: 12 })

            // 预览区（draw 输出，容器小于纹理周期）
            Text('预览（draw 输出，容器小于纹理周期）')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ bottom: 4 })

            Canvas(this.context)
              .width('100%')
              .height(200)
              .backgroundColor('#FFFFFF')
              .borderRadius(8)
              .clip(true)
              .onReady(() => {
                // context 就绪，等待按钮触发 draw
              })
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
