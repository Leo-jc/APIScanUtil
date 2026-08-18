/**
 * CheckerboardDrawable — 棋盘格背景绘制器。
 *
 * 等价于 Android 库 top.defaults.checkerboarddrawable.CheckerboardDrawable。
 * 通过 Builder 配置格子尺寸（size，单位 vp）和奇/偶格颜色（hex 字符串），
 * 在 CanvasRenderingContext2D 上以 fillRect 循环绘制棋盘格平铺图案。
 *
 * 棋盘格规则（与 Android 源码一致）：
 *   原实现构造 2*size × 2*size 位图，四个格子排列为：
 *     colorOdd  | colorEven
 *     colorEven | colorOdd
 *   然后用 BitmapShader(REPEAT, REPEAT) 平铺填充整个区域。
 *   等价地，网格位置 (r, c) 处：r+c 为偶数时取 colorOdd，为奇数时取 colorEven。
 */

/** 默认格子边长（vp），与 Android Builder 默认值 40 对应。 */
const DEFAULT_SIZE: number = 40;
/** 默认奇数格颜色，与 Android 0xFFC2C2C2 对应。 */
const DEFAULT_COLOR_ODD: string = '#FFC2C2C2';
/** 默认偶数格颜色，与 Android 0xFFF3F3F3 对应。 */
const DEFAULT_COLOR_EVEN: string = '#FFF3F3F3';
/** 不透明度常量，与 Android PixelFormat.OPAQUE（值为 -1）对应。 */
const PIXEL_FORMAT_OPAQUE: number = -1;

/**
 * 将 0-255 范围的单字节值转为两位十六进制字符串。
 */
function toHex2(n: number): string {
  let s: string = n.toString(16).toUpperCase();
  if (s.length < 2) {
    s = '0' + s;
  }
  return s;
}

/**
 * 将 Android 风格的 ARGB int 颜色（如 0xFFC2C2C2）转为 hex 字符串（如 '#FFC2C2C2'）。
 * 便于从 Android 代码迁移颜色常量。
 */
export function argbToHex(argb: number): string {
  let a: number = Math.floor(argb / 16777216) % 256;
  let r: number = Math.floor(argb / 65536) % 256;
  let g: number = Math.floor(argb / 256) % 256;
  let b: number = argb % 256;
  return '#' + toHex2(a) + toHex2(r) + toHex2(g) + toHex2(b);
}

/**
 * 颜色滤镜接口。
 *
 * 对应 Android 的 android.graphics.ColorFilter 抽象类。
 * ArkUI CanvasRenderingContext2D 通过 filter 属性（CSS 滤镜字符串）实现滤镜效果，
 * 因此 ColorFilter 以 toFilterString() 输出 CSS filter 字符串供 draw() 使用。
 *
 * 支持的滤镜函数包括：blur、brightness、contrast、grayscale、hue-rotate、
 * invert、opacity、saturate、sepia，可组合使用。
 */
export interface ColorFilter {
  /** 返回 CSS filter 字符串，用于 CanvasRenderingContext2D.filter 属性。 */
  toFilterString(): string;
}

/**
 * 简单颜色滤镜，通过 CSS filter 字符串实现。
 *
 * 用法：
 *   new SimpleColorFilter('grayscale(0.5)')
 *   new SimpleColorFilter('brightness(0.8) contrast(1.2)')
 *
 * 对应 Android ColorFilter 的常见子类：
 * - grayscale/sepia/invert 对应 ColorMatrixColorFilter 的颜色矩阵变换
 * - brightness/contrast/saturate 对应 LightingColorFilter 的颜色乘加
 * - 组合滤镜对应 PorterDuffColorFilter 的混合模式
 */
export class SimpleColorFilter implements ColorFilter {
  private filterStr: string;

  constructor(filterString: string) {
    this.filterStr = filterString;
  }

  toFilterString(): string {
    return this.filterStr;
  }
}

