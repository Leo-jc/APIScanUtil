import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FlexTags, FlexTagsController, FlexTagsItemView } from 'flex_tags';
import { EditTagAdapter, EditTagView, PersonalBean, PERSONAL_NAMES } from '../demo/DemoModels';

/**
 * F-05-02 点击删除图标移除该项标签
 * 覆盖 API：notifyDataSetChanged / onBindView
 */
@Entry
@Component
struct TestCaseF0502Page {
  @State result: string = '等待操作 F-05-02...';
  @State inputTag: string = '阳光帅气';
  @State tagCount: number = 7;
  private controller: FlexTagsController = new FlexTagsController();
  private editAdapter: EditTagAdapter = new EditTagAdapter(PERSONAL_NAMES.map((n: string): PersonalBean => new PersonalBean(n)));

  aboutToAppear(): void {
    this.tagCount = this.editAdapter.getItemCount();
    this.result = '已渲染 ' + this.tagCount.toString() + ' 个个人标签，getItemCount()=' + this.tagCount.toString() + '，点击删除图标移除该项';
  }

  @Builder
  renderEditTag(view: FlexTagsItemView): void {
    Row() {
      Text(view.tag)
        .fontSize(14)
        .fontColor('#333333')
      Text('×')
        .fontSize(16)
        .fontColor('#999999')
        .margin({ left: 5 })
        .onClick(() => {
          this.onDeleteTag((view as EditTagView).position);
        })
    }
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

        Text('F-05-02 点击删除图标移除该项标签')
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
            '1. 点击【个人标签编辑页】进入模块列表页 [验证点: 进入模块列表页]',
            '2. 点击【点击删除图标移除该项标签】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 点击某项标签的【删除图标】 [验证点: 触发删除]',
            '4. 观察该项从标签容器消失 [验证点: 该项移除]',
            '5. 观察【标签数量】文本显示数量减一 [验证点: 数量减一]',
            '6. 观察其他标签不受影响 [验证点: 其他标签正常]'
          ],
            expected_result: '点击删除图标后该项从容器消失；标签数量减一；容器整体刷新；其他标签不受影响',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('查询标签数量')
              .id('btn_check_count')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.checkCount();
              })

            Text('提示：点击标签项右侧「×」删除图标移除该项')
              .fontSize(12)
              .fontColor('#999999')
              .width('100%')
              .margin({ bottom: 8 })

            // 预览区：FlexTags 容器真实渲染标签（渲染验证）
            Text('标签容器预览区')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ bottom: 4 })

            FlexTags({
              controller: this.controller,
              adapter: this.editAdapter,
              itemBuilder: (view: FlexTagsItemView): void => { this.renderEditTag(view); },
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

  private onDeleteTag(position: number): void {
    this.editAdapter.deleteAt(position);
    this.editAdapter.notifyDataSetChanged();
    this.tagCount = this.editAdapter.getItemCount();
    this.result = '删除 position=' + position.toString() + ', 剩余标签数=' + this.tagCount.toString() + ', notifyCount=' + this.editAdapter.notifyCount.toString();
  }

  private checkCount(): void {
    this.tagCount = this.editAdapter.getItemCount();
    this.result = '查询：getItemCount()=' + this.tagCount.toString()
      + ', notifyCount=' + this.editAdapter.notifyCount.toString()
      + ', hasObserver=' + this.editAdapter.hasObserver().toString();
  }
}
