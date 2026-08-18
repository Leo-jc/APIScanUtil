import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { InsLoadingView, InsLoadingController, InsStatus } from 'library';

@Entry
@Component
struct TestCaseF0304Page {
  private controller: InsLoadingController = new InsLoadingController();
  @State initialStatus: InsStatus = InsStatus.UNCLICKED;
  @State initialStatusLabel: string = '未点击';
  @State mountKey: number = 0;
  @State result: string = '构造期 status=UNCLICKED｜组件初始显示完整渐变静态圆环';

  private statusName(s: InsStatus): string {
    if (s === InsStatus.LOADING) {
      return 'LOADING(加载中)';
    } else if (s === InsStatus.CLICKED) {
      return 'CLICKED(已加载)';
    }
    return 'UNCLICKED(未点击)';
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

        Text('F-03-04 构造期指定初始状态为非默认值时正确显示对应形态')
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
            '2. 点击【构造期指定初始状态为非默认值时正确显示对应形态】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 在【初始状态】下拉菜单中选择未点击选项 [验证点: 初始状态已指定为未点击]',
            '4. 点击【重新展示组件】按钮 [验证点: 组件以新初始状态重新展示]',
            '5. 观察【组件状态】和【进度弧区域】的初始表现 [验证点: 组件初始即显示未点击形态（完整渐变静态圆环）]'
          ],
            expected_result: '构造期指定初始状态为未点击或已点击时，组件初始即显示对应形态，非默认加载中状态',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('初始状态（构造期 status）')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
              .id('txt_initial_label')
            Select([
              { value: '未点击' },
              { value: '已点击' },
              { value: '加载中' },
            ])
              .id('sel_initial_status')
              .selected(0)
              .value(this.initialStatusLabel)
              .width('100%')
              .margin({ bottom: 8 })
              .onSelect((index: number, value: string) => {
                if (value === '未点击') {
                  this.initialStatus = InsStatus.UNCLICKED;
                } else if (value === '已点击') {
                  this.initialStatus = InsStatus.CLICKED;
                } else {
                  this.initialStatus = InsStatus.LOADING;
                }
                this.initialStatusLabel = value;
              })

            Button('重新展示组件')
              .id('btn_remount')
              .type(ButtonType.Capsule)
              .fontSize(12)
              .height(30)
              .width('100%')
              .backgroundColor('#FFE5E7EB')
              .fontColor('#FF1F2937')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.mountKey++;
                this.result = '重新挂载组件，构造期 status=' + this.statusName(this.initialStatus) + '\n组件初始即显示对应形态（非默认加载中）';
              })

            // 渲染预览区：通过 ForEach-key 强制重建组件，使构造期 status 生效
            Text('进度弧预览区（按所选初始状态重新挂载组件）')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
              .id('txt_preview_label')
            ForEach([this.mountKey], (key: number) => {
              Stack({ alignContent: Alignment.Center }) {
                InsLoadingView({
                  imageSrc: 'common/images/pink.jpg',
                  status: this.initialStatus,
                  sideLength: 220,
                  controller: this.controller,
                })
              }
              .width(240)
              .height(240)
              .backgroundColor('#FFF3F4F6')
              .borderRadius(12)
              .margin({ bottom: 8 })
            }, (key: number) => key.toString())
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
