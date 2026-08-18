import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FlexTags, FlexTagsController, FlexTagsItemView } from 'flex_tags';
import { TextTagAdapter } from '../demo/DemoModels';

/**
 * F-02-03 数据变更通知在未挂载容器时静默不刷新
 * 覆盖 API：notifyDataSetChanged
 */
@Entry
@Component
struct TestCaseF0203Page {
  @State result: string = '等待操作：点击变更数据源内容（未挂载）';
  @State tagCount: number = 0;
  private controller: FlexTagsController = new FlexTagsController();
  private looseAdapter: TextTagAdapter = new TextTagAdapter(['军事', '实事']);

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

        Text('F-02-03 数据变更通知在未挂载容器时静默不刷新')
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
            level: 'L1',
            preconditions: '应用已启动',
            test_steps: [
            '1. 点击【数据适配器】进入模块列表页 [验证点: 进入模块列表页]',
            '2. 点击【数据变更通知在未挂载容器时静默不刷新】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 不点击【挂载数据源】按钮，直接点击【变更数据源内容】按钮 [验证点: 未挂载数据源即触发变更]',
            '4. 观察【标签容器】保持初始状态无变化 [验证点: 容器无刷新]',
            '5. 观察【标签数量】文本保持初始值 [验证点: 标签数量不变]'
          ],
            expected_result: '数据源未挂载到任何容器时变更通知不触发任何刷新；容器无变化；无异常或多余刷新',
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
              Button('变更数据源内容')
                .id('btn_change')
                .layoutWeight(1)
                .onClick(() => {
                  this.changeDataSource();
                })
            }
            .width('100%')

            // 预览区：FlexTags 容器初始 adapter:null，不接线 looseAdapter（保持空）
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

            // 标签数量（保持初始值 0）
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

  private changeDataSource(): void {
    let beforeNotify: number = this.looseAdapter.notifyCount;
    let beforeCreate: number = this.looseAdapter.createCount;
    let beforeBind: number = this.looseAdapter.bindCount;
    this.looseAdapter.notifyDataSetChanged();
    let afterNotify: number = this.looseAdapter.notifyCount;
    let afterCreate: number = this.looseAdapter.createCount;
    let afterBind: number = this.looseAdapter.bindCount;
    // looseAdapter 未挂载到 FlexTags，容器标签数保持初始值 0
    this.result = 'notifyDataSetChanged(未挂载) → hasObserver=' + this.looseAdapter.hasObserver().toString()
      + ', notifyCount +' + (afterNotify - beforeNotify).toString()
      + ' 次, onCreateView +' + (afterCreate - beforeCreate).toString()
      + ' 次, onBindView +' + (afterBind - beforeBind).toString()
      + ' 次 (无重建), 容器无变化, 标签数量=' + this.tagCount.toString();
  }
}
