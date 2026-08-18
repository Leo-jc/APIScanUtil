@Component
export struct QTvIRc5 {
  @State showSheet: boolean = false;
  @State nodeVisible: boolean = false;
  private tabsController: TabsController = new TabsController();
  private scroller: Scroller = new Scroller();
  private parentScroller: Scroller = new Scroller();
  private childScroller: Scroller = new Scroller();

  aboutToAppear(): void {
    const uiContext: UIContext = this.getUIContext();
    uiContext.bindTabsToScrollable(this.tabsController, this.scroller);
    uiContext.bindTabsToNestedScrollable(this.tabsController, this.parentScroller, this.childScroller);
    const node = uiContext.getFrameNodeByUniqueId(this.getUniqueId());
    this.nodeVisible = node !== null && node.isVisible();
  }

  @Builder
  sheetContent() {
    Column() {
      Text('embedded sheet content').fontSize(14)
    }
    .width('100%')
    .height(200)
  }

  @Builder
  dragContent() {
    Text('dragging').fontSize(12).padding(4)
  }

  build() {
    Column({ space: 8 }) {
      Button('open sheet')
        .onClick(() => {
          this.showSheet = true;
        })
      Button('drag me')
        .onDragStart((event: DragEvent) => {
          return this.dragContent();
        })
      Text('node visible: ' + String(this.nodeVisible))
    }
    .width('100%')
    .padding(12)
    .bindSheet($$this.showSheet, this.sheetContent.bind(this), { mode: SheetMode.EMBEDDED })
  }
}
