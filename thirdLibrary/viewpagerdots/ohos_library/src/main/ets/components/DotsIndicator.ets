/**
 * Designed and developed by Aidan Follestad (@afollestad)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * DotsIndicator 组件 —— Swiper 指示圆点条。
 *
 * 对应 Android `com.afollestad.viewpagerdots.DotsIndicator`（继承 LinearLayout）。
 * 渲染一组圆点，选中页对应的圆点放大并提高不透明度，未选中圆点缩小并降低不透明度，
 * 切换页面时通过属性动画过渡。所有 Android XML 自定义属性在 ArkUI 中通过
 * @Prop 等价暴露；运行时 API（setDotTint / setDotTintRes / setDotDrawable）
 * 通过 DotsIndicatorController 等价提供。
 */

/** 指示条方向，对应 Android dots_orientation 枚举。 */
export enum DotsOrientation {
  HORIZONTAL = 0,
  VERTICAL = 1
}

/** 指示条整体对齐方式，对应 Android dots_gravity 的常用取值。 */
export enum DotsGravity {
  TOP = 0,
  BOTTOM = 1,
  LEFT = 2,
  RIGHT = 3,
  CENTER = 4,
  CENTER_VERTICAL = 5,
  CENTER_HORIZONTAL = 6,
  START = 7,
  END = 8,
  FILL = 9,
  FILL_HORIZONTAL = 10,
  FILL_VERTICAL = 11
}

/** 默认圆点尺寸（vp），对应 Android DEFAULT_INDICATOR_WIDTH = 5dp。 */
const DEFAULT_DOT_SIZE_VP: number = 5;

/** 默认圆点间距（vp），与 Android 一致使用同一默认值 5dp。 */
const DEFAULT_DOT_MARGIN_VP: number = 5;

/** 选中圆点缩放比例，对应 Android scale_with_alpha.xml 中 scaleX/Y 1.0 → 1.8 的目标值。 */
const SELECTED_SCALE: number = 1.8;

/** 未选中圆点缩放比例。 */
const UNSELECTED_SCALE: number = 1.0;

/** 选中圆点不透明度，对应 alpha 0.5 → 1.0 的目标值。 */
const SELECTED_OPACITY: number = 1.0;

/** 未选中圆点不透明度，对应反向动画 1.0 → 0.5 的目标值。 */
const UNSELECTED_OPACITY: number = 0.5;

/** 动画时长（毫秒），对应 Android @android:integer/config_shortAnimTime = 200ms。 */
const ANIM_DURATION_MS: number = 200;

/** 默认圆点颜色，对应 Android black_dot drawable 的 solid #000000。 */
const DEFAULT_DOT_COLOR: string = '#000000';

/**
 * 运行时可变状态控制器，等价于 Android DotsIndicator 的三个公开方法：
 *  - setDotTint(@ColorInt tint)
 *  - setDotTintRes(@ColorRes tintRes)
 *  - setDotDrawable(indicatorRes, unselectedIndicatorRes)
 *
 * 父组件以 @State 持有实例并传入 DotsIndicator（组件内以 @ObjectLink 引用）。
 * 调用任意方法修改字段后，@Observed 通知触发 DotsIndicator 及内部圆点重渲染，
 * 等价于 Android invalidateDots() 的刷新效果。
 */
@Observed
export class DotsIndicatorController {
  /** 圆点着色，对应 Android dotTint 字段；hasDotTint=false 时不生效。 */
  dotTint: ResourceColor = DEFAULT_DOT_COLOR;
  hasDotTint: boolean = false;

  /** 选中态圆点图片资源，对应 Android indicatorBackgroundResId；hasDotDrawable=false 时走内置 Circle 渲染。 */
  dotDrawable: Resource = $r('app.media.black_dot');
  /** 未选中态圆点图片资源，对应 Android indicatorUnselectedBackgroundResId，默认与选中态一致。 */
  dotDrawableUnselected: Resource = $r('app.media.black_dot');
  /** 是否启用图片资源渲染模式（用户调用 setDotDrawable 后置 true）。 */
  hasDotDrawable: boolean = false;

