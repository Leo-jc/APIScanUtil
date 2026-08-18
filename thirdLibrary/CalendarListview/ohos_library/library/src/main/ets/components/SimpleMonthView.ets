/**
 * SimpleMonthView — 月份 Canvas 自绘组件
 *
 * 对应 Android SimpleMonthView (extends View)。
 * 使用 ArkUI Canvas + CanvasRenderingContext2D 实现完全自绘。
 *
 * 渲染管线:
 *   drawAll() → clearRect → drawMonthTitle → drawMonthDayLabels → drawMonthNums
 *
 * 触摸交互:
 *   onTouch → TouchType.Up → getDayFromLocation → onDayClick 回调
 *
 * @module components/SimpleMonthView
 */

import { CalendarDay } from '../model/CalendarDay';
import { CalendarUtils } from '../utils/CalendarUtils';
import { MonthConfig } from '../model/MonthConfig';
import { hilog } from '@kit.PerformanceAnalysisKit';

const LOG_DOMAIN: number = 0xFF00;
const LOG_TAG: string = 'CalendarListview';

// ── 常量定义（消除魔法值） ──
const DEFAULT_CANVAS_WIDTH: number = 360;
const DEFAULT_VIEW_HEIGHT: number = 270;
const MIN_CALENDAR_ROWS: number = 4;
const MAX_CALENDAR_ROWS: number = 6;
const MIN_ROW_HEIGHT: number = 10;
const DAYS_IN_WEEK: number = 7;
const WEEK_START_SUNDAY: number = 1;
const INIT_VALUE: number = 0;
const INVALID_DATE_VALUE: number = -1;
const FIRST_DAY_OF_MONTH: number = 1;
const FIRST_INDEX: number = 0;
const AREA_CHANGE_TOLERANCE: number = 0.5;
const FULL_CIRCLE_RADIANS: number = 2;
/** Android SELECTED_CIRCLE_ALPHA = 128 → 50% 透明度，CSS #RRGGBBAA 格式后缀为 "80" */
const SELECTED_BG_ALPHA_SUFFIX: string = '80';
const COLOR_HEX_6_LEN: number = 7; // "#RRGGBB"

/**
 * 星期缩写数组（全称），每个取首字母输出。
 * Android 源使用 DateFormatSymbols.getShortWeekdays()，
 * 本实现使用固定数组 + 取首字母。
 */
const WEEK_DAY_NAMES: string[] = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

/**
 * 月份名称数组，用于月份标题显示 "June 2026" 格式。
 */
const MONTH_NAMES: string[] = [
  'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December'
];

@Component
export struct SimpleMonthView {
  // ── 配置参数（所有 @Prop 必须加 @Watch 以在父组件更新后重绘） ──

  /** 渲染参数配置，由 WU-03 构造传入 */
  @Prop @Watch('onPropChanged') config: MonthConfig = new MonthConfig();

  /** 年份（如 2026） */
  @Prop @Watch('onPropChanged') year: number = 0;

  /** 月份，0-indexed（0=January, 11=December） */
  @Prop @Watch('onPropChanged') month: number = 0;

  /** 选中起始日期日 */
  @Prop @Watch('onPropChanged') selectedBeginDay: number = -1;

  /** 选中起始日期月份（0-indexed） */
  @Prop @Watch('onPropChanged') selectedBeginMonth: number = -1;

  /** 选中起始日期年份 */
  @Prop @Watch('onPropChanged') selectedBeginYear: number = -1;

  /** 选中结束日期日 */
  @Prop @Watch('onPropChanged') selectedLastDay: number = -1;

  /** 选中结束日期月份（0-indexed） */
  @Prop @Watch('onPropChanged') selectedLastMonth: number = -1;

  /** 选中结束日期年份 */
  @Prop @Watch('onPropChanged') selectedLastYear: number = -1;

  // ── 回调（无装饰器属性，禁止使用 @Prop 声明 function 类型） ──

  /** 用户点击某日时的回调 */
  onDayClick?: (year: number, month: number, day: number) => void;

  // ── Canvas ──

  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  // ── 状态 ──

  /** Canvas 实际宽度（vp），由 onAreaChange 获取 */
  @State private canvasWidth: number = DEFAULT_CANVAS_WIDTH;

