import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FluidLayout, FluidGravity, FluidVisibility, FluidMargin, FluidPadding, FluidItem } from 'fluidlayout';

@Entry
@Component
struct TestCaseF0603Page {
  @State result: string = '等待操作 F-06-03...';
  @State items: FluidItem[] = [];
  @State gravity: FluidGravity = FluidGravity.Top;
  @State fluidPadding: FluidPadding = new FluidPadding();

  aboutToAppear(): void {
    this.fluidPadding = this.makePadding(8);
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

  private visDesc(v: FluidVisibility): string {
    if (v === FluidVisibility.Gone) { return 'Gone(不参与)'; }
    if (v === FluidVisibility.Hidden) { return 'Hidden(占位不可见)'; }
    return 'Visible(可见)';
  }

  private cloneWithVisibility(targetIndex: number, vis: FluidVisibility): FluidItem[] {
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
      item.visibility = (i === targetIndex) ? vis : src.visibility;
      newItems.push(item);
    }
    return newItems;
  }

  private buildResult(): string {
    let aVis: string = this.items.length > 0 ? this.visDesc(this.items[0].visibility) : 'Gone(不参与)';
    let bVis: string = this.items.length > 1 ? this.visDesc(this.items[1].visibility) : 'Hidden(占位不可见)';
    return '标签A=' + aVis + ' | 标签B=' + bVis + ' | 其余标签正常排列';
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

        Text('F-06-03 部分子项隐藏时其余子项正常参与排列')
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
            '1. 点击【可见性处理】进入模块列表页 [验证点: 进入可见性处理模块列表页]',
            '2. 点击【部分子项隐藏时其余子项正常参与排列】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 点击【隐藏标签A】与【占位隐藏标签B】按钮分别隐藏不同标签 [验证点: 标签A不占位隐藏，标签B占位隐藏]',
            '4. 观察未隐藏标签的排列方式 [验证点: 未隐藏的标签按正常规则排列]',
            '5. 观察隐藏标签的表现 [验证点: 不占位隐藏标签不参与，占位隐藏标签仅占位]'
          ],
            expected_result: '未隐藏的子项按正常规则排列，隐藏子项不参与或仅占位',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('隐藏标签A')
              .id('btn_hide_a')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.items = this.cloneWithVisibility(0, FluidVisibility.Gone);
                this.result = this.buildResult();
              })

            Button('占位隐藏标签B')
              .id('btn_hide_b')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.items = this.cloneWithVisibility(1, FluidVisibility.Hidden);
                this.result = this.buildResult();
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
                .borderRadius(8)
            }
            .width('100%')
            .backgroundColor('#F5F5F5')
            .borderRadius(8)
            .padding(8)
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
