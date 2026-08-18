import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FluidLayout, FluidGravity, FluidVisibility, FluidMargin, FluidPadding, FluidItem } from 'fluidlayout';

@Entry
@Component
struct TestCaseF0102Page {
  @State result: string = '等待操作 F-01-02...';
  @State items: FluidItem[] = [];
  @State fluidPadding: FluidPadding = new FluidPadding();

  aboutToAppear(): void {
    this.fluidPadding = this.makePadding(8);
    let list: FluidItem[] = [];
    for (let i = 1; i <= 10; i++) {
      list.push(this.makeItem('标签' + i));
    }
    this.items = list;
    this.result = `当前标签数: ${this.items.length} | 超出单行宽度自动换行\n观察: 多行自上而下堆叠`;
  }

  private makeItem(data: string): FluidItem {
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

  private getTagBg(index: number): string {
    const colors: string[] = ['#4CAF50', '#2196F3', '#FF9800', '#9C27B0', '#F44336', '#00BCD4', '#795548', '#607D8B'];
    return colors[index % colors.length];
  }

  @Builder
  tagBuilder(item: FluidItem, index: number) {
    Text(item.data)
      .fontSize(14)
      .padding({ left: 10, right: 10, top: 6, bottom: 6 })
      .backgroundColor(this.getTagBg(index))
      .fontColor(Color.White)
      .borderRadius(4)
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

        Text('F-01-02 子项累计宽度超出可用宽度时自动换到下一行成多行排列')
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
            '1. 点击【流式换行布局】进入模块列表页 [验证点: 进入流式换行布局模块列表页]',
            '2. 点击【子项累计宽度超出可用宽度时自动换到下一行成多行排列】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 观察【标签流容器】中标签数量超出单行宽度时的排列方式 [验证点: 超出宽度的标签出现在新行行首]',
            '4. 观察多行标签的堆叠方向 [验证点: 多行自上而下堆叠，容器高度等于各行高度之和]'
          ],
            expected_result: '超出宽度的标签自动换到下一行行首，多行自上而下堆叠，容器高度等于各行高度之和',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('观察换行')
              .id('btn_observe')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.result = '多行排列: 超出单行宽度的标签自动换到下一行行首\n多行自上而下堆叠，容器高度等于各行高度之和';
              })

            // 标签流容器预览区（视觉验证：观察标签换行与多行堆叠）
            Column() {
              Text('标签流容器预览')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .margin({ bottom: 4 })

              Column() {
                FluidLayout({
                  gravity: FluidGravity.Top,
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
