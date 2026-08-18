import { SectionedDataSource } from '../sectionedrecyclerview/SectionedDataSource';
import { SectionEntry, SectionEntryKind } from '../sectionedrecyclerview/Types';

/**
 * Grid renderer for a SectionedDataSource.
 *
 * Mirrors the Android GridLayoutManager + SectionedSpanSizeLookup combination:
 * the same flat LazyForEach stream feeds a Grid whose columnsTemplate is set to
 * `spanCount` equal-width tracks. Header and footer entries are tagged with
 * columnStart(0).columnEnd(spanCount-1) so they span the whole row, while item
 * entries occupy a single cell and flow naturally — the exact behavior of
 * SectionedSpanSizeLookup.getSpanSize returning spanCount for header/footer
 * positions and 1 for item positions.
 *
 * Per ArkUI's GridItem rules, columnStart/columnEnd only take effect when the
 * parent Grid has columnsTemplate set, so the component always derives
 * columnsTemplate from spanCount. The grid is scrollable (no rowsTemplate),
 * matching the Android RecyclerView vertical scroll behavior.
 */
@Component
export struct SectionedGrid {
  /** Data source driving the flat entry stream. */
  dataSource: SectionedDataSource = new SectionedDataSource();
  /** Number of equal-width columns. Headers/footers span all columns. */
  spanCount: number = 2;
  /** Number of off-screen items to pre-build. */
  cachedCount: number = 1;
  /** Horizontal gap between columns, in vp. */
  columnsGap: number = 0;
  /** Vertical gap between rows, in vp. */
  rowsGap: number = 0;

  @Require @BuilderParam headerBuilder: (entry: SectionEntry) => void;
  @Require @BuilderParam itemBuilder: (entry: SectionEntry) => void;
  @BuilderParam footerBuilder: (entry: SectionEntry) => void = this.emptyFooterBuilder;

  @Builder
  emptyFooterBuilder(entry: SectionEntry) {
  }

  build() {
    Grid() {
      LazyForEach(this.dataSource, (entry: SectionEntry) => {
        if (entry.kind === SectionEntryKind.HEADER) {
          GridItem() {
            this.headerBuilder(entry)
          }
          .columnStart(0)
          .columnEnd(this.spanCount - 1)
        } else if (entry.kind === SectionEntryKind.ITEM) {
          GridItem() {
            this.itemBuilder(entry)
          }
        } else {
          GridItem() {
            this.footerBuilder(entry)
          }
          .columnStart(0)
          .columnEnd(this.spanCount - 1)
        }
      }, (entry: SectionEntry) => `${entry.kind}-${entry.section}-${entry.positionWithinSection}`)
    }
    .columnsTemplate(this.buildColumnsTemplate())
    .columnsGap(this.columnsGap)
    .rowsGap(this.rowsGap)
    .cachedCount(this.cachedCount)
    .width('100%')
    .height('100%')
    .edgeEffect(EdgeEffect.Spring)
  }

  private buildColumnsTemplate(): string {
    if (this.spanCount <= 1) {
      return '1fr';
    }
    let template = '';
    for (let i = 0; i < this.spanCount; i++) {
      if (i > 0) {
        template += ' ';
      }
      template += '1fr';
    }
    return template;
  }
}
