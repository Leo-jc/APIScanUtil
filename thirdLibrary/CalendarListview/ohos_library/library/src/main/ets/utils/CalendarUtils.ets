/**
 * CalendarUtils — 日期计算工具类
 *
 * 对应 Android CalendarUtils 类。
 * 提供纯算术方式的日期计算，不依赖任何 HarmonyOS Kit API。
 *
 * @module utils/CalendarUtils
 */

// ── 常量定义（消除魔法值） ──
const LEAP_YEAR_DIVISOR: number = 4;
const CENTURY_DIVISOR: number = 100;
const QUADRICENTENNIAL_DIVISOR: number = 400;
const DAYS_FEB_NORMAL: number = 28;
const DAYS_FEB_LEAP: number = 29;
const DAYS_30: number = 30;
const DAYS_31: number = 31;

export class CalendarUtils {
  /**
   * 计算指定月份的天数。
   * month 为 0-indexed（0=January ... 11=December）。
   * 含闰年判断：四年一闰，百年不闰，四百年再闰。
   *
   * 对应 Android getDaysInMonth(int month, int year)。
   *
   * @param month 月份（0-indexed, 0-11）
   * @param year  年份（如 2026）
   * @returns 该月的天数（28, 29, 30 或 31）
   * @throws Error 当 month 超出 0-11 范围时抛出
   */
  static getDaysInMonth(month: number, year: number): number {
    switch (month) {
      case 0: // January
      case 2: // March
      case 4: // May
      case 6: // July
      case 7: // August
      case 9: // October
      case 11: // December
        return 31;
      case 3: // April
      case 5: // June
      case 8: // September
      case 10: // November
        return 30;
      case 1: // February
        return ((year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0)) ? 29 : 28;
      default:
        throw new Error('Invalid Month: ' + month + '. Month must be 0-11.');
    }
  }
}