/**
 * 棋盘格 Drawable 构建器。
 *
 * 链式调用 size() / colorOdd() / colorEven() 后调用 build() 创建 CheckerboardDrawable。
 * 与 Android CheckerboardDrawable.Builder 对应，默认值：size=40, colorOdd='#FFC2C2C2', colorEven='#FFF3F3F3'。
 */
export class CheckerboardDrawableBuilder {
  private sizeVal: number = DEFAULT_SIZE;
  private colorOddVal: string = DEFAULT_COLOR_ODD;
  private colorEvenVal: string = DEFAULT_COLOR_EVEN;

  /** 设置单个棋盘格的边长（vp）。 */
  size(size: number): CheckerboardDrawableBuilder {
    this.sizeVal = size;
    return this;
  }

  /** 设置奇数格颜色（hex 字符串，如 '#FFC2C2C2'）。 */
  colorOdd(color: string): CheckerboardDrawableBuilder {
    this.colorOddVal = color;
    return this;
  }

  /** 设置偶数格颜色（hex 字符串，如 '#FFF3F3F3'）。 */
  colorEven(color: string): CheckerboardDrawableBuilder {
    this.colorEvenVal = color;
    return this;
  }

  /** 获取格子边长。 */
  getSize(): number {
    return this.sizeVal;
  }

  /** 获取奇数格颜色。 */
  getColorOdd(): string {
    return this.colorOddVal;
  }

  /** 获取偶数格颜色。 */
  getColorEven(): string {
    return this.colorEvenVal;
  }

  /** 以当前配置构造 CheckerboardDrawable。 */
  build(): CheckerboardDrawable {
    return new CheckerboardDrawable(this);
  }
}

/**
 * 棋盘格 Drawable。
 *
 * 通过 draw() 方法在指定 CanvasRenderingContext2D 上绘制可平铺的棋盘格图案。
 * 支持运行时设置整体透明度（setAlpha，0-255）。
 *
 * 构造方式（与 Android 一致，接收 Builder）：
 *   new CheckerboardDrawable(builder)
 * 或使用静态工厂：
 *   CheckerboardDrawable.create()
 *   CheckerboardDrawable.Builder().size(20).colorOdd('#CCCCCC').build()
 */
export class CheckerboardDrawable {
  private sizeVal: number;
  private colorOddVal: string;
  private colorEvenVal: string;
  private alphaVal: number;
  private colorFilterVal: ColorFilter | null = null;

  /**
   * 构造 CheckerboardDrawable，接收 Builder 实例读取配置。
   * 与 Android 私有构造 CheckerboardDrawable(Builder builder) 对应。
   *
   * 与 Android 行为对等：Android 在构造期调用 Bitmap.createBitmap(size*2, size*2, ...)，
   * 当 size <= 0 时底层抛 IllegalArgumentException 导致构造失败。
   * 鸿蒙侧对等处理：参数非法时抛出 Error，不得静默生成空纹理。
   */
  constructor(builder: CheckerboardDrawableBuilder) {
    this.sizeVal = builder.getSize();
    this.colorOddVal = builder.getColorOdd();
    this.colorEvenVal = builder.getColorEven();
    this.alphaVal = 255;
    if (this.sizeVal <= 0) {
      throw new Error('CheckerboardDrawable: size must be > 0, got ' + this.sizeVal);
    }
  }

  /**
   * 静态工厂方法，使用默认参数（size=40, colorOdd='#FFC2C2C2', colorEven='#FFF3F3F3'）
   * 创建并返回一个 CheckerboardDrawable 实例。
   */
  static create(): CheckerboardDrawable {
    return new CheckerboardDrawableBuilder().build();
  }

  /**
   * 创建 Builder 实例，用于链式配置后构造 CheckerboardDrawable。
   * 对应 Android 的 new CheckerboardDrawable.Builder()。
   */
  static Builder(): CheckerboardDrawableBuilder {
    return new CheckerboardDrawableBuilder();
  }

  /** 获取格子边长（vp）。 */
  getSize(): number {
    return this.sizeVal;
  }

  /** 获取奇数格颜色（hex 字符串）。 */
  getColorOdd(): string {
    return this.colorOddVal;
  }

