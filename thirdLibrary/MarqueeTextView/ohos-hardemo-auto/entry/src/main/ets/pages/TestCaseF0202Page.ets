import { router, display } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { MarqueeTextView, MarqueeTextViewController } from 'marquee_text_view';

@Entry
@Component
struct TestCaseF0202Page {
  @State result: string = '等待启动 F-02-02...';
  @State inputText: string = '速率归一化测试文本 MarqueeTextView';
  @State currentFps: number = 60;
  @State speed: number = 0.5;
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

        Text('F-02-02 不同刷新率设备上每秒滚动距离一致')
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
            '1. 点击【帧驱动滚动动画与速率归一化】进入模块列表页 [验证点: 已进入帧驱动滚动动画模块列表页]',
            '2. 点击【不同刷新率设备上每秒滚动距离一致】进入用例详情页 [验证点: 已进入速率归一用例详情页]',
            '3. 在【文本内容】输入框中输入文本 [验证点: 文本已填入输入框]',
            '4. 点击【启动滚动】按钮 [验证点: 滚动已启动]',
            '5. 在 60Hz 设备上等待 5 秒并记录【位移距离】文本 [验证点: 已记录 60Hz 设备位移距离]',
            '6. 在 90Hz 设备上重复操作并记录【位移距离】文本 [验证点: 已记录 90Hz 设备位移距离]',
            '7. 在 120Hz 设备上重复操作并记录【位移距离】文本 [验证点: 已记录 120Hz 设备位移距离]',
            '8. 对比三次【位移距离】数值 [验证点: 三次位移距离数值接近一致]'
          ],
            expected_result: '60Hz、90Hz、120Hz 不同刷新率设备上每秒滚动距离一致（误差在可接受范围）。',
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
              .id('input_text_f0202')
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((value: string) => {
                this.inputText = value;
              })

            Text('滚动速度(vp/帧)')
              .fontSize(14)
              .fontColor('#333333')
              .width('100%')
              .margin({ bottom: 4 })

            TextInput({ text: String(this.speed) })
              .id('input_speed_f0202')
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((value: string) => {
                const parsed: number = parseFloat(value);
                if (!isNaN(parsed) && parsed >= 0) {
                  this.speed = parsed;
                }
              })

            Button('启动滚动')
              .id('btn_start_f0202')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.controller.startScroll();
                this.result = '滚动已启动。当前设备刷新率: ' + this.currentFps + 'Hz\nHAR 速率归一: 每秒位移 = 60 × speed = ' + (60 * this.speed) + ' vp（与刷新率无关，跨设备一致）。';
              })

            Button('记录当前位移')
              .id('btn_record_f0202')
              .width('100%')
              .onClick(() => {
                const lx: number = this.controller.getLeftX();
                this.result = '当前设备刷新率: ' + this.currentFps + 'Hz | 当前位移 leftX=' + lx + ' vp\n归一化每秒距离: ' + (60 * this.speed) + ' vp（60/90/120Hz 设备理论一致，需多设备实测）。';
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
                speed: this.speed,
                fontColor: '#333333'
              })
                .width('100%')
                .id('preview_marquee_f0202')
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
