import { router } from '@kit.ArkUI';
import {
  SectionedDataSource,
  SectionedGrid,
  SectionedModel,
  SectionEntry,
  SectionEntryKind,
  TYPE_ITEM
} from 'sectionedrecyclerview';

/** Custom item viewType used to demonstrate getSectionItemViewType override (multi-viewType dispatch). */
const TYPE_HIGHLIGHT: number = 1;

/**
 * CountModel mirrors Android's CountSectionAdapter data contract:
 *   - getSectionCount: runtime-mutable (reads page's @State sectionCount)
 *   - getItemCountForSection(section): section + 1 (matches Android sample)
 *   - hasFooterInSection(section): every section has a footer by default; section 0 can be toggled
 *   - getSectionItemViewType: TYPE_ITEM by default, TYPE_HIGHLIGHT for odd positions when multiViewType is on
 *
 * The model holds a reference to the page so it can read runtime @State. Whenever the page mutates
 * state it calls dataSource.notifySectionReloaded() / notifySectionItemChanged() so the data source
 * re-derives indices and fires onDataReloaded / onDataChange back to the LazyForEach.
 */
class CountModel extends SectionedModel {
  sectionCount: number = 5;
  footerS0Enabled: boolean = true;
  multiViewType: boolean = false;

  getSectionCount(): number {
    return this.sectionCount;
  }

  getItemCountForSection(section: number): number {
    return section + 1;
  }

  hasFooterInSection(section: number): boolean {
    if (section === 0) {
      return this.footerS0Enabled;
    }
    return true;
  }

  getSectionItemViewType(section: number, position: number): number {
    if (this.multiViewType && position % 2 === 1) {
      return TYPE_HIGHLIGHT;
    }
    return TYPE_ITEM;
  }
}

@Entry
@Component
struct CountGridPage {
  @State sectionCount: number = 5;
  @State footerS0Enabled: boolean = true;
  @State multiViewType: boolean = false;
  @State logMessages: string[] = [];
  @State contentVersion: number = 0;

  private colors: string[] = ['#F44336', '#2196F3', '#009688', '#8BC34A', '#FF9800'];
  private model: CountModel = new CountModel();
  private dataSource: SectionedDataSource = new SectionedDataSource(this.model);
  private itemOverrides: Map<string, number> = new Map<string, number>();
  private headerOverrides: Map<string, string> = new Map<string, string>();
  private footerOverrides: Map<string, string> = new Map<string, string>();
  private headerChangeCount: number = 0;
  private footerChangeCount: number = 0;
  private logSerial: number = 0;

  aboutToAppear(): void {
    this.syncModelState();
    this.dataSource.notifySectionReloaded();
    this.appendLog('aboutToAppear: sectionCount=' + this.sectionCount + ', totalCount=' + this.dataSource.totalCount());
  }

  private syncModelState(): void {
    this.model.sectionCount = this.sectionCount;
    this.model.footerS0Enabled = this.footerS0Enabled;
    this.model.multiViewType = this.multiViewType;
  }

  private appendLog(message: string): void {
    this.logSerial++;
    const stamp = this.formatTime();
    const line = '[' + stamp + ' #' + this.logSerial + '] ' + message;
    const nextMessages: string[] = [line];
    const limit: number = this.logMessages.length < 49 ? this.logMessages.length : 49;
    for (let i = 0; i < limit; i++) {
      nextMessages.push(this.logMessages[i]);
    }
    this.logMessages = nextMessages;
  }

  private formatTime(): string {
    const d = new Date();
    return this.pad2(d.getHours()) + ':' + this.pad2(d.getMinutes()) + ':' + this.pad2(d.getSeconds());
  }

  private pad2(n: number): string {
    return n < 10 ? '0' + n : n.toString();
  }

  private resolveItemText(entry: SectionEntry, version: number): string {
    if (version < 0) {
      return '';
    }
    const key = entry.section + ':' + entry.positionWithinSection;
    const override = this.itemOverrides.get(key);
    if (override !== undefined) {
      return override.toString();
    }
    return (entry.positionWithinSection + 1).toString();
  }

