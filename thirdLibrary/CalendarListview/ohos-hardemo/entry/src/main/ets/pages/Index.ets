/**
 * CalendarListview — Demo 主页面
 *
 * 展示 DayPickerView 日历组件的完整功能：
 * - 单日选择与日期范围选择
 * - 样式配置动态调整
 * - 回调事件日志
 */

import {
  DayPickerView,
  DatePickerController,
  CalendarDay,
  SelectedDays,
  DayPickerStyleConfig
} from 'library';
import { hilog } from '@kit.PerformanceAnalysisKit';

// ── 常量 ──
const LOG_DOMAIN: number = 0x0001;
const LOG_TAG: string = 'CalendarDemo';
const INIT_VALUE: number = 0;
const DURATION_ANIMATION: number = 200;
const PANEL_MIN_HEIGHT: number = 0;
const PANEL_MAX_HEIGHT: number = 400;
const FONT_SIZE_TITLE: number = 20;
const FONT_SIZE_NORMAL: number = 16;
const FONT_SIZE_SMALL: number = 14;
const FONT_SIZE_BADGE: number = 12;
const FONT_SIZE_XSMALL: number = 10;
const RADIUS_CARD: number = 16;
const RADIUS_BUTTON: number = 12;
const RADIUS_SWITCH_BG: number = 12;
const SPACING_SMALL: number = 8;
const SPACING_MEDIUM: number = 12;
const SPACING_LARGE: number = 16;
const SPACING_XLARGE: number = 24;
const PADDING_PAGE: number = 16;
const PADDING_CARD: number = 16;
const PADDING_COMPACT: number = 12;
const PANEL_HEADER_HEIGHT: number = 44;
const MAX_LOG_LINES: number = 50;
const ROW_HEIGHT_CONFIG: number = 36;
const COLOR_SWATCH_SIZE: number = 24;
const BUTTON_HEIGHT_CLEAR: number = 28;
const TIMESTAMP_WIDTH: number = 70;
const LAYOUT_WEIGHT_ONE: number = 1;
const MAX_LINES_LOG_ENTRY: number = 2;
const COLOR_LABEL_SPACING: number = 4;
const LOG_ENTRY_SPACING: number = 4;
const OPACITY_DISABLED: number = 0.4;
const OPACITY_FULL: number = 1.0;
const COLOR_PRIMARY: string = '#E75F49';
const COLOR_SECONDARY: string = '#4A90D9';
const COLOR_BG_CARD: string = '#FFFFFF';
const COLOR_BG_PAGE: string = '#F5F5F5';
const COLOR_TEXT_PRIMARY: string = '#333333';
const COLOR_TEXT_SECONDARY: string = '#666666';
const COLOR_TEXT_TERTIARY: string = '#999999';
const COLOR_BORDER: string = '#E0E0E0';
const COLOR_SECTION_BG: string = '#FAFAFA';

// ── 控制器类（实现 DatePickerController 接口） ──

class DemoController implements DatePickerController {
  private owner: Index;

  constructor(owner: Index) {
    this.owner = owner;
  }

  getMaxYear(): number {
    const now: Date = new Date();
    return now.getFullYear() + 1;
  }

  onDayOfMonthSelected(year: number, month: number, day: number): void {
    const dateStr: string = year + '-' + (month + 1).toString() + '-' + day.toString();
    this.owner.selectedDateText = dateStr;
    this.owner.selectedYearText = year.toString();
    this.owner.selectedMonthText = (month + 1).toString();
    this.owner.selectedDayText = day.toString();
    this.owner.addLog('onDayOfMonthSelected', '选中日期: ' + dateStr);
  }

  onDateRangeSelected(selectedDays: SelectedDays<CalendarDay>): void {
    const first: CalendarDay | null = selectedDays.getFirst();
    const last: CalendarDay | null = selectedDays.getLast();
    if (first !== null && last !== null) {
      const firstStr: string = first.year + '-' + (first.month + 1).toString() + '-' + first.day.toString();
      const lastStr: string = last.year + '-' + (last.month + 1).toString() + '-' + last.day.toString();
      this.owner.selectedRangeText = firstStr + ' ~ ' + lastStr;
      this.owner.rangeFirstText = firstStr;
      this.owner.rangeLastText = lastStr;
      this.owner.addLog('onDateRangeSelected', '范围: ' + firstStr + ' ~ ' + lastStr);
    }
  }
}

