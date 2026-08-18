import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { DotsIndicator, DotsIndicatorController, DotsOrientation, DotsGravity } from 'viewpagerdots';

@Entry
@Component
struct TestCaseF0107Page {
  @State result: string = '等待操作 F-01-07...';
  @State controller: DotsIndicatorController = new DotsIndicatorController();
  @State selectedIndex: number = 0;
  @State pageCount: number = 0;
  @State configText: string = '';

  aboutToAppear(): void {
    this.pageCount = 4;
    this.selectedIndex = 0;
  }

  build() {
    Column() {
      Row() {
        Image($r('sys.media.ohos_ic_public_arrow_left'))
          .width(24)
          .height(24)
          .fillColor('#333333')
          .onClick(() => {
            router.back();
          })
          .margin({ left: 16 })

        Text('F-01-07 指定纵向排列后指示点从上到下排列')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12, right: 16, top: 12, bottom: 12 })
          .layoutWeight(1)
      }
      .width('100%')
      .backgroundColor('#F1F3F5')

      Scroll() {
        Column() {
          TestInfoPanel({
            level: 'L1',
            preconditions: '应用已启动',
            test_steps: [
              '1. 点击【指示点条容器构造与初始化】进入模块列表页 [验证点: 成功进入模块列表页]',
              '2. 点击【指定纵向排列后指示点从上到下排列】进入用例详情页 [验证点: 成功进入用例详情页]',
              '3. 观察【指示点条】区域中点的排列方向 [验证点: 点纵向排列，间距作用于上下方向]'
            ],
            expected_result: '指示点从上到下纵向排列，点间距作用于上下方向',
            postconditions: ''
          })

          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('展示纵向排列')
              .id('btn_show')
              .width('100%')
              .height(44)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.pageCount = 4;
                this.selectedIndex = 0;
                this.configText = '纵向排列: orientation=VERTICAL, gravity=CENTER, dotColor=#000000, dotWidth=5vp, dotHeight=5vp, dotMargin=5vp, pageCount=4, selectedIndex=0；点从上到下排列并在容器内居中。';
                this.result = this.configText;
              })

            if (this.configText.length > 0) {
              Text(this.configText)
                .id('txt_vertical_config')
                .fontSize(13)
                .fontColor('#333333')
                .lineHeight(20)
                .width('100%')
                .padding(10)
                .backgroundColor('#FFFFFF')
                .borderRadius(8)
            }
          }
          .padding({ left: 12, right: 12, top: 12, bottom: 12 })
          .width('100%')

          Column() {
            Text('指示点条预览')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ bottom: 8 })

            DotsIndicator({
              controller: this.controller,
              selectedIndex: this.selectedIndex,
              pageCount: this.pageCount,
              orientation: DotsOrientation.VERTICAL
            })
              .width('100%')
              .height(120)
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
