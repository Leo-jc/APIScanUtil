import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { DotsIndicator, DotsIndicatorController, DotsOrientation, DotsGravity } from 'viewpagerdots';

@Entry
@Component
struct TestCaseF0108Page {
  @State result: string = '等待操作 F-01-08...';
  @State controller: DotsIndicatorController = new DotsIndicatorController();
  @State selectedIndex: number = 0;
  @State pageCount: number = 0;
  @State gravityVal: DotsGravity = DotsGravity.LEFT;
  @State gravityName: string = 'LEFT';

  aboutToAppear(): void {
    this.pageCount = 4;
    this.selectedIndex = 0;
    this.gravityVal = DotsGravity.LEFT;
    this.gravityName = 'LEFT';
  }

  private mapGravity(name: string): DotsGravity {
    switch (name) {
      case 'LEFT':
        return DotsGravity.LEFT;
      case 'RIGHT':
        return DotsGravity.RIGHT;
      case 'CENTER':
        return DotsGravity.CENTER;
      case 'START':
        return DotsGravity.START;
      case 'END':
        return DotsGravity.END;
      case 'FILL':
        return DotsGravity.FILL;
      default:
        return DotsGravity.CENTER;
    }
  }

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

        Text('F-01-08 指定自定义对齐方式后指示点条按指定方式对齐')
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
            test_steps: [
              '1. 点击【指示点条容器构造与初始化】进入模块列表页 [验证点: 成功进入模块列表页]',
              '2. 点击【指定自定义对齐方式后指示点条按指定方式对齐】进入用例详情页 [验证点: 成功进入用例详情页]',
              '3. 观察【指示点条】在容器内的对齐位置 [验证点: 点条整体按指定方式对齐]'
            ],
            expected_result: '指示点条整体在容器内按指定的对齐方式（如左对齐、右对齐、填充）排列',
            postconditions: ''
          })

          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Row() {
              Text('对齐方式')
                .fontSize(14)
                .width(80)

              Select([
                { value: 'LEFT' },
                { value: 'RIGHT' },
                { value: 'CENTER' },
                { value: 'START' },
                { value: 'END' },
                { value: 'FILL' }
              ])
                .id('select_gravity')
                .selected(0)
                .value(this.gravityName)
                .layoutWeight(1)
                .onSelect((index: number, value: string) => {
                  this.gravityVal = this.mapGravity(value);
                  this.gravityName = value;
                  this.result = '对齐: gravity=' + value + ' → 点条整体按' + value + '对齐';
                })
            }
            .width('100%')
          }
          .padding({ left: 12, right: 12, top: 12, bottom: 12 })
          .width('100%')

          Column() {
            Text('指示点条预览')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ bottom: 8 })

            DotsIndicator({
              controller: this.controller,
              selectedIndex: this.selectedIndex,
              pageCount: this.pageCount,
              gravity: this.gravityVal
            })
              .width('100%')
              .height(60)
              .backgroundColor('#FFFFFF')
              .borderRadius(8)
              .padding({ top: 12, bottom: 12 })
          }
          .padding({ left: 12, right: 12, top: 4, bottom: 12 })
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