  /**
   * 给圆点着色，等价于 Android setDotTint(@ColorInt tint)。
   * 之后会触发 invalidateDots() 等价的响应式刷新。
   */
  setDotTint(color: ResourceColor): void {
    this.dotTint = color;
    this.hasDotTint = true;
  }

  /**
   * 从颜色资源着色，等价于 Android setDotTintRes(@ColorRes tintRes)。
   * ArkUI 中颜色资源直接作为 ResourceColor 使用，无需先取色值。
   */
  setDotTintRes(colorRes: Resource): void {
    this.dotTint = colorRes;
    this.hasDotTint = true;
  }

  /**
   * 切换圆点图片资源，等价于 Android setDotDrawable(indicatorRes, unselectedIndicatorRes)。
   * unselectedIndicatorRes 省略时与 indicatorRes 一致（与 Android 默认行为相同）。
   */
  setDotDrawable(indicatorRes: Resource, unselectedIndicatorRes?: Resource): void {
    this.dotDrawable = indicatorRes;
    if (unselectedIndicatorRes !== undefined) {
      this.dotDrawableUnselected = unselectedIndicatorRes;
    } else {
      this.dotDrawableUnselected = indicatorRes;
    }
    this.hasDotDrawable = true;
  }
}

/**
 * Swiper 圆点指示条组件，对应 Android com.afollestad.viewpagerdots.DotsIndicator。
 *
 * 用法：
 * ```
 * @State controller: DotsIndicatorController = new DotsIndicatorController();
 * @State selectedIndex: number = 0;
 * @State pageCount: number = 4;
 *
 * build() {
 *   DotsIndicator({
 *     controller: this.controller,
 *     selectedIndex: this.selectedIndex,
 *     pageCount: this.pageCount,
 *   })
 * }
 * ```
 * 在 Swiper.onChange 中更新 selectedIndex 即可驱动选中态切换动画。
 */
@Component
export struct DotsIndicator {
  /** 运行时状态控制器（响应式引用），承载 setDotTint/setDotTintRes/setDotDrawable。 */
  @ObjectLink controller: DotsIndicatorController;

  /** 当前选中页索引，对应 Android viewPager.currentItem；由 Swiper.onChange 驱动更新。 */
  @Prop selectedIndex: number = 0;
  /** 页数，对应 Android viewPager.adapter.count。 */
  @Prop pageCount: number = 0;

  /** 单个圆点宽度（vp），对应 Android dot_width，默认 5vp。 */
  @Prop dotWidth: number = DEFAULT_DOT_SIZE_VP;
  /** 单个圆点高度（vp），对应 Android dot_height，默认 5vp。 */
  @Prop dotHeight: number = DEFAULT_DOT_SIZE_VP;
  /** 圆点间距（vp，每侧），对应 Android dot_margin，默认 5vp。 */
  @Prop dotMargin: number = DEFAULT_DOT_MARGIN_VP;

  /** 默认圆点颜色（Circle 渲染模式），对应 Android black_dot 的 solid #000000。 */
  @Prop dotColor: ResourceColor = DEFAULT_DOT_COLOR;

  /** 指示条方向，对应 Android dots_orientation，默认 horizontal。 */
  @Prop orientation: DotsOrientation = DotsOrientation.HORIZONTAL;
  /** 指示条整体对齐，对应 Android dots_gravity，默认 center。 */
  @Prop gravity: DotsGravity = DotsGravity.CENTER;