  /** 组件渲染高度（vp），动态由行数决定 */
  @State private viewHeight: number = DEFAULT_VIEW_HEIGHT;

  /** Canvas 是否已就绪（onReady 已触发） */
  private isInitialized: boolean = false;

  /** 内部计算缓存 */
  private rowHeight: number = INIT_VALUE;
  private numRows: number = MAX_CALENDAR_ROWS;
  private weekStart: number = WEEK_START_SUNDAY; // Sunday=1（Android Calendar.SUNDAY）
  private dayOfWeekStart: number = INIT_VALUE; // 当月 1 号是星期几（0=Sunday）

  /** 今日日期（用于加粗标识），在 aboutToAppear 中初始化 */
  private todayDay: number = INVALID_DATE_VALUE;
  private todayMonth: number = INVALID_DATE_VALUE;
  private todayYear: number = INVALID_DATE_VALUE;

  /** 当前月份是否为过去的月份（year/month 整体 < 当前年月） */
  private mIsPrev: boolean = false;

  /**
   * 找最小单元——该月份第一天在星期中的偏移量。
   * 对应 Android SimpleMonthView.findDayOffset()。
   *
   * @returns 偏移量（0=weekStart 所在列，6=weekStart+6 所在列）
   */
  private findDayOffset(): number {
    // JS Date.getDay(): 0=Sunday, 1=Monday, ..., 6=Saturday
    const firstDayOfMonth: Date = new Date(this.year, this.month, FIRST_DAY_OF_MONTH);
    const jsDayOfWeek: number = firstDayOfMonth.getDay(); // 0-6

    // Android weekStart: 1=Calendar.SUNDAY, 2=Calendar.MONDAY, ...
    // Map to JS: jsWeekStart = weekStart - 1
    const jsWeekStart: number = this.weekStart - WEEK_START_SUNDAY;
    return (jsDayOfWeek - jsWeekStart + DAYS_IN_WEEK) % DAYS_IN_WEEK;
  }

  /**
   * 计算本月需要显示的行数（4-6 行）。
   * 对应 Android SimpleMonthView.calculateNumRows()。
   *
   * @returns 行数
   */
  private calculateNumRows(): number {
    const offset: number = this.findDayOffset();
    const daysInMonth: number = CalendarUtils.getDaysInMonth(this.month, this.year);
    const rows: number = Math.ceil((offset + daysInMonth) / 7);
    return Math.max(MIN_CALENDAR_ROWS, Math.min(MAX_CALENDAR_ROWS, rows));
  }

  /**
   * @Prop 变更回调。
   * 当任何外部 @Prop 变更时，重新计算尺寸并重绘。
   */
  private onPropChanged(): void {
    if (!this.isInitialized) {
      return;
    }
    this.updateDerivedState();
    this.drawAll();
  }

  /**
   * 更新所有派生状态（行数、行高、高度、偏移等）。
   */
  private updateDerivedState(): void {
    this.numRows = this.calculateNumRows();
    this.dayOfWeekStart = this.findDayOffset();
    this.rowHeight = Math.max(MIN_ROW_HEIGHT, this.canvasWidth / DAYS_IN_WEEK);
    this.viewHeight = this.config.headerMonthHeight + this.rowHeight * this.numRows;
    // 检查当前月份是否整体早于当前月
    this.mIsPrev = (this.year < this.todayYear) ||
      (this.year === this.todayYear && this.month < this.todayMonth);
  }

  /**
   * 检查某个日期是否等于选中起始日期。
   */
  private isSelectedBegin(day: number): boolean {
    return this.selectedBeginDay === day &&
      this.selectedBeginMonth === this.month &&
      this.selectedBeginYear === this.year;
  }

  /**
   * 检查某个日期是否等于选中结束日期。
   */
  private isSelectedLast(day: number): boolean {
    return this.selectedLastDay === day &&
      this.selectedLastMonth === this.month &&
      this.selectedLastYear === this.year;
  }

  /**
   * 检查某个日期是否为今日。
   */
  private isToday(day: number): boolean {
    return this.todayDay === day &&
      this.todayMonth === this.month &&
      this.todayYear === this.year;
  }

