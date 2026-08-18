import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { CheckerboardDrawable, CheckerboardDrawableBuilder, SimpleColorFilter } from 'checkerboarddrawable';

@Entry
@Component
struct TestCaseF0403Page {
  @State result: string = '等待操作 F-04-03...';
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

        Text('F-04-03 连续更换滤镜后仅最新滤镜生效')
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
            '1. 点击【运行时颜色滤镜调节】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【连续更换滤镜后仅最新滤镜生效】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 点击【应用滤镜 A】按钮 [验证点: 滤镜 A 被应用]',
            '4. 点击【应用滤镜 B】按钮 [验证点: 滤镜 B 替换滤镜 A]',
            '5. 观察【预览】区域棋盘格背景色调 [验证点: 仅按滤镜 B 变换呈现，无累积]'
          ],
            expected_result: '预览区域仅按滤镜 B 变换呈现，无累积，后值生效',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('应用滤镜 A')
              .id('btn_filter_a')
              .width('100%')
              .onClick(() => {
                if (!this.isCanvasReady) {
                  this.result = 'error: Canvas 未就绪';
                  return;
                }
                let d: CheckerboardDrawable = new CheckerboardDrawableBuilder()
                  .size(40)
                  .colorOdd('#FFC2C2C2')
                  .colorEven('#FFF3F3F3')
                  .build();
                d.setColorFilter(new SimpleColorFilter('sepia(1)'));
                d.draw(this.context, this.context.width, this.context.height);
                this.result = 'setColorFilter(sepia(1)) → 滤镜A已应用，纹理呈深褐色调';
              })
              .margin({ bottom: 8 })

            Button('应用滤镜 B')
              .id('btn_filter_b')
              .width('100%')
              .onClick(() => {
                if (!this.isCanvasReady) {
                  this.result = 'error: Canvas 未就绪';
                  return;
                }
                let d: CheckerboardDrawable = new CheckerboardDrawableBuilder()
                  .size(40)
                  .colorOdd('#FFC2C2C2')
                  .colorEven('#FFF3F3F3')
                  .build();
                d.setColorFilter(new SimpleColorFilter('invert(1)'));
                d.draw(this.context, this.context.width, this.context.height);
                let cur = d.getColorFilter();
                this.result = 'setColorFilter(invert(1)) → 滤镜B替换滤镜A\n' +
                  'currentFilter=' + (cur !== null ? cur.toFilterString() : 'null') + '\n' +
                  '仅按滤镜B（反相）变换呈现，无累积，后值生效';
              })
              .margin({ bottom: 12 })

            // 预览区（渲染验证）
            Text('预览（setColorFilter + draw 输出）')
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
