/**
 * CalendarDay — 日期数据模型
 *
 * 对应 Android SimpleMonthAdapter.CalendarDay。
 * month 字段为 0-indexed（0=January, 11=December），与 JS Date 原生行为一致。
 * day 字段为 1-indexed。
 *
 * @module model/CalendarDay
 */

export class CalendarDay {
  /**
   * 年份，例如 2026
   */
  public year: number = 0;

  /**
   * 月份，0-indexed（0=January, 11=December）
   */
  public month: number = 0;

  /**
   * 日期，1-indexed（1-31）
   */
  public day: number = 1;

  /**
   * 构造 CalendarDay 实例。
   *
   * 支持三种调用方式：
   * - new CalendarDay()：默认当日
   * - new CalendarDay(year, month, day)：指定年/月/日
   * - new CalendarDay(year)：与 3 参数区分，但语义上当作指定年份？不，此用法不合规。
   *   为避免歧义，当提供 1 个参数时视为不合规；请使用静态工厂 fromTime()。
   *
   * 当不传任何参数时，初始化为当前日期。
   * 当传 3 个参数时，设置为指定年/月/日。
   *
   * @param year  年份（可选）
   * @param month 月份 0-indexed（可选）
   * @param day   日期 1-indexed（可选）
   */
  constructor(year?: number, month?: number, day?: number) {
    if (year !== undefined && month !== undefined && day !== undefined) {
      this.year = year;
      this.month = month;
      this.day = day;
    } else {
      const now: Date = new Date();
      this.year = now.getFullYear();
      this.month = now.getMonth();
      this.day = now.getDate();
    }
  }

  /**
   * 从时间戳（毫秒）构造 CalendarDay。
   * 对应 Android CalendarDay(long timeInMillis)。
   *
   * @param timeInMillis 从 1970-01-01 00:00:00 UTC 开始的毫秒数
   * @returns CalendarDay 实例
   */
  static fromTime(timeInMillis: number): CalendarDay {
    const date: Date = new Date(timeInMillis);
    return new CalendarDay(date.getFullYear(), date.getMonth(), date.getDate());
  }

  /**
   * 从 JS Date 对象构造 CalendarDay。
   * 对应 Android CalendarDay(Calendar calendar)。
   *
   * @param date JS Date 对象
   * @returns CalendarDay 实例
   */
  static fromDate(date: Date): CalendarDay {
    return new CalendarDay(date.getFullYear(), date.getMonth(), date.getDate());
  }

  /**
   * 从另一个 CalendarDay 复制值。
   * 对应 Android set(CalendarDay calendarDay)。
   *
   * @param calendarDay 源 CalendarDay 实例
   */
  set(calendarDay: CalendarDay): void {
    this.year = calendarDay.year;
    this.month = calendarDay.month;
    this.day = calendarDay.day;
  }

  /**
   * 直接设置年/月/日。
   * 对应 Android setDay(int year, int month, int day)。
   *
   * @param year  年份
   * @param month 月份 0-indexed
   * @param day   日期 1-indexed
   */
  setDay(year: number, month: number, day: number): void {
    this.year = year;
    this.month = month;
    this.day = day;
  }

  /**
   * 返回对应 JS Date 对象。
   * 对应 Android getDate()。
   *
   * @returns JS Date 对象（本地时间 00:00:00）
   */
  getDate(): Date {
    return new Date(this.year, this.month, this.day);
  }

  /**
   * 返回 `{ year: Y, month: M, day: D }` 格式字符串。
   * 对应 Android toString()。
   *
   * @returns 格式化的日期字符串
   */
  toString(): string {
    return '{ year: ' + this.year + ', month: ' + (this.month + 1) + ', day: ' + this.day + ' }';
  }
}
