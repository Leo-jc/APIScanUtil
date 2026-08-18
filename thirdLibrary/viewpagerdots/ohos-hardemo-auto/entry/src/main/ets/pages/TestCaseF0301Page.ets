import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { DotsIndicator, DotsIndicatorController } from 'viewpagerdots';

@Entry
@Component
struct TestCaseF0301Page {
  @State result: string = '等待操作 F-03-01...';
  @State controller: DotsIndicatorController = new DotsIndicatorController();
  @State selectedIndex: number = 0;
  @State pageCount: number = 0;
  private pageColors: string[] = ['#2196F3', '#F44336', '#FFFFFF', '#4CAF50'];

  aboutToAppear(): void {
    this.pageCount = 4;
    this.selectedIndex = 0;
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

        Text('F-03-01 首次翻页选中后切换到另一页时旧点淡出新点高亮')
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
            '1. 点击【翻页选中态切换】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【首次翻页选中后切换到另一页时旧点淡出新点高亮】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 向左滑动【轮播容器】切换到第二页 [验证点: 第二页指示点立即放大高亮，无旧点取消动画]',
            '4. 向左滑动【轮播容器】切换到第三页 [验证点: 第二页指示点缩小淡出，第三页指示点放大高亮]'
          ],
            expected_result: '首次翻页选中时当前页指示点立即放大高亮且无旧点取消动画，随后切换到另一页时旧点缩小淡出、新点放大高亮',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('重置到第一页')
              .id('btn_reset')
              .width('100%')
              .height(44)
              .onClick(() => {
                this.selectedIndex = 0;
                this.result = '重置: selectedIndex=0（回到第一页）';
              })
          }
          .padding({ left: 12, right: 12, top: 12, bottom: 12 })
          .width('100%')

          // 视觉预览区
          Column() {
            Text('轮播容器 + 指示点条预览')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ bottom: 8 })

            Swiper() {
              ForEach(this.pageColors, (c: string, idx: number) => {
                Column() {
                  Text('Page ' + (idx + 1).toString())
                    .fontSize(24)
                    .fontColor(c === '#FFFFFF' ? '#000000' : '#FFFFFF')
                }
                .width('100%')
                .height(160)
                .backgroundColor(c)
                .justifyContent(FlexAlign.Center)
              }, (c: string, idx: number) => 'page-' + idx.toString())
            }
            .index(this.selectedIndex)
            .onChange((index: number) => {
              this.selectedIndex = index;
              this.result = 'onPageSelected(' + index.toString() + '): selectedIndex 0→' + index.toString() + '，新点放大高亮（首次选中无旧点取消动画，后续切换旧点缩小淡出/新点放大高亮）';
            })
            .height(160)
            .borderRadius(8)
            .loop(true)

            DotsIndicator({ controller: this.controller, selectedIndex: this.selectedIndex, pageCount: this.pageCount })
              .width('100%')
              .height(48)
              .backgroundColor('#FFFFFF')
              .borderRadius(8)
              .padding({ top: 8, bottom: 8 })
              .margin({ top: 8 })
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
