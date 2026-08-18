import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { SideBar, SideBarListener } from 'sidebar';

@Entry
@Component
struct TestCaseF0602Page {
  @State result: string = '等待操作 F-06-02...';
  @State isBound: boolean = false;
  @State inputLetters: string = 'A,B,C';
  @State letters: string[] = [];
  @State touchState: string = '未触发';
  @State selectedPos: number = -1;
  @State selectedValue: string = '无';

  private listener: SideBarListener | null = null;

  aboutToAppear(): void {
    this.listener = {
      onSideTouchState: (isTouch: boolean): void => {
        this.touchState = isTouch ? '开始(true)' : '结束(false)';
        this.updateResult();
      },
      onSideSelected: (position: number, currentY: number, selectedValue: string): void => {
        this.selectedPos = position;
        this.selectedValue = selectedValue;
        this.updateResult();
      }
    } as SideBarListener;
  }

  private updateResult(): void {
    this.result = '绑定状态:' + (this.isBound ? '已绑定' : '已清除') + ' | 触摸态:' + this.touchState + ' | 选中项: pos=' + this.selectedPos + ', value=' + this.selectedValue + ' | ' + (!this.isBound ? '触摸高亮仍有变化，宿主无任何通知' : '已绑定，有通知');
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

        Text('F-06-02 清除回调后触摸仅产生视觉变化不再通知')
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
            '1. 点击【交互通知绑定】进入模块列表页 [验证点: 进入模块列表页]',
            '2. 点击【清除回调后触摸仅产生视觉变化不再通知】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 点击【绑定回调】开关开启后再点击关闭以清除回调 [验证点: 绑定回调开关处于关闭状态]',
            '4. 在【字母列表】输入框中输入"A,B,C" [验证点: 字母列表输入框显示输入内容]',
            '5. 在【字母索引侧边栏】组件上按压第二个字母后抬起 [验证点: 触发触摸交互]',
            '6. 观察【字母索引侧边栏】组件与【触摸态】【选中项】文本 [验证点: 高亮仍有变化，触摸态与选中项文本无更新]'
          ],
            expected_result: '触摸高亮仍变化，宿主无任何通知',
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
              Text('绑定回调')
                .fontSize(14)
                .width(80)
              Toggle({ type: ToggleType.Switch, isOn: this.isBound })
                .id('toggle_bind_callback')
                .onChange((isOn: boolean) => {
                  this.isBound = isOn;
                  this.updateResult();
                })
            }
            .width('100%')
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
                this.updateResult();
              })

            Text('请先开启再关闭绑定回调开关，设置字母列表后按压第二个字母(B)')
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
                callbackEnabled: this.isBound,
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
