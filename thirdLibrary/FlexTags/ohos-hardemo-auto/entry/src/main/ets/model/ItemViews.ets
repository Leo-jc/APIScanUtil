import { FlexTagsAdapter, FlexTagsItemView } from 'flex_tags';
import { SelectBean } from './SelectBean';

/**
 * 热门搜索标签项视图数据。对应 Android item_search_hot_text.xml。
 * 纯文本标签胶囊。
 */
export class HotSearchItemView extends FlexTagsItemView {
  text: string = '';
  onClickCallback: (() => void) | null = null;

  constructor() {
    super();
    this.text = '';
    this.onClickCallback = null;
  }
}

/**
 * 兴趣标签项视图数据。对应 Android item_search_hot_text.xml（复用，带选中态）。
 */
export class InterestTagItemView extends FlexTagsItemView {
  text: string = '';
  isSelected: boolean = false;
  onToggleCallback: (() => void) | null = null;

  constructor() {
    super();
    this.text = '';
    this.isSelected = false;
    this.onToggleCallback = null;
  }
}

/**
 * 编辑标签项视图数据。对应 Android item_edit_tag.xml。
 * 文本 + 删除图标横向标签。
 */
export class EditTagItemView extends FlexTagsItemView {
  text: string = '';
  onDeleteCallback: (() => void) | null = null;

  constructor() {
    super();
    this.text = '';
    this.onDeleteCallback = null;
  }
}

/**
 * 热门搜索 Adapter。对应 Android MainActivity 中的匿名 Adapter。
 * 从内置文本池绑定的标签数据。
 */
export class HotSearchAdapter extends FlexTagsAdapter {
  tags: string[] = [];
  onTagClick: ((text: string) => void) | null = null;

  onCreateView(): FlexTagsItemView {
    return new HotSearchItemView();
  }

  onBindView(view: FlexTagsItemView, position: number): void {
    let item: HotSearchItemView = view as HotSearchItemView;
    item.text = this.tags[position];
    let clickText: string = this.tags[position];
    item.onClickCallback = (): void => {
      if (this.onTagClick !== null) {
        this.onTagClick(clickText);
      }
    };
  }

  getItemCount(): number {
    return this.tags.length;
  }
}

/**
 * 兴趣标签 Adapter。对应 Android SelectSimpleActivity 中的匿名 Adapter。
 * 点击标签时翻转 bean.isSelected 并触发刷新。
 */
export class InterestTagAdapter extends FlexTagsAdapter {
  tags: SelectBean[] = [];

  onCreateView(): FlexTagsItemView {
    return new InterestTagItemView();
  }

  onBindView(view: FlexTagsItemView, position: number): void {
    let item: InterestTagItemView = view as InterestTagItemView;
    let bean: SelectBean = this.tags[position];
    item.text = bean.text;
    item.isSelected = bean.isSelected;
    item.onToggleCallback = (): void => {
      bean.isSelected = !bean.isSelected;
      this.notifyDataSetChanged();
    };
  }

  getItemCount(): number {
    return this.tags.length;
  }
}

/**
 * 编辑标签 Adapter。对应 Android EditSimpleActivity 中的匿名 Adapter。
 */
export class EditTagAdapter extends FlexTagsAdapter {
  tags: SelectBean[] = [];

  onCreateView(): FlexTagsItemView {
    return new EditTagItemView();
  }

  onBindView(view: FlexTagsItemView, position: number): void {
    let item: EditTagItemView = view as EditTagItemView;
    let bean: SelectBean = this.tags[position];
    item.text = bean.text;
    item.onDeleteCallback = (): void => {
      let idx: number = this.tags.indexOf(bean);
      if (idx >= 0) {
        this.tags.splice(idx, 1);
      }
      this.notifyDataSetChanged();
    };
  }

  getItemCount(): number {
    return this.tags.length;
  }
}
