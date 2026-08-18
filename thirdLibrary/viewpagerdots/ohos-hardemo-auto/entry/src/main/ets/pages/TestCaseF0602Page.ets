import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { DotsIndicator, DotsIndicatorController } from 'viewpagerdots';

@Entry
@Component
struct TestCaseF0602Page {
  @State result: string = '等待操作 F-06-02...';
  @State controller: DotsIndicatorController = new DotsIndicatorController();
  @State selectedIndex: number = 0;
  @State pageCount: number = 0;
  @State animationText: string = '';
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

        Text('F-06-02 默认选中动画为放大 1.8 倍且透明度升至完全不透明')
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
            '1. 点击【默认资源等价】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【默认选中动画为放大 1.8 倍且透明度升至完全不透明】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 向左滑动【轮播容器】切换到下一页 [验证点: 选中点放大到约 1.8 倍且透明度从不透明升至完全不透明]',
            '4. 观察【选中点】的动画过渡效果 [验证点: 动画持续约 200ms 内完成]'
          ],
            expected_result: '未指定自定义动画时，选中点在约 200ms 内从 scale 1.0 放大到 1.8 且透明度从 0.5 升至 1.0',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('说明默认动画参数')
              .id('btn_desc')
              .width('100%')
              .height(40)
              .onClick(() => {
                let nextIndex: number = (this.selectedIndex + 1) % this.pageCount;
                this.selectedIndex = nextIndex;
                this.animationText = '默认动画参数: scale 1.0→1.8, opacity 0.5→1.0, duration=200ms, curve=FastOutSlowIn；点击后已切换到第 ' + (nextIndex + 1).toString() + ' 页用于观察过渡。';
                this.result = this.animationText;
              })

            if (this.animationText.length > 0) {
              Text(this.animationText)
                .id('txt_animation_desc')
                .fontSize(13)
                .fontColor('#333333')
                .lineHeight(20)
                .width('100%')
                .padding(10)
                .backgroundColor('#FFFFFF')
                .borderRadius(8)
                .margin({ top: 8 })
            }
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
              this.result = '默认动画 onPageSelected(' + index.toString() + '): scale 1.0→1.8, opacity 0.5→1.0, duration=200ms, curve=FastOutSlowIn（选中点放大高亮）';
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
