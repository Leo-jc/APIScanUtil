import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { CheckerboardBackground, CheckerboardDrawable } from 'checkerboarddrawable';

@Entry
@Component
struct TestCaseF0101Page {
  @State result: string = '等待操作 F-01-01...';
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

        Text('F-01-01 默认配置生成标准棋盘格背景纹理')
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
            '2. 点击【默认配置生成标准棋盘格背景纹理】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 点击【使用默认配置】按钮 [验证点: 预览区域开始呈现棋盘格背景]',
            '4. 观察【预览】区域呈现的棋盘格背景 [验证点: 格子边长为 80×80、奇数格为浅灰、偶数格为更浅灰，无异常提示]'
          ],
            expected_result: '预览区域呈现标准棋盘格背景，格子边长为 80×80，奇数格为浅灰、偶数格为更浅灰，生成过程无异常提示',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('使用默认配置')
              .id('btn_use_default')
              .width('100%')
              .onClick(() => {
                try {
                  // 调用静态工厂 create()，等价默认 Builder().size(40).colorOdd(...).colorEven(...).build()
                  let drawable: CheckerboardDrawable = CheckerboardDrawable.create();
                  // 回读真实配置作为验证证据
                  let size: number = drawable.getSize();
                  let co: string = drawable.getColorOdd();
                  let ce: string = drawable.getColorEven();
                  // 同步到视觉组件渲染预览
                  this.cellSize = size;
                  this.colorOdd = co;
                  this.colorEven = ce;
                  this.hasPreview = true;
                  this.result = 'create() → 构造成功\n' +
                    'size=' + size + ' (纹理周期 ' + (size * 2) + '×' + (size * 2) + ')\n' +
                    'colorOdd=' + co + '\n' +
                    'colorEven=' + ce;
                } catch (e) {
                  this.result = 'create: error: ' + (e as Error).message;
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
                Text('点击「使用默认配置」生成预览')
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
