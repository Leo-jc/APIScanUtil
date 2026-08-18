import { promptAction } from '@kit.ArkUI';
import { InsLoadingView } from 'library';
import { InsLoadingController, InsStatus } from 'library';

/**
 * InsLoadingAnimation 鸿蒙 Demo。
 *
 * 对应 Android `DemoActivity`：
 * - 居中放置 InsLoadingView，点击在 UNCLICKED → LOADING → CLICKED → UNCLICKED 间循环，并以轻提示反馈
 * - 长按触发“long click”轻提示
 * - 默认状态 LOADING，头像使用 pink.jpg
 *
 * 额外覆盖运行态可配置项（对应 Android 公开 setter）：
 * - 起始 / 结束颜色（颜色预设按钮）
 * - 进度弧时长 / 旋转时长（滑块）
 * - 头像图片源（pink / eric / srv 切换）
 * - 状态变化与每次操作的真实返回值显示在日志区
 */

interface ColorPreset {
  name: string;
  start: string;
  end: string;
}

interface ImagePreset {
  name: string;
  src: string;
}

interface LogEntry {
  id: number;
  text: string;
  time: string;
}

const COLOR_PRESETS: ColorPreset[] = [
  { name: '粉黄(默认)', start: '#FFF700C2', end: '#FFFFD900' },
  { name: '蓝紫', start: '#FF3B82F6', end: '#FF8B5CF6' },
  { name: '红绿', start: '#FFEF4444', end: '#FF22C55E' },
  { name: '青橙', start: '#FF06B6D4', end: '#FFF97316' },
];

const IMAGE_PRESETS: ImagePreset[] = [
  { name: 'pink', src: 'common/images/pink.jpg' },
  { name: 'eric', src: 'common/images/eric.jpg' },
  { name: 'srv', src: 'common/images/srv.jpg' },
];

function statusName(s: InsStatus): string {
  if (s === InsStatus.LOADING) {
    return 'LOADING(加载中)';
  } else if (s === InsStatus.CLICKED) {
    return 'CLICKED(已加载)';
  }
  return 'UNCLICKED(未点击)';
}

function nextStatus(s: InsStatus): InsStatus {
  if (s === InsStatus.UNCLICKED) {
    return InsStatus.LOADING;
  } else if (s === InsStatus.LOADING) {
    return InsStatus.CLICKED;
  }
  return InsStatus.UNCLICKED;
}

function formatTime(d: Date): string {
  const h: string = d.getHours().toString().padStart(2, '0');
  const m: string = d.getMinutes().toString().padStart(2, '0');
  const s: string = d.getSeconds().toString().padStart(2, '0');
  const ms: string = d.getMilliseconds().toString().padStart(3, '0');
  return `${h}:${m}:${s}.${ms}`;
}

@Entry
@Component
struct Index {
  private controller: InsLoadingController = new InsLoadingController();
  private logId: number = 0;

  @State currentStatus: InsStatus = InsStatus.LOADING;
  @State currentImageSrc: string = IMAGE_PRESETS[0].src;
  @State currentImageName: string = IMAGE_PRESETS[0].name;
  @State circleDuration: number = 2000;
  @State rotateDuration: number = 10000;
  @State logs: LogEntry[] = [];

  aboutToAppear(): void {
    this.controller.onStatusChange((status: InsStatus) => {
      this.currentStatus = status;
      this.appendLog(`状态变化 -> getStatus() = ${statusName(status)}`);
    });
    this.appendLog('Demo 启动，默认 status = LOADING');
  }

  private appendLog(text: string): void {
    const entry: LogEntry = {
      id: this.logId++,
      text: text,
      time: formatTime(new Date()),
    };
    this.logs.unshift(entry);
    if (this.logs.length > 40) {
      this.logs.splice(40, this.logs.length - 40);
    }
  }

  private showToast(msg: string): void {
    promptAction.showToast({ message: msg, duration: 1500, bottom: '60%' });
    this.appendLog(`Toast: ${msg}`);
  }

