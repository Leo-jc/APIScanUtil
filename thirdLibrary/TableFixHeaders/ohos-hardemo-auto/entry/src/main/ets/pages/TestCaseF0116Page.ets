import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { TableFixHeaders, TableAdapter, BaseTableAdapter, TableFixHeadersController } from 'tablefixheaders';
import { BigTableAdapter } from './MockAdapters';

@Entry
@Component
struct TestCaseF0116Page {
  @State result: string = '等待操作 F-01-16...';
  @State adapter: TableAdapter | undefined = new BigTableAdapter();
  @State showTable: boolean = true;
  private tableController: TableFixHeadersController = new TableFixHeadersController();

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
        
        Text('F-01-16 滚动达到最大边界时不再继续')
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
            test_steps: '1. 点击【TableFixHeaders 双向滚动固定表头表格控件】进入模块列表页 [验证点: 页面显示表格控件模块的测试用例列表]; 2. 点击【滚动达到最大边界时不再继续】进入用例详情页 [验证点: 页面显示表格演示区域和滚动控制按钮]; 3. 点击【滚动到最大边界】按钮 (API: scrollTo) [验证点: 表格内容到达最大滚动边界位置]; 4. 点击【向右继续滚动】按钮 (API: scrollBy) [验证点: 表格内容停留在最右侧边界位置不再继续向右]; 5. 点击【向下继续滚动】按钮 (API: scrollBy) [验证点: 表格内容停留在最底部边界位置不再继续向下]',
            expected_result: '滚动到内容边界后继续滚动操作，内容停在边界位置不越界',
            postconditions: ''
          })
          
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })
            
            if (this.showTable) {
              TableFixHeaders({ adapter: this.adapter, controller: this.tableController })
            }
            
            Button('滚动到最大边界')
              .id('btn_scroll_max_boundary')
              .onClick(() => {
                this.tableController.scrollTo(99999, 99999);
                this.result = 'scrollTo(最大X, 最大Y): 已执行，请观察表格是否停在边界位置不越界';
              })
              .width('100%')
              .margin({ bottom: 8 })
            
            Button('向右继续滚动')
              .id('btn_scroll_right_more')
              .onClick(() => {
                this.tableController.scrollBy(200, 0);
                this.result = 'scrollBy(200, 0): 已执行，请观察表格是否停在最右侧边界位置不越界';
              })
              .width('100%')
              .margin({ bottom: 8 })
            
            Button('向下继续滚动')
              .id('btn_scroll_down_more')
              .onClick(() => {
                this.tableController.scrollBy(0, 200);
                this.result = 'scrollBy(0, 200): 已执行，请观察表格是否停在最底部边界位置不越界';
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
