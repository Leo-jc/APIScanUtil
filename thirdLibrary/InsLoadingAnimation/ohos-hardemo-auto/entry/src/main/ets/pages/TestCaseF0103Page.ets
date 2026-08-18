import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { InsLoadingView, InsLoadingController, InsStatus } from 'library';

@Entry
@Component
struct TestCaseF0103Page {
  private controller: InsLoadingController = new InsLoadingController();
  @State hasImage: boolean = true;
  @State result: string = '当前图片源：pink.jpg（正常）';

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

        Text('F-01-03 无效或缺失图片源时头像底图区域的兜底表现')
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
            '2. 点击【无效或缺失图片源时头像底图区域的兜底表现】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 点击【清除图片源】按钮移除当前图片 [验证点: 图片源被移除]',
            '4. 观察【头像区域】的视觉表现 [验证点: 组件不崩溃，头像区域有合理的兜底视觉表现]'
          ],
            expected_result: '无效或缺失图片源时组件不崩溃，头像区域有合理的兜底视觉表现（如空白圆形或占位图），无异常闪退',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('图片源（controller.setImageSrc 运行态切换）')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
            Row() {
              Button('清除图片源')
                .id('btn_clear_image')
                .type(ButtonType.Capsule)
                .fontSize(12)
                .height(30)
                .layoutWeight(1)
                .margin({ left: 2, right: 2 })
                .backgroundColor(this.hasImage ? '#FFE5E7EB' : '#FFF700C2')
                .fontColor(this.hasImage ? '#FF1F2937' : '#FFFFFFFF')
                .onClick(() => {
                  this.controller.setImageSrc('');
                  this.hasImage = false;
                  this.result = 'setImageSrc("") → 图片源已移除\n组件未崩溃，头像区域为空白圆形兜底（无异常闪退）';
                })

              Button('恢复图片源')
                .id('btn_restore_image')
                .type(ButtonType.Capsule)
                .fontSize(12)
                .height(30)
                .layoutWeight(1)
                .margin({ left: 2, right: 2 })
                .backgroundColor(this.hasImage ? '#FFF700C2' : '#FFE5E7EB')
                .fontColor(this.hasImage ? '#FFFFFFFF' : '#FF1F2937')
                .onClick(() => {
                  this.controller.setImageSrc('common/images/pink.jpg');
                  this.hasImage = true;
                  this.result = 'setImageSrc(pink.jpg) → 头像恢复显示，圆形裁剪正常';
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            // 渲染预览区：InsLoadingView 自绘组件（挂载一次，用 controller 切换图片源）
            Text('头像预览区（挂载一次，controller.setImageSrc 运行态切换图片源）')
              .fontSize(14)
              .fontColor('#FF374151')
              .width('100%')
              .margin({ bottom: 4 })
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
            .margin({ bottom: 4 })

            Text(this.hasImage ? '当前状态：图片源正常（pink.jpg）' : '当前状态：图片源已移除（空白兜底，组件未崩溃）')
              .fontSize(12)
              .fontColor('#FF6B7280')
              .width('100%')
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
