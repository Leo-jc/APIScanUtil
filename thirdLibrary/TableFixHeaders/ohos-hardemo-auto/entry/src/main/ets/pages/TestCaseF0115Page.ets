import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { TableFixHeaders, TableAdapter, BaseTableAdapter } from 'tablefixheaders';
import { SimpleTableAdapter, EmptyRowAdapter, EmptyColumnAdapter } from './MockAdapters';

@Entry
@Component
struct TestCaseF0115Page {
  @State result: string = '等待操作 F-01-15...';
  @State adapter: TableAdapter | undefined = new SimpleTableAdapter();
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
        
        Text('F-01-15 空行列数据时显示空表格')
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
            level: 'L1',
            preconditions: '应用已启动',
            test_steps: '1. 点击【TableFixHeaders 双向滚动固定表头表格控件】进入模块列表页 [验证点: 页面显示表格控件模块的测试用例列表]; 2. 点击【空行列数据时显示空表格】进入用例详情页 [验证点: 页面显示表格演示区域和数据配置控件]; 3. 点击【配置空行数据】按钮 (API: getRowCount) [验证点: 表格显示为空白区域]; 4. 观察表格显示状态 [验证点: 表格显示为空白区域，不崩溃无异常]; 5. 点击【配置空列数据】按钮 (API: getColumnCount) [验证点: 表格显示为空白区域]; 6. 观察表格显示状态 [验证点: 表格显示为空白区域，不崩溃无异常]',
            expected_result: '行数为 0 或列数为 0 时表格显示为空白区域，不崩溃无异常',
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
            
            Button('配置空行数据')
              .id('btn_empty_row')
              .onClick(() => {
                this.adapter = new EmptyRowAdapter();
                this.showTable = false;
                setTimeout(() => {
                  this.showTable = true;
                }, 50);
                this.result = 'getRowCount → 0. 行数为0，表格显示为空白区域';
              })
              .width('100%')
              .margin({ bottom: 8 })
            
            Button('配置空列数据')
              .id('btn_empty_column')
              .onClick(() => {
                this.adapter = new EmptyColumnAdapter();
                this.showTable = false;
                setTimeout(() => {
                  this.showTable = true;
                }, 50);
                this.result = 'getColumnCount → 0. 列数为0，表格显示为空白区域';
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
