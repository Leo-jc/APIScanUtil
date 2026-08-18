import { FluidLayout, FluidGravity, FluidItem, FluidMargin, FluidVisibility } from 'fluidlayout';

/**
 * Demo 标签数据，对应 Android sample MainActivity.tags。
 */
const TAG_LIST: string[] = [
  '倩女幽魂', '单机斗地主', '天堂战记', '妖精的尾巴', '极限挑战', '我们相爱吧', '倚天屠龙记',
  '明星大侦探', '丰乳肥臀', '大主宰', '盗墓笔记', '鬼吹灯', '盘龙', '完美世界', '柠檬初上', 'WIFI',
  '锁屏', '异术超能', '东方不败', '巅峰战舰', '小说', '污', '蒲公英', '网红', '霍建华', '林心如',
  '南极', 'Java', 'Android', '谷歌', '手机', 'iPad', '充电宝', '黔驴技穷', '水果', '植物大战僵尸',
  '倩女幽魂', '单机斗地主', '天堂战记', '妖精的尾巴', '极限挑战', '我们相爱吧', '倚天屠龙记',
  '切水果', '手机', 'iPad', '充电宝', '黔驴技穷', '水果', '植物大战僵尸', '切水果', '手机', 'iPad',
  '充电宝', '黔驴技穷', '水果', '植物大战僵尸', '切水果', '手机', 'iPad', '充电宝', '黔驴技穷',
  '水果', '植物大战僵尸', '切水果', '手机', 'iPad', '充电宝', '黔驴技穷', '水果', '植物大战僵尸',
  '切水果', '手机', 'iPad', '充电宝', '黔驴技穷', '水果', '植物大战僵尸', '切水果', '手机', 'iPad',
  '充电宝', '黔驴技穷', '水果', '植物大战僵尸', '切水果', '手机', 'iPad', '充电宝', '黔驴技穷',
  '水果', '植物大战僵尸', '切水果', '植物大战僵尸', '切水果', '植物大战僵尸', '切水果', '切水果',
  '充电宝', '黔驴技穷', '水果', '植物大战僵尸', '切水果', '手机', 'iPad', '充电宝', '黔驴技穷',
  '倩女幽魂', '单机斗地主', '天堂战记', '妖精的尾巴', '极限挑战', '我们相爱吧', '倚天屠龙记',
  '水果', '植物大战僵尸', '切水果', '手机', 'iPad', '充电宝', '黔驴技穷', '水果', '植物大战僵尸',
  '切水果', '手机', 'iPad', '充电宝', '黔驴技穷', '水果', '植物大战僵尸', '切水果', '手机', 'iPad',
  '充电宝', '黔驴技穷', '水果', '植物大战僵尸', '切水果', '植物大战僵尸', '切水果', '植物大战僵尸',
  '切水果', '切水果'
];

/**
 * 标签背景描边色与宽度（对应 Android drawable text_bg / text_bg_highlight 的 stroke）。
 * 描边宽度 1px，与 Android stroke width="1px" 一致（绝对物理像素，不随密度缩放）。
 */
class TagBorder {
  static readonly WIDTH: string = '1px';
  static readonly NORMAL: string = '#999999';
  static readonly HIGHLIGHT: string = '#FF0000';
}

/**
 * 标签文字色（对应 Android MainActivity.setTextColor 规则）。
 */
class TagTextColor {
  static readonly RED: string = '#FF0000';
  static readonly GREEN: string = '#66CD00';
  static readonly GRAY: string = '#666666';
}

/**
 * 标签圆角、内边距、外边距、字号（对应 Android drawable/text_bg 与 genTag 参数）。
 */
class TagMetrics {
  static readonly RADIUS: number = 3;
  static readonly PADDING: number = 4;
  static readonly MARGIN: number = 12;
  static readonly FONT_SIZE: number = 13;
  /** 高亮项变高时的高度（对应 Android setHeight(100)，单位 px，绝对像素不随密度缩放）。 */
  static readonly HIGHLIGHT_HEIGHT: string = '100px';
}

@Entry
@Component
struct Index {
  /** 当前容器级对齐，对应 Android gravity。 */
  @State gravity: FluidGravity = FluidGravity.Top;
  /** 是否给普通标签加描边背景，对应 Android hasBg。 */
  @State hasBg: boolean = true;
  /** 是否为常规模式（高亮项不高亮变高），对应 Android isNormal。 */
  @State isNormal: boolean = true;
  /** 标签数据数组，对应 Android genTag 的 removeAllViews + addView 循环。 */
  @State items: FluidItem[] = [];

