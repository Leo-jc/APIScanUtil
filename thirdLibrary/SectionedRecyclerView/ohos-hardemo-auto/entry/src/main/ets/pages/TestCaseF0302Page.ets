import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import {
  SectionedModel,
  SectionedDataSource,
  SectionEntry,
  SectionEntryKind,
  SectionedGrid
} from 'sectionedrecyclerview';

const COLORS: string[] = ['#F44336', '#2196F3', '#009688', '#8BC34A', '#FF9800'];

class MixedFooterModel extends SectionedModel {
  getSectionCount(): number {
    return 2;
  }

  getItemCountForSection(section: number): number {
    if (section === 0) {
      return 3;
    }
    return 4;
  }

  hasFooterInSection(section: number): boolean {
    return section === 0;
  }
}

@Entry
@Component
struct TestCaseF0302Page {
  @State result: string = '等待操作 F-03-02...';
  @State dataSource: SectionedDataSource = new SectionedDataSource();
  private spanCount: number = 2;

  @Builder
  renderHeader(entry: SectionEntry) {
    Row() {
      Text('段 ' + (entry.section + 1) + ' 头')
        .fontSize(15)
        .fontColor('#FFFFFF')
        .fontWeight(FontWeight.Bold)
        .padding(12)
    }
    .width('100%')
    .backgroundColor('#2196F3')
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  renderItem(entry: SectionEntry) {
    Column() {
      Text('段 ' + (entry.section + 1) + '\n条目 ' + (entry.positionWithinSection + 1))
        .fontSize(13)
        .fontColor('#FFFFFF')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .height(70)
    .backgroundColor(COLORS[entry.section % COLORS.length])
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  renderFooter(entry: SectionEntry) {
    Row() {
      Text('段 ' + (entry.section + 1) + ' 尾')
        .fontSize(13)
        .fontColor('#666666')
        .padding(12)
    }
    .width('100%')
    .backgroundColor('#EEEEEE')
    .justifyContent(FlexAlign.Center)
  }

  aboutToAppear(): void {
    this.dataSource.setModel(new MixedFooterModel());
    this.updateResult();
  }

  updateResult(): void {
    const total: number = this.dataSource.totalCount();
    const lines: string[] = [];
    lines.push('spanCount=' + this.spanCount + ', 总数=' + total);
    let currentSection: number = -1;
    let hasFooterCurrent: boolean = false;
    for (let i = 0; i < total; i++) {
      const entry: SectionEntry = this.dataSource.getData(i);
      let kindName: string = '';
      if (entry.kind === SectionEntryKind.HEADER) {
        kindName = '分组头(段' + (entry.section + 1) + ')';
        currentSection = entry.section;
        hasFooterCurrent = this.dataSource.getModel().hasFooterInSection(entry.section);
      } else if (entry.kind === SectionEntryKind.ITEM) {
        kindName = '条目(段' + (entry.section + 1) + ' 第' + (entry.positionWithinSection + 1) + ')';
      } else {
        kindName = '分组尾(段' + (entry.section + 1) + ')';
      }
      lines.push('位置' + i + ': ' + kindName);
    }
    lines.push('段1 hasFooter=false → 无分组尾行, 直接接下一段头');
    lines.push('段0 hasFooter=true → 出现灰色分组尾行占满整行');
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

        Text('F-03-02 网格形态下无分组尾段不出现占满整行')
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
            '1. 点击【分组渲染（网格形态）】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【网格形态下无分组尾段不出现占满整行】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 观察无分组尾的段 [验证点: 不出现占满整行的分组尾行]',
            '4. 观察条目排布 [验证点: 条目正常排布]'
          ],
            expected_result: '无分组尾段不出现占满整行的分组尾行；条目正常排布',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('刷新分组尾状态')
              .id('btn_refresh_footer_status')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.updateResult();
              })

            Text('网格预览（spanCount=2, 段0有尾 / 段1无尾）')
              .fontSize(13)
              .fontColor('#666666')
              .margin({ bottom: 4 })

            Column() {
              SectionedGrid({
                dataSource: this.dataSource,
                spanCount: this.spanCount,
                columnsGap: 4,
                rowsGap: 4,
                headerBuilder: (entry: SectionEntry): void => { this.renderHeader(entry); },
                itemBuilder: (entry: SectionEntry): void => { this.renderItem(entry); },
                footerBuilder: (entry: SectionEntry): void => { this.renderFooter(entry); }
              })
            }
            .width('100%')
            .height(300)
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
