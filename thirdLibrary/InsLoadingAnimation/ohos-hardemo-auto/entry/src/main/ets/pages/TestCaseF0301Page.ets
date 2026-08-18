import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { InsLoadingView, InsLoadingController, InsStatus } from 'library';

@Entry
@Component
struct TestCaseF0301Page {
  private controller: InsLoadingController = new InsLoadingController();
  @State currentStatus: InsStatus = InsStatus.LOADING;
  @State result: string = '默认 status=LOADING｜渐变进度弧循环伸缩旋转，持续刷新';

  private statusName(s: InsStatus): string {
    if (s === InsStatus.LOADING) {
      return 'LOADING(加载中)';
    } else if (s === InsStatus.CLICKED) {
      return 'CLICKED(已加载)';
    }
    return 'UNCLICKED(未点击)';
  }

  aboutToAppear(): void {
    this.controller.onStatusChange((s: InsStatus) => {
      this.currentStatus = s;
    });
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

        Text('F-03-01 默认进入加载中状态时显示渐变进度弧并持续刷新')
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
            '1. 点击【三态切换与状态绘制分支】进入模块列表页 [验证点: 进入三态切换与状态绘制分支模块列表页]',
            '2. 点击【默认进入加载中状态时显示渐变进度弧并持续刷新】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 观察【组件状态】文本和【进度弧区域】的初始表现 [验证点: 默认状态为加载中]',
            '4. 等待 3 秒后继续观察【进度弧区域】 [验证点: 渐变进度弧循环伸缩旋转并持续刷新]'
          ],
            expected_result: '默认状态为加载中，显示渐变进度弧并循环伸缩旋转，持续刷新无停滞',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('组件状态：' + this.statusName(this.currentStatus))
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 8 })
              .id('txt_current_status')

            Button('获取当前状态')
              .id('btn_get_status')
              .type(ButtonType.Capsule)
              .fontSize(12)
              .height(30)
              .width('100%')
              .backgroundColor('#FFE5E7EB')
              .fontColor('#FF1F2937')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.result = 'getStatus() = ' + this.statusName(this.controller.getStatus()) + '｜进度弧持续刷新无停滞';
              })

            // 渲染预览区：InsLoadingView 自绘组件（默认加载中，渐变进度弧持续刷新）
            Text('进度弧预览区（默认加载中，渐变进度弧循环伸缩旋转）')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
              .id('txt_preview_label')
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
