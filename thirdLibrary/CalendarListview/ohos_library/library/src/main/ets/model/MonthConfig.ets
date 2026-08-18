/**
 * MonthConfig — 月份 Canvas 自绘组件的渲染参数配置
 *
 * 对应 Android SimpleMonthView 中由 TypedArray/XML attrs 驱动的
 * 颜色、字号、尺寸、布尔开关等全部可配置参数。
 *
 * 本类为纯数据类，不应使用 @Observed 装饰器。
 * WU-03 负责构造并传入 SimpleMonthView。
 *
 * @module model/MonthConfig
 */

export class MonthConfig {
  // ── 颜色（#RRGGBB 或 #RRGGBBAA 格式，与 HarmonyOS Canvas fillStyle 兼容） ──

  /** 当日日期文字颜色 */
  colorCurrentDay: string = '#999999';

  /** 选中日期背景色（指示器填充色） */
  colorSelectedDayBackground: string = '#E75F49';

  /** 选中日期文字颜色 */
  colorSelectedDayText: string = '#F2F2F2';

  /** 过去日期文字颜色 */
  colorPreviousDay: string = '#999999';

  /** 普通未选中日期文字颜色 */
  colorNormalDay: string = '#999999';

  /** 月份标题文字颜色 */
  colorMonthName: string = '#999999';

  /** 星期标签文字颜色 */
  colorDayName: string = '#999999';

  // ── 字号（vp 单位） ──

  /** 日期数字字号 */
  textSizeDay: number = 16;

  /** 月份名称字号 */
  textSizeMonth: number = 16;

  /** 星期标签字号 */
  textSizeDayName: number = 10;

  // ── 尺寸（vp 单位） ──

  /** 月份标题行高度 */
  headerMonthHeight: number = 50;

  /** 选中指示器半径 */
  selectedDayRadius: number = 16;

  /**
   * 月份总高度（含 header），作为初始/兜底值。
   * 实际高度由 SimpleMonthView 根据行数动态计算。
   */
  calendarHeight: number = 270;

  // ── 开关 ──

  /** true=圆角矩形选中指示器, false=圆形 */
  drawRoundRect: boolean = false;

  /** true=过去日期可点击/可用, false=过去日期以不同样式显示 */
  enablePreviousDay: boolean = true;
}
