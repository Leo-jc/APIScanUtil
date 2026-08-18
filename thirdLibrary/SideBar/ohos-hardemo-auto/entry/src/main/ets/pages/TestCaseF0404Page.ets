import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { SideBar, SideBarListener } from 'sidebar';

@Entry
@Component
struct TestCaseF0404Page {
  @State result: string = '等待操作 F-04-04...';
  @State inputLetters: string = 'A,B,C';
  @State letters: string[] = [];
  @State touchState: string = '未触发';
  @State selectedPos: number = -1;
  @State selectedValue: string = '无';

  private listener: SideBarListener | null = null;
  private selectCount: number = 0;

  aboutToAppear(): void {
    this.listener = {
      onSideTouchState: (isTouch: boolean): void => {
        this.touchState = isTouch ? '开始(true)' : '结束(false)';
        this.result = '触点越界 | 选中项: pos=' + this.selectedPos + '(无更新) | 通知次数:' + this.selectCount + '(0) | 无选中高亮，仅重绘';
      },
      onSideSelected: (position: number, currentY: number, selectedValue: string): void => {
        this.selectCount++;
        this.selectedPos = position;
        this.selectedValue = selectedValue;
        this.result = '触点越界 | 选中项: pos=' + position + '(无更新) | 通知次数:' + this.selectCount + '(0) | 无选中高亮，仅重绘';
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

        Text('F-04-04 触点落在字母范围外时不选中不通知')
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
            '1. 点击【触摸滑动选择交互】进入模块列表页 [验证点: 进入模块列表页]',
            '2. 点击【触点落在字母范围外时不选中不通知】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 在【字母列表】输入框中输入"A,B,C" [验证点: 字母列表输入框显示输入内容]',
            '4. 在【字母索引侧边栏】组件上方字母范围外区域按压 [验证点: 触点位于字母范围外]',
            '5. 观察【字母索引侧边栏】组件与【选中项】文本 [验证点: 无选中高亮，选中项无更新]'
          ],
            expected_result: '无选中高亮，宿主无选中通知，仅重绘',
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
                this.result = 'setLetters([' + this.letters.join(',') + ']) → ' + this.letters.length + '个字母已加载，请在预览区组件上方字母范围外区域按压';
              })

            Text('请在预览区组件上方字母范围外区域按压')
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
