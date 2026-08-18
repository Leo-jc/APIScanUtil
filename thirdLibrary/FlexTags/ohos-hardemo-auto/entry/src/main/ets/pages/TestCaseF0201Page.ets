import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FlexTags, FlexTagsController, FlexTagsItemView } from 'flex_tags';
import { TextTagAdapter } from '../demo/DemoModels';

/**
 * F-02-01 数据源变更后容器整体重建所有标签子项
 * 覆盖 API：notifyDataSetChanged / onCreateView / onBindView / getItemCount
 */
@Entry
@Component
struct TestCaseF0201Page {
  @State result: string = '等待操作：点击挂载数据源';
  @State tagCount: number = 0;
  private controller: FlexTagsController = new FlexTagsController();
  private currentAdapter: TextTagAdapter | null = null;
  private readonly initialTags: string[] = ['军事', '实事', '明星'];
  private readonly changedTags: string[] = ['美食', '旅游', '数码', '游戏', '汽车', '健康'];

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

        Text('F-02-01 数据源变更后容器整体重建所有标签子项')
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
            '1. 点击【数据适配器】进入模块列表页 [验证点: 进入模块列表页]',
            '2. 点击【数据源变更后容器整体重建所有标签子项】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 点击【挂载数据源】按钮 [验证点: 数据源挂载到容器]',
            '4. 点击【变更数据源内容】按钮 [验证点: 数据源内容发生变更]',
            '5. 观察【标签容器】逐项重新构建并显示全部标签 [验证点: 容器按新数据源长度逐项重建]',
            '6. 观察【标签数量】文本显示与新数据源长度一致 [验证点: 标签数量等于数据源长度]'
          ],
            expected_result: '数据源变更后容器按数据源长度逐项构建、绑定并显示全部标签；子项数量与数据源长度一致；每项内容与绑定逻辑一致',
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

              Button('变更数据源内容')
                .id('btn_change')
                .layoutWeight(1)
                .margin({ left: 8 })
                .onClick(() => {
                  this.changeDataSource();
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

            // 标签数量
            Row() {
              Text('标签数量: ')
                .fontSize(13)
                .fontColor('#666666')
              Text(this.tagCount.toString())
                .id('txt_tag_count')
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
    let adapter: TextTagAdapter = new TextTagAdapter(this.initialTags);
    this.currentAdapter = adapter;
    this.controller.setAdapter(adapter);
    this.tagCount = adapter.getItemCount();
    this.result = 'setAdapter(3项) → getItemCount=' + this.tagCount.toString()
      + ', onCreateView=' + adapter.createCount.toString()
      + ', onBindView=' + adapter.bindCount.toString()
      + ', hasObserver=' + adapter.hasObserver().toString();
  }

  private changeDataSource(): void {
    if (this.currentAdapter === null) {
      this.result = '变更数据源内容 → ⚠️ 当前无数据源，请先点击挂载数据源';
      return;
    }
    let beforeCreate: number = this.currentAdapter.createCount;
    let beforeBind: number = this.currentAdapter.bindCount;
    this.currentAdapter.setTags(this.changedTags);
    this.currentAdapter.notifyDataSetChanged();
    let afterCreate: number = this.currentAdapter.createCount;
    let afterBind: number = this.currentAdapter.bindCount;
    this.tagCount = this.currentAdapter.getItemCount();
    this.result = 'setTags(6项)+notifyDataSetChanged → getItemCount=' + this.tagCount.toString()
      + ', onCreateView +' + (afterCreate - beforeCreate).toString()
      + ' 次, onBindView +' + (afterBind - beforeBind).toString()
      + ' 次 (逐项重建), 标签数量=' + this.tagCount.toString();
  }
}
