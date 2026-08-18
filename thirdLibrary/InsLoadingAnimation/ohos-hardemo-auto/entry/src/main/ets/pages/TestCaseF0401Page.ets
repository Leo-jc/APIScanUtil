import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { InsLoadingView, InsLoadingController, InsStatus } from 'library';

@Entry
@Component
struct TestCaseF0401Page {
  private controller: InsLoadingController = new InsLoadingController();
  @State currentStatus: InsStatus = InsStatus.LOADING;
  @State result: string = '请在头像组件区域按下/抬起｜按下缩放0.9、抬起回弹1.0（约200ms减速），由组件内置 onTouch 处理';

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

        Text('F-04-01 按下时组件以中心为锚点缩放至0.9并抬起回弹')
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
            '1. 点击【触摸按下缩放反馈】进入模块列表页 [验证点: 进入触摸按下缩放反馈模块列表页]',
            '2. 点击【按下时组件以中心为锚点缩放至0.9并抬起回弹】进入用例详情页 [验证点: 进入用例详情页，头像组件已展示]',
            '3. 在【头像组件】区域按下手指并保持 [验证点: 组件以中心为锚点缩放至 0.9（约 200ms 减速）]',
            '4. 抬起手指 [验证点: 组件回弹至 1.0（约 200ms 减速），视觉回到原尺寸]'
          ],
            expected_result: '按下时组件以中心为锚点缩放至 0.9（约 200ms 减速动画），抬起时回弹至 1.0，一次完整按下—抬起周期后视觉回到原尺寸',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            // 渲染预览区：InsLoadingView 自绘组件（内置 onTouch 按下缩放/抬起回弹）
            Text('头像预览区（组件内置 onTouch：按下0.9、抬起1.0，约200ms减速）')
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

            Text('请在下方头像组件区域按下并保持→抬起，观察0.9缩放与回弹（约200ms减速）。触摸反馈由组件内置 onTouch 实现，无需外部调用')
              .id('tip_text')
              .fontSize(12)
              .fontColor('#FF6B7280')
              .width('100%')
              .margin({ bottom: 8 })

            Text(`当前状态：${this.statusName(this.currentStatus)}`)
              .id('status_text')
              .fontSize(13)
              .fontColor('#FF1F2937')
              .width('100%')
              .margin({ bottom: 8 })

            Button('切换状态(LOADING/UNCLICKED)')
              .id('btn_toggle_status')
              .type(ButtonType.Capsule)
              .fontSize(13)
              .height(36)
              .width('100%')
              .backgroundColor('#FFF700C2')
              .fontColor('#FFFFFFFF')
              .onClick(() => {
                const next: InsStatus = this.currentStatus === InsStatus.LOADING
                  ? InsStatus.UNCLICKED : InsStatus.LOADING;
                this.controller.setStatus(next);
                this.result = `setStatus(${this.statusName(next)}) → 用于辅助观察该状态下的按下/抬起缩放反馈\n内置 onTouch：按下→0.9、抬起→1.0（约200ms减速）`;
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
