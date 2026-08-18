/*
 * Copyright (C) 2015 Karumi.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { ItemCategory } from './ItemCategory';

/**
 * 渲染条目数据载体。HeaderRecyclerViewDataSource.getData(index) 返回该对象，
 * 供 LazyForEach 的 itemGenerator 根据 category 决定渲染 header / 普通条目 / footer，
 * 并直接取出对应数据，无需使用方再做一次 position→数据的映射。
 *
 * - category：当前对外 position 的条目类别。
 * - position：对外 position（含 header 偏移），与 LazyForEach 的 index 一致。
 * - headerData / itemData / footerData：按类别填充，其余为 null。
 */
export class HeaderRecyclerViewEntry<H, T, F> {
  category: ItemCategory = ItemCategory.ITEM;
  position: number = 0;
  headerData: H | null = null;
  itemData: T | null = null;
  footerData: F | null = null;
}

/**
 * HeaderRecyclerView 的鸿蒙数据控制器。对应 Android 库的核心抽象类
 * HeaderRecyclerViewAdapter<VH, H, T, F>，但按 ArkUI 声明式渲染范式重塑为
 * 一个实现 IDataSource 的具体数据控制器：内部维护 header / items / footer /
 * showFooter 四段状态，对外暴露与原库一致的数据存取、位置判定与刷新接口，
 * 并通过 DataChangeListener 驱动 LazyForEach / ForEach 更新视图。
 *
 * 与 Android 版的行为对照：
 * - getItemCount() → totalCount()：items.size() + (header?1:0) + (footer?1:0)。
 * - getItemViewType(position) → getItemCategory(position)：返回 HEADER/ITEM/FOOTER。
 * - onCreateViewHolder / onBindViewHolder：在 ArkUI 中由使用方在 @Builder 内根据
 *   getItemCategory 的返回值分别渲染 header / item / footer，控制器不参与视图创建。
 * - setHeader/setFooter/setItems：仅写入数据，不自动刷新（与 Android 一致）。
 * - showFooter()/hideFooter()：翻转显隐标志并触发整表刷新（对应 Android 的
 *   notifyDataSetChanged() → onDataReloaded()）。
 * - onHeaderViewRecycled/onItemViewRecycled/onFooterViewRecycled：对应 Android 的
 *   onViewRecycled 分派钩子；ArkUI 不存在 ViewHolder 回收回调，由使用方在
 *   @Reusable 组件的 aboutToRecycle 中调用 notifyViewRecycled(position) 触发分派。
 * - setItems(null) 抛出与原库一致的运行时异常。
 */
export class HeaderRecyclerViewDataSource<H, T, F> implements IDataSource {
  /** 对应 Android protected static final int TYPE_HEADER = -2。 */
  static readonly TYPE_HEADER: number = ItemCategory.HEADER;
  /** 对应 Android protected static final int TYPE_ITEM = -1。 */
  static readonly TYPE_ITEM: number = ItemCategory.ITEM;
  /** 对应 Android protected static final int TYPE_FOOTER = -3。 */
  static readonly TYPE_FOOTER: number = ItemCategory.FOOTER;

  private header: H | null = null;
  private items: T[] = [];
  private footer: F | null = null;
  private isFooterVisible: boolean = true;
  private listeners: DataChangeListener[] = [];

  // ===================== IDataSource 实现 =====================

  /**
   * 列表可滚动条目总数。对应 Android getItemCount()：
   * items.size() + (header!=null?1:0) + (footer!=null && showFooter?1:0)。
   */
  totalCount(): number {
    let size: number = this.items.length;
    if (this.hasHeader()) {
      size++;
    }
    if (this.hasFooter()) {
      size++;
    }
    return size;
  }

  /**
   * 获取对外 position 对应的渲染数据载体。LazyForEach 会按可视区按需调用。
   */
  getData(index: number): HeaderRecyclerViewEntry<H, T, F> {
    let category: ItemCategory = this.getItemCategory(index);
    let entry: HeaderRecyclerViewEntry<H, T, F> = new HeaderRecyclerViewEntry<H, T, F>();
    entry.category = category;
    entry.position = index;
    if (category === ItemCategory.HEADER) {
      entry.headerData = this.header;
    } else if (category === ItemCategory.FOOTER) {
      entry.footerData = this.footer;
    } else {
      entry.itemData = this.getItem(index);
    }
    return entry;
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    let pos: number = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  // ===================== 数据刷新通知 =====================

  /** 触发整表刷新，对应 Android notifyDataSetChanged()。 */
  notifyDataReloaded(): void {
    this.listeners.forEach((listener: DataChangeListener) => {
      listener.onDataReloaded();
    });
  }

  /** 通知 index 位置新增数据，对应 Android notifyItemInserted。 */
  notifyDataAdd(index: number): void {
    this.listeners.forEach((listener: DataChangeListener) => {
      listener.onDataAdd(index);
    });
  }

  /** 通知 index 位置删除数据，对应 Android notifyItemRemoved。 */
  notifyDataDelete(index: number): void {
    this.listeners.forEach((listener: DataChangeListener) => {
      listener.onDataDelete(index);
    });
  }

  /** 通知 index 位置数据变化，对应 Android notifyItemChanged。 */
  notifyDataChange(index: number): void {
    this.listeners.forEach((listener: DataChangeListener) => {
      listener.onDataChange(index);
    });
  }

  /** 通知数据移动，对应 Android notifyItemMoved。 */
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach((listener: DataChangeListener) => {
      listener.onDataMove(from, to);
    });
  }