  /** 操作日志，用于在界面日志区展示真实状态变化与返回值。 */
  @State logs: string[] = [];

  aboutToAppear(): void {
    this.genTag('init');
  }

  /**
   * 重建标签流，对应 Android genTag(hasBg)：
   * removeAllViews + setGravity + 循环 addView(TextView, LayoutParams(setMargins(12,12,12,12)))。
   */
  private genTag(reason: string): void {
    let list: FluidItem[] = [];
    for (let i = 0; i < TAG_LIST.length; i++) {
      let item: FluidItem = new FluidItem();
      item.data = TAG_LIST[i];
      item.gravity = null;
      item.margin = new FluidMargin();
      item.margin.left = TagMetrics.MARGIN;
      item.margin.top = TagMetrics.MARGIN;
      item.margin.right = TagMetrics.MARGIN;
      item.margin.bottom = TagMetrics.MARGIN;
      item.visibility = FluidVisibility.Visible;
      list.push(item);
    }
    this.items = list;
    this.appendLog(`genTag(${reason}) -> gravity=${this.gravityName()} hasBg=${this.hasBg} ` +
      `isNormal=${this.isNormal} items=${list.length}`);
  }

  private gravityName(): string {
    switch (this.gravity) {
      case FluidGravity.Top: return 'Top';
      case FluidGravity.Center: return 'Center';
      case FluidGravity.Bottom: return 'Bottom';
      default: return 'Unknown';
    }
  }

  private appendLog(line: string): void {
    let next = this.logs.concat(line);
    if (next.length > 30) {
      next = next.slice(next.length - 30);
    }
    this.logs = next;
  }

  /** 按钮回调：切换为 Top 对齐（对应 Android btnTop）。 */
  onTop(): void {
    this.gravity = FluidGravity.Top;
    this.isNormal = false;
    this.genTag('btnTop');
  }

  /** 按钮回调：切换为 Center 对齐（对应 Android btnCenter）。 */
  onCenter(): void {
    this.gravity = FluidGravity.Center;
    this.isNormal = false;
    this.genTag('btnCenter');
  }

  /** 按钮回调：切换为 Bottom 对齐（对应 Android btnBtm）。 */
  onBottom(): void {
    this.gravity = FluidGravity.Bottom;
    this.isNormal = false;
    this.genTag('btnBtm');
  }

  /** 按钮回调：切换高亮项是否变高（对应 Android btnNormal 的 isNormal 翻转）。 */
  onNormal(): void {
    this.isNormal = !this.isNormal;
    this.genTag('btnNormal');
  }

  /** 开关回调：切换普通标签描边背景（对应 Android btnStroke 的 hasBg 翻转）。 */
  onStroke(isOn: boolean): void {
    this.hasBg = isOn;
    this.genTag('btnStroke');
  }

  /** 标签文字色规则：i%8==0 红（优先），i%28==0 绿，其余灰（对应 Android genTag 颜色分支）。 */
  private tagTextColor(i: number): string {
    if (i % 8 === 0) {
      return TagTextColor.RED;
    }
    if (i % 28 === 0) {
      return TagTextColor.GREEN;
    }
    return TagTextColor.GRAY;
  }

  /** 第 12 项为高亮项（对应 Android i==12 分支）。 */
  private isHighlight(i: number): boolean {
    return i === 12;
  }

