import { MarqueeTextView, MarqueeTextViewController } from 'marquee_text_view';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { common } from '@kit.AbilityKit';

const DOMAIN: number = 0x0000;
const TAG: string = 'MarqueeDemo';

/**
 * MarqueeTextView 演示页。
 *
 * 还原 Android Sample（居中放置一个 MarqueeTextView，文本 "Hello World!"，字号 30），
 * 并在此基础上覆盖库的全部公开能力：
 * - 文本 / 字号 / 颜色 / 字重 / 斜体 / 字体族 运行期可变（验证位图重建与重滚）；
 * - space / speed 运行期可变（验证短/长文本分支与速率）；
 * - autoStart 运行期可变（验证就绪/样式变更时是否自动启动）；
 * - start / pause / stop / restart 命令式控制；
 * - 短文本与长文本两分支切换；
 * - 操作日志区展示每次动作与当前生效值。
 */
@Entry
@Component
struct Index {
  // ---- 预览与配置状态 ----
  @State private text: string = 'Hello World!';
  @State private fontSize: number = 30;
  @State private fontColor: string = '#1A1A1A';
  @State private fontWeight: number = 400;
  @State private fontStyle: number = 0;
  @State private fontFamily: string = 'sans-serif';
  @State private space: number = 100;
  @State private speed: number = 0.5;
  @State private longTextMode: boolean = false;
  @State private autoStart: boolean = true;

  // ---- 日志 ----
  @State private logs: string[] = [];

  // ---- 命令式控制器 ----
  private controller: MarqueeTextViewController = new MarqueeTextViewController();

  private readonly LONG_TEXT: string = '这是一段用于演示长文本循环滚动的文本：无论内容是否超过一行，MarqueeTextView 都会持续向左横向滚动，并在头尾之间保持不小于 space 的间隔以实现无缝衔接。MarqueeTextView —— 走马灯式横向滚动文本组件。';

  aboutToAppear(): void {
    // 依据当前深/浅色模式解析 marquee_text 资源色，保证画布文字与卡片背景对比度达标（D17）。
    this.fontColor = this.resolveThemedColor($r('app.color.marquee_text'));
    this.log('Demo 启动，MarqueeTextView 自动开始滚动');
  }

  private resolveThemedColor(res: Resource): string {
    try {
      const host: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
      const n: number = host.resourceManager.getColorSync(res.id);
      return this.argbToRgba(n);
    } catch (e) {
      return '#000000';
    }
  }

  private argbToRgba(n: number): string {
    const a: number = (n >>> 24) & 0xff;
    const r: number = (n >>> 16) & 0xff;
    const g: number = (n >>> 8) & 0xff;
    const b: number = n & 0xff;
    const alpha: number = a / 255;
    return `rgba(${r}, ${g}, ${b}, ${alpha})`;
  }

  private now(): string {
    const d: Date = new Date();
    const h: string = d.getHours().toString().padStart(2, '0');
    const m: string = d.getMinutes().toString().padStart(2, '0');
    const s: string = d.getSeconds().toString().padStart(2, '0');
    return `${h}:${m}:${s}`;
  }

  private log(msg: string): void {
    const line: string = `[${this.now()}] ${msg}`;
    // 新日志置顶。
    this.logs.splice(0, 0, line);
    hilog.info(DOMAIN, TAG, '%{public}s', msg);
  }

  private clearLog(): void {
    this.logs = [];
  }

  // ---- 控制按钮 ----
  private onStart(): void {
    this.controller.startScroll();
    this.log(`startScroll() -> 恢复滚动，speed=${this.speed} vp/帧`);
  }

  private onPause(): void {
    this.controller.pauseScroll();
    this.log('pauseScroll() -> 暂停，画面静止不复位');
  }

  private onStop(): void {
    this.controller.stopScroll();
    this.log('stopScroll() -> 停止并复位到起始位置');
  }

  private onRestart(): void {
    this.controller.restartScroll();
    this.log('restartScroll() -> 复位后重新滚动');
  }

  // ---- 配置变更 ----
  private onTextChanged(v: string): void {
    this.text = v;
  }

  private onFontSizeChange(v: number): void {
    const n: number = Math.round(v);
    if (n !== this.fontSize) {
      this.fontSize = n;
      this.log(`fontSize -> ${n} vp`);
    }
  }

