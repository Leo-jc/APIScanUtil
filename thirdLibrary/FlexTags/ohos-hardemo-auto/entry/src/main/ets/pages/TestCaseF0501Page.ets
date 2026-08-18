import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FlexTags, FlexTagsController, FlexTagsItemView } from 'flex_tags';
import { EditTagAdapter, EditTagView, PersonalBean, PERSONAL_NAMES } from '../demo/DemoModels';

/**
 * F-05-01 进入编辑页显示固定个人标签与预填输入框
 * 覆盖 API：FlexTags构造器 / setAdapter / onCreateView / onBindView / getItemCount
 */
@Entry
@Component
struct TestCaseF0501Page {
  @State result: string = '等待操作 F-05-01...';
  @State inputTag: string = '阳光帅气';
  @State tagCount: number = 7;
  private controller: FlexTagsController = new FlexTagsController();
  private editAdapter: EditTagAdapter = new EditTagAdapter(PERSONAL_NAMES.map((n: string): PersonalBean => new PersonalBean(n)));

  aboutToAppear(): void {
    this.tagCount = this.editAdapter.getItemCount();
    this.result = '已渲染 ' + this.tagCount.toString() + ' 个个人标签，输入框预填「阳光帅气」，getItemCount()=' + this.tagCount.toString();
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

        Text('F-05-01 进入编辑页显示固定个人标签与预填输入框')
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
            '1. 点击【个人标签编辑页】进入模块列表页 [验证点: 进入模块列表页]',
            '2. 点击【进入编辑页显示固定个人标签与预填输入框】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 等待页面显示完成 [验证点: 编辑页渲染完成]',
            '4. 观察【标签容器】显示 7 个固定个人标签 [验证点: 标签数量为 7]',
            '5. 观察每项标签为文本与删除图标的横向布局 [验证点: 文本+删除图标横向布局]',
            '6. 观察【标签输入框】预填「阳光帅气」 [验证点: 输入框预填值正确]',
            '7. 观察【添加】按钮可见 [验证点: 添加按钮可见]'
          ],
            expected_result: '进入页面显示 7 个固定个人标签（阳光/幽默/低调/时尚/果断/搞怪/假温柔）；每项为文本+删除图标横向布局；输入框预填「阳光帅气」；添加按钮可见',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            // 输入框（预填「阳光帅气」）
            Row() {
              Text('新增标签: ')
                .fontSize(13)
                .fontColor('#666666')
              TextInput({ text: this.inputTag })
                .id('txt_input_tag')
                .layoutWeight(1)
                .onChange((value: string) => {
                  this.inputTag = value;
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Button('添加')
              .id('btn_add_tag')
              .width('100%')
              .onClick(() => {
                this.onAddTag();
              })

            // 预览区：FlexTags 容器真实渲染标签（渲染验证）
            Text('标签容器预览区')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ top: 12, bottom: 4 })

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

  private onAddTag(): void {
    let text: string = this.inputTag.trim();
    if (text.length === 0) {
      this.result = '添加 → 空输入，已忽略';
      return;
    }
    this.editAdapter.addTag(text);
    this.editAdapter.notifyDataSetChanged();
    this.tagCount = this.editAdapter.getItemCount();
    this.result = 'addTag(' + text + ') → 末尾新增, 标签数=' + this.tagCount.toString();
    this.inputTag = '';
  }
}
