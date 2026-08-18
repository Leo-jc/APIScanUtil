import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { GridEntryView } from '../components/GridEntryView';
import {
  HeaderRecyclerViewDataSource,
  HeaderRecyclerViewEntry,
  HeaderSpanSizeLookup
} from 'header_recycler_view';

/**
 * F-02-01 网格中头部和尾部条目占满整行
 *
 * 验证 HAR HeaderSpanSizeLookup + getSpanSize / buildGridLayoutOptions：
 * 配置 header + 普通条目 + footer，spanCount=2，header/footer 位置 getSpanSize=2
 * （占满整行），普通条目 getSpanSize=1。页面内联 ArkUI 原始 Grid，用
 * buildGridLayoutOptions() 产出的 GridLayoutOptions（irregularIndexes 指向
 * header/footer 位置，onGetIrregularSizeByIndex 返回 [1, spanCount]）驱动渲染，
 * 头部与尾部横跨所有列，普通条目不与头部或尾部共用同一行。
 */
@Entry
@Component
struct TestCaseF0201Page {
  private dataSource: HeaderRecyclerViewDataSource<string, string, string> =
    new HeaderRecyclerViewDataSource<string, string, string>();
  private readonly spanCount: number = 2;
  private scroller: Scroller = new Scroller();
  private layoutOptions: GridLayoutOptions = { regularSize: [1, 1], irregularIndexes: [] };
  @State result: string = '网格已渲染：头部 + 普通条目 + 尾部';

  aboutToAppear(): void {
    this.dataSource.setHeader('头部');
    this.dataSource.setFooter('尾部');
    this.dataSource.setItems(this.buildItems());
    this.dataSource.notifyDataReloaded();
    this.layoutOptions =
      new HeaderSpanSizeLookup<string, string, string>(this.dataSource, this.spanCount).buildGridLayoutOptions();
    let lookup: HeaderSpanSizeLookup<string, string, string> =
      new HeaderSpanSizeLookup<string, string, string>(this.dataSource, this.spanCount);
    let last: number = this.dataSource.totalCount() - 1;
    this.result = `spanCount=${lookup.getSpanCount()}\n` +
      `getSpanSize(0 头部)=${lookup.getSpanSize(0)}（占满整行）\n` +
      `getSpanSize(1 普通条目)=${lookup.getSpanSize(1)}\n` +
      `getSpanSize(${last} 尾部)=${lookup.getSpanSize(last)}（占满整行）\n` +
      `irregularIndexes=${lookup.getIrregularIndexes().toString()}`;
  }

  private buildItems(): string[] {
    let items: string[] = [];
    for (let i: number = 1; i <= 6; i++) {
      items.push('普通条目 ' + i);
    }
    return items;
  }

  build(): void {
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

        Text('F-02-01 网格中头部和尾部条目占满整行')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12, right: 16, top: 12, bottom: 12 })
          .layoutWeight(1)
      }
      .width('100%')
      .backgroundColor('#F1F3F5')

      Scroll() {
        Column() {
          // ╔─ FIXED SECTION: 测试信息区（使用 TestInfoPanel 组件）─ 禁止修改 ─╗
          TestInfoPanel({
            level: 'L0',
            preconditions: '应用已启动',
            test_steps: [
            '1. 点击【HeaderSpanSizeLookup】进入模块列表页 [验证点: 成功进入模块列表页，可见模块下所有用例条目]',
            '2. 点击【网格中头部和尾部条目占满整行】进入用例详情页 [验证点: 成功进入用例详情页，可见网格区域已显示头部、普通条目和尾部]',
            '3. 观察【网格区域】头部条目 [验证点: 【网格区域】头部条目横跨所有列，占满整行]',
            '4. 观察【网格区域】尾部条目 [验证点: 【网格区域】尾部条目横跨所有列，占满整行]',
            '5. 观察【网格区域】普通条目与头部尾部的位置关系 [验证点: 【网格区域】普通条目不与头部或尾部共用同一行]'
          ],
            expected_result: '网格布局中头部条目横跨所有列占满整行，尾部条目横跨所有列占满整行，普通条目不与头部或尾部共用同一行',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区（观察类用例：网格区域为渲染验证预览组件）
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('网格区域（头部/尾部占满整行，普通条目占单列）')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ bottom: 4 })
            Grid(this.scroller, this.layoutOptions) {
              LazyForEach(this.dataSource, (entry: HeaderRecyclerViewEntry<string, string, string>) => {
                GridItem() {
                  GridEntryView(entry)
                }
              }, (entry: HeaderRecyclerViewEntry<string, string, string>) => entry.position.toString())
            }
            .columnsTemplate('1fr 1fr')
            .columnsGap(8)
            .rowsGap(8)
            .width('100%')
            .height(360)
            .padding(8)
            .backgroundColor('#F0F0F0')
            .scrollBar(BarState.Auto)
          }
          .padding({ left: 12, right: 12, top: 12, bottom: 12 })
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
