import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { DotsIndicator, DotsIndicatorController } from 'viewpagerdots';

@Entry
@Component
struct TestCaseF0402Page {
  @State result: string = '等待操作 F-04-02...';
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

        Text('F-04-02 运行时分别更换选中点和未选中点视觉后立即刷新')
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
            '2. 点击【运行时分别更换选中点和未选中点视觉后立即刷新】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 点击【更换选中视觉】按钮 [验证点: 选中点用新视觉样式]',
            '4. 点击【更换未选中视觉】按钮 [验证点: 未选中点用新视觉样式]'
          ],
            expected_result: '选中点使用指定的选中视觉样式，未选中点使用指定的未选中视觉样式，立即刷新',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('更换选中视觉')
              .id('btn_selected_drawable')
              .width('100%')
              .margin({ top: 4, bottom: 4 })
              .onClick(() => {
                this.controller.setDotDrawable($r('app.media.ic_dot_red'), $r('app.media.ic_dot_black'));
                this.result = `setDotDrawable(选中=ic_dot_red, 未选中保持ic_dot_black): hasDotDrawable=${this.controller.hasDotDrawable}, dotDrawable=ic_dot_red → 仅选中点变为红色圆点, 未选中点保持原视觉`;
              })

            Button('更换未选中视觉')
              .id('btn_unselected_drawable')
              .width('100%')
              .margin({ top: 4, bottom: 4 })
              .onClick(() => {
                this.controller.setDotDrawable($r('app.media.ic_dot_red'), $r('app.media.ic_dot_green'));
                this.result = `setDotDrawable(选中保持ic_dot_red, 未选中=ic_dot_green): dotDrawableUnselected=ic_dot_green, hasDotDrawable=${this.controller.hasDotDrawable} → 未选中点变为绿色圆点, 选中点保持红色, 立即刷新`;
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
