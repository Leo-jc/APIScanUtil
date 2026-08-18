import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { TableFixHeaders, TableAdapter, BaseTableAdapter } from 'tablefixheaders';
import { BigTableAdapter } from './MockAdapters';

@Entry
@Component
struct TestCaseF0102Page {
  @State result: string = '等待操作 F-01-02...';
  @State adapter: TableAdapter | undefined = new BigTableAdapter();
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
        
        Text('F-01-02 垂直滚动表格时行标题固定不随内容移动')
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
            test_steps: '1. 点击【TableFixHeaders 双向滚动固定表头表格控件】进入模块列表页 [验证点: 页面显示表格控件模块的测试用例列表]; 2. 点击【垂直滚动表格时行标题固定不随内容移动】进入用例详情页 [验证点: 页面显示表格演示区域和操作控件]; 3. 在表格区域沿垂直方向向上拖动 (API: 滚动交互) [验证点: 表格数据内容向上滚动]; 4. 观察行标题行的位置 [验证点: 行标题始终固定在表格顶部可见区域，数据行正常滚动]',
            expected_result: '垂直滚动后行标题始终固定在表格顶部可见区域，数据行正常滚动',
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
            
            Text('请触摸表格区域垂直拖拽以验证行标题固定效果')
              .fontSize(13)
              .fontColor('#666666')
              .textAlign(TextAlign.Start)
              .width('100%')
              .padding(8)
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
