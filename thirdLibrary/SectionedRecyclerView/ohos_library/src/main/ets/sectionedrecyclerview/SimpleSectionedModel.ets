import { SectionedModel } from './SectionedModel';

/**
 * SimpleSectionedModel is the ArkUI counterpart of Android's SimpleSectionedAdapter<VH>.
 *
 * Android's SimpleSectionedAdapter bakes in three simplifications:
 *   1. hasFooterInSection always returns false (no footer entries ever produced).
 *   2. The header view is a single TextView inflated from view_header.xml.
 *   3. The header text is supplied by getSectionHeaderTitle(section).
 *
 * On ArkUI the header TextView becomes the exported SectionedDefaultHeader @Builder
 * (styled from view_header.xml) and the title is supplied by getSectionHeaderTitle,
 * which the caller wires up through the SectionedList / SectionedGrid headerBuilder.
 *
 * Subclasses only need to implement getSectionHeaderTitle, getSectionCount and
 * getItemCountForSection.
 */
export abstract class SimpleSectionedModel extends SectionedModel {
  hasFooterInSection(section: number): boolean {
    return false;
  }

  /** Title text rendered into the default header @Builder for the given section. */
  abstract getSectionHeaderTitle(section: number): string;
}
