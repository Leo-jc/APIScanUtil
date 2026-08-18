import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { DotsIndicator, DotsIndicatorController } from 'viewpagerdots';

@Entry
@Component
struct TestCaseF0302Page {
  @State result: string = '等待操作 F-03-02...';
  @State controller: DotsIndicatorController = new DotsIndicatorController();
  @State selectedIndex: number = 0;
  @State pageCount: number = 0;
  @State sequenceId: number = 0;
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

        Text('F-03-02 连续翻页切换时指示点选中态正确切换无残留')
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
            '2. 点击【连续翻页切换时指示点选中态正确切换无残留】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 快速连续向左滑动【轮播容器】切换多页 [验证点: 每次切换旧点缩小淡出新点放大高亮]',
            '4. 观察【指示点条】最终选中态 [验证点: 当前页指示点高亮，无动画残留或卡死]'
          ],
            expected_result: '连续多次切换不同页时，每次旧点缩小淡出新点放大高亮，动画能被打断重放，最终选中态正确无残留',
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
              .margin({ bottom: 8 })
              .onClick(() => {
                this.sequenceId++;
                this.selectedIndex = 0;
                this.result = '重置: selectedIndex=0';
              })

            Button('连续切换演示')
              .id('btn_sequence')
              .width('100%')
              .height(44)
              .onClick(() => {
                this.sequenceId++;
                let currentSequence: number = this.sequenceId;
                this.result = '连续切换演示: 将快速切换 1→2→3→0，用于观察旧点缩小淡出、新点放大高亮以及动画打断重放';
                setTimeout(() => {
                  this.applySequenceIndex(currentSequence, 1);
                }, 0);
                setTimeout(() => {
                  this.applySequenceIndex(currentSequence, 2);
                }, 80);
                setTimeout(() => {
                  this.applySequenceIndex(currentSequence, 3);
                }, 160);
                setTimeout(() => {
                  this.applySequenceIndex(currentSequence, 0);
                }, 240);
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
              this.result = '连续切换: onPageSelected(' + index.toString() + ') → 旧点缩小淡出/新点放大高亮，动画可打断重放';
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

  private applySequenceIndex(sequence: number, index: number): void {
    if (sequence !== this.sequenceId) {
      return;
    }
    this.selectedIndex = index;
    this.result = '连续切换演示: selectedIndex=' + index.toString() +
      '，动画在 200ms 内可被下一次切换打断并重放，最终只保留当前页高亮';
  }
}
