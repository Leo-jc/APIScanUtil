/**
 * 提示气泡组件。
 *
 * 对应 Android Demo 中 side_hint TextView：背景 drawable bg_side_hint.png（圆角矩形 + 右侧箭头）+ backgroundTint=holo_orange_dark。
 * 鸿蒙侧无 9-patch，用 圆角矩形（左侧圆角）+ 右侧三角形 Path 等价复刻气泡形状。
 * visibility=gone 对应 if 条件不渲染（不占位）。
 * 位置由外部 .position 控制（对应 Android translationY=currentY）。
 *
 * 注意：@Prop 属性名避免使用 width/height/backgroundColor 等与 CustomComponent 基类通用方法同名的标识符。
 */
@Component
export struct HintBubble {
  /** 气泡显示文本（选中的字母）。 */
  @Prop text: string = '';
  /** 是否可见。 */
  @Prop visible: boolean = false;
  /** 气泡总宽度（含箭头，vp）。 */
  @Prop bubbleWidth: number = 60;
  /** 气泡高度（vp）。 */
  @Prop bubbleHeight: number = 44;
  /** 箭头宽度（vp）。 */
  @Prop arrowSize: number = 10;
  /** 气泡背景色。 */
  @Prop bubbleBgColor: string = '#FF8800';
  /** 文字颜色。 */
  @Prop textColor: string = '#FFFFFF';
  /** 字号（fp）。 */
  @Prop textSize: number = 20;

  build() {
    if (this.visible) {
      Row() {
        Text(this.text)
          .width(this.bubbleWidth - this.arrowSize)
          .height(this.bubbleHeight)
          .fontSize(`${this.textSize}fp`)
          .fontColor(this.textColor)
          .backgroundColor(this.bubbleBgColor)
          .borderRadius({ topLeft: 8, topRight: 0, bottomRight: 0, bottomLeft: 8 })
          .textAlign(TextAlign.Center)
          .padding({ right: this.arrowSize })

        Path()
          .width(this.arrowSize)
          .height(this.bubbleHeight)
          .commands(`M0,0 L${this.arrowSize} ${this.bubbleHeight / 2} L0 ${this.bubbleHeight} Z`)
          .fill(this.bubbleBgColor)
      }
      .width(this.bubbleWidth)
      .height(this.bubbleHeight)
    }
  }
}