  build() {
    if (this.orientation === DotsOrientation.VERTICAL) {
      Column() {
        ForEach(this.getDotIndices(), (item: number) => {
          DotView({
            isSelected: item === this.selectedIndex,
            dotColor: this.dotColor,
            dotTint: this.controller.dotTint,
            hasDotTint: this.controller.hasDotTint,
            dotDrawable: this.controller.dotDrawable,
            dotDrawableUnselected: this.controller.dotDrawableUnselected,
            hasDotDrawable: this.controller.hasDotDrawable,
            dotWidth: this.dotWidth,
            dotHeight: this.dotHeight,
            dotMargin: this.dotMargin,
          })
        }, (item: number) => `dot-${item}`)
      }
      .width('100%')
      .height('100%')
      .justifyContent(this.getMainAxisAlign())
      .alignItems(this.getCrossAxisAlignHorizontal())
    } else {
      Row() {
        ForEach(this.getDotIndices(), (item: number) => {
          DotView({
            isSelected: item === this.selectedIndex,
            dotColor: this.dotColor,
            dotTint: this.controller.dotTint,
            hasDotTint: this.controller.hasDotTint,
            dotDrawable: this.controller.dotDrawable,
            dotDrawableUnselected: this.controller.dotDrawableUnselected,
            hasDotDrawable: this.controller.hasDotDrawable,
            dotWidth: this.dotWidth,
            dotHeight: this.dotHeight,
            dotMargin: this.dotMargin,
          })
        }, (item: number) => `dot-${item}`)
      }
      .width('100%')
      .height('100%')
      .justifyContent(this.getMainAxisAlign())
      .alignItems(this.getCrossAxisAlignVertical())
    }
  }

  /** 生成 [0, pageCount) 索引数组供 ForEach 渲染。 */
  private getDotIndices(): number[] {
    let arr: number[] = [];
    let count: number = this.pageCount;
    for (let i = 0; i < count; i++) {
      arr.push(i);
    }
    return arr;
  }

  /** 主轴对齐（Row 的水平方向 / Column 的垂直方向），映射 Android dots_gravity。 */
  private getMainAxisAlign(): FlexAlign {
    switch (this.gravity) {
      case DotsGravity.TOP:
      case DotsGravity.LEFT:
      case DotsGravity.START:
        return FlexAlign.Start;
      case DotsGravity.BOTTOM:
      case DotsGravity.RIGHT:
      case DotsGravity.END:
        return FlexAlign.End;
      case DotsGravity.FILL:
      case DotsGravity.FILL_HORIZONTAL:
      case DotsGravity.FILL_VERTICAL:
        return FlexAlign.SpaceEvenly;
      default:
        return FlexAlign.Center;
    }
  }

  /** Column 的交叉轴（水平方向）对齐。 */
  private getCrossAxisAlignHorizontal(): HorizontalAlign {
    switch (this.gravity) {
      case DotsGravity.LEFT:
      case DotsGravity.START:
        return HorizontalAlign.Start;
      case DotsGravity.RIGHT:
      case DotsGravity.END:
        return HorizontalAlign.End;
      default:
        return HorizontalAlign.Center;
    }
  }

  /** Row 的交叉轴（垂直方向）对齐。 */
  private getCrossAxisAlignVertical(): VerticalAlign {
    switch (this.gravity) {
      case DotsGravity.TOP:
        return VerticalAlign.Top;
      case DotsGravity.BOTTOM:
        return VerticalAlign.Bottom;
      default:
        return VerticalAlign.Center;
    }
  }
}

/**
 * 单个圆点子组件，对应 Android DotsIndicator 内部 addView 创建的 View 子项。
 * 默认以 Circle 渲染（等价 black_dot 的 oval shape），用户调用 setDotDrawable 后切换为 Image 渲染。
 * 选中态：scale 1.8、opacity 1.0；未选中态：scale 1.0、opacity 0.5。
 * 通过 .animation() 实现 200ms 属性动画过渡，对应 Android scale_with_alpha animator。
 */
