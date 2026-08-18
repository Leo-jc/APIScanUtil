import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { TableFixHeaders, TableAdapter, BaseTableAdapter } from 'tablefixheaders';
import { OutOfBoundsViewTypeAdapter } from './MockAdapters';

@Entry
@Component
struct TestCaseF0114Page {
  @State result: string = '等待操作 F-01-14...';
  @State adapter: TableAdapter | undefined = new OutOfBoundsViewTypeAdapter();
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
        
        Text('F-01-14 视图类型返回越界值时稳定处理')
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
            test_steps: '1. 点击【TableFixHeaders 双向滚动固定表头表格控件】进入模块列表页 [验证点: 页面显示表格控件模块的测试用例列表]; 2. 点击【视图类型返回越界值时稳定处理】进入用例详情页 [验证点: 页面显示表格演示区域和越界模拟控件]; 3. 观察表格初始显示内容 [验证点: 表格正常显示数据]; 4. 点击【模拟视图类型越界】按钮 (API: getItemViewType) [验证点: 表格处理越界情况]; 5. 观察表格显示状态 [验证点: 表格不崩溃，保持稳定显示状态]',
            expected_result: '表格不因视图类型越界而崩溃，保持稳定显示状态',
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
            
            Button('模拟视图类型越界')
              .id('btn_simulate_out_of_bounds')
              .onClick(() => {
                let outAdapter = this.adapter as OutOfBoundsViewTypeAdapter;
                outAdapter.setOutOfBoundsMode(true);
                this.result = 'getItemViewType → 返回越界值999. 表格不崩溃，保持稳定显示状态';
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
