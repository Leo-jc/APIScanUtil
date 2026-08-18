import { InsStatus, InsStatusChangeListener } from './InsLoadingTypes';

/**
 * InsLoadingView 命令式控制器。
 *
 * 对应 Android `com.qintong.library.InsLoadingView` 的以下公开方法：
 * - `setStatus(Status)`
 * - `getStatus(): Status`
 * - `setStartColor(int)`
 * - `setEndColor(int)`
 * - `setCircleDuration(int)`（链式返回 this，鸿蒙版本同样返回控制器自身以便链式调用）
 * - `setRotateDuration(int)`（链式返回 this）
 *
 * 设计说明：ArkUI 声明式组件本身通过参数暴露可配置项，但 Android Demo 通过
 * `mInsLoadingView.setXxx(...)` 在运行时动态修改属性，因此提供控制器，使运行时
 * 修改能力与 Android 等价，且不丢失任何可配置项。
 *
 * 绑定流程：`InsLoadingView` 组件在 `aboutToAppear` 时调用 `controller.bind(...)` 注册实现；
 * 在 `aboutToDisappear` 时调用 `controller.unbind()` 解绑，避免内存泄漏。
 */
export class InsLoadingController {
  private setStatusImpl: ((s: InsStatus) => void) | null = null;
  private getStatusImpl: (() => InsStatus) | null = null;
  private setStartColorImpl: ((c: string) => void) | null = null;
  private setEndColorImpl: ((c: string) => void) | null = null;
  private setCircleDurationImpl: ((d: number) => void) | null = null;
  private setRotateDurationImpl: ((d: number) => void) | null = null;
  private setImageSrcImpl: ((src: string) => void) | null = null;
  private statusChangeListeners: InsStatusChangeListener[] = [];

  /**
   * 由 InsLoadingView 组件注册实现回调。
   */
  bind(setStatusImpl: (s: InsStatus) => void,
       getStatusImpl: () => InsStatus,
       setStartColorImpl: (c: string) => void,
       setEndColorImpl: (c: string) => void,
       setCircleDurationImpl: (d: number) => void,
       setRotateDurationImpl: (d: number) => void,
       setImageSrcImpl: (src: string) => void): void {
    this.setStatusImpl = setStatusImpl;
    this.getStatusImpl = getStatusImpl;
    this.setStartColorImpl = setStartColorImpl;
    this.setEndColorImpl = setEndColorImpl;
    this.setCircleDurationImpl = setCircleDurationImpl;
    this.setRotateDurationImpl = setRotateDurationImpl;
    this.setImageSrcImpl = setImageSrcImpl;
  }

  /**
   * 由 InsLoadingView 组件解绑，避免控制器持有已销毁组件的引用。
   */
  unbind(): void {
    this.setStatusImpl = null;
    this.getStatusImpl = null;
    this.setStartColorImpl = null;
    this.setEndColorImpl = null;
    this.setCircleDurationImpl = null;
    this.setRotateDurationImpl = null;
    this.setImageSrcImpl = null;
    this.statusChangeListeners = [];
  }

  /**
   * 注册状态变化监听器，对应 Android 在外部监听 InsLoadingView 状态的场景。
   */
  onStatusChange(listener: InsStatusChangeListener): void {
    this.statusChangeListeners.push(listener);
  }

  /**
   * 触发状态变化监听器，由组件在状态实际变化后调用。
   */
  notifyStatusChange(status: InsStatus): void {
    for (let listener of this.statusChangeListeners) {
      listener(status);
    }
  }

  /**
   * 设置状态。对应 Android `mInsLoadingView.setStatus(InsLoadingView.Status.XXX)`。
   */
  setStatus(status: InsStatus): InsLoadingController {
    if (this.setStatusImpl) {
      this.setStatusImpl(status);
    }
    return this;
  }

  /**
   * 获取当前状态。对应 Android `mInsLoadingView.getStatus()`。
   */
  getStatus(): InsStatus {
    if (this.getStatusImpl) {
      return this.getStatusImpl();
    }
    return InsStatus.LOADING;
  }

  /**
   * 设置起始颜色。对应 Android `mInsLoadingView.setStartColor(Color.YELLOW)`。
   * @param color ARGB 十六进制字符串，如 '#FFF700C2'。
   */
  setStartColor(color: string): InsLoadingController {
    if (this.setStartColorImpl) {
      this.setStartColorImpl(color);
    }
    return this;
  }

  /**
   * 设置结束颜色。对应 Android `mInsLoadingView.setEndColor(Color.BLUE)`。
   * @param color ARGB 十六进制字符串，如 '#FFFFD900'。
   */
  setEndColor(color: string): InsLoadingController {
    if (this.setEndColorImpl) {
      this.setEndColorImpl(color);
    }
    return this;
  }

  /**
   * 设置进度弧动画时长（毫秒）。对应 Android `mInsLoadingView.setCircleDuration(2000)`。
   */
  setCircleDuration(duration: number): InsLoadingController {
    if (this.setCircleDurationImpl) {
      this.setCircleDurationImpl(duration);
    }
    return this;
  }

  /**
   * 设置整体旋转动画时长（毫秒）。对应 Android `mInsLoadingView.setRotateDuration(10000)`。
   */
  setRotateDuration(duration: number): InsLoadingController {
    if (this.setRotateDurationImpl) {
      this.setRotateDurationImpl(duration);
    }
    return this;
  }

  /**
   * 运行时切换头像图片源。对应 Android `ImageView.setImageDrawable` ——
   * Android 中 `InsLoadingView` 重写了 `setImageDrawable`，将 `mBitmapPaint` 置空以触发画笔重建。
   * 此方法关闭旧 ImageBitmap 并按新路径构造，随后重绘。
   * @param src 图片路径字符串，相对于 entry 模块 ets 目录（如 "common/images/pink.jpg"）。
   */
  setImageSrc(src: string): InsLoadingController {
    if (this.setImageSrcImpl) {
      this.setImageSrcImpl(src);
    }
    return this;
  }
}
