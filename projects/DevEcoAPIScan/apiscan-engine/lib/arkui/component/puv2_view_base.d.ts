
abstract class PUV2ViewBase extends NativeViewPartialUpdate {
  // createRecycle for @Reusable/@ReusableV2 components
  static createRecycle(componentCall: any, isRecycling: boolean,
    reuseId: string, callback: () => void): void;

  public reuseOrCreateNewComponent(params: { componentClass: any, getParams: () => Object, getReuseId?: () => string, extraInfo?: ExtraInfo }): void

} // class PUV2ViewBase
