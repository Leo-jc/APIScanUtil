import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { InsLoadingView, InsLoadingController, InsStatus } from 'library';

interface ImagePreset {
  name: string;
  src: string;
}

const IMAGE_PRESETS: ImagePreset[] = [
  { name: 'pink', src: 'common/images/pink.jpg' },
  { name: 'eric', src: 'common/images/eric.jpg' },
  { name: 'srv', src: 'common/images/srv.jpg' },
];

@Entry
@Component
struct TestCaseF0101Page {
  private controller: InsLoadingController = new InsLoadingController();
  @State result: string = '已加载头像：pink（圆形裁剪、短边等比放大居中）';
  @State currentImageSrc: string = IMAGE_PRESETS[0].src;
  @State currentImageName: string = IMAGE_PRESETS[0].name;

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

        Text('F-01-01 正常图片源显示为圆形头像底图并按短边等比放大居中裁剪')
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
            '1. 点击【圆形头像底图绘制】进入模块列表页 [验证点: 进入圆形头像底图绘制模块列表页]',
            '2. 点击【正常图片源显示为圆形头像底图并按短边等比放大居中裁剪】进入用例详情页 [验证点: 进入用例详情页，头像组件已展示]',
            '3. 观察【头像区域】的圆形形态和图片填充效果 [验证点: 头像以圆形形态显示，图片按短边等比放大并居中裁剪填充圆形区域，超出部分不可见]'
          ],
            expected_result: '头像以圆形形态常驻显示，图片按短边等比放大并居中裁剪填充圆形区域，超出部分被圆形裁剪不可见，作为进度弧的内层视觉锚点',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('头像图片源（imageSrc / setImageSrc）')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
            Row() {
              ForEach(IMAGE_PRESETS, (preset: ImagePreset) => {
                Button(preset.name)
                  .id('btn_img_' + preset.name)
                  .type(ButtonType.Capsule)
                  .fontSize(12)
                  .height(30)
                  .layoutWeight(1)
                  .margin({ left: 2, right: 2 })
                  .backgroundColor(this.currentImageName === preset.name ? '#FFF700C2' : '#FFE5E7EB')
                  .fontColor(this.currentImageName === preset.name ? '#FFFFFFFF' : '#FF1F2937')
                  .onClick(() => {
                    if (this.currentImageName === preset.name) {
                      return;
                    }
                    this.currentImageName = preset.name;
                    this.currentImageSrc = preset.src;
                    this.controller.setImageSrc(preset.src);
                    this.result = `setImageSrc(${preset.src}) → 头像切换为 ${preset.name}\n圆形裁剪：以组件中心为圆心，按短边等比放大居中，超出部分被圆形裁剪不可见`;
                  })
              })
            }
            .width('100%')
            .margin({ bottom: 8 })

            // 渲染预览区：InsLoadingView 自绘组件（圆形头像底图 + 进度弧内层锚点）
            Text('头像预览区（圆形底图常驻，作为进度弧内层视觉锚点）')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
            Stack({ alignContent: Alignment.Center }) {
              InsLoadingView({
                imageSrc: this.currentImageSrc,
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
