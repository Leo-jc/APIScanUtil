import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { InsLoadingView, InsLoadingController, InsStatus } from 'library';

@Entry
@Component
struct TestCaseF0201Page {
  private controller: InsLoadingController = new InsLoadingController();
  @State currentStatus: InsStatus = InsStatus.LOADING;
  @State result: string = '默认状态：LOADING｜外圈渐变弧带循环伸缩（每周期反转方向）并整体匀速旋转，持续刷新';

  aboutToAppear(): void {
    this.controller.onStatusChange((s: InsStatus) => {
      this.currentStatus = s;
      this.result = '状态变化 → getStatus()=' + this.statusName(s);
    });
  }

  private statusName(s: InsStatus): string {
    if (s === InsStatus.LOADING) {
      return 'LOADING(加载中)';
    } else if (s === InsStatus.CLICKED) {
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

        Text('F-02-01 加载状态下头像外圈显示渐变色弧带并循环伸缩旋转')
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
            '1. 点击【外围渐变进度弧绘制】进入模块列表页 [验证点: 进入外围渐变进度弧绘制模块列表页]',
            '2. 点击【加载状态下头像外圈显示渐变色弧带并循环伸缩旋转】进入用例详情页 [验证点: 进入用例详情页，组件处于加载中状态]',
            '3. 观察【进度弧区域】的弧带动态表现 [验证点: 头像外圈可见渐变色弧带]',
            '4. 等待 5 秒后继续观察【进度弧区域】 [验证点: 弧带按减速节奏循环伸缩，每周期结束方向反转一次，同时整体匀速旋转]'
          ],
            expected_result: '加载中状态下头像外圈可见渐变色弧带，弧带按减速节奏循环伸缩（每周期结束方向反转一次）并整体匀速旋转',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('状态切换（观察弧带仅在 LOADING 态显示动画）')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
            Row() {
              Button('切换至未点击(静态环)')
                .id('btn_status_unclicked')
                .type(ButtonType.Capsule)
                .fontSize(12)
                .height(30)
                .layoutWeight(1)
                .margin({ left: 2, right: 2 })
                .backgroundColor(this.currentStatus === InsStatus.UNCLICKED ? '#FFF700C2' : '#FFE5E7EB')
                .fontColor(this.currentStatus === InsStatus.UNCLICKED ? '#FFFFFFFF' : '#FF1F2937')
                .onClick(() => {
                  this.controller.setStatus(InsStatus.UNCLICKED);
                })
              Button('切回加载中(动画弧)')
                .id('btn_status_loading')
                .type(ButtonType.Capsule)
                .fontSize(12)
                .height(30)
                .layoutWeight(1)
                .margin({ left: 2, right: 2 })
                .backgroundColor(this.currentStatus === InsStatus.LOADING ? '#FFF700C2' : '#FFE5E7EB')
                .fontColor(this.currentStatus === InsStatus.LOADING ? '#FFFFFFFF' : '#FF1F2937')
                .onClick(() => {
                  this.controller.setStatus(InsStatus.LOADING);
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            // 渲染预览区：InsLoadingView 自绘组件（LOADING 态渐变弧带循环伸缩+匀速旋转）
            Text('进度弧预览区（LOADING 默认：渐变弧带循环伸缩并整体匀速旋转）')
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
