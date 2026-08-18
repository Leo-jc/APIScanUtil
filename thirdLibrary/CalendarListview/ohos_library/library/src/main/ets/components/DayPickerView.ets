/**
 * DayPickerView — 日历日期选择器主入口组件
 *
 * 对应 Android DayPickerView（extends RecyclerView）。
 * 使用 ArkUI List + LazyForEach 替代 RecyclerView + Adapter 模式。
 * 承载月份列表数据生成、选中状态管理（SelectedDays 状态机）、样式配置传递。
 *
 * 使用方式（宿主代码）：
 * ```typescript
 * DayPickerView({
 *   controller: myDatePickerController,
 *   styleConfig: { colorSelectedDayBackground: '#FF0000', currentDaySelected: true }
 * })
 * ```
 *
 * @module components/DayPickerView
 */

import { CalendarDay } from '../model/CalendarDay';
import { SelectedDays } from '../model/SelectedDays';
import { DatePickerController } from '../model/DatePickerController';
import { MonthConfig } from '../model/MonthConfig';
import { SimpleMonthView } from './SimpleMonthView';
import { DayPickerStyleConfig } from './DayPickerStyleConfig';
import { MonthItem } from './MonthItem';
import { hilog } from '@kit.PerformanceAnalysisKit';

const LOG_DOMAIN: number = 0xFF00;
const LOG_TAG: string = 'CalendarListview';

// ── 常量定义（消除魔法值） ──
const INIT_VALUE: number = 0;
const NOT_SET: number = -1;
const FIRST_MONTH_INDEX: number = 0;

@Component
export struct DayPickerView {
  // ════════════════════════════════════════════════════════════════
  // 外部传入（非装饰器 public 字段 — 在构造时通过对象字面量赋值）
  // ════════════════════════════════════════════════════════════════

  /** 宿主控制器接口（必传，无 controller 时不渲染列表） */
  controller?: DatePickerController = undefined;

  /** 样式配置（可选，未提供时全部使用默认值） */
  @Prop @Watch('onStyleConfigChanged') styleConfig?: DayPickerStyleConfig = undefined;

  /**
   * 再生触发器 — 每次值递增时，重新生成月份列表。
   * 用于响应 controller 内部状态变化（如 maxYear 改变）。
   * 默认值 0，不传则不生效。
   */
  @Prop @Watch('onRegenKeyChanged') regenKey: number = 0;

  // ════════════════════════════════════════════════════════════════
  // 响应式状态 — 驱动 UI 刷新
  // ════════════════════════════════════════════════════════════════

  /** 月份列表数据源，驱动 LazyForEach 渲染 */
  @State months: MonthItem[] = [];

  // ════════════════════════════════════════════════════════════════
  // 内部状态（非装饰器 — 由事件回调使用，不直接参与 UI 绑定）
  // ════════════════════════════════════════════════════════════════

  /** 解析后的样式配置（缓存引用，避免 build() 中重复创建） */
  private resolvedConfig: MonthConfig = new MonthConfig();

  /** 当前选中起始日期 */
  private selectedFirst: CalendarDay | null = null;

  /** 当前选中结束日期 */
  private selectedLast: CalendarDay | null = null;

  // ════════════════════════════════════════════════════════════════
  // 生命周期
  // ════════════════════════════════════════════════════════════════

  aboutToAppear(): void {
    hilog.debug(LOG_DOMAIN, LOG_TAG, 'DayPickerView aboutToAppear');

    // 1. 从 styleConfig 解析出 MonthConfig（缓存引用）
    this.resolvedConfig = this.buildMonthConfig();

    // 2. 生成月份列表
    this.generateMonths();

    // 3. 处理默认选中当天
    this.handleCurrentDaySelected();

    hilog.debug(LOG_DOMAIN, LOG_TAG,
      'DayPickerView initialized: months.count=%{public}d', this.months.length);
  }

  /**
   * 当父组件更新 styleConfig 时，重新解析并刷新月份视图。
   */
  private onStyleConfigChanged(): void {
    if (!this.controller) {
      return;
    }
    this.resolvedConfig = this.buildMonthConfig();
    this.refreshMonthItems();
  }

