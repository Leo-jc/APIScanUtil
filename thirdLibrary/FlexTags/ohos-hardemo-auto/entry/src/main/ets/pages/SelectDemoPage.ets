import { router } from '@kit.ArkUI';
import { FlexTags, FlexTagsController, FlexTagsItemView } from 'flex_tags';
import { TextTagAdapter, INTEREST_NAMES } from '../demo/DemoModels';

/**
 * 选中示例（兴趣标签）页 —— F-03-05 跳转目标页
 * 使用 FlexTags + TextTagAdapter 渲染 11 个固定兴趣标签胶囊
 */
@Entry
@Component
struct SelectDemoPage {
  private controller: FlexTagsController = new FlexTagsController();
  private adapter: TextTagAdapter = new TextTagAdapter(INTEREST_NAMES);

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

  build(): void {
    Column() {
      // 标题栏
      Row() {
        Image($r('sys.media.ohos_ic_public_arrow_left'))
          .width(24)
          .height(24)
          .fillColor('#333333')
          .onClick(() => {
            router.back();
          })
          .margin({ left: 16 })

        Text('选中示例(兴趣标签)')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12, right: 16, top: 12, bottom: 12 })
          .layoutWeight(1)
      }
      .width('100%')
      .backgroundColor('#F1F3F5')

      // 内容区
      Scroll() {
        Column() {
          Text('兴趣标签（11 个）')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: 4 })

          FlexTags({
            controller: this.controller,
            adapter: this.adapter,
            itemBuilder: (view: FlexTagsItemView): void => { this.renderTag(view); },
            options: {
              direction: FlexDirection.Row,
              wrap: FlexWrap.Wrap,
              justifyContent: FlexAlign.Start,
              alignItems: ItemAlign.Start,
              alignContent: FlexAlign.Start
            }
          })
            .id('flex_tags_select')
            .width('100%')
            .backgroundColor('#FFFFFF')
            .borderRadius(8)
            .padding(8)
        }
        .padding(12)
        .width('100%')
      }
      .width('100%')
      .layoutWeight(1)
      .backgroundColor('#F1F3F5')
      .scrollBar(BarState.Auto)
      .scrollBarWidth(4)
      .scrollBarColor('#CCCCCC')
    }
    .width('100%')
    .height('100%')
  }
}
