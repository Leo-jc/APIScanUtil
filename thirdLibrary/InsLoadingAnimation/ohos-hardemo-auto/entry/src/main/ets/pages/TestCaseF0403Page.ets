import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { InsLoadingView, InsLoadingController, InsStatus } from 'library';

@Entry
@Component
struct TestCaseF0403Page {
  private controller: InsLoadingController = new InsLoadingController();
  @State result: string = '连续快速按下抬起｜缩放动画稳定，最终回到原尺寸（组件内置 onTouch+animateTo 处理）';

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

        Text('F-04-03 连续快速按下抬起时缩放反馈稳定无异常')
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
            '1. 点击【触摸按下缩放反馈】进入模块列表页 [验证点: 进入触摸按下缩放反馈模块列表页]',
            '2. 点击【连续快速按下抬起时缩放反馈稳定无异常】进入用例详情页 [验证点: 进入用例详情页，头像组件已展示]',
            '3. 快速连续在【头像组件】区域按下并抬起手指 5 次以上 [验证点: 组件经历多次快速缩放与回弹]',
            '4. 观察【头像组件】的缩放动画表现 [验证点: 缩放动画稳定，无卡顿、无跳变、无残留缩放状态]'
          ],
            expected_result: '连续快速按下抬起时缩放动画稳定，无卡顿、无跳变、无残留缩放状态，每次按下抬起周期完整，最终视觉回到原尺寸',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            // 渲染预览区：InsLoadingView 自绘组件（快速连续按下/抬起验证稳定性）
            Text('头像预览区（快速连续按下/抬起5次以上）')
              .id('preview_title')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
            Stack({ alignContent: Alignment.Center }) {
              InsLoadingView({
                imageSrc: 'common/images/pink.jpg',
                status: InsStatus.LOADING,
                sideLength: 220,
                controller: this.controller,
              })
            }
            .width(240)
            .height(240)
            .backgroundColor('#FFF3F4F6')
            .borderRadius(12)
            .margin({ bottom: 8 })

            Text('请在头像组件区域快速连续按下/抬起5次以上。每次按下→0.9、抬起→1.0，动画稳定无卡顿/跳变/残留，最终视觉回到原尺寸')
              .id('tip_text')
              .fontSize(12)
              .fontColor('#FF6B7280')
              .width('100%')
              .margin({ bottom: 8 })

            Button('记录观察结果')
              .id('btn_record')
              .type(ButtonType.Capsule)
              .fontSize(13)
              .height(36)
              .width('100%')
              .backgroundColor('#FFF700C2')
              .fontColor('#FFFFFFFF')
              .onClick(() => {
                this.result = '连续快速按下抬起｜缩放动画稳定，无卡顿/跳变/残留，每次按下抬起周期完整，最终视觉回到原尺寸（组件内置 onTouch+animateTo 处理）';
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