  /**
   * 当 regenKey 变化时，重新生成月份列表。
   * 用于响应 controller 内部状态变化（如 maxYear 改变）。
   * 由于组件已挂载，不触发 handleCurrentDaySelected（避免重复选中当日）。
   */
  private onRegenKeyChanged(): void {
    if (!this.controller) {
      return;
    }
    this.selectedFirst = null;
    this.selectedLast = null;
    this.generateMonths();
    this.handleCurrentDaySelected();
  }

  // ════════════════════════════════════════════════════════════════
  // 样式配置解析
  // ════════════════════════════════════════════════════════════════

  /**
   * 将外部 DayPickerStyleConfig（可选字段）转换为 SimpleMonthView 可用的 MonthConfig 实例。
   * 未设置的字段使用 MonthConfig 默认值（与 PRD §3.1.5 一致）。
   */
  private buildMonthConfig(): MonthConfig {
    const cfg: MonthConfig = new MonthConfig();
    const sc: DayPickerStyleConfig | undefined = this.styleConfig;

    if (sc === undefined) {
      return cfg;
    }

    // 颜色
    if (sc.colorCurrentDay !== undefined) { cfg.colorCurrentDay = sc.colorCurrentDay; }
    if (sc.colorSelectedDayBackground !== undefined) { cfg.colorSelectedDayBackground = sc.colorSelectedDayBackground; }
    if (sc.colorSelectedDayText !== undefined) { cfg.colorSelectedDayText = sc.colorSelectedDayText; }
    if (sc.colorPreviousDay !== undefined) { cfg.colorPreviousDay = sc.colorPreviousDay; }
    if (sc.colorNormalDay !== undefined) { cfg.colorNormalDay = sc.colorNormalDay; }
    if (sc.colorMonthName !== undefined) { cfg.colorMonthName = sc.colorMonthName; }
    if (sc.colorDayName !== undefined) { cfg.colorDayName = sc.colorDayName; }

    // 字号
    if (sc.textSizeDay !== undefined) { cfg.textSizeDay = sc.textSizeDay; }
    if (sc.textSizeMonth !== undefined) { cfg.textSizeMonth = sc.textSizeMonth; }
    if (sc.textSizeDayName !== undefined) { cfg.textSizeDayName = sc.textSizeDayName; }

    // 尺寸
    if (sc.headerMonthHeight !== undefined) { cfg.headerMonthHeight = sc.headerMonthHeight; }
    if (sc.selectedDayRadius !== undefined) { cfg.selectedDayRadius = sc.selectedDayRadius; }
    if (sc.calendarHeight !== undefined) { cfg.calendarHeight = sc.calendarHeight; }

    // 开关
    if (sc.drawRoundRect !== undefined) { cfg.drawRoundRect = sc.drawRoundRect; }
    if (sc.enablePreviousDay !== undefined) { cfg.enablePreviousDay = sc.enablePreviousDay; }

    return cfg;
  }

  // ════════════════════════════════════════════════════════════════
  // 月份数据生成
  // ════════════════════════════════════════════════════════════════

  /**
   * 根据 controller.getMaxYear()、firstMonth、lastMonth 计算全部月份数据。
   * 对应 Android SimpleMonthAdapter.getItemCount() + onBindViewHolder()。
   */
  private generateMonths(): void {
    if (this.controller === undefined) {
      this.months = [];
      hilog.warn(LOG_DOMAIN, LOG_TAG, 'generateMonths: controller is undefined, empty list');
      return;
    }

    const now: Date = new Date();
    const currentYear: number = now.getFullYear();
    const currentMonth: number = now.getMonth();
    const maxYear: number = this.controller.getMaxYear();

    // 从 styleConfig 获取起止月（-1 时使用当前月；lastMonth 未设时默认11=12月，确保maxYear年显示全部月份）
    const firstMonth: number = this.styleConfig?.firstMonth ?? NOT_SET;
    const lastMonth: number = this.styleConfig?.lastMonth ?? NOT_SET;
    const calFirstMonth: number = firstMonth === NOT_SET ? currentMonth : firstMonth;
    const calLastMonth: number = lastMonth === NOT_SET ? 11 : lastMonth;

    // 边界检查：最大年份小于当前年 → 空列表
    if (maxYear < currentYear) {
      this.months = [];
      hilog.warn(LOG_DOMAIN, LOG_TAG,
        'generateMonths: maxYear(%{public}d) < currentYear(%{public}d), empty list',
        maxYear, currentYear);
      return;
    }

    const result: MonthItem[] = [];
    for (let y: number = currentYear; y <= maxYear; y++) {
      const startM: number = (y === currentYear) ? calFirstMonth : 0;
      const endM: number = (y === maxYear) ? calLastMonth : 11;

      // 当某一年的起止月份非法时跳过该年
      if (startM > endM) {
        continue;
      }

      for (let m: number = startM; m <= endM; m++) {
        result.push(this.newMonthItem(y, m));
      }
    }

    this.months = result;
    hilog.debug(LOG_DOMAIN, LOG_TAG,
      'generateMonths: count=%{public}d, range=[%{public}d-%{public}d..%{public}d-%{public}d]',
      result.length, currentYear, calFirstMonth, maxYear, calLastMonth);
  }

