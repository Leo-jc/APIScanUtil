import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FluidLayout, FluidGravity, FluidVisibility, FluidMargin, FluidPadding, FluidItem } from 'fluidlayout';

@Entry
@Component
struct TestCaseF0402Page {
  @State result: string = '等待操作 F-04-02...';
  @State items: FluidItem[] = [];
  @State gravity: FluidGravity = FluidGravity.Top;
  @State fluidPadding: FluidPadding = new FluidPadding();
  @State inputPadding: string = '16';

  private makeItem(text: string): FluidItem {
    let item: FluidItem = new FluidItem();
    item.data = text;
    return item;
  }

  private makePadding(all: number): FluidPadding {
    let p: FluidPadding = new FluidPadding();
    p.left = all; p.top = all; p.right = all; p.bottom = all;
    return p;
  }

  @Builder
  renderTag(item: FluidItem, index: number) {
    Text(item.data)
      .fontSize(14)
      .fontColor('#333333')
      .padding({ left: 12, right: 12, top: 6, bottom: 6 })
      .backgroundColor('#E3F2FD')
      .borderRadius(12)
  }

  aboutToAppear(): void {
    this.items = [
      this.makeItem('标签1'),
      this.makeItem('标签2'),
      this.makeItem('标签3'),
      this.makeItem('标签4'),
      this.makeItem('标签5'),
      this.makeItem('标签6'),
      this.makeItem('标签7'),
      this.makeItem('标签8')
    ];
    this.fluidPadding = this.makePadding(0);
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

        Text('F-04-02 容器内边距使内容相对边缘缩进并参与换行判定')
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
            '1. 点击【外边距与内边距】进入模块列表页 [验证点: 进入外边距与内边距模块列表页]',
            '2. 点击【容器内边距使内容相对边缘缩进并参与换行判定】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 在【内边距】输入框中输入"16" [验证点: 内边距为16]',
            '4. 观察【标签流容器】中内容相对容器边缘的位置 [验证点: 内容相对容器四边留有内边距大小的缩进]',
            '5. 观察换行位置是否按扣除内边距后的宽度计算 [验证点: 换行判定按扣除内边距后的宽度计算]'
          ],
            expected_result: '内容相对容器四边留有内边距大小的缩进，换行判定按扣除内边距后的宽度计算',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('内边距')
              .fontSize(14)
              .margin({ bottom: 4 })
            TextInput({ placeholder: '输入内边距值', text: this.inputPadding })
              .id('input_padding')
              .type(InputType.Normal)
              .width('100%')
              .margin({ bottom: 8 })
              .onChange((value: string) => {
                this.inputPadding = value;
              })
            Button('应用内边距')
              .id('btn_set_padding')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                let val: number = Number.parseInt(this.inputPadding);
                if (isNaN(val)) {
                  this.result = '请输入有效数字';
                  return;
                }
                this.fluidPadding = this.makePadding(val);
                this.result = `内边距: ${val}vp | 内容四边缩进，换行按扣除内边距后的宽度计算`;
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
