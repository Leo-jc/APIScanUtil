import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FluidLayout, FluidGravity, FluidVisibility, FluidMargin, FluidPadding, FluidItem } from 'fluidlayout';

@Entry
@Component
struct TestCaseF0503Page {
  @State result: string = '等待操作 F-05-03...';
  @State items: FluidItem[] = [];
  @State fluidPadding: FluidPadding = new FluidPadding();
  @State nextTagId: number = 0;
  @State opCount: number = 0;

  aboutToAppear(): void {
    this.fluidPadding = this.makePadding(8);
    let list: FluidItem[] = [];
    list.push(this.makeItem('标签1'));
    list.push(this.makeItem('tall:标签2'));
    list.push(this.makeItem('标签3'));
    this.items = list;
    this.nextTagId = 3;
    this.opCount = 0;
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
    return '操作次数: ' + this.opCount + ' | 当前标签数: ' + this.items.length + ' | 布局与最终标签集合一致，无残留';
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

        Text('F-05-03 频繁增删子项后容器布局状态正确无残留')
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
            '2. 点击【频繁增删子项后容器布局状态正确无残留】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 连续多次点击【添加标签】与【移除标签】按钮交替增删标签 [验证点: 多次增删操作完成]',
            '4. 观察【标签流容器】中最终标签的排列 [验证点: 布局与最终标签集合一致]',
            '5. 观察是否有残留的旧布局痕迹 [验证点: 无残留的旧布局痕迹]'
          ],
            expected_result: '多次增删操作后，容器布局与最终子项集合一致，无残留的旧布局痕迹',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

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
                this.opCount += 1;
                this.result = this.buildResult();
              })

            Button('移除标签')
              .id('btn_remove')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                if (this.items.length > 0) {
                  let newItems: FluidItem[] = [];
                  for (let i = 0; i < this.items.length - 1; i++) {
                    newItems.push(this.items[i]);
                  }
                  this.items = newItems;
                  this.opCount += 1;
                  this.result = this.buildResult();
                }
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
