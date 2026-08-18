/**
 * MarqueeTextView 的命令式滚动控制器。
 *
 * 由于 ArkUI 自定义组件无法像 Android View 那样直接持有引用并调用方法，
 * 这里采用“父组件持有控制器 → 子组件在 aboutToAppear 时将自己绑定的方法注册到控制器”
 * 的方式，对外保留与 Android 等价的 startScroll / pauseScroll / stopScroll / restartScroll 能力。
 *
 * 行为对应：
 * - startScroll()：开始/恢复滚动（从当前位移继续）
 * - pauseScroll()：暂停滚动，当前画面静止，不复位
 * - stopScroll()：停止并复位到起始位置
 * - restartScroll()：复位后重新开始滚动
 */
export class MarqueeTextViewController {
  private startFn: (() => void) | null = null;
  private pauseFn: (() => void) | null = null;
  private stopFn: (() => void) | null = null;
  private restartFn: (() => void) | null = null;
  private leftXFn: (() => number) | null = null;

  /**
   * 由 MarqueeTextView 组件在 aboutToDisappear 时触发，供宿主观察
   * 帧驱动已停止、离屏位图资源已释放（对应 Android onDetachedFromWindow）。
   */
  public onReleased: (() => void) | null = null;

  /**
   * 由 MarqueeTextView 组件在 aboutToAppear 时调用，绑定真实实现。
   */
  bind(start: () => void, pause: () => void, stop: () => void, restart: () => void,
    getLeftX: () => number): void {
    this.startFn = start;
    this.pauseFn = pause;
    this.stopFn = stop;
    this.restartFn = restart;
    this.leftXFn = getLeftX;
  }

  /**
   * 由 MarqueeTextView 组件在 aboutToDisappear 时调用，解除绑定，
   * 防止组件销毁后控制器再触发已失效的回调。
   */
  unbind(): void {
    this.startFn = null;
    this.pauseFn = null;
    this.stopFn = null;
    this.restartFn = null;
    this.leftXFn = null;
  }

  /** 开始/恢复横向滚动。 */
  startScroll(): void {
    if (this.startFn !== null) {
      this.startFn();
    }
  }

  /** 暂停滚动，画面静止于当前位置，不复位。 */
  pauseScroll(): void {
    if (this.pauseFn !== null) {
      this.pauseFn();
    }
  }

  /** 停止滚动并复位到起始位置。 */
  stopScroll(): void {
    if (this.stopFn !== null) {
      this.stopFn();
    }
  }

  /** 复位后重新开始滚动。 */
  restartScroll(): void {
    if (this.restartFn !== null) {
      this.restartFn();
    }
  }

  /**
   * 获取当前位移（vp），对应 Android mLeftX，供宿主观察/记录当前位置与位移距离。
   * 组件未就绪或已销毁时返回 0。
   */
  getLeftX(): number {
    if (this.leftXFn !== null) {
      return this.leftXFn();
    }
    return 0;
  }

  /**
   * 由 MarqueeTextView 组件在 aboutToDisappear 末尾调用，通知宿主资源已释放。
   */
  notifyReleased(): void {
    if (this.onReleased !== null) {
      this.onReleased();
    }
  }
}
