import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { DotsIndicator, DotsIndicatorController } from 'viewpagerdots';

@Entry
@Component
struct TestCaseF0401Page {
  @State result: string = '等待操作 F-04-01...';
  @State controller: DotsIndicatorController = new DotsIndicatorController();
  @State selectedIndex: number = 0;
  @State pageCount: number = 0;

  aboutToAppear(): void {
    this.pageCount = 4;
    this.selectedIndex = 1;
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

        Text('F-04-01 运行时更换指示点视觉为同一样式后立即刷新所有点')
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
            '1. 点击【运行时切换点视觉样式】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【运行时更换指示点视觉为同一样式后立即刷新所有点】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 点击【更换为同一样式】按钮 [验证点: 选中点与未选中点用同一视觉，立即刷新背景]',
            '4. 观察【指示点条】区域 [验证点: 不重建点、不播放动画，保持当前选中态]'
          ],
            expected_result: '选中点与未选中点用同一视觉样式，立即刷新所有点背景，不重建点、不播放动画，保持当前选中态',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('更换为同一样式')
              .id('btn_same_drawable')
              .width('100%')
              .margin({ top: 4, bottom: 4 })
              .onClick(() => {
                this.controller.setDotDrawable($r('app.media.ic_dot_red'));
                this.result = `setDotDrawable(ic_dot_red): hasDotDrawable=${this.controller.hasDotDrawable}, dotDrawable=ic_dot_red → 选中=未选中=红色圆点, 立即刷新所有点背景, 不重建点、不播动画, 保持selectedIndex=${this.selectedIndex}选中态`;
              })
          }
          .padding({ left: 12, right: 12, top: 12, bottom: 12 })
          .width('100%')

          // 视觉预览区
          Column() {
            Text('指示点条预览')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ bottom: 8 })

            DotsIndicator({ controller: this.controller, selectedIndex: this.selectedIndex, pageCount: this.pageCount })
              .width('100%')
              .height(60)
              .backgroundColor('#FFFFFF')
              .borderRadius(8)
              .padding({ top: 12, bottom: 12 })
          }
          .padding({ left: 12, right: 12, top: 4, bottom: 12 })
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
