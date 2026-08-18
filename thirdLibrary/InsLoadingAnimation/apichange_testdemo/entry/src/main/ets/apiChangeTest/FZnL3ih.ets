import image from '@ohos.multimedia.image';
import util from '@ohos.util';

@Component
export struct FZnL3ih {
  @State mimeType: string = '';
  @State sourceFormats: string = '';
  @State packerFormats: string = '';

  private readonly pngBase64: string = 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg==';

  private loadImageInfo(): void {
    const helper: util.Base64Helper = new util.Base64Helper();
    const decoded: Uint8Array = helper.decodeSync(this.pngBase64);
    const buffer: ArrayBuffer = decoded.buffer.slice(decoded.byteOffset, decoded.byteOffset + decoded.byteLength);
    const imageSource: image.ImageSource = image.createImageSource(buffer);
    const sourceFormats: Array<string> = imageSource.supportedFormats;
    this.sourceFormats = sourceFormats.join(',');
    imageSource.getImageInfo().then((info: image.ImageInfo) => {
      this.mimeType = info.mimeType;
    }).catch(() => {
      this.mimeType = 'decode error';
    }).finally(() => {
      imageSource.release();
    });
    const packer: image.ImagePacker = image.createImagePacker();
    const packerFormats: Array<string> = packer.supportedFormats;
    this.packerFormats = packerFormats.join(',');
  }

  build() {
    Column({ space: 8 }) {
      Button('load image info')
        .onClick(() => {
          this.loadImageInfo();
        })
      Text('mime: ' + this.mimeType)
      Text('source formats: ' + this.sourceFormats)
      Text('packer formats: ' + this.packerFormats)
      Text('rounded box')
        .borderRadius(8)
        .zIndex(1)
        .width('80%')
        .height(48)
        .backgroundColor('#336666')
    }
    .width('100%')
    .padding(12)
  }
}
