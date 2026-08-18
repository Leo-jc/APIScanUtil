import { FlexTagsAdapter, FlexTagsItemView } from 'flex_tags';

/**
 * 可选标签视图：继承 FlexTagsItemView，增加选中态与位置索引。
 * 由 SelectTagAdapter.onCreateView 创建，onBindView 填充数据后交给页面 @Builder 渲染。
 */
export class SelectTagView extends FlexTagsItemView {
  selected: boolean = false;
  position: number = 0;
}

/**
 * 编辑标签视图：继承 FlexTagsItemView，增加位置索引（删除图标据此定位）。
 */
export class EditTagView extends FlexTagsItemView {
  position: number = 0;
}

/**
 * 兴趣标签数据 Bean（F-04）。name 唯一，selected 翻转驱动背景色切换。
 */
export class InterestBean {
  name: string = '';
  selected: boolean = false;

  constructor(name: string) {
    this.name = name;
    this.selected = false;
  }
}

/**
 * 个人标签数据 Bean（F-05）。name 为标签文本。
 */
export class PersonalBean {
  name: string = '';

  constructor(name: string) {
    this.name = name;
  }
}

/**
 * 文本标签适配器（F-01/F-02/F-03 使用）。
 * 持有 string[] 数据源，带可追踪实例 id 与 onCreateViewHolder/onBindView/notifyDataSetChanged 调用计数器。
 */
export class TextTagAdapter extends FlexTagsAdapter {
  private tags: string[] = [];
  private instanceId: number = 0;
  createCount: number = 0;
  bindCount: number = 0;
  notifyCount: number = 0;
  private static seq: number = 1;

  constructor(tags: string[] = []) {
    super();
    this.tags = tags;
    this.instanceId = TextTagAdapter.seq++;
  }

  getInstanceId(): number {
    return this.instanceId;
  }

  getTags(): string[] {
    return this.tags;
  }

  setTags(tags: string[]): void {
    this.tags = tags;
  }

  resetCounters(): void {
    this.createCount = 0;
    this.bindCount = 0;
    this.notifyCount = 0;
  }

  onCreateView(): FlexTagsItemView {
    this.createCount++;
    return new FlexTagsItemView();
  }

  onBindView(view: FlexTagsItemView, position: number): void {
    this.bindCount++;
    if (position >= 0 && position < this.tags.length) {
      view.tag = this.tags[position];
    }
  }

  getItemCount(): number {
    return this.tags.length;
  }

  notifyDataSetChanged(): void {
    this.notifyCount++;
    super.notifyDataSetChanged();
  }
}

/**
 * 兴趣标签适配器（F-04 使用）。持有 InterestBean[]，点击翻转 selected 后整体重建。
 */
export class SelectTagAdapter extends FlexTagsAdapter {
  private beans: InterestBean[] = [];
  createCount: number = 0;
  bindCount: number = 0;
  notifyCount: number = 0;

  constructor(beans: InterestBean[] = []) {
    super();
    this.beans = beans;
  }

  getBeans(): InterestBean[] {
    return this.beans;
  }

  toggle(position: number): void {
    if (position >= 0 && position < this.beans.length) {
      this.beans[position].selected = !this.beans[position].selected;
    }
  }

  getSelectedCount(): number {
    let n: number = 0;
    for (let i = 0; i < this.beans.length; i++) {
      if (this.beans[i].selected) {
        n++;
      }
    }
    return n;
  }

  resetCounters(): void {
    this.createCount = 0;
    this.bindCount = 0;
    this.notifyCount = 0;
  }

  onCreateView(): FlexTagsItemView {
    this.createCount++;
    return new SelectTagView();
  }

  onBindView(view: FlexTagsItemView, position: number): void {
    this.bindCount++;
    let sv: SelectTagView = view as SelectTagView;
    if (position >= 0 && position < this.beans.length) {
      sv.tag = this.beans[position].name;
      sv.selected = this.beans[position].selected;
      sv.position = position;
    }
  }

  getItemCount(): number {
    return this.beans.length;
  }

  notifyDataSetChanged(): void {
    this.notifyCount++;
    super.notifyDataSetChanged();
  }
}

/**
 * 个人标签编辑适配器（F-05 使用）。持有 PersonalBean[]，支持末尾新增与按位置删除。
 */
export class EditTagAdapter extends FlexTagsAdapter {
  private beans: PersonalBean[] = [];
  createCount: number = 0;
  bindCount: number = 0;
  notifyCount: number = 0;

  constructor(beans: PersonalBean[] = []) {
    super();
    this.beans = beans;
  }

  getBeans(): PersonalBean[] {
    return this.beans;
  }

  addTag(name: string): void {
    this.beans.push(new PersonalBean(name));
  }

  deleteAt(position: number): void {
    if (position >= 0 && position < this.beans.length) {
      this.beans.splice(position, 1);
    }
  }

  resetCounters(): void {
    this.createCount = 0;
    this.bindCount = 0;
    this.notifyCount = 0;
  }

  onCreateView(): FlexTagsItemView {
    this.createCount++;
    return new EditTagView();
  }

  onBindView(view: FlexTagsItemView, position: number): void {
    this.bindCount++;
    let ev: EditTagView = view as EditTagView;
    if (position >= 0 && position < this.beans.length) {
      ev.tag = this.beans[position].name;
      ev.position = position;
    }
  }

  getItemCount(): number {
    return this.beans.length;
  }

  notifyDataSetChanged(): void {
    this.notifyCount++;
    super.notifyDataSetChanged();
  }
}

/**
 * 热门搜索文本池（F-03 随机测试用）。含一个超长文本标签用于撑满行宽测试。
 */
export const HOT_SEARCH_POOL: string[] = [
  '有时候会出现一段非常长非常长非常长非常长非常长非常长非常长非常长非常长的热门搜索词标签',
  '美食', '科技', '体育', '娱乐', '游戏', '旅游', '汽车', '财经', '数码',
  '健康', '教育', '军事', '历史', '文化', '艺术', '音乐', '电影', '动漫'
];

/**
 * 从文本池随机选取 [min, max] 个去重标签（F-03 随机测试）。
 */
export function pickRandomTags(pool: string[], min: number, max: number): string[] {
  let count: number = min + Math.floor(Math.random() * (max - min + 1));
  let shuffled: string[] = pool.slice();
  for (let i = shuffled.length - 1; i > 0; i--) {
    let j: number = Math.floor(Math.random() * (i + 1));
    let tmp: string = shuffled[i];
    shuffled[i] = shuffled[j];
    shuffled[j] = tmp;
  }
  let result: string[] = [];
  let n: number = count < shuffled.length ? count : shuffled.length;
  for (let i = 0; i < n; i++) {
    result.push(shuffled[i]);
  }
  return result;
}

/**
 * 11 个固定兴趣标签名（F-04）。
 */
export const INTEREST_NAMES: string[] = [
  '军事', '实事', '明星', '搞笑', '同城', '美女', '帅哥', '宠物', '生活', '旅游', '二次元'
];

/**
 * 7 个固定个人标签名（F-05）。
 */
export const PERSONAL_NAMES: string[] = [
  '阳光', '幽默', '低调', '时尚', '果断', '搞怪', '假温柔'
];
