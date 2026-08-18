/**
 * MonthItem — 月份数据接口（内部使用，不导出）
 *
 * 承载单个月份在列表中的渲染参数，包括年份、月份和当前选中状态。
 * id 字段使用 "${year}-${month}" 格式，用于 LazyForEach 的 key 生成。
 * 选中字段值为 -1 表示无选中。
 *
 * @module components/MonthItem
 */

export interface MonthItem {
  /** 唯一标识，用于 LazyForEach key（格式: "${year}-${month}"） */
  id: string;

  /** 年份，如 2026 */
  year: number;

  /** 月份，0-indexed（0=January, 11=December） */
  month: number;

  /** 选中起始日期日（-1 表示无） */
  selectedBeginDay: number;

  /** 选中起始日期月份（-1 表示无） */
  selectedBeginMonth: number;

  /** 选中起始日期年份（-1 表示无） */
  selectedBeginYear: number;

  /** 选中结束日期日（-1 表示无） */
  selectedLastDay: number;

  /** 选中结束日期月份（-1 表示无） */
  selectedLastMonth: number;

  /** 选中结束日期年份（-1 表示无） */
  selectedLastYear: number;
}
