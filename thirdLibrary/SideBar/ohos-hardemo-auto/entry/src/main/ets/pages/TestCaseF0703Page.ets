import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { SideBar } from 'sidebar';

@Entry
@Component
struct TestCaseF0703Page {
  @State result: string = '等待操作 F-07-03...';
  @State widthSpec: string = '无约束';
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

        Text('F-07-03 无约束宽度规格下宽度取默认值')
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
            '2. 点击【无约束宽度规格下宽度取默认值】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 在【宽度规格】下拉菜单中选择"无约束" [验证点: 宽度规格显示为无约束]',
            '4. 观察【字母索引侧边栏】组件的宽度 [验证点: 组件宽度为默认 75]'
          ],
            expected_result: '宽度等于默认 75',
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
              Text('宽度规格')
                .fontSize(14)
                .width(80)
              Select([
                { value: '固定' },
                { value: '自适应' },
                { value: '无约束' }
              ])
                .id('select_width_spec')
                .selected(2)
                .value(this.widthSpec)
                .onSelect((index: number, text: string) => {
                  this.widthSpec = text;
                  this.result = '宽度规格:' + this.widthSpec + ' | 组件宽度=75vp（默认值）';
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Text('选择宽度规格后，观察预览区组件宽度')
              .fontSize(14)
              .fontColor('#666666')
              .margin({ top: 8, bottom: 4 })

            Text('字母索引侧边栏预览（外层容器约束宽度）')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 8, bottom: 4 })

            Row() {
              Row() {
                SideBar({
                  letters: this.letters
                })
                  .id('sidebar_preview')
                  .backgroundColor('#F5F5F5')
              }
              .width(75)
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
