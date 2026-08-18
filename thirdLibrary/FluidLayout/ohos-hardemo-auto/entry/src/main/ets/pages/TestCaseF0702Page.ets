import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FluidLayout, FluidGravity, FluidVisibility, FluidMargin, FluidPadding, FluidItem } from 'fluidlayout';

@Entry
@Component
struct TestCaseF0702Page {
  @State result: string = '等待操作 F-07-02...';
  @State items: FluidItem[] = [];
  @State gravity: FluidGravity = FluidGravity.Top;
  @State fluidPadding: FluidPadding = new FluidPadding();
  @State isFixedSize: boolean = true;
  @State nextTagId: number = 0;

  aboutToAppear(): void {
    this.fluidPadding = this.makePadding(8);
    let list: FluidItem[] = [];
    list.push(this.makeItem('标签1'));
    list.push(this.makeItem('标签2'));
    list.push(this.makeItem('标签3'));
    this.items = list;
    this.nextTagId = 3;
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

  private buildResult(): string {
    if (this.isFixedSize) {
      return '模式: 固定尺寸 | 标签数: ' + this.items.length + ' | 容器高度=120vp(固定)';
    }
    return '模式: 自适应 | 标签数: ' + this.items.length + ' | 容器高度=内容计算值+内边距，随标签数自动伸缩';
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

        Text('F-07-02 容器宽高自适应内容时取内容计算值加内边距')
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
            '1. 点击【尺寸模式自适应】进入模块列表页 [验证点: 进入尺寸模式自适应模块列表页]',
            '2. 点击【容器宽高自适应内容时取内容计算值加内边距】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 点击【自适应尺寸】按钮将容器宽高切换为自适应模式 [验证点: 容器宽高为自适应模式]',
            '4. 观察【标签流容器】的尺寸随内容变化 [验证点: 容器宽高等于内容计算值加内边距]',
            '5. 点击【添加标签】按钮增加标签数量 [验证点: 标签数量增加]',
            '6. 观察容器尺寸是否随内容自动伸缩 [验证点: 容器随内容多少自动伸缩]'
          ],
            expected_result: '容器宽高等于内容计算值加内边距，随内容多少自动伸缩',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('自适应尺寸')
              .id('btn_auto')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.isFixedSize = false;
                this.result = this.buildResult();
              })

            Button('添加标签')
              .id('btn_add')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.nextTagId += 1;
                let newItems: FluidItem[] = [];
                for (let i = 0; i < this.items.length; i++) {
                  newItems.push(this.items[i]);
                }
                newItems.push(this.makeItem('标签' + this.nextTagId));
                this.items = newItems;
                this.result = this.buildResult();
              })

            Text('标签流容器预览')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 8, bottom: 4 })

            if (this.isFixedSize) {
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
                  .height(120)
                  .backgroundColor('#FAFAFA')
                  .borderRadius(8)
              }
              .width('100%')
              .backgroundColor('#F5F5F5')
              .borderRadius(8)
              .padding(8)
            } else {
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
