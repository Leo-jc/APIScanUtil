import { FlexTagsAdapter, FlexTagsController, FlexTagsItemView } from '../adapter/FlexTagsAdapter';

/**
 * FlexTags 布局参数，对应 Android FlexboxLayout 的 XML 属性。
 * 通过构造参数传递，语义与 FlexOptions 一致。
 */
export interface FlexTagsOptions {
  /**
   * 主轴方向。默认 Row。对应 Android app:flexDirection。
   */
  direction?: FlexDirection;
  /**
   * 换行方式。默认 Wrap。对应 Android app:flexWrap。
   */
  wrap?: FlexWrap;
  /**
   * 主轴对齐。默认 Start。对应 Android app:justifyContent="flex_start"。
   */
  justifyContent?: FlexAlign;
  /**
   * 交叉轴对齐。默认 Start。对应 Android app:alignItems。
   */
  alignItems?: ItemAlign;
  /**
   * 多行时交叉轴对齐。默认 Start。对应 Android app:alignContent。
   */
  alignContent?: FlexAlign;
}

/**
 * FlexTags —— 弹性标签布局容器组件。
 *
 * 对应 Android com.chockqiu.libflextags.view.FlexTags extends FlexboxLayout。
 *
 * 内部使用 ArkUI Flex 组件 + ForEach 渲染控制，状态驱动自动刷新。
 * 通过 @BuilderParam 接收使用方提供的标签项渲染函数。
 *
 * 使用示例：
 * ```
 * FlexTags({
 *   controller: this.controller,
 *   adapter: this.adapter,
 *   itemBuilder: this.itemBuilder,
 *   options: { direction: FlexDirection.Row, wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start }
 * })()
 * ```
 */
@Component
export struct FlexTags {
  /**
   * 外部控制句柄。提供 setAdapter/getAdapter 能力。
   */
  controller: FlexTagsController | null = null;

  /**
   * 初始 Adapter。也可后续通过 controller.setAdapter 设置。
   */
  adapter: FlexTagsAdapter | null = null;

  /**
   * 标签项渲染函数。由使用方通过 @Builder 提供。
   * 对应 Android LayoutInflater.inflate(item_layout, parent, false) + onBindView。
   */
  @BuilderParam itemBuilder: (view: FlexTagsItemView) => void = this.defaultItemBuilder;

  /**
   * 布局参数。对应 FlexboxLayout XML 属性。
   */
  options: FlexTagsOptions = {
    direction: FlexDirection.Row,
    wrap: FlexWrap.Wrap,
    justifyContent: FlexAlign.Start,
    alignItems: ItemAlign.Start,
    alignContent: FlexAlign.Start,
  };

  /**
   * 当前已挂载的 Adapter 引用（可能为 null）。
   */
  private currentAdapter: FlexTagsAdapter | null = null;

  /**
   * 渲染项数据数组。@State 驱动 ForEach diff 刷新。
   */
  @State private items: FlexTagsItemView[] = [];

  /**
   * 刷新计数器，用于生成 ForEach 唯一键，确保整体重建。
   * 对应 Android removeAllViews + 逐项重建语义。
   */
  @State private refreshCounter: number = 0;

  @Builder defaultItemBuilder(view: FlexTagsItemView): void {
    Text(view.tag)
  }

  aboutToAppear(): void {
    // 绑定 Controller 方法，供外部调用 setAdapter/getAdapter
    if (this.controller !== null) {
      this.controller.bind(
        (adapter: FlexTagsAdapter | null) => { this.handleSetAdapter(adapter); },
        () => { return this.currentAdapter; }
      );
    }
    // 处理通过参数传入的初始 Adapter
    if (this.adapter !== null) {
      this.handleSetAdapter(this.adapter);
    }
  }

  aboutToDisappear(): void {
    // 注销变更回调，防止泄漏
    if (this.currentAdapter !== null) {
      this.currentAdapter.setChangeCallback(null);
      this.currentAdapter = null;
    }
  }

  /**
   * 处理 setAdapter 的四条分支，行为与 Android 原实现一致：
   * - null + 无旧 adapter：空操作
   * - null + 有旧 adapter：注销回调，清空子项
   * - 同实例：触发刷新
   * - 新实例：替换，注册回调，触发首次渲染
   */
  private handleSetAdapter(adapter: FlexTagsAdapter | null): void {
    if (adapter === null) {
      if (this.currentAdapter !== null) {
        this.currentAdapter.setChangeCallback(null);
        this.currentAdapter = null;
      }
      this.items = [];
      this.refreshCounter++;
    } else {
      if (this.currentAdapter === adapter) {
        adapter.notifyDataSetChanged();
        return;
      }
      if (this.currentAdapter !== null) {
        this.currentAdapter.setChangeCallback(null);
      }
      this.currentAdapter = adapter;
      adapter.setChangeCallback(() => { this.rebuildItems(); });
      adapter.notifyDataSetChanged();
    }
  }

  /**
   * 重建所有标签项。对应 Android onChanged → post { removeAllViews + 循环创建绑定挂载 }。
   */
  private rebuildItems(): void {
    if (this.currentAdapter === null) {
      this.items = [];
      this.refreshCounter++;
      return;
    }
    let newItems: FlexTagsItemView[] = [];
    let total: number = this.currentAdapter.getItemCount();
    for (let i = 0; i < total; i++) {
      let view: FlexTagsItemView = this.currentAdapter.onCreateView();
      this.currentAdapter.onBindView(view, i);
      newItems.push(view);
    }
    this.refreshCounter++;
    this.items = newItems;
  }

  build(): void {
    Flex({
      direction: this.options.direction ?? FlexDirection.Row,
      wrap: this.options.wrap ?? FlexWrap.Wrap,
      justifyContent: this.options.justifyContent ?? FlexAlign.Start,
      alignItems: this.options.alignItems ?? ItemAlign.Start,
      alignContent: this.options.alignContent ?? FlexAlign.Start,
    }) {
      ForEach(this.items, (item: FlexTagsItemView, index: number) => {
        this.itemBuilder(item);
      }, (item: FlexTagsItemView, index: number) => `${this.refreshCounter}_${index}`)
    }
  }
}
