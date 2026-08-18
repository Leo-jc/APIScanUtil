import { AnimatorOptions, AnimatorResult } from '@kit.ArkUI';
import { InsConstants, InsStatus } from './InsLoadingTypes';
import { InsLoadingController } from './InsLoadingController';

/**
 * InsLoadingView —— 仿 Instagram / 微博 头像点击加载动画的自绘组件。
 *
 * 对应 Android `com.qintong.library.InsLoadingView`（继承自 ImageView）的全部能力：
 * - 圆形头像底图（BitmapShader + Matrix 等比放大居中裁剪 → Canvas clip 圆形 + drawImage）
 * - 外围渐变进度弧（LinearGradient → CanvasGradient；多段 drawArc 拼接拖尾）
 * - 三态切换 LOADING / CLICKED / UNCLICKED（绘制分支 + 动画启停）
 * - 按下 0.9 缩放反馈（ValueAnimator + DecelerateInterpolator → animateTo + Curve.EaseOut）
 * - 整体匀速旋转 + 进度弧循环伸缩（ValueAnimator → AnimatorResult.onFrame）
 * - 可见性联动动画启停（onVisibilityChanged → onVisibleAreaChange）
 *
 * 公开能力（与 Android 一致，均可在构造期赋值与运行态修改）：
 * - 状态 status（InsStatus 枚举，默认 LOADING）
 * - 起始 / 结束颜色 startColor / endColor（默认 #FFF700C2 / #FFFFD900）
 * - 进度弧时长 circleDuration（默认 2000ms）
 * - 旋转时长 rotateDuration（默认 10000ms）
 * - 头像图片源 imageSrc（路径字符串，相对于 entry 模块 ets 目录）
 * - 运行态修改通过 InsLoadingController 命令式调用，签名与 Android setter 一致
 */
@Component
export struct InsLoadingView {
  // ===== 构造期初始化参数（@Prop，父 → 子单向，仅在构造时读取以初始化内部状态） =====
  @Prop status: InsStatus = InsStatus.LOADING;
  @Prop startColor: string = InsConstants.DEFAULT_START_COLOR;
  @Prop endColor: string = InsConstants.DEFAULT_END_COLOR;
  @Prop circleDuration: number = InsConstants.DEFAULT_CIRCLE_DURATION;
  @Prop rotateDuration: number = InsConstants.DEFAULT_ROTATE_DURATION;
  @Prop imageSrc: string = '';
  /** 显式边长（vp）；为 0 时填满父容器并按 aspectRatio(1) 取正方形。 */
  @Prop sideLength: number = 0;

  /** 命令式控制器，由父组件传入，组件在 aboutToAppear 时绑定实现，aboutToDisappear 时解绑。 */
  controller: InsLoadingController | null = null;

  // ===== 内部可变状态（@State，驱动副作用：动画启停、画笔重建、重绘） =====
  @State @Watch('onStatusChange') mStatus: InsStatus = InsStatus.LOADING;
  @State @Watch('onColorChange') mStartColor: string = InsConstants.DEFAULT_START_COLOR;
  @State @Watch('onColorChange') mEndColor: string = InsConstants.DEFAULT_END_COLOR;
  @State @Watch('onDurationChange') mCircleDuration: number = InsConstants.DEFAULT_CIRCLE_DURATION;
  @State @Watch('onDurationChange') mRotateDuration: number = InsConstants.DEFAULT_ROTATE_DURATION;
  /** 按下缩放反馈，通过 .scale 修饰符驱动（GPU 变换，不触发 Canvas 重绘）。 */
  @State mScale: number = 1.0;

