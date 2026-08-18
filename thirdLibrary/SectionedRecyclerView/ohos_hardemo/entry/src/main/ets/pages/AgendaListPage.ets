import { router } from '@kit.ArkUI';
import {
  SectionedDataSource,
  SectionedList,
  SectionEntry,
  SectionEntryKind,
  SectionedDefaultHeader,
  SimpleSectionedModel
} from 'sectionedrecyclerview';

/**
 * AgendaModel mirrors Android's AgendaSimpleSectionAdapter data contract:
 *   - extends SimpleSectionedModel so hasFooterInSection is always false (no footer entries)
 *   - getSectionHeaderTitle(section): "Today" / "Tomorrow" (matches Android sample)
 *   - getSectionCount: 2 (matches Android sample)
 *   - getItemCountForSection: runtime-mutable (starts at 3, can grow via "Add Item")
 *
 * The default header is rendered by SectionedDefaultHeader, which the page wires through
 * the headerBuilder arrow wrapper so `this` stays bound to the page and the title can be
 * resolved via the model.
 */
class AgendaModel extends SimpleSectionedModel {
  agendaCounts: number[] = [3, 3];

  getSectionCount(): number {
    return 2;
  }

  getItemCountForSection(section: number): number {
    return this.agendaCounts[section];
  }

  getSectionHeaderTitle(section: number): string {
    return section === 0 ? 'Today' : 'Tomorrow';
  }
}

@Entry
@Component
struct AgendaListPage {
  @State agendaCounts: number[] = [3, 3];
  @State agendaData: string[][] = [
    ['Meeting', 'Phone call', 'Interview'],
    ['Basket match', 'Grocery shopping', 'Taking a nap']
  ];
  @State logMessages: string[] = [];

  private model: AgendaModel = new AgendaModel();
  private dataSource: SectionedDataSource = new SectionedDataSource(this.model);
  private logSerial: number = 0;

  aboutToAppear(): void {
    this.model.agendaCounts = this.agendaCounts;
    this.dataSource.notifySectionReloaded();
    this.appendLog('aboutToAppear: sectionCount=2, agendaCounts=' + this.formatArray(this.agendaCounts)
      + ', itemCount=' + this.getAgendaItemCount() + ', totalCount=' + this.dataSource.totalCount());
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

  private formatArray(arr: number[]): string {
    let s = '[';
    for (let i = 0; i < arr.length; i++) {
      if (i > 0) {
        s += ', ';
      }
      s += arr[i].toString();
    }
    s += ']';
    return s;
  }

  private getAgendaItemCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.agendaCounts.length; i++) {
      count += this.agendaCounts[i];
    }
    return count;
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

  private resolveAgendaText(entry: SectionEntry): string {
    const override = this.agendaOverrides.get(entry.section + ':' + entry.positionWithinSection);
    if (override !== undefined) {
      return override;
    }
    const list = this.agendaData[entry.section];
    if (entry.positionWithinSection < list.length) {
      return list[entry.positionWithinSection];
    }
    return 'Item ' + (entry.positionWithinSection + 1);
  }

  private agendaOverrides: Map<string, string> = new Map<string, string>();

  // --- @Builders: faithful port of app/res/layout/view_agenda_item.xml ---

  @Builder
  renderHeader(entry: SectionEntry) {
    SectionedDefaultHeader(this.model.getSectionHeaderTitle(entry.section))
  }

  @Builder
  renderItem(entry: SectionEntry) {
    Row() {
      // ImageView 40dp with src=gray -> render as a gray square placeholder
      Column() {
      }
      .width($r('app.float.agenda_image_size'))
      .height($r('app.float.agenda_image_size'))
      .backgroundColor($r('app.color.agenda_item_placeholder'))
      .margin($r('app.float.agenda_image_margin'))

      Text(this.resolveAgendaText(entry))
        .fontColor($r('app.color.agenda_item_text'))
        .fontSize($r('app.float.agenda_item_text_size'))
        .layoutWeight(1)
        .margin({ right: 16 })
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
  }

  // --- Action handlers ---

  onReload(): void {
    this.model.agendaCounts = this.agendaCounts;
    this.dataSource.notifySectionReloaded();
    this.appendLog('Reload → notifySectionReloaded(), itemCount=' + this.getAgendaItemCount()
      + ', totalCount=' + this.dataSource.totalCount());
  }

  onChangeItem00(): void {
    const current = this.agendaOverrides.get('0:0');
    const next = current === undefined ? 'Meeting (updated)' : current + '!';
    this.agendaOverrides.set('0:0', next);
    this.dataSource.notifySectionItemChanged(0, 0);
    this.appendLog('Change Item 0,0 → notifySectionItemChanged(0,0), 新文本="' + next + '"');
  }

  onAddItemToday(): void {
    const updatedCounts: number[] = [this.agendaCounts[0] + 1, this.agendaCounts[1]];
    this.agendaCounts = updatedCounts;
    this.model.agendaCounts = updatedCounts;
    const newList: string[] = [];
    for (let i = 0; i < this.agendaData[0].length; i++) {
      newList.push(this.agendaData[0][i]);
    }
    newList.push('Extra task ' + (this.agendaCounts[0] - 3));
    this.agendaData[0] = newList;
    this.dataSource.notifySectionReloaded();
    this.appendLog('Add Item Today → getItemCountForSection(0)=' + this.agendaCounts[0]
      + ', itemCount=' + this.getAgendaItemCount() + ', totalCount=' + this.dataSource.totalCount());
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
        Text($r('app.string.agenda_page_title'))
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
          Button($r('app.string.btn_reload'))
            .type(ButtonType.Capsule)
            .height($r('app.float.btn_height'))
            .fontSize($r('app.float.btn_text_size'))
            .backgroundColor($r('app.color.toolbar_background'))
            .margin({ left: 4, right: 4 })
            .onClick(() => { this.onReload(); })

          Button($r('app.string.btn_change_agenda'))
            .type(ButtonType.Capsule)
            .height($r('app.float.btn_height'))
            .fontSize($r('app.float.btn_text_size'))
            .backgroundColor($r('app.color.toolbar_background'))
            .margin({ left: 4, right: 4 })
            .onClick(() => { this.onChangeItem00(); })

          Button($r('app.string.btn_add_agenda'))
            .type(ButtonType.Capsule)
            .height($r('app.float.btn_height'))
            .fontSize($r('app.float.btn_text_size'))
            .backgroundColor($r('app.color.toolbar_background'))
            .margin({ left: 4, right: 4 })
            .onClick(() => { this.onAddItemToday(); })

          Button($r('app.string.btn_log_positions'))
            .type(ButtonType.Capsule)
            .height($r('app.float.btn_height'))
            .fontSize($r('app.float.btn_text_size'))
            .backgroundColor($r('app.color.toolbar_background'))
            .margin({ left: 4, right: 4 })
            .onClick(() => { this.onLogPositions(); })
        }
        .padding({ left: 8, right: 8 })
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
      .width('100%')
      .height(52)

      // SectionedList (simple form: default header + items, no footer)
      SectionedList({
        dataSource: this.dataSource,
        space: 0,
        headerBuilder: (entry: SectionEntry): void => {
          this.renderHeader(entry)
        },
        itemBuilder: (entry: SectionEntry): void => {
          this.renderItem(entry)
        }
      })
      .layoutWeight(1)

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
