import { FlexTags, FlexTagsController, FlexTagsItemView } from 'flex_tags';
import { HotSearchAdapter, HotSearchItemView } from '../model/ItemViews';

/**
 * 热门搜索主页。对应 Android MainActivity。
 *
 * 功能：
 * - 进入页面：标题区「热门搜索」+ 火焰图标，下方 FlexTags 容器初始填充随机标签
 * - 点击「随机测试」：从文本池随机取 5~12 个去重标签刷新容器
 * - 点击标签：弹 Toast 显示该项文本
 * - 点击「选中示例」/「编辑示例」：跳转对应页面
 */
@Entry
@Component
struct Index {
  private tags: string[] = [];
  private adapter: HotSearchAdapter = new HotSearchAdapter();
  private controller: FlexTagsController = new FlexTagsController();

  private static readonly TEXT_POOL: string[] = [
    '中国农民丰收节',
    '热心肠的杨迪',
    'SHE',
    '易烊千玺',
    '爸爸去哪儿的孩子们都长大了',
    '罗晋',
    '鹿晗',
    '丁泽仁',
    '大张伟',
    '李易峰',
    '许魏洲',
    '吴磊',
    'ZZ',
    'XX',
    'YY',
    '520',
    '1314',
    '666',
    '劫',
    '肖战',
    '马东',
    '今日秋分',
    '马冬梅',
    '让亚洲象有家可回',
    '阳光帅气新生',
    '英俊帅气的实力派演员',
    '有时候会出现一段非常长非常长非常长非常长非常长非常长的文字, 这时候改如何显示呢?',
  ];

  aboutToAppear(): void {
    this.adapter.onTagClick = (text: string): void => {
      this.getUIContext().getPromptAction().showToast({ message: text });
    };
    this.randomTest();
  }

  /**
   * 随机测试：从文本池随机取 5~12 次标签，HashSet 去重后填充 tags。
   * 对应 Android MainActivity.randomTest：for 循环取 total 次，可能产生重复被去重。
   */
  randomTest(): void {
    let total: number = Math.floor(Math.random() * 8) + 5;
    let poolSize: number = Index.TEXT_POOL.length;
    let set: Set<string> = new Set<string>();
    for (let i = 0; i < total; i++) {
      let idx: number = Math.floor(Math.random() * poolSize);
      set.add(Index.TEXT_POOL[idx]);
    }
    this.tags = Array.from(set);
    this.adapter.tags = this.tags;
    this.adapter.notifyDataSetChanged();
  }

  @Builder
  itemBuilder(view: FlexTagsItemView): void {
    Text((view as HotSearchItemView).text)
      .fontSize($r('app.float.tag_font_size'))
      .fontColor($r('app.color.text_primary'))
      .backgroundColor($r('app.color.tag_background'))
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
        let item: HotSearchItemView = view as HotSearchItemView;
        if (item.onClickCallback !== null) {
          item.onClickCallback();
        }
      })
  }

  build(): void {
    Scroll() {
      Column() {
        // 标题区
        Row() {
          Image($r('app.media.icon_hot'))
            .width($r('app.float.hot_icon_size'))
            .height($r('app.float.hot_icon_size'))
            .objectFit(ImageFit.Fill)

          Text($r('app.string.title_hot_search'))
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

        // 按钮区
        Column({ space: 16 }) {
          Button($r('app.string.btn_random_test'))
            .width('60%')
            .type(ButtonType.Capsule)
            .onClick(() => {
              this.randomTest();
            })

          Row({ space: 10 }) {
            Button($r('app.string.btn_select_simple'))
              .type(ButtonType.Capsule)
              .onClick(() => {
                this.getUIContext().getRouter().pushUrl({ url: 'pages/SelectSimplePage' });
              })

            Button($r('app.string.btn_edit_simple'))
              .type(ButtonType.Capsule)
              .onClick(() => {
                this.getUIContext().getRouter().pushUrl({ url: 'pages/EditSimplePage' });
              })
          }
          .justifyContent(FlexAlign.Center)
        }
        .width('100%')
        .alignItems(HorizontalAlign.Center)
        .padding({ top: 40 })
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
