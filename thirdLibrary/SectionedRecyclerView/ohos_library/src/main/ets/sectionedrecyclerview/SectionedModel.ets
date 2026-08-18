import { TYPE_ITEM, TYPE_SECTION_FOOTER, TYPE_SECTION_HEADER } from './Types';

/**
 * SectionedModel is the ArkUI counterpart of Android's
 * SectionedRecyclerViewAdapter<H, VH, F> data contract.
 *
 * Android requires subclasses to override nine abstract methods (six data/binding
 * callbacks plus three viewType hooks). In ArkUI the "bind" half is expressed by
 * @Builder functions supplied at the component level, so the model only needs the
 * three section-shape methods plus the three overridable viewType hooks. The
 * @Builders supplied to SectionedList / SectionedGrid receive a SectionEntry that
 * carries the viewType the model returned, so multi-viewType dispatch works the
 * same way as Android's onCreateViewHolder(parent, viewType).
 *
 * Every method may be called again after notifySectionReloaded / notifySectionItemChanged
 * so the model must reflect any runtime state the caller mutates (matching Android's
 * SectionDataObserver.onChanged -> setupIndices recompute path).
 */
export abstract class SectionedModel {
  /** Number of sections in the list/grid. */
  abstract getSectionCount(): number;

  /** Number of regular items that belong to the given section. */
  abstract getItemCountForSection(section: number): number;

  /** Whether the given section should render a footer entry. */
  abstract hasFooterInSection(section: number): boolean;

  /**
   * ViewType for the header of the given section. Override to distinguish multiple
   * header flavors (mirrors Android's getSectionHeaderViewType). Defaults to
   * TYPE_SECTION_HEADER (-1).
   */
  getSectionHeaderViewType(section: number): number {
    return TYPE_SECTION_HEADER;
  }

  /**
   * ViewType for the footer of the given section. Override to distinguish multiple
   * footer flavors (mirrors Android's getSectionFooterViewType). Defaults to
   * TYPE_SECTION_FOOTER (-2).
   */
  getSectionFooterViewType(section: number): number {
    return TYPE_SECTION_FOOTER;
  }

  /**
   * ViewType for the item at (section, position). Override to distinguish multiple
   * item flavors (mirrors Android's getSectionItemViewType). Defaults to TYPE_ITEM (-3).
   */
  getSectionItemViewType(section: number, position: number): number {
    return TYPE_ITEM;
  }
}