  /**
   * 判断给定日期是否为过去日期（早于今日）。
   * 用于 enablePreviousDay=false 时的样式区分。
   */
  private isPreviousDay(day: number): boolean {
    if (this.mIsPrev) {
      return true;
    }
    if (this.year === this.todayYear && this.month === this.todayMonth) {
      return day < this.todayDay;
    }
    return false;
  }

  // ── 主绘制入口 ──

  /**
   * 全量绘制。
   * 对应 Android onDraw(Canvas)。
   */
  private drawAll(): void {
    if (!this.isInitialized) {
      return;
    }
    if (this.canvasWidth <= INIT_VALUE || this.viewHeight <= INIT_VALUE) {
      return;
    }

    const ctx: CanvasRenderingContext2D = this.context;
    const w: number = this.canvasWidth;
    const h: number = this.viewHeight;

    // 第 0 步：清空画布（禁止省略）
    ctx.clearRect(INIT_VALUE, INIT_VALUE, w, h);

    // 设置全局文本默认值
    ctx.textAlign = 'center';
    ctx.textBaseline = 'middle';

    // 第 1 步：绘制月份标题
    this.drawMonthTitle(ctx, w);

    // 第 2 步：绘制星期标签
    this.drawMonthDayLabels(ctx, w);

    // 第 3 步：绘制日期数字网格
    this.drawMonthNums(ctx, w);

    hilog.debug(LOG_DOMAIN, LOG_TAG,
      'SimpleMonthView drawAll() complete, w=%{public}d h=%{public}d', w, h);
  }

  // ── 绘制步骤 1：月份标题 ──

  /**
   * 绘制月份标题 "June 2026" 格式。
   * 对应 Android drawMonthTitle(Canvas)。
   *
   * @param ctx Canvas 渲染上下文
   * @param w   Canvas 宽度
   */
  private drawMonthTitle(ctx: CanvasRenderingContext2D, w: number): void {
    // 月份标题字符
    const monthName: string = MONTH_NAMES[this.month];
    const title: string = monthName + ' ' + this.year.toString();

    // 标题颜色
    ctx.fillStyle = this.config.colorMonthName;

    // 粗体 + 字号 + sans-serif
    ctx.font = 'bold ' + this.config.textSizeMonth.toString() + 'vp sans-serif';

    // textAlign='center' + textBaseline='middle' → x=w/2, y=headerMonthHeight/2
    const x: number = w / 2;
    const y: number = this.config.headerMonthHeight / 2;
    ctx.fillText(title, x, y);
  }

  // ── 绘制步骤 2：星期标签 ──

  /**
   * 绘制星期首字母标签 "S M T W T F S"。
   * 对应 Android drawMonthDayLabels(Canvas)。
   *
   * @param ctx Canvas 渲染上下文
   * @param w   Canvas 宽度
   */
  private drawMonthDayLabels(ctx: CanvasRenderingContext2D, w: number): void {
    ctx.fillStyle = this.config.colorDayName;
    ctx.font = 'normal ' + this.config.textSizeDayName.toString() + 'vp sans-serif';

    const headerH: number = this.config.headerMonthHeight;

    for (let i: number = INIT_VALUE; i < DAYS_IN_WEEK; i++) {
      const dayOfWeekIndex: number = (i + this.weekStart - WEEK_START_SUNDAY + DAYS_IN_WEEK) % DAYS_IN_WEEK;
      const label: string = WEEK_DAY_NAMES[dayOfWeekIndex].charAt(FIRST_INDEX);

      // 列中心坐标: x = cellCenter + i * cellWidth
      const cellWidth: number = w / DAYS_IN_WEEK;
      const x: number = cellWidth / 2 + i * cellWidth;
      // y 位于 header 底部附近
      const y: number = headerH - this.config.textSizeDayName / 2;

      ctx.fillText(label, x, y);
    }
  }

  // ── 绘制步骤 3：日期数字网格 ──

