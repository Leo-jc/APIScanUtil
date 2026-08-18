import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { TableFixHeaders, TableAdapter } from 'tablefixheaders';
import { UpdatableTableAdapter } from './MockAdapters';

@Entry
@Component
struct TestCaseF0109Page {
  @State result: string = '等待操作 F-01-09...';
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

        Text('F-01-09 数据变更通知后表格内容全部刷新')
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
            test_steps: '1. 点击【TableFixHeaders 双向滚动固定表头表格控件】进入模块列表页 [验证点: 页面显示表格控件模块的测试用例列表]; 2. 点击【数据变更通知后表格内容全部刷新】进入用例详情页 [验证点: 页面显示表格演示区域和数据操作控件]; 3. 观察表格初始显示内容 [验证点: 表格显示初始数据集的内容]; 4. 点击【更新数据】按钮 (API: notifyDataSetChanged) [验证点: 表格内容重新加载]; 5. 观察表格中显示的数据 [验证点: 表格显示更新后的新数据，旧数据不再显示]',
            expected_result: '表格内容更新为新数据，旧数据不再显示，新数据完整呈现',
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

            Button('更新数据')
              .id('btn_update_data')
              .onClick(() => {
                let updatable = this.adapter as UpdatableTableAdapter;
                updatable.updateData();
                this.result = 'notifyDataSetChanged() → 数据已更新，新版本: ' + updatable.getDataVersion();
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
