import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { CheckerboardDrawable } from 'checkerboarddrawable';

@Entry
@Component
struct TestCaseF0201Page {
  @State result: string = '等待操作 F-02-01...';
  @State hasDrawn: boolean = false;
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

        Text('F-02-01 宿主背景区域被棋盘格纹理完整平铺填充')
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
            '1. 点击【背景绘制输出】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【宿主背景区域被棋盘格纹理完整平铺填充】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 点击【使用默认配置】按钮 [验证点: 预览区域开始呈现棋盘格背景]',
            '4. 观察【预览】区域整体背景 [验证点: 整体被棋盘格纹理完整平铺填充，无空白、无错位、无接缝]'
          ],
            expected_result: '预览区域整体被棋盘格纹理完整平铺填充，纹理重复平铺铺满，无空白、无错位、无接缝',
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
                let drawable: CheckerboardDrawable = CheckerboardDrawable.create();
                let w: number = this.context.width;
                let h: number = this.context.height;
                drawable.draw(this.context, w, h);
                this.hasDrawn = true;
                this.result = 'draw(ctx, ' + w + ', ' + h + ') → 已绘制\n' +
                  'size=' + drawable.getSize() + ' (纹理周期 ' + (drawable.getSize() * 2) + '×' + (drawable.getSize() * 2) + ')\n' +
                  '区域被完整平铺填充';
              })
              .margin({ bottom: 12 })

            // 预览区（draw 输出）
            Text('预览（draw 输出）')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ bottom: 4 })

            Canvas(this.context)
              .width('100%')
              .height(260)
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
