/**
 * FluidLayout - 流式布局容器。
 *
 * 子项从左到右排列，超出可用宽度（扣除左右内边距）自动换行，多行自上而下堆叠；
 * 支持容器级与逐子项级的垂直对齐（Top/Center/Bottom）。
 *
 * 该组件通过 ArkUI 自定义布局（onMeasureSize / onPlaceChildren）实现，
 * 与 Android 端 ViewGroup.onMeasure / onLayout 的换行与对齐算法逐项对齐。
 */

/**
 * 流式布局垂直对齐方式。
 *
 * 对应 Android 端 Gravity.TOP / Gravity.CENTER / Gravity.BOTTOM，
 * 但不复用 Android 整数常量，使用 ArkTS 原生枚举。
 */
export enum FluidGravity {
  /** 贴行顶对齐。 */
  Top,
  /** 行内垂直居中对齐。 */
  Center,
  /** 贴行底对齐。 */
  Bottom
}

/**
 * 子项可见性。
 *
 * 对应 Android 端 View 的 VISIBLE / INVISIBLE / GONE：
 * - Visible：正常显示，参与测量与布局。
 * - Hidden：不可见但占位（对应 Android INVISIBLE），参与测量与布局，视觉上不可见。
 * - Gone：不占位隐藏（对应 Android GONE），不参与测量与布局，全程跳过。
 */
export enum FluidVisibility {
  /** 正常显示。 */
  Visible,
  /** 不可见但保留布局位置（占位）。 */
  Hidden,
  /** 不占位隐藏，全程不参与测量与布局。 */
  Gone
}

/**
 * 子项外边距。
 *
 * 对应 Android 端 ViewGroup.MarginLayoutParams 的 leftMargin / topMargin / rightMargin / bottomMargin。
 * 单位 vp。
 */
export class FluidMargin {
  left: number = 0;
  top: number = 0;
  right: number = 0;
  bottom: number = 0;
}

/**
 * 容器内边距。
 *
 * 对应 Android 端 ViewGroup 的 paddingLeft / Top / Right / Bottom。
 * 单位 vp。容器自身尺寸与子项摆放均会计入该内边距。
 */
export class FluidPadding {
  left: number = 0;
  top: number = 0;
  right: number = 0;
  bottom: number = 0;
}

/**
 * 子项描述。
 *
 * 对应 Android 端 FluidLayout.LayoutParams（承载逐子项 gravity 与 margins）以及 visibility。
 * ArkUI 声明式子项不携带 LayoutParams，逐子项对齐与外边距通过该数据模型承载，
 * 由 FluidLayout 在自定义布局回调中取用。
 *
 * - gravity 为 null 时回退到容器级 gravity（对应 Android lp.gravity = -1）。
 * - visibility 为 Gone 时该项不参与测量与布局（对应 Android View.GONE，全程跳过）。
 *   visibility 为 Hidden 时该项占位但不可见（对应 Android View.INVISIBLE）。
 * - data 为该项携带的业务数据，供 itemBuilder 渲染使用。
 */
export class FluidItem {
  data: string = '';
  gravity: FluidGravity | null = null;
  margin: FluidMargin = new FluidMargin();
  visibility: FluidVisibility = FluidVisibility.Visible;
}

/**
 * 行信息（内部布局缓存）。记录一行的可见子项在 children 数组中的起止下标与行高。
 */
class FluidLineInfo {
  startIndex: number = 0;
  endIndex: number = 0;
  height: number = 0;
}

/**
 * 将 Length（可能是 number / 字符串 / Resource / undefined）转换为 vp 数值。
 * - undefined / null / Resource：自定义布局回调中无法解析，按"无约束"返回 Infinity。
 * - number：直接返回（Infinity 等特殊值保留）。
 * - 字符串：解析前导数字部分，无法解析按"无约束"返回 Infinity。
 */
function lengthToNumber(len: Length | undefined): number {
  if (len === undefined || len === null) {
    return Number.POSITIVE_INFINITY;
  }
  if (typeof len === 'number') {
    return len;
  }
  if (typeof len === 'string') {
    let n = Number.parseFloat(len);
    return isNaN(n) ? Number.POSITIVE_INFINITY : n;
  }
  return Number.POSITIVE_INFINITY;
}

/**
 * 流式布局容器。
 *
 * 用法：
 * ```
 * FluidLayout({
 *   gravity: FluidGravity.Top,
 *   items: items,
 *   padding: { left: 5, top: 5, right: 5, bottom: 5 }
 * }) {
 *   itemBuilder(item, index) { Text(item.data)... }
 * }
 * ```
 *
 * 运行态可变入参（gravity / items / padding）以响应式状态承载，变更自动触发
 * onMeasureSize / onPlaceChildren 重新执行，无需手动 requestLayout。
 */
