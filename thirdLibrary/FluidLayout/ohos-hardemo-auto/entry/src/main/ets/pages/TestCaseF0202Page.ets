import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FluidLayout, FluidGravity, FluidVisibility, FluidMargin, FluidPadding, FluidItem } from 'fluidlayout';

@Entry
@Component
struct TestCaseF0202Page {
  @State result: string = '等待操作 F-02-02...';
  @State items: FluidItem[] = [];
  @State currentGravity: FluidGravity = FluidGravity.Top;
  @State fluidPadding: FluidPadding = new FluidPadding();

  aboutToAppear(): void {
    this.fluidPadding = this.makePadding(8);
    this.items = [
      this.makeItem('标签A'),
      this.makeTallItem('tall:高标签B'),
      this.makeItem('标签C'),
      this.makeTallItem('tall:高标签D'),
      this.makeItem('标签E'),
      this.makeTallItem('tall:高标签F'),
      this.makeItem('标签G')
    ];
    this.result = `对齐方式: ${this.gravityName(this.currentGravity)} | 当前为顶部对齐，点击居中对齐切换`;
  }

  private gravityName(g: FluidGravity): string {
    if (g === FluidGravity.Top) {
      return 'Top(顶部)';
    }
    if (g === FluidGravity.Center) {
      return 'Center(居中)';
    }
    return 'Bottom(底部)';
  }

  private getTagBg(index: number): string {
    const colors: string[] = ['#4CAF50', '#2196F3', '#FF9800', '#9C27B0', '#F44336', '#00BCD4', '#795548', '#607D8B'];
    return colors[index % colors.length];
  }

  private makeItem(data: string): FluidItem {
    let item: FluidItem = new FluidItem();
    item.data = data;
    item.gravity = null;
    item.margin = new FluidMargin();
    item.visibility = FluidVisibility.Visible;
    return item;
  }

  private makeTallItem(data: string): FluidItem {
    let item: FluidItem = new FluidItem();
    item.data = data;
    item.gravity = null;
    item.margin = new FluidMargin();
    item.visibility = FluidVisibility.Visible;
    return item;
  }

  private makePadding(all: number): FluidPadding {
    let p: FluidPadding = new FluidPadding();
    p.left = all;
    p.top = all;
    p.right = all;
    p.bottom = all;
    return p;
  }

  @Builder
  tagBuilder(item: FluidItem, index: number) {
    if (item.data.startsWith('tall:')) {
      Text(item.data.substring(5))
        .fontSize(14)
        .padding({ left: 10, right: 10, top: 18, bottom: 18 })
        .backgroundColor(this.getTagBg(index))
        .fontColor(Color.White)
        .borderRadius(4)
    } else {
      Text(item.data)
        .fontSize(14)
        .padding({ left: 10, right: 10, top: 6, bottom: 6 })
        .backgroundColor(this.getTagBg(index))
        .fontColor(Color.White)
        .borderRadius(4)
    }
  }

  build() {
    Column() {
      // 标题栏（固定）
      Row() {
        Image($r('sys.media.ohos_ic_public_arrow_left'))
          .width(24)
          .height(24)
          .fillColor('#333333')
          .onClick(() => {
            router.back();
          })
          .margin({ left: 16 })

        Text('F-02-02 容器级对齐为居中时各行子项在行内垂直居中')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12, right: 16, top: 12, bottom: 12 })
          .layoutWeight(1)
      }
      .width('100%')
      .backgroundColor('#F1F3F5')

      // 可滚动区域（测试信息 + Actions）
      Scroll() {
        Column() {
          // ╔─ FIXED SECTION: 测试信息区（使用 TestInfoPanel 组件）─ 禁止修改 ─╗
          TestInfoPanel({
            level: 'L0',
            preconditions: '应用已启动',
            test_steps: [
            '1. 点击【容器级垂直对齐】进入模块列表页 [验证点: 进入容器级垂直对齐模块列表页]',
            '2. 点击【容器级对齐为居中时各行子项在行内垂直居中】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 点击【居中对齐】按钮切换对齐方式为居中 [验证点: 对齐方式切换为居中]',
            '4. 观察【标签流容器】中各行标签的垂直位置 [验证点: 每行内标签在行高范围内垂直居中，上下间距相等]'
          ],
            expected_result: '每行内标签在行高范围内垂直居中，上下间距相等',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('居中对齐')
              .id('btn_center')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.currentGravity = FluidGravity.Center;
                this.result = `对齐方式: ${this.gravityName(this.currentGravity)} | 各行标签在行高范围内垂直居中`;
              })

            // 标签流容器预览区（视觉验证：各行标签在行高范围内垂直居中）
            Column() {
              Text('标签流容器预览')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .margin({ bottom: 4 })

              Column() {
                FluidLayout({
                  gravity: this.currentGravity,
                  items: this.items,
                  fluidPadding: this.fluidPadding,
                  itemBuilder: (item: FluidItem, index: number): void => {
                    this.tagBuilder(item, index);
                  }
                })
                .width('100%')
              }
              .width('100%')
              .backgroundColor('#FAFAFA')
              .border({ width: 1, color: '#CCCCCC' })
              .borderRadius(4)
              .margin({ bottom: 8 })
            }
            .width('100%')
          }
          .padding({ left: 12, right: 12, top: 12, bottom: 12 })
          .width('100%')
        }
      }
      .width('100%')
      .layoutWeight(1)
      .backgroundColor('#F1F3F5')
      .scrollBar(BarState.Auto)
      .scrollBarWidth(4)
      .scrollBarColor('#CCCCCC')

      ResultPanel({ result: this.result })
        .height(120)
    }
    .width('100%')
    .height('100%')
  }
}
