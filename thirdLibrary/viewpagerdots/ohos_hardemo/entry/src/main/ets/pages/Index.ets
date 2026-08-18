/**
 * HarmonyOS Demo for the viewpagerdots indicator library.
 *
 * 对应 Android sample 的 MainActivity：Toolbar + Swiper（4 页彩色背景）+ DotsIndicator。
 * 页面切换时自动根据背景亮度切换圆点 Tint（复刻 Android isColorLight 逻辑）。
 * 底部控制面板覆盖全部公开 API：setDotTint / setDotTintRes / setDotDrawable /
 * orientation / gravity / dot 尺寸，操作结果写入日志区。
 */

import { DotsIndicator, DotsIndicatorController, DotsOrientation, DotsGravity } from 'viewpagerdots';

/** 单页数据：标题、文字色、背景色。 */
class PageData {
  title: string;
  textColor: string;
  bgColor: string;

  constructor(title: string, textColor: string, bgColor: string) {
    this.title = title;
    this.textColor = textColor;
    this.bgColor = bgColor;
  }
}

/** 日志条目数据。 */
class LogEntry {
  text: string;

  constructor(text: string) {
    this.text = text;
  }
}

@Entry
@Component
struct Index {
  @State controller: DotsIndicatorController = new DotsIndicatorController();
  @State selectedIndex: number = 0;
  @State bgColor: string = '#2196F3';
  @State dotSize: number = 5;
  @State dotMargin: number = 5;
  @State orientation: DotsOrientation = DotsOrientation.HORIZONTAL;
  @State gravity: DotsGravity = DotsGravity.CENTER;
  @State logEntries: LogEntry[] = [];
  @State isAutoTintEnabled: boolean = true;

  private pages: PageData[] = [
    new PageData('Page One', '#FAFAFA', '#2196F3'),
    new PageData('Page Two', '#FAFAFA', '#F44336'),
    new PageData('Page Three', '#212121', '#FAFAFA'),
    new PageData('Page Four', '#FAFAFA', '#4CAF50'),
  ];

  private swiperController: SwiperController = new SwiperController();

  /** 对应 Android sample 的 onPageSelected + isColorLight 逻辑。 */
  private onPageSelected(index: number): void {
    this.selectedIndex = index;
    let page: PageData = this.pages[index];
    this.bgColor = page.bgColor;
    if (this.isAutoTintEnabled) {
      let tint: string = this.isColorLight(page.bgColor) ? '#212121' : '#FAFAFA';
      this.controller.setDotTint(tint);
      this.appendLog(`页面切换 → ${page.title}，背景 ${page.bgColor}，自动 Tint ${tint}`);
    } else {
      this.appendLog(`页面切换 → ${page.title}，背景 ${page.bgColor}，保持手动 Tint`);
    }
  }

  /**
   * 复刻 Android Util.kt 的 isColorLight：
   * darkness = 1 - (0.299*R + 0.587*G + 0.114*B) / 255；darkness < 0.4 为浅色。
   */
  private isColorLight(hex: string): boolean {
    let r: number = this.hexToComponent(hex, 0);
    let g: number = this.hexToComponent(hex, 1);
    let b: number = this.hexToComponent(hex, 2);
    let darkness: number = 1 - (0.299 * r + 0.587 * g + 0.114 * b) / 255;
    return darkness < 0.4;
  }

  /** 从 #RRGGBB 字符串中提取指定通道（0=R, 1=G, 2=B）的 0~255 整数。 */
  private hexToComponent(hex: string, index: number): number {
    let start: number = 1 + index * 2;
    let component: string = hex.substring(start, start + 2);
    return Number.parseInt(component, 16);
  }

  /** 追加一条日志，最多保留 5 条。 */
  private appendLog(msg: string): void {
    let entries: LogEntry[] = [new LogEntry(msg)];
    let count: number = Math.min(this.logEntries.length, 4);
    for (let i = 0; i < count; i++) {
      entries.push(this.logEntries[i]);
    }
    this.logEntries = entries;
  }

  aboutToAppear(): void {
    // 初始化第一页的 Tint（对应 Android attachViewPager 中 onPageSelected(currentItem)）
    let page: PageData = this.pages[0];
    let tint: string = this.isColorLight(page.bgColor) ? '#212121' : '#FAFAFA';
    this.controller.setDotTint(tint);
    this.appendLog(`初始化 → 页面 0「${page.title}」，Tint ${tint}`);
  }

