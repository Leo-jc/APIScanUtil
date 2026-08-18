import { displaySync } from '@kit.ArkGraphics2D';
import { display, UIContext } from '@kit.ArkUI';
import { MarqueeTextViewController } from './MarqueeTextViewController';

/**
 * 速率归一化基准帧率。原 Android 实现以 60Hz 为基准，配合屏幕实际刷新率 mFps
 * 计算 (BASE_FPS / mFps) * speed，使不同刷新率设备每秒滚动距离一致。
 */
const BASE_FPS: number = 60;

/**
 * MarqueeTextView —— 走马灯式横向滚动文本组件（ArkUI 自绘实现）。
 *
 * 还原 Android com.dreamgyf.marqueetextview.MarqueeTextView 的全部行为：
 * - 无论文本是否超过一行，都持续向左横向滚动；
 * - 头尾以不小于 space 的间隔无缝衔接循环滚动；
 * - 文本/字号/颜色变化后自动重建位图并从起点重滚；
 * - start/pause/stop/restart 命令式控制，语义与原实现一致；
 * - 以屏幕刷新率为基准驱动每帧位移，保证不同刷新率设备滚动速率一致。
 *
 * 平台映射：Choreographer -> displaySync；TextView->Bitmap 双缓冲 ->
 * OffscreenCanvas + transferToImageBitmap；Canvas.drawBitmap -> CanvasRenderingContext2D.drawImage。
 *
 * 单位口径：本组件统一使用 vp（鸿蒙逻辑像素，等价于 Android 的 dp）。
 * - space：头尾最小间隔，单位 vp，默认 100（对应原 DEFAULT_SPACE=100px，归一化为 vp）。
 * - speed：滚动速度，单位 vp/帧(60Hz 基准)，默认 0.5（对应原 DEFAULT_SPEED=0.5dp）。
 */
@Component
export struct MarqueeTextView {
  // ---------------- 可配置属性（对应 Android app:space / app:speed / android:text / android:textSize / android:textColor 等） ----------------

  /** 文本内容。 */
  @Prop @Watch('onStyleChange') text: string = '';
  /** 字号，单位 vp。 */
  @Prop @Watch('onStyleChange') fontSize: number = 16;
  /** 文字颜色，CSS 颜色字符串（如 '#000000'、'rgb(0,0,0)'）。 */
  @Prop @Watch('onStyleChange') fontColor: string = '#000000';
  /** 字重，数字（100/300/400/500/700/900 等）。 */
  @Prop @Watch('onStyleChange') fontWeight: number = 400;
  /** 字体样式：0 = Normal，1 = Italic（对应 FontStyle）。 */
  @Prop @Watch('onStyleChange') fontStyle: number = 0;
  /** 字体族（'sans-serif'、'serif'、'monospace' 或已注册自定义字体名）。 */
  @Prop @Watch('onStyleChange') fontFamily: string = 'sans-serif';
  /** 头尾最小间隔，单位 vp。 */
  @Prop @Watch('onConfigChange') space: number = 100;
  /** 滚动速度，单位 vp/帧(60Hz 基准)。 */
  @Prop @Watch('onConfigChange') speed: number = 0.5;
  /** 是否在组件就绪后自动开始滚动（对应原实现 onLayoutChange 时自动 restartScroll）。 */
  @Prop @Watch('onAutoStartChange') autoStart: boolean = true;

  /** 命令式控制器，父组件可持有并在外部调用 startScroll/pauseScroll/stopScroll/restartScroll。 */
  controller: MarqueeTextViewController = new MarqueeTextViewController();

  // ---------------- 响应式尺寸状态 ----------------

  /** 组件内容高度（= 文本块高度），驱动 Canvas 的 height。 */
  @State private viewHeight: number = 0;

  // ---------------- 绘制与动画内部状态（非响应式） ----------------

  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  /** 测量用离屏画布（独立于 Canvas 组件，aboutToAppear 即可用）。 */
  private measureCanvas: OffscreenCanvas = new OffscreenCanvas(1, 1);
  private measureCtx: OffscreenCanvasRenderingContext2D | null = null;

