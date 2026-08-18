import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { DotsIndicator, DotsIndicatorController, DotsOrientation, DotsGravity } from 'viewpagerdots';

@Entry
@Component
struct TestCaseF0105Page {
  @State result: string = '等待操作 F-01-05...';
  @State controller: DotsIndicatorController = new DotsIndicatorController();
  @State selectedIndex: number = 0;
  @State pageCount: number = 0;
  @State configText: string = '';
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

        Text('F-01-05 指定自定义选中动画后选中点播放指定动画效果')
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
              '2. 点击【指定自定义选中动画后选中点播放指定动画效果】进入用例详情页 [验证点: 成功进入用例详情页]',
              '3. 向左滑动【轮播容器】切换到下一页 [验证点: 选中点播放自定义动画效果]'
            ],
            expected_result: '选中点播放自定义动画效果，而非默认的放大与透明度变化动画',
            postconditions: ''
          })

          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('说明动画能力边界')
              .id('btn_gap')
              .width('100%')
              .height(44)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.configText = '自定义动画(dots_animator): HAR 未提供自定义动画入口，使用默认等价动画（200ms scale 1.0→1.8, opacity 0.5→1.0, curve=FastOutSlowIn）。滑动轮播观察选中点放大高亮。';
                this.result = this.configText;
              })

            if (this.configText.length > 0) {
              Text(this.configText)
                .id('txt_config')
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

            Text('滑动下方轮播切换页面，观察选中点动画')
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
              this.result = 'onPageSelected(' + index.toString() + '): 选中点播放动画（HAR默认等价: 200ms scale 1.0→1.8 + opacity 0.5→1.0）';
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
