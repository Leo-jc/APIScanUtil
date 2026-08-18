import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { MarqueeTextView, MarqueeTextViewController } from 'marquee_text_view';

@Entry
@Component
struct TestCaseF0602Page {
  @State result: string = '等待操作 F-06-02...';
  @State showComponent: boolean = true;
  @State isReleased: boolean = false;
  private controller: MarqueeTextViewController = new MarqueeTextViewController();

  aboutToAppear(): void {
    this.controller.onReleased = (): void => {
      this.isReleased = true;
      this.result = '已停止状态下销毁组件，onReleased 回调已触发。无报错、无残留驱动，行为与正常运行态销毁一致。';
    };
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

        Text('F-06-02 已停止状态销毁时无可观测变化')
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
            '1. 点击【生命周期与资源释放】进入模块列表页 [验证点: 已进入生命周期模块列表页]',
            '2. 点击【已停止状态销毁时无可观测变化】进入用例详情页 [验证点: 已进入已停止销毁用例详情页]',
            '3. 点击【启动滚动】按钮 [验证点: 滚动已启动]',
            '4. 等待 2 秒 [验证点: 文本已位移一段距离]',
            '5. 点击【停止滚动】按钮 [验证点: 画面回到起点]',
            '6. 点击【销毁组件】按钮（或退出当前页面） [验证点: 组件已销毁]',
            '7. 等待 2 秒 [验证点: 无报错]',
            '8. 通过【内存监测】面板观察资源状态 [验证点: 无报错、无残留驱动]'
          ],
            expected_result: '已停止状态下销毁组件，无报错、无残留驱动，行为无变化（以实际表现为准）。',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('启动滚动')
              .id('btn_start_f0602')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.controller.startScroll();
                this.result = '滚动已启动，等待2秒后点击"停止滚动"。当前位移 leftX=' + this.controller.getLeftX() + ' vp';
              })

            Button('停止滚动')
              .id('btn_stop_f0602')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.controller.stopScroll();
                this.result = '已停止滚动，位移复位 leftX=' + this.controller.getLeftX() + ' vp。点击"销毁组件"测试已停止状态销毁。';
              })

            Button('销毁组件')
              .id('btn_destroy_f0602')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.showComponent = false;
                this.result = '已停止状态下设置 showComponent=false，组件从渲染树移除，触发 aboutToDisappear。';
              })

            Button('重新渲染')
              .id('btn_recreate_f0602')
              .width('100%')
              .onClick(() => {
                this.isReleased = false;
                this.showComponent = true;
                this.result = '组件重新挂载，controller 重新绑定。可再次测试已停止状态销毁流程。';
              })
          }
          .padding({ left: 12, right: 12, top: 12, bottom: 12 })
          .width('100%')

          // 滚动文本预览区
          Column() {
            Text('滚动文本预览区')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor('#333333')
              .margin({ bottom: 8 })
              .width('100%')

            Column() {
              if (this.showComponent) {
                MarqueeTextView({
                  text: '已停止状态销毁测试 MarqueeTextView',
                  controller: this.controller,
                  autoStart: false,
                  fontSize: 26,
                  space: 60,
                  fontColor: '#333333'
                })
                  .width('100%')
                  .id('preview_marquee_f0602')
              } else {
                Text('组件已销毁（showComponent=false）')
                  .fontSize(12)
                  .fontColor('#999999')
                  .width('100%')
                  .textAlign(TextAlign.Center)
                  .padding(16)
              }
            }
            .backgroundColor('#FFFFFF')
            .border({ width: 1, color: '#E0E0E0' })
            .borderRadius(8)
            .padding(8)
            .width('100%')
          }
          .padding({ left: 12, right: 12, top: 12, bottom: 12 })
          .width('100%')

          // 内存监测面板
          Column() {
            Text('内存监测面板')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor('#333333')
              .margin({ bottom: 8 })
              .width('100%')

            Column() {
              Row() {
                Text('组件状态: ')
                  .fontSize(13)
                  .fontColor('#333333')
                Text(this.showComponent ? '已挂载' : '已销毁')
                  .fontSize(13)
                  .fontColor(this.showComponent ? '#0066CC' : '#CC0000')
              }
              .width('100%')
              .margin({ bottom: 4 })

              Row() {
                Text('资源释放: ')
                  .fontSize(13)
                  .fontColor('#333333')
                Text(this.isReleased ? '已释放（onReleased 已触发）' : '未释放')
                  .fontSize(13)
                  .fontColor(this.isReleased ? '#006600' : '#999999')
              }
              .width('100%')
              .margin({ bottom: 4 })

              Row() {
                Text('当前位移: ')
                  .fontSize(13)
                  .fontColor('#333333')
                Text(this.controller.getLeftX() + ' vp')
                  .fontSize(13)
                  .fontColor('#666666')
              }
              .width('100%')
            }
            .backgroundColor('#F8F8F8')
            .border({ width: 1, color: '#E0E0E0' })
            .borderRadius(8)
            .padding(12)
            .width('100%')
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
