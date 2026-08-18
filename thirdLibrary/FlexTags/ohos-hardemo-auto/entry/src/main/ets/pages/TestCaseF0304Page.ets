import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import { FlexTags, FlexTagsController, FlexTagsItemView } from 'flex_tags';
import { TextTagAdapter, HOT_SEARCH_POOL, pickRandomTags } from '../demo/DemoModels';

/**
 * F-03-04 超长文本标签撑满父容器宽度占满该行
 * 覆盖 API：onBindView
 */
@Entry
@Component
struct TestCaseF0304Page {
  @State result: string = '等待操作：点击随机测试或直接填充含超长标签';
  @State tagCount: number = 0;
  private controller: FlexTagsController = new FlexTagsController();

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

        Text('F-03-04 超长文本标签撑满父容器宽度占满该行')
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
            '1. 点击【热门搜索页】进入模块列表页 [验证点: 进入模块列表页]',
            '2. 点击【超长文本标签撑满父容器宽度占满该行】进入用例详情页 [验证点: 进入用例详情页]',
            '3. 反复点击【随机测试】按钮直到出现超长文本标签 [验证点: 容器出现超长文本标签]',
            '4. 观察超长文本标签占满该行宽度 [验证点: 标签宽度接近父容器宽度]',
            '5. 观察超长标签自身换行 [验证点: 标签文本自身换行]',
            '6. 观察该行仅显示该超长标签 [验证点: 该行无其他标签]'
          ],
            expected_result: '超长文本标签占满该行宽度；标签自身换行；该行仅显示该超长标签',
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
              Button('随机测试')
                .id('btn_random_test')
                .layoutWeight(1)
                .onClick(() => {
                  this.randomTest();
                })

              Button('直接填充含超长标签')
                .id('btn_fill_long')
                .layoutWeight(1)
                .margin({ left: 8 })
                .onClick(() => {
                  this.fillLongTag();
                })
            }
            .width('100%')

            // 预览区：FlexTags 容器（宽度 100%）
            Text('标签容器预览区（宽度 100%）')
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

  private randomTest(): void {
    let tags: string[] = pickRandomTags(HOT_SEARCH_POOL, 5, 12);
    let adapter: TextTagAdapter = new TextTagAdapter(tags);
    this.controller.setAdapter(adapter);
    this.tagCount = adapter.getItemCount();
    this.result = this.buildLongTextResult(adapter, '随机填充');
  }

  private fillLongTag(): void {
    let tags: string[] = [HOT_SEARCH_POOL[0], '美食', '科技'];
    let adapter: TextTagAdapter = new TextTagAdapter(tags);
    this.controller.setAdapter(adapter);
    this.tagCount = adapter.getItemCount();
    this.result = this.buildLongTextResult(adapter, '直接填充含超长');
  }

  private buildLongTextResult(adapter: TextTagAdapter, label: string): string {
    let tags: string[] = adapter.getTags();
    let hasLong: boolean = false;
    for (let i = 0; i < tags.length; i++) {
      if (tags[i].length > 20) {
        hasLong = true;
        break;
      }
    }
    return label + ' → getItemCount=' + this.tagCount.toString()
      + ', 标签数=' + this.tagCount.toString()
      + ', 含超长标签=' + (hasLong ? '是' : '否')
      + ', onBindView=' + adapter.bindCount.toString();
  }
}
