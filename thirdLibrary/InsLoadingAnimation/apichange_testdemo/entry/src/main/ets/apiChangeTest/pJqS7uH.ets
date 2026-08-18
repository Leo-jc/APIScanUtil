@Component
export struct pJqS7uH {
  @State cachedInfo: string = '';
  @State crownInfo: string = '';
  private readonly cachedOptions: CachedCountOptions = {
    isShown: true,
    independent: false
  };

  build() {
    Column({ space: 8 }) {
      Swiper() {
        Text('page one').width('100%').height(120).backgroundColor('#336688')
        Text('page two').width('100%').height(120).backgroundColor('#883366')
        Text('page three').width('100%').height(120).backgroundColor('#668833')
      }
      .cachedCount(2, this.cachedOptions)
      .width('80%')
      .height(120)
      .onChange((index: number) => {
        this.cachedInfo = 'index:' + index;
      })
      Button('read cached options')
        .onClick(() => {
          const options: CachedCountOptions = this.cachedOptions;
          this.cachedInfo = 'isShown:' + options.isShown + ' independent:' + options.independent;
        })
      Button('read crown action')
        .onClick(() => {
          const action: CrownAction = CrownAction.BEGIN;
          this.crownInfo = 'CrownAction.BEGIN=' + action;
        })
      Text(this.cachedInfo)
      Text(this.crownInfo)
    }
    .width('100%')
    .padding(12)
  }
}