  // ===== 内部非响应式字段 =====
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  /** 整体旋转角度（度），由旋转动画驱动。 */
  private mRotateDegree: number = 0;
  /** 进度弧当前角度（度，可正可负），由进度动画驱动。 */
  private mCircleWidth: number = 0;
  /** 进度弧方向标志，每个周期翻转一次，对应 Android `mIsFirstCircle`。 */
  private mIsFirstCircle: boolean = true;
  /** 头像位图，由 imageSrc 构造；width/height 在加载完成后可用。 */
  private mBitmap: ImageBitmap | null = null;
  /** Canvas 实际边长（vp，正方形）。 */
  private mActualSize: number = 0;
  /** 进度弧渐变（CanvasGradient），与 Android mTrackPaint 的 LinearGradient 等价。 */
  private mTrackGradient: CanvasGradient | null = null;
  /** 旋转动画。 */
  private mRotateAnimator: AnimatorResult | null = null;
  /** 进度弧动画。 */
  private mCircleAnimator: AnimatorResult | null = null;
  /** 组件是否可见（由 onVisibleAreaChange 维护）。 */
  private mIsVisible: boolean = true;
  /** 头像加载轮询定时器句柄。 */
  private mImageLoadTimer: number = -1;

  // ---------------------------------------------------------------------------
  // 生命周期
  // ---------------------------------------------------------------------------

  aboutToAppear(): void {
    // 用构造期参数初始化内部状态（@State 赋值会触发 @Watch，但此时动画尚未创建，@Watch 内有守卫）。
    this.mStatus = this.status;
    this.mStartColor = this.startColor;
    this.mEndColor = this.endColor;
    this.mCircleDuration = this.circleDuration;
    this.mRotateDuration = this.rotateDuration;
    if (this.imageSrc.length > 0) {
      this.mBitmap = new ImageBitmap(this.imageSrc);
    }
    if (this.controller !== null) {
      this.controller.bind(
        (s: InsStatus) => { this.mStatus = s; },
        (): InsStatus => { return this.mStatus; },
        (c: string) => { this.mStartColor = c; },
        (c: string) => { this.mEndColor = c; },
        (d: number) => { this.mCircleDuration = d; },
        (d: number) => { this.mRotateDuration = d; },
        (src: string) => { this.applyImageSrc(src); },
      );
    }
  }

  aboutToDisappear(): void {
    this.stopAnim();
    if (this.controller !== null) {
      this.controller.unbind();
    }
    if (this.mImageLoadTimer >= 0) {
      clearTimeout(this.mImageLoadTimer);
      this.mImageLoadTimer = -1;
    }
    if (this.mBitmap !== null) {
      this.mBitmap.close();
      this.mBitmap = null;
    }
    if (this.mRotateAnimator !== null) {
      this.mRotateAnimator = null;
    }
    if (this.mCircleAnimator !== null) {
      this.mCircleAnimator = null;
    }
  }

  // ---------------------------------------------------------------------------
  // @Watch 副作用
  // ---------------------------------------------------------------------------

  /**
   * 状态变化：重绘 + 通知外部监听器。
   *
   * 与 Android `setStatus(Status)` 行为对齐：setStatus 只修改 mStatus，不影响动画的启停。
   * Android 中动画在 onCreateAnimators 创建后即持续运行（仅 onVisibilityChanged 时启停），
   * onDraw 根据 mStatus 选择绘制分支：LOADING 画进度弧（用 mRotateDegree/mCircleWidth），
   * UNCLICKED/CLICKED 画静态圆环（不读动画值）。
   *
   * 鸿蒙侧同样让动画在可见期间持续运行，仅由 onVisibleAreaChange/onCanvasReady 控制启停；
   * 这里只触发一次 redraw 切换绘制分支，动画状态保持连续，避免切回 LOADING 时进度弧从 0 跳变。
   * onFrame 内对非 LOADING 态跳过 redraw（静态圆环不随动画值变化），避免无效绘制。
   */
  onStatusChange(): void {
    this.redraw();
    if (this.controller !== null) {
      this.controller.notifyStatusChange(this.mStatus);
    }
  }

  /** 颜色变化：作废渐变缓存并重绘。 */
  onColorChange(): void {
    this.mTrackGradient = null;
    this.redraw();
  }

  /** 时长变化：重置对应动画参数。 */
  onDurationChange(): void {
    this.resetCircleAnimator();
    this.resetRotateAnimator();
  }

  // ---------------------------------------------------------------------------
  // 构建
  // ---------------------------------------------------------------------------

