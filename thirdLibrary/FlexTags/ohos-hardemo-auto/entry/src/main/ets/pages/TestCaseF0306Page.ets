import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';

/**
 * F-03-06 跳转到个人标签编辑页
 * 覆盖 API：FlexTags构造器
 */
@Entry
@Component
struct TestCaseF0306Page {
  @State result: string = '等待操作：点击编辑示例';

  build(): void {
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

        Text('F-03-06 跳转到个人标签编辑页')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12, right: 16, top: 12, bottom: 12 })
          .layoutWeight(1)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
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
            '1. 点击【热门搜索页】进入模块列表页 [验证点: 进入模块列表页]',
            '2. 点击【跳转到个人标签编辑页】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 点击【编辑示例】按钮 [验证点: 触发页面跳转]',
            '4. 观察页面跳转到个人标签编辑页 [验证点: 进入编辑页]',
            '5. 观察目标页标题显示「编辑示例(个人标签)」 [验证点: 标题正确]',
            '6. 点击【后退】按钮 [验证点: 回到上一页]',
            '7. 观察回到主页 [验证点: 回到热门搜索主页]'
          ],
            expected_result: '点击编辑示例按钮跳转到个人标签编辑页；目标页标题为「编辑示例(个人标签)」；可回到主页',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('编辑示例')
              .id('btn_edit_demo')
              .width('100%')
              .onClick(() => {
                this.navigateToEdit();
              })

            // 预览区：目标页说明
            Text('预览区')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 12, bottom: 4 })

            Text('目标页：编辑示例(个人标签)')
              .id('txt_target_hint')
              .fontSize(14)
              .fontColor('#666666')
              .width('100%')
              .padding(16)
              .textAlign(TextAlign.Center)
              .backgroundColor('#FFFFFF')
              .borderRadius(8)
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

  private navigateToEdit(): void {
    this.result = '跳转 EditDemoPage（个人标签编辑页）';
    router.pushUrl({ url: 'pages/EditDemoPage' });
  }
}
