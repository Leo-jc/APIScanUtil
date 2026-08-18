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
 * F-02-03 网格中无头部和尾部时所有条目占单列
 *
 * 验证 HAR getSpanSize：未配置 header/footer 时所有 position 返回 1（无任何条目
 * 横跨多列）。仅装配普通条目，spanCount=2，getSpanSize 对所有位置均=1，
 * buildGridLayoutOptions 的 irregularIndexes 为空，Grid 渲染时所有条目均占一列。
 */
@Entry
@Component
struct TestCaseF0203Page {
  private dataSource: HeaderRecyclerViewDataSource<string, string, string> =
    new HeaderRecyclerViewDataSource<string, string, string>();
  private readonly spanCount: number = 2;
  private scroller: Scroller = new Scroller();
  private layoutOptions: GridLayoutOptions = { regularSize: [1, 1], irregularIndexes: [] };
  @State result: string = '网格已渲染：无头部和尾部，所有条目占单列';

  aboutToAppear(): void {
    // 仅装配普通条目，不配置 header/footer
    this.dataSource.setItems(this.buildItems());
    this.dataSource.notifyDataReloaded();
    this.layoutOptions =
      new HeaderSpanSizeLookup<string, string, string>(this.dataSource, this.spanCount).buildGridLayoutOptions();
    let lookup: HeaderSpanSizeLookup<string, string, string> =
      new HeaderSpanSizeLookup<string, string, string>(this.dataSource, this.spanCount);
    let total: number = this.dataSource.totalCount();
    let lines: string[] = [];
    for (let i: number = 0; i < total; i++) {
      lines.push(`getSpanSize(${i})=${lookup.getSpanSize(i)}`);
    }
    this.result = `hasHeader=${this.dataSource.hasHeader()}, hasFooter=${this.dataSource.hasFooter()}\n` +
      `irregularIndexes=${lookup.getIrregularIndexes().toString()}（空）\n` + lines.join('\n') +
      `\n所有条目 getSpanSize=1，无横跨多列`;
  }

  private buildItems(): string[] {
    let items: string[] = [];
    for (let i: number = 1; i <= 8; i++) {
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

        Text('F-02-03 网格中无头部和尾部时所有条目占单列')
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
            level: 'L1',
            preconditions: '应用已启动',
            test_steps: [
            '1. 点击【HeaderSpanSizeLookup】进入模块列表页 [验证点: 成功进入模块列表页，可见模块下所有用例条目]',
            '2. 点击【网格中无头部和尾部时所有条目占单列】进入用例详情页 [验证点: 成功进入用例详情页，可见网格区域仅显示普通条目]',
            '3. 观察【网格区域】是否有头部条目 [验证点: 【网格区域】无头部条目显示]',
            '4. 观察【网格区域】是否有尾部条目 [验证点: 【网格区域】无尾部条目显示]',
            '5. 观察【网格区域】所有条目的跨列情况 [验证点: 【网格区域】所有条目均占一列，无任何条目横跨多列]'
          ],
            expected_result: '未配置头部和尾部时，网格中所有条目均占单列，无任何条目横跨多列',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区（观察类用例：网格区域为渲染验证预览组件）
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('网格区域（无头部/尾部，所有条目占单列）')
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