  // ===================== 数据存取（公开 API） =====================

  /** 获取已设置的 header 数据，未设置返回 null。对应 Android getHeader()。 */
  getHeader(): H | null {
    return this.header;
  }

  /** 获取已设置的 footer 数据，未设置返回 null。对应 Android getFooter()。 */
  getFooter(): F | null {
    return this.footer;
  }

  /**
   * 按对外 position 取普通条目数据。对应 Android getItem(int)：
   * 当 hasHeader() && hasItems() 时内部 position-1，否则直接取 items[position]。
   * 越界时由数组访问抛出越界异常，与原库行为一致（原库未显式边界校验）。
   */
  getItem(position: number): T {
    let pos: number = position;
    if (this.hasHeader() && this.hasItems()) {
      pos = position - 1;
    }
    return this.items[pos];
  }

  /** 设置 header 数据，不自动刷新。对应 Android setHeader(H)。 */
  setHeader(header: H): void {
    this.header = header;
  }

  /** 设置 footer 数据，不自动刷新。对应 Android setFooter(F)。 */
  setFooter(footer: F): void {
    this.footer = footer;
  }

  /**
   * 设置普通条目列表。对应 Android setItems(List<T>)。
   * items 为 null 时抛出与原库一致的运行时异常：
   * "You can't use a null List<Item> instance."（原库 IllegalArgumentException）。
   */
  setItems(items: T[] | null): void {
    if (items === null || items === undefined) {
      throw new Error("You can't use a null List<Item> instance.");
    }
    this.items = items;
  }

  /** 获取当前普通条目列表（只读视图）。 */
  getItems(): T[] {
    return this.items;
  }

  /**
   * 显示 footer。对应 Android showFooter()：置 showFooter=true 并触发整表刷新。
   * 仅当 footer 数据非 null 时，刷新后 footer 才会出现在列表末尾。
   */
  showFooter(): void {
    this.isFooterVisible = true;
    this.notifyDataReloaded();
  }

  /**
   * 隐藏 footer。对应 Android hideFooter()：置 showFooter=false 并触发整表刷新。
   * 即使 footer 数据非 null，刷新后 footer 也不会出现在列表中。
   */
  hideFooter(): void {
    this.isFooterVisible = false;
    this.notifyDataReloaded();
  }

  // ===================== 位置 / 类别判定 =====================

  /** 给定对外 position 是否为 header 位置：hasHeader() && position==0。 */
  isHeaderPosition(position: number): boolean {
    return this.hasHeader() && position === 0;
  }

  /** 给定对外 position 是否为 footer 位置：hasFooter() && position==totalCount()-1。 */
  isFooterPosition(position: number): boolean {
    let lastPosition: number = this.totalCount() - 1;
    return this.hasFooter() && position === lastPosition;
  }

  /**
   * 返回对外 position 对应的条目类别。对应 Android getItemViewType(int)：
   * header 位置返回 HEADER，footer 位置返回 FOOTER，其余返回 ITEM。
   */
  getItemCategory(position: number): ItemCategory {
    if (this.isHeaderPosition(position)) {
      return ItemCategory.HEADER;
    }
    if (this.isFooterPosition(position)) {
      return ItemCategory.FOOTER;
    }
    return ItemCategory.ITEM;
  }

  /** header 是否已配置（非 null）。对应 Android hasHeader()。 */
  hasHeader(): boolean {
    return this.header !== null;
  }

  /** footer 是否已配置且未被隐藏。对应 Android hasFooter()：footer!=null && showFooter。 */
  hasFooter(): boolean {
    return this.footer !== null && this.isFooterVisible;
  }

  /** footer 显隐标志当前值（仅供使用方读取，不参与数据存取判定）。 */
  isFooterShowing(): boolean {
    return this.isFooterVisible;
  }

  /** 当前普通条目数量。 */
  getItemCount(): number {
    return this.items.length;
  }

  /**
   * 普通条目列表是否非空。对应 Android private hasItems()：items.size() > 0。
   * 供 getItem 的位置偏移判定使用，与原库逻辑一致。
   */
  private hasItems(): boolean {
    return this.items.length > 0;
  }

  // ===================== 回收回调（对应 Android onViewRecycled 分派） =====================

  /**
   * 由使用方在 @Reusable 组件的 aboutToRecycle 中调用，按 position 分派到
   * onHeaderViewRecycled / onItemViewRecycled / onFooterViewRecycled。
   * 对应 Android final onViewRecycled(VH holder)（依据 holder.getAdapterPosition() 分派）。
   */
  notifyViewRecycled(position: number): void {
    if (this.isHeaderPosition(position)) {
      this.onHeaderViewRecycled(position);
    } else if (this.isFooterPosition(position)) {
      this.onFooterViewRecycled(position);
    } else {
      this.onItemViewRecycled(position);
    }
  }

  /** header 条目被回收时触发，子类可重写做资源清理。对应 Android onHeaderViewRecycled。 */
  onHeaderViewRecycled(position: number): void {
  }

  /** 普通条目被回收时触发，子类可重写做资源清理。对应 Android onItemViewRecycled。 */
  onItemViewRecycled(position: number): void {
  }

  /** footer 条目被回收时触发，子类可重写做资源清理。对应 Android onFooterViewRecycled。 */
  onFooterViewRecycled(position: number): void {
  }
}
