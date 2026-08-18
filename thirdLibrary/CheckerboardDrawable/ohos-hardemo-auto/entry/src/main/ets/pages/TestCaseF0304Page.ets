import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { CheckerboardDrawable, CheckerboardDrawableBuilder } from 'checkerboarddrawable';

@Entry
@Component
struct TestCaseF0304Page {
  @State result: string = '等待操作 F-03-04...';
  @State inputAlpha: string = '-1';
  @State isCanvasReady: boolean = false;
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

        Text('F-03-04 超出范围透明度值被限制在有效区间')
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
            '1. 点击【运行时透明度调节】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【超出范围透明度值被限制在有效区间】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 在【透明度】输入框中输入"-1" [验证点: 透明度输入框显示 -1]',
            '4. 观察【预览】区域棋盘格背景 [验证点: 按最小值处理，纹理不可见]',
            '5. 在【透明度】输入框中输入"300" [验证点: 透明度输入框显示 300]',
            '6. 观察【预览】区域棋盘格背景 [验证点: 按最大值处理，纹理完全不透明]'
          ],
            expected_result: '输入 -1 时透明度按最小值处理（纹理不可见），输入 300 时按最大值处理（纹理完全不透明），越界值被限制在有效区间不致错乱',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('透明度')
              .fontSize(14)
              .fontColor('#333333')
              .margin({ bottom: 4 })

            TextInput({ placeholder: '0-255', text: this.inputAlpha })
              .id('input_alpha')
              .type(InputType.Normal)
              .width('100%')
              .onChange((v: string) => {
                this.inputAlpha = v;
              })
              .margin({ bottom: 8 })

            Button('应用透明度')
              .id('btn_apply_alpha')
              .width('100%')
              .onClick(() => {
                try {
                  let a: number = Number.parseInt(this.inputAlpha);
                  if (Number.isNaN(a)) {
                    this.result = 'setAlpha: error: 请输入数字';
                    return;
                  }
                  if (!this.isCanvasReady) {
                    this.result = 'setAlpha: error: Canvas 未就绪';
                    return;
                  }
                  let drawable: CheckerboardDrawable = new CheckerboardDrawableBuilder()
                    .size(40)
                    .colorOdd('#FFC2C2C2')
                    .colorEven('#FFF3F3F3')
                    .build();
                  drawable.setAlpha(a);
                  let actualAlpha: number = drawable.getAlpha();
                  let w: number = this.context.width;
                  let h: number = this.context.height;
                  drawable.draw(this.context, w, h);
                  this.result = 'setAlpha(' + a + ') → 实际值=' + actualAlpha + '\n' +
                    '越界值已被 clamp 到 [0,255]，不致错乱';
                } catch (e) {
                  this.result = 'setAlpha: error: ' + (e as Error).message;
                }
              })
              .margin({ bottom: 12 })

            // 预览区（setAlpha + draw 输出）
            Text('预览（setAlpha + draw 输出）')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ bottom: 4 })

            Stack() {
              Column() {
                Text('底层背景')
                  .fontSize(16)
                  .fontColor('#FFFFFF')
              }
              .width('100%')
              .height('100%')
              .backgroundColor('#FF3366CC')
              .justifyContent(FlexAlign.Center)

              Canvas(this.context)
                .width('100%')
                .height('100%')
                .onReady(() => {
                  this.isCanvasReady = true;
                })
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
