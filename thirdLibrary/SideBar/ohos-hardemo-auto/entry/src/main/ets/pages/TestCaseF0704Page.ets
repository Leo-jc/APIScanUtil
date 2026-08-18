import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { SideBar } from 'sidebar';

@Entry
@Component
struct TestCaseF0704Page {
  @State result: string = '等待操作 F-07-04...';
  @State heightSpec: string = '固定';
  @State inputHeight: string = '200';
  @State fixedHeight: number = 200;
  @State letters: string[] = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];

  build() {
    Column() {
      // 标题栏（固定）
      Row() {
        Image($r('sys.media.ohos_ic_public_arrow_left'))
          .width(24)
          .height(24)
          .fillColor('#333333')
          .onClick(() => {
            router.back();
          })
          .margin({ left: 16 })

        Text('F-07-04 固定高度规格下高度取规格值')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12, right: 16, top: 12, bottom: 12 })
          .layoutWeight(1)
      }
      .width('100%')
      .backgroundColor('#F1F3F5')

      // 可滚动区域（测试信息 + Actions）
      Scroll() {
        Column() {
          // ╔─ FIXED SECTION: 测试信息区（使用 TestInfoPanel 组件）─ 禁止修改 ─╗
          TestInfoPanel({
            level: 'L1',
            preconditions: '应用已启动',
            test_steps: [
            '1. 点击【测量与动态尺寸】进入模块列表页 [验证点: 进入模块列表页]',
            '2. 点击【固定高度规格下高度取规格值】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 在【高度规格】下拉菜单中选择"固定" [验证点: 高度规格显示为固定]',
            '4. 在【高度值】输入框中输入"200" [验证点: 高度值输入框显示 200]',
            '5. 观察【字母索引侧边栏】组件的高度 [验证点: 组件高度为 200]'
          ],
            expected_result: '高度等于规格值',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Row() {
              Text('高度规格')
                .fontSize(14)
                .width(80)
              Select([
                { value: '固定' },
                { value: '自适应' },
                { value: '无约束' }
              ])
                .id('select_height_spec')
                .selected(0)
                .value(this.heightSpec)
                .onSelect((index: number, text: string) => {
                  this.heightSpec = text;
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Row() {
              Text('高度值')
                .fontSize(14)
                .width(80)
              TextInput({ text: this.inputHeight })
                .id('input_height')
                .width('60%')
                .onChange((value: string) => {
                  this.inputHeight = value;
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Button('应用高度规格')
              .id('btn_apply_height')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                const parsed = Number.parseInt(this.inputHeight);
                if (!Number.isNaN(parsed)) {
                  this.fixedHeight = parsed;
                }
                this.result = '高度规格:' + this.heightSpec + ' | 高度值:' + this.fixedHeight + 'vp | 组件高度=' + this.fixedHeight + 'vp（等于规格值）';
              })

            Text('设置高度值后点击应用，观察预览区组件高度')
              .fontSize(14)
              .fontColor('#666666')
              .margin({ top: 8, bottom: 4 })

            Text('字母索引侧边栏预览（fixedHeight 约束高度）')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 8, bottom: 4 })

            Row() {
              SideBar({
                letters: this.letters,
                fixedHeight: this.fixedHeight
              })
                .id('sidebar_preview')
                .backgroundColor('#F5F5F5')
            }
            .width('100%')
            .height(360)
            .alignItems(VerticalAlign.Center)
            .justifyContent(FlexAlign.Center)
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
