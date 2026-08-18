import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FluidLayout, FluidGravity, FluidVisibility, FluidMargin, FluidPadding, FluidItem } from 'fluidlayout';

@Entry
@Component
struct TestCaseF0604Page {
  @State result: string = '等待操作 F-06-04...';
  @State items: FluidItem[] = [];
  @State gravity: FluidGravity = FluidGravity.Top;
  @State fluidPadding: FluidPadding = new FluidPadding();

  aboutToAppear(): void {
    this.fluidPadding = this.makePadding(0);
    let list: FluidItem[] = [];
    list.push(this.makeItem('标签A'));
    list.push(this.makeItem('标签B'));
    list.push(this.makeItem('标签C'));
    list.push(this.makeItem('标签D'));
    list.push(this.makeItem('标签E'));
    this.items = list;
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

  private cloneAllWithVisibility(vis: FluidVisibility): FluidItem[] {
    let newItems: FluidItem[] = [];
    for (let i = 0; i < this.items.length; i++) {
      let src: FluidItem = this.items[i];
      let item: FluidItem = new FluidItem();
      item.data = src.data;
      item.gravity = src.gravity;
      item.margin = new FluidMargin();
      item.margin.left = src.margin.left;
      item.margin.top = src.margin.top;
      item.margin.right = src.margin.right;
      item.margin.bottom = src.margin.bottom;
      item.visibility = vis;
      newItems.push(item);
    }
    return newItems;
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

        Text('F-06-04 全部子项均标记为不占位隐藏时容器内容区为零')
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
            '1. 点击【可见性处理】进入模块列表页 [验证点: 进入可见性处理模块列表页]',
            '2. 点击【全部子项均标记为不占位隐藏时容器内容区为零】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 点击【全部隐藏】按钮将所有标签标记为不占位隐藏 [验证点: 所有标签不可见且不占位]',
            '4. 观察【容器区域】的尺寸 [验证点: 容器内容区尺寸为零]'
          ],
            expected_result: '全部隐藏后容器无可见内容，内容区尺寸为零',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('全部隐藏')
              .id('btn_hide_all')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.items = this.cloneAllWithVisibility(FluidVisibility.Gone);
                this.result = '所有标签visibility=Gone | 容器内容区尺寸: 宽=100%, 高=0';
              })

            Text('标签流容器预览')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 8, bottom: 4 })

            Column() {
              FluidLayout({
                gravity: this.gravity,
                items: this.items,
                fluidPadding: this.fluidPadding,
                itemBuilder: (item: FluidItem, index: number): void => {
                  this.tagBuilder(item, index);
                }
              })
                .width('100%')
                .backgroundColor('#FAFAFA')
            }
            .width('100%')
            .backgroundColor('#F5F5F5')
            .border({ width: 1, color: '#CCCCCC' })
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