@Component
struct DotView {
  /**
   * 当前是否选中。通过 @Watch 监听变化方向，动态切换动画曲线：
   * - false→true（变为选中，对应 Android animatorOut）：Curve.FastOutSlowIn（≈ AccelerateDecelerateInterpolator）
   * - true→false（变为未选中，对应 Android animatorIn）：Curve.Linear（= ReverseInterpolator abs(1-v)）
   *
   * Android 源码中 animatorOut 使用默认的 AccelerateDecelerateInterpolator（S 曲线），
   * animatorIn 使用 ReverseInterpolator(getInterpolation = abs(1-v))，即线性反向。
   * 选中态和取消选中态发生在不同 DotView 实例上，各自有独立 .animation()，
   * 因此可按方向分别配置曲线。
   */
  @Prop @Watch('onSelectedChange') isSelected: boolean = false;
  @Prop dotColor: ResourceColor = DEFAULT_DOT_COLOR;
  @Prop dotTint: ResourceColor = DEFAULT_DOT_COLOR;
  @Prop hasDotTint: boolean = false;
  @Prop dotDrawable: Resource = $r('app.media.black_dot');
  @Prop dotDrawableUnselected: Resource = $r('app.media.black_dot');
  @Prop hasDotDrawable: boolean = false;
  @Prop dotWidth: number = DEFAULT_DOT_SIZE_VP;
  @Prop dotHeight: number = DEFAULT_DOT_SIZE_VP;
  @Prop dotMargin: number = DEFAULT_DOT_MARGIN_VP;

  /** 当前动画曲线，由 @Watch 在 isSelected 变化时同步更新（渲染前）。 */
  private currentCurve: Curve = Curve.FastOutSlowIn;

  /** @Watch 回调：isSelected 变化后（新值已生效），按方向设置曲线。 */
  onSelectedChange(): void {
    // isSelected 已为新值
    // 新值 true → 变为选中 → animatorOut → FastOutSlowIn（≈ AccelerateDecelerate）
    // 新值 false → 变为未选中 → animatorIn → Linear（= ReverseInterpolator abs(1-v)）
    this.currentCurve = this.isSelected ? Curve.FastOutSlowIn : Curve.Linear;
  }

  build() {
    if (this.hasDotDrawable) {
      if (this.hasDotTint) {
        Stack() {
          Image(this.isSelected ? this.dotDrawable : this.dotDrawableUnselected)
            .width('100%')
            .height('100%')
            .objectFit(ImageFit.Fill)
            .fillColor(this.dotTint)
            .scale({
              x: this.isSelected ? SELECTED_SCALE : UNSELECTED_SCALE,
              y: this.isSelected ? SELECTED_SCALE : UNSELECTED_SCALE
            })
            .opacity(this.isSelected ? SELECTED_OPACITY : UNSELECTED_OPACITY)
            .animation({ duration: ANIM_DURATION_MS, curve: this.currentCurve })
        }
          .width(this.dotWidth)
          .height(this.dotHeight)
          .margin(this.dotMargin)
      } else {
        Stack() {
          Image(this.isSelected ? this.dotDrawable : this.dotDrawableUnselected)
            .width('100%')
            .height('100%')
            .objectFit(ImageFit.Fill)
            .scale({
              x: this.isSelected ? SELECTED_SCALE : UNSELECTED_SCALE,
              y: this.isSelected ? SELECTED_SCALE : UNSELECTED_SCALE
            })
            .opacity(this.isSelected ? SELECTED_OPACITY : UNSELECTED_OPACITY)
            .animation({ duration: ANIM_DURATION_MS, curve: this.currentCurve })
        }
          .width(this.dotWidth)
          .height(this.dotHeight)
          .margin(this.dotMargin)
      }
    } else {
      Stack() {
        Circle()
          .width('100%')
          .height('100%')
          .fill(this.hasDotTint ? this.dotTint : this.dotColor)
          .scale({
            x: this.isSelected ? SELECTED_SCALE : UNSELECTED_SCALE,
            y: this.isSelected ? SELECTED_SCALE : UNSELECTED_SCALE
          })
          .opacity(this.isSelected ? SELECTED_OPACITY : UNSELECTED_OPACITY)
          .animation({ duration: ANIM_DURATION_MS, curve: this.currentCurve })
      }
        .width(this.dotWidth)
        .height(this.dotHeight)
        .margin(this.dotMargin)
    }
  }
}
