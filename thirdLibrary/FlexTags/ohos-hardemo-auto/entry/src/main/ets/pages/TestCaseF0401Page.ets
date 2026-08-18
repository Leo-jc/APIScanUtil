import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FlexTags, FlexTagsController, FlexTagsItemView } from 'flex_tags';
import { SelectTagAdapter, SelectTagView, InterestBean, INTEREST_NAMES } from '../demo/DemoModels';

/**
 * F-04-01 进入选中页显示全部未选中的固定兴趣标签
 * 覆盖 API：FlexTags构造器 / setAdapter / onCreateView / onBindView / getItemCount
 */
@Entry
@Component
struct TestCaseF0401Page {
  @State result: string = '等待操作 F-04-01...';
  @State selectedCount: number = 0;
  @State tagCount: number = 11;
  private controller: FlexTagsController = new FlexTagsController();
  private selectAdapter: SelectTagAdapter = new SelectTagAdapter(INTEREST_NAMES.map((n: string) => new InterestBean(n)));

  @Builder
  renderSelectTag(view: FlexTagsItemView): void {
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

        Text('F-04-01 进入选中页显示全部未选中的固定兴趣标签')
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
            level: 'L1',
            preconditions: '应用已启动',
            test_steps: [
            '1. 点击【兴趣标签选中页】进入模块列表页 [验证点: 进入模块列表页]',
            '2. 点击【进入选中页显示全部未选中的固定兴趣标签】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 等待页面显示完成 [验证点: 选中页渲染完成]',
            '4. 观察【标签容器】显示 11 个固定兴趣标签 [验证点: 标签数量为 11]',
            '5. 观察各标签全部显示为未选中灰底 [验证点: 全部未选中灰底]',
            '6. 观察标签胶囊圆角布局正确 [验证点: 圆角胶囊布局正常]'
          ],
            expected_result: '进入页面显示 11 个固定兴趣标签（军事/实事/明星/搞笑/同城/美女/帅哥/宠物/生活/旅游/二次元）；全部未选中灰底；标签胶囊圆角布局正确',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('查询当前选中状态')
              .id('btn_check_status')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.checkStatus();
              })

            // 预览区：FlexTags 容器真实渲染标签（渲染验证）
            Text('标签容器预览区')
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
    this.result = '已渲染 ' + this.tagCount.toString() + ' 个兴趣标签，全部未选中（灰底），getSelectedCount()=' + this.selectedCount.toString();
  }

  private checkStatus(): void {
    this.tagCount = this.selectAdapter.getItemCount();
    this.selectedCount = this.selectAdapter.getSelectedCount();
    this.result = '查询：getItemCount()=' + this.tagCount.toString()
      + ', getSelectedCount()=' + this.selectedCount.toString()
      + ', hasObserver=' + this.selectAdapter.hasObserver().toString();
  }
}
