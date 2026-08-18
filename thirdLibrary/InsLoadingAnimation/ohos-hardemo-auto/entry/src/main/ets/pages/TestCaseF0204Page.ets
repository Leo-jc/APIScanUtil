import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { InsLoadingView, InsLoadingController, InsStatus } from 'library';

@Entry
@Component
struct TestCaseF0204Page {
  private controller: InsLoadingController = new InsLoadingController();
  @State currentStatus: InsStatus = InsStatus.LOADING;
  @State result: string = 'LOADING 态：弧带周期伸缩，经过0°(最短)与360°(最长)极限，绘制正确无异常';

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

        Text('F-02-04 进度弧伸缩至极限角度时的弧带绘制表现')
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
            '1. 点击【外围渐变进度弧绘制】进入模块列表页 [验证点: 进入外围渐变进度弧绘制模块列表页]',
            '2. 点击【进度弧伸缩至极限角度时的弧带绘制表现】进入用例详情页 [验证点: 进入用例详情页，组件处于加载中状态]',
            '3. 等待进度弧伸缩至最短状态（接近 0°） [验证点: 弧带处于最短状态]',
            '4. 观察【进度弧区域】弧带在最短状态下的绘制表现 [验证点: 弧带在极限角度下绘制行为正确]',
            '5. 等待进度弧伸缩至最长状态（接近 360°） [验证点: 弧带处于最长状态]',
            '6. 观察【进度弧区域】弧带在最长状态下的绘制表现 [验证点: 弧带在极限角度下绘制行为正确]'
          ],
            expected_result: '进度角度为 0° 或 360° 时弧带绘制行为正确，无视觉异常（如闪烁、断裂、越界绘制）',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('状态切换对比（LOADING 循环经过极限角度 vs UNCLICKED 完整圆环 360° 极致）')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
            Row() {
              Button('加载中-观察极限角度')
                .id('btn_status_loading')
                .type(ButtonType.Capsule)
                .fontSize(12)
                .height(30)
                .layoutWeight(1)
                .margin({ left: 2, right: 2 })
                .backgroundColor(this.currentStatus === InsStatus.LOADING ? '#FFF700C2' : '#FFE5E7EB')
                .fontColor(this.currentStatus === InsStatus.LOADING ? '#FFFFFFFF' : '#FF1F2937')
                .onClick(() => {
                  this.currentStatus = InsStatus.LOADING;
                  this.controller.setStatus(InsStatus.LOADING);
                  this.result = 'LOADING 态：弧带周期伸缩，经过0°(最短)与360°(最长)极限，绘制正确无异常';
                })
              Button('未点击-完整圆环(360°极致)')
                .id('btn_status_unclicked')
                .type(ButtonType.Capsule)
                .fontSize(12)
                .height(30)
                .layoutWeight(1)
                .margin({ left: 2, right: 2 })
                .backgroundColor(this.currentStatus === InsStatus.UNCLICKED ? '#FFF700C2' : '#FFE5E7EB')
                .fontColor(this.currentStatus === InsStatus.UNCLICKED ? '#FFFFFFFF' : '#FF1F2937')
                .onClick(() => {
                  this.currentStatus = InsStatus.UNCLICKED;
                  this.controller.setStatus(InsStatus.UNCLICKED);
                  this.result = 'UNCLICKED 态：完整圆环（360° 极致静态形态），绘制正确无闪烁/断裂/越界';
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Text('说明：LOADING 下弧带周期伸缩经过接近 0°(最短)与接近 360°(最长)，绘制行为正确无闪烁/断裂/越界；UNCLICKED 完整圆环为 360° 极致静态形态')
              .fontSize(12)
              .fontColor('#FF666666')
              .width('100%')
              .margin({ bottom: 8 })

            // 渲染预览区：InsLoadingView 自绘组件（LOADING 态弧带循环伸缩经过极限角度）
            Text('进度弧预览区（LOADING 态：弧带周期伸缩经过 0° 与 360° 极限角度）')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
            Stack({ alignContent: Alignment.Center }) {
              InsLoadingView({
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
