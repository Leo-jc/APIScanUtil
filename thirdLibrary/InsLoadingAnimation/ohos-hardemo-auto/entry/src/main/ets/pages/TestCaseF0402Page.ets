import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { InsLoadingView, InsLoadingController, InsStatus } from 'library';

@Entry
@Component
struct TestCaseF0402Page {
  private controller: InsLoadingController = new InsLoadingController();
  @State result: string = 'LOADING 态运行中｜按下后头像与进度弧同步缩放重绘，由组件内置实现';

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

        Text('F-04-02 缩放过程中头像与进度弧实时同步重绘')
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
            '1. 点击【触摸按下缩放反馈】进入模块列表页 [验证点: 进入触摸按下缩放反馈模块列表页]',
            '2. 点击【缩放过程中头像与进度弧实时同步重绘】进入用例详情页 [验证点: 进入用例详情页，组件处于加载中状态且进度弧正在运行]',
            '3. 在【头像组件】区域按下手指并保持 [验证点: 组件开始缩放]',
            '4. 观察缩放过程中【头像底图】和【进度弧】的同步表现 [验证点: 头像底图与进度弧同步缩放，无错位、无撕裂]',
            '5. 缓慢移动手指观察缩放过程中的实时重绘 [验证点: 缩放过程实时重绘，画面流畅无撕裂]'
          ],
            expected_result: '缩放过程中头像底图与进度弧同步缩放，无错位、无撕裂，缩放变换作用于整体绘制',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            // 渲染预览区：InsLoadingView 自绘组件（LOADING 态进度弧运行，按下同步缩放）
            Text('头像预览区（LOADING 态进度弧运行中）')
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

            Text('LOADING 态进度弧运行中。按下并保持→头像底图与进度弧同步缩放，无错位无撕裂；移动手指实时重绘。缩放变换作用于整体绘制')
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
                this.result = 'LOADING 态进度弧运行中｜按下后头像底图与进度弧同步缩放重绘，缩放变换作用于整体绘制（由组件内置 onTouch + animateTo 实现）';
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
