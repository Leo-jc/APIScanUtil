import { router } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  build() {
    Column() {
      // Top toolbar
      Row() {
        Text($r('app.string.home_title'))
          .fontColor($r('app.color.toolbar_text'))
          .fontSize($r('app.float.toolbar_title_size'))
          .fontWeight(FontWeight.Bold)
          .margin({ left: 16 })
      }
      .width('100%')
      .height($r('app.float.toolbar_height'))
      .backgroundColor($r('app.color.toolbar_background'))
      .alignItems(VerticalAlign.Center)

      Scroll() {
        Column() {
          Text($r('app.string.home_subtitle'))
            .fontColor($r('app.color.card_desc'))
            .fontSize($r('app.float.card_desc_size'))
            .margin({ top: 16, bottom: 8, left: 16, right: 16 })
            .width('100%')

          // Count Grid demo card
          Column() {
            Text($r('app.string.home_count_card_title'))
              .fontColor($r('app.color.card_title'))
              .fontSize($r('app.float.card_title_size'))
              .fontWeight(FontWeight.Bold)
              .width('100%')
            Text($r('app.string.home_count_card_desc'))
              .fontColor($r('app.color.card_desc'))
              .fontSize($r('app.float.card_desc_size'))
              .margin({ top: 8 })
              .width('100%')
            Row() {
              Text('进入')
                .fontColor($r('app.color.toolbar_text'))
                .fontSize($r('app.float.btn_text_size'))
                .fontWeight(FontWeight.Medium)
            }
            .padding({ left: 24, right: 24, top: 10, bottom: 10 })
            .margin({ top: 16 })
            .backgroundColor($r('app.color.toolbar_background'))
            .borderRadius($r('app.float.btn_height'))
            .onClick(() => {
              router.pushUrl({ url: 'pages/CountGridPage' });
            })
          }
          .padding($r('app.float.card_padding'))
          .margin({ top: 12, left: 12, right: 12 })
            .backgroundColor($r('app.color.card_background'))
            .borderRadius($r('app.float.card_corner'))
            .border({ width: 1, color: $r('app.color.card_border') })
            .alignItems(HorizontalAlign.Start)

          // Agenda List demo card
          Column() {
            Text($r('app.string.home_agenda_card_title'))
              .fontColor($r('app.color.card_title'))
              .fontSize($r('app.float.card_title_size'))
              .fontWeight(FontWeight.Bold)
              .width('100%')
            Text($r('app.string.home_agenda_card_desc'))
              .fontColor($r('app.color.card_desc'))
              .fontSize($r('app.float.card_desc_size'))
              .margin({ top: 8 })
              .width('100%')
            Row() {
              Text('进入')
                .fontColor($r('app.color.toolbar_text'))
                .fontSize($r('app.float.btn_text_size'))
                .fontWeight(FontWeight.Medium)
            }
            .padding({ left: 24, right: 24, top: 10, bottom: 10 })
            .margin({ top: 16 })
            .backgroundColor($r('app.color.toolbar_background'))
            .borderRadius($r('app.float.btn_height'))
            .onClick(() => {
              router.pushUrl({ url: 'pages/AgendaListPage' });
            })
          }
          .padding($r('app.float.card_padding'))
          .margin({ top: 12, bottom: 24, left: 12, right: 12 })
            .backgroundColor($r('app.color.card_background'))
            .borderRadius($r('app.float.card_corner'))
            .border({ width: 1, color: $r('app.color.card_border') })
            .alignItems(HorizontalAlign.Start)
        }
        .width('100%')
      }
      .layoutWeight(1)
      .edgeEffect(EdgeEffect.Spring)
      .scrollBar(BarState.Auto)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
  }
}
