import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { InsLoadingView, InsLoadingController, InsStatus } from 'library';

@Entry
@Component
struct TestCaseF0202Page {
  private controller: InsLoadingController = new InsLoadingController();
  @State currentStatus: InsStatus = InsStatus.LOADING;
  @State result: string = 'LOADING 态：弧带多段拼接，头部粗尾部渐细，颜色 #FFF700C2→#FFFFD900 线性渐变（动态观察）';

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

        Text('F-02-02 弧带呈现头部粗尾部渐细的拖尾渐变效果')
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
            '2. 点击【弧带呈现头部粗尾部渐细的拖尾渐变效果】进入用例详情页 [验证点: 进入用例详情页，组件处于加载中状态且进度弧正在运行]',
            '3. 暂停动画并截取当前帧 [验证点: 弧带静态形态可清晰观察]',
            '4. 观察【进度弧区域】弧带的形状与颜色分布 [验证点: 弧带头部粗、尾部渐细，颜色由起始色到结束色线性渐变]'
          ],
            expected_result: '弧带由多段拼接形成头部粗、尾部渐细的拖尾效果，颜色由起始色到结束色线性渐变',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('状态切换对比（LOADING 动态拖尾弧 vs UNCLICKED 完整渐变静态环）')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
            Row() {
              Button('加载中-动态拖尾弧')
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
                  this.result = 'LOADING 态：弧带多段拼接，头部粗尾部渐细，颜色 #FFF700C2→#FFFFD900 线性渐变（动态观察）';
                })
              Button('未点击-完整渐变环')
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
                  this.result = 'UNCLICKED 态：完整渐变静态圆环（360° 整圈），颜色 #FFF700C2→#FFFFD900 渐变，用于对比拖尾形态';
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Text('说明：弧带由多段拼接形成头部粗、尾部渐细，颜色由起始色到结束色线性渐变；LOADING 下可见动态拖尾形态')
              .fontSize(12)
              .fontColor('#FF666666')
              .width('100%')
              .margin({ bottom: 8 })

            // 渲染预览区：InsLoadingView 自绘组件（LOADING 态动态拖尾弧带）
            Text('进度弧预览区（LOADING 态：动态拖尾弧带，头部粗尾部渐细）')
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
