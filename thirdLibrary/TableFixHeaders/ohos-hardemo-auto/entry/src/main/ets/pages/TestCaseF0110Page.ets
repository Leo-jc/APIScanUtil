import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { TableFixHeaders, TableAdapter } from 'tablefixheaders';
import { UpdatableTableAdapter } from './MockAdapters';

@Entry
@Component
struct TestCaseF0110Page {
  @State result: string = '等待操作 F-01-10...';
  @State adapter: TableAdapter = new UpdatableTableAdapter();
  @State showTable: boolean = true;

  build() {
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

        Text('F-01-10 数据失效通知后表格状态正常')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12, right: 16, top: 12, bottom: 12 })
          .layoutWeight(1)
      }
      .width('100%')
      .backgroundColor('#F1F3F5')

      Scroll() {
        Column() {
          TestInfoPanel({
            level: 'L0',
            preconditions: '应用已启动',
            test_steps: '1. 点击【TableFixHeaders 双向滚动固定表头表格控件】进入模块列表页 [验证点: 页面显示表格控件模块的测试用例列表]; 2. 点击【数据失效通知后表格状态正常】进入用例详情页 [验证点: 页面显示表格演示区域和操作控件]; 3. 观察表格初始显示内容 [验证点: 表格正常显示数据]; 4. 点击【标记数据失效】按钮 (API: notifyDataSetInvalidated) [验证点: 表格状态刷新]; 5. 观察表格显示状态 [验证点: 屏幕无闪退无崩溃，表格保持稳定显示状态]',
            expected_result: '数据失效通知后屏幕不闪退不崩溃，表格维持当前显示状态',
            postconditions: ''
          })

          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            if (this.showTable) {
              TableFixHeaders({ adapter: this.adapter })
            }

            Button('标记数据失效')
              .id('btn_invalidate_data')
              .onClick(() => {
                (this.adapter as UpdatableTableAdapter).notifyDataSetInvalidated();
                this.result = 'notifyDataSetInvalidated() → 表格状态已刷新，无闪退无崩溃';
              })
              .width('100%')
              .margin({ bottom: 8 })
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
