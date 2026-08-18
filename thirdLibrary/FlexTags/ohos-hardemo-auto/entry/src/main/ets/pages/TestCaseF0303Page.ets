import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FlexTags, FlexTagsController, FlexTagsItemView } from 'flex_tags';
import { TextTagAdapter, HOT_SEARCH_POOL, pickRandomTags } from '../demo/DemoModels';

/**
 * F-03-03 点击标签弹出提示显示该项文本
 * 覆盖 API：onBindView
 */
@Entry
@Component
struct TestCaseF0303Page {
  @State result: string = '等待操作：点击随机测试后点击标签';
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
      .onClick(() => {
        this.onTagClick(view.tag);
      })
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

        Text('F-03-03 点击标签弹出提示显示该项文本')
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
            level: 'L0',
            preconditions: '应用已启动',
            test_steps: [
            '1. 点击【热门搜索页】进入模块列表页 [验证点: 进入模块列表页]',
            '2. 点击【点击标签弹出提示显示该项文本】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 点击【随机测试】按钮 [验证点: 容器填充标签]',
            '4. 点击【标签容器】中任一标签 [验证点: 选中某标签]',
            '5. 观察【提示气泡】弹出显示该项文本内容 [验证点: 提示文本为所点标签文本]',
            '6. 等待提示气泡自动消失 [验证点: 提示按时长消失]'
          ],
            expected_result: '点击任一标签弹出提示气泡；提示内容为所点标签的文本；提示按时长自动消失',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('随机测试')
              .id('btn_random_test')
              .width('100%')
              .onClick(() => {
                this.randomTest();
              })

            // 预览区：FlexTags 容器真实渲染标签（点击标签弹 Toast）
            Text('标签容器预览区（点击标签弹提示）')
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

  private randomTest(): void {
    let tags: string[] = pickRandomTags(HOT_SEARCH_POOL, 5, 12);
    let adapter: TextTagAdapter = new TextTagAdapter(tags);
    this.controller.setAdapter(adapter);
    this.tagCount = adapter.getItemCount();
    this.result = '已填充标签 → getItemCount=' + this.tagCount.toString()
      + ', onBindView=' + adapter.bindCount.toString()
      + '，请点击标签测试 Toast';
  }

  private onTagClick(tag: string): void {
    this.getUIContext().getPromptAction().showToast({ message: tag, duration: 2000 });
    this.result = 'Toast: ' + tag;
  }
}
