import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { HeaderFooterList } from '../components/HeaderFooterList';
import { HeaderRecyclerViewDataSource } from 'header_recycler_view';

/**
 * F-01-01 头部、普通条目和尾部数据可独立装配且条目总数正确
 *
 * 验证 HAR HeaderRecyclerViewDataSource.setHeader / setFooter / setItems
 * （不自动 notify，需配合 notifyDataReloaded）+ totalCount + hideFooter：
 * - 装配头部 → 列表顶部出现头部条目，totalCount +1
 * - 装配普通条目 → 头部下方出现普通条目，totalCount +N
 * - 装配尾部 → 列表底部出现尾部条目，totalCount +1
 * - 隐藏尾部 → 尾部不可见，totalCount -1（hideFooter 内部触发 notifyDataReloaded）
 */
@Entry
@Component
struct TestCaseF0101Page {
  private dataSource: HeaderRecyclerViewDataSource<string, string, string> =
    new HeaderRecyclerViewDataSource<string, string, string>();
  @State result: string = '等待操作：依次装配头部/普通条目/尾部';
  @State totalText: string = '条目总数: 0（头部0 + 普通条目0 + 尾部0）';

  aboutToAppear(): void {
    this.refreshTotal();
  }

  private buildItems(): string[] {
    let items: string[] = [];
    for (let i: number = 1; i <= 5; i++) {
      items.push('普通条目 ' + i);
    }
    return items;
  }

  private refreshTotal(): void {
    let total: number = this.dataSource.totalCount();
    let header: number = this.dataSource.hasHeader() ? 1 : 0;
    let footer: number = this.dataSource.hasFooter() ? 1 : 0;
    let items: number = this.dataSource.getItemCount();
    this.totalText = `条目总数: ${total}（头部${header} + 普通条目${items} + 尾部${footer}）`;
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

        Text('F-01-01 头部、普通条目和尾部数据可独立装配且条目总数正确')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12, right: 16, top: 12, bottom: 12 })
          .layoutWeight(1)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
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
            '1. 点击【HeaderRecyclerViewAdapter】进入模块列表页 [验证点: 成功进入模块列表页，可见模块下所有用例条目]',
            '2. 点击【头部、普通条目和尾部数据可独立装配且条目总数正确】进入用例详情页 [验证点: 成功进入用例详情页，可见操作按钮和列表区域]',
            '3. 点击【装配头部数据】按钮 [验证点: 【列表区域】顶部出现头部条目]',
            '4. 点击【装配普通条目数据】按钮 [验证点: 【列表区域】头部下方出现普通条目]',
            '5. 点击【装配尾部数据】按钮 [验证点: 【列表区域】底部出现尾部条目]',
            '6. 观察【条目总数】文本 [验证点: 【条目总数】文本显示正确数值，含头部、普通条目和尾部各 1 项]',
            '7. 点击【隐藏尾部】按钮 [验证点: 【条目总数】文本数值减少 1 且【列表区域】尾部不可见]'
          ],
            expected_result: '列表条目总数随头部、普通条目和尾部数据的装配状态正确变化，头部和尾部均计入总数；尾部隐藏时总数减少 1 且不计入',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Row() {
              Button('装配头部数据')
                .id('btn_set_header')
                .layoutWeight(1)
                .onClick(() => {
                  this.dataSource.setHeader('头部数据 · 顶部固定条目');
                  this.dataSource.notifyDataReloaded();
                  this.refreshTotal();
                  this.result = `setHeader() + notifyDataReloaded() → 头部已装配\n${this.totalText}`;
                })
              Button('装配普通条目数据')
                .id('btn_set_items')
                .layoutWeight(1)
                .margin({ left: 8 })
                .onClick(() => {
                  this.dataSource.setItems(this.buildItems());
                  this.dataSource.notifyDataReloaded();
                  this.refreshTotal();
                  this.result = `setItems(5) + notifyDataReloaded() → 普通条目已装配\n${this.totalText}`;
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Row() {
              Button('装配尾部数据')
                .id('btn_set_footer')
                .layoutWeight(1)
                .onClick(() => {
                  this.dataSource.setFooter('尾部数据 · 加载更多');
                  this.dataSource.notifyDataReloaded();
                  this.refreshTotal();
                  this.result = `setFooter() + notifyDataReloaded() → 尾部已装配\n${this.totalText}`;
                })
              Button('隐藏尾部')
                .id('btn_hide_footer')
                .layoutWeight(1)
                .margin({ left: 8 })
                .onClick(() => {
                  this.dataSource.hideFooter();
                  this.refreshTotal();
                  this.result = `hideFooter() → 尾部隐藏（hasFooter=${this.dataSource.hasFooter()}）\n${this.totalText}`;
                })
            }
            .width('100%')

            // 条目总数文本（观察点）
            Text('条目总数')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 12, bottom: 4 })
            Text(this.totalText)
              .id('txt_total_count')
              .fontSize(14)
              .fontColor('#1565C0')
              .fontWeight(FontWeight.Bold)
              .width('100%')

            // 列表区域（渲染验证预览区）
            Text('列表区域')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 12, bottom: 4 })
            HeaderFooterList({ dataSource: this.dataSource })
              .height(280)
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
