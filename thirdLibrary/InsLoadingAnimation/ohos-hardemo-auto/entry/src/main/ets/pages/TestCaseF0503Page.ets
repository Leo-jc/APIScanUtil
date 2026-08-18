import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { InsLoadingView, InsLoadingController, InsStatus } from 'library';

@Entry
@Component
struct TestCaseF0503Page {
  private controller: InsLoadingController = new InsLoadingController();
  @State inputCircleDuration: string = '5000';
  @State circleDuration: number = 2000;
  @State result: string = '当前进度弧时长：2000ms｜输入新值并确认后弧带伸缩节奏变化';

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

        Text('F-05-03 运行态修改进度弧时长后动画按新时长运行')
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
            '1. 点击【动画驱动与可见性联动】进入模块列表页 [验证点: 进入动画驱动与可见性联动模块列表页]',
            '2. 点击【运行态修改进度弧时长后动画按新时长运行】进入用例详情页 [验证点: 进入用例详情页，组件处于加载中状态且进度弧正在运行]',
            '3. 在【进度弧时长】输入框中输入5000 [验证点: 进度弧时长已修改为 5000ms]',
            '4. 点击【确认】按钮 [验证点: 时长修改已生效]',
            '5. 观察【进度弧区域】弧带伸缩周期变化 [验证点: 弧带伸缩周期明显变慢，按 5000ms 周期运行]'
          ],
            expected_result: '运行态修改进度弧动画时长后，弧带伸缩周期按新时长运行，伸缩节奏明显变化',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            // 进度弧时长输入（setCircleDuration）
            Text('进度弧时长（setCircleDuration）')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
            Row() {
              TextInput({ placeholder: '输入进度弧时长(ms)', text: this.inputCircleDuration })
                .id('input_circle_duration')
                .type(InputType.Normal)
                .layoutWeight(1)
                .margin({ right: 8 })
                .onChange((v: string) => {
                  this.inputCircleDuration = v;
                })

              Button('确认')
                .id('btn_circle_duration_confirm')
                .type(ButtonType.Capsule)
                .fontSize(12)
                .height(36)
                .width(80)
                .backgroundColor('#FFF700C2')
                .fontColor('#FFFFFFFF')
                .onClick(() => {
                  let d: number = Number.parseInt(this.inputCircleDuration);
                  if (Number.isNaN(d) || d <= 0) {
                    this.result = 'setCircleDuration(' + this.inputCircleDuration + ') → error: 请输入正整数';
                    return;
                  }
                  this.circleDuration = d;
                  this.controller.setCircleDuration(d);
                  this.result = 'setCircleDuration(' + d + ') → 进度弧伸缩周期按 ' + d + 'ms 运行，节奏明显变慢';
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            // 渲染预览区：运行态修改 circleDuration 后弧带伸缩节奏变化
            Text('进度弧预览区（运行态修改时长后弧带伸缩节奏变化）')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
            Stack({ alignContent: Alignment.Center }) {
              InsLoadingView({
                imageSrc: 'common/images/pink.jpg',
                status: InsStatus.LOADING,
                circleDuration: this.circleDuration,
                sideLength: 220,
                controller: this.controller,
              })
            }
            .width(240)
            .height(240)
            .backgroundColor('#FFF3F4F6')
            .borderRadius(12)
            .margin({ bottom: 8 })
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