  build() {
    Column() {
      // 顶栏标题
      Text('InsLoadingAnimation')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor('#FF1F2937')
        .width('100%')
        .textAlign(TextAlign.Center)
        .padding({ top: 16, bottom: 8 })

      Text('仿 Instagram / 微博 头像加载动画（HarmonyOS / ArkTS）')
        .fontSize(12)
        .fontColor('#FF6B7280')
        .width('100%')
        .textAlign(TextAlign.Center)
        .padding({ bottom: 8 })

      // 头像区
      Stack({ alignContent: Alignment.Center }) {
        InsLoadingView({
          imageSrc: this.currentImageSrc,
          status: InsStatus.LOADING,
          startColor: COLOR_PRESETS[0].start,
          endColor: COLOR_PRESETS[0].end,
          circleDuration: this.circleDuration,
          rotateDuration: this.rotateDuration,
          sideLength: 260,
          controller: this.controller,
        })
          .width(260)
          .height(260)
          .onClick(() => { this.onAvatarClick(); })
          .gesture(
            LongPressGesture({ repeat: false, fingers: 1, duration: 500 })
              .onAction((event: GestureEvent) => { this.onAvatarLongPress(); })
          )
      }
      .width('100%')
      .height(300)
      .alignContent(Alignment.Center)

      // 当前状态
      Text(`当前状态：${statusName(this.currentStatus)}`)
        .fontSize(15)
        .fontWeight(FontWeight.Medium)
        .fontColor('#FF111827')
        .margin({ top: 4, bottom: 4 })

      Text('点击头像：UNCLICKED → LOADING → CLICKED 循环 ｜ 长按：触发长按事件')
        .fontSize(12)
        .fontColor('#FF4B5563')
        .margin({ bottom: 8 })

      // 颜色预设
      Text('进度弧颜色（setStartColor / setEndColor）')
        .fontSize(13)
        .fontColor('#FF374151')
        .width('100%')
        .margin({ bottom: 4 })
      Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start }) {
        ForEach(COLOR_PRESETS, (preset: ColorPreset) => {
          Button(preset.name)
            .type(ButtonType.Capsule)
            .fontSize(12)
            .height(32)
            .margin({ right: 8, bottom: 6 })
            .backgroundColor('#FF1F2937')
            .fontColor('#FFFFFFFF')
            .onClick(() => { this.onColorPreset(preset); })
        })
      }
      .width('100%')
      .margin({ bottom: 8 })

      // 进度弧时长
      Row() {
        Text('进度弧时长 circleDuration')
          .fontSize(13)
          .fontColor('#FF374151')
          .layoutWeight(1)
        Text(`${this.circleDuration} ms`)
          .fontSize(13)
          .fontColor('#FF111827')
          .width(96)
          .textAlign(TextAlign.End)
      }
      .width('100%')
      Slider({ value: this.circleDuration, min: 200, max: 6000, step: 100, style: SliderStyle.InSet })
        .width('100%')
        .blockColor('#FFF700C2')
        .selectedColor('#FFFFD900')
        .trackColor('#FFE5E7EB')
        .onChange((value: number, mode: SliderChangeMode) => {
          if (mode === SliderChangeMode.Moving || mode === SliderChangeMode.Click) {
            const v: number = Math.round(value);
            if (v !== this.circleDuration) {
              this.circleDuration = v;
              this.controller.setCircleDuration(v);
              this.appendLog(`setCircleDuration(${v}) -> 已重置进度弧动画时长`);
            }
          }
        })

      // 旋转时长
      Row() {
        Text('旋转时长 rotateDuration')
          .fontSize(13)
          .fontColor('#FF374151')
          .layoutWeight(1)
        Text(`${this.rotateDuration} ms`)
          .fontSize(13)
          .fontColor('#FF111827')
          .width(96)
          .textAlign(TextAlign.End)
      }
      .width('100%')
      Slider({ value: this.rotateDuration, min: 1000, max: 30000, step: 500, style: SliderStyle.InSet })
        .width('100%')
        .blockColor('#FF3B82F6')
        .selectedColor('#FF8B5CF6')
        .trackColor('#FFE5E7EB')
        .onChange((value: number, mode: SliderChangeMode) => {
          if (mode === SliderChangeMode.Moving || mode === SliderChangeMode.Click) {
            const v: number = Math.round(value);
            if (v !== this.rotateDuration) {
              this.rotateDuration = v;
              this.controller.setRotateDuration(v);
              this.appendLog(`setRotateDuration(${v}) -> 已重置旋转动画时长`);
            }
          }
        })

      // 头像图片切换
      Text('头像图片源（setImageSrc）')
        .fontSize(13)
        .fontColor('#FF374151')
        .width('100%')
        .margin({ top: 4, bottom: 4 })
      Row() {
        ForEach(IMAGE_PRESETS, (preset: ImagePreset) => {
          Button(preset.name)
            .type(ButtonType.Capsule)
            .fontSize(12)
            .height(30)
            .layoutWeight(1)
            .margin({ left: 4, right: 4 })
            .backgroundColor(this.currentImageName === preset.name ? '#FFF700C2' : '#FFE5E7EB')
            .fontColor(this.currentImageName === preset.name ? '#FFFFFFFF' : '#FF1F2937')
            .onClick(() => { this.onImagePreset(preset); })
        })
      }
      .width('100%')
      .margin({ bottom: 8 })