  build() {
    Stack() {
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .onReady(() => { this.onCanvasReady(); })
        .onTouch((event: TouchEvent) => { this.onTouchEvent(event); })
        .onVisibleAreaChange([0.0, 1.0], (isExpanding: boolean, currentRatio: number) => {
          this.handleVisibleAreaChange(isExpanding, currentRatio);
        })
    }
    .width(this.sideLength > 0 ? this.sideLength : '100%')
    .height(this.sideLength > 0 ? this.sideLength : '100%')
    .aspectRatio(1)
    .scale({ x: this.mScale, y: this.mScale })
  }

  // ---------------------------------------------------------------------------
  // Canvas 就绪
  // ---------------------------------------------------------------------------

  private onCanvasReady(): void {
    const w: number = this.context.width;
    const h: number = this.context.height;
    let size: number = Math.min(w, h);
    if (size <= 0) {
      size = InsConstants.MIN_WIDTH;
    }
    this.mActualSize = size;
    this.mTrackGradient = this.buildGradient(size);
    this.createAnimators();
    this.redraw();
    this.startImageLoadPoll();
    // 与 Android onCreateAnimators 一致：动画在可见期间持续运行，不依赖 status。
    if (this.mIsVisible) {
      this.startAnim();
    }
  }

  // ---------------------------------------------------------------------------
  // 动画
  // ---------------------------------------------------------------------------

  /**
   * 创建旋转动画与进度弧动画（对应 Android `onCreateAnimators`）。
   * 旋转：0 → 360 线性循环（LinearInterpolator + repeatCount -1）。
   * 进度：0 → 1 线性循环，onFrame 中手动套用 1-(1-t)^2 减速曲线（DecelerateInterpolator），
   *       onRepeat 中翻转 mIsFirstCircle，对应 Android 的 onAnimationRepeat。
   */
  private createAnimators(): void {
    // 旋转动画
    const rotateOpts: AnimatorOptions = {
      duration: this.mRotateDuration,
      easing: 'linear',
      delay: 0,
      fill: 'none',
      direction: 'normal',
      iterations: -1,
      begin: 0,
      end: 360,
    };
    this.mRotateAnimator = this.getUIContext().createAnimator(rotateOpts);
    this.mRotateAnimator.onFrame = (progress: number) => {
      // 动画值持续更新，使切回 LOADING 时进度弧从当前位置继续，避免从 0 跳变。
      this.mRotateDegree = progress;
      // 非 LOADING 态下 mRotateDegree 不参与绘制（drawFullCircle 不读取），跳过 redraw 省功耗。
      if (this.mStatus === InsStatus.LOADING) {
        this.redraw();
      }
    };

    // 进度弧动画（手动减速，避免与 Android DecelerateInterpolator 的曲线误差）
    const circleOpts: AnimatorOptions = {
      duration: this.mCircleDuration,
      easing: 'linear',
      delay: 0,
      fill: 'none',
      direction: 'normal',
      iterations: -1,
      begin: 0,
      end: 1,
    };
    this.mCircleAnimator = this.getUIContext().createAnimator(circleOpts);
    this.mCircleAnimator.onFrame = (progress: number) => {
      // DecelerateInterpolator(factor=1.0): 1 - (1-t)^2
      const eased: number = 1 - (1 - progress) * (1 - progress);
      const angle: number = eased * 360;
      this.mCircleWidth = this.mIsFirstCircle ? angle : angle - 360;
      if (this.mStatus === InsStatus.LOADING) {
        this.redraw();
      }
    };
    this.mCircleAnimator.onRepeat = () => {
      this.mIsFirstCircle = !this.mIsFirstCircle;
    };
  }

  /** 重置旋转动画参数（时长变化时调用，对应 Android setRotateDuration）。 */
  private resetRotateAnimator(): void {
    if (this.mRotateAnimator === null) {
      return;
    }
    // 动画在可见期间持续运行（不依赖 status），故 wasPlaying 只看可见性与是否已测量。
    const wasPlaying: boolean = this.mIsVisible && this.mActualSize > 0;
    this.mRotateAnimator.reset({
      duration: this.mRotateDuration,
      easing: 'linear',
      delay: 0,
      fill: 'none',
      direction: 'normal',
      iterations: -1,
      begin: 0,
      end: 360,
    });
    if (wasPlaying) {
      this.mRotateAnimator.play();
    }
  }

