import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { TableFixHeaders, TableAdapter, BaseTableAdapter } from 'tablefixheaders';
import { BigTableAdapter } from './MockAdapters';

@Entry
@Component
struct TestCaseF0104Page {
  @State result: string = '等待操作 F-01-04...';
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
        
        Text('F-01-04 触摸拖拽实现表格双向内容滚动')
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
            test_steps: '1. 点击【TableFixHeaders 双向滚动固定表头表格控件】进入模块列表页 [验证点: 页面显示表格控件模块的测试用例列表]; 2. 点击【触摸拖拽实现表格双向内容滚动】进入用例详情页 [验证点: 页面显示表格演示区域和操作控件]; 3. 在表格区域沿水平方向拖拽 (API: 触摸事件处理) [验证点: 表格内容跟随手指水平移动]; 4. 在表格区域沿垂直方向拖拽 [验证点: 表格内容跟随手指垂直移动]; 5. 在表格区域沿对角方向拖拽 [验证点: 表格内容同时向水平和垂直方向移动]',
            expected_result: '水平拖拽时内容水平偏移，垂直拖拽时内容垂直偏移，对角拖拽时内容双向偏移',
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
            
            Text('请触摸表格区域沿水平、垂直或对角方向拖拽以验证双向滚动效果')
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
