import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { HeaderFooterList } from '../components/HeaderFooterList';
import { HeaderRecyclerViewDataSource } from 'header_recycler_view';

/**
 * F-01-04 列表数据为空时提示错误
 *
 * 验证 HAR setItems(null) 抛出约定异常
 * "You can't use a null List<Item> instance."（对应 Android IllegalArgumentException）。
 * - 清空普通条目数据（传入 null）：错误提示文本显示异常信息
 * - 列表区域普通条目保持原有内容不变（setItems(null) 抛出，未替换内部 items）
 */
@Entry
@Component
struct TestCaseF0104Page {
  private dataSource: HeaderRecyclerViewDataSource<string, string, string> =
    new HeaderRecyclerViewDataSource<string, string, string>();
  @State result: string = '等待操作：点击清空普通条目数据';

  aboutToAppear(): void {
    this.dataSource.setHeader('头部数据 · 顶部固定条目');
    this.dataSource.setFooter('尾部数据 · 加载更多');
    this.dataSource.setItems(this.buildItems());
    this.dataSource.notifyDataReloaded();
  }

  private buildItems(): string[] {
    let items: string[] = [];
    for (let i: number = 1; i <= 5; i++) {
      items.push('原有普通条目 ' + i);
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

        Text('F-01-04 列表数据为空时提示错误')
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
            '1. 点击【HeaderRecyclerViewAdapter】进入模块列表页 [验证点: 成功进入模块列表页，可见模块下所有用例条目]',
            '2. 点击【列表数据为空时提示错误】进入用例详情页 [验证点: 成功进入用例详情页，可见操作按钮和列表区域已有普通条目]',
            '3. 点击【清空普通条目数据】按钮 [验证点: 【错误提示】文本区域显示错误信息]',
            '4. 观察【列表区域】普通条目 [验证点: 【列表区域】普通条目数据未变为空，保持原有内容]'
          ],
            expected_result: '触发空数据操作后界面显示错误提示，列表普通条目数据保持原有内容不变（以实际错误提示为准）',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('清空普通条目数据')
              .id('btn_set_items_null')
              .width('100%')
              .onClick(() => {
                try {
                  this.dataSource.setItems(null);
                  this.dataSource.notifyDataReloaded();
                  this.result = 'setItems(null) → 未抛异常（意外）';
                } catch (e) {
                  let msg: string = (e as Error).message;
                  this.result = `setItems(null) → error: ${msg}\n列表普通条目保持原有内容（items 未被替换）`;
                }
              })

            // 错误提示区域
            Text('错误提示')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 12, bottom: 4 })
            Text(this.result)
              .id('txt_error')
              .fontSize(12)
              .fontColor('#C62828')
              .backgroundColor('#FFEBEE')
              .borderRadius(6)
              .padding(8)
              .width('100%')

            // 列表区域（验证普通条目保持原有内容）
            Text('列表区域（普通条目应保持原有内容）')
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
