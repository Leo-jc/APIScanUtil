import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { InsLoadingView, InsLoadingController, InsStatus } from 'library';

@Entry
@Component
struct TestCaseF0302Page {
  private controller: InsLoadingController = new InsLoadingController();
  @State currentStatus: InsStatus = InsStatus.LOADING;
  @State result: string = '当前状态：LOADING｜点击按钮切换至未点击';

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

        Text('F-03-02 切换到未点击状态时停止动画并绘制完整渐变静态圆环')
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
            '2. 点击【切换到未点击状态时停止动画并绘制完整渐变静态圆环】进入用例详情页 [验证点: 进入用例详情页，组件当前处于加载中状态]',
            '3. 点击【切换到未点击】按钮 [验证点: 状态切换为未点击]',
            '4. 观察【进度弧区域】的静态圆环表现 [验证点: 动画停止，显示完整渐变静态圆环]'
          ],
            expected_result: '切换到未点击状态后动画停止，显示一条完整的渐变静态圆环，无动画刷新',
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

            Button('切换到未点击')
              .id('btn_set_unclicked')
              .type(ButtonType.Capsule)
              .fontSize(12)
              .height(30)
              .width('100%')
              .backgroundColor('#FFE5E7EB')
              .fontColor('#FF1F2937')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.controller.setStatus(InsStatus.UNCLICKED);
                this.result = 'setStatus(UNCLICKED) → getStatus()=' + this.statusName(this.controller.getStatus()) + '\n动画停止，显示完整渐变静态圆环';
              })

            // 渲染预览区：InsLoadingView 自绘组件（初始加载中，切换至未点击后显示完整渐变静态圆环）
            Text('进度弧预览区（初始加载中，切换后为完整渐变静态圆环）')
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
