/**
 * Default section header @Builder.
 *
 * Faithfully reproduces library/res/layout/view_header.xml:
 *   <LinearLayout orientation=horizontal height=48dp>
 *     <TextView id=title_text textColor=@color/gray (#9E9E9E)
 *               paddingLeft/Right=@dimen/header_padding (16dp)
 *               maxLines=1 ellipsize=end textStyle=bold
 *               layout_gravity=center_vertical height=wrap_content width=match_parent />
 *   </LinearLayout>
 *
 * Visual values are sourced from HAR resources so they can be overridden in the
 * consuming app or themed for dark mode without touching code.
 */
@Builder
export function SectionedDefaultHeader(title: string) {
  Row() {
    Text(title)
      .fontColor($r('app.color.sectioned_header_text_color'))
      .fontWeight(FontWeight.Bold)
      .maxLines(1)
      .textOverflow({ overflow: TextOverflow.Ellipsis })
      .padding({
        left: $r('app.float.sectioned_header_padding_horizontal'),
        right: $r('app.float.sectioned_header_padding_horizontal')
      })
      .width('100%')
  }
  .height($r('app.float.sectioned_header_height'))
  .width('100%')
  .alignItems(VerticalAlign.Center)
}
