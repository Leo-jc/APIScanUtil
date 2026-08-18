import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FluidLayout, FluidGravity, FluidVisibility, FluidMargin, FluidPadding, FluidItem } from 'fluidlayout';

@Entry
@Component
struct TestCaseF0204Page {
  @State result: string = '等待操作 F-02-04...';
  @State items: FluidItem[] = [];
  @State currentGravity: FluidGravity = FluidGravity.Top;
  @State fluidPadding: FluidPadding = new FluidPadding();
  @State clickCount: number = 0;

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

        Text('F-02-04 切换到当前已是对齐方式时布局保持不变不触发重排')
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
            level: 'L1',
            preconditions: '应用已启动',
            test_steps: [
            '1. 点击【容器级垂直对齐】进入模块列表页 [验证点: 进入容器级垂直对齐模块列表页]',
            '2. 点击【切换到当前已是对齐方式时布局保持不变不触发重排】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 点击【顶部对齐】按钮确认当前对齐为顶部 [验证点: 当前对齐为顶部]',
            '4. 再次点击【顶部对齐】按钮传入相同值 [验证点: 无视觉变化]',
            '5. 观察【标签流容器】中标签位置 [验证点: 切换前后标签位置完全一致]'
          ],
            expected_result: '切换前后布局视觉无任何变化，子项位置完全一致',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text(`当前对齐: ${this.gravityName(this.currentGravity)} | 已点击次数: ${this.clickCount}`)
              .fontSize(13)
              .fontColor('#666666')
              .margin({ bottom: 8 })

            Button('顶部对齐')
              .id('btn_top')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.clickCount = this.clickCount + 1;
                this.currentGravity = FluidGravity.Top;
                if (this.clickCount === 1) {
                  this.result = '第1次点击顶部对齐 | 当前已为Top，布局无变化';
                } else {
                  this.result = `第${this.clickCount}次点击顶部对齐 | 传入相同值，布局保持不变`;
                }
              })

            // 标签流容器预览区（视觉验证：切换前后标签位置完全一致）
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
