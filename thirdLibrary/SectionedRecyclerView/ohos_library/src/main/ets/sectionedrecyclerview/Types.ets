/**
 * Section kind constants used by SectionedModel to tag entries within the flat stream.
 *
 * These mirror Android's protected static final int TYPE_SECTION_HEADER / TYPE_SECTION_FOOTER / TYPE_ITEM
 * so callers that override getSectionItemViewType can keep the same numeric contract.
 */
export const TYPE_SECTION_HEADER: number = -1;
export const TYPE_SECTION_FOOTER: number = -2;
export const TYPE_ITEM: number = -3;

/**
 * Logical kind of a flattened section entry.
 *
 * Android's library uses two boolean arrays (isHeader/isFooter) to dispatch positions;
 * ArkUI expresses the same concept as a single discriminated enum carried by SectionEntry.
 */
export enum SectionEntryKind {
  HEADER = 0,
  ITEM = 1,
  FOOTER = 2
}

/**
 * A single flattened entry emitted by SectionedDataSource.
 *
 * Carries everything the renderer needs to dispatch to the right @Builder and look up
 * the backing data: kind (header/item/footer), section index, position within the
 * section, and the per-section/per-position viewType returned by SectionedModel.
 */
export class SectionEntry {
  kind: SectionEntryKind = SectionEntryKind.ITEM;
  section: number = 0;
  positionWithinSection: number = 0;
  viewType: number = TYPE_ITEM;

  constructor(kind: SectionEntryKind, section: number, positionWithinSection: number, viewType: number) {
    this.kind = kind;
    this.section = section;
    this.positionWithinSection = positionWithinSection;
    this.viewType = viewType;
  }
}
