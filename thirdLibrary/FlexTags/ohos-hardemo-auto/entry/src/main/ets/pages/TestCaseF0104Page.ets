import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FlexTags, FlexTagsController, FlexTagsItemView, FlexTagsAdapter } from 'flex_tags';
import { TextTagAdapter } from '../demo/DemoModels';

/**
 * F-01-04 挂载数据源后替换为另一新数据源整体重渲染为新内容
 * 覆盖 API：setAdapter / getAdapter / notifyDataSetChanged
 */
@Entry
@Component
struct TestCaseF0104Page {
  @State result: string = '等待操作：点击挂载数据源A';
  @State currentSourceLabel: string = '空';
  @State tagCount: number = 0;
  private controller: FlexTagsController = new FlexTagsController();
  private currentAdapter: TextTagAdapter | null = null;
  private readonly sampleTagsA: string[] = ['军事', '实事', '明星'];
  private readonly sampleTagsB: string[] = ['美食', '旅游', '数码', '游戏'];

  @Builder
  renderTag(view: FlexTagsItemView): void {
    Text(view.tag)
      .fontSize(14)
      .fontColor('#333333')
      .backgroundColor('#F5F7FA')
      .borderRadius(16)
      .padding({ left: 12, right: 12, top: 6, bottom: 6 })
      .margin(6)
  }

  build(): void {
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

        Text('F-01-04 挂数据源后替换为另一新数据源整体重渲染为新内容')
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
            '1. 点击【标签弹性布局容器】进入模块列表页 [验证点: 进入模块列表页]',
            '2. 点击【挂载数据源后替换为另一新数据源整体重渲染为新内容】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 点击【挂载数据源A】按钮 [验证点: 数据源A挂载到容器]',
            '4. 观察【标签容器】显示数据源A的全部标签 [验证点: 容器内显示数据源A标签]',
            '5. 点击【替换为数据源B】按钮 [验证点: 数据源替换为数据源B]',
            '6. 观察【标签容器】标签整体替换为数据源B的内容 [验证点: 旧标签全部消失、显示数据源B标签]',
            '7. 观察【当前数据源】文本显示数据源B标识 [验证点: 当前数据源显示数据源B新实例]'
          ],
            expected_result: '替换为另一新数据源后容器标签整体替换为新数据源内容；旧标签全部消失；当前数据源显示新实例',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Row() {
              Button('挂载数据源A')
                .id('btn_mount_a')
                .layoutWeight(1)
                .onClick(() => {
                  this.mountAdapterA();
                })

              Button('替换为数据源B')
                .id('btn_replace_b')
                .layoutWeight(1)
                .margin({ left: 8 })
                .onClick(() => {
                  this.replaceAdapterB();
                })
            }
            .width('100%')

            // 预览区：FlexTags 容器真实渲染标签（渲染验证）
            Text('标签容器预览区')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 12, bottom: 4 })

            FlexTags({
              controller: this.controller,
              adapter: null,
              itemBuilder: (view: FlexTagsItemView): void => { this.renderTag(view); },
              options: {
                direction: FlexDirection.Row,
                wrap: FlexWrap.Wrap,
                justifyContent: FlexAlign.Start,
                alignItems: ItemAlign.Start,
                alignContent: FlexAlign.Start
              }
            })
              .id('flex_tags_container')
              .width('100%')
              .backgroundColor('#FFFFFF')
              .borderRadius(8)
              .padding(8)

            // 当前数据源标识
            Row() {
              Text('当前数据源: ')
                .fontSize(13)
                .fontColor('#666666')
              Text(this.currentSourceLabel)
                .id('txt_current_source')
                .fontSize(13)
                .fontColor('#333333')
                .fontWeight(FontWeight.Medium)
            }
            .width('100%')
            .margin({ top: 8 })
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

  private mountAdapterA(): void {
    let adapter: TextTagAdapter = new TextTagAdapter(this.sampleTagsA);
    this.currentAdapter = adapter;
    this.controller.setAdapter(adapter);
    let id: number = adapter.getInstanceId();
    this.currentSourceLabel = '#' + id.toString();
    this.tagCount = adapter.getItemCount();
    let current: FlexTagsAdapter | null = this.controller.getAdapter();
    let sameInstance: boolean = current === adapter;
    this.result = 'setAdapter(数据源A新实例) → id=#' + id.toString()
      + ', 标签数=' + this.tagCount.toString()
      + ', hasObserver=' + adapter.hasObserver().toString()
      + ', getAdapter()==同实例=' + sameInstance.toString();
  }

  private replaceAdapterB(): void {
    if (this.currentAdapter === null) {
      this.result = '替换为数据源B → ⚠️ 当前无数据源，请先点击挂载数据源A';
      return;
    }
    let oldAdapter: TextTagAdapter = this.currentAdapter;
    let oldId: number = oldAdapter.getInstanceId();
    let adapterB: TextTagAdapter = new TextTagAdapter(this.sampleTagsB);
    this.controller.setAdapter(adapterB);
    this.currentAdapter = adapterB;
    let id: number = adapterB.getInstanceId();
    this.currentSourceLabel = '#' + id.toString();
    this.tagCount = adapterB.getItemCount();
    let current: FlexTagsAdapter | null = this.controller.getAdapter();
    let sameInstance: boolean = current === adapterB;
    this.result = 'setAdapter(数据源B新实例) → id=#' + id.toString()
      + ', 标签数=' + this.tagCount.toString()
      + ', getAdapter()==B=' + sameInstance.toString()
      + ', 旧A hasObserver(已注销)=' + oldAdapter.hasObserver().toString()
      + ', 新B hasObserver=' + adapterB.hasObserver().toString()
      + ', 新B≠旧A=' + (id !== oldId).toString();
  }
}
