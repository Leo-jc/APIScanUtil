import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FlexTags, FlexTagsController, FlexTagsItemView } from 'flex_tags';
import { SelectTagAdapter, SelectTagView, InterestBean, INTEREST_NAMES } from '../demo/DemoModels';

/**
 * F-04-02 点击标签翻转选中状态切换背景色支持多选
 * 覆盖 API：notifyDataSetChanged / onBindView
 */
@Entry
@Component
struct TestCaseF0402Page {
  @State result: string = '等待操作 F-04-02...';
  @State selectedCount: number = 0;
  @State tagCount: number = 11;
  private controller: FlexTagsController = new FlexTagsController();
  private selectAdapter: SelectTagAdapter = new SelectTagAdapter(INTEREST_NAMES.map((n: string) => new InterestBean(n)));

  @Builder
  renderSelectTag(view: FlexTagsItemView): void {
    Text(view.tag)
      .fontSize(14)
      .fontColor('#333333')
      .backgroundColor((view as SelectTagView).selected ? '#22F7FA' : '#F5F7FA')
      .borderRadius(16)
      .padding({ left: 12, right: 12, top: 6, bottom: 6 })
      .margin(6)
      .onClick(() => {
        this.onTagToggle((view as SelectTagView).position);
      })
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

        Text('F-04-02 点击标签翻转选中状态切换背景色支持多选')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12, right: 16, top: 12, bottom: 12 })
          .layoutWeight(1)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .width('100%')
      .backgroundColor('#F1F3F5')

      // 可滚动区域（测试信息 + 预览）
      Scroll() {
        Column() {
          // ╔─ FIXED SECTION: 测试信息区（使用 TestInfoPanel 组件）─ 禁止修改 ─╗
          TestInfoPanel({
            level: 'L0',
            preconditions: '应用已启动',
            test_steps: [
            '1. 点击【兴趣标签选中页】进入模块列表页 [验证点: 进入模块列表页]',
            '2. 点击【点击标签翻转选中状态切换背景色支持多选】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 点击任一兴趣标签 [验证点: 选中某标签]',
            '4. 观察该项背景切换为选中蓝绿底 [验证点: 背景切换为选中色]',
            '5. 点击另一兴趣标签 [验证点: 选中另一标签]',
            '6. 观察该项背景也切换为选中蓝绿底 [验证点: 多选生效]',
            '7. 再次点击第一个标签 [验证点: 取消选中第一个]',
            '8. 观察该项背景切换回未选中灰底 [验证点: 翻转回未选中]'
          ],
            expected_result: '点击标签后该项背景在灰底与蓝绿底间切换且选中态翻转；容器整体刷新；多次点击多个标签各自独立翻转互不影响；无数量限制',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('查询当前选中数')
              .id('btn_check_selected')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.checkSelected();
              })

            // 预览区：FlexTags 容器真实渲染标签（点击翻转渲染验证）
            Text('标签容器预览区（点击标签翻转选中态）')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 12, bottom: 4 })

            FlexTags({
              controller: this.controller,
              adapter: this.selectAdapter,
              itemBuilder: (view: FlexTagsItemView): void => { this.renderSelectTag(view); },
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

            // 选中数与总数
            Row() {
              Text('已选数量: ')
                .fontSize(13)
                .fontColor('#666666')
              Text(this.selectedCount.toString())
                .id('txt_selected_count')
                .fontSize(13)
                .fontColor('#333333')
                .fontWeight(FontWeight.Medium)
              Text(' / 标签总数: ')
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

  aboutToAppear(): void {
    this.tagCount = this.selectAdapter.getItemCount();
    this.selectedCount = this.selectAdapter.getSelectedCount();
    this.result = '已渲染 ' + this.tagCount.toString() + ' 个兴趣标签，全部未选中（灰底），getSelectedCount()=' + this.selectedCount.toString() + '，点击标签翻转选中态';
  }

  private onTagToggle(position: number): void {
    this.selectAdapter.toggle(position);
    this.selectAdapter.notifyDataSetChanged();
    this.selectedCount = this.selectAdapter.getSelectedCount();
    let notifyCount: number = this.selectAdapter.notifyCount;
    this.result = '翻转 position=' + position.toString()
      + '，当前选中数=' + this.selectedCount.toString()
      + '，notifyCount=' + notifyCount.toString();
  }

  private checkSelected(): void {
    this.selectedCount = this.selectAdapter.getSelectedCount();
    this.tagCount = this.selectAdapter.getItemCount();
    this.result = '查询：getSelectedCount()=' + this.selectedCount.toString()
      + ' / getItemCount()=' + this.tagCount.toString()
      + '，notifyCount=' + this.selectAdapter.notifyCount.toString();
  }
}
