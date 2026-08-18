import { SectionedDataSource } from '../sectionedrecyclerview/SectionedDataSource';
import { SectionEntry, SectionEntryKind } from '../sectionedrecyclerview/Types';

/**
 * Linear-list renderer for a SectionedDataSource.
 *
 * Mirrors the Android LinearLayoutManager + SectionedRecyclerViewAdapter baseline:
 * a single vertical List whose flat LazyForEach stream contains header entries,
 * item entries and (optional) footer entries interleaved per section. The dispatch
 * to headerBuilder / itemBuilder / footerBuilder corresponds exactly to Android's
 * onCreateViewHolder(parent, viewType) + onBindViewHolder(holder, position)
 * branching on isHeader[position] / isFooter[position].
 *
 * Each @Builder receives the SectionEntry that carries section, positionWithinSection
 * and viewType, so callers that override getSectionItemViewType can dispatch inside
 * their itemBuilder the same way Android dispatches inside onCreateViewHolder.
 *
 * footerBuilder defaults to an empty @Builder so the simple (no-footer) case only
 * requires headerBuilder + itemBuilder, matching SimpleSectionedAdapter's
 * hasFooterInSection == false contract.
 */
@Component
export struct SectionedList {
  /** Data source driving the flat entry stream. */
  dataSource: SectionedDataSource = new SectionedDataSource();
  /** Gap between adjacent ListItem entries, in vp. */
  space: number = 0;
  /** Number of off-screen items to pre-build above/below the viewport. */
  cachedCount: number = 1;

  @Require @BuilderParam headerBuilder: (entry: SectionEntry) => void;
  @Require @BuilderParam itemBuilder: (entry: SectionEntry) => void;
  @BuilderParam footerBuilder: (entry: SectionEntry) => void = this.emptyFooterBuilder;

  @Builder
  emptyFooterBuilder(entry: SectionEntry) {
  }

  build() {
    List({ space: this.space }) {
      LazyForEach(this.dataSource, (entry: SectionEntry) => {
        if (entry.kind === SectionEntryKind.HEADER) {
          ListItem() {
            this.headerBuilder(entry)
          }
        } else if (entry.kind === SectionEntryKind.ITEM) {
          ListItem() {
            this.itemBuilder(entry)
          }
        } else {
          ListItem() {
            this.footerBuilder(entry)
          }
        }
      }, (entry: SectionEntry) => `${entry.kind}-${entry.section}-${entry.positionWithinSection}`)
    }
    .cachedCount(this.cachedCount)
    .width('100%')
    .height('100%')
    .edgeEffect(EdgeEffect.Spring)
  }
}
