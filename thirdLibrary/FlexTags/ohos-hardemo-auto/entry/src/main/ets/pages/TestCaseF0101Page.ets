import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FlexTags, FlexTagsAdapter, FlexTagsController, FlexTagsItemView } from 'flex_tags';
import { TextTagAdapter } from '../demo/DemoModels';

/**
 * F-01-01 首次挂载标签数据源渲染全部子项后刷新同一数据源整体重渲染
 * 覆盖 API：FlexTags构造器 / setAdapter / getAdapter / notifyDataSetChanged
 */
@Entry
@Component
struct TestCaseF0101Page {
  @State result: string = '等待操作：点击挂载数据源';
  @State currentSourceLabel: string = '空';
  @State tagCount: number = 0;
  private controller: FlexTagsController = new FlexTagsController();
  private currentAdapter: TextTagAdapter | null = null;
  private readonly sampleTags: string[] = ['军事', '实事', '明星', '搞笑', '同城'];

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

        Text('F-01-01 首次挂载标签数据源渲染全部子项后刷新同一数据源整体重渲染')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12, right: 16, top: 12, bottom: 12 })
          .layoutWeight(1)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
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
            '2. 点击【首次挂载标签数据源渲染全部子项后刷新同一数据源整体重渲染】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 点击【挂载数据源】按钮 [验证点: 数据源挂载到容器]',
            '4. 观察【标签容器】显示全部标签子项 [验证点: 容器内出现全部标签且按弹性规则排列]',
            '5. 点击【刷新数据源】按钮 [验证点: 触发同一数据源刷新]',
            '6. 观察【标签容器】整体重新渲染 [验证点: 容器内标签整体重建且内容保持不变]',
            '7. 观察【当前数据源】文本显示当前挂载的数据源标识 [验证点: 当前数据源显示该新实例]'
          ],
            expected_result: '首次挂载新数据源后容器显示全部标签；之后刷新同一数据源容器整体重渲染且标签内容不变；当前数据源显示该新实例',
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
              Button('挂载数据源')
                .id('btn_mount')
                .layoutWeight(1)
                .onClick(() => {
                  this.mountAdapter();
                })

              Button('刷新数据源')
                .id('btn_refresh')
                .layoutWeight(1)
                .margin({ left: 8 })
                .onClick(() => {
                  this.refreshAdapter();
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

  private mountAdapter(): void {
    let adapter: TextTagAdapter = new TextTagAdapter(this.sampleTags);
    this.currentAdapter = adapter;
    this.controller.setAdapter(adapter);
    let id: number = adapter.getInstanceId();
    this.currentSourceLabel = '#' + id.toString();
    this.tagCount = adapter.getItemCount();
    let current: FlexTagsAdapter | null = this.controller.getAdapter();
    let sameInstance: boolean = current === adapter;
    this.result = 'setAdapter(新实例) → 标签数=' + this.tagCount.toString()
      + ', hasObserver=' + adapter.hasObserver().toString()
      + ', getAdapter()==同实例=' + sameInstance.toString();
  }

  private refreshAdapter(): void {
    if (this.currentAdapter === null) {
      this.result = '刷新数据源 → ⚠️ 当前无数据源，请先点击挂载数据源';
      return;
    }
    let beforeCreate: number = this.currentAdapter.createCount;
    let beforeBind: number = this.currentAdapter.bindCount;
    this.currentAdapter.notifyDataSetChanged();
    let afterCreate: number = this.currentAdapter.createCount;
    let afterBind: number = this.currentAdapter.bindCount;
    this.tagCount = this.currentAdapter.getItemCount();
    this.result = 'notifyDataSetChanged → 整体重渲染: onCreateView +' + (afterCreate - beforeCreate).toString()
      + ' 次, onBindView +' + (afterBind - beforeBind).toString()
      + ' 次, 标签数=' + this.tagCount.toString() + ' (内容保持不变)';
  }
}