  /**
   * 绘制 7×N 日期数字网格，含选中指示器和多种颜色状态。
   * 对应 Android drawMonthNums(Canvas)。
   *
   * @param ctx Canvas 渲染上下文
   * @param w   Canvas 宽度
   */
  private drawMonthNums(ctx: CanvasRenderingContext2D, w: number): void {
    const offset: number = this.dayOfWeekStart;
    const daysInMonth: number = CalendarUtils.getDaysInMonth(this.month, this.year);
    const headerH: number = this.config.headerMonthHeight;
    const cellWidth: number = w / DAYS_IN_WEEK;
    const rowH: number = this.rowHeight;

    // 选中指示器半透明
    const isSelected: boolean = (this.selectedBeginDay >= INIT_VALUE) || (this.selectedLastDay >= INIT_VALUE);

    for (let day: number = 1; day <= daysInMonth; day++) {
      const cellIndex: number = offset + day - FIRST_DAY_OF_MONTH;
      const row: number = Math.floor(cellIndex / DAYS_IN_WEEK);
      const col: number = cellIndex % DAYS_IN_WEEK;

      // 中心坐标
      const x: number = cellWidth / 2 + col * cellWidth;
      const y: number = headerH + row * rowH + rowH / 2;

      // 判断状态
      const isBegin: boolean = this.isSelectedBegin(day);
      const isLast: boolean = this.isSelectedLast(day);
      const isSelectedDay: boolean = isBegin || isLast;
      const isDayToday: boolean = this.isToday(day);
      const isPrev: boolean = this.isPreviousDay(day);

      // ── 选中指示器 ──
      if (isSelectedDay) {
        // Android 原始实现：使用 mSelectedCirclePaint.setAlpha(SELECTED_CIRCLE_ALPHA=128)
        // 在画笔级别编码透明度，不依赖 Canvas globalAlpha。
        // HarmonyOS Canvas fillStyle 使用 CSS #RRGGBBAA 格式（alpha 在末尾），
        // 需将 50% alpha 编码为后缀 0x80（128/255≈50%）。
        const rawColor: string = this.config.colorSelectedDayBackground;
        let fillColor: string = rawColor;
        if (rawColor.length === COLOR_HEX_6_LEN && rawColor.startsWith('#')) {
          fillColor = rawColor + SELECTED_BG_ALPHA_SUFFIX;
        } else if (rawColor.length === COLOR_HEX_6_LEN + 2 && rawColor.startsWith('#')) {
          fillColor = rawColor.substring(0, COLOR_HEX_6_LEN) + SELECTED_BG_ALPHA_SUFFIX;
        }
        ctx.fillStyle = fillColor;

        const indicatorCenterY: number = y - this.config.textSizeDay / 3;
        const radius: number = this.config.selectedDayRadius;

        if (this.config.drawRoundRect) {
          // 圆角矩形指示器
          const rx: number = 10; // 圆角半径
          const rw: number = radius * 2;
          const rh: number = radius * 2;
          const rectX: number = x - radius;
          const rectY: number = indicatorCenterY - radius;

          ctx.beginPath();
          ctx.roundRect(rectX, rectY, rw, rh, rx);
          ctx.closePath();
          ctx.fill();
        } else {
          // 圆形指示器
          ctx.beginPath();
          ctx.arc(x, indicatorCenterY, radius, INIT_VALUE, FULL_CIRCLE_RADIANS * Math.PI);
          ctx.closePath();
          ctx.fill();
        }
      }

      // ── 文字颜色和字号 ──
      if (isSelectedDay) {
        ctx.fillStyle = this.config.colorSelectedDayText;
      } else if (isDayToday) {
        ctx.fillStyle = this.config.colorCurrentDay;
      } else if (isPrev && !this.config.enablePreviousDay) {
        ctx.fillStyle = this.config.colorPreviousDay;
      } else {
        ctx.fillStyle = this.config.colorNormalDay;
      }

      // 字号：今日加粗，其他 normal；过去日期斜体
      let fontWeight: string = 'normal';
      let fontStyle: string = 'normal';
      if (isDayToday) {
        fontWeight = 'bold';
      }
      if (isPrev && !this.config.enablePreviousDay) {
        fontStyle = 'italic';
      }
      const fontStr: string = fontStyle + ' ' + fontWeight + ' ' +
        this.config.textSizeDay.toString() + 'vp sans-serif';
      ctx.font = fontStr;

      // 绘制日期数字
      ctx.fillText(day.toString(), x, y);
    }
  }