  /** 重置进度弧动画参数（时长变化时调用，对应 Android setCircleDuration）。 */
  private resetCircleAnimator(): void {
    if (this.mCircleAnimator === null) {
      return;
    }
    const wasPlaying: boolean = this.mIsVisible && this.mActualSize > 0;
    this.mCircleAnimator.reset({
      duration: this.mCircleDuration,
      easing: 'linear',
      delay: 0,
      fill: 'none',
      direction: 'normal',
      iterations: -1,
      begin: 0,
      end: 1,
    });
    if (wasPlaying) {
      this.mCircleAnimator.play();
    }
  }

  /** 启动旋转与进度弧动画（对应 Android `startAnim`）。 */
  private startAnim(): void {
    if (this.mRotateAnimator !== null) {
      this.mRotateAnimator.play();
    }
    if (this.mCircleAnimator !== null) {
      this.mCircleAnimator.play();
    }
  }

  /** 停止旋转与进度弧动画（对应 Android `endAnim`，使用 cancel 避免终点跳变副作用）。 */
  private stopAnim(): void {
    if (this.mRotateAnimator !== null) {
      this.mRotateAnimator.cancel();
    }
    if (this.mCircleAnimator !== null) {
      this.mCircleAnimator.cancel();
    }
  }

  // ---------------------------------------------------------------------------
  // 可见性联动
  // ---------------------------------------------------------------------------

  private handleVisibleAreaChange(isExpanding: boolean, currentRatio: number): void {
    const visible: boolean = currentRatio > 0;
    if (visible === this.mIsVisible) {
      return;
    }
    this.mIsVisible = visible;
    // 与 Android onVisibilityChanged 一致：可见即启停动画，不依赖 status。
    if (visible && this.mActualSize > 0) {
      this.startAnim();
    } else if (!visible) {
      this.stopAnim();
    }
  }

  // ---------------------------------------------------------------------------
  // 触摸反馈
  // ---------------------------------------------------------------------------

  private onTouchEvent(event: TouchEvent): void {
    const touches: TouchObject[] = event.changedTouches;
    if (touches.length === 0) {
      return;
    }
    const type: TouchType = touches[0].type;
    if (type === TouchType.Down) {
      this.startDownAnim();
    } else if (type === TouchType.Up || type === TouchType.Cancel) {
      this.startUpAnim();
    }
  }

  /** 按下：缩放到 0.9，对应 Android `startDownAnim`（DecelerateInterpolator，200ms）。 */
  private startDownAnim(): void {
    this.getUIContext().animateTo(
      { duration: InsConstants.TOUCH_DURATION, curve: Curve.EaseOut, delay: 0, iterations: 1, playMode: PlayMode.Normal },
      () => { this.mScale = InsConstants.TOUCH_DOWN_SCALE; }
    );
  }

  /** 抬起 / 取消：回弹到 1.0，对应 Android `startUpAnim`。 */
  private startUpAnim(): void {
    this.getUIContext().animateTo(
      { duration: InsConstants.TOUCH_DURATION, curve: Curve.EaseOut, delay: 0, iterations: 1, playMode: PlayMode.Normal },
      () => { this.mScale = InsConstants.TOUCH_UP_SCALE; }
    );
  }

  // ---------------------------------------------------------------------------
  // 头像源切换（对应 Android `setImageDrawable` 重写：作废旧画笔、重建）
  // ---------------------------------------------------------------------------

  private applyImageSrc(src: string): void {
    if (this.mBitmap !== null) {
      this.mBitmap.close();
      this.mBitmap = null;
    }
    if (this.mImageLoadTimer >= 0) {
      clearTimeout(this.mImageLoadTimer);
      this.mImageLoadTimer = -1;
    }
    if (src.length > 0) {
      this.mBitmap = new ImageBitmap(src);
      this.startImageLoadPoll();
    }
    this.redraw();
  }