  /** 文本位图缓冲（对应 Android mBitmap）。 */
  private offCanvas: OffscreenCanvas | null = null;
  private imageBitmap: ImageBitmap | null = null;

  private displaySyncInstance: displaySync.DisplaySync = displaySync.create();
  private frameCallback: ((info: displaySync.IntervalInfo) => void) | null = null;

  /** 当前位移（vp），对应 Android mLeftX。 */
  private leftX: number = 0;
  /** 屏幕刷新率（Hz），对应 Android mFps。 */
  private fps: number = 60;
  /** 组件可见宽度（vp）。 */
  private viewWidth: number = 0;
  /** 文本块宽度（vp）。 */
  private textWidth: number = 0;
  /** 是否正在滚动。 */
  private isScrolling: boolean = false;
  /** Canvas 是否已就绪。 */
  private ready: boolean = false;

  // ---------------- 生命周期 ----------------

  aboutToAppear(): void {
    // 注册帧回调（箭头函数捕获 this）。
    const cb: (info: displaySync.IntervalInfo) => void = (info: displaySync.IntervalInfo) => {
      this.advanceFrame();
    };
    this.frameCallback = cb;
    try {
      this.displaySyncInstance.on('frame', cb);
    } catch (e) {
      // 注册失败时记录，不影响后续流程。
    }

    // 测量上下文。
    try {
      const ctx: OffscreenCanvasRenderingContext2D | undefined = this.measureCanvas.getContext('2d', this.settings);
      if (ctx !== undefined) {
        this.measureCtx = ctx;
      }
    } catch (e) {
      this.measureCtx = null;
    }

    // 预测量，确定初始高度，避免首次布局高度为 0。
    this.remeasure();

    // 绑定命令式控制器。
    this.controller.bind(
      () => { this.startScroll(); },
      () => { this.pauseScroll(); },
      () => { this.stopScroll(); },
      () => { this.restartScroll(); },
      () => { return this.leftX; }
    );
  }

  aboutToDisappear(): void {
    // 停止帧回调并取消订阅，防泄漏。
    this.isScrolling = false;
    try {
      this.displaySyncInstance.stop();
    } catch (e) {
    }
    const cb = this.frameCallback;
    if (cb !== null) {
      try {
        this.displaySyncInstance.off('frame', cb);
      } catch (e) {
      }
      this.frameCallback = null;
    }
    this.imageBitmap = null;
    this.offCanvas = null;
    this.measureCtx = null;
    // 通知宿主资源已释放（对应 Android onDetachedFromWindow），再解除控制器绑定。
    this.controller.notifyReleased();
    this.controller.unbind();
  }

  // ---------------- @Watch 处理 ----------------

  private onStyleChange(): void {
    // 文本/字号/颜色/字重/样式/字体族变化 -> 重新测量 + 重建位图 + 从起点重滚。
    this.remeasure();
    if (this.ready) {
      this.buildBitmap();
      if (this.isScrolling) {
        this.restartScroll();
      } else if (this.autoStart) {
        this.startScroll();
      } else {
        this.drawFrame();
      }
    }
  }

  private onConfigChange(): void {
    // space/speed 变化无需重建位图，下一帧绘制/位移自然生效；静止时重绘一次。
    this.drawFrame();
  }

  private onAutoStartChange(): void {
    // autoStart 由 false 切换为 true 时：若组件已就绪且当前未在滚动，立即开始滚动。
    // 切换为 false 时：不打断当前滚动，仅影响后续样式变更时是否自动启动。
    if (this.autoStart && !this.isScrolling && this.ready) {
      this.startScroll();
    }
  }

  // ---------------- 测量与位图构建 ----------------