  /**
   * 根据当前选中状态创建一个月份的 MonthItem。
   *
   * @param year  年份
   * @param month 月份（0-indexed）
   * @returns 配置完整的 MonthItem
   */
  private newMonthItem(year: number, month: number): MonthItem {
    let beginDay: number = -1;
    let beginMonth: number = -1;
    let beginYear: number = -1;
    let lastDay: number = -1;
    let lastMonth: number = -1;
    let lastYear: number = -1;

    if (this.selectedFirst !== null &&
      this.selectedFirst.year === year &&
      this.selectedFirst.month === month) {
      beginDay = this.selectedFirst.day;
      beginMonth = this.selectedFirst.month;
      beginYear = this.selectedFirst.year;
    }

    if (this.selectedLast !== null &&
      this.selectedLast.year === year &&
      this.selectedLast.month === month) {
      lastDay = this.selectedLast.day;
      lastMonth = this.selectedLast.month;
      lastYear = this.selectedLast.year;
    }

    return {
      id: year.toString() + '-' + month.toString(),
      year: year,
      month: month,
      selectedBeginDay: beginDay,
      selectedBeginMonth: beginMonth,
      selectedBeginYear: beginYear,
      selectedLastDay: lastDay,
      selectedLastMonth: lastMonth,
      selectedLastYear: lastYear
    };
  }

  /**
   * 刷新所有月份项的选中参数。
   * 遍历当前 months 数组，根据最新的 selectedFirst/selectedLast 重建每个 MonthItem。
   * 通过赋值新数组触发 @State 变更 → UI 刷新。
   */
  private refreshMonthItems(): void {
    const updated: MonthItem[] = [];
    for (let i: number = INIT_VALUE; i < this.months.length; i++) {
      const item: MonthItem = this.months[i];
      updated.push(this.newMonthItem(item.year, item.month));
    }
    this.months = updated;
  }

  // ════════════════════════════════════════════════════════════════
  // 默认选中当日
  // ════════════════════════════════════════════════════════════════

  /**
   * 如果 styleConfig.currentDaySelected === true，在初始化时自动选中当日。
   * 触发 onDayOfMonthSelected 回调并更新月份视图。
   */
  private handleCurrentDaySelected(): void {
    if (this.controller === undefined) {
      return;
    }
    if (!(this.styleConfig?.currentDaySelected === true)) {
      return;
    }

    const now: Date = new Date();
    const today: CalendarDay = new CalendarDay(
      now.getFullYear(),
      now.getMonth(),
      now.getDate()
    );

    this.selectedFirst = today;
    this.selectedLast = null;

    // 触发回调
    this.controller.onDayOfMonthSelected(today.year, today.month, today.day);

    // 刷新月份视图
    this.refreshMonthItems();

    hilog.info(LOG_DOMAIN, LOG_TAG,
      'currentDaySelected: auto-selected today %{public}d-%{public}d-%{public}d',
      today.year, today.month, today.day);
  }

  // ════════════════════════════════════════════════════════════════
  // 选中状态机（对应 SimpleMonthAdapter.setSelectedDay / onDayTapped）
  // ════════════════════════════════════════════════════════════════

