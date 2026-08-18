import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FluidLayout, FluidGravity, FluidVisibility, FluidMargin, FluidPadding, FluidItem } from 'fluidlayout';

@Entry
@Component
struct TestCaseF0101Page {
  @State result: string = '等待操作 F-01-01...';
  @State currentGravity: FluidGravity = FluidGravity.Top;
  @State items: FluidItem[] = [];

  aboutToAppear(): void {
    // 少量标签，累计宽度不超出可用宽度 → 保持单行
    this.items = [
      this.makeItem('标签A'),
      this.makeItem('标签B'),
      this.makeItem('标签C')
    ];
    this.result = `当前标签数: ${this.items.length} | 对齐: ${this.gravityName(this.currentGravity)}\n观察: 标签在同一行内从左到右紧邻排列`;
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

        Text('F-01-01 子项从左到右依次排列且累计宽度不超出可用宽度时保持单行')
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
            '2. 点击【子项从左到右依次排列且累计宽度不超出可用宽度时保持单行】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 观察【标签流容器】中少量标签的排列方式 [验证点: 标签在同一行内从左到右紧邻排列]',
            '4. 观察【容器高度】与单行标签高度的关系 [验证点: 容器高度等于单行标签高度]'
          ],
            expected_result: '所有标签在同一行内从左到右紧邻排列，不换行，容器高度等于单行标签高度',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('观察排列')
              .id('btn_observe')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.result = '单行排列: 3个标签在同一行从左到右紧邻排列\n容器高度等于单行标签高度';
              })

            // 标签流容器预览区（视觉验证：观察标签排列与容器高度）
            Column() {
              Text('标签流容器预览')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .margin({ bottom: 4 })

              Column() {
                FluidLayout({
                  gravity: this.currentGravity,
                  items: this.items,
                  fluidPadding: new FluidPadding(),
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