  private resolveHeaderText(section: number, version: number): string {
    if (version < 0) {
      return '';
    }
    const override = this.headerOverrides.get(section.toString());
    if (override !== undefined) {
      return override;
    }
    return 'Section ' + (section + 1);
  }

  private resolveFooterText(section: number, version: number): string {
    if (version < 0) {
      return '';
    }
    const override = this.footerOverrides.get(section.toString());
    if (override !== undefined) {
      return override;
    }
    return 'Footer ' + (section + 1);
  }

  // --- @Builders: faithful port of app/res/layout/view_count_*.xml ---

  @Builder
  renderHeader(entry: SectionEntry) {
    Row() {
      Text(this.resolveHeaderText(entry.section, this.contentVersion).toUpperCase())
        .fontColor($r('app.color.count_header_text'))
        .fontSize($r('app.float.count_header_text_size'))
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .width('100%')
    }
    .height($r('app.float.count_header_height'))
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ left: 16, right: 16 })
  }

  @Builder
  renderItem(entry: SectionEntry) {
    Stack() {
      Text(this.resolveItemText(entry, this.contentVersion))
        .fontColor($r('app.color.count_item_text'))
        .fontSize($r('app.float.count_item_text_size'))
        .fontWeight(FontWeight.Bold)
    }
    .backgroundColor(this.colors[entry.section % this.colors.length])
    .width('100%')
    .height($r('app.float.count_item_height'))
    .border({ width: entry.viewType === TYPE_HIGHLIGHT ? 3 : 0, color: '#FFFFFF' })
  }

  @Builder
  renderFooter(entry: SectionEntry) {
    Row() {
      Text(this.resolveFooterText(entry.section, this.contentVersion))
        .fontColor($r('app.color.count_footer_text'))
        .fontSize($r('app.float.count_footer_text_size'))
        .textAlign(TextAlign.End)
        .width('100%')
    }
    .height($r('app.float.count_footer_height'))
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ left: 16, right: 16 })
  }

  // --- Action handlers ---

  onAddSection(): void {
    this.sectionCount++;
    this.syncModelState();
    this.dataSource.notifySectionReloaded();
    this.appendLog('+Section → sectionCount=' + this.sectionCount + ', totalCount=' + this.dataSource.totalCount());
  }

  onRemoveSection(): void {
    if (this.sectionCount <= 0) {
      this.appendLog('-Section → 已是最小 0 段，无法继续减少');
      return;
    }
    this.sectionCount--;
    this.syncModelState();
    this.dataSource.notifySectionReloaded();
    this.appendLog('-Section → sectionCount=' + this.sectionCount + ', totalCount=' + this.dataSource.totalCount());
  }

  onToggleFooter(): void {
    this.footerS0Enabled = !this.footerS0Enabled;
    this.syncModelState();
    this.dataSource.notifySectionReloaded();
    this.appendLog('Toggle Footer S0 → hasFooter(0)=' + this.footerS0Enabled + ', totalCount=' + this.dataSource.totalCount());
  }

  onToggleMultiViewType(): void {
    this.multiViewType = !this.multiViewType;
    this.syncModelState();
    this.dataSource.notifySectionReloaded();
    this.appendLog('Toggle MultiViewType → multiViewType=' + this.multiViewType + '（奇数位 item 加白边，viewType=TYPE_HIGHLIGHT=' + TYPE_HIGHLIGHT + '）');
  }

  onChangeItemS2P0(): void {
    if (this.sectionCount <= 2) {
      this.appendLog('Change Item S2P0 → 当前段数 ' + this.sectionCount + ' 不足，需 ≥ 3 段');
      return;
    }
    const key = '2:0';
    const current = this.itemOverrides.get(key);
    const next = current === undefined ? 100 : current + 1;
    this.itemOverrides.set(key, next);
    this.contentVersion++;
    this.dataSource.notifySectionItemChanged(2, 0);
    this.appendLog('Change Item S2P0 → notifySectionItemChanged(2,0), 覆盖值=' + next);
  }

  private getDisplayPositionWithinSection(entry: SectionEntry): number {
    if (entry.kind === SectionEntryKind.HEADER) {
      return 0;
    }
    if (entry.kind === SectionEntryKind.FOOTER) {
      return this.model.getItemCountForSection(entry.section) + 1;
    }
    return entry.positionWithinSection + 1;
  }

  onLogPositions(): void {
    const total = this.dataSource.totalCount();
    const lines: string[] = ['Log Positions (totalCount=' + total + '):'];
    for (let idx = 0; idx < total; idx++) {
      const isHeader = this.dataSource.isSectionHeaderPosition(idx);
      const isFooter = this.dataSource.isSectionFooterPosition(idx);
      const section = this.dataSource.getSectionForPosition(idx);
      const entry = this.dataSource.getData(idx);
      const posWithin = this.getDisplayPositionWithinSection(entry);
      lines.push('  [' + idx + '] kind=' + (isHeader ? 'HEADER' : isFooter ? 'FOOTER' : 'ITEM') + ' section=' + section + ' posWithin=' + posWithin);
    }
    this.appendLog(lines.join('\n'));
  }

  onChangeHeaderS0(): void {
    this.headerChangeCount++;
    this.headerOverrides.set('0', 'Custom H0 #' + this.headerChangeCount);
    this.contentVersion++;
    this.dataSource.notifySectionHeaderChanged(0);
    this.appendLog('Change Header S0 → notifySectionHeaderChanged(0), 文本="Custom H0 #' + this.headerChangeCount + '"');
  }

  onChangeFooterS1(): void {
    this.footerChangeCount++;
    this.footerOverrides.set('1', 'custom F1#' + this.footerChangeCount);
    this.contentVersion++;
    this.dataSource.notifySectionFooterChanged(1);
    this.appendLog('Change Footer S1 → notifySectionFooterChanged(1), 文本="custom F1#' + this.footerChangeCount + '"');
  }

  onSetModel(): void {
    const oldModel = this.dataSource.getModel();
    this.model = new CountModel();
    this.syncModelState();
    this.dataSource.setModel(this.model);
    const changed: boolean = this.dataSource.getModel() !== oldModel;
    this.appendLog('Set Model → setModel(新 CountModel), getModel 身份变化=' + (changed ? 'true' : 'false') + ', totalCount=' + this.dataSource.totalCount());
  }

  build() {
    Column() {
      // Toolbar with back
      Row() {
        Text($r('app.string.back'))
          .fontColor($r('app.color.toolbar_text'))
          .fontSize($r('app.float.btn_text_size'))
          .onClick(() => {
            router.back();
          })
        Text($r('app.string.count_page_title'))
          .fontColor($r('app.color.toolbar_text'))
          .fontSize($r('app.float.toolbar_title_size'))
          .fontWeight(FontWeight.Bold)
          .margin({ left: 16 })
      }
      .width('100%')
      .height($r('app.float.toolbar_height'))
      .backgroundColor($r('app.color.toolbar_background'))
      .alignItems(VerticalAlign.Center)
      .padding({ left: 12, right: 12 })

      // Action buttons (horizontally scrollable)
      Scroll() {
        Row() {
          Button($r('app.string.btn_add_section'))
            .type(ButtonType.Capsule)
            .height($r('app.float.btn_height'))
            .fontSize($r('app.float.btn_text_size'))
            .backgroundColor($r('app.color.toolbar_background'))
            .margin({ left: 4, right: 4 })
            .onClick(() => { this.onAddSection(); })

          Button($r('app.string.btn_remove_section'))
            .type(ButtonType.Capsule)
            .height($r('app.float.btn_height'))
            .fontSize($r('app.float.btn_text_size'))
            .backgroundColor($r('app.color.toolbar_background'))
            .margin({ left: 4, right: 4 })
            .onClick(() => { this.onRemoveSection(); })

          Button($r('app.string.btn_toggle_footer'))
            .type(ButtonType.Capsule)
            .height($r('app.float.btn_height'))
            .fontSize($r('app.float.btn_text_size'))
            .backgroundColor($r('app.color.toolbar_background'))
            .margin({ left: 4, right: 4 })
            .onClick(() => { this.onToggleFooter(); })

          Button($r('app.string.btn_change_item'))
            .type(ButtonType.Capsule)
            .height($r('app.float.btn_height'))
            .fontSize($r('app.float.btn_text_size'))
            .backgroundColor($r('app.color.toolbar_background'))
            .margin({ left: 4, right: 4 })
            .onClick(() => { this.onChangeItemS2P0(); })

          Button($r('app.string.btn_log_positions'))
            .type(ButtonType.Capsule)
            .height($r('app.float.btn_height'))
            .fontSize($r('app.float.btn_text_size'))
            .backgroundColor($r('app.color.toolbar_background'))
            .margin({ left: 4, right: 4 })
            .onClick(() => { this.onLogPositions(); })

          Button('Multi ViewType')
            .type(ButtonType.Capsule)
            .height($r('app.float.btn_height'))
            .fontSize($r('app.float.btn_text_size'))
            .backgroundColor($r('app.color.toolbar_background'))
            .margin({ left: 4, right: 4 })
            .onClick(() => { this.onToggleMultiViewType(); })

          Button($r('app.string.btn_change_header'))
            .type(ButtonType.Capsule)
            .height($r('app.float.btn_height'))
            .fontSize($r('app.float.btn_text_size'))
            .backgroundColor($r('app.color.toolbar_background'))
            .margin({ left: 4, right: 4 })
            .onClick(() => { this.onChangeHeaderS0(); })

          Button($r('app.string.btn_change_footer'))
            .type(ButtonType.Capsule)
            .height($r('app.float.btn_height'))
            .fontSize($r('app.float.btn_text_size'))
            .backgroundColor($r('app.color.toolbar_background'))
            .margin({ left: 4, right: 4 })
            .onClick(() => { this.onChangeFooterS1(); })

          Button($r('app.string.btn_set_model'))
            .type(ButtonType.Capsule)
            .height($r('app.float.btn_height'))
            .fontSize($r('app.float.btn_text_size'))
            .backgroundColor($r('app.color.toolbar_background'))
            .margin({ left: 4, right: 4 })
            .onClick(() => { this.onSetModel(); })
        }
        .padding({ left: 8, right: 8 })
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
      .width('100%')
      .height(52)

      // SectionedGrid
      SectionedGrid({
        dataSource: this.dataSource,
        spanCount: 2,
        columnsGap: 8,
        rowsGap: 8,
        headerBuilder: (entry: SectionEntry): void => {
          this.renderHeader(entry)
        },
        itemBuilder: (entry: SectionEntry): void => {
          this.renderItem(entry)
        },
        footerBuilder: (entry: SectionEntry): void => {
          this.renderFooter(entry)
        }
      })
      .layoutWeight(1)
      .padding({ left: 8, right: 8 })

      // Log area
      Column() {
        Text($r('app.string.log_area_title'))
          .fontColor($r('app.color.log_text'))
          .fontSize($r('app.float.log_text_size'))
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 4 })
        if (this.logMessages.length === 0) {
          Text($r('app.string.log_empty'))
            .fontColor($r('app.color.log_text'))
            .fontSize($r('app.float.log_text_size'))
            .opacity(0.7)
        } else {
          Scroll() {
            Column() {
              ForEach(this.logMessages, (line: string) => {
                Text(line)
                  .fontColor($r('app.color.log_text'))
                  .fontSize($r('app.float.log_text_size'))
                  .fontFamily('monospace')
                  .width('100%')
                  .margin({ top: 2, bottom: 2 })
              }, (line: string) => line)
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
          }
          .scrollBar(BarState.Auto)
          .edgeEffect(EdgeEffect.Spring)
          .layoutWeight(1)
        }
      }
      .width('100%')
      .height(160)
      .padding($r('app.float.log_padding'))
      .backgroundColor($r('app.color.log_background'))
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
  }
}
