import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { CheckerboardDrawableBuilder } from 'checkerboarddrawable';

@Entry
@Component
struct TestCaseF0107Page {
  @State result: string = '等待操作 F-01-07...';
  @State inputSize: string = '0';

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

        Text('F-01-07 格子尺寸为零或负值时生成失败')
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
            '2. 点击【格子尺寸为零或负值时生成失败】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 在【格子尺寸】输入框中输入"0" [验证点: 输入框显示数值 0]',
            '4. 点击【生成棋盘格】按钮 [验证点: 触发非法尺寸处理]',
            '5. 观察【提示】文本区域显示 [验证点: 提示区域显示错误信息，未生成空纹理]'
          ],
            expected_result: '尺寸为零或负值时提示错误信息，未静默生成空纹理（以实际错误提示为准）',
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

            TextInput({ placeholder: '输入0或负值', text: this.inputSize })
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
                  let drawable = new CheckerboardDrawableBuilder().size(n).build();
                  this.result = 'build(size=' + n + ') → ⚠️ 未抛错（与预期不符，size<=0 应失败）';
                } catch (e) {
                  this.result = 'build(size=' + this.inputSize + ') → error: ' + (e as Error).message +
                    '\n✓ 非法尺寸构造失败，未生成空纹理';
                }
              })
              .margin({ bottom: 12 })

            // 预览区：构造失败，无纹理可渲染
            Text('预览')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ bottom: 4 })

            Column() {
              Text('非法尺寸不会生成纹理')
                .fontSize(12)
                .fontColor('#999999')
            }
            .width('100%')
            .height(120)
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
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
