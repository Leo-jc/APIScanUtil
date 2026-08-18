import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { HeaderFooterList } from '../components/HeaderFooterList';
import { HeaderRecyclerViewDataSource } from 'header_recycler_view';

/**
 * F-01-03 尾部条目显隐切换及数据变更后列表正确刷新
 *
 * 验证 HAR showFooter / hideFooter（自带 notify）+ setItems（需配 notifyDataReloaded）
 * + 渲染分派（onCreateViewHolder/onBindViewHolder 在 ArkUI 等价为按 getItemCategory
 * 分派的 @Builder，onViewRecycled 等价为 notifyViewRecycled 回收钩子）。
 * - 显示尾部：尾部立即出现在列表末尾，列表刷新
 * - 隐藏尾部：尾部立即消失，列表刷新
 * - 更新普通条目数据：列表内容更新为新数据
 * - 向上滑动：滚动后内容正确显示，无错位
 */
@Entry
@Component
struct TestCaseF0103Page {
  private dataSource: HeaderRecyclerViewDataSource<string, string, string> =
    new HeaderRecyclerViewDataSource<string, string, string>();
  @State result: string = '等待操作：切换尾部显隐或更新数据';
  @State footerStateText: string = '尾部显隐: 显示（footerVisible=true）';

  aboutToAppear(): void {
    this.dataSource.setHeader('头部数据 · 顶部固定条目');
    this.dataSource.setFooter('尾部数据 · 加载更多');
    this.dataSource.setItems(this.buildInitialItems());
    // footer 初始可见（isFooterVisible 默认 true）
    this.dataSource.notifyDataReloaded();
    this.refreshFooterState();
  }

  private buildInitialItems(): string[] {
    let items: string[] = [];
    for (let i: number = 1; i <= 6; i++) {
      items.push('原始条目 ' + i);
    }
    return items;
  }

  private buildUpdatedItems(): string[] {
    let items: string[] = [];
    for (let i: number = 1; i <= 6; i++) {
      items.push('更新条目 ' + i + '（新数据）');
    }
    return items;
  }

  private refreshFooterState(): void {
    this.footerStateText = `尾部显隐: ${this.dataSource.isFooterShowing() ? '显示' : '隐藏'}（footerVisible=${this.dataSource.isFooterShowing()}, hasFooter=${this.dataSource.hasFooter()}, totalCount=${this.dataSource.totalCount()}）`;
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

        Text('F-01-03 尾部条目显隐切换及数据变更后列表正确刷新')
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
            '2. 点击【尾部条目显隐切换及数据变更后列表正确刷新】进入用例详情页 [验证点: 成功进入用例详情页，可见操作按钮和列表区域]',
            '3. 点击【显示尾部】按钮 [验证点: 【列表区域】尾部条目立即出现在列表末尾]',
            '4. 点击【隐藏尾部】按钮 [验证点: 【列表区域】尾部条目立即消失]',
            '5. 点击【更新普通条目数据】按钮 [验证点: 【列表区域】普通条目内容更新为新数据]',
            '6. 向上滑动屏幕 [验证点: 【列表区域】滚动后内容正确显示，无错位或残留]'
          ],
            expected_result: '显示尾部后尾部立即出现在列表末尾且列表刷新；隐藏尾部后尾部立即消失且列表刷新；更新数据后列表内容正确更新为新数据；滚动后列表内容正确显示无错位',
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
              Button('显示尾部')
                .id('btn_show_footer')
                .layoutWeight(1)
                .onClick(() => {
                  this.dataSource.showFooter();
                  this.refreshFooterState();
                  this.result = `showFooter() → 尾部立即出现，列表已刷新\n${this.footerStateText}`;
                })
              Button('隐藏尾部')
                .id('btn_hide_footer')
                .layoutWeight(1)
                .margin({ left: 8 })
                .onClick(() => {
                  this.dataSource.hideFooter();
                  this.refreshFooterState();
                  this.result = `hideFooter() → 尾部立即消失，列表已刷新\n${this.footerStateText}`;
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Button('更新普通条目数据')
              .id('btn_update_items')
              .width('100%')
              .onClick(() => {
                this.dataSource.setItems(this.buildUpdatedItems());
                this.dataSource.notifyDataReloaded();
                this.refreshFooterState();
                this.result = `setItems(新数据) + notifyDataReloaded() → 列表内容已更新为"更新条目 N（新数据）"\n${this.footerStateText}`;
              })

            Text(this.footerStateText)
              .id('txt_footer_state')
              .fontSize(13)
              .fontColor('#1565C0')
              .width('100%')
              .margin({ top: 8 })

            // 列表区域（渲染验证预览区，可滚动观察滚动后无错位）
            Text('列表区域（可上下滑动）')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 12, bottom: 4 })
            HeaderFooterList({ dataSource: this.dataSource })
              .height(320)
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
