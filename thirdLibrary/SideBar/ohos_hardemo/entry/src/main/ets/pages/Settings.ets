import { router } from '@kit.ArkUI';
import { SideBar } from 'sidebar';

/** 未选中文字颜色选项。 */
const TEXT_COLOR_OPTIONS: string[] = ['#000000', '#FFFFFF', '#888888', '#FF0000', '#0000FF'];
/** 选中文字颜色选项。 */
const PRESSED_TEXT_COLOR_OPTIONS: string[] = ['#FFFFFF', '#000000', '#FFFF00', '#FF8800'];
/** 选中背景颜色选项。 */
const PRESSED_BG_COLOR_OPTIONS: string[] = ['#00000000', '#FF8800', '#FF0000', '#0000FF', '#00FF00'];
/** 预览用字母。 */
const PREVIEW_LETTERS: string[] = ['A', 'B', 'C', 'D', 'E', 'F'];

/**
 * 样式配置页：展示 SideBar 的全部可配置属性（对应 Android attrs.xml 6 个自定义属性）。
 * 通过 @StorageLink 与主页面共享配置，修改即时生效（响应式驱动 SideBar 重绘）。
 * 提供返回按钮（非一级页面）。
 */
@Entry
@Component
struct Settings {
  @StorageLink('text_color') textColor: string = '#000000';
  @StorageLink('pressed_text_color') pressedTextColor: string = '#FFFFFF';
  @StorageLink('pressed_bg_color') pressedTextBgColor: string = '#FF8800';
  @StorageLink('text_size') textSize: number = 14;
  @StorageLink('item_spacing') itemSpacing: number = 10;
  @StorageLink('item_height') itemHeight: number = 0;

