import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { HeaderFooterList } from '../components/HeaderFooterList';
import { HeaderRecyclerViewDataSource, ItemCategory } from 'header_recycler_view';

/**
 * F-01-02 列表按位置正确区分条目类别并展示对应数据
 *
 * 验证 HAR getItemCategory(position) / isHeaderPosition / isFooterPosition /
 * hasHeader / hasFooter / getItem(position)（含 header 偏移）/ getHeader / getFooter：
 * - 装配头部+普通条目后：位置0类别=头部，位置1类别=普通条目，位置1数据=第一个普通条目
 * - 装配尾部并显示后：末尾位置类别=尾部
 * 列表区域按 getItemCategory 分派渲染，使位置/类别判定能力可见。
 */
@Entry
@Component
struct TestCaseF0102Page {
  private dataSource: HeaderRecyclerViewDataSource<string, string, string> =
    new HeaderRecyclerViewDataSource<string, string, string>();
  @State result: string = '等待操作：装配头部和普通条目';
  @State cat0Text: string = '位置 0 条目类别: -';
  @State cat1Text: string = '位置 1 条目类别: -';
  @State catLastText: string = '末尾条目类别: -';
  @State item1Text: string = '位置 1 条目数据: -';

  private categoryName(category: ItemCategory): string {
    if (category === ItemCategory.HEADER) {
      return '头部';
    } else if (category === ItemCategory.FOOTER) {
      return '尾部';
    } else {
      return '普通条目';
    }
  }

  private buildItems(): string[] {
    let items: string[] = [];
    for (let i: number = 1; i <= 5; i++) {
      items.push('普通条目 ' + i + '（数据）');
    }
    return items;
  }

  private refreshCategories(): void {
    let total: number = this.dataSource.totalCount();
    if (total <= 0) {
      this.cat0Text = '位置 0 条目类别: -';
      this.cat1Text = '位置 1 条目类别: -';
      this.catLastText = '末尾条目类别: -';
      this.item1Text = '位置 1 条目数据: -';
      return;
    }
    this.cat0Text = '位置 0 条目类别: ' + this.categoryName(this.dataSource.getItemCategory(0));
    if (total > 1) {
      this.cat1Text = '位置 1 条目类别: ' + this.categoryName(this.dataSource.getItemCategory(1));
      // getItem(1)：有 header 时内部偏移 -1，返回 items[0]（第一个普通条目）
      this.item1Text = '位置 1 条目数据: ' + this.dataSource.getItem(1);
    } else {
      this.cat1Text = '位置 1 条目类别: -（总数不足）';
      this.item1Text = '位置 1 条目数据: -';
    }
    let last: number = total - 1;
    this.catLastText = '末尾条目类别: ' + this.categoryName(this.dataSource.getItemCategory(last));
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

        Text('F-01-02 列表按位置正确区分条目类别并展示对应数据')
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
            '2. 点击【列表按位置正确区分条目类别并展示对应数据】进入用例详情页 [验证点: 成功进入用例详情页，可见操作按钮和列表区域]',
            '3. 点击【装配头部和普通条目】按钮 [验证点: 【列表区域】头部在顶部、普通条目紧随其后依次排列]',
            '4. 观察【位置 0 条目类别】文本 [验证点: 【位置 0 条目类别】文本显示"头部"]',
            '5. 观察【位置 1 条目类别】文本 [验证点: 【位置 1 条目类别】文本显示"普通条目"]',
            '6. 点击【装配尾部数据并显示】按钮 [验证点: 【列表区域】尾部条目出现在列表末尾]',
            '7. 观察【末尾条目类别】文本 [验证点: 【末尾条目类别】文本显示"尾部"]',
            '8. 观察【位置 1 条目数据】文本 [验证点: 【位置 1 条目数据】文本显示第一个普通条目的正确内容（位置偏移正确）]'
          ],
            expected_result: '列表每个位置正确区分头部、尾部和普通条目类别；有头部时位置 0 为头部、末尾为尾部（有尾部时）、其余为普通条目；普通条目数据按对外位置偏移正确读取',
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
              Button('装配头部和普通条目')
                .id('btn_set_header_items')
                .layoutWeight(1)
                .onClick(() => {
                  this.dataSource.setHeader('头部数据 · 顶部固定条目');
                  this.dataSource.setItems(this.buildItems());
                  this.dataSource.notifyDataReloaded();
                  this.refreshCategories();
                  this.result = `setHeader+setItems+notifyDataReloaded → hasHeader=${this.dataSource.hasHeader()}, hasFooter=${this.dataSource.hasFooter()}\n${this.cat0Text}\n${this.cat1Text}\n${this.item1Text}`;
                })
              Button('装配尾部数据并显示')
                .id('btn_set_footer_show')
                .layoutWeight(1)
                .margin({ left: 8 })
                .onClick(() => {
                  this.dataSource.setFooter('尾部数据 · 加载更多');
                  this.dataSource.showFooter();
                  this.refreshCategories();
                  this.result = `setFooter+showFooter → 末尾类别=尾部, hasFooter=${this.dataSource.hasFooter()}\n${this.catLastText}`;
                })
            }
            .width('100%')

            // 观察点文本（由 HAR getItemCategory / getItem 真实返回驱动）
            Text('位置 0 条目类别')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 12, bottom: 4 })
            Text(this.cat0Text)
              .id('txt_cat0')
              .fontSize(13)
              .fontColor('#1565C0')
              .width('100%')

            Text('位置 1 条目类别')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 8, bottom: 4 })
            Text(this.cat1Text)
              .id('txt_cat1')
              .fontSize(13)
              .fontColor('#1565C0')
              .width('100%')

            Text('末尾条目类别')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 8, bottom: 4 })
            Text(this.catLastText)
              .id('txt_cat_last')
              .fontSize(13)
              .fontColor('#1565C0')
              .width('100%')

            Text('位置 1 条目数据（含 header 偏移）')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 8, bottom: 4 })
            Text(this.item1Text)
              .id('txt_item1')
              .fontSize(13)
              .fontColor('#2E7D32')
              .width('100%')

            // 列表区域（渲染验证预览区）
            Text('列表区域')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 12, bottom: 4 })
            HeaderFooterList({ dataSource: this.dataSource })
              .height(240)
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
