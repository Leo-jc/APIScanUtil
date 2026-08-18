import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FluidLayout, FluidGravity, FluidVisibility, FluidMargin, FluidPadding, FluidItem } from 'fluidlayout';

@Entry
@Component
struct TestCaseF0404Page {
  @State result: string = '等待操作 F-04-04...';
  @State items: FluidItem[] = [];
  @State gravity: FluidGravity = FluidGravity.Top;
  @State fluidPadding: FluidPadding = new FluidPadding();
  @State inputMargin: string = '0';

  private makeMarginItem(text: string, margin: number): FluidItem {
    let item: FluidItem = new FluidItem();
    item.data = text;
    let m: FluidMargin = new FluidMargin();
    m.left = margin; m.top = margin; m.right = margin; m.bottom = margin;
    item.margin = m;
    return item;
  }

  private makePadding(all: number): FluidPadding {
    let p: FluidPadding = new FluidPadding();
    p.left = all; p.top = all; p.right = all; p.bottom = all;
    return p;
  }

  private applyMarginToAll(items: FluidItem[], margin: number): FluidItem[] {
    let newItems: FluidItem[] = [];
    for (let i = 0; i < items.length; i++) {
      let it: FluidItem = new FluidItem();
      it.data = items[i].data;
      it.gravity = items[i].gravity;
      it.visibility = items[i].visibility;
      let m: FluidMargin = new FluidMargin();
      m.left = margin; m.top = margin; m.right = margin; m.bottom = margin;
      it.margin = m;
      newItems.push(it);
    }
    return newItems;
  }

  @Builder
  renderTag(item: FluidItem, index: number) {
    Text(item.data)
      .fontSize(14)
      .fontColor('#333333')
      .padding({ left: 12, right: 12, top: 6, bottom: 6 })
      .backgroundColor('#E3F2FD')
      .borderRadius(12)
  }

  aboutToAppear(): void {
    this.items = [
      this.makeMarginItem('标签1', 10),
      this.makeMarginItem('标签2', 10),
      this.makeMarginItem('标签3', 10),
      this.makeMarginItem('标签4', 10),
      this.makeMarginItem('标签5', 10)
    ];
    this.fluidPadding = this.makePadding(8);
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

        Text('F-04-04 子项外边距为零时项间无额外间距')
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
            level: 'L2',
            preconditions: '应用已启动',
            test_steps: [
            '1. 点击【外边距与内边距】进入模块列表页 [验证点: 进入外边距与内边距模块列表页]',
            '2. 点击【子项外边距为零时项间无额外间距】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 在【外边距】输入框中输入"0" [验证点: 外边距为0]',
            '4. 观察【标签流容器】中标签间的间距 [验证点: 标签间紧邻无间距]',
            '5. 观察行高与标签高度的关系 [验证点: 行高仅取标签自身高度]'
          ],
            expected_result: '子项间紧邻无间距，行高仅取子项自身高度',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('外边距')
              .fontSize(14)
              .margin({ bottom: 4 })
            TextInput({ placeholder: '输入外边距值', text: this.inputMargin })
              .id('input_margin')
              .type(InputType.Normal)
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((value: string) => {
                this.inputMargin = value;
              })
            Button('应用外边距')
              .id('btn_set_margin')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                let val: number = Number.parseInt(this.inputMargin);
                if (isNaN(val)) {
                  this.result = '请输入有效数字';
                  return;
                }
                this.items = this.applyMarginToAll(this.items, val);
                this.result = `外边距: ${val}vp | 标签间紧邻无间距，行高仅取标签自身高度`;
              })

            Text('标签流容器预览')
              .fontSize(14).fontWeight(FontWeight.Medium).margin({ bottom: 4 })
            Column() {
              FluidLayout({
                gravity: this.gravity,
                items: this.items,
                fluidPadding: this.fluidPadding,
                itemBuilder: (item: FluidItem, index: number) => {
                  this.renderTag(item, index)
                }
              })
                .width('100%').backgroundColor('#FAFAFA').borderRadius(8)
            }
            .width('100%').backgroundColor('#F5F5F5').borderRadius(8).padding(8)
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
