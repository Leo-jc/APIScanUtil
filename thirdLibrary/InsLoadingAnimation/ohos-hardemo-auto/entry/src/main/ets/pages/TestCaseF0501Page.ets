import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { InsLoadingView, InsLoadingController, InsStatus } from 'library';

@Entry
@Component
struct TestCaseF0501Page {
  private controller: InsLoadingController = new InsLoadingController();
  private scroller: Scroller = new Scroller();
  @State result: string = '组件可见且 LOADING｜进度弧与旋转动画持续运行。点击下方按钮模拟滚出/滚回视图';

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

        Text('F-05-01 组件可见且加载中状态时动画持续运行且不可见时停止')
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
            '1. 点击【动画驱动与可见性联动】进入模块列表页 [验证点: 进入动画驱动与可见性联动模块列表页]',
            '2. 点击【组件可见且加载中状态时动画持续运行且不可见时停止】进入用例详情页 [验证点: 进入用例详情页，组件可见且处于加载中状态]',
            '3. 观察【进度弧区域】动画运行情况 [验证点: 进度弧与旋转动画持续运行]',
            '4. 向下滑动屏幕使组件滚出可视区域 [验证点: 组件不再可见]',
            '5. 等待 3 秒 [验证点: 组件处于不可见状态]',
            '6. 向上滑动屏幕使组件重新进入可视区域 [验证点: 组件重新可见]',
            '7. 观察【进度弧区域】动画恢复情况 [验证点: 动画恢复运行]'
          ],
            expected_result: '可见且加载中状态时进度弧与旋转动画持续运行，不可见时动画停止以节省功耗，重新可见时恢复运行',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            // 可见性联动滚动预览区：组件在顶部，下方高占位使其能滚出视图
            Text('可见性联动预览区（组件在顶部，滚出视图即停止动画）')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
            List({ space: 0, scroller: this.scroller }) {
              ListItem() {
                Stack({ alignContent: Alignment.Center }) {
                  InsLoadingView({
                    imageSrc: 'common/images/pink.jpg',
                    status: InsStatus.LOADING,
                    sideLength: 200,
                    controller: this.controller,
                  })
                }
                .width(220)
                .height(220)
                .backgroundColor('#FFF3F4F6')
                .borderRadius(12)
              }
              ListItem() {
                Column()
                  .width('100%')
                  .height(600)
                  .backgroundColor('#FFFFFFFF')
              }
              .width('100%')
            }
            .width('100%')
            .height(280)
            .backgroundColor('#FFF9FAFB')
            .borderRadius(8)
            .scrollBar(BarState.Auto)
            .margin({ bottom: 8 })

            // 滚动控制按钮
            Row() {
              Button('滚动隐藏组件')
                .id('btn_scroll_hide')
                .type(ButtonType.Capsule)
                .fontSize(12)
                .height(30)
                .layoutWeight(1)
                .margin({ left: 2, right: 2 })
                .backgroundColor('#FFE5E7EB')
                .fontColor('#FF1F2937')
                .onClick(() => {
                  this.scroller.scrollEdge(Edge.Bottom);
                  this.result = '组件已滚出可视区域｜onVisibleAreaChange 触发，动画停止以节省功耗';
                })

              Button('滚动显示组件')
                .id('btn_scroll_show')
                .type(ButtonType.Capsule)
                .fontSize(12)
                .height(30)
                .layoutWeight(1)
                .margin({ left: 2, right: 2 })
                .backgroundColor('#FFF700C2')
                .fontColor('#FFFFFFFF')
                .onClick(() => {
                  this.scroller.scrollEdge(Edge.Top);
                  this.result = '组件重新可见｜动画恢复运行，从当前角度继续';
                })
            }
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
