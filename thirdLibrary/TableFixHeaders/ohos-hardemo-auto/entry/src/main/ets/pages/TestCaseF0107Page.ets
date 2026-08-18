import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { TableFixHeaders, TableAdapter, BaseTableAdapter, TableFixHeadersController } from 'tablefixheaders';
import { BigTableAdapter } from './MockAdapters';

@Entry
@Component
struct TestCaseF0107Page {
  @State result: string = '等待操作 F-01-07...';
  @State adapter: TableAdapter | undefined = new BigTableAdapter();
  @State showTable: boolean = true;
  @State inputX: string = '200';
  @State inputY: string = '300';
  @State displayScrollX: number = 0;
  @State displayScrollY: number = 0;
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

        Text('F-01-07 程序化滚动到指定位置')
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
            test_steps: '1. 点击【TableFixHeaders 双向滚动固定表头表格控件】进入模块列表页 [验证点: 页面显示表格控件模块的测试用例列表]; 2. 点击【程序化滚动到指定位置】进入用例详情页 [验证点: 页面显示表格演示区域、坐标输入框和滚动控制按钮]; 3. 在【目标 X 坐标】输入框中输入 200 [验证点: 输入框显示 200]; 4. 在【目标 Y 坐标】输入框中输入 300 [验证点: 输入框显示 300]; 5. 点击【滚动到指定位置】按钮 (API: scrollTo, 参数：x=200, y=300) [验证点: 表格内容跳转到对应的行列位置]; 6. 观察【偏移 X】和【偏移 Y】显示值 [验证点: 偏移值与输入的坐标值一致]',
            expected_result: '程序化滚动后表格内容跳转到指定的坐标位置，与输入的目标坐标一致',
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

            Text('目标 X 坐标')
              .fontSize(14)
              .fontColor('#333333')
              .margin({ bottom: 4 })

            TextInput({ placeholder: '请输入目标X坐标', text: this.inputX })
              .id('input_target_x')
              .onChange((value: string) => {
                this.inputX = value;
              })
              .width('100%')
              .margin({ bottom: 8 })

            Text('目标 Y 坐标')
              .fontSize(14)
              .fontColor('#333333')
              .margin({ bottom: 4 })

            TextInput({ placeholder: '请输入目标Y坐标', text: this.inputY })
              .id('input_target_y')
              .onChange((value: string) => {
                this.inputY = value;
              })
              .width('100%')
              .margin({ bottom: 8 })

            Button('滚动到指定位置')
              .id('btn_scroll_to_position')
              .onClick(() => {
                let targetX: number = parseInt(this.inputX);
                let targetY: number = parseInt(this.inputY);
                if (isNaN(targetX) || isNaN(targetY)) {
                  this.result = 'error: 请输入有效的数字坐标';
                  return;
                }
                this.tableController.scrollTo(targetX, targetY);
                this.displayScrollX = this.tableController.getActualScrollX();
                this.displayScrollY = this.tableController.getActualScrollY();
                this.result = 'scrollTo(' + targetX + ', ' + targetY + '): 已执行。偏移 X: ' + this.displayScrollX + ' | 偏移 Y: ' + this.displayScrollY;
              })
              .width('100%')
              .margin({ bottom: 8 })

            Text('偏移 X: ' + this.displayScrollX)
              .fontSize(14)
              .fontColor('#333333')
              .margin({ bottom: 4 })

            Text('偏移 Y: ' + this.displayScrollY)
              .fontSize(14)
              .fontColor('#333333')
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
