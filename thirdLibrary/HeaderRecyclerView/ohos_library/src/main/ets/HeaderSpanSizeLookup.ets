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

import { HeaderRecyclerViewDataSource } from './HeaderRecyclerViewDataSource';

/**
 * 网格跨列计算器。对应 Android 库的 HeaderSpanSizeLookup（继承
 * GridLayoutManager.SpanSizeLookup）：让 header / footer 位置占满所有列，
 * 普通条目占 1 列。
 *
 * 鸿蒙侧不使用继承 SpanSizeLookup 的形式，而是提供一个基于
 * HeaderRecyclerViewDataSource 与列数（spanCount）的计算器，对外仍保持
 * "按 position 返回 spanSize"的单一职责，并提供直接产出 ArkUI
 * GridLayoutOptions 与 GridItem 列跨度的便捷方法：
 *
 * - getSpanSize(position)：spanCount（header/footer 位置）或 1（普通条目），与 Android 行为一致。
 * - getIrregularIndexes() / getIrregularSizeByIndex()：用于 GridLayoutOptions 的
 *   irregularIndexes 与 onGetIrregularSizeByIndex，让 header/footer 占满整行。
 * - buildGridLayoutOptions()：直接构造一个 GridLayoutOptions，适用于 header/footer
 *   位置在构造后不会变化的场景。
 * - columnStartOf(position) / columnEndOf(position)：返回 header/footer 应设置的
 *   columnStart / columnEnd 列号，供使用方在动态数据（footer 显隐 / 条目增删会
 *   改变 footer 位置）场景下对 GridItem 直接设置 columnStart().columnEnd()，
 *   实现 header/footer 占满整行；该方式随 LazyForEach 重渲染逐项生效，能正确
 *   应对 footer 隐藏后原 footer 位置变为普通条目的情况。
 */
export class HeaderSpanSizeLookup<H, T, F> {
  private dataSource: HeaderRecyclerViewDataSource<H, T, F>;
  private spanCount: number;

  /**
   * @param dataSource 关联的数据控制器，用于按 position 判定 header/footer。
   * @param spanCount 网格列数（对应 Android GridLayoutManager.getSpanCount()）。
   */
  constructor(dataSource: HeaderRecyclerViewDataSource<H, T, F>, spanCount: number) {
    this.dataSource = dataSource;
    this.spanCount = spanCount;
  }

  /** 网格列数。 */
  getSpanCount(): number {
    return this.spanCount;
  }

  /**
   * 返回给定 position 占据的列数。对应 Android getSpanSize(int)：
   * header 或 footer 位置返回 spanCount（占满整行），其余返回 1。
   */
  getSpanSize(position: number): number {
    let isHeaderOrFooter: boolean =
      this.dataSource.isHeaderPosition(position) || this.dataSource.isFooterPosition(position);
    return isHeaderOrFooter ? this.spanCount : 1;
  }

  /**
   * 当前需要占满整行的位置列表（header 在 0，footer 在 totalCount()-1）。
   * 用于 GridLayoutOptions.irregularIndexes。若 footer 未配置 / 已隐藏则不包含末位。
   */
  getIrregularIndexes(): number[] {
    let indexes: number[] = [];
    if (this.dataSource.hasHeader()) {
      indexes.push(0);
    }
    if (this.dataSource.hasFooter()) {
      indexes.push(this.dataSource.totalCount() - 1);
    }
    return indexes;
  }

  /**
   * 不规则位置（header/footer）占用的 [行数, 列数] = [1, spanCount]。
   * 用于 GridLayoutOptions.onGetIrregularSizeByIndex。
   */
  getIrregularSizeByIndex(index: number): [number, number] {
    return [1, this.spanCount];
  }

  /**
   * 构造一个可直接用于 Grid(scroller, layoutOptions) 的 GridLayoutOptions。
   * 适用于 header/footer 位置在 Grid 构造后不会变化的场景（footer 不会被
   * 动态隐藏 / 条目数不会变化导致 footer 索引漂移）。
   */
  buildGridLayoutOptions(): GridLayoutOptions {
    let options: GridLayoutOptions = {
      regularSize: [1, 1],
      irregularIndexes: this.getIrregularIndexes(),
      onGetIrregularSizeByIndex: (index: number): [number, number] => {
        return this.getIrregularSizeByIndex(index);
      }
    };
    return options;
  }

  /**
   * 给定 position 的起始列号（始终为 0，header/footer 占满整行时使用）。
   * 普通条目返回 0 但使用方不应设置 columnStart/columnEnd。
   */
  columnStartOf(position: number): number {
    return 0;
  }

  /**
   * 给定 position 的终点列号。header/footer 返回 spanCount-1（占满整行）。
   */
  columnEndOf(position: number): number {
    let isHeaderOrFooter: boolean =
      this.dataSource.isHeaderPosition(position) || this.dataSource.isFooterPosition(position);
    return isHeaderOrFooter ? this.spanCount - 1 : 0;
  }

  /** 给定 position 是否应占满整行（header/footer）。 */
  isFullSpan(position: number): boolean {
    return this.dataSource.isHeaderPosition(position) || this.dataSource.isFooterPosition(position);
  }
}
