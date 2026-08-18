import { CheckerboardDrawable, argbToHex, SimpleColorFilter, ColorFilter, CheckerboardBackground } from 'checkerboarddrawable';

/**
 * 颜色预设项。
 */
interface ColorPreset {
  value: string;
}

/**
 * 滤镜预设项。
 */
interface FilterPreset {
  label: string;
  value: string;
}

/**
 * CheckerboardDrawable Demo 主页面。
 *
 * 还原 Android Demo 的核心效果：全屏棋盘格背景 + 居中 "Hello World!" 文字，
 * 并在此基础上提供交互控制面板，覆盖库的全部公开 API：
 *   - CheckerboardDrawable.create()
 *   - CheckerboardDrawable.Builder().size().colorOdd().colorEven().build()
 *   - setAlpha(int) / getAlpha()
 *   - setColorFilter(ColorFilter) / getColorFilter()
 *   - getSize() / getColorOdd() / getColorEven()
 *   - getOpacity()
 *   - argbToHex(int) 工具函数
 *   - CheckerboardBackground 组件（@Prop 响应式预览）
 */
@Entry
@Component
struct Index {
  // === 可配置状态（变化时通过 @Watch 触发重绘） ===
  @State @Watch('onConfigChanged') cellSize: number = 20;
  @State @Watch('onConfigChanged') colorOddStr: string = '#FFCCCCCC';
  @State @Watch('onConfigChanged') colorEvenStr: string = '#FF444444';
  @State @Watch('onConfigChanged') alphaVal: number = 255;
  @State @Watch('onConfigChanged') filterStr: string = 'none';
  @State logText: string = '';

  // === Canvas 绘制上下文（主背景） ===
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  // === 颜色预设（8 位 ARGB 格式，与 argbToHex 输出一致） ===
  private colorPresets: ColorPreset[] = [
    { value: '#FFFFFFFF' },
    { value: '#FFC2C2C2' },
    { value: '#FFCCCCCC' },
    { value: '#FF444444' },
    { value: '#FF000000' },
    { value: '#FFFF0000' },
    { value: '#FF0000FF' },
  ];

  // === 滤镜预设 ===
  private filterPresets: FilterPreset[] = [
    { label: '无', value: 'none' },
    { label: '灰度', value: 'grayscale(1)' },
    { label: '深褐', value: 'sepia(0.8)' },
    { label: '反相', value: 'invert(1)' },
    { label: '亮度↓', value: 'brightness(0.6)' },
    { label: '对比↑', value: 'contrast(1.8)' },
  ];

  // === @Watch 回调 ===
  onConfigChanged(): void {
    this.redraw();
  }

  // === 构建当前配置的 CheckerboardDrawable ===
  private buildDrawable(): CheckerboardDrawable {
    let d: CheckerboardDrawable = CheckerboardDrawable.Builder()
      .colorOdd(this.colorOddStr)
      .colorEven(this.colorEvenStr)
      .size(this.cellSize)
      .build();
    d.setAlpha(this.alphaVal);
    if (this.filterStr !== 'none' && this.filterStr.length > 0) {
      d.setColorFilter(new SimpleColorFilter(this.filterStr));
    }
    return d;
  }

  // === 重绘棋盘格（主 Canvas 背景） ===
  private redraw(): void {
    let w: number = this.context.width;
    let h: number = this.context.height;
    if (w > 0 && h > 0) {
      let d: CheckerboardDrawable = this.buildDrawable();
      d.draw(this.context, w, h);
      let filterInfo: string = 'none';
      let cf: ColorFilter | null = d.getColorFilter();
      if (cf !== null) {
        filterInfo = cf.toFilterString();
      }
      this.appendLog('draw() → size=' + d.getSize() + 'vp, colorOdd=' + d.getColorOdd()
        + ', colorEven=' + d.getColorEven() + ', alpha=' + d.getAlpha()
        + ', filter=' + filterInfo);
    }
  }

  // === 追加日志 ===
  private appendLog(msg: string): void {
    let newLine: string = '• ' + msg;
    if (this.logText.length > 0) {
      this.logText = newLine + '\n' + this.logText;
    } else {
      this.logText = newLine;
    }
    let lines: string[] = this.logText.split('\n');
    if (lines.length > 12) {
      lines = lines.slice(0, 12);
      this.logText = lines.join('\n');
    }
  }

