import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { InsLoadingView, InsLoadingController, InsStatus } from 'library';

@Entry
@Component
struct TestCaseF0505Page {
  private controller: InsLoadingController = new InsLoadingController();
  @State currentStatus: InsStatus = InsStatus.LOADING;
  @State result: string = '动画运行中｜点击切换到未点击，动画立即停止无残留';

  aboutToAppear(): void {
    this.controller.onStatusChange((status: InsStatus) => {
      this.currentStatus = status;
    });
  }

  private statusName(status: InsStatus): string {
    if (status === InsStatus.LOADING) {
      return 'LOADING(加载中)';
    } else if (status === InsStatus.CLICKED) {
      return 'CLICKED(已加载)';
    } else {
      return 'UNCLICKED(未点击)';
    }
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

        Text('F-05-05 动画运行中切换到非加载中状态时动画立即停止无残留')
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
            '1. 点击【动画驱动与可见性联动】进入模块列表页 [验证点: 进入动画驱动与可见性联动模块列表页]',
            '2. 点击【动画运行中切换到非加载中状态时动画立即停止无残留】进入用例详情页 [验证点: 进入用例详情页，组件处于加载中状态且动画正在运行]',
            '3. 点击【切换到未点击】按钮 [验证点: 状态从加载中切换到未点击]',
            '4. 立即观察【进度弧区域】的动画状态 [验证点: 动画立即停止，显示静态圆环，无残留帧刷新或闪烁]'
          ],
            expected_result: '动画运行中切换到未点击或已点击状态时，动画立即停止，显示对应静态圆环，无残留帧刷新或闪烁',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            // 状态切换按钮
            Row() {
              Button('切换到未点击')
                .id('btn_status_unclicked')
                .type(ButtonType.Capsule)
                .fontSize(12)
                .height(30)
                .layoutWeight(1)
                .margin({ left: 2, right: 2 })
                .backgroundColor('#FFE5E7EB')
                .fontColor('#FF1F2937')
                .onClick(() => {
                  this.controller.setStatus(InsStatus.UNCLICKED);
                  this.result = 'setStatus(UNCLICKED) → 动画立即停止，显示完整渐变静态圆环，无残留帧刷新或闪烁';
                })

              Button('切回加载中')
                .id('btn_status_loading')
                .type(ButtonType.Capsule)
                .fontSize(12)
                .height(30)
                .layoutWeight(1)
                .margin({ left: 2, right: 2 })
                .backgroundColor('#FFF700C2')
                .fontColor('#FFFFFFFF')
                .onClick(() => {
                  this.controller.setStatus(InsStatus.LOADING);
                  this.result = 'setStatus(LOADING) → 动画恢复运行';
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            // 渲染预览区：切换状态后观察动画立即停止
            Text('状态切换预览区（点击按钮后观察动画立即停止）')
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

            Text('当前状态：' + this.statusName(this.currentStatus))
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
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
