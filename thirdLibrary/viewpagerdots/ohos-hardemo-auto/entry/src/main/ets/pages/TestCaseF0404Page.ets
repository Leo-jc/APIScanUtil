import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { DotsIndicator, DotsIndicatorController } from 'viewpagerdots';

@Entry
@Component
struct TestCaseF0404Page {
  @State result: string = '等待操作 F-04-04...';
  @State controller: DotsIndicatorController = new DotsIndicatorController();
  @State selectedIndex: number = 0;
  @State pageCount: number = 0;

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

        Text('F-04-04 数据源未绑定时更换视觉样式无即时效果但后续绑定生效')
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
            '1. 点击【运行时切换点视觉样式】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【数据源未绑定时更换视觉样式无即时效果但后续绑定生效】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 点击【更换视觉样式】按钮 [验证点: 指示点条无可见效果]',
            '4. 点击【绑定数据源】按钮 [验证点: 新渲染的点使用更换后的视觉样式]'
          ],
            expected_result: '更换时无可见效果，后续绑定后新渲染的点使用更换后的视觉样式',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('更换视觉样式')
              .id('btn_drawable')
              .width('100%')
              .margin({ top: 4, bottom: 4 })
              .onClick(() => {
                this.controller.setDotDrawable($r('app.media.ic_dot_red'), $r('app.media.ic_dot_blue'));
                this.result = `setDotDrawable(未绑定): pageCount=${this.pageCount} 无可见效果, dotDrawable=ic_dot_red已记录, hasDotDrawable=${this.controller.hasDotDrawable}`;
              })

            Button('绑定数据源')
              .id('btn_attach')
              .width('100%')
              .margin({ top: 4, bottom: 4 })
              .onClick(() => {
                this.pageCount = 4;
                this.selectedIndex = 1;
                this.result = `attachViewPager后: pageCount=${this.pageCount}, selectedIndex=${this.selectedIndex}, hasDotDrawable=${this.controller.hasDotDrawable} → 新渲染4点使用更换后的视觉（选中=红/未选中=蓝）`;
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
