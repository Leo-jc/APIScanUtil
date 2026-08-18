import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FluidLayout, FluidGravity, FluidVisibility, FluidMargin, FluidPadding, FluidItem } from 'fluidlayout';

@Entry
@Component
struct TestCaseF0104Page {
  @State result: string = '等待操作 F-01-04...';
  @State items: FluidItem[] = [];
  @State fluidPadding: FluidPadding = new FluidPadding();
  @State inputText: string = '';

  aboutToAppear(): void {
    this.fluidPadding = this.makePadding(8);
    this.items = [
      this.makeItem('标签A'),
      this.makeItem('标签B'),
      this.makeItem('标签C')
    ];
    this.result = `当前标签数: ${this.items.length} | 在输入框输入超长文本后点击添加\n观察: 超长标签独占一行，行宽溢出容器边界`;
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
      .maxLines(1)
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

        Text('F-01-04 单个子项宽度超过可用宽度时独占一行且行宽溢出容器边界')
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
            '1. 点击【流式换行布局】进入模块列表页 [验证点: 进入流式换行布局模块列表页]',
            '2. 点击【单个子项宽度超过可用宽度时独占一行且行宽溢出容器边界】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 在【标签文本】输入框中输入一段超长文本 [验证点: 超长文本输入完成]',
            '4. 点击【添加标签】按钮将超长标签加入容器 [验证点: 超长标签出现在容器中]',
            '5. 观察超长标签的排列方式 [验证点: 该标签独占一行且行宽溢出容器边界]'
          ],
            expected_result: '该子项独占一行，行宽大于可用宽度，子项视觉上超出容器边界',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('标签文本')
              .fontSize(14)
              .margin({ bottom: 4 })

            TextInput({ placeholder: '输入超长文本', text: this.inputText })
              .id('input_tag_text')
              .fontSize(14)
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((v: string) => {
                this.inputText = v;
              })

            Button('添加标签')
              .id('btn_add')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                if (this.inputText.length > 0) {
                  let newItems: FluidItem[] = [...this.items];
                  newItems.push(this.makeItem(this.inputText));
                  this.items = newItems;
                  this.result = `已添加超长标签 | 该标签独占一行，行宽溢出容器边界\n当前标签数: ${this.items.length}`;
                }
              })

            // 标签流容器预览区（视觉验证：超长标签独占一行且溢出容器边界）
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
                .clip(false)
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
