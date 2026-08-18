/**
 * SelectedDays<T> — 泛型日期范围容器
 *
 * 对应 Android SimpleMonthAdapter.SelectedDays<K>。
 * 承载日期范围选择状态机：first=起始日期，last=结束日期。
 * first 和 last 均可为 null，用于状态重置。
 *
 * @module model/SelectedDays
 */

export class SelectedDays<T> {
  private first: T | null = null;
  private last: T | null = null;

  /**
   * 获取范围起始日期。
   * 对应 Android getFirst()。
   *
   * @returns 起始日期，可能为 null
   */
  getFirst(): T | null {
    return this.first;
  }

  /**
   * 设置范围起始日期。
   * 对应 Android setFirst(K first)。
   *
   * @param first 起始日期，可为 null（状态重置）
   */
  setFirst(first: T | null): void {
    this.first = first;
  }

  /**
   * 获取范围结束日期。
   * 对应 Android getLast()。
   *
   * @returns 结束日期，可能为 null
   */
  getLast(): T | null {
    return this.last;
  }

  /**
   * 设置范围结束日期。
   * 对应 Android setLast(K last)。
   *
   * @param last 结束日期，可为 null（状态重置）
   */
  setLast(last: T | null): void {
    this.last = last;
  }
}
