import drawing from '@ohos.graphics.drawing';
import uiEffect from '@ohos.graphics.uiEffect';
import image from '@ohos.multimedia.image';
import { NodeController, FrameNode, RenderNode, DrawContext, UIContext } from '@kit.ArkUI';

class MeshRenderNode extends RenderNode {
  private pixelMap: image.PixelMap | null = null;

  setPixelMap(pixelMap: image.PixelMap): void {
    this.pixelMap = pixelMap;
    this.invalidate();
  }

  draw(context: DrawContext): void {
    const canvas: drawing.Canvas = context.canvas;
    const pixelMap = this.pixelMap;
    if (pixelMap !== null) {
      const meshWidth: number = 2;
      const meshHeight: number = 2;
      const vertices: Array<number> = [
        0, 0, 60, 0, 120, 0,
        0, 60, 60, 60, 120, 60,
        0, 120, 60, 120, 120, 120
      ];
      // 6.1.1 起 colors 参数允许传入 null
      canvas.drawPixelMapMesh(pixelMap, meshWidth, meshHeight, vertices, 0, null, 0);
    }
  }
}

class MeshNodeController extends NodeController {
  private meshNode: MeshRenderNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    const node: MeshRenderNode = new MeshRenderNode();
    node.size = { width: 120, height: 120 };
    this.meshNode = node;
    return node;
  }

  getMeshNode(): MeshRenderNode | null {
    return this.meshNode;
  }
}

@Component
export struct rNvEk2Y {
  @State matrixInfo: string = '';
  @State effectInfo: string = '';
  @State meshInfo: string = '';
  private effect: uiEffect.VisualEffect = uiEffect.createEffect();
  private meshController: MeshNodeController = new MeshNodeController();

  private runDrawing(): void {
    const matrixA: drawing.Matrix = new drawing.Matrix();
    const matrixB: drawing.Matrix = new drawing.Matrix();
    const isIdentity: boolean = matrixA.isIdentity();
    const isEqual: boolean = matrixA.isEqual(matrixB);
    const invertOk: boolean = matrixA.invert(new drawing.Matrix());
    this.matrixInfo = 'identity:' + isIdentity + ' equal:' + isEqual + ' invert:' + invertOk;
    this.effectInfo = 'visual effect applied';

    const pixelBuffer = new ArrayBuffer(2 * 2 * 4);
    const pixelBytes = new Uint8Array(pixelBuffer);
    for (let i = 0; i < pixelBytes.length; i++) {
      pixelBytes[i] = 255;
    }
    const initOptions: image.InitializationOptions = {
      size: { width: 2, height: 2 },
      pixelFormat: image.PixelMapFormat.RGBA_8888
    };
    const pixelMap: image.PixelMap = image.createPixelMapSync(pixelBuffer, initOptions);
    const node = this.meshController.getMeshNode();
    if (node !== null) {
      node.setPixelMap(pixelMap);
    }
    this.meshInfo = 'pixel map ready';
  }

  build() {
    Column({ space: 8 }) {
      Button('run drawing')
        .onClick(() => {
          this.runDrawing();
        })
      Text('matrix: ' + this.matrixInfo)
      Text('effect: ' + this.effectInfo)
      Text('mesh: ' + this.meshInfo)
      Text('blurred text')
        .visualEffect(this.effect)
        .width('80%')
        .height(40)
        .backgroundColor('#445566')
      NodeContainer(this.meshController)
        .width(120)
        .height(120)
        .backgroundColor('#223333')
    }
    .width('100%')
    .padding(12)
  }
}