// ── 样式配置构建 Helpers ──

function makeStyleConfig(
  bg: string, roundRect: boolean, curDaySel: boolean, enablePrev: boolean, curDayColor: string
): DayPickerStyleConfig {
  return {
    colorSelectedDayBackground: bg,
    drawRoundRect: roundRect,
    currentDaySelected: curDaySel,
    enablePreviousDay: enablePrev,
    colorCurrentDay: curDayColor
  } as DayPickerStyleConfig;
}

// ── 数据模型 ──

class LogEntry {
  timestamp: string = '';
  message: string = '';

  constructor(timestamp: string, message: string) {
    this.timestamp = timestamp;
    this.message = message;
  }
}

@Entry
@Component
struct Index {
  // ── 日期选择状态 ──
  @State selectedDateText: string = '未选择';
  @State selectedRangeText: string = '未选择';
  @State selectedDayText: string = '—';
  @State selectedMonthText: string = '—';
  @State selectedYearText: string = '—';
  @State rangeFirstText: string = '—';
  @State rangeLastText: string = '—';

  // ── 日志 ──
  @State logEntries: LogEntry[] = [];

  // ── 样式配置 ──
  @State configColorSelectedBg: string = COLOR_PRIMARY;
  @State configDrawRoundRect: boolean = false;
  @State configCurrentDaySelected: boolean = true;
  @State configEnablePreviousDay: boolean = true;
  @State configColorCurrentDay: string = '#E75F49';

  // ── UI 面板状态 ──
  @State stylePanelExpanded: boolean = false;
  @State logPanelExpanded: boolean = true;

  // ── 控制器实例 ──
  private demoController: DemoController = new DemoController(this);

  // ── 日志方法 ──

  addLog(event: string, detail: string): void {
    const now: Date = new Date();
    const ts: string =
      now.getHours().toString().padStart(2, '0') + ':' +
      now.getMinutes().toString().padStart(2, '0') + ':' +
      now.getSeconds().toString().padStart(2, '0') + '.' +
      now.getMilliseconds().toString().padStart(3, '0');
    const entry: LogEntry = new LogEntry(ts, '[' + event + '] ' + detail);
    const newLogs: LogEntry[] = [entry, ...this.logEntries];
    if (newLogs.length > MAX_LOG_LINES) {
      newLogs.length = MAX_LOG_LINES;
    }
    this.logEntries = newLogs;
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', event + ': ' + detail);
  }

  // ── 样式面板切换 ──

  private toggleStylePanel(): void {
    this.stylePanelExpanded = !this.stylePanelExpanded;
  }

  private toggleLogPanel(): void {
    this.logPanelExpanded = !this.logPanelExpanded;
  }

  // ── 清除日志 ──

  private clearLogs(): void {
    this.logEntries = [];
  }

  // ── 重置选中状态 ──

  private resetSelection(): void {
    this.selectedDateText = '未选择';
    this.selectedRangeText = '未选择';
    this.selectedDayText = '—';
    this.selectedMonthText = '—';
    this.selectedYearText = '—';
    this.rangeFirstText = '—';
    this.rangeLastText = '—';
    this.addLog('reset', '已重置选中状态（刷新页面以重置日历）');
  }

  // ── 获取当前样式配置摘要 ──

  private getStyleSummary(): string {
    let summary: string = '选中色: ' + this.configColorSelectedBg;
    summary += ', 指示器: ' + (this.configDrawRoundRect ? '圆角矩形' : '圆形');
    summary += ', 默认选中今天: ' + (this.configCurrentDaySelected ? '开' : '关');
    summary += ', 过去日期: ' + (this.configEnablePreviousDay ? '可用' : '禁用');
    return summary;
  }

  // ── 布局构建 ──