@Component
export struct FluidLayout {
  /** 容器级默认垂直对齐，运行态可变。对应 Android setGravity。默认 Top。 */
  @Prop gravity: FluidGravity = FluidGravity.Top;
  /** 子项数据数组，运行态可变（增删 / 改对齐 / 改可见性）。对应 Android addView/removeAllViews + LayoutParams。 */
  @Prop items: FluidItem[] = [];
  /** 容器内边距，运行态可变。对应 Android setPadding。 */
  @Prop fluidPadding: FluidPadding = { left: 0, top: 0, right: 0, bottom: 0 };
  /** 子项构建器，接收 (item, index)，index 为 items 原始下标（含不可见项）。 */
  @BuilderParam itemBuilder: (item: FluidItem, index: number) => void = this.defaultItemBuilder;

  /** 上一轮布局计算的行信息，供 onPlaceChildren 使用。 */
  private lines: FluidLineInfo[] = [];
  /** 上一轮布局计算的各子项尺寸（不含 margin）。 */
  private childWidths: number[] = [];
  private childHeights: number[] = [];
  /** 与 children 数组一一对应的可见子项描述。 */
  private visibleItems: FluidItem[] = [];

  @Builder
  defaultItemBuilder(item: FluidItem, index: number) {
    Text(item.data)
  }

  private itemLayoutKey(item: FluidItem, index: number): string {
    let itemGravity = -1;
    if (item.gravity !== null) {
      itemGravity = item.gravity;
    }
    let margin = item.margin;
    return index.toString() + '_' + item.data + '_' + this.gravity.toString() + '_' + itemGravity.toString() +
      '_' + item.visibility.toString() + '_' + margin.left.toString() + '_' + margin.top.toString() +
      '_' + margin.right.toString() + '_' + margin.bottom.toString() + '_' + this.fluidPadding.left.toString() +
      '_' + this.fluidPadding.top.toString() + '_' + this.fluidPadding.right.toString() +
      '_' + this.fluidPadding.bottom.toString();
  }

  @Builder
  fluidContent() {
    ForEach(this.items, (item: FluidItem, index: number) => {
      // Gone 项（visibility=Gone）全程不参与测量与布局，使用条件渲染剔除出 children 数组。
      // Hidden 项（visibility=Hidden）占位但不可见，仍参与测量与布局。
      if (item.visibility !== FluidVisibility.Gone) {
        if (item.visibility === FluidVisibility.Hidden) {
          // Hidden：包装在 Column 中并设为 Visibility.Hidden，保留布局位置但不可见。
          Column() {
            this.itemBuilder(item, index)
          }
          .visibility(Visibility.Hidden)
        } else {
          this.itemBuilder(item, index)
        }
      }
    }, (item: FluidItem, index: number) => this.itemLayoutKey(item, index))
  }

