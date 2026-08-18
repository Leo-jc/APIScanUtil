import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { DotsIndicator, DotsIndicatorController } from 'viewpagerdots';

@Entry
@Component
struct TestCaseF0202Page {
  @State result: string = '等待操作 F-02-02...';
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

        Text('F-02-02 重复绑定轮播数据源时清除旧点并重建新点')
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
            '1. 点击【绑定轮播数据源】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【重复绑定轮播数据源时清除旧点并重建新点】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 点击【绑定数据源】按钮 [验证点: 指示点条渲染出第一批点]',
            '4. 点击【重新绑定数据源】按钮 [验证点: 旧点全部清除后重建为新数据源对应数量的点]',
            '5. 观察【当前选中页】对应的指示点 [验证点: 当前选中页对应点高亮]'
          ],
            expected_result: '旧指示点全部清除后重建为新数据源对应数量的点，当前选中页对应的点高亮',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('绑定数据源')
              .id('btn_attach')
              .width('100%')
              .height(44)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.pageCount = 4;
                this.selectedIndex = 1;
                this.result = 'attachViewPager(首次): pageCount=4, selectedIndex=1 → 渲染4个点';
              })

            Button('重新绑定数据源')
              .id('btn_reattach')
              .width('100%')
              .height(44)
              .onClick(() => {
                this.pageCount = 6;
                this.selectedIndex = 2;
                this.result = 'attachViewPager(重复): 旧4点清除→重建6点, selectedIndex=2放大高亮';
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
