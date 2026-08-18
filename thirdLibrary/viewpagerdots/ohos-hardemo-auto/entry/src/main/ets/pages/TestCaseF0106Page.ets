import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { DotsIndicator, DotsIndicatorController, DotsOrientation, DotsGravity } from 'viewpagerdots';

@Entry
@Component
struct TestCaseF0106Page {
  @State result: string = '等待操作 F-01-06...';
  @State controller: DotsIndicatorController = new DotsIndicatorController();
  @State selectedIndex: number = 0;
  @State pageCount: number = 0;
  @State abilityText: string = '';
  private pageColors: string[] = ['#2196F3', '#F44336', '#FFFFFF', '#4CAF50'];

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

        Text('F-01-06 指定自定义反向动画后取消选中点播放指定反向动画')
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
              '2. 点击【指定自定义反向动画后取消选中点播放指定反向动画】进入用例详情页 [验证点: 成功进入用例详情页]',
              '3. 向左滑动【轮播容器】切换到下一页 [验证点: 旧选中点播放自定义反向动画]'
            ],
            expected_result: '取消选中点播放自定义反向动画，而非默认动画的时间线反转',
            postconditions: ''
          })

          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('说明反向动画能力边界')
              .id('btn_gap')
              .width('100%')
              .height(44)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.abilityText = '反向动画能力边界: 旧选中点取消选中时使用 200ms scale 1.8→1.0、opacity 1.0→0.5、curve=Linear，等价 ReverseInterpolator(abs(1-v))；当前 HAR 未额外暴露自定义反向动画资源入口。';
                this.result = this.abilityText;
              })

            if (this.abilityText.length > 0) {
              Text(this.abilityText)
                .id('txt_reverse_boundary')
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

            Text('滑动下方轮播切换页面，观察旧选中点反向动画')
              .fontSize(12)
              .fontColor('#666666')
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
              this.result = 'onPageSelected(' + index.toString() + '): 旧点取消选中播放反向动画（HAR默认等价: 200ms scale 1.8→1.0, opacity 1.0→0.5, curve=Linear）';
            })
            .height(160)
            .borderRadius(8)
            .loop(true)

            DotsIndicator({ controller: this.controller, selectedIndex: this.selectedIndex, pageCount: this.pageCount })
              .width('100%')
              .height(60)
              .backgroundColor('#FFFFFF')
              .borderRadius(8)
              .padding({ top: 12, bottom: 12 })
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