  build() {
    Column() {
      // ═══════════════════════════════════════════
      // 状态栏
      // ═══════════════════════════════════════════
      this.buildStatusBar()

      // ═══════════════════════════════════════════
      // 日历组件
      // ═══════════════════════════════════════════
      this.buildCalendarSection()

      // ═══════════════════════════════════════════
      // 可折叠面板
      // ═══════════════════════════════════════════
      Scroll() {
        Column() {
          // 样式配置面板
          this.buildConfigPanel()

          // 间距
          Blank().height(SPACING_SMALL)

          // 日志面板
          this.buildLogPanel()

          // 底部安全间距
          Blank().height(SPACING_LARGE)
        }
        .width('100%')
        .padding({ left: PADDING_PAGE, right: PADDING_PAGE })
      }
      .width('100%')
      .layoutWeight(LAYOUT_WEIGHT_ONE)
      .backgroundColor(COLOR_BG_PAGE)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(COLOR_BG_PAGE)
  }

  // ════════════════════════════════════════════════
  // 构建子组件
  // ════════════════════════════════════════════════

  /**
   * 顶部状态栏 — 标题和选中信息
   */
  @Builder
  buildStatusBar() {
    Column() {
      // 标题
      Text('CalendarListview Demo')
        .fontSize(FONT_SIZE_TITLE)
        .fontWeight(FontWeight.Bold)
        .fontColor(COLOR_TEXT_PRIMARY)
        .width('100%')

      Blank().height(SPACING_SMALL)

      // 选中日期信息卡片
      Row() {
        Column() {
          Text('选中日期')
            .fontSize(FONT_SIZE_SMALL)
            .fontColor(COLOR_TEXT_TERTIARY)
          Text(this.selectedDateText)
            .fontSize(FONT_SIZE_NORMAL)
            .fontWeight(FontWeight.Medium)
            .fontColor(COLOR_PRIMARY)
        }
        .alignItems(HorizontalAlign.Start)

        Blank().width(SPACING_LARGE)

        Column() {
          Text('日期范围')
            .fontSize(FONT_SIZE_SMALL)
            .fontColor(COLOR_TEXT_TERTIARY)
          Text(this.selectedRangeText)
            .fontSize(FONT_SIZE_NORMAL)
            .fontWeight(FontWeight.Medium)
            .fontColor(COLOR_SECONDARY)
        }
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .padding(PADDING_CARD)
      .backgroundColor(COLOR_BG_CARD)
      .borderRadius(RADIUS_CARD)
    }
    .width('100%')
    .padding({ left: PADDING_PAGE, right: PADDING_PAGE, top: SPACING_MEDIUM, bottom: SPACING_SMALL })
    .backgroundColor(COLOR_BG_CARD)
  }

  /**
   * 日历组件区域
   */
  @Builder
  buildCalendarSection() {
    Column() {
      DayPickerView({
        controller: this.demoController,
        styleConfig: makeStyleConfig(
          this.configColorSelectedBg,
          this.configDrawRoundRect,
          this.configCurrentDaySelected,
          this.configEnablePreviousDay,
          this.configColorCurrentDay
        )
      })
        .width('100%')
    }
    .width('100%')
    .padding(SPACING_SMALL)
    .backgroundColor(COLOR_BG_CARD)
    .borderRadius(RADIUS_CARD)
    .margin({ left: PADDING_PAGE, right: PADDING_PAGE, top: SPACING_SMALL })
  }

  /**
   * 样式配置可折叠面板
   */
  @Builder
  buildConfigPanel() {
    Column() {
      // 面板标题行（可点击切换展开/折叠）
      Row() {
        Text('🎨 样式配置')
          .fontSize(FONT_SIZE_NORMAL)
          .fontWeight(FontWeight.Bold)
          .fontColor(COLOR_TEXT_PRIMARY)

        Blank()

        Text(this.stylePanelExpanded ? '收起 ▲' : '展开 ▼')
          .fontSize(FONT_SIZE_SMALL)
          .fontColor(COLOR_TEXT_TERTIARY)
      }
      .width('100%')
      .height(PANEL_HEADER_HEIGHT)
      .padding({ left: PADDING_COMPACT, right: PADDING_COMPACT })
      .onClick(() => this.toggleStylePanel())

      // 配置项（展开时才渲染）
      if (this.stylePanelExpanded) {
        Column() {
          // ── 选中背景色 ──
          Row() {
            Text('选中背景色')
              .fontSize(FONT_SIZE_SMALL)
              .fontColor(COLOR_TEXT_SECONDARY)
            Blank()
            Text(this.configColorSelectedBg)
              .fontSize(FONT_SIZE_SMALL)
              .fontColor(COLOR_TEXT_TERTIARY)
          }
          .width('100%')
          .height(ROW_HEIGHT_CONFIG)
          .padding({ left: PADDING_COMPACT, right: PADDING_COMPACT })

          // 颜色预设按钮行
          Row() {
            this.buildColorButton('#E75F49', '默认红')
            this.buildColorButton('#4A90D9', '蓝色')
            this.buildColorButton('#50C878', '绿色')
            this.buildColorButton('#9B59B6', '紫色')
            this.buildColorButton('#F39C12', '橙色')
          }
          .width('100%')
          .padding({ left: PADDING_COMPACT, right: PADDING_COMPACT })
          .justifyContent(FlexAlign.SpaceBetween)

          Blank().height(SPACING_MEDIUM)

          // ── 选中指示器类型 ──
          Row() {
            Text('选中指示器')
              .fontSize(FONT_SIZE_SMALL)
              .fontColor(COLOR_TEXT_SECONDARY)
            Blank()
            Text(this.configDrawRoundRect ? '圆角矩形' : '圆形')
              .fontSize(FONT_SIZE_SMALL)
              .fontColor(COLOR_TEXT_TERTIARY)
            Blank().width(SPACING_SMALL)
            Toggle({ type: ToggleType.Switch, isOn: this.configDrawRoundRect })
              .onChange((isOn: boolean) => {
                this.configDrawRoundRect = isOn;
                this.addLog('config', '指示器: ' + (isOn ? '圆角矩形' : '圆形'));
              })
          }
          .width('100%')
          .height(ROW_HEIGHT_CONFIG)
          .padding({ left: PADDING_COMPACT, right: PADDING_COMPACT })

          // ── 当日文字颜色高亮 ──
          Row() {
            Text('当日文字高亮')
              .fontSize(FONT_SIZE_SMALL)
              .fontColor(COLOR_TEXT_SECONDARY)
            Blank()
            Text(this.configColorCurrentDay)
              .fontSize(FONT_SIZE_SMALL)
              .fontColor(COLOR_TEXT_TERTIARY)
          }
          .width('100%')
          .height(ROW_HEIGHT_CONFIG)
          .padding({ left: PADDING_COMPACT, right: PADDING_COMPACT })

          Row() {
            this.buildColorButton('#E75F49', '红色')
            this.buildColorButton('#4A90D9', '蓝色')
            this.buildColorButton('#50C878', '绿色')
          }
          .width('100%')
          .padding({ left: PADDING_COMPACT, right: PADDING_COMPACT })
          .justifyContent(FlexAlign.Start)

          Blank().height(SPACING_MEDIUM)

          // ── 默认选中今天 ──
          Row() {
            Text('默认选中今天')
              .fontSize(FONT_SIZE_SMALL)
              .fontColor(COLOR_TEXT_SECONDARY)
            Blank()
            Toggle({ type: ToggleType.Switch, isOn: this.configCurrentDaySelected })
              .onChange((isOn: boolean) => {
                this.configCurrentDaySelected = isOn;
                this.addLog('config', '默认选中今天: ' + (isOn ? '开' : '关') +
                  '（需刷新页面生效）');
              })
          }
          .width('100%')
          .height(ROW_HEIGHT_CONFIG)
          .padding({ left: PADDING_COMPACT, right: PADDING_COMPACT })

          // ── 过去日期可点击 ──
          Row() {
            Text('过去日期可点击')
              .fontSize(FONT_SIZE_SMALL)
              .fontColor(COLOR_TEXT_SECONDARY)
            Blank()
            Toggle({ type: ToggleType.Switch, isOn: this.configEnablePreviousDay })
              .onChange((isOn: boolean) => {
                this.configEnablePreviousDay = isOn;
                this.addLog('config', '过去日期: ' + (isOn ? '可点击' : '禁用'));
              })
          }
          .width('100%')
          .height(ROW_HEIGHT_CONFIG)
          .padding({ left: PADDING_COMPACT, right: PADDING_COMPACT })

          // ── 应用刷新提示 ──
          Blank().height(SPACING_SMALL)

          Text('提示：部分配置变更后需刷新页面才能完全生效')
            .fontSize(FONT_SIZE_SMALL)
            .fontColor(COLOR_TEXT_TERTIARY)
            .width('100%')
            .textAlign(TextAlign.Center)
        }
        .width('100%')
        .padding({ bottom: PADDING_COMPACT })
      }
    }
    .width('100%')
    .backgroundColor(COLOR_BG_CARD)
    .borderRadius(RADIUS_CARD)
  }

  /**
   * 颜色选择按钮
   */
  @Builder
  buildColorButton(color: string, label: string) {
    Column() {
      Row()
        .width(COLOR_SWATCH_SIZE)
        .height(COLOR_SWATCH_SIZE)
        .backgroundColor(color)
        .borderRadius(RADIUS_SWITCH_BG)
        .margin({ bottom: COLOR_LABEL_SPACING })
      Text(label)
        .fontSize(FONT_SIZE_XSMALL)
        .fontColor(COLOR_TEXT_TERTIARY)
    }
    .onClick(() => {
      // 判断是选中背景色还是当日文字色
      if (label === '红色' || label === '蓝色' || label === '绿色') {
        this.configColorCurrentDay = color;
      } else {
        this.configColorSelectedBg = color;
      }
      this.addLog('config', '颜色: ' + label + ' (' + color + ')');
    })
  }

  /**
   * 回调日志可折叠面板
   */
  @Builder
  buildLogPanel() {
    Column() {
      // 面板标题行
      Row() {
        Text('📋 回调日志')
          .fontSize(FONT_SIZE_NORMAL)
          .fontWeight(FontWeight.Bold)
          .fontColor(COLOR_TEXT_PRIMARY)

        Blank()

        Button('清除')
          .fontSize(FONT_SIZE_SMALL)
          .height(BUTTON_HEIGHT_CLEAR)
          .borderRadius(RADIUS_BUTTON)
          .onClick(() => this.clearLogs())

        Blank().width(SPACING_SMALL)

        Text(this.logPanelExpanded ? '收起 ▲' : '展开 ▼')
          .fontSize(FONT_SIZE_SMALL)
          .fontColor(COLOR_TEXT_TERTIARY)
          .onClick(() => this.toggleLogPanel())
      }
      .width('100%')
      .height(PANEL_HEADER_HEIGHT)
      .padding({ left: PADDING_COMPACT, right: PADDING_COMPACT })
      .onClick(() => this.toggleLogPanel())

      // 日志列表（展开时才渲染）
      if (this.logPanelExpanded) {
        Column() {
          if (this.logEntries.length === INIT_VALUE) {
            Blank().height(SPACING_LARGE)
            Text('暂无回调事件，请点击日历上的日期')
              .fontSize(FONT_SIZE_SMALL)
              .fontColor(COLOR_TEXT_TERTIARY)
              .width('100%')
              .textAlign(TextAlign.Center)
            Blank().height(SPACING_LARGE)
          } else {
            ForEach(this.logEntries, (entry: LogEntry) => {
              Row() {
                Text(entry.timestamp)
                  .fontSize(FONT_SIZE_SMALL)
                  .fontColor(COLOR_TEXT_TERTIARY)
                  .fontFamily('monospace')
                  .width(TIMESTAMP_WIDTH)
                Text(entry.message)
                  .fontSize(FONT_SIZE_SMALL)
                  .fontColor(COLOR_TEXT_SECONDARY)
                   .maxLines(MAX_LINES_LOG_ENTRY)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .layoutWeight(LAYOUT_WEIGHT_ONE)
              }
              .width('100%')
              .padding({ top: LOG_ENTRY_SPACING, bottom: LOG_ENTRY_SPACING, left: PADDING_COMPACT, right: PADDING_COMPACT })
            }, (entry: LogEntry): string => entry.timestamp + entry.message)
          }
        }
        .width('100%')
        .padding({ bottom: PADDING_COMPACT })
      }
    }
    .width('100%')
    .backgroundColor(COLOR_BG_CARD)
    .borderRadius(RADIUS_CARD)
  }
}
