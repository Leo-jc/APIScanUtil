import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { TableFixHeaders, TableAdapter, TableFixHeadersController } from 'tablefixheaders';
import { BigTableAdapter } from './MockAdapters';

@Entry
@Component
struct TestCaseF0111Page {
  @State result: string = '等待操作 F-01-11...';
  @State adapter: TableAdapter = new BigTableAdapter();
  @State showTable: boolean = true;
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

        Text('F-01-11 查询当前滚动偏移位置与实际一致')
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
            test_steps: '1. 点击【TableFixHeaders 双向滚动固定表头表格控件】进入模块列表页 [验证点: 页面显示表格控件模块的测试用例列表]; 2. 点击【查询当前滚动偏移位置与实际一致】进入用例详情页 [验证点: 页面显示表格演示区域和偏移信息显示区]; 3. 在表格区域沿水平方向拖动一定距离 [验证点: 表格内容水平移动]; 4. 观察【水平偏移】显示值 (API: getActualScrollX) [验证点: 显示的水平偏移数值与内容实际偏移一致]; 5. 在表格区域沿垂直方向拖动一定距离 [验证点: 表格内容垂直移动]; 6. 观察【垂直偏移】显示值 (API: getActualScrollY) [验证点: 显示的垂直偏移数值与内容实际偏移一致]',
            expected_result: '屏幕上显示的水平偏移和垂直偏移数值与表格内容的实际滚动位置一致',
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

            Row() {
              Text('水平偏移: ' + this.displayScrollX)
                .fontSize(14)
                .fontColor('#666666')
                .layoutWeight(1)

              Text('垂直偏移: ' + this.displayScrollY)
                .fontSize(14)
                .fontColor('#666666')
                .layoutWeight(1)
            }
            .width('100%')
            .margin({ top: 8, bottom: 8 })

            Button('刷新偏移值')
              .id('btn_refresh_offset')
              .onClick(() => {
                this.displayScrollX = this.tableController.getActualScrollX();
                this.displayScrollY = this.tableController.getActualScrollY();
                this.result = 'getActualScrollX: ' + this.displayScrollX + ' | getActualScrollY: ' + this.displayScrollY;
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