  // ── 触摸事件处理 ──

  /**
   * 将触摸坐标映射为日期。
   * 对应 Android getDayFromLocation(float x, float y)。
   *
   * @param x 触摸在 Canvas 内的 x 坐标
   * @param y 触摸在 Canvas 内的 y 坐标
   * @returns 映射到的日期 CalendarDay，无效时返回 null
   */
  private getDayFromLocation(x: number, y: number): CalendarDay | null {
    const w: number = this.canvasWidth;
    if (w <= INIT_VALUE) {
      return null;
    }

    // 检查是否在 padding/header 区域（header 区域不命中日期）
    const headerH: number = this.config.headerMonthHeight;
    if (y < headerH) {
      return null;
    }

    // 行列反算
    const cellWidth: number = w / 7;
    const rowH: number = this.rowHeight;
    if (rowH <= INIT_VALUE || cellWidth <= INIT_VALUE) {
      return null;
    }

    const row: number = Math.floor((y - headerH) / rowH);
    const col: number = Math.floor(x / cellWidth);

    // 检查行列越界
    if (row < INIT_VALUE || row >= this.numRows || col < INIT_VALUE || col >= DAYS_IN_WEEK) {
      return null;
    }

    // 计算日期序号
    const cellIndex: number = row * 7 + col;
    const dayNum: number = cellIndex - this.dayOfWeekStart + 1;

    // 检查日期有效范围
    const daysInMonth: number = CalendarUtils.getDaysInMonth(this.month, this.year);
    if (dayNum < FIRST_DAY_OF_MONTH || dayNum > daysInMonth) {
      return null;
    }

    return new CalendarDay(this.year, this.month, dayNum);
  }

  /**
   * 处理触摸事件。
   * 对应 Android onTouchEvent 的 ACTION_UP 分支。
   *
   * @param x 触摸在 Canvas 内的 x 坐标
   * @param y 触摸在 Canvas 内的 y 坐标
   */
  private handleTouch(x: number, y: number): void {
    const day: CalendarDay | null = this.getDayFromLocation(x, y);
    if (day === null) {
      return;
    }

    // 过去日期且点击禁用，不回调
    if (!this.config.enablePreviousDay && this.isPreviousDay(day.day)) {
      return;
    }

    hilog.debug(LOG_DOMAIN, LOG_TAG,
      'SimpleMonthView day tapped: year=%{public}d month=%{public}d day=%{public}d',
      day.year, day.month, day.day);

    if (this.onDayClick) {
      this.onDayClick(day.year, day.month, day.day);
    }
  }

  // ── 生命周 ──

  aboutToAppear(): void {
    const now: Date = new Date();
    this.todayDay = now.getDate();
    this.todayMonth = now.getMonth();
    this.todayYear = now.getFullYear();
    this.mIsPrev = (this.year < this.todayYear) ||
      (this.year === this.todayYear && this.month < this.todayMonth);
  }

  // ── 布局构建 ──

  build() {
    Column() {
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .onReady(() => {
          hilog.debug(LOG_DOMAIN, LOG_TAG, 'SimpleMonthView Canvas onReady');
          this.isInitialized = true;
          this.updateDerivedState();
          this.drawAll();
        })
        .onAreaChange((_oldValue: Area, newValue: Area) => {
          const newWidth: number = newValue.width as number;
          if (newWidth > INIT_VALUE && Math.abs(newWidth - this.canvasWidth) > AREA_CHANGE_TOLERANCE) {
            this.canvasWidth = newWidth;
            this.updateDerivedState();
            this.drawAll();
          } else if (newWidth > INIT_VALUE) {
            // 宽度未变，但仍尝试刷新
            this.updateDerivedState();
            this.drawAll();
          }
        })
    }
    .width('100%')
    .height(this.viewHeight)
    // TapGesture 替代 Canvas.onTouch，避免 List 内置 PanGesture 竞争导致触摸丢失
    .gesture(
      TapGesture()
        .onAction((event: GestureEvent) => {
          if (event.fingerList.length > 0) {
            this.handleTouch(event.fingerList[0].localX, event.fingerList[0].localY);
          }
        }),
      GestureMask.Normal
    )
  }
}
