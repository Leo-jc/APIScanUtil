import { FlexTags, FlexTagsController, FlexTagsItemView } from 'flex_tags';
import { InterestTagAdapter, InterestTagItemView } from '../model/ItemViews';
import { SelectBean } from '../model/SelectBean';

/**
 * 兴趣标签选中页。对应 Android SelectSimpleActivity。
 *
 * 功能：
 * - 进入页面：标题区「选中示例(兴趣标签)」+ 火焰图标
 * - 下方 FlexTags 渲染 11 个固定兴趣标签，全部未选中（灰底）
 * - 点击某项：翻转选中状态，背景在灰底 ↔ 选中色之间切换，支持多选
 */
@Entry
@Component
struct SelectSimplePage {
  private tags: SelectBean[] = [];
  private adapter: InterestTagAdapter = new InterestTagAdapter();
  private controller: FlexTagsController = new FlexTagsController();

  aboutToAppear(): void {
    // 初始化 11 个固定兴趣标签
    let texts: string[] = ['军事', '实事', '明星', '搞笑', '同城', '美女', '帅哥', '宠物', '生活', '旅游', '二次元'];
    let beans: SelectBean[] = [];
    for (let i = 0; i < texts.length; i++) {
      beans.push(new SelectBean(texts[i], false));
    }
    this.tags = beans;
    this.adapter.tags = this.tags;
  }

  @Builder
  itemBuilder(view: FlexTagsItemView): void {
    Text((view as InterestTagItemView).text)
      .fontSize($r('app.float.tag_font_size'))
      .fontColor($r('app.color.text_primary'))
      .backgroundColor((view as InterestTagItemView).isSelected
        ? $r('app.color.tag_background_selected')
        : $r('app.color.tag_background'))
      .borderRadius($r('app.float.tag_corner_radius'))
      .padding({
        left: $r('app.float.tag_padding_h'),
        right: $r('app.float.tag_padding_h'),
        top: $r('app.float.tag_padding_v'),
        bottom: $r('app.float.tag_padding_v'),
      })
      .margin($r('app.float.tag_margin'))
      .constraintSize({ maxWidth: '100%' })
      .onClick(() => {
        let item: InterestTagItemView = view as InterestTagItemView;
        if (item.onToggleCallback !== null) {
          item.onToggleCallback();
        }
      })
  }

  build(): void {
    Scroll() {
      Column() {
        // 返回按钮 + 标题
        Row() {
          Text('◀')
            .fontSize(20)
            .fontColor($r('app.color.text_primary'))
            .onClick(() => {
              this.getUIContext().getRouter().back();
            })
            .margin({ right: 8 })

          Image($r('app.media.icon_hot'))
            .width($r('app.float.hot_icon_size'))
            .height($r('app.float.hot_icon_size'))
            .objectFit(ImageFit.Fill)

          Text($r('app.string.title_select_simple'))
            .fontSize($r('app.float.title_font_size'))
            .fontColor($r('app.color.text_primary'))
            .fontWeight(FontWeight.Bold)
            .margin({ left: 5 })
            .padding({
              top: $r('app.float.title_padding_top'),
              bottom: $r('app.float.title_padding_bottom'),
            })
        }
        .width('100%')
        .alignItems(VerticalAlign.Center)

        // FlexTags 容器
        FlexTags({
          controller: this.controller,
          adapter: this.adapter,
          itemBuilder: this.itemBuilder,
          options: {
            direction: FlexDirection.Row,
            wrap: FlexWrap.Wrap,
            justifyContent: FlexAlign.Start,
            alignItems: ItemAlign.Start,
            alignContent: FlexAlign.Start,
          },
        })

        // 分隔线
        Column()
          .width('100%')
          .height($r('app.float.divider_height'))
          .backgroundColor($r('app.color.divider_gray'))
      }
      .width('100%')
      .padding({
        left: $r('app.float.page_margin_h'),
        right: $r('app.float.page_margin_h'),
        top: $r('app.float.page_margin_top'),
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.Spring)
  }
}
