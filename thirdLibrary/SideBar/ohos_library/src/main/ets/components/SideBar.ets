import { SideBarListener } from '../interface/SideBarListener';

/**
 * SideBar 字母索引侧边栏组件。
 *
 * 对应 Android 端 SideBarView（继承 android.view.View，自绘字母 + 触摸/滑动选择）。
 * 鸿蒙侧使用 ArkUI Canvas 组件 + CanvasRenderingContext2D 复刻 onDraw/onMeasure/dispatchTouchEvent。
 *
 * 范式差异：Android 用链式 setLetters/setSideBarListener 方法驱动重绘，
 * ArkUI 改为 @Prop/@State 声明式参数，父组件修改 letters 即触发重绘，等价于运行态可变。
 */
@Component
export struct SideBar {
  /** 索引内容列表（运行态可变，父组件修改即触发重绘）。 */
  @Prop @Watch('onChange') letters: string[] = [];
  /** 未选中文字颜色（'#RRGGBB' 或 '#RRGGBBAA'）。默认黑，对应 Android Color.BLACK。 */
  @Prop @Watch('onColorChange') textColor: string = '#000000';
  /** 选中文字颜色。默认白色，确保按压高亮时文字清晰可见。 */
  @Prop @Watch('onColorChange') pressedTextColor: string = '#FFFFFF';
  /** 选中背景颜色。默认橙色圆形背景，确保按压高亮不是灰暗态。 */
  @Prop @Watch('onColorChange') pressedTextBgColor: string = '#FF8800';
  /** 字号（vp）。默认 13，对应 Android sideTextSize 默认 13px。 */
  @Prop @Watch('onChange') textSize: number = 13;
  /** 文字间距（vp）。默认 10，对应 Android sideItemSpacing 默认 10px。 */
  @Prop @Watch('onChange') itemSpacing: number = 10;
  /** 文字行高基准（vp）。<=0 时回退为 textSize，对应 Android sideItemHeight 默认取 textSize。 */
  @Prop @Watch('onChange') itemHeight: number = -1;
  /** 固定高度（vp）。>0 时高度取该规格值（对应 Android onMeasure EXACTLY）；<=0 时由内容计算。 */
  @Prop @Watch('onChange') fixedHeight: number = -1;
  /** 高度上限（vp）。>0 时高度取内容与该值较小值（对应 Android onMeasure AT_MOST）；<=0 时不限制。fixedHeight 优先级高于本字段。 */
  @Prop @Watch('onChange') maxHeight: number = -1;
  /** 是否向宿主发送交互回调。关闭后仅保留视觉高亮。 */
  @Prop callbackEnabled: boolean = true;
  /** 交互回调对象（可为 null，置 null 后仅产生视觉高亮，不再发出回调）。 */
  onSideBarListener: SideBarListener | null = null;

  /** 选中位置，-1 表示无选中。 */
  @State @Watch('onChooseChange') choosePosition: number = -1;
  /** 组件实际宽度（vp），由 onAreaChange 获取。初始用 Android 默认 75。 */
  @State viewWidth: number = 75;
  /** 组件高度（vp），由 letters 数量动态计算。 */
  @State viewHeight: number = 0;

