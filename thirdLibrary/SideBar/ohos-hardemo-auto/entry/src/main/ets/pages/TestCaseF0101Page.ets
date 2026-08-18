import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { SideBar } from 'sidebar';

@Entry
@Component
struct TestCaseF0101Page {
  @State result: string = '默认样式已加载，观察预览区字母渲染';
  @State letters: string[] = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
    'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
  ];
  @State textColor: string = '#000000';
  @State pressedTextColor: string = '#888888';
  @State pressedTextBgColor: string = '#00000000';
  @State textSize: number = 13;
  @State itemSpacing: number = 10;
  @State itemHeight: number = -1;

  aboutToAppear(): void {
    this.result = '默认配置: 未选中色=#000000, 选中色=#888888, 选中背景=#00000000(透明), 字号=13vp, 间距=10vp, 项高=回退13vp';
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

        Text('F-01-01 使用默认样式呈现字母索引')
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
            '1. 点击【组件构造与样式配置】进入模块列表页 [验证点: 进入模块列表页]',
            '2. 点击【使用默认样式呈现字母索引】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 保持各样式输入框为空，观察【字母索引侧边栏】组件的字母渲染外观 [验证点: 字母以默认未选中色、默认字号、默认间距纵向排列]'
          ],
            expected_result: '字母以默认未选中色、默认字号、默认间距渲染，外观与默认配置一致',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('加载默认样式')
              .id('btn_load_default')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.result = '默认配置: 未选中色=#000000, 选中色=#888888, 选中背景=#00000000(透明), 字号=13vp, 间距=10vp, 项高=回退13vp';
              })

            Text('字母索引侧边栏预览')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 8, bottom: 4 })

            Row() {
              SideBar({
                letters: this.letters,
                textColor: this.textColor,
                pressedTextColor: this.pressedTextColor,
                pressedTextBgColor: this.pressedTextBgColor,
                textSize: this.textSize,
                itemSpacing: this.itemSpacing,
                itemHeight: this.itemHeight
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
