import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { InsLoadingView, InsLoadingController, InsStatus } from 'library';

@Entry
@Component
struct TestCaseF0203Page {
  private controller: InsLoadingController = new InsLoadingController();
  @State startColorLabel: string = '粉 #FFF700C2';
  @State endColorLabel: string = '黄 #FFFFD900';
  @State result: string = '起始色 #FFF700C2｜结束色 #FFFFD900｜弧带即时渐变';

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

        Text('F-02-03 运行态修改渐变起止颜色后弧带颜色即时刷新')
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
            '1. 点击【外围渐变进度弧绘制】进入模块列表页 [验证点: 进入外围渐变进度弧绘制模块列表页]',
            '2. 点击【运行态修改渐变起止颜色后弧带颜色即时刷新】进入用例详情页 [验证点: 进入用例详情页，组件处于加载中状态且进度弧正在运行]',
            '3. 在【起始颜色】选择器中选择红色 [验证点: 起始颜色已更换为红色]',
            '4. 在【结束颜色】选择器中选择蓝色 [验证点: 结束颜色已更换为蓝色]',
            '5. 观察【进度弧区域】弧带颜色变化 [验证点: 弧带颜色立即按新颜色刷新，渐变方向从红色到蓝色]'
          ],
            expected_result: '运行态修改渐变起止颜色后，弧带颜色立即按新颜色刷新，无需重启动画，渐变效果从起始色到结束色连续过渡',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('起始颜色（setStartColor，选择即时刷新）')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
            Select([
              { value: '红 #FFEF4444' },
              { value: '蓝 #FF3B82F6' },
              { value: '绿 #FF22C55E' },
              { value: '黄 #FFFFD900' },
              { value: '粉 #FFF700C2' },
            ])
              .id('sel_start_color')
              .selected(4)
              .value(this.startColorLabel)
              .onSelect((index: number, value: string) => {
                const parts: string[] = value.split(' ');
                const hex: string = parts[1];
                this.controller.setStartColor(hex);
                this.startColorLabel = value;
                this.result = 'setStartColor(' + hex + ') → 弧带颜色即时刷新';
              })
              .width('100%')
              .margin({ bottom: 8 })

            Text('结束颜色（setEndColor，选择即时刷新）')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
            Select([
              { value: '红 #FFEF4444' },
              { value: '蓝 #FF3B82F6' },
              { value: '绿 #FF22C55E' },
              { value: '黄 #FFFFD900' },
              { value: '粉 #FFF700C2' },
            ])
              .id('sel_end_color')
              .selected(3)
              .value(this.endColorLabel)
              .onSelect((index: number, value: string) => {
                const parts: string[] = value.split(' ');
                const hex: string = parts[1];
                this.controller.setEndColor(hex);
                this.endColorLabel = value;
                this.result = 'setEndColor(' + hex + ') → 弧带颜色即时刷新';
              })
              .width('100%')
              .margin({ bottom: 8 })

            // 渲染预览区：InsLoadingView 自绘组件（LOADING 态，运行态改色即时刷新）
            Text('进度弧预览区（LOADING 态：选择颜色后弧带渐变即时刷新）')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
            Stack({ alignContent: Alignment.Center }) {
              InsLoadingView({
                imageSrc: 'common/images/pink.jpg',
                status: InsStatus.LOADING,
                startColor: '#FFF700C2',
                endColor: '#FFFFD900',
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
