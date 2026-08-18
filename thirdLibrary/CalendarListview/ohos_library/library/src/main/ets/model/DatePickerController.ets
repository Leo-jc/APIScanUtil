/**
 * DatePickerController — 宿主契约接口
 *
 * 对应 Android DatePickerController 接口。
 * 宿主 App 通过实现此接口与日历组件交互：
 * - getMaxYear()：提供日历滚动的最大年份
 * - onDayOfMonthSelected()：单日选中回调
 * - onDateRangeSelected()：日期范围选中回调
 *
 * @module model/DatePickerController
 */

import { CalendarDay } from './CalendarDay';
import { SelectedDays } from './SelectedDays';

export interface DatePickerController {
  /**
   * 返回最大年份，决定日历滚动的总月数。
   * 返回值必须 ≥ 当前年份，否则日历范围可能为空。
   * 对应 Android getMaxYear()。
   *
   * @returns 最大年份（如 2026）
   */
  getMaxYear(): number;

  /**
   * 用户点击某日时的回调。
   * 每次点击单日触发，传入被选日期的年/月/日。
   * month 值为 0-indexed（0=JANUARY）。
   * 对应 Android onDayOfMonthSelected(int year, int month, int day)。
   *
   * @param year  年份
   * @param month 月份（0-indexed）
   * @param day   日期（1-indexed）
   */
  onDayOfMonthSelected(year: number, month: number, day: number): void;

  /**
   * 日期范围选择完成时的回调。
   * 当用户先后点击两个不同日期后触发，传入完整范围。
   * 对应 Android onDateRangeSelected(SelectedDays<CalendarDay>)。
   *
   * @param selectedDays 包含 first/last 的日期范围容器
   */
  onDateRangeSelected(selectedDays: SelectedDays<CalendarDay>): void;
}
