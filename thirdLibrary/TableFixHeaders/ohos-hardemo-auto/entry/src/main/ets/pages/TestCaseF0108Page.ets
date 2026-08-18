import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { TableFixHeaders, TableAdapter, BaseTableAdapter, TableFixHeadersController } from 'tablefixheaders';
import { BigTableAdapter } from './MockAdapters';

@Entry
@Component
struct TestCaseF0108Page {
  @State result: string = '等待操作 F-01-08...';
  @State adapter: TableAdapter | undefined = new BigTableAdapter();
  @State showTable: boolean = true;
  @State inputDX: string = '100';
  @State inputDY: string = '150';
  @State offsetX: number = 0;
  @State offsetY: number = 0;
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

        Text('F-01-08 程序化相对当前位置偏移滚动')
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
            test_steps: '1. 点击【TableFixHeaders 双向滚动固定表头表格控件】进入模块列表页 [验证点: 页面显示表格控件模块的测试用例列表]; 2. 点击【程序化相对当前位置偏移滚动】进入用例详情页 [验证点: 页面显示表格演示区域、偏移量输入框和滚动控制按钮]; 3. 在【水平偏移量】输入框中输入 100 [验证点: 输入框显示 100]; 4. 在【垂直偏移量】输入框中输入 150 [验证点: 输入框显示 150]; 5. 点击【偏移滚动】按钮 (API: scrollBy, 参数：dx=100, dy=150) [验证点: 表格内容从当前位置滚动偏移]; 6. 观察【偏移 X】和【偏移 Y】显示值 [验证点: 偏移值的增量与输入的偏移量一致]',
            expected_result: '程序化偏移滚动后表格内容从当前位置偏移指定距离，偏移增量与输入一致',
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

            Text('水平偏移量')
              .fontSize(14)
              .fontColor('#333333')
              .margin({ bottom: 4 })

            TextInput({ placeholder: '请输入水平偏移量', text: this.inputDX })
              .id('input_offset_dx')
              .onChange((value: string) => {
                this.inputDX = value;
              })
              .width('100%')
              .margin({ bottom: 8 })

            Text('垂直偏移量')
              .fontSize(14)
              .fontColor('#333333')
              .margin({ bottom: 4 })

            TextInput({ placeholder: '请输入垂直偏移量', text: this.inputDY })
              .id('input_offset_dy')
              .onChange((value: string) => {
                this.inputDY = value;
              })
              .width('100%')
              .margin({ bottom: 8 })

            Button('偏移滚动')
              .id('btn_offset_scroll')
              .onClick(() => {
                let dx: number = parseInt(this.inputDX);
                let dy: number = parseInt(this.inputDY);
                if (isNaN(dx) || isNaN(dy)) {
                  this.result = 'error: 请输入有效的数字偏移量';
                  return;
                }
                this.tableController.scrollBy(dx, dy);
                this.offsetX = this.tableController.getActualScrollX();
                this.offsetY = this.tableController.getActualScrollY();
                this.result = 'scrollBy(' + dx + ', ' + dy + '): 已执行。累计偏移 X: ' + this.offsetX + ' | 累计偏移 Y: ' + this.offsetY;
              })
              .width('100%')
              .margin({ bottom: 8 })

            Text('偏移 X: ' + this.offsetX)
              .fontSize(14)
              .fontColor('#333333')
              .margin({ bottom: 4 })

            Text('偏移 Y: ' + this.offsetY)
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
