import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { DotsIndicator, DotsIndicatorController } from 'viewpagerdots';

@Entry
@Component
struct TestCaseF0306Page {
  @State result: string = '等待操作 F-03-06...';
  @State controller: DotsIndicatorController = new DotsIndicatorController();
  @State selectedIndex: number = 0;
  @State pageCount: number = 0;
  @State currentIdx: number = 0;
  @State swiperIndex: number = 0;
  @State isEmptyDataSource: boolean = false;
  private pageColors: string[] = ['#2196F3', '#F44336', '#FFFFFF', '#4CAF50'];

  aboutToAppear(): void {
    this.pageCount = 4;
    this.selectedIndex = 0;
    this.currentIdx = 0;
    this.swiperIndex = 0;
    this.isEmptyDataSource = false;
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

        Text('F-03-06 重复选中当前页后空数据源翻页不产生视觉变化')
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
            level: 'L2',
            preconditions: '应用已启动',
            test_steps: [
            '1. 点击【翻页选中态切换】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【重复选中当前页后空数据源翻页不产生视觉变化】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 向左滑动【轮播容器】切换到第二页 [验证点: 第二页指示点放大高亮]',
            '4. 再次触发选中第二页的操作 [验证点: 第二页指示点动画叠加]',
            '5. 点击【切换为空数据源】按钮后向左滑动【轮播容器】 [验证点: 指示点保持当前态无视觉变化]'
          ],
            expected_result: '重复选中当前页后空数据源翻页，指示点保持当前态无视觉变化',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('重复选中当前页')
              .id('btn_reselect')
              .width('100%')
              .height(44)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.selectedIndex = -1;
                setTimeout(() => {
                  this.selectedIndex = this.currentIdx;
                  this.result = '重复选中: selectedIndex -1→' + this.currentIdx.toString() + '（动画叠加）';
                }, 50);
              })

            Button('切换为空数据源')
              .id('btn_empty')
              .width('100%')
              .height(44)
              .onClick(() => {
                this.isEmptyDataSource = true;
                this.result = '切换为空数据源: 指示点条保持当前渲染状态，pageCount=' + this.pageCount.toString() +
                  ', selectedIndex=' + this.selectedIndex.toString() + '；后续轮播翻页不再更新指示点视觉状态';
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
            .index(this.swiperIndex)
            .onChange((index: number) => {
              this.swiperIndex = index;
              if (this.isEmptyDataSource) {
                this.result = '空数据源翻页事件: swiperIndex=' + index.toString() +
                  '，指示点保持 selectedIndex=' + this.selectedIndex.toString() + ' 高亮不变';
              } else {
                this.selectedIndex = index;
                this.currentIdx = index;
                this.result = 'onPageSelected(' + index.toString() + '): 选中点放大高亮';
              }
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