  /**
   * 测量子项并计算容器自身尺寸，同时完成行分组缓存供 onPlaceChildren 使用。
   *
   * 算法对应 Android FluidLayout.onMeasure：
   * 1. 跳过 GONE（已由条件渲染剔除）。
   * 2. 累加行宽，超宽换行；行高取行内子项（含上下 margin）最大值。
   * 3. 宽度约束为有限值时视为 EXACTLY（撑满约束宽），否则取内容宽 + 左右内边距。
   *    高度约束为有限值时视为 EXACTLY（撑满约束高），否则取内容高 + 上下内边距。
   */
  onMeasureSize(selfLayoutInfo: GeometryInfo, children: Array<Measurable>,
    constraint: ConstraintSizeOptions): SizeResult {
    let padL = this.fluidPadding.left;
    let padR = this.fluidPadding.right;
    let padT = this.fluidPadding.top;
    let padB = this.fluidPadding.bottom;

    let maxW = lengthToNumber(constraint.maxWidth);
    let maxH = lengthToNumber(constraint.maxHeight);
    let minH = lengthToNumber(constraint.minHeight);

    let widthFinite = !isNaN(maxW) && isFinite(maxW);
    let heightFinite = !isNaN(maxH) && isFinite(maxH);
    let heightExact = heightFinite && !isNaN(minH) && isFinite(minH) && minH === maxH;

    // 可用内容宽 = 容器约束宽 - 左右内边距；约束为无限时可用宽亦为无限。
    let availWidth: number;
    if (widthFinite) {
      availWidth = maxW - padL - padR;
      if (availWidth < 0) {
        availWidth = 0;
      }
    } else {
      availWidth = Number.POSITIVE_INFINITY;
    }

    // 与 children 一一对应的可见项（Visible 和 Hidden，排除 Gone）。
    let visItems: FluidItem[] = [];
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].visibility !== FluidVisibility.Gone) {
        visItems.push(this.items[i]);
      }
    }

    let count = children.length;
    let widths: number[] = [];
    let heights: number[] = [];
    let margins: FluidMargin[] = [];

    // 先收集各子项外边距（与 children 一一对应，仅含可见项）。
    for (let i = 0; i < count; i++) {
      if (i < visItems.length && visItems[i].margin) {
        margins.push(visItems[i].margin);
      } else {
        margins.push({ left: 0, top: 0, right: 0, bottom: 0 });
      }
    }

    // 测量所有可见子项。与 Android ViewGroup.measureChild 一致，子项可用宽高
    // 从容器约束中扣除容器内边距与子项外边距，使子项 measured 尺寸 + margin 不超过可用宽。
    for (let i = 0; i < count; i++) {
      let m = margins[i];
      let childMaxW: number;
      let childMaxH: number;
      childMaxW = Number.POSITIVE_INFINITY;
      if (heightFinite) {
        childMaxH = maxH - padT - padB - m.top - m.bottom;
        if (childMaxH < 0) {
          childMaxH = 0;
        }
      } else {
        childMaxH = Number.POSITIVE_INFINITY;
      }
      let result = children[i].measure({
        minWidth: 0,
        minHeight: 0,
        maxWidth: childMaxW,
        maxHeight: childMaxH
      });
      widths.push(result.width);
      heights.push(result.height);
    }

    // 行分组：对应 Android onMeasure 的累加换行逻辑（childWidth 含 margins）。
    let lines: FluidLineInfo[] = [];
    let lineWidth = 0;
    let lineHeight = 0;
    let lineStart = 0;
    let contentWidth = 0;
    let contentHeight = 0;

    for (let i = 0; i < count; i++) {
      let cw = widths[i] + margins[i].left + margins[i].right;
      let ch = heights[i] + margins[i].top + margins[i].bottom;

      if (lineWidth + cw > availWidth) {
        // 换行：记录旧行（若非空）。
        if (lineStart < i) {
          let line = new FluidLineInfo();
          line.startIndex = lineStart;
          line.endIndex = i;
          line.height = lineHeight;
          lines.push(line);
          contentWidth = Math.max(contentWidth, lineWidth);
          contentHeight += lineHeight;
        }
        // 新行从当前子项起始（即使其本身超宽，也独占一行，行宽溢出）。
        lineWidth = cw;
        lineHeight = ch;
        lineStart = i;
      } else {
        lineWidth += cw;
        if (ch > lineHeight) {
          lineHeight = ch;
        }
      }
    }

    // 末行。
    if (count > 0 && lineStart < count) {
      let line = new FluidLineInfo();
      line.startIndex = lineStart;
      line.endIndex = count;
      line.height = lineHeight;
      lines.push(line);
      contentWidth = Math.max(contentWidth, lineWidth);
      contentHeight += lineHeight;
    }

    // 缓存供 onPlaceChildren 使用。
    this.lines = lines;
    this.childWidths = widths;
    this.childHeights = heights;
    this.visibleItems = visItems;

    // 容器最终尺寸：约束有限（EXACTLY 语义）取约束值，否则取内容值 + 内边距。
    let finalW = widthFinite ? maxW : contentWidth + padL + padR;
    let finalH = heightExact ? maxH : contentHeight + padT + padB;
    if (finalW < 0) {
      finalW = 0;
    }
    if (finalH < 0) {
      finalH = 0;
    }

    let result: SizeResult = { width: finalW, height: finalH };
    return result;
  }

  /**
   * 按 onMeasureSize 缓存的行分组逐子项放置。
   *
   * 算法对应 Android FluidLayout.onLayout 的放置阶段（已修正 GONE 一致性：
   * GONE 项不进入行分组，避免原库第一轮未跳过 GONE 的瑕疵）：
   * - 子项 lp.gravity 优先，为 null 回退容器 mGravity。
   * - Top=贴行顶；Center=行内垂直居中；Bottom=贴行底。
   * - 横向 left 累加 childWidth + 左右 margin；行末 left 重置为 paddingLeft，top 累加行高。
   */
  onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Array<Layoutable>,
    constraint: ConstraintSizeOptions): void {
    let padL = this.fluidPadding.left;
    let padT = this.fluidPadding.top;

    let left = padL;
    let top = padT;

    let lines = this.lines;
    for (let li = 0; li < lines.length; li++) {
      let line = lines[li];
      let lineH = line.height;
      for (let ci = line.startIndex; ci < line.endIndex; ci++) {
        let child = children[ci];
        let item: FluidItem = this.visibleItems[ci];
        let margin: FluidMargin = item.margin;
        let cw = this.childWidths[ci];
        let ch = this.childHeights[ci];

        // 子项 gravity 优先，null 回退容器 gravity（对应 Android gravity < 0 回退 mGravity）。
        let g = (item.gravity !== null) ? item.gravity : this.gravity;
        let tmpTop = top;
        if (g === FluidGravity.Center) {
          tmpTop = top + (lineH - margin.top - margin.bottom - ch) / 2;
        } else if (g === FluidGravity.Bottom) {
          tmpTop = top + (lineH - margin.top - margin.bottom - ch);
        }

        let x = left + margin.left;
        let y = tmpTop + margin.top;
        child.layout({ x: x, y: y });

        left += cw + margin.left + margin.right;
      }
      left = padL;
      top += lineH;
    }
  }

  build() {
    this.fluidContent()
  }
}