  /** 绘制起点 Y（vp），对应 Android itemStartY = top + itemSpacing*0.5。 */
  private itemStartY: number = 0;
  /** 行高（vp）= itemHeight 基准 + itemSpacing，对应 Android itemHeight += itemSpacing。 */
  private realItemHeight: number = 0;
  /** SideBar 相对父布局的 top（vp），用于 currentY 计算。 */
  private sideBarTop: number = 0;
  /** Canvas 是否已就绪（onReady 后为 true）。 */
  private isCanvasReady: boolean = false;
  private ctx: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true));

  aboutToAppear(): void {
    // 组件创建时先计算布局，确保 build 阶段 viewHeight 已就绪（对应 Android onMeasure 首次测量）。
    this.computeLayout();
  }

  /**
   * 计算布局参数：行高、起点 Y、组件高度。
   * 对应 Android initAttr（itemHeight += itemSpacing）、onMeasure（viewHeight）、updateViewHeight。
   * viewHeight 取 onMeasure 的最终公式 itemHeight * letters.size + itemSpacing
   * （wrap_content 时 onMeasure 用 defaultSize 重算，updateViewHeight 的 layoutParams 仅触发重新测量）。
   */
  private computeLayout(): void {
    let baseHeight = this.itemHeight;
    if (baseHeight <= 0) {
      baseHeight = this.textSize; // 回退：sideItemHeight 未设置时取 textSize
    }
    this.realItemHeight = baseHeight + this.itemSpacing; // 行高 = baseHeight + itemSpacing
    this.itemStartY = this.itemSpacing * 0.5; // 对应 itemStartY = top + itemSpacing*0.5（初始 top=0）
    // 对应 onMeasure：itemHeight * letters.size + itemSpacing（itemHeight 已 += itemSpacing）
    const contentHeight = this.letters.length * this.realItemHeight + this.itemSpacing;
    if (this.fixedHeight > 0) {
      // EXACTLY：高度取规格值
      this.viewHeight = this.fixedHeight;
    } else if (this.maxHeight > 0) {
      // AT_MOST：高度取内容与规格较小值
      this.viewHeight = Math.min(contentHeight, this.maxHeight);
    } else {
      // UNSPECIFIED：高度取内容高度
      this.viewHeight = contentHeight;
    }
  }

  private onChange(): void {
    // letters/textSize/itemSpacing/itemHeight 变化均影响布局，需重算尺寸后重绘。
    this.computeLayout();
    this.redraw();
  }

  private onColorChange(): void {
    // 仅颜色变化，无需重算布局，直接重绘。
    this.redraw();
  }

  private onChooseChange(): void {
    this.redraw();
  }

  /**
   * 重绘画布，对应 Android invalidate/postInvalidate。
   */
  private redraw(): void {
    if (!this.isCanvasReady) {
      return;
    }
    this.ctx.clearRect(0, 0, this.viewWidth, this.viewHeight);
    this.drawText();
  }

  /**
   * 绘制字母列表，对应 Android onDrawText。
   * 基线计算：Android drawText 用基线，textHeight=(|ascent|-descent)/2，drawY=itemHeight*i+itemHeight/2+textHeight+itemStartY。
   * 推导后文字视觉中心 = itemHeight*i + itemHeight/2 + itemStartY。
   * ArkUI 用 textBaseline='middle' 直接以中心定位，等价实现。
   */
  private drawText(): void {
    if (this.letters.length === 0) {
      return;
    }
    this.ctx.font = `${this.textSize}vp sans-serif`;
    this.ctx.textAlign = 'left';
    this.ctx.textBaseline = 'middle';

    for (let i = 0; i < this.letters.length; i++) {
      const text = this.letters[i];
      const textWidth = this.ctx.measureText(text).width;
      const drawX = (this.viewWidth - textWidth) / 2; // 水平居中
      const centerY = this.realItemHeight * i + this.realItemHeight / 2 + this.itemStartY; // 文字中心 Y

      if (i === this.choosePosition) {
        // 选中项：先画背景圆，再画选中色文字
        this.ctx.fillStyle = this.pressedTextBgColor;
        this.ctx.beginPath();
        const cx = drawX + textWidth / 2; // 圆心 X = 文字水平中心
        const cy = centerY; // 圆心 Y = 文字中心
        const radius = this.textSize / 2 + this.textSize * 0.2; // 半径 = textSize*0.7
        this.ctx.arc(cx, cy, radius, 0, Math.PI * 2);
        this.ctx.fill();
        this.ctx.fillStyle = this.pressedTextColor;
      } else {
        this.ctx.fillStyle = this.textColor;
      }
      this.ctx.fillText(text, drawX, centerY);
    }
  }

  /**
   * 触摸事件处理，对应 Android dispatchTouchEvent。
   * 事件始终被消费（ArkUI 用 HitTestMode.Block 等价 return true）。
   */
  private handleTouch(event: TouchEvent): void {
    if (event.touches.length === 0) {
      return;
    }
    const touch = event.touches[0];
    const y = touch.y;
    const type = event.type;
    const oldChoosePosition = this.choosePosition;
    // 对应 Kotlin ((y - itemStartY) / itemHeight).toInt()，toInt() 为截断向 0 取整
    const raw = (y - this.itemStartY) / this.realItemHeight;
    const newChoosePosition = raw >= 0 ? Math.floor(raw) : Math.ceil(raw);

    if (type === TouchType.Up || type === TouchType.Cancel) {
      // ACTION_UP / ACTION_CANCEL：清除高亮，回调触摸态 false
      this.choosePosition = -1;
      if (this.callbackEnabled && this.onSideBarListener !== null) {
        this.onSideBarListener.onSideTouchState(false);
      }
      this.redraw();
    } else {
      // ACTION_DOWN / ACTION_MOVE
      if (type === TouchType.Down) {
        if (this.callbackEnabled && this.onSideBarListener !== null) {
          this.onSideBarListener.onSideTouchState(true);
        }
      }
      if (oldChoosePosition !== newChoosePosition) {
        if (newChoosePosition >= 0 && newChoosePosition < this.letters.length) {
          this.setSelectPosition(newChoosePosition);
        }
        // 越界（触点落在列表范围外）：不选中、不回调 onSideSelected，仅重绘
        this.redraw();
      }
    }
  }

  /**
   * 设置选中位置并回调，对应 Android setSelectPosition。
   */
  private setSelectPosition(position: number): void {
    this.choosePosition = position;
    // currentY = itemStartY + choosePosition * itemHeight - itemHeight/2 + getY()
    // getY() = sideBarTop（SideBar 相对父布局的 top）
    const currentY = this.itemStartY + position * this.realItemHeight - this.realItemHeight / 2 + this.sideBarTop;
    const letter = this.letters[position];
    if (this.callbackEnabled && this.onSideBarListener !== null) {
      this.onSideBarListener.onSideSelected(position, currentY, letter);
    }
  }

  build() {
    Canvas(this.ctx)
      .width('100%')
      .height(this.viewHeight)
      .onReady(() => {
        this.isCanvasReady = true;
        this.redraw();
      })
      .onAreaChange((oldValue: Area, newValue: Area) => {
        const widthChanged = this.viewWidth !== Number(newValue.width);
        const topChanged = this.sideBarTop !== Number(newValue.position.y);
        this.viewWidth = Number(newValue.width);
        this.sideBarTop = Number(newValue.position.y);
        if (widthChanged || topChanged) {
          this.redraw();
        }
      })
      .onTouch((event: TouchEvent) => {
        this.handleTouch(event);
      })
      .hitTestBehavior(HitTestMode.Block);
  }
}