  private fontString(): string {
    const styleStr: string = this.fontStyle !== 0 ? 'italic' : 'normal';
    return `${styleStr} ${this.fontWeight} ${this.fontSize}vp ${this.fontFamily}`;
  }

  /** 测量文本宽高，更新 viewHeight（仅在变化时触发重渲染）。 */
  private remeasure(): void {
    const ctx: OffscreenCanvasRenderingContext2D | null = this.measureCtx;
    if (ctx === null) {
      // 测量不可用时，退化为字号作为高度，宽度未知先置 0。
      const h: number = this.fontSize > 0 ? this.fontSize : 16;
      this.textWidth = 0;
      if (h !== this.viewHeight) {
        this.viewHeight = h;
      }
      return;
    }
    const fontStr: string = this.fontString();
    ctx.font = fontStr;
    const txt: string = this.text !== null ? this.text : '';
    let width: number = 0;
    let height: number = 0;
    if (txt.length > 0) {
      const metrics: TextMetrics = ctx.measureText(txt);
      width = metrics.width;
      height = metrics.height;
    }
    if (width < 0) {
      width = 0;
    }
    if (height <= 0) {
      // 部分平台 height 字段可能为 0，退化为字号。
      height = this.fontSize > 0 ? this.fontSize : 16;
    }
    this.textWidth = width;
    if (height !== this.viewHeight) {
      this.viewHeight = height;
    }
  }

  /**
   * 重建文本位图（对应 Android updateBitmap）。
   * 将文本绘制到 textWidth × viewHeight 的离屏画布并 transferToImageBitmap 缓存，
   * 零/负尺寸时跳过以避免异常。
   */
  private buildBitmap(): void {
    const w: number = this.textWidth;
    const h: number = this.viewHeight;
    if (w <= 0 || h <= 0) {
      this.imageBitmap = null;
      this.offCanvas = null;
      return;
    }
    try {
      const off: OffscreenCanvas = new OffscreenCanvas(w, h);
      const offCtx: OffscreenCanvasRenderingContext2D | undefined = off.getContext('2d', this.settings);
      if (offCtx === undefined) {
        this.imageBitmap = null;
        this.offCanvas = null;
        return;
      }
      offCtx.clearRect(0, 0, w, h);
      offCtx.font = this.fontString();
      offCtx.fillStyle = this.fontColor;
      offCtx.textAlign = 'left';
      offCtx.textBaseline = 'top';
      offCtx.fillText(this.text, 0, 0);
      const bmp: ImageBitmap = off.transferToImageBitmap();
      this.offCanvas = off;
      this.imageBitmap = bmp;
    } catch (e) {
      this.imageBitmap = null;
      this.offCanvas = null;
    }
  }

  // ---------------- 绘制（对应 Android onDraw） ----------------

  /**
   * 绘制一帧。完全还原 Android onDraw 的双分支与头尾无缝衔接逻辑，
   * 差异仅在单位（此处为 vp）与贴图源（ImageBitmap）。
   */
  private drawFrame(): void {
    const ctx: CanvasRenderingContext2D = this.context;
    const bmp: ImageBitmap | null = this.imageBitmap;
    if (bmp === null) {
      return;
    }
    const vw: number = this.viewWidth;
    const vh: number = this.viewHeight;
    if (!this.ready || vw <= 0 || vh <= 0) {
      return;
    }
    ctx.clearRect(0, 0, vw, vh);
    const tw: number = this.textWidth;
    if (tw <= vw) {
      // 文本宽 <= 控件宽：头尾间隔夹紧为不小于 0。
      let space: number = this.space - (vw - tw);
      if (space < 0) {
        space = 0;
      }
      if (this.leftX < -(vw + space)) {
        this.leftX += (vw + space);
      }
      ctx.drawImage(bmp, this.leftX, 0);
      if (this.leftX < 0) {
        ctx.drawImage(bmp, vw + this.leftX + space, 0);
      }
    } else {
      // 文本宽 > 控件宽：长文本循环滚动。
      if (this.leftX < -(tw + this.space)) {
        this.leftX += (tw + this.space);
      }
      ctx.drawImage(bmp, this.leftX, 0);
      if (this.leftX + (tw - vw) < 0) {
        ctx.drawImage(bmp, tw + this.leftX + this.space, 0);
      }
    }
  }