  /** 获取偶数格颜色（hex 字符串）。 */
  getColorEven(): string {
    return this.colorEvenVal;
  }

  /** 获取当前透明度（0-255，255 为完全不透明）。 */
  getAlpha(): number {
    return this.alphaVal;
  }

  /**
   * 返回像素格式透明度信息，固定返回 -1（OPAQUE），与 Android PixelFormat.OPAQUE 对应。
   */
  getOpacity(): number {
    return PIXEL_FORMAT_OPAQUE;
  }

  /**
   * 运行时设置整体透明度（0=完全透明，255=完全不透明），
   * 影响后续 draw() 的绘制效果。与 Android Drawable.setAlpha 对应。
   *
   * 与 Android 行为对等：Android Paint.setAlpha 会将越界值 clamp 到 [0,255]
   * （负数→0，>255→255）。鸿蒙侧对等做 clamp，保证超界值不致错乱。
   */
  setAlpha(alpha: number): void {
    let clamped: number = alpha;
    if (clamped < 0) {
      clamped = 0;
    } else if (clamped > 255) {
      clamped = 255;
    }
    this.alphaVal = clamped;
  }

  /**
   * 运行时设置颜色滤镜，影响后续 draw() 的绘制效果。
   * 传入 null 清除当前滤镜。与 Android Drawable.setColorFilter 对应。
   *
   * ArkUI 通过 CanvasRenderingContext2D.filter 属性（CSS 滤镜字符串）实现，
   * 支持 grayscale、brightness、contrast、sepia、invert、blur、saturate 等。
   */
  setColorFilter(colorFilter: ColorFilter | null): void {
    this.colorFilterVal = colorFilter;
  }

  /** 获取当前颜色滤镜，未设置时返回 null。 */
  getColorFilter(): ColorFilter | null {
    return this.colorFilterVal;
  }

  /**
   * 在指定 CanvasRenderingContext2D 上绘制棋盘格图案。
   *
   * 实现等价于 Android 的 draw(Canvas)：Android 使用 BitmapShader(REPEAT, REPEAT) 平铺
   * 2×2 格子位图；此处以 fillRect 循环逐格绘制，视觉结果一致。
   *
   * @param context 画布渲染上下文
   * @param width 绘制区域宽度（vp），通常取 context.width
   * @param height 绘制区域高度（vp），通常取 context.height
   */
  draw(context: CanvasRenderingContext2D, width: number, height: number): void {
    if (this.sizeVal <= 0 || width <= 0 || height <= 0) {
      return;
    }

    // 清除画布，确保重绘时旧内容不残留（Android 由 View 框架负责清空）
    context.clearRect(0, 0, width, height);

    // 应用颜色滤镜（Android 的 ColorFilter 通过 Paint 作用于绘制内容；
    // ArkUI 通过 CanvasRenderingContext2D.filter 属性实现等效效果）
    if (this.colorFilterVal !== null) {
      context.filter = this.colorFilterVal.toFilterString();
    } else {
      context.filter = 'none';
    }

    // 设置整体透明度（Android 的 alpha 范围 0-255，Canvas globalAlpha 范围 0.0-1.0）
    let alphaNormalized: number = this.alphaVal / 255.0;
    context.globalAlpha = alphaNormalized;

    let cellSize: number = this.sizeVal;
    let cols: number = Math.ceil(width / cellSize);
    let rows: number = Math.ceil(height / cellSize);

    for (let r: number = 0; r < rows; r++) {
      for (let c: number = 0; c < cols; c++) {
        // 棋盘格规则：(r + c) 为偶数 → colorOdd，为奇数 → colorEven
        if ((r + c) % 2 === 0) {
          context.fillStyle = this.colorOddVal;
        } else {
          context.fillStyle = this.colorEvenVal;
        }
        context.fillRect(c * cellSize, r * cellSize, cellSize, cellSize);
      }
    }

    // 恢复默认透明度和滤镜
    context.globalAlpha = 1.0;
    context.filter = 'none';
  }
}
