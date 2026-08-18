import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FluidLayout, FluidGravity, FluidVisibility, FluidMargin, FluidPadding, FluidItem } from 'fluidlayout';

@Entry
@Component
struct TestCaseF0304Page {
  @State result: string = '等待操作 F-03-04...';
  @State items: FluidItem[] = [];
  @State gravity: FluidGravity = FluidGravity.Top;
  @State fluidPadding: FluidPadding = new FluidPadding();

  private makeItem(text: string): FluidItem {
    let item: FluidItem = new FluidItem();
    item.data = text;
    return item;
  }

  private makeTallItem(text: string): FluidItem {
    let item: FluidItem = new FluidItem();
    item.data = 'TALL:' + text;
    return item;
  }

  private makeSuperTallItem(text: string): FluidItem {
    let item: FluidItem = new FluidItem();
    item.data = 'SUPER:' + text;
    return item;
  }

  private makePadding(all: number): FluidPadding {
    let p: FluidPadding = new FluidPadding();
    p.left = all; p.top = all; p.right = all; p.bottom = all;
    return p;
  }

  private rebuildItems(items: FluidItem[], mutator: (item: FluidItem, index: number) => void): FluidItem[] {
    let newItems: FluidItem[] = [];
    for (let i = 0; i < items.length; i++) {
      let it: FluidItem = new FluidItem();
      it.data = items[i].data;
      it.gravity = items[i].gravity;
      it.margin = items[i].margin;
      it.visibility = items[i].visibility;
      mutator(it, i);
      newItems.push(it);
    }
    return newItems;
  }

  @Builder
  renderTag(item: FluidItem, index: number) {
    if (item.data.startsWith('SUPER:')) {
      Text(item.data.substring(6))
        .fontSize(24)
        .fontColor('#333333')
        .padding({ left: 16, right: 16, top: 56, bottom: 56 })
        .backgroundColor('#FFE0B2')
        .borderRadius(12)
    } else if (item.data.startsWith('TALL:')) {
      Text(item.data.substring(5))
        .fontSize(24)
        .fontColor('#333333')
        .padding({ left: 16, right: 16, top: 36, bottom: 36 })
        .backgroundColor('#FFF3E0')
        .borderRadius(12)
    } else if (item.data === 'ZERO_HEIGHT') {
      Column() {}.width(40).height(0)
    } else {
      Text(item.data)
        .fontSize(14)
        .fontColor('#333333')
        .padding({ left: 12, right: 12, top: 6, bottom: 6 })
        .backgroundColor('#E3F2FD')
        .borderRadius(12)
    }
  }

  aboutToAppear(): void {
    this.items = [this.makeItem('短标签1'), this.makeTallItem('高标签B'), this.makeSuperTallItem('更高参照D')];
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

        Text('F-03-04 子项单独指定底部对齐时覆盖容器默认按行底对齐')
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
            '1. 点击【逐子项垂直对齐覆盖】进入模块列表页 [验证点: 进入逐子项垂直对齐覆盖模块列表页]',
            '2. 点击【子项单独指定底部对齐时覆盖容器默认按行底对齐】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 点击【顶部对齐】按钮将容器级对齐切换为顶部 [验证点: 容器级对齐为顶部]',
            '4. 点击【指定标签底部对齐】按钮为指定标签单独指定底部对齐 [验证点: 指定标签单独指定底部对齐]',
            '5. 观察指定标签的垂直位置 [验证点: 该标签底部对齐行底，独立于容器级顶部对齐]'
          ],
            expected_result: '该子项底部对齐行底，独立于容器级对齐',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('顶部对齐')
              .id('btn_top')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.gravity = FluidGravity.Top;
                this.result = '容器级: Top | 标签B gravity=null → 回退到容器级顶部对齐';
              })

            Button('指定标签底部对齐')
              .id('btn_item_bottom')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.items = this.rebuildItems(this.items, (it: FluidItem, index: number) => {
                  if (index === 1) {
                    it.gravity = FluidGravity.Bottom;
                  }
                });
                this.result = '容器级: Top | 标签B gravity=Bottom → 覆盖容器，贴行底对齐';
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
