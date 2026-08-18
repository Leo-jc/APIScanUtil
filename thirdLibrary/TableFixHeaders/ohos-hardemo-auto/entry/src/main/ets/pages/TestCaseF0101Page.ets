import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { TableFixHeaders, TableAdapter, BaseTableAdapter } from 'tablefixheaders';
import { SimpleTableAdapter } from './MockAdapters';

@Entry
@Component
struct TestCaseF0101Page {
  @State result: string = '等待操作 F-01-01...';
  @State adapter: TableAdapter | undefined = undefined;
  @State showTable: boolean = false;

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
        
        Text('F-01-01 表格配置有效适配器后完整显示所有行列内容')
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
            test_steps: '1. 点击【TableFixHeaders 双向滚动固定表头表格控件】进入模块列表页 [验证点: 页面显示表格控件模块的测试用例列表]; 2. 点击【表格配置有效适配器后完整显示所有行列内容】进入用例详情页 [验证点: 页面显示表格演示区域和操作控件]; 3. 点击【配置有效适配器】按钮 (API: setAdapter) [验证点: 表格区域出现行列数据]; 4. 观察表格中的单元格内容 [验证点: 表格完整显示所有行列数据，每个单元格内容与预期一致]',
            expected_result: '表格按适配器提供的行列数渲染出全部单元格，每个单元格内容与适配器返回的视图一致',
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
            
            Button('配置有效适配器')
              .id('btn_set_adapter')
              .onClick(() => {
                this.adapter = new SimpleTableAdapter();
                this.showTable = true;
                this.result = 'setAdapter(SimpleTableAdapter) → 适配器已设置: 8行×6列';
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