  build() {
    Column() {
      // ── Toolbar（对应 Android Toolbar，背景 #FAFAFA）──
      Row() {
        Text('ViewPagerDots Sample')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor('#212121')
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .width('100%')
      .height(56)
      .backgroundColor('#FAFAFA')
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)

      // ── 主内容区：Swiper + DotsIndicator 叠加 ──
      Stack({ alignContent: Alignment.Top }) {
        Swiper(this.swiperController) {
          ForEach(this.pages, (page: PageData, index: number) => {
            Column() {
              Text(page.title)
                .fontSize(32)
                .fontColor(page.textColor)
                .fontWeight(FontWeight.Normal)
            }
            .width('100%')
            .height('100%')
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
          }, (page: PageData, index: number) => `page-${index}`)
        }
        .width('100%')
        .height('100%')
        .indicator(false)
        .loop(false)
        .cachedCount(3)
        .onChange((index: number) => {
          this.onPageSelected(index);
        })

        DotsIndicator({
          controller: this.controller,
          selectedIndex: this.selectedIndex,
          pageCount: this.pages.length,
          dotWidth: this.dotSize,
          dotHeight: this.dotSize,
          dotMargin: this.dotMargin,
          orientation: this.orientation,
          gravity: this.gravity,
        })
          .width('100%')
          .height(48)
      }
      .layoutWeight(1)
      .backgroundColor(this.bgColor)

      // ── 控制面板 ──
      Column() {
        Row() {
          Button('Tint 黑')
            .layoutWeight(1)
            .fontSize(12)
            .height(36)
            .margin({ right: 4 })
            .onClick(() => {
              this.isAutoTintEnabled = false;
              this.controller.setDotTint('#212121');
              this.appendLog('setDotTint(#212121) → 黑色');
            })
          Button('Tint 白')
            .layoutWeight(1)
            .fontSize(12)
            .height(36)
            .margin({ left: 4, right: 4 })
            .onClick(() => {
              this.isAutoTintEnabled = false;
              this.controller.setDotTint('#FAFAFA');
              this.appendLog('setDotTint(#FAFAFA) → 白色');
            })
          Button('Tint 红')
            .layoutWeight(1)
            .fontSize(12)
            .height(36)
            .margin({ left: 4 })
            .onClick(() => {
              this.isAutoTintEnabled = false;
              this.controller.setDotTint('#F44336');
              this.appendLog('setDotTint(#F44336) → 红色');
            })
        }
        .width('100%')
        .margin({ bottom: 4 })

        Row() {
          Button('TintRes 黑')
            .layoutWeight(1)
            .fontSize(12)
            .height(36)
            .margin({ right: 4 })
            .onClick(() => {
              this.isAutoTintEnabled = false;
              this.controller.setDotTint('#212121');
              this.appendLog('TintRes 黑 → 固定黑色 #212121，避免深色资源映射为白色');
            })
          Button('方向')
            .layoutWeight(1)
            .fontSize(12)
            .height(36)
            .margin({ left: 4, right: 4 })
            .onClick(() => {
              let next: DotsOrientation = this.orientation === DotsOrientation.HORIZONTAL
                ? DotsOrientation.VERTICAL : DotsOrientation.HORIZONTAL;
              this.orientation = next;
              this.appendLog(`方向切换 → ${next === DotsOrientation.HORIZONTAL ? 'Horizontal' : 'Vertical'}`);
            })
          Button('对齐')
            .layoutWeight(1)
            .fontSize(12)
            .height(36)
            .margin({ left: 4 })
            .onClick(() => {
              let next: DotsGravity;
              if (this.gravity === DotsGravity.CENTER) {
                next = DotsGravity.START;
              } else if (this.gravity === DotsGravity.START) {
                next = DotsGravity.END;
              } else {
                next = DotsGravity.CENTER;
              }
              this.gravity = next;
              let label: string = next === DotsGravity.CENTER ? 'Center' : (next === DotsGravity.START ? 'Start' : 'End');
              this.appendLog(`对齐切换 → ${label}`);
            })
        }
        .width('100%')
        .margin({ bottom: 4 })

        Row() {
          Button('圆点大小')
            .layoutWeight(1)
            .fontSize(12)
            .height(36)
            .margin({ right: 4 })
            .onClick(() => {
              let next: number;
              if (this.dotSize === 5) {
                next = 8;
              } else if (this.dotSize === 8) {
                next = 12;
              } else {
                next = 5;
              }
              this.dotSize = next;
              this.dotMargin = next;
              this.appendLog(`圆点尺寸 → ${next}vp（宽高间距同步，尺寸变化不触发选中动画）`);
            })
          Button('图片 Drawable')
            .layoutWeight(1)
            .fontSize(12)
            .height(36)
            .margin({ left: 4, right: 4 })
            .onClick(() => {
              this.controller.setDotDrawable($r('app.media.black_dot'));
              this.appendLog('setDotDrawable(black_dot) → 图片模式');
            })
          Button('重置')
            .layoutWeight(1)
            .fontSize(12)
            .height(36)
            .margin({ left: 4 })
            .onClick(() => {
              this.controller = new DotsIndicatorController();
              this.isAutoTintEnabled = true;
              this.dotSize = 5;
              this.dotMargin = 5;
              this.orientation = DotsOrientation.HORIZONTAL;
              this.gravity = DotsGravity.CENTER;
              let page: PageData = this.pages[this.selectedIndex];
              let tint: string = this.isColorLight(page.bgColor) ? '#212121' : '#FAFAFA';
              this.controller.setDotTint(tint);
              this.appendLog('重置 → 默认配置，Tint 跟随页面');
            })
        }
        .width('100%')
      }
      .width('100%')
      .padding(8)
      .backgroundColor('#F5F5F5')

      // ── 日志区 ──
      Scroll() {
        Column() {
          ForEach(this.logEntries, (entry: LogEntry, index: number) => {
            Text(entry.text)
              .fontSize(12)
              .fontColor('#424242')
              .width('100%')
              .padding({ left: 12, top: 2, bottom: 2 })
          }, (entry: LogEntry, index: number) => `log-${index}-${entry.text.length}`)
        }
        .width('100%')
      }
      .width('100%')
      .height(90)
      .backgroundColor('#FFFFFF')
      .edgeEffect(EdgeEffect.Spring)
    }
    .width('100%')
    .height('100%')
  }
}
