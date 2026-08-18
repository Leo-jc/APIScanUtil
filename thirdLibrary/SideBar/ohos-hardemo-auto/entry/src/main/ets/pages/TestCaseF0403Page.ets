import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { SideBar, SideBarListener } from 'sidebar';

@Entry
@Component
struct TestCaseF0403Page {
  @State result: string = '等待操作 F-04-03...';
  @State inputLetters: string = 'A,B,C,D,E';
  @State letters: string[] = [];
  @State touchState: string = '未触发';
  @State selectedPos: number = -1;
  @State selectedValue: string = '无';

  private listener: SideBarListener | null = null;

  aboutToAppear(): void {
    this.listener = {
      onSideTouchState: (isTouch: boolean): void => {
        this.touchState = isTouch ? '开始(true)' : '结束(false)';
        this.result = '触摸态:' + this.touchState + ' | ' + (this.touchState.indexOf('结束') >= 0 ? '无高亮残留，宿主收到触摸结束通知' : '按压中...');
      },
      onSideSelected: (position: number, currentY: number, selectedValue: string): void => {
        this.selectedPos = position;
        this.selectedValue = selectedValue;
        this.result = '触摸态:' + this.touchState + ' | ' + (this.touchState.indexOf('结束') >= 0 ? '无高亮残留，宿主收到触摸结束通知' : '按压中...');
      }
    } as SideBarListener;
  }

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

        Text('F-04-03 抬起或取消时清除高亮并通知触摸结束')
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
            '1. 点击【触摸滑动选择交互】进入模块列表页 [验证点: 进入模块列表页]',
            '2. 点击【抬起或取消时清除高亮并通知触摸结束】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 在【字母列表】输入框中输入"A,B,C,D,E" [验证点: 字母列表输入框显示输入内容]',
            '4. 在【字母索引侧边栏】组件上按压第三个字母后抬起手指 [验证点: 高亮被清除]',
            '5. 观察【字母索引侧边栏】组件与【触摸态】文本 [验证点: 触摸态显示结束]'
          ],
            expected_result: '无高亮残留，宿主收到触摸结束通知',
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
                this.result = 'setLetters([' + this.letters.join(',') + ']) → ' + this.letters.length + '个字母已加载，请在预览区按压第三个字母后抬起手指';
              })

            Text('请在预览区按压第三个字母后抬起手指')
              .fontSize(14)
              .fontColor('#666666')
              .margin({ top: 8, bottom: 4 })

            Text('字母索引侧边栏预览（请在组件上按压/滑动测试）')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 8, bottom: 4 })

            Row() {
              SideBar({
                letters: this.letters,
                onSideBarListener: this.listener
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