      // 重置 + 三态直选
      Row() {
        Button('设为 LOADING')
          .type(ButtonType.Capsule)
          .fontSize(12)
          .height(32)
          .layoutWeight(1)
          .margin({ left: 2, right: 2 })
          .backgroundColor('#FFFFFFFF')
          .fontColor('#FF1F2937')
          .border({ width: 1, color: '#FFD1D5DB' })
          .onClick(() => { this.controller.setStatus(InsStatus.LOADING); })
        Button('设为 UNCLICKED')
          .type(ButtonType.Capsule)
          .fontSize(12)
          .height(32)
          .layoutWeight(1)
          .margin({ left: 2, right: 2 })
          .backgroundColor('#FFFFFFFF')
          .fontColor('#FF1F2937')
          .border({ width: 1, color: '#FFD1D5DB' })
          .onClick(() => { this.controller.setStatus(InsStatus.UNCLICKED); })
        Button('设为 CLICKED')
          .type(ButtonType.Capsule)
          .fontSize(12)
          .height(32)
          .layoutWeight(1)
          .margin({ left: 2, right: 2 })
          .backgroundColor('#FFFFFFFF')
          .fontColor('#FF1F2937')
          .border({ width: 1, color: '#FFD1D5DB' })
          .onClick(() => { this.controller.setStatus(InsStatus.CLICKED); })
      }
      .width('100%')
      .margin({ bottom: 6 })

      Button('重置全部为默认')
        .type(ButtonType.Capsule)
        .fontSize(13)
        .height(34)
        .width('100%')
        .backgroundColor('#FF111827')
        .fontColor('#FFFFFFFF')
        .onClick(() => { this.onReset(); })
        .margin({ bottom: 8 })

      // 日志区
      Text('日志区（真实返回值 / 状态变化 / 副作用）')
        .fontSize(12)
        .fontWeight(FontWeight.Medium)
        .fontColor('#FF374151')
        .width('100%')
        .margin({ bottom: 4 })
      Scroll(this.scroller) {
        Column() {
          ForEach(this.logs, (entry: LogEntry) => {
            Text(`${entry.time}  ${entry.text}`)
              .fontSize(11)
              .fontColor('#FF1F2937')
              .width('100%')
              .padding({ left: 8, right: 8, top: 3, bottom: 3 })
          }, (entry: LogEntry) => entry.id.toString())
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .layoutWeight(1)
      .backgroundColor('#FFF9FAFB')
      .border({ width: 1, color: '#FFE5E7EB', radius: 8 })
      .padding(4)
      .edgeEffect(EdgeEffect.Spring)
      .scrollBar(BarState.Auto)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFFFF')
    .padding({ left: 16, right: 16, bottom: 16 })
    .alignItems(HorizontalAlign.Start)
  }

  private scroller: Scroller = new Scroller();

  private onAvatarClick(): void {
    const cur: InsStatus = this.controller.getStatus();
    const nxt: InsStatus = nextStatus(cur);
    this.controller.setStatus(nxt);
    this.showToast('click !');
  }

  private onAvatarLongPress(): void {
    this.showToast('long click !');
  }

  private onColorPreset(preset: ColorPreset): void {
    this.controller.setStartColor(preset.start);
    this.controller.setEndColor(preset.end);
    this.appendLog(`setStartColor(${preset.start}) / setEndColor(${preset.end}) -> 渐变已重建`);
  }

  private onImagePreset(preset: ImagePreset): void {
    if (this.currentImageName === preset.name) {
      return;
    }
    this.currentImageName = preset.name;
    this.currentImageSrc = preset.src;
    this.controller.setImageSrc(preset.src);
    this.appendLog(`setImageSrc(${preset.src}) -> 头像已切换`);
  }

  private onReset(): void {
    this.controller.setStartColor(COLOR_PRESETS[0].start);
    this.controller.setEndColor(COLOR_PRESETS[0].end);
    this.circleDuration = 2000;
    this.rotateDuration = 10000;
    this.controller.setCircleDuration(2000);
    this.controller.setRotateDuration(10000);
    this.currentImageName = IMAGE_PRESETS[0].name;
    this.currentImageSrc = IMAGE_PRESETS[0].src;
    this.controller.setImageSrc(IMAGE_PRESETS[0].src);
    this.controller.setStatus(InsStatus.LOADING);
    this.appendLog('重置全部参数为默认值');
  }
}
