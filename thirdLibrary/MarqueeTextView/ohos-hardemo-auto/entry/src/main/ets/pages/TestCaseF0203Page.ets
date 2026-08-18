import { router, display } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { MarqueeTextView, MarqueeTextViewController } from 'marquee_text_view';

@Entry
@Component
struct TestCaseF0203Page {
  @State result: string = '等待启动 F-02-03...';
  @State inputText: string = '刷新率读取时机测试 MarqueeTextView';
  @State startFps: number = 0;
  @State currentFps: number = 60;
  private controller: MarqueeTextViewController = new MarqueeTextViewController();

  aboutToAppear(): void {
    try {
      this.currentFps = display.getDefaultDisplaySync().refreshRate;
    } catch (e) {
      this.currentFps = 60;
    }
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

        Text('F-02-03 滚动启动时读取刷新率作为速率基准，运行中刷新率变化不影响当前速率')
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
            '1. 点击【帧驱动滚动动画与速率归一化】进入模块列表页 [验证点: 已进入帧驱动滚动动画模块列表页]',
            '2. 点击【滚动启动时读取刷新率作为速率基准，运行中刷新率变化不影响当前速率】进入用例详情页 [验证点: 已进入刷新率读取时机用例详情页]',
            '3. 在【文本内容】输入框中输入文本 [验证点: 文本已填入输入框]',
            '4. 点击【启动滚动】按钮 [验证点: 滚动已启动]',
            '5. 等待 3 秒后切换设备刷新率（如由 60Hz 切换至 90Hz） [验证点: 设备刷新率已切换]',
            '6. 等待 3 秒 [验证点: 滚动继续进行]',
            '7. 观察【位移距离】文本变化 [验证点: 当前滚动速率未随切换变化]'
          ],
            expected_result: '运行中刷新率切换后，当前滚动速率不随之变化（仅启动时读取一次基准）。',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('文本内容')
              .fontSize(14)
              .fontColor('#333333')
              .width('100%')
              .margin({ bottom: 4 })

            TextInput({ placeholder: '输入文本', text: this.inputText })
              .id('input_text_f0203')
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((value: string) => {
                this.inputText = value;
              })

            Button('启动滚动')
              .id('btn_start_f0203')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.startFps = display.getDefaultDisplaySync().refreshRate;
                this.currentFps = this.startFps;
                this.controller.startScroll();
                this.result = '滚动已启动。启动时读取基准刷新率: ' + this.startFps + 'Hz（HAR 仅 startScroll 时读一次，运行中不随系统刷新率变化）。';
              })

            Button('查询当前系统刷新率')
              .id('btn_query_fps_f0203')
              .width('100%')
              .onClick(() => {
                const now: number = display.getDefaultDisplaySync().refreshRate;
                this.currentFps = now;
                this.result = '启动时基准: ' + this.startFps + 'Hz | 当前系统刷新率: ' + now + 'Hz\nHAR 运行中不重新读取，速率保持启动时基准（需切换系统刷新率实测验证）。';
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
              MarqueeTextView({
                text: this.inputText,
                controller: this.controller,
                autoStart: false,
                fontSize: 24,
                space: 60,
                fontColor: '#333333'
              })
                .width('100%')
                .id('preview_marquee_f0203')
            }
            .backgroundColor('#FFFFFF')
            .border({ width: 1, color: '#E0E0E0' })
            .borderRadius(8)
            .padding(8)
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