  // ---------------------------------------------------------------------------
  // 头像加载
  // ---------------------------------------------------------------------------

  /**
   * ImageBitmap 的像素数据是异步加载的，width/height 在加载完成后才可用。
   * 这里以 50ms 间隔轮询，加载完成后重绘一次（覆盖非 LOADING 静态态没有动画驱动的场景）。
   */
  private startImageLoadPoll(): void {
    if (this.mBitmap === null) {
      return;
    }
    if (this.mBitmap.width > 0 && this.mBitmap.height > 0) {
      this.redraw();
      return;
    }
    this.mImageLoadTimer = setTimeout(() => { this.startImageLoadPoll(); }, 50);
  }

  // ---------------------------------------------------------------------------
  // 画笔 / 渐变
  // ---------------------------------------------------------------------------

  /**
   * 构建进度弧渐变。对应 Android `getTrackPaint` 中的 LinearGradient：
   * 从 (0,0) 到 (size * CIRCLE_DIA * (360 - ARC_WIDTH*4) / 360, size * STROKE_WIDTH)。
   * 渐变在组件本地（未旋转）坐标系创建一次后复用，绘制时随 Canvas 旋转变换，
   * 与 Android 的着色器随 Canvas 局部坐标变换的行为一致。
   */
  private buildGradient(size: number): CanvasGradient | null {
    if (size <= 0) {
      return null;
    }
    const x1: number = size * InsConstants.CIRCLE_DIA * (360 - InsConstants.ARC_WIDTH * 4) / 360;
    const y1: number = size * InsConstants.STROKE_WIDTH;
    const grad: CanvasGradient | null = this.context.createLinearGradient(0, 0, x1, y1);
    if (grad === null) {
      return null;
    }
    grad.addColorStop(0, this.mStartColor);
    grad.addColorStop(1, this.mEndColor);
    return grad;
  }

  // ---------------------------------------------------------------------------
  // 自绘
  // ---------------------------------------------------------------------------

  /**
   * 重绘。对应 Android `onDraw`：先整体缩放，再画头像，再按状态画进度弧 / 静态圆环。
   */
  private redraw(): void {
    const ctx: CanvasRenderingContext2D = this.context;
    const size: number = this.mActualSize;
    if (size <= 0) {
      return;
    }
    const cx: number = size / 2;
    const cy: number = size / 2;

    ctx.clearRect(0, 0, size, size);
    ctx.resetTransform();

    // 整体缩放（按下反馈）。Canvas2D 的 scale 围绕坐标原点，故平移到中心 → 缩放 → 平移回。
    // 注意：mScale 同时由 .scale 修饰符在渲染层再应用一次；为避免双重缩放，这里不再在 Canvas 内
    // 套用 mScale —— 按下缩放完全交给 .scale 修饰符（GPU 变换），与 Android `canvas.scale` 视觉等价。

    // 头像
    this.drawBitmap(ctx, size, cx, cy);

    // 进度弧 / 静态圆环
    if (this.mStatus === InsStatus.LOADING) {
      this.drawTrack(ctx, size, cx, cy);
    } else if (this.mStatus === InsStatus.UNCLICKED) {
      if (this.mTrackGradient === null) {
        this.mTrackGradient = this.buildGradient(size);
      }
      this.drawFullCircle(ctx, size, cx, cy, this.mTrackGradient, this.mStartColor);
    } else if (this.mStatus === InsStatus.CLICKED) {
      this.drawFullCircle(ctx, size, cx, cy, null, InsConstants.CLICKED_COLOR);
    }
  }

