/**
 * DayPickerStyleConfig — 日历日期选择器样式配置接口
 *
 * 对应 Android 中通过 XML TypedArray 解析的 20 个自定义属性。
 * 所有属性均为可选，未设置时使用 PRD §3.1.5 定义的默认值。
 * 颜色使用 "#RRGGBB" 或 "#RRGGBBAA" 格式（Alpha 在末尾），与 HarmonyOS Canvas fillStyle 兼容。
 *
 * 本接口仅导出为 type，宿主可传入对象字面量或具名实例。
 *
 * @module components/DayPickerStyleConfig
 */

export interface DayPickerStyleConfig {
  // ════════════════════════════════════════════════════════════════
  // 颜色（#RRGGBB 或 #RRGGBBAA 格式，Alpha 在末尾）
  // ════════════════════════════════════════════════════════════════

  /** 当日日期文字颜色，默认 '#999999' */
  colorCurrentDay?: string;

  /** 选中日期的圆/圆角矩形背景颜色，默认 '#E75F49' */
  colorSelectedDayBackground?: string;

  /** 选中日期的文字颜色，默认 '#F2F2F2' */
  colorSelectedDayText?: string;

  /** 当月过去日期的文字颜色，默认 '#999999' */
  colorPreviousDay?: string;

  /** 普通日期文字默认颜色，默认 '#999999' */
  colorNormalDay?: string;

  /** 月份名称和年份文字颜色，默认 '#999999' */
  colorMonthName?: string;

  /** 星期标签文字颜色，默认 '#999999' */
  colorDayName?: string;

  // ════════════════════════════════════════════════════════════════
  // 字号（vp 单位）
  // ════════════════════════════════════════════════════════════════

  /** 日期数字字号，默认 16vp */
  textSizeDay?: number;

  /** 月份名称字号，默认 16vp */
  textSizeMonth?: number;

  /** 星期标签字号，默认 10vp */
  textSizeDayName?: number;

  // ════════════════════════════════════════════════════════════════
  // 尺寸（vp 单位）
  // ════════════════════════════════════════════════════════════════

  /** 月份标题行高度，默认 50vp */
  headerMonthHeight?: number;

  /** 选中指示器的半径，默认 16vp */
  selectedDayRadius?: number;

  /** 每个月份行的高度，默认 270vp */
  calendarHeight?: number;

  // ════════════════════════════════════════════════════════════════
  // 布尔开关
  // ════════════════════════════════════════════════════════════════

  /** 选中指示器用圆角矩形替代圆形，默认 false */
  drawRoundRect?: boolean;

  /** 启用当月过去日期可点击，默认 true */
  enablePreviousDay?: boolean;

  /** 初始化时默认选中当天，默认 false */
  currentDaySelected?: boolean;

  // ════════════════════════════════════════════════════════════════
  // 枚举
  // ════════════════════════════════════════════════════════════════

  /** 日历起始月份（0-11），-1 表示当前月，默认 -1 */
  firstMonth?: number;

  /** 日历结束月份（0-11），-1 表示当前月，默认 -1 */
  lastMonth?: number;
}