  // === 按钮回调：应用默认配置 ===
  private applyDefaults(): void {
    let d: CheckerboardDrawable = CheckerboardDrawable.create();
    this.cellSize = d.getSize();
    this.colorOddStr = d.getColorOdd();
    this.colorEvenStr = d.getColorEven();
    this.alphaVal = d.getAlpha();
    this.filterStr = 'none';
    this.appendLog('create() → size=' + d.getSize() + ', colorOdd=' + d.getColorOdd()
      + ', colorEven=' + d.getColorEven() + ', getOpacity()=' + d.getOpacity());
  }

  // === 按钮回调：应用 Android Demo 配置 ===
  private applyDemoConfig(): void {
    let oddHex: string = argbToHex(0xFFCCCCCC);
    let evenHex: string = argbToHex(0xFF444444);
    this.cellSize = 20;
    this.colorOddStr = oddHex;
    this.colorEvenStr = evenHex;
    this.alphaVal = 255;
    this.filterStr = 'none';
    this.appendLog('argbToHex(0xFFCCCCCC)=' + oddHex + ' (LTGRAY), argbToHex(0xFF444444)='
      + evenHex + ' (DKGRAY), size=20');
  }

  build() {
    Stack() {
      // === 底层：棋盘格 Canvas 背景（直接调用 CheckerboardDrawable API） ===
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .onReady(() => {
          this.redraw();
          this.appendLog('Canvas onReady → 初始绘制完成');
        })

      // === 上层：内容覆盖 ===
      Column() {
        // 中心区域：Hello World!
        Column() {
          Text('Hello World!')
            .fontSize($r('app.float.page_text_font_size'))
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.hello_text'))
        }
        .layoutWeight(1)
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)

        // === 底部控制面板 ===
        Scroll() {
          Column() {
            // 面板标题
            Text('CheckerboardDrawable')
              .fontSize($r('app.float.title_font_size'))
              .fontWeight(FontWeight.Bold)
              .fontColor($r('app.color.panel_title_text'))
              .margin({ bottom: 4 })
            Text('棋盘格背景绘制器 · API 交互演示')
              .fontSize($r('app.float.small_font_size'))
              .fontColor($r('app.color.panel_body_text'))
              .margin({ bottom: 16 })

            // --- 格子大小滑块 ---
            Row() {
              Text('格子大小 (size)')
                .fontSize($r('app.float.body_font_size'))
                .fontColor($r('app.color.panel_body_text'))
              Text(this.cellSize + ' vp')
                .fontSize($r('app.float.body_font_size'))
                .fontColor($r('app.color.panel_title_text'))
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
            .margin({ bottom: 4 })

            Slider({ value: this.cellSize, min: 10, max: 80, step: 1, style: SliderStyle.OutSet })
              .width('100%')
              .onChange((value: number, mode: SliderChangeMode) => {
                this.cellSize = Math.round(value);
              })

            // --- 透明度滑块 ---
            Row() {
              Text('透明度 (setAlpha)')
                .fontSize($r('app.float.body_font_size'))
                .fontColor($r('app.color.panel_body_text'))
              Text(this.alphaVal + ' / 255')
                .fontSize($r('app.float.body_font_size'))
                .fontColor($r('app.color.panel_title_text'))
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
            .margin({ top: 8, bottom: 4 })

            Slider({ value: this.alphaVal, min: 0, max: 255, step: 1, style: SliderStyle.OutSet })
              .width('100%')
              .onChange((value: number, mode: SliderChangeMode) => {
                this.alphaVal = Math.round(value);
              })

            // --- 奇数格颜色 ---
            Text('奇数格颜色 (colorOdd)')
              .fontSize($r('app.float.body_font_size'))
              .fontColor($r('app.color.panel_body_text'))
              .margin({ top: 12, bottom: 8 })

            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(this.colorPresets, (item: ColorPreset) => {
                Column() {
                  Text('')
                    .width(32)
                    .height(32)
                    .backgroundColor(item.value)
                    .borderRadius(8)
                    .border({
                      width: this.colorOddStr === item.value ? 3 : 1,
                      color: this.colorOddStr === item.value ? '#3F51B5' : '#BBBBBB'
                    })
                }
                .margin({ right: 8, bottom: 8 })
                .onClick(() => {
                  this.colorOddStr = item.value;
                })
              }, (item: ColorPreset) => item.value)
            }
            .width('100%')

            // --- 偶数格颜色 ---
            Text('偶数格颜色 (colorEven)')
              .fontSize($r('app.float.body_font_size'))
              .fontColor($r('app.color.panel_body_text'))
              .margin({ top: 4, bottom: 8 })

            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(this.colorPresets, (item: ColorPreset) => {
                Column() {
                  Text('')
                    .width(32)
                    .height(32)
                    .backgroundColor(item.value)
                    .borderRadius(8)
                    .border({
                      width: this.colorEvenStr === item.value ? 3 : 1,
                      color: this.colorEvenStr === item.value ? '#3F51B5' : '#BBBBBB'
                    })
                }
                .margin({ right: 8, bottom: 8 })
                .onClick(() => {
                  this.colorEvenStr = item.value;
                })
              }, (item: ColorPreset) => item.value + '_even')
            }
            .width('100%')

            // --- 颜色滤镜 ---
            Text('颜色滤镜 (setColorFilter)')
              .fontSize($r('app.float.body_font_size'))
              .fontColor($r('app.color.panel_body_text'))
              .margin({ top: 4, bottom: 8 })

            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(this.filterPresets, (item: FilterPreset) => {
                Text(item.label)
                  .fontSize($r('app.float.small_font_size'))
                  .fontColor(this.filterStr === item.value ? '#FFFFFF' : '#333333')
                  .backgroundColor(this.filterStr === item.value ? '#3F51B5' : '#EEEEEE')
                  .borderRadius(8)
                  .padding({ left: 12, right: 12, top: 6, bottom: 6 })
                  .margin({ right: 8, bottom: 8 })
                  .onClick(() => {
                    this.filterStr = item.value;
                    let d: CheckerboardDrawable = this.buildDrawable();
                    let cf: ColorFilter | null = d.getColorFilter();
                    let filterInfo: string = 'null';
                    if (cf !== null) {
                      filterInfo = cf.toFilterString();
                    }
                    this.appendLog('setColorFilter(' + filterInfo + ')');
                  })
              }, (item: FilterPreset) => item.value)
            }
            .width('100%')

            // --- CheckerboardBackground 组件预览 ---
            Text('CheckerboardBackground 组件预览')
              .fontSize($r('app.float.body_font_size'))
              .fontColor($r('app.color.panel_body_text'))
              .margin({ top: 4, bottom: 8 })

            CheckerboardBackground({
              cellSize: this.cellSize,
              colorOdd: this.colorOddStr,
              colorEven: this.colorEvenStr,
              alpha: this.alphaVal,
              filterString: this.filterStr
            })
              .width('100%')
              .height(80)
              .borderRadius(8)
              .clip(true)

            // --- 操作按钮 ---
            Row() {
              Text('默认配置')
                .layoutWeight(1)
                .height(40)
                .backgroundColor($r('app.color.button_bg'))
                .fontColor($r('app.color.button_text'))
                .fontSize($r('app.float.body_font_size'))
                .textAlign(TextAlign.Center)
                .borderRadius(8)
                .onClick(() => {
                  this.applyDefaults();
                })

              Text('Demo 配置')
                .layoutWeight(1)
                .height(40)
                .backgroundColor('#FF4081')
                .fontColor('#FFFFFF')
                .fontSize($r('app.float.body_font_size'))
                .textAlign(TextAlign.Center)
                .borderRadius(8)
                .margin({ left: 8 })
                .onClick(() => {
                  this.applyDemoConfig();
                })
            }
            .width('100%')
            .margin({ top: 12 })

            // --- 日志区 ---
            Text('API 调用日志')
              .fontSize($r('app.float.body_font_size'))
              .fontColor($r('app.color.panel_body_text'))
              .margin({ top: 16, bottom: 8 })

            Text(this.logText)
              .width('100%')
              .fontSize($r('app.float.small_font_size'))
              .fontColor($r('app.color.log_text'))
              .backgroundColor($r('app.color.log_background'))
              .borderRadius(8)
              .padding(8)
              .maxLines(12)
          }
          .width('100%')
          .padding($r('app.float.panel_padding'))
        }
        .backgroundColor($r('app.color.panel_background'))
        .borderRadius({ topLeft: $r('app.float.panel_radius'), topRight: $r('app.float.panel_radius') })
        .height('56%')
        .edgeEffect(EdgeEffect.Spring)
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}
