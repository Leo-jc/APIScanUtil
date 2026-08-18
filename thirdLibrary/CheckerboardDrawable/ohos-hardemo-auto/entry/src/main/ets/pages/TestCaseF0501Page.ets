import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { CheckerboardDrawable, CheckerboardDrawableBuilder } from 'checkerboarddrawable';

@Entry
@Component
struct TestCaseF0501Page {
  @State result: string = '等待操作 F-05-01...';
  @State inputAlpha: string = '128';
  @State opacityResult: string = '';

  aboutToAppear(): void {
    let d: CheckerboardDrawable = CheckerboardDrawable.create();
    this.opacityResult = 'getOpacity() = ' + d.getOpacity() + ' (PixelFormat.OPAQUE, 恒为不透明契约值)';
    this.result = this.opacityResult;
  }

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

        Text('F-05-01 查询透明度元信息结果恒为不透明契约值')
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
            '1. 点击【透明度元信息查询】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【查询透明度元信息结果恒为不透明契约值】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 观察【元信息】文本区域显示 [验证点: 元信息文本显示不透明契约值]',
            '4. 在【透明度】输入框中输入不同数值 [验证点: 透明度被改变]',
            '5. 再次观察【元信息】文本区域显示 [验证点: 元信息文本仍显示不透明契约值，不随透明度变化]'
          ],
            expected_result: '元信息文本恒显示不透明契约值，且不随透明度调节而改变',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('元信息')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ bottom: 4 })

            Text(this.opacityResult)
              .id('txt_opacity')
              .fontSize(13)
              .fontColor('#333333')
              .width('100%')
              .margin({ bottom: 12 })
              .backgroundColor('#F5F5F5')
              .borderRadius(6)
              .padding(8)

            Text('透明度')
              .fontSize(14)
              .margin({ bottom: 4 })

            TextInput({ placeholder: '输入透明度(如128)', text: this.inputAlpha })
              .id('input_alpha')
              .type(InputType.Normal)
              .onChange((v: string) => {
                this.inputAlpha = v;
              })
              .width('100%')
              .margin({ bottom: 8 })

            Button('设置透明度并重新查询')
              .id('btn_set_alpha')
              .width('100%')
              .onClick(() => {
                try {
                  let a: number = Number.parseInt(this.inputAlpha);
                  if (Number.isNaN(a)) {
                    this.result = 'error: 请输入数字';
                    return;
                  }
                  let d: CheckerboardDrawable = new CheckerboardDrawableBuilder()
                    .size(40)
                    .colorOdd('#FFC2C2C2')
                    .colorEven('#FFF3F3F3')
                    .build();
                  d.setAlpha(a);
                  let alpha: number = d.getAlpha();
                  let opacity: number = d.getOpacity();
                  this.opacityResult = 'getOpacity() = ' + opacity + ' (PixelFormat.OPAQUE, 恒为不透明契约值)';
                  this.result = 'setAlpha(' + a + ') → getAlpha()=' + alpha + '\n' +
                    'getOpacity()=' + opacity + ' (不随透明度变化，恒为 OPAQUE 契约值)';
                } catch (e) {
                  this.result = 'error: ' + (e as Error).message;
                }
              })
              .margin({ bottom: 12 })
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
