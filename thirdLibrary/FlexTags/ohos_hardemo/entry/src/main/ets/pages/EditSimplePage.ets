import { FlexTags, FlexTagsController, FlexTagsItemView } from 'flex_tags';
import { EditTagAdapter, EditTagItemView } from '../model/ItemViews';
import { SelectBean } from '../model/SelectBean';

/**
 * 个人标签编辑页。对应 Android EditSimpleActivity。
 *
 * 功能：
 * - 进入页面：标题区「编辑示例(个人标签)」+ 火焰图标
 * - 下方 FlexTags 渲染 7 个固定个人标签（文本+删除图标）
 * - 点击删除图标：移除该项
 * - 下方输入框（预填"阳光帅气"）+ 「添加」按钮
 * - 空输入点击添加：无操作
 * - 非空输入：追加到末尾
 */
@Entry
@Component
struct EditSimplePage {
  private tags: SelectBean[] = [];
  private adapter: EditTagAdapter = new EditTagAdapter();
  private controller: FlexTagsController = new FlexTagsController();
  @State private inputText: string = '阳光帅气';

  aboutToAppear(): void {
    // 初始化 7 个固定个人标签
    let texts: string[] = ['阳光', '幽默', '低调', '时尚', '果断', '搞怪', '假温柔'];
    let beans: SelectBean[] = [];
    for (let i = 0; i < texts.length; i++) {
      beans.push(new SelectBean(texts[i], false));
    }
    this.tags = beans;
    this.adapter.tags = this.tags;
  }

  /**
   * 添加标签。对应 Android EditSimpleActivity 的 btn_add.onClick。
   * 空输入忽略；非空追加到 tags 末尾并刷新容器。
   */
  addTag(): void {
    if (this.inputText.length === 0) {
      return;
    }
    this.tags.push(new SelectBean(this.inputText, false));
    this.adapter.notifyDataSetChanged();
  }

  @Builder
  itemBuilder(view: FlexTagsItemView): void {
    Row() {
      Text((view as EditTagItemView).text)
        .fontSize($r('app.float.edit_tag_font_size'))
        .fontColor($r('app.color.text_primary'))
        .constraintSize({ maxWidth: '70%' })

      Image($r('app.media.ic_close'))
        .width($r('app.float.delete_icon_size'))
        .height($r('app.float.delete_icon_size'))
        .objectFit(ImageFit.Fill)
        .margin({ left: 5 })
        .onClick(() => {
          let item: EditTagItemView = view as EditTagItemView;
          if (item.onDeleteCallback !== null) {
            item.onDeleteCallback();
          }
        })
    }
    .backgroundColor($r('app.color.tag_background'))
    .borderRadius($r('app.float.tag_corner_radius'))
    .padding({
      left: $r('app.float.tag_padding_h'),
      right: $r('app.float.tag_padding_h'),
      top: $r('app.float.tag_padding_v'),
      bottom: $r('app.float.tag_padding_v'),
    })
    .margin($r('app.float.tag_margin'))
    .alignItems(VerticalAlign.Center)
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

          Text($r('app.string.title_edit_simple'))
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

        // 新增标签区
        Column({ space: 10 }) {
          Text($r('app.string.label_new_tag'))
            .fontSize($r('app.float.title_font_size'))
            .fontColor($r('app.color.text_heading'))
            .fontWeight(FontWeight.Bold)
            .width('100%')

          TextInput({ text: this.inputText })
            .width('100%')
            .onChange((value: string) => {
              this.inputText = value;
            })

          Button($r('app.string.btn_add'))
            .width('100%')
            .type(ButtonType.Capsule)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              this.addTag();
            })
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .padding(20)
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