  private onSpaceChange(v: number): void {
    const n: number = Math.round(v);
    if (n !== this.space) {
      this.space = n;
      this.log(`space -> ${n} vp（头尾最小间隔）`);
    }
  }

  private onSpeedChange(v: number): void {
    const n: number = Math.round(v * 100) / 100;
    if (n !== this.speed) {
      this.speed = n;
      this.log(`speed -> ${n} vp/帧(60Hz 基准)，每秒约 ${(60 * n).toFixed(1)} vp`);
    }
  }

  private onToggleLongText(on: boolean): void {
    this.longTextMode = on;
    if (on) {
      this.text = this.LONG_TEXT;
      this.log('切换为长文本（演示 文本宽 > 控件宽 循环滚动分支）');
    } else {
      this.text = 'Hello World!';
      this.log('切换为短文本（演示 文本宽 <= 控件宽 分支，space 自动夹紧）');
    }
  }

  private onToggleBold(on: boolean): void {
    this.fontWeight = on ? 700 : 400;
    this.log(`fontWeight -> ${this.fontWeight}（${on ? 'Bold' : 'Normal'}）`);
  }

  private onToggleItalic(on: boolean): void {
    this.fontStyle = on ? 1 : 0;
    this.log(`fontStyle -> ${on ? 'Italic' : 'Normal'}（font 串 ${on ? 'italic' : 'normal'}）`);
  }

  private onPickFontFamily(family: string): void {
    if (this.fontFamily !== family) {
      this.fontFamily = family;
      this.log(`fontFamily -> ${family}`);
    }
  }

  private onToggleAutoStart(on: boolean): void {
    this.autoStart = on;
    this.log(`autoStart -> ${on ? '开启（就绪/样式变更时自动滚动）' : '关闭（需手动 Start）'}`);
  }

  private onPickColor(hex: string, name: string): void {
    this.fontColor = hex;
    this.log(`fontColor -> ${name} (${hex})`);
  }

  // @Builder 内的 Slider 统一通过 key 分发，避免向 @Builder 传递函数类型参数。
  private onSliderChange(key: string, v: number): void {
    if (key === 'fontSize') {
      this.onFontSizeChange(v);
    } else if (key === 'space') {
      this.onSpaceChange(v);
    } else if (key === 'speed') {
      this.onSpeedChange(v);
    }
  }