  /**
   * 画圆形头像。对应 Android `drawBitmap` + `getBitmapPaint`：
   * 用 BitmapShader + Matrix 将图片等比放大到短边等于组件边长并居中，再以圆形（mBitmapRectF）裁剪。
   * 这里用 Canvas clip 圆形 + drawImage 5 参重载实现等价效果：
   *   scale = size / min(bw, bh)
   *   scaledW = bw * scale, scaledH = bh * scale
   *   drawImage(bitmap, offsetX, offsetY, scaledW, scaledH)  // 等比，无失真
   *   clip 圆形（半径 bitmapDia * size / 2 = 0.4375 * size，居中）
   */
  private drawBitmap(ctx: CanvasRenderingContext2D, size: number, cx: number, cy: number): void {
    if (this.mBitmap === null || this.mBitmap.width <= 0 || this.mBitmap.height <= 0) {
      return;
    }
    const bw: number = this.mBitmap.width;
    const bh: number = this.mBitmap.height;
    const minDim: number = Math.min(bw, bh);
    if (minDim <= 0) {
      return;
    }
    const scale: number = size / minDim;
    const scaledW: number = bw * scale;
    const scaledH: number = bh * scale;
    // 居中：宽图横向偏移为负（向左溢出），高图纵向偏移为负（向上溢出）。
    const offsetX: number = (size - scaledW) / 2;
    const offsetY: number = (size - scaledH) / 2;
    const bitmapRadius: number = InsConstants.BITMAP_DIA * size / 2;

    ctx.save();
    ctx.beginPath();
    ctx.arc(cx, cy, bitmapRadius, 0, Math.PI * 2);
    ctx.clip();
    ctx.drawImage(this.mBitmap, offsetX, offsetY, scaledW, scaledH);
    ctx.restore();
  }

  /**
   * 画外围渐变进度弧（LOADING 态）。对应 Android `drawTrack`：
   *   canvas.rotate(mRotateDegree, cx, cy)
   *   canvas.rotate(ARC_WIDTH, cx, cy)
   *   按方向分段 drawArc 拼出“头部粗、尾部渐细”的拖尾。
   * 这里把两次 rotate 合并为一次：translate(cx,cy) → rotate((mRotateDegree+ARC_WIDTH)rad) → translate(-cx,-cy)。
   */
  private drawTrack(ctx: CanvasRenderingContext2D, size: number, cx: number, cy: number): void {
    const trackRadius: number = InsConstants.CIRCLE_DIA * size / 2;
    const strokeWidth: number = InsConstants.STROKE_WIDTH * size;
    if (this.mTrackGradient === null) {
      this.mTrackGradient = this.buildGradient(size);
    }

    ctx.save();
    // 旋转（mRotateDegree + ARC_WIDTH 度，围绕中心）
    ctx.translate(cx, cy);
    ctx.rotate((this.mRotateDegree + InsConstants.ARC_WIDTH) * Math.PI / 180);
    ctx.translate(-cx, -cy);

    ctx.lineWidth = strokeWidth;
    if (this.mTrackGradient !== null) {
      ctx.strokeStyle = this.mTrackGradient;
    } else {
      ctx.strokeStyle = this.mStartColor;
    }
    ctx.lineCap = 'butt'; // 与 Android Paint 默认 Cap.BUTT 一致

    // 收集所有分段到一条路径一次性 stroke（与 Android 多次 drawArc 共用同一 Paint 视觉等价，性能更好）
    ctx.beginPath();
    this.appendTrackArcs(ctx, cx, cy, trackRadius);
    ctx.stroke();
    ctx.restore();
  }

