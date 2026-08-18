import { SectionedModel } from './SectionedModel';
import { SectionEntry, SectionEntryKind, TYPE_ITEM, TYPE_SECTION_FOOTER, TYPE_SECTION_HEADER } from './Types';

/**
 * Internal empty model used so SectionedDataSource can be constructed without
 * arguments (e.g. as a placeholder default field on a SectionedList / SectionedGrid
 * component before the parent assigns the real dataSource). Mirrors the Android
 * behavior where a freshly constructed SectionedRecyclerViewAdapter still answers
 * getItemCount()==0 and isHeader==false for any position.
 */
class EmptySectionedModel extends SectionedModel {
  getSectionCount(): number {
    return 0;
  }

  getItemCountForSection(section: number): number {
    return 0;
  }

  hasFooterInSection(section: number): boolean {
    return false;
  }
}

/**
 * SectionedDataSource flattens a SectionedModel into the linear position stream
 * that ArkUI's LazyForEach expects, and dispatches change notifications back to
 * the framework's DataChangeListener.
 *
 * It is the ArkUI replacement for the four bookkeeping structures Android's
 * SectionedRecyclerViewAdapter maintains (sectionForPosition / positionWithinSection /
 * isHeader / isFooter / count). Instead of asking the consumer to subclass an
 * Adapter and override nine callbacks, the model supplies the section shape and
 * the data source pre-computes the flat SectionEntry[] used by both SectionedList
 * and SectionedGrid.
 *
 * The pre-computation walks sections exactly like Android's precomputeIndices():
 * for each section -> header, then items, then optional footer. The result is
 * re-derived on construction and on every notifySectionReloaded(), matching the
 * Android SectionDataObserver -> setupIndices() recompute path.
 */
export class SectionedDataSource implements IDataSource {
  private model: SectionedModel;
  private entries: SectionEntry[] = [];
  private listeners: DataChangeListener[] = [];

  constructor(model: SectionedModel = new EmptySectionedModel()) {
    this.model = model;
    this.setupIndices();
  }

  /** Access the underlying model (used by callers to read titles / item data). */
  getModel(): SectionedModel {
    return this.model;
  }

  /**
   * Replace the underlying model. Useful when a model is rebuilt from new state and
   * the caller wants the data source to keep the same identity. Re-derives indices
   * and fires onDataReloaded to all listeners, matching Android's
   * SectionDataObserver.onChanged -> setupIndices path.
   */
  setModel(model: SectionedModel): void {
    this.model = model;
    this.notifySectionReloaded();
  }

  // --- IDataSource -----------------------------------------------------------

  totalCount(): number {
    return this.entries.length;
  }

  getData(index: number): SectionEntry {
    return this.entries[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  // --- Position queries (parity with SectionedRecyclerViewAdapter public API) --

  /** True when the flat position corresponds to a section header. */
  isSectionHeaderPosition(position: number): boolean {
    if (position < 0 || position >= this.entries.length) {
      return false;
    }
    return this.entries[position].kind === SectionEntryKind.HEADER;
  }

  /** True when the flat position corresponds to a section footer. */
  isSectionFooterPosition(position: number): boolean {
    if (position < 0 || position >= this.entries.length) {
      return false;
    }
    return this.entries[position].kind === SectionEntryKind.FOOTER;
  }

  /** Section index for a flat position, or -1 if out of range. */
  getSectionForPosition(position: number): number {
    if (position < 0 || position >= this.entries.length) {
      return -1;
    }
    return this.entries[position].section;
  }

  /** Position within the section for a flat position, or -1 if out of range. */
  getPositionWithinSection(position: number): number {
    if (position < 0 || position >= this.entries.length) {
      return -1;
    }
    return this.entries[position].positionWithinSection;
  }

  // --- Notifications (parity with SectionDataObserver -> setupIndices) --------

  /**
   * Notify that section shape changed (section count, items per section, footer
   * presence). Re-derives indices and fires onDataReloaded to every listener,
   * equivalent to Android's SectionDataObserver.onChanged/onItemRangeChanged/
   * onItemRangeInserted/onItemRangeRemoved/onItemRangeMoved all routing into
   * setupIndices().
   */
  notifySectionReloaded(): void {
    this.setupIndices();
    for (let i = 0; i < this.listeners.length; i++) {
      this.listeners[i].onDataReloaded();
    }
  }

  /**
   * Notify that the header of a specific section changed its backing data (the
   * section shape is unchanged). Fires onDataChange at the header's flat index,
   * equivalent to Android's notifyItemChanged(headerIndex).
   */
  notifySectionHeaderChanged(section: number): void {
    const index = this.findEntryIndex(SectionEntryKind.HEADER, section, 0);
    if (index >= 0) {
      this.refreshEntry(index);
      for (let i = 0; i < this.listeners.length; i++) {
        this.listeners[i].onDataChange(index);
      }
    }
  }

  /**
   * Notify that a single item's backing data changed (the section shape is
   * unchanged). Fires onDataChange at the item's flat index.
   */
  notifySectionItemChanged(section: number, position: number): void {
    const index = this.findEntryIndex(SectionEntryKind.ITEM, section, position);
    if (index >= 0) {
      this.refreshEntry(index);
      for (let i = 0; i < this.listeners.length; i++) {
        this.listeners[i].onDataChange(index);
      }
    }
  }

  /**
   * Notify that the footer of a specific section changed its backing data.
   * Fires onDataChange at the footer's flat index.
   */
  notifySectionFooterChanged(section: number): void {
    const index = this.findEntryIndex(SectionEntryKind.FOOTER, section, 0);
    if (index >= 0) {
      this.refreshEntry(index);
      for (let i = 0; i < this.listeners.length; i++) {
        this.listeners[i].onDataChange(index);
      }
    }
  }

  // --- internals --------------------------------------------------------------

  private setupIndices(): void {
    this.entries = this.computeEntries();
  }

  private computeEntries(): SectionEntry[] {
    const result: SectionEntry[] = [];
    const sections = this.model.getSectionCount();
    for (let i = 0; i < sections; i++) {
      result.push(new SectionEntry(SectionEntryKind.HEADER, i, 0, this.model.getSectionHeaderViewType(i)));
      const itemCount = this.model.getItemCountForSection(i);
      for (let j = 0; j < itemCount; j++) {
        result.push(new SectionEntry(SectionEntryKind.ITEM, i, j, this.model.getSectionItemViewType(i, j)));
      }
      if (this.model.hasFooterInSection(i)) {
        result.push(new SectionEntry(SectionEntryKind.FOOTER, i, 0, this.model.getSectionFooterViewType(i)));
      }
    }
    return result;
  }

  private findEntryIndex(kind: SectionEntryKind, section: number, position: number): number {
    for (let i = 0; i < this.entries.length; i++) {
      const entry = this.entries[i];
      if (entry.kind === kind && entry.section === section && entry.positionWithinSection === position) {
        return i;
      }
    }
    return -1;
  }

  /**
   * Replace the entry at index with a fresh SectionEntry object that has the same
   * fields. ArkUI's LazyForEach re-evaluates the itemGenerator for onDataChange
   * regardless of object identity, but producing a new reference guarantees the
   * @Builder is re-invoked and re-reads the latest model data.
   */
  private refreshEntry(index: number): void {
    const old = this.entries[index];
    this.entries[index] = new SectionEntry(old.kind, old.section, old.positionWithinSection, old.viewType);
  }
}

// Re-export the type constants here so callers importing the data source also get
// the numeric viewType contract in one place.
export { TYPE_ITEM, TYPE_SECTION_FOOTER, TYPE_SECTION_HEADER } from './Types';
