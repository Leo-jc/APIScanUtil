@Component
export struct RYTcSm3 {
  @State keyboardMode: string = '';
  private scroller: Scroller = new Scroller();

  aboutToAppear(): void {
    const mode: KeyboardAvoidMode = this.getUIContext().getKeyboardAvoidMode();
    this.keyboardMode = 'keyboard mode:' + mode;
  }

  build() {
    Column({ space: 8 }) {
      Text('blend render text')
        .blendMode(BlendMode.SRC_OVER)
        .renderFit(RenderFit.COVER)
        .width('80%')
        .height(48)
        .backgroundColor('#667777')
      Scroll(this.scroller) {
        Column() {
          Text('scroll content one').height(80)
          Text('scroll content two').height(80)
        }
      }
      .width('80%')
      .height(120)
      .backToTop(true)
      Text(this.keyboardMode)
    }
    .width('100%')
    .padding(12)
    .onDisAppear(() => {
      this.keyboardMode = 'disappeared';
    })
  }
}