  /**
   * 按当前 mCircleWidth 把各分段弧追加到当前路径。完全对应 Android `drawTrack` 的两个分支：
   *   - mCircleWidth < 0：收缩相位（先画从 startArg 到 360 的主弧，再逐段递减宽度的拖尾）
   *   - mCircleWidth >= 0：扩张相位（先画头部 5 段递减 + 中间整段，再画尾部递减宽度的拖尾）
   */
  private appendTrackArcs(ctx: CanvasRenderingContext2D, cx: number, cy: number, radius: number): void {
    const ARC_WIDTH: number = InsConstants.ARC_WIDTH;
    const ARC_CHANGE_ANGLE: number = InsConstants.ARC_CHANGE_ANGLE;
    const TAIL_INIT_WIDTH: number = InsConstants.TAIL_INIT_WIDTH;
    const cw: number = this.mCircleWidth;

    if (cw < 0) {
      // a 收缩相位
      const startArg: number = cw + 360; // [0, 360)
      this.arcSegment(ctx, cx, cy, radius, startArg, 360 - startArg);
      let adjustCircleWidth: number = cw + 360;
      let width: number = TAIL_INIT_WIDTH;
      while (adjustCircleWidth > ARC_WIDTH) {
        width = width - ARC_CHANGE_ANGLE;
        adjustCircleWidth = adjustCircleWidth - ARC_WIDTH;
        this.arcSegment(ctx, cx, cy, radius, adjustCircleWidth, width);
      }
    } else {
      // b 扩张相位
      for (let i: number = 0; i <= 4; i++) {
        if (ARC_WIDTH * i > cw) {
          break;
        }
        this.arcSegment(ctx, cx, cy, radius, cw - ARC_WIDTH * i, TAIL_INIT_WIDTH + i);
      }
      if (cw > ARC_WIDTH * 4) {
        this.arcSegment(ctx, cx, cy, radius, 0, cw - ARC_WIDTH * 4);
      }
      let adjustCircleWidth: number = 360;
      let width: number = TAIL_INIT_WIDTH * (360 - cw) / 360;
      while (width > 0 && adjustCircleWidth > ARC_WIDTH) {
        width = width - ARC_CHANGE_ANGLE;
        adjustCircleWidth = adjustCircleWidth - ARC_WIDTH;
        this.arcSegment(ctx, cx, cy, radius, adjustCircleWidth, width);
      }
    }
  }

  /**
   * 追加一段弧。对应 Android `canvas.drawArc(rectF, startAngle, sweepAngle, false, paint)`。
   * Canvas2D 的 arc 用弧度，0 在 3 点钟方向，顺时针为正（与 Android drawArc 一致）；
   * sweepAngle 为负时逆时针绘制，覆盖 Android 负 sweep 的语义。
   *
   * 注意：Canvas2D 规范要求当路径中已存在子路径时，arc() 会先追加一条从前一点到弧起点的直线段。
   * Android 的 drawArc 是独立 stroke，各分段互不相连；为避免在分段之间出现穿过圆心的弦线，
   * 这里在每次 arc() 前显式 moveTo 到弧起点（即圆上对应角度的点），使各分段成为独立子路径，
   * stroke 时按当前 lineCap('butt') 各自独立描边，视觉效果与 Android 一致。
   */
  private arcSegment(ctx: CanvasRenderingContext2D, cx: number, cy: number, radius: number,
                     startAngleDeg: number, sweepAngleDeg: number): void {
    if (sweepAngleDeg === 0) {
      return;
    }
    const startRad: number = startAngleDeg * Math.PI / 180;
    const endRad: number = (startAngleDeg + sweepAngleDeg) * Math.PI / 180;
    const ccw: boolean = sweepAngleDeg < 0;
    const startX: number = cx + radius * Math.cos(startRad);
    const startY: number = cy + radius * Math.sin(startRad);
    ctx.moveTo(startX, startY);
    ctx.arc(cx, cy, radius, startRad, endRad, ccw);
  }

  /**
   * 画完整渐变静态圆环（UNCLICKED 态）。对应 Android `drawCircle(canvas, mTrackPaint)`。
   * 不旋转，直接画一整圈 stroke。gradient 为空时使用 fallbackColor。
   */
  private drawFullCircle(ctx: CanvasRenderingContext2D, size: number, cx: number, cy: number,
                         gradient: CanvasGradient | null, fallbackColor: string): void {
    const trackRadius: number = InsConstants.CIRCLE_DIA * size / 2;
    const strokeWidth: number = InsConstants.STROKE_WIDTH * size;
    ctx.save();
    ctx.lineWidth = strokeWidth;
    if (gradient !== null) {
      ctx.strokeStyle = gradient;
    } else {
      ctx.strokeStyle = fallbackColor;
    }
    ctx.lineCap = 'butt';
    ctx.beginPath();
    ctx.arc(cx, cy, trackRadius, 0, Math.PI * 2);
    ctx.stroke();
    ctx.restore();
  }
}
