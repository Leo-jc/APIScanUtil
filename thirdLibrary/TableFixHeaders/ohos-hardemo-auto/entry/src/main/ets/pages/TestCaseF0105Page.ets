import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { TableFixHeaders, TableAdapter, BaseTableAdapter } from 'tablefixheaders';
import { BigTableAdapter } from './MockAdapters';

@Entry
@Component
struct TestCaseF0105Page {
  @State result: string = '等待操作 F-01-05...';
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

        Text('F-01-05 快速滑动后松开表格有惯性滑动效果')
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
            test_steps: '1. 点击【TableFixHeaders 双向滚动固定表头表格控件】进入模块列表页 [验证点: 页面显示表格控件模块的测试用例列表]; 2. 点击【快速滑动后松开表格有惯性滑动效果】进入用例详情页 [验证点: 页面显示表格演示区域和操作控件]; 3. 在表格区域快速滑动后松开手指 (API: 惯性滑动处理) [验证点: 表格内容继续沿滑动方向平滑滚动]; 4. 等待 2 秒 [验证点: 表格内容逐渐减速并停止，滚动过程平滑无突然中断]',
            expected_result: '松开手指后表格内容继续沿滑动方向平滑滚动并逐渐减速停止，不突然中断',
            postconditions: ''
          })

          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            if (this.showTable) {
              TableFixHeaders({ adapter: this.adapter })
            } else {
              Column() {
                Text('表格未加载，请点击下方按钮配置数据并启动')
                  .fontSize(13)
                  .fontColor('#999999')
                  .textAlign(TextAlign.Center)
                  .width('100%')
                  .padding(16)
              }
              .width('100%')
              .height(100)
              .justifyContent(FlexAlign.Center)
            }

            Button('配置数据并启动')
              .id('btn_configure_data')
              .onClick(() => {
                this.adapter = new BigTableAdapter();
                this.showTable = true;
                this.result = 'adapter已设置(BigTableAdapter: 20行×10列). 请触摸表格区域快速滑动后松手，观察惯性滑动效果。注意：等待2秒后表格内容应逐渐减速并停止，滚动过程平滑无突然中断。';
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
