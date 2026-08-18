import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { InsLoadingView, InsLoadingController, InsStatus } from 'library';

@Entry
@Component
struct TestCaseF0102Page {
  private controller: InsLoadingController = new InsLoadingController();
  @State containerW: number = 260;
  @State containerH: number = 260;
  @State containerLabel: string = '正方形 260x260';
  @State mountKey: number = 0;
  @State result: string = '容器：正方形 260x260｜组件以较小边为直径绘制圆形，居中不变形';

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

        Text('F-01-02 组件宽高非正方形时以较小者为直径保持圆形')
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
            '1. 点击【圆形头像底图绘制】进入模块列表页 [验证点: 进入圆形头像底图绘制模块列表页]',
            '2. 点击【组件宽高非正方形时以较小者为直径保持圆形】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 在【容器尺寸】下拉菜单中选择宽大于高选项 [验证点: 组件容器尺寸变为非正方形]',
            '4. 观察【头像区域】的圆形形态和位置 [验证点: 以较小者为直径绘制圆形，居中显示，不发生变形]'
          ],
            expected_result: '宽高不等时以较小者为直径绘制圆形头像，居中显示，不变形，圆形完整性保持',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('容器尺寸（sideLength=0 时填满父容器并按 aspectRatio(1) 取较小边为正方形）')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
            Select([
              { value: '正方形 260x260' },
              { value: '宽大于高 360x200' },
              { value: '高大于宽 200x360' },
            ])
              .id('sel_container_size')
              .selected(0)
              .value(this.containerLabel)
              .onSelect((index: number, value: string) => {
                if (value === '正方形 260x260') {
                  this.containerW = 260;
                  this.containerH = 260;
                } else if (value === '宽大于高 360x200') {
                  this.containerW = 360;
                  this.containerH = 200;
                } else if (value === '高大于宽 200x360') {
                  this.containerW = 200;
                  this.containerH = 360;
                }
                this.containerLabel = value;
                this.mountKey++;
                const minSide: number = Math.min(this.containerW, this.containerH);
                this.result = `容器：${value}（W=${this.containerW}, H=${this.containerH}）｜组件以较小边 ${minSide} 为直径绘制圆形，居中不变形`;
              })
              .width('100%')
              .margin({ bottom: 8 })

            // 渲染预览区：InsLoadingView 自绘组件（sideLength=0 填满父容器，aspectRatio(1) 取较小边为正方形）
            Text('头像预览区（sideLength=0，切尺寸时 mountKey++ 重建，以较小边为直径保持圆形）')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
            ForEach([this.mountKey], (key: number) => {
              Stack({ alignContent: Alignment.Center }) {
                InsLoadingView({
                  imageSrc: 'common/images/pink.jpg',
                  status: InsStatus.LOADING,
                  sideLength: 0,
                  controller: this.controller,
                })
              }
              .width(this.containerW)
              .height(this.containerH)
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
