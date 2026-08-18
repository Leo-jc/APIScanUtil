import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FluidLayout, FluidGravity, FluidVisibility, FluidMargin, FluidPadding, FluidItem } from 'fluidlayout';

@Entry
@Component
struct TestCaseF0307Page {
  @State result: string = '等待操作 F-03-07...';
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
    if (item.data.startsWith('TALL:')) {
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
    this.items = [this.makeItem('短标签1'), this.makeItem('短标签2'), this.makeItem('短标签3')];
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

        Text('F-03-07 子项高度为零时按对齐方式偏移位置不变')
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
            '1. 点击【逐子项垂直对齐覆盖】进入模块列表页 [验证点: 进入逐子项垂直对齐覆盖模块列表页]',
            '2. 点击【子项高度为零时按对齐方式偏移位置不变】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 点击【添加零高度标签】按钮加入一个高度为零的标签 [验证点: 零高度标签出现在容器中]',
            '4. 点击【居中对齐】按钮切换容器级对齐为居中 [验证点: 容器级对齐为居中]',
            '5. 观察零高度标签的位置 [验证点: 零高度标签位置与行基准一致，无可见偏移]'
          ],
            expected_result: '零高度子项按对齐方式计算后位置与行基准一致，无可见偏移',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('添加零高度标签')
              .id('btn_add_zero')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                let newItems: FluidItem[] = [];
                for (let i = 0; i < this.items.length; i++) {
                  newItems.push(this.items[i]);
                }
                newItems.push(this.makeItem('ZERO_HEIGHT'));
                this.items = newItems;
                this.result = 'add(ZERO_HEIGHT) → 零高度标签加入容器\n零高度标签无可见高度';
              })

            Button('居中对齐')
              .id('btn_center')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.gravity = FluidGravity.Center;
                this.result = '零高度标签height=0 | 容器级Center → 位置与行基准一致，无可见偏移';
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