  build() {
    Column() {
      // 标题栏（带返回按钮）
      Row() {
        Text($r('app.string.settings_back'))
          .fontSize(16)
          .fontColor($r('app.color.title_bar_text_color'))
          .padding({ left: 12, right: 12, top: 8, bottom: 8 })
          .onClick(() => {
            router.back();
          })
        Text($r('app.string.settings_title'))
          .fontSize(18)
          .fontColor($r('app.color.title_bar_text_color'))
          .margin({ left: 8 })
        Blank()
      }
      .width('100%')
      .height(56)
      .backgroundColor($r('app.color.title_bar_background'))
      .alignItems(VerticalAlign.Center)

      // 可滚动配置内容
      Scroll() {
        Column() {
          // 未选中文字颜色
          Column() {
            Text($r('app.string.settings_text_color'))
              .fontSize(14)
              .fontColor($r('app.color.header_text_color'))
              .margin({ bottom: 8 })
            Row() {
              ForEach(TEXT_COLOR_OPTIONS, (color: string) => {
                Stack()
                  .width(36)
                  .height(36)
                  .backgroundColor(color)
                  .border({
                    width: this.textColor === color ? 3 : 1,
                    color: this.textColor === color ? '#FF8800' : '#CCCCCC'
                  })
                  .borderRadius(18)
                  .margin({ right: 8 })
                  .onClick(() => {
                    this.textColor = color;
                  })
              }, (color: string) => color)
            }
            .width('100%')
            .justifyContent(FlexAlign.Start)
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .margin({ bottom: 16 })

          // 选中文字颜色
          Column() {
            Text($r('app.string.settings_pressed_text_color'))
              .fontSize(14)
              .fontColor($r('app.color.header_text_color'))
              .margin({ bottom: 8 })
            Row() {
              ForEach(PRESSED_TEXT_COLOR_OPTIONS, (color: string) => {
                Stack()
                  .width(36)
                  .height(36)
                  .backgroundColor(color)
                  .border({
                    width: this.pressedTextColor === color ? 3 : 1,
                    color: this.pressedTextColor === color ? '#FF8800' : '#CCCCCC'
                  })
                  .borderRadius(18)
                  .margin({ right: 8 })
                  .onClick(() => {
                    this.pressedTextColor = color;
                  })
              }, (color: string) => color)
            }
            .width('100%')
            .justifyContent(FlexAlign.Start)
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .margin({ bottom: 16 })

          // 选中背景颜色
          Column() {
            Text($r('app.string.settings_pressed_bg_color'))
              .fontSize(14)
              .fontColor($r('app.color.header_text_color'))
              .margin({ bottom: 8 })
            Row() {
              ForEach(PRESSED_BG_COLOR_OPTIONS, (color: string) => {
                Stack()
                  .width(36)
                  .height(36)
                  .backgroundColor(color)
                  .border({
                    width: this.pressedTextBgColor === color ? 3 : 1,
                    color: this.pressedTextBgColor === color ? '#FF8800' : '#CCCCCC'
                  })
                  .borderRadius(18)
                  .margin({ right: 8 })
                  .onClick(() => {
                    this.pressedTextBgColor = color;
                  })
              }, (color: string) => color)
            }
            .width('100%')
            .justifyContent(FlexAlign.Start)
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .margin({ bottom: 16 })

          // 字号滑块
          Column() {
            Row() {
              Text($r('app.string.settings_text_size'))
                .fontSize(14)
                .fontColor($r('app.color.header_text_color'))
              Blank()
              Text(`${this.textSize}`)
                .fontSize(14)
                .fontColor($r('app.color.header_text_color'))
            }
            .width('100%')
            .margin({ bottom: 8 })

            Slider({
              value: this.textSize,
              min: 8,
              max: 24,
              step: 1,
              style: SliderStyle.OutSet
            })
              .width('100%')
              .selectedColor('#FF8800')
              .trackColor('#CCCCCC')
              .onChange((value: number) => {
                this.textSize = Math.round(value);
              })
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .margin({ bottom: 16 })

          // 项间距滑块
          Column() {
            Row() {
              Text($r('app.string.settings_item_spacing'))
                .fontSize(14)
                .fontColor($r('app.color.header_text_color'))
              Blank()
              Text(`${this.itemSpacing}`)
                .fontSize(14)
                .fontColor($r('app.color.header_text_color'))
            }
            .width('100%')
            .margin({ bottom: 8 })

            Slider({
              value: this.itemSpacing,
              min: 4,
              max: 20,
              step: 1,
              style: SliderStyle.OutSet
            })
              .width('100%')
              .selectedColor('#FF8800')
              .trackColor('#CCCCCC')
              .onChange((value: number) => {
                this.itemSpacing = Math.round(value);
              })
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .margin({ bottom: 16 })

          // 项高度滑块（0=回退字号）
          Column() {
            Row() {
              Text($r('app.string.settings_item_height'))
                .fontSize(14)
                .fontColor($r('app.color.header_text_color'))
              Blank()
              Text(`${this.itemHeight}`)
                .fontSize(14)
                .fontColor($r('app.color.header_text_color'))
            }
            .width('100%')
            .margin({ bottom: 8 })

            Slider({
              value: this.itemHeight,
              min: 0,
              max: 30,
              step: 1,
              style: SliderStyle.OutSet
            })
              .width('100%')
              .selectedColor('#FF8800')
              .trackColor('#CCCCCC')
              .onChange((value: number) => {
                this.itemHeight = Math.round(value);
              })
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .margin({ bottom: 16 })

          // 实时预览
          Column() {
            Text('实时预览')
              .fontSize(14)
              .fontColor($r('app.color.header_text_color'))
              .margin({ bottom: 8 })
            Column() {
              SideBar({
                letters: PREVIEW_LETTERS,
                textColor: this.textColor,
                pressedTextColor: this.pressedTextColor,
                pressedTextBgColor: this.pressedTextBgColor,
                textSize: this.textSize,
                itemSpacing: this.itemSpacing,
                itemHeight: this.itemHeight,
                onSideBarListener: null
              })
            }
            .width(50)
            .alignItems(HorizontalAlign.Center)
          }
          .width('100%')
          .alignItems(HorizontalAlign.Center)
          .margin({ bottom: 32 })
        }
        .width('100%')
        .padding(16)
        .alignItems(HorizontalAlign.Center)
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
  }
}
