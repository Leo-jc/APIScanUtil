import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { TableFixHeaders, TableAdapter, BaseTableAdapter, TableFixHeadersController } from 'tablefixheaders';
import { BigTableAdapter } from './MockAdapters';

@Entry
@Component
struct TestCaseF0106Page {
  @State result: string = '等待操作 F-01-06...';
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

        Text('F-01-06 滚动到任意方向边界时显示渐变阴影提示')
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
            test_steps: '1. 点击【TableFixHeaders 双向滚动固定表头表格控件】进入模块列表页 [验证点: 页面显示表格控件模块的测试用例列表]; 2. 点击【滚动到任意方向边界时显示渐变阴影提示】进入用例详情页 [验证点: 页面显示表格演示区域和操作控件]; 3. 将表格滚动到左侧边界 (API: 边界阴影绘制) [验证点: 左侧边缘出现渐变阴影]; 4. 将表格滚动到右侧边界 [验证点: 右侧边缘出现渐变阴影]; 5. 将表格滚动到顶部边界 [验证点: 顶部边缘出现渐变阴影]; 6. 将表格滚动到底部边界 [验证点: 底部边缘出现渐变阴影]',
            expected_result: '滚动到左侧边界时左侧出现阴影，右侧边界时右侧出现阴影，顶部边界时顶部出现阴影，底部边界时底部出现阴影',
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

            Text('请使用触摸拖拽将表格滚动到各方向边界，观察边缘是否出现渐变阴影')
              .fontSize(13)
              .fontColor('#666666')
              .textAlign(TextAlign.Start)
              .width('100%')
              .padding(8)

            Button('滚动到左侧边界')
              .id('btn_scroll_left')
              .onClick(() => {
                this.tableController.scrollTo(0, this.tableController.getActualScrollY());
                this.result = 'scrollTo(0, 当前Y): 已执行。请观察表格左侧边缘是否出现渐变阴影提示。';
              })
              .width('100%')
              .margin({ bottom: 8 })

            Button('滚动到右侧边界')
              .id('btn_scroll_right')
              .onClick(() => {
                this.tableController.scrollTo(99999, this.tableController.getActualScrollY());
                this.result = 'scrollTo(最大X, 当前Y): 已执行。请观察表格右侧边缘是否出现渐变阴影提示。';
              })
              .width('100%')
              .margin({ bottom: 8 })

            Button('滚动到顶部边界')
              .id('btn_scroll_top')
              .onClick(() => {
                this.tableController.scrollTo(this.tableController.getActualScrollX(), 0);
                this.result = 'scrollTo(当前X, 0): 已执行。请观察表格顶部边缘是否出现渐变阴影提示。';
              })
              .width('100%')
              .margin({ bottom: 8 })

            Button('滚动到底部边界')
              .id('btn_scroll_bottom')
              .onClick(() => {
                this.tableController.scrollTo(this.tableController.getActualScrollX(), 99999);
                this.result = 'scrollTo(当前X, 最大Y): 已执行。请观察表格底部边缘是否出现渐变阴影提示。';
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
