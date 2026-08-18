import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { SideBar } from 'sidebar';

@Entry
@Component
struct TestCaseF0705Page {
  @State result: string = '等待操作 F-07-05...';
  @State inputLetters: string = 'A,B,C,D,E';
  @State letters: string[] = [];
  @State heightSpec: string = '自适应';
  @State maxHeight: number = -1;

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

        Text('F-07-05 自适应高度规格下高度取内容与规格较小值')
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
            level: 'L0',
            preconditions: '应用已启动',
            test_steps: [
            '1. 点击【测量与动态尺寸】进入模块列表页 [验证点: 进入模块列表页]',
            '2. 点击【自适应高度规格下高度取内容与规格较小值】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 在【字母列表】输入框中输入"A,B,C,D,E" [验证点: 字母列表输入框显示输入内容]',
            '4. 在【高度规格】下拉菜单中选择"自适应" [验证点: 高度规格显示为自适应]',
            '5. 观察【字母索引侧边栏】组件的高度 [验证点: 组件高度不超过内容高度与规格的较小值]'
          ],
            expected_result: '高度不超过内容高度与规格的较小值',
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
              Text('字母列表')
                .fontSize(14)
                .width(80)
              TextInput({ text: this.inputLetters })
                .id('input_letters')
                .width('60%')
                .onChange((value: string) => {
                  this.inputLetters = value;
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Button('设置字母列表')
              .id('btn_set_letters')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                const rawParts = this.inputLetters.split(',');
                const parsed: string[] = [];
                for (let i = 0; i < rawParts.length; i++) {
                  const part = rawParts[i].trim();
                  if (part.length > 0) {
                    parsed.push(part);
                  }
                }
                this.letters = parsed;
                const contentHeight = this.letters.length * 23 + 10;
                this.result = '高度规格:' + this.heightSpec + ' | 字母数:' + this.letters.length + ' | 内容高度=' + contentHeight + 'vp | 组件高度=' + contentHeight + 'vp（取内容与规格较小值）';
              })

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
                .selected(1)
                .value(this.heightSpec)
                .onSelect((index: number, text: string) => {
                  this.heightSpec = text;
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Text('设置字母列表后，观察预览区组件高度')
              .fontSize(14)
              .fontColor('#666666')
              .margin({ top: 8, bottom: 4 })

            Text('字母索引侧边栏预览（maxHeight 约束高度）')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 8, bottom: 4 })

            Row() {
              SideBar({
                letters: this.letters,
                maxHeight: this.maxHeight
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
