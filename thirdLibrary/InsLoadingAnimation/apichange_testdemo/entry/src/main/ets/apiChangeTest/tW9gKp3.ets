import util from '@ohos.util';
import webview from '@ohos.web.webview';

@Component
export struct tW9gKp3 {
  @State vmInfo: string = '';
  @State policyInfo: string = '';
  @State downloadInfo: string = '';
  @State originalUrl: string = '';
  @State referrerUrl: string = '';

  private runVm(): void {
    util.ArkTSVM.enableLocalHandleDetection();
    const sourcePolicy: RetentionPolicy = RetentionPolicy.SOURCE;
    const bytecodePolicy: RetentionPolicy = RetentionPolicy.BYTECODE;
    this.vmInfo = 'local handle detection enabled';
    this.policyInfo = 'source:' + sourcePolicy + ' bytecode:' + bytecodePolicy;
  }

  private setupDownload(): void {
    const delegate: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
    delegate.onBeforeDownload((item: webview.WebDownloadItem) => {
      this.originalUrl = item.getOriginalUrl();
      this.referrerUrl = item.getReferrerUrl();
    });
    webview.WebDownloadManager.setDownloadDelegate(delegate);
    this.downloadInfo = 'download delegate set';
  }

  build() {
    Column({ space: 8 }) {
      Button('enable local handle detection')
        .onClick(() => {
          this.runVm();
        })
      Button('setup download delegate')
        .onClick(() => {
          this.setupDownload();
        })
      Text('vm: ' + this.vmInfo)
      Text('policy: ' + this.policyInfo)
      Text('download: ' + this.downloadInfo)
      Text('original url: ' + this.originalUrl)
      Text('referrer url: ' + this.referrerUrl)
    }
    .width('100%')
    .padding(12)
  }
}
