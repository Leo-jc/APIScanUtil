import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FlexTags, FlexTagsController, FlexTagsItemView } from 'flex_tags';

/**
 * F-03-01 进入主页显示空标签容器与标题按钮区
 * 覆盖 API：FlexTags构造器 / setAdapter
 */
@Entry
@Component
struct TestCaseF0301Page {
  @State result: string = '等待操作：页面渲染中...';
  @State tagCount: number = 0;
  private controller: FlexTagsController = new FlexTagsController();

  @Builder
  renderTag(view: FlexTagsItemView): void {
    Text(view.tag)
      .fontSize(14)
      .fontColor('#333333')
      .backgroundColor('#F5F7FA')
      .borderRadius(16)
      .padding({ left: 12, right: 12, top: 6, bottom: 6 })
      .margin(6)
  }

  aboutToAppear(): void {
    this.tagCount = 0;
    this.result = '页面已渲染：标题区+三按钮可见，标签容器为空，标签数=' + this.tagCount.toString();
  }

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

        Text('F-03-01 进入主页显示空标签容器与标题按钮区')
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
            '2. 点击【进入主页显示空标签容器与标题按钮区】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 等待页面显示完成 [验证点: 主页渲染完成]',
            '4. 观察【热门搜索】标题区显示图标与文本 [验证点: 标题区可见]',
            '5. 观察【随机测试】【选中示例】【编辑示例】三个按钮可见 [验证点: 三个按钮均可见]',
            '6. 观察【标签容器】为空无子项 [验证点: 容器初始为空]'
          ],
            expected_result: '进入页面标签容器为空无子项；标题区「热门搜索」图标与文本可见；随机测试/选中示例/编辑示例三个按钮可见',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            // 热门搜索标题区（图标+文本）
            Row() {
              Image($r('app.media.icon_hot'))
                .width(20)
                .height(20)
                .margin({ right: 8 })
              Text('热门搜索')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .fontColor('#333333')
            }
            .width('100%')
            .padding({ left: 4, top: 8, bottom: 8 })

            // 三个按钮
            Row() {
              Button('随机测试')
                .id('btn_random_test')
                .layoutWeight(1)
                .onClick(() => {
                  this.result = '已点击随机测试（功能详见 F-03-02）';
                })

              Button('选中示例')
                .id('btn_select_demo')
                .layoutWeight(1)
                .margin({ left: 8 })
                .onClick(() => {
                  this.result = '已点击选中示例（功能详见 F-03-05）';
                })

              Button('编辑示例')
                .id('btn_edit_demo')
                .layoutWeight(1)
                .margin({ left: 8 })
                .onClick(() => {
                  this.result = '已点击编辑示例（功能详见 F-03-06）';
                })
            }
            .width('100%')

            // 预览区：FlexTags 容器（初始为空）
            Text('标签容器预览区')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 12, bottom: 4 })

            FlexTags({
              controller: this.controller,
              adapter: null,
              itemBuilder: (view: FlexTagsItemView): void => { this.renderTag(view); },
              options: {
                direction: FlexDirection.Row,
                wrap: FlexWrap.Wrap,
                justifyContent: FlexAlign.Start,
                alignItems: ItemAlign.Start,
                alignContent: FlexAlign.Start
              }
            })
              .id('flex_tags_container')
              .width('100%')
              .backgroundColor('#FFFFFF')
              .borderRadius(8)
              .padding(8)

            // 标签数量
            Row() {
              Text('标签数量: ')
                .fontSize(13)
                .fontColor('#666666')
              Text(this.tagCount.toString())
                .id('txt_tag_count')
                .fontSize(13)
                .fontColor('#333333')
                .fontWeight(FontWeight.Medium)
            }
            .width('100%')
            .margin({ top: 8 })
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
