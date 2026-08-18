import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { TableFixHeaders, TableAdapter, BaseTableAdapter } from 'tablefixheaders';

@Entry
@Component
struct TestCaseF0113Page {
  @State result: string = '等待操作 F-01-13...';
  @State adapter: TableAdapter | undefined = undefined;
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
        
        Text('F-01-13 未设置适配器时表格显示为空')
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
            test_steps: '1. 点击【TableFixHeaders 双向滚动固定表头表格控件】进入模块列表页 [验证点: 页面显示表格控件模块的测试用例列表]; 2. 点击【未设置适配器时表格显示为空】进入用例详情页 [验证点: 页面显示未配置适配器的表格区域]; 3. 观察表格显示区域 [验证点: 表格呈现为空白区域或不可见状态，无崩溃无异常]',
            expected_result: '未配置适配器时表格呈现为空白区域或不可见状态，不崩溃无异常',
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
            
            Text('适配器未设置，表格显示为空白区域，无崩溃无异常')
              .fontSize(13)
              .fontColor('#666666')
              .textAlign(TextAlign.Start)
              .width('100%')
              .padding(8)
              .margin({ top: 8 })
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
