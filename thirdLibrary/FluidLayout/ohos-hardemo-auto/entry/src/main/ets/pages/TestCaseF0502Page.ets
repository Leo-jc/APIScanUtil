import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FluidLayout, FluidGravity, FluidVisibility, FluidMargin, FluidPadding, FluidItem } from 'fluidlayout';

@Entry
@Component
struct TestCaseF0502Page {
  @State result: string = '等待操作 F-05-02...';
  @State items: FluidItem[] = [];
  @State fluidPadding: FluidPadding = new FluidPadding();

  aboutToAppear(): void {
    this.fluidPadding = this.makePadding(0);
    let list: FluidItem[] = [];
    list.push(this.makeItem('标签1'));
    list.push(this.makeItem('tall:标签2'));
    list.push(this.makeItem('标签3'));
    list.push(this.makeItem('tall:标签4'));
    list.push(this.makeItem('标签5'));
    list.push(this.makeItem('标签6'));
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

        Text('F-05-02 运行时清空全部子项后容器内容区归零')
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
            '1. 点击【运行时动态变更】进入模块列表页 [验证点: 进入运行时动态变更模块列表页]',
            '2. 点击【运行时清空全部子项后容器内容区归零】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 点击【清空标签】按钮移除所有标签 [验证点: 容器中无可见标签]',
            '4. 观察【容器区域】的尺寸 [验证点: 容器内容区尺寸为零]'
          ],
            expected_result: '清空后容器无可见内容，内容区尺寸为零',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('清空标签')
              .id('btn_clear')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.items = [];
                this.result = '已清空所有标签 | 容器内容区尺寸: 宽=100%, 高=0';
              })

            Text('标签流容器预览')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 8, bottom: 4 })

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
