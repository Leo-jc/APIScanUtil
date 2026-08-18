/**
 * FlexTagsItemView —— 标签项视图数据基类。
 *
 * 对应 Android 端 Adapter.onCreateView 返回的 View。在 ArkUI 声明式模型中，
 * 不存在可直接实例化并修改的 View 对象，因此使用数据描述对象承载渲染所需信息。
 * 使用方可继承此类，扩展自定义字段，由 @Builder 读取并渲染。
 */
export class FlexTagsItemView {
  // 使用方可扩展自定义字段
  tag: string = '';

  constructor() {
    this.tag = '';
  }
}

/**
 * Adapter 数据变更回调。由 FlexTags 组件在挂载 Adapter 时注册，
 * 调用 notifyDataSetChanged 时触发容器整体重建。
 */
type AdapterChangedCallback = () => void;

/**
 * FlexTagsAdapter —— 数据适配器抽象基类。
 *
 * 保留 Android 端 Adapter 四个公开方法签名语义：
 * - onCreateView: 创建标签项视图数据
 * - onBindView:   按位置绑定数据到视图
 * - getItemCount:  返回标签总数
 * - notifyDataSetChanged: 通知数据已变更，触发容器刷新
 *
 * 内部通过回调桥接到 ArkUI @State 驱动的 ForEach 自动 diff 刷新。
 */
export abstract class FlexTagsAdapter {
  private changeCallback: AdapterChangedCallback | null = null;

  /**
   * 创建标签项视图数据。对应 Android onCreateViewHolder。
   * 由 FlexTags 容器在刷新循环中每个 position 调用一次。
   *
   * @returns 新建的标签项视图数据实例
   */
  abstract onCreateView(): FlexTagsItemView;

  /**
   * 设置内容回调。对应 Android onBindView。
   * 由 FlexTags 容器在刷新循环中每个 position 调用一次。
   *
   * @param view     当前绑定视图数据
   * @param position 位置
   */
  abstract onBindView(view: FlexTagsItemView, position: number): void;

  /**
   * 获取总内容数。对应 Android getItemCount。
   *
   * @returns 总数
   */
  abstract getItemCount(): number;

  /**
   * 通知内容已更新。对应 Android notifyDataSetChanged。
   *
   * 未挂载到任何 FlexTags（无观察者）时静默无效；
   * 已挂载时触发容器整体重建（removeAllViews → 逐项创建 → 绑定 → 挂载）。
   */
  notifyDataSetChanged(): void {
    if (this.changeCallback !== null) {
      this.changeCallback();
    }
  }

  /**
   * 是否已挂载到 FlexTags 容器（已注册变更回调）。
   * 对应 Android AdapterDataObservable.hasObservers()。
   */
  hasObserver(): boolean {
    return this.changeCallback !== null;
  }

  /**
   * 内部方法：注册/注销数据变更回调。由 FlexTags 容器调用。
   */
  setChangeCallback(callback: AdapterChangedCallback | null): void {
    this.changeCallback = callback;
  }
}

/**
 * FlexTagsController —— 外部控制 FlexTags 容器的句柄。
 *
 * 在 ArkUI 中，@Component struct 的方法不能从外部直接调用，
 * 通过 Controller 桥接 setAdapter/getAdapter 能力，保持对外契约一致。
 */
export class FlexTagsController {
  private setAdapterFn: ((adapter: FlexTagsAdapter | null) => void) | null = null;
  private getAdapterFn: (() => FlexTagsAdapter | null) | null = null;

  /**
   * 绑定 FlexTags 容器的内部方法。由容器在 aboutToAppear 时调用。
   */
  bind(setFn: (adapter: FlexTagsAdapter | null) => void,
    getFn: () => FlexTagsAdapter | null): void {
    this.setAdapterFn = setFn;
    this.getAdapterFn = getFn;
  }

  /**
   * 设置/替换/清空 Adapter。
   *
   * - 传 null 且当前已有 adapter：注销旧 adapter 回调，清空容器子项。
   * - 传 null 且当前无 adapter：空操作。
   * - 传与当前相同实例：仅触发刷新。
   * - 传新实例：替换 adapter，注册回调，触发首次渲染。
   *
   * 对应 Android FlexTags.setAdapter(Adapter)。
   */
  setAdapter(adapter: FlexTagsAdapter | null): void {
    if (this.setAdapterFn !== null) {
      this.setAdapterFn(adapter);
    }
  }

  /**
   * 获取当前已挂载的 Adapter。可能为 null。
   * 对应 Android FlexTags.getAdapter()。
   */
  getAdapter(): FlexTagsAdapter | null {
    return this.getAdapterFn !== null ? this.getAdapterFn() : null;
  }
}
