import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { CheckerboardDrawable, CheckerboardDrawableBuilder, SimpleColorFilter } from 'checkerboarddrawable';

@Entry
@Component
struct TestCaseF0401Page {
  @State result: string = '等待操作 F-04-01...';
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

        Text('F-04-01 应用颜色滤镜后棋盘格纹理按滤镜变换呈现')
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
            '1. 点击【运行时颜色滤镜调节】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【应用颜色滤镜后棋盘格纹理按滤镜变换呈现】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 点击【应用滤镜】按钮 [验证点: 滤镜被应用到棋盘格纹理]',
            '4. 观察【预览】区域棋盘格背景色调 [验证点: 纹理按滤镜变换呈现（如整体偏色/去色/反相）]'
          ],
            expected_result: '预览区域棋盘格纹理按滤镜变换呈现（如整体偏色/去色/反相）',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('应用滤镜')
              .id('btn_apply_filter')
              .width('100%')
              .onClick(() => {
                if (!this.isCanvasReady) {
                  this.result = 'setColorFilter: error: Canvas 未就绪';
                  return;
                }
                let drawable: CheckerboardDrawable = new CheckerboardDrawableBuilder()
                  .size(40)
                  .colorOdd('#FFC2C2C2')
                  .colorEven('#FFF3F3F3')
                  .build();
                let cf: SimpleColorFilter = new SimpleColorFilter('invert(1)');
                drawable.setColorFilter(cf);
                let w: number = this.context.width;
                let h: number = this.context.height;
                drawable.draw(this.context, w, h);
                let current = drawable.getColorFilter();
                this.result = 'setColorFilter(invert(1)) → 已应用\n' +
                  'currentFilter=' + (current !== null ? current.toFilterString() : 'null') + '\n' +
                  '纹理按反相滤镜变换呈现（奇偶格色反转）';
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