  /**
   * 选中状态机状态转换：
   * 1. 初始态（first=null, last=null）
   *    → 首次点击：first=day, last=null → onDayOfMonthSelected
   * 2. 已选首日（first!=null, last=null）
   *    a) 同一天 → onDayOfMonthSelected（重新选中）
   *    b) 不同天 → last=day → onDateRangeSelected（范围完成）
   * 3. 范围已选（first!=null, last!=null）
   *    → 重置：first=day, last=null → onDayOfMonthSelected
   */
  private onDayTapped(year: number, month: number, day: number): void {
    const tapped: CalendarDay = new CalendarDay(year, month, day);

    if (this.selectedFirst === null) {
      // ── 步骤 1：首次点击 ──
      this.selectedFirst = tapped;
      this.selectedLast = null;
      this.controller?.onDayOfMonthSelected(year, month, day);
      hilog.debug(LOG_DOMAIN, LOG_TAG,
        'onDayTapped: first set to %{public}d-%{public}d-%{public}d',
        year, month, day);
    } else if (this.selectedLast === null) {
      // ── 步骤 2：第二次点击 ──
      const sameDay: boolean =
        tapped.year === this.selectedFirst.year &&
        tapped.month === this.selectedFirst.month &&
        tapped.day === this.selectedFirst.day;

      if (sameDay) {
        // 同一天 — 重新选中当日
        this.controller?.onDayOfMonthSelected(year, month, day);
        hilog.debug(LOG_DOMAIN, LOG_TAG,
          'onDayTapped: re-select same day %{public}d-%{public}d-%{public}d',
          year, month, day);
      } else {
        // 不同天 — 完成范围选择
        this.selectedLast = tapped;

        const range: SelectedDays<CalendarDay> = new SelectedDays<CalendarDay>();
        range.setFirst(this.selectedFirst);
        range.setLast(this.selectedLast);
        this.controller?.onDateRangeSelected(range);

        hilog.info(LOG_DOMAIN, LOG_TAG,
          'onDayTapped: range selected [%{public}d-%{public}d-%{public}d] -> [%{public}d-%{public}d-%{public}d]',
          this.selectedFirst.year, this.selectedFirst.month, this.selectedFirst.day,
          year, month, day);
      }
    } else {
      // ── 步骤 3：已有完整范围，重置为新选中 ──
      this.selectedFirst = tapped;
      this.selectedLast = null;
      this.controller?.onDayOfMonthSelected(year, month, day);
      hilog.debug(LOG_DOMAIN, LOG_TAG,
        'onDayTapped: reset, first set to %{public}d-%{public}d-%{public}d',
        year, month, day);
    }

    // 刷新所有月份项的选中状态
    this.refreshMonthItems();
  }

  // ════════════════════════════════════════════════════════════════
  // 公开访问器
  // ════════════════════════════════════════════════════════════════

  /**
   * 返回当前选中的日期范围。
   * 对应 Android getSelectedDays()。
   *
   * @returns 包含 first/last 的 SelectedDays 实例（可能为 null）
   */
  getSelectedDays(): SelectedDays<CalendarDay> {
    const result: SelectedDays<CalendarDay> = new SelectedDays<CalendarDay>();
    result.setFirst(this.selectedFirst);
    result.setLast(this.selectedLast);
    return result;
  }

  // ════════════════════════════════════════════════════════════════
  // 布局构建
  // ════════════════════════════════════════════════════════════════

  build() {
    Column() {
      if (this.controller !== undefined && this.months.length > INIT_VALUE) {
        List() {
          ForEach(this.months, (item: MonthItem) => {
            ListItem() {
              SimpleMonthView({
                config: this.resolvedConfig,
                year: item.year,
                month: item.month,
                selectedBeginDay: item.selectedBeginDay,
                selectedBeginMonth: item.selectedBeginMonth,
                selectedBeginYear: item.selectedBeginYear,
                selectedLastDay: item.selectedLastDay,
                selectedLastMonth: item.selectedLastMonth,
                selectedLastYear: item.selectedLastYear,
                onDayClick: (y: number, m: number, d: number): void => this.onDayTapped(y, m, d)
              })
            }
          }, (item: MonthItem): string => item.id + '_' + item.selectedBeginDay + '_' + item.selectedLastDay)
        }
        .width('100%')
        .height('100%')
      }
    }
    .width('100%')
    .height('100%')
  }
}
