import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { HeaderFooterList } from '../components/HeaderFooterList';
import { HeaderRecyclerViewDataSource } from 'header_recycler_view';

/**
 * F-01-05 普通条目位置越界时的异常处理
 *
 * 验证 HAR getItem(position) 在越界位置的真实行为：HAR 未显式边界校验，
 * 越界时 items[pos] 返回 undefined（ArkTS/TS 数组越界不抛异常，与 Android
 * IndexOutOfBoundsException 行为不同，Demo 据 HAR 真实输出推导错误提示）。
 * - 读取越界位置条目（如 position=999）：错误提示显示无有效数据
 * - 列表区域不展示任何无效条目数据
 */
@Entry
@Component
struct TestCaseF0105Page {
  private dataSource: HeaderRecyclerViewDataSource<string, string, string> =
    new HeaderRecyclerViewDataSource<string, string, string>();
  @State result: string = '等待操作：点击读取越界位置条目';
  private readonly outOfBoundsPosition: number = 999;

  aboutToAppear(): void {
    this.dataSource.setHeader('头部数据 · 顶部固定条目');
    this.dataSource.setFooter('尾部数据 · 加载更多');
    this.dataSource.setItems(this.buildItems());
    this.dataSource.notifyDataReloaded();
  }

  private buildItems(): string[] {
    let items: string[] = [];
    for (let i: number = 1; i <= 5; i++) {
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

        Text('F-01-05 普通条目位置越界时的异常处理')
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
            '2. 点击【普通条目位置越界时的异常处理】进入用例详情页 [验证点: 成功进入用例详情页，可见操作按钮和列表区域已有普通条目]',
            '3. 点击【读取越界位置条目】按钮 [验证点: 【错误提示】文本区域显示错误信息]',
            '4. 观察【列表区域】 [验证点: 【列表区域】不展示任何无效条目数据]'
          ],
            expected_result: '读取超出范围的普通条目位置时界面显示错误提示，不展示任何无效条目数据（以实际错误提示为准）',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('读取越界位置条目')
              .id('btn_get_item_oob')
              .width('100%')
              .onClick(() => {
                let pos: number = this.outOfBoundsPosition;
                try {
                  let data: string | undefined = this.dataSource.getItem(pos);
                  if (data === undefined || data === null) {
                    this.result = `getItem(${pos}) → undefined\n位置 ${pos} 越界，无有效条目数据（HAR 未显式边界校验，越界返回 undefined）`;
                  } else {
                    this.result = `getItem(${pos}) → ${data}`;
                  }
                } catch (e) {
                  this.result = `getItem(${pos}) → error: ${(e as Error).message}`;
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

            // 列表区域（验证不展示无效条目数据）
            Text('列表区域（仅展示有效条目，无越界无效数据）')
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
