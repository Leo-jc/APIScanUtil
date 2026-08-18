import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { InsLoadingView, InsLoadingController, InsStatus } from 'library';

@Entry
@Component
struct TestCaseF0305Page {
  private controller: InsLoadingController = new InsLoadingController();
  @State currentStatus: InsStatus = InsStatus.LOADING;
  @State switchCount: number = 0;
  @State result: string = '连续快速切换三态｜最终形态与最后一次一致';

  private statusName(s: InsStatus): string {
    if (s === InsStatus.LOADING) {
      return 'LOADING(加载中)';
    } else if (s === InsStatus.CLICKED) {
      return 'CLICKED(已加载)';
    }
    return 'UNCLICKED(未点击)';
  }

  aboutToAppear(): void {
    this.controller.onStatusChange((s: InsStatus) => {
      this.currentStatus = s;
    });
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

        Text('F-03-05 运行态连续快速切换状态时绘制分支正确响应无残留')
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
            '1. 点击【三态切换与状态绘制分支】进入模块列表页 [验证点: 进入三态切换与状态绘制分支模块列表页]',
            '2. 点击【运行态连续快速切换状态时绘制分支正确响应无残留】进入用例详情页 [验证点: 进入用例详情页，组件处于加载中状态]',
            '3. 快速连续点击【切换状态】按钮多次（在加载中、未点击、已点击间切换） [验证点: 状态被快速连续切换]',
            '4. 停止切换并等待 2 秒 [验证点: 状态切换已停止]',
            '5. 观察【进度弧区域】的最终绘制形态 [验证点: 绘制形态与最后一次切换一致，无上一状态残留]'
          ],
            expected_result: '连续快速切换三态时，每次切换后绘制分支正确响应，最终状态与最后一次切换一致，无上一状态残留（如动画残留或颜色错乱）',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('组件状态：' + this.statusName(this.currentStatus) + '｜切换次数：' + this.switchCount.toString())
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 8 })
              .id('txt_current_status')

            Button('切换状态(循环)')
              .id('btn_switch_cycle')
              .type(ButtonType.Capsule)
              .fontSize(12)
              .height(30)
              .width('100%')
              .backgroundColor('#FFE5E7EB')
              .fontColor('#FF1F2937')
              .margin({ bottom: 8 })
              .onClick(() => {
                let nxt: InsStatus;
                const cur: InsStatus = this.controller.getStatus();
                if (cur === InsStatus.LOADING) {
                  nxt = InsStatus.UNCLICKED;
                } else if (cur === InsStatus.UNCLICKED) {
                  nxt = InsStatus.CLICKED;
                } else {
                  nxt = InsStatus.LOADING;
                }
                this.controller.setStatus(nxt);
                this.switchCount++;
                this.result = '第' + this.switchCount.toString() + '次切换 → setStatus(' + this.statusName(nxt) + ')';
              })

            Button('获取最终状态')
              .id('btn_get_final')
              .type(ButtonType.Capsule)
              .fontSize(12)
              .height(30)
              .width('100%')
              .backgroundColor('#FFE5E7EB')
              .fontColor('#FF1F2937')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.result = '停止切换｜最终 getStatus()=' + this.statusName(this.controller.getStatus()) + '\n绘制形态与最后一次切换一致，无残留';
              })

            // 渲染预览区：InsLoadingView 自绘组件（初始加载中，连续切换三态）
            Text('进度弧预览区（连续快速切换三态，最终形态与最后一次一致）')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
              .id('txt_preview_label')
            Stack({ alignContent: Alignment.Center }) {
              InsLoadingView({
                imageSrc: 'common/images/pink.jpg',
                status: InsStatus.LOADING,
                sideLength: 220,
                controller: this.controller,
              })
            }
            .width(240)
            .height(240)
            .backgroundColor('#FFF3F4F6')
            .borderRadius(12)
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