  // ---------------- 帧驱动（对应 Android Choreographer.FrameCallback + updateFps） ----------------

  private updateFps(): void {
    try {
      const d: display.Display = display.getDefaultDisplaySync();
      const r: number = d.refreshRate;
      this.fps = r > 0 ? r : 60;
    } catch (e) {
      this.fps = 60;
    }
  }

  private advanceFrame(): void {
    if (!this.isScrolling || !this.ready) {
      return;
    }
    const f: number = this.fps > 0 ? this.fps : 60;
    // 速率归一化：每帧位移 = (60 / 刷新率) * speed vp，使每秒滚动 60*speed vp（与 60Hz 设备一致）。
    this.leftX -= (BASE_FPS / f) * this.speed;
    this.drawFrame();
  }

  // ---------------- 公开滚动控制（对应 Android startScroll/pauseScroll/stopScroll/restartScroll） ----------------

  /** 开始/恢复滚动（幂等：已在滚动时不再重复投递）。 */
  startScroll(): void {
    if (this.isScrolling) {
      return;
    }
    this.isScrolling = true;
    this.updateFps();
    const rate: number = this.fps > 0 ? this.fps : 60;
    try {
      this.displaySyncInstance.setExpectedFrameRateRange({ min: 0, max: Math.max(rate, 120), expected: rate });
    } catch (e) {
    }
    // start 需在 UI 上下文执行，否则可能无法关联 UI 实例与窗口。
    try {
      const uiCtx: UIContext = this.getUIContext();
      uiCtx.runScopedTask(() => {
        try {
          this.displaySyncInstance.start();
        } catch (e) {
        }
      });
    } catch (e) {
      // getUIContext 失败时直接尝试 start。
      try {
        this.displaySyncInstance.start();
      } catch (e2) {
      }
    }
  }

  /** 暂停滚动，画面静止于当前位置，不复位。 */
  pauseScroll(): void {
    this.isScrolling = false;
    try {
      this.displaySyncInstance.stop();
    } catch (e) {
    }
  }

  /** 停止滚动并复位到起始位置。 */
  stopScroll(): void {
    this.isScrolling = false;
    this.leftX = 0;
    try {
      this.displaySyncInstance.stop();
    } catch (e) {
    }
    this.drawFrame();
  }

  /** 复位后重新开始滚动。 */
  restartScroll(): void {
    this.stopScroll();
    this.startScroll();
  }

  // ---------------- 构建 ----------------

  build(): void {
    Canvas(this.context)
      .width('100%')
      .height(this.viewHeight)
      .onReady(() => {
        this.ready = true;
        this.remeasure();
        this.buildBitmap();
        this.drawFrame();
        if (this.autoStart) {
          this.startScroll();
        }
      })
      .onAreaChange((oldValue: Area, newValue: Area) => {
        const lw = newValue.width;
        let w: number = 0;
        if (typeof lw === 'number') {
          w = lw;
        } else if (typeof lw === 'string') {
          // Area.width 可能为 '360.000000vp' 形式字符串，解析数值部分。
          const parsed: number = parseFloat(lw);
          if (!isNaN(parsed)) {
            w = parsed;
          }
        }
        if (w > 0 && w !== this.viewWidth) {
          this.viewWidth = w;
          if (this.ready) {
            // 父布局重排引起布局变化：重新构建位图并从起点重新滚动
            // （对应 Android OnLayoutChangeListener → updateBitmap + restartScroll）。
            this.buildBitmap();
            if (this.isScrolling || this.autoStart) {
              this.restartScroll();
            } else {
              this.drawFrame();
            }
          } else {
            this.drawFrame();
          }
        }
      });
  }
}
