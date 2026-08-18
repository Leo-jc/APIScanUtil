@Component
export struct AGdimU0 {
  @State showCounterEnabled: boolean = false;
  @State mouseInfo: string = 'idle';

  private runAnimate(): void {
    this.getUIContext().animateTo({
      duration: 300,
      curve: Curve.EaseInOut,
      onFinish: () => {
        this.showCounterEnabled = !this.showCounterEnabled;
      }
    }, () => {
      this.showCounterEnabled = !this.showCounterEnabled;
    });
  }

  build() {
    Column({ space: 8 }) {
      Button('run animate')
        .onClick(() => {
          this.runAnimate();
        })
      TextInput({ placeholder: 'show counter input' })
        .showCounter(this.showCounterEnabled)
        .width('80%')
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Text('tab one')
        }
        TabContent() {
          Text('tab two')
        }
      }
      .barOverlap(true)
      .width('80%')
      .height(120)
      Text(this.mouseInfo)
        .width('80%')
        .height(40)
        .onMouse((event: MouseEvent) => {
          this.mouseInfo = 'mouse:' + event.button;
        })
    }
    .width('100%')
    .padding(12)
  }
}
