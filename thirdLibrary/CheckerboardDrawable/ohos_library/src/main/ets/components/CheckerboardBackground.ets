import { CheckerboardDrawable, CheckerboardDrawableBuilder, SimpleColorFilter } from '../CheckerboardDrawable';

/**
 * CheckerboardBackground — 棋盘格背景组件。
 *
 * 接收格子尺寸、奇/偶格颜色、透明度和颜色滤镜等配置参数，通过 Canvas 自绘
 * 渲染棋盘格平铺图案。可作为任意容器的背景使用。
 *
 * 用法示例：
 *   CheckerboardBackground({
 *     cellSize: 20,
 *     colorOdd: '#FFCCCCCC',
 *     colorEven: '#FF444444',
 *     alpha: 255,
 *     filterString: 'grayscale(0.5)'
 *   })
 *
 * 通过 @Prop + @Watch 实现响应式更新：任一配置参数变化时自动触发重绘。
 * Canvas 的 onReady 和 onAreaChange 回调保证初始化和尺寸变化时正确绘制。
 */
@Component
export struct CheckerboardBackground {
  /** 单个棋盘格边长（vp），默认 40，与 Android Builder 默认值一致。 */
  @Prop @Watch('onConfigChanged') cellSize: number = 40;
  /** 奇数格颜色（ARGB hex 字符串），默认 '#FFC2C2C2'。 */
  @Prop @Watch('onConfigChanged') colorOdd: string = '#FFC2C2C2';
  /** 偶数格颜色（ARGB hex 字符串），默认 '#FFF3F3F3'。 */
  @Prop @Watch('onConfigChanged') colorEven: string = '#FFF3F3F3';
  /** 整体透明度（0-255），默认 255（完全不透明）。 */
  @Prop @Watch('onConfigChanged') alpha: number = 255;
  /** CSS 滤镜字符串（如 'grayscale(0.5)'），默认 'none' 表示无滤镜。 */
  @Prop @Watch('onConfigChanged') filterString: string = 'none';

  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  /** @Watch 回调：配置变更时触发重绘。 */
  onConfigChanged(): void {
    this.redraw();
  }

  build() {
    Canvas(this.context)
      .width('100%')
      .height('100%')
      .onReady(() => {
        this.redraw();
      })
      .onAreaChange(() => {
        this.redraw();
      })
  }

  /**
   * 在当前 Canvas 上重绘棋盘格图案。
   * 根据当前 @Prop 配置构建 CheckerboardDrawable 并绘制。
   * cellSize <= 0 时不绘制（保持空白），避免构造期抛错导致组件崩溃。
   */
  redraw(): void {
    let w: number = this.context.width;
    let h: number = this.context.height;
    if (w > 0 && h > 0 && this.cellSize > 0) {
      let drawable: CheckerboardDrawable = new CheckerboardDrawableBuilder()
        .size(this.cellSize)
        .colorOdd(this.colorOdd)
        .colorEven(this.colorEven)
        .build();
      drawable.setAlpha(this.alpha);
      if (this.filterString !== 'none' && this.filterString.length > 0) {
        drawable.setColorFilter(new SimpleColorFilter(this.filterString));
      }
      drawable.draw(this.context, w, h);
    }
  }
}