  build(): void {
    Scroll() {
      Column() {
        // 标题栏（一级界面，无需返回按钮）。
        Row() {
          Text('MarqueeTextView 演示')
            .fontSize($r('app.float.title_font_size'))
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.text_primary'))
        }
        .width('100%')
        .height(56)
        .padding({ left: 16, right: 16 })
        .justifyContent(FlexAlign.Start)
        .alignItems(VerticalAlign.Center)

        // 预览卡片：还原 Android Sample（铺满宽 × 内容高，居中）。
        Column() {
          Text('预览')
            .fontSize($r('app.float.caption_font_size'))
            .fontColor($r('app.color.text_secondary'))
            .margin({ bottom: 8 })

          MarqueeTextView({
            text: this.text,
            fontSize: this.fontSize,
            fontColor: this.fontColor,
            fontWeight: this.fontWeight,
            fontStyle: this.fontStyle,
            fontFamily: this.fontFamily,
            space: this.space,
            speed: this.speed,
            autoStart: this.autoStart,
            controller: this.controller
          })
            .width('100%')
            .backgroundColor($r('app.color.card_background'))
            .border({ width: 1, color: $r('app.color.divider') })
            .borderRadius(8)
        }
        .width('100%')
        .padding(16)
        .margin({ left: 16, right: 16, top: 8 })
        .backgroundColor($r('app.color.card_background'))
        .borderRadius($r('app.float.card_radius'))
        .alignItems(HorizontalAlign.Start)

        // 控制按钮。
        this.buildControlsCard()

        // 配置项。
        this.buildConfigCard()

        // 日志区。
        this.buildLogCard()
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.Spring)
  }

  @Builder
  buildControlsCard(): void {
    Column() {
      Text('滚动控制')
        .fontSize($r('app.float.caption_font_size'))
        .fontColor($r('app.color.text_secondary'))
        .margin({ bottom: 10 })

      Row() {
        Button('Start')
          .type(ButtonType.Capsule)
          .layoutWeight(1)
          .backgroundColor($r('app.color.accent'))
          .fontColor(Color.White)
          .onClick(() => { this.onStart(); })

        Button('Pause')
          .type(ButtonType.Capsule)
          .layoutWeight(1)
          .backgroundColor($r('app.color.button_secondary_bg'))
          .fontColor($r('app.color.text_primary'))
          .margin({ left: 8 })
          .onClick(() => { this.onPause(); })
      }
      .width('100%')

      Row() {
        Button('Stop')
          .type(ButtonType.Capsule)
          .layoutWeight(1)
          .backgroundColor($r('app.color.button_secondary_bg'))
          .fontColor($r('app.color.text_primary'))
          .onClick(() => { this.onStop(); })

        Button('Restart')
          .type(ButtonType.Capsule)
          .layoutWeight(1)
          .backgroundColor($r('app.color.accent'))
          .fontColor(Color.White)
          .margin({ left: 8 })
          .onClick(() => { this.onRestart(); })
      }
      .width('100%')
      .margin({ top: 8 })
    }
    .width('100%')
    .padding(16)
    .margin({ left: 16, right: 16, top: 12 })
    .backgroundColor($r('app.color.card_background'))
    .borderRadius($r('app.float.card_radius'))
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  buildConfigCard(): void {
    Column() {
      Text('文本与样式配置（运行期生效）')
        .fontSize($r('app.float.caption_font_size'))
        .fontColor($r('app.color.text_secondary'))
        .margin({ bottom: 10 })

      // 文本输入。
      Text('text')
        .fontSize($r('app.float.caption_font_size'))
        .fontColor($r('app.color.text_primary'))
      TextArea({ text: this.text, placeholder: '输入滚动文本' })
        .fontSize($r('app.float.body_font_size'))
        .fontColor($r('app.color.text_primary'))
        .backgroundColor($r('app.color.page_background'))
        .borderRadius(8)
        .margin({ top: 4 })
        .onChange((v: string) => { this.onTextChanged(v); })

      // 长文本开关。
      Row() {
        Text('长文本模式（演示长文本循环分支）')
          .fontSize($r('app.float.body_font_size'))
          .fontColor($r('app.color.text_primary'))
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.longTextMode })
          .onChange((on: boolean) => { this.onToggleLongText(on); })
      }
      .width('100%')
      .margin({ top: 12 })
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)

      // 字重开关。
      Row() {
        Text('加粗（fontWeight 700）')
          .fontSize($r('app.float.body_font_size'))
          .fontColor($r('app.color.text_primary'))
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.fontWeight === 700 })
          .onChange((on: boolean) => { this.onToggleBold(on); })
      }
      .width('100%')
      .margin({ top: 8 })
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)

      // 斜体开关（fontStyle）。
      Row() {
        Text('斜体（fontStyle italic）')
          .fontSize($r('app.float.body_font_size'))
          .fontColor($r('app.color.text_primary'))
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.fontStyle !== 0 })
          .onChange((on: boolean) => { this.onToggleItalic(on); })
      }
      .width('100%')
      .margin({ top: 8 })
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)

      // 字体族选择（fontFamily）。
      Text('fontFamily')
        .fontSize($r('app.float.caption_font_size'))
        .fontColor($r('app.color.text_primary'))
        .margin({ top: 8 })
      Row() {
        this.familyButton('sans-serif', 'Sans')
        this.familyButton('serif', 'Serif')
        this.familyButton('monospace', 'Mono')
      }
      .width('100%')
      .margin({ top: 6 })
      .justifyContent(FlexAlign.Start)

      // 字号。
      this.buildSliderRow('fontSize', `${this.fontSize} vp`, 10, 60, this.fontSize)
      // 头尾间隔。
      this.buildSliderRow('space', `${this.space} vp`, 0, 300, this.space)
      // 速度。
      this.buildSliderRow('speed', `${this.speed} vp/帧`, 0.1, 3.0, this.speed)

      // 颜色预设。
      Text('fontColor')
        .fontSize($r('app.float.caption_font_size'))
        .fontColor($r('app.color.text_primary'))
        .margin({ top: 8 })
      Row() {
        this.colorSwatch('#1A1A1A', '黑')
        this.colorSwatch('#E53935', '红')
        this.colorSwatch('#1754CE', '蓝')
        this.colorSwatch('#2E7D32', '绿')
        this.colorSwatch('#EF6C00', '橙')
      }
      .width('100%')
      .margin({ top: 6 })
      .justifyContent(FlexAlign.Start)

      // 自动开始滚动开关（autoStart）。
      Row() {
        Text('自动开始滚动（autoStart）')
          .fontSize($r('app.float.body_font_size'))
          .fontColor($r('app.color.text_primary'))
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.autoStart })
          .onChange((on: boolean) => { this.onToggleAutoStart(on); })
      }
      .width('100%')
      .margin({ top: 8 })
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
    }
    .width('100%')
    .padding(16)
    .margin({ left: 16, right: 16, top: 12 })
    .backgroundColor($r('app.color.card_background'))
    .borderRadius($r('app.float.card_radius'))
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  buildSliderRow(label: string, valueText: string, min: number, max: number, value: number): void {
    Column() {
      Row() {
        Text(label)
          .fontSize($r('app.float.body_font_size'))
          .fontColor($r('app.color.text_primary'))
          .layoutWeight(1)
        Text(valueText)
          .fontSize($r('app.float.caption_font_size'))
          .fontColor($r('app.color.text_secondary'))
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Slider({ value: value, min: min, max: max, step: 0.01 })
        .width('100%')
        .blockColor($r('app.color.accent'))
        .selectedColor($r('app.color.accent'))
        .trackColor($r('app.color.divider'))
        .onChange((v: number, mode: SliderChangeMode) => {
          if (mode === SliderChangeMode.Moving || mode === SliderChangeMode.Click || mode === SliderChangeMode.End) {
            this.onSliderChange(label, v);
          }
        })
    }
    .width('100%')
    .margin({ top: 10 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  colorSwatch(hex: string, name: string): void {
    Column() {
      Text('')
        .width(28)
        .height(28)
        .borderRadius(14)
        .backgroundColor(hex)
        .border({ width: 1, color: $r('app.color.divider') })
      Text(name)
        .fontSize($r('app.float.caption_font_size'))
        .fontColor($r('app.color.text_secondary'))
        .margin({ top: 4 })
    }
    .margin({ right: 12 })
    .onClick(() => { this.onPickColor(hex, name); })
  }

  @Builder
  familyButton(family: string, label: string): void {
    Button(label)
      .type(ButtonType.Capsule)
      .height(28)
      .padding({ left: 14, right: 14 })
      .fontSize($r('app.float.caption_font_size'))
      .backgroundColor(this.fontFamily === family ? $r('app.color.accent') : $r('app.color.button_secondary_bg'))
      .fontColor(this.fontFamily === family ? Color.White : $r('app.color.text_primary'))
      .margin({ right: 8 })
      .onClick(() => { this.onPickFontFamily(family); })
  }

  @Builder
  buildLogCard(): void {
    Column() {
      Row() {
        Text('操作日志')
          .fontSize($r('app.float.caption_font_size'))
          .fontColor($r('app.color.text_secondary'))
          .layoutWeight(1)
        Button('清空')
          .type(ButtonType.Capsule)
          .height(28)
          .padding({ left: 12, right: 12 })
          .fontSize($r('app.float.caption_font_size'))
          .backgroundColor($r('app.color.button_secondary_bg'))
          .fontColor($r('app.color.text_primary'))
          .onClick(() => { this.clearLog(); })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)

      if (this.logs.length === 0) {
        Text('（暂无日志）')
          .fontSize($r('app.float.caption_font_size'))
          .fontColor($r('app.color.text_secondary'))
          .margin({ top: 8 })
      } else {
        Scroll() {
          Column() {
            ForEach(this.logs, (item: string) => {
              Text(item)
                .fontSize($r('app.float.caption_font_size'))
                .fontColor($r('app.color.log_text'))
                .width('100%')
                .margin({ top: 4 })
            }, (item: string, idx: number) => idx.toString())
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
        }
        .width('100%')
        .height(180)
        .margin({ top: 8 })
        .backgroundColor($r('app.color.log_background'))
        .borderRadius(8)
        .padding(8)
        .scrollBar(BarState.Off)
        .edgeEffect(EdgeEffect.Spring)
      }
    }
    .width('100%')
    .padding(16)
    .margin({ left: 16, right: 16, top: 12, bottom: 24 })
    .backgroundColor($r('app.color.card_background'))
    .borderRadius($r('app.float.card_radius'))
    .alignItems(HorizontalAlign.Start)
  }
}
