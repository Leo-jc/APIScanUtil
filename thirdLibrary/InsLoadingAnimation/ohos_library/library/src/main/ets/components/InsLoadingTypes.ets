/**
 * InsLoadingAnimation 类型定义。
 *
 * 对应 Android 库 `com.qintong.library.InsLoadingView.Status` 枚举与回调。
 * 状态语义：
 * - LOADING：已点击且正在加载，圆环旋转 / 伸缩动画运行。
 * - CLICKED：已点击且加载完成，圆环停止且为浅灰色。
 * - UNCLICKED：尚未点击，圆环停止且为完整渐变静态圆环。
 *
 * 注意：Android 中 `Status` 枚举顺序为 LOADING(0)、CLICKED(1)、UNCLICKED(2)，
 * 与 XML `app:status` 的 `loading`/`clicked`/`unclicked` 取值一一对应；
 * 这里保持完全一致的数值与顺序，确保跨边界配置一致。
 */

export enum InsStatus {
  /** 已点击并加载中。 */
  LOADING = 0,
  /** 已点击并加载完成。 */
  CLICKED = 1,
  /** 尚未点击。 */
  UNCLICKED = 2,
}

/**
 * 状态变化回调。对应外部监听 InsLoadingView 状态变化的场景。
 */
export type InsStatusChangeListener = (status: InsStatus) => void;

/**
 * 自定义绘制常量。数值与 Android 源码 `InsLoadingView` 中的私有常量逐一对应，
 * 不做任何近似或取整，确保自绘结果与原库一致。
 */
export class InsConstants {
  /** 拖尾分段基准角度（ARC_WIDTH）。 */
  static readonly ARC_WIDTH: number = 12;
  /** 兜底最小边长（MIN_WIDTH，单位 vp），对应 Android `onMeasure` 的兜底宽度。 */
  static readonly MIN_WIDTH: number = 300;
  /** 整个圆环相对组件尺寸的直径比例（CIRCLE_DIA）。 */
  static readonly CIRCLE_DIA: number = 0.9;
  /** 描边宽度相对组件尺寸的比例（STROKE_WIDTH）。 */
  static readonly STROKE_WIDTH: number = 0.025;
  /** 拖尾分段宽度递减步长（ARC_CHANGE_ANGLE）。 */
  static readonly ARC_CHANGE_ANGLE: number = 0.2;
  /** 拖尾初始分段宽度（drawTrack 中的 width 初值）。 */
  static readonly TAIL_INIT_WIDTH: number = 8;
  /** 已加载完成的浅灰色（对应 Android `Color.LTGRAY` = 0xFFCCCCCC）。 */
  static readonly CLICKED_COLOR: string = '#CCCCCC';
  /** 默认起始颜色（对应 Android `Color.parseColor("#FFF700C2")`）。 */
  static readonly DEFAULT_START_COLOR: string = '#FFF700C2';
  /** 默认结束颜色（对应 Android `Color.parseColor("#FFFFD900")`）。 */
  static readonly DEFAULT_END_COLOR: string = '#FFFFD900';
  /** 默认进度弧动画时长（毫秒）。 */
  static readonly DEFAULT_CIRCLE_DURATION: number = 2000;
  /** 默认整体旋转动画时长（毫秒）。 */
  static readonly DEFAULT_ROTATE_DURATION: number = 10000;
  /** 按下缩放反馈时长（毫秒）。 */
  static readonly TOUCH_DURATION: number = 200;
  /** 按下缩放目标值。 */
  static readonly TOUCH_DOWN_SCALE: number = 0.9;
  /** 抬起缩放目标值。 */
  static readonly TOUCH_UP_SCALE: number = 1.0;
  /** 头像直径比例（CIRCLE_DIA - STROKE_WIDTH）。 */
  static readonly BITMAP_DIA: number = InsConstants.CIRCLE_DIA - InsConstants.STROKE_WIDTH;
}
