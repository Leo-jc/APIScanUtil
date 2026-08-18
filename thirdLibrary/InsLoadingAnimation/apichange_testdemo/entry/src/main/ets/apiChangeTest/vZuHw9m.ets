import convertxml from '@ohos.convertxml';

@Component
export struct vZuHw9m {
  @State showSheet: boolean = false;
  @State toastMessage: string = '';
  @State reuseId: string = 'cell-1';
  @State xmlResult: string = '';

  private showToast(): void {
    this.getUIContext().getPromptAction().showToast({
      message: 'toast from prompt action',
      duration: 1500
    });
    this.toastMessage = 'toast shown';
  }

  private parseXml(): void {
    const converter: convertxml.ConvertXML = new convertxml.ConvertXML();
    const result: Object = converter.fastConvertToJSObject('<note><to>t</to></note>');
    this.xmlResult = JSON.stringify(result);
  }

  @Builder
  sheetContent() {
    Column() {
      Text('sheet from bindSheet').fontSize(14)
    }
    .width('100%')
    .height(180)
  }

  build() {
    Column({ space: 8 }) {
      Button('show toast')
        .onClick(() => {
          this.showToast();
        })
      Button('parse xml')
        .onClick(() => {
          this.parseXml();
        })
      Search({ placeholder: 'search input' })
        .searchButton('search')
        .width('80%')
      Text('xml: ' + this.xmlResult)
      Text('toast msg: ' + this.toastMessage)
    }
    .width('100%')
    .padding(12)
    .reuse({
      reuseId: () => {
        return this.reuseId;
      }
    })
    .bindSheet($$this.showSheet, this.sheetContent.bind(this), {
      mode: SheetMode.EMBEDDED
    })
  }
}