  /**
   * 单标签构建。通过箭头函数传入 FluidLayout 的 itemBuilder，使 this 保持在 Index 组件，
   * 从而访问 isNormal / hasBg 等运行态状态（这是 ArkUI @BuilderParam 的 this 绑定规则要求）。
   */
  @Builder
  tagBuilder(item: FluidItem, index: number) {
    if (this.isHighlight(index)) {
      // 高亮项：红色描边；非 normal 模式下变高 100vp 并文字居中。
      if (!this.isNormal) {
        Text(item.data)
          .fontSize(TagMetrics.FONT_SIZE)
          .fontColor(this.tagTextColor(index))
          .height(TagMetrics.HIGHLIGHT_HEIGHT)
          .textAlign(TextAlign.Center)
          .borderRadius(TagMetrics.RADIUS)
          .padding(TagMetrics.PADDING)
          .border({ width: TagBorder.WIDTH, color: TagBorder.HIGHLIGHT })
      } else {
        Text(item.data)
          .fontSize(TagMetrics.FONT_SIZE)
          .fontColor(this.tagTextColor(index))
          .borderRadius(TagMetrics.RADIUS)
          .padding(TagMetrics.PADDING)
          .border({ width: TagBorder.WIDTH, color: TagBorder.HIGHLIGHT })
      }
    } else if (this.hasBg) {
      // 普通项且有描边背景：灰色描边。
      Text(item.data)
        .fontSize(TagMetrics.FONT_SIZE)
        .fontColor(this.tagTextColor(index))
        .borderRadius(TagMetrics.RADIUS)
        .padding(TagMetrics.PADDING)
        .border({ width: TagBorder.WIDTH, color: TagBorder.NORMAL })
    } else {
      // 普通项无描边背景：仅文字。
      Text(item.data)
        .fontSize(TagMetrics.FONT_SIZE)
        .fontColor(this.tagTextColor(index))
    }
  }

  build() {
    Column() {
      // 标题与当前状态说明。
      Row() {
        Text('FluidLayout Demo')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333333')
        Blank()
        Text(`gravity: ${this.gravityName()}`)
          .fontSize(13)
          .fontColor('#666666')
      }
      .width('100%')
      .height(48)
      .padding({ left: 12, right: 12 })
      .backgroundColor('#FFFFFF')

      // 可滚动标签流：Scroll 嵌套 FluidLayout（对应 Android ScrollView + FluidLayout）。
      Scroll() {
        FluidLayout({
          gravity: this.gravity,
          items: this.items,
          fluidPadding: { left: 5, top: 5, right: 5, bottom: 5 },
          itemBuilder: (item: FluidItem, index: number) => {
            this.tagBuilder(item, index)
          }
        })
          .width('100%')
      }
      .scrollBar(BarState.Auto)
      .edgeEffect(EdgeEffect.Spring)
      .layoutWeight(1)
      .width('100%')

      // 操作日志区：展示真实状态变化与副作用。
      Column() {
        Text('日志')
          .fontSize(12)
          .fontColor('#999999')
          .width('100%')
        Scroll() {
          Column() {
            ForEach(this.logs, (line: string, idx: number) => {
              Text(line)
                .fontSize(11)
                .fontColor('#555555')
                .width('100%')
                .padding({ left: 0, top: 1, right: 0, bottom: 1 })
            }, (line: string, idx: number) => idx.toString())
          }
          .width('100%')
          .padding({ left: 12, right: 12, top: 4, bottom: 4 })
        }
        .scrollBar(BarState.Auto)
        .height(72)
        .width('100%')
        .backgroundColor('#F7F7F7')
      }
      .width('100%')

      // 底部按钮区：对应 Android activity_main.xml 底部 LinearLayout。
      Row({ space: 0 }) {
        Button('normal switch')
          .fontSize(14)
          .fontColor('#333333')
          .backgroundColor('#dbdbdb')
          .margin(5)
          .layoutWeight(1)
          .onClick(() => this.onNormal())
        Button('center')
          .fontSize(14)
          .fontColor('#333333')
          .backgroundColor('#dbdbdb')
          .margin(5)
          .layoutWeight(1)
          .onClick(() => this.onCenter())
        Button('bottom')
          .fontSize(14)
          .fontColor('#333333')
          .backgroundColor('#dbdbdb')
          .margin(5)
          .layoutWeight(1)
          .onClick(() => this.onBottom())
        Button('top')
          .fontSize(14)
          .fontColor('#333333')
          .backgroundColor('#dbdbdb')
          .margin(5)
          .layoutWeight(1)
          .onClick(() => this.onTop())
        Toggle({ type: ToggleType.Button, isOn: this.hasBg }) {
          Text(this.hasBg ? 'No Stroke' : 'Stroke')
            .fontSize(14)
            .fontColor('#333333')
        }
          .backgroundColor('#dbdbdb')
          .selectedColor('#cccccc')
          .margin(5)
          .layoutWeight(1)
          .onChange((isOn: boolean) => this.onStroke(isOn))
      }
      .width('100%')
      .padding({ left: 0, top: 2, right: 0, bottom: 2 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f1f1f1')
  }
}
