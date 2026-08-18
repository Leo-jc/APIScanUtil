import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import {
  SimpleSectionedModel,
  SectionedDataSource,
  SectionEntry,
  SectionedDefaultHeader,
  SectionedList
} from 'sectionedrecyclerview';

const COLORS: string[] = ['#F44336', '#2196F3', '#009688', '#8BC34A', '#FF9800'];

class InputTitleModel extends SimpleSectionedModel {
  title: string = '';

  getSectionCount(): number {
    return 1;
  }

  getItemCountForSection(section: number): number {
    return 2;
  }

  getSectionHeaderTitle(section: number): string {
    return this.title;
  }
}

@Entry
@Component
struct TestCaseF0407Page {
  @State result: string = '等待操作 F-04-07...';
  @State dataSource: SectionedDataSource = new SectionedDataSource();
  @State inputTitle: string = '';
  private model: InputTitleModel = new InputTitleModel();
  private sectionItems: string[][] = [['条目甲', '条目乙']];

  @Builder
  renderHeader(entry: SectionEntry) {
    SectionedDefaultHeader(this.model.getSectionHeaderTitle(entry.section))
  }

  @Builder
  renderItem(entry: SectionEntry) {
    Row() {
      Column() {
        Text(this.sectionItems[entry.section][entry.positionWithinSection])
          .fontSize(15)
          .fontColor('#FFFFFF')
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .height(56)
      .backgroundColor(COLORS[entry.section % COLORS.length])
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
  }

  aboutToAppear(): void {
    this.dataSource.setModel(this.model);
    this.updateResult();
  }

  updateResult(): void {
    const currentTitle: string = this.model.title;
    const display: string = currentTitle.length === 0 ? '(空串)' : currentTitle;
    const lines: string[] = [];
    lines.push('当前标题: ' + display);
    lines.push('标题长度=' + currentTitle.length);
    lines.push('行为: 空串时 SectionedDefaultHeader 渲染空白 Text, Row 仍占 48vp 高度');
    lines.push('高度来源: $r(app.float.sectioned_header_height)=48vp 固定, 不因内容空而塌缩');
    this.result = lines.join('\n');
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

        Text('F-04-07 简化形态下空串标题仍占满分组头高度')
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
            level: 'L2',
            preconditions: '应用已启动',
            test_steps: [
            '1. 点击【简化分组适配】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【简化形态下空串标题仍占满分组头高度】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 在【标题】输入框中输入空字符串 [验证点: 标题为空串]',
            '4. 观察【分组头】行为与高度 [验证点: 行为空白但仍占 48vp 高度]'
          ],
            expected_result: '空串标题时分组头空白但仍占 48vp 高度',
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
              Text('标题:')
                .fontSize(14)
                .fontColor('#333333')
                .margin({ right: 8 })

              TextInput({ text: this.inputTitle, placeholder: '输入分组标题（留空=空白头）' })
                .id('input_header_title')
                .width('60%')
                .onChange((value: string) => {
                  this.inputTitle = value;
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Button('应用标题')
              .id('btn_apply_title')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.model.title = this.inputTitle;
                this.dataSource.notifySectionReloaded();
                this.updateResult();
              })

            Text('分组头预览（空串时空白但仍占 48vp 高度）')
              .fontSize(13)
              .fontColor('#666666')
              .margin({ bottom: 4 })

            Column() {
              SectionedList({
                dataSource: this.dataSource,
                headerBuilder: (entry: SectionEntry): void => { this.renderHeader(entry); },
                itemBuilder: (entry: SectionEntry): void => { this.renderItem(entry); }
              })
            }
            .width('100%')
            .height(200)
            .border({ width: 1, color: '#D0D0D0' })
            .clip(true)
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
