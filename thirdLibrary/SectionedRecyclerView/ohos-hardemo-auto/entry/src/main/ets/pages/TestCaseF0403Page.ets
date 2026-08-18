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

class LongTitleModel extends SimpleSectionedModel {
  private longTitle: string = '这是一个非常非常非常非常非常非常长的分组标题文本用于测试省略号效果';

  getSectionCount(): number {
    return 1;
  }

  getItemCountForSection(section: number): number {
    return 2;
  }

  getSectionHeaderTitle(section: number): string {
    return this.longTitle;
  }
}

@Entry
@Component
struct TestCaseF0403Page {
  @State result: string = '等待操作 F-04-03...';
  @State dataSource: SectionedDataSource = new SectionedDataSource();
  private model: LongTitleModel = new LongTitleModel();
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
    const total: number = this.dataSource.totalCount();
    const title: string = this.model.getSectionHeaderTitle(0);
    const lines: string[] = [];
    lines.push('段数=1, 扁平化总数=' + total);
    lines.push('标题原文(' + title.length + '字): ' + title);
    lines.push('标题行为: 单行展示 + 尾部省略(Text.maxLines=1, TextOverflow=Ellipsis)');
    lines.push('不换行: Row 高度由 $r(app.float.sectioned_header_height)=48vp 固定, 超出部分省略');
    lines.push('渲染: SectionedDefaultHeader(title) 内部 Text 设 maxLines(1).textOverflow(Ellipsis)');
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

        Text('F-04-03 简化形态下超长标题单行尾部省略且不换行')
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
            '1. 点击【简化分组适配】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【简化形态下超长标题单行尾部省略且不换行】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 观察【分组头】显示超长标题 [验证点: 单行展示且尾部为省略号]',
            '4. 观察标题是否换行 [验证点: 不换行]',
            '5. 观察【分组头】高度 [验证点: 高度仍为 48vp]'
          ],
            expected_result: '超长标题单行尾部省略；不换行；高度仍为 48vp',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('校验省略行为')
              .id('btn_verify_ellipsis')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.updateResult();
              })

            Text('分组头预览（超长标题单行尾部省略，高度仍 48vp）')
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
