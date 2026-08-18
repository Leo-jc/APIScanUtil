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

class GridVariableSpanModel extends SectionedModel {
  getSectionCount(): number {
    return 3;
  }

  getItemCountForSection(section: number): number {
    if (section === 0) {
      return 4;
    }
    if (section === 1) {
      return 5;
    }
    return 6;
  }

  hasFooterInSection(section: number): boolean {
    return true;
  }
}

@Entry
@Component
struct TestCaseF0303Page {
  @State result: string = '等待操作 F-03-03...';
  @State dataSource: SectionedDataSource = new SectionedDataSource();
  @State spanCount: number = 2;
  private spanOptions: SelectOption[] = [
    { value: '1 列' },
    { value: '2 列' },
    { value: '3 列' },
    { value: '4 列' }
  ];

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
        .fontSize(12)
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
    this.dataSource.setModel(new GridVariableSpanModel());
    this.updateResult();
  }

  updateResult(): void {
    const total: number = this.dataSource.totalCount();
    let headerCount: number = 0;
    let footerCount: number = 0;
    let itemCount: number = 0;
    for (let i = 0; i < total; i++) {
      const entry: SectionEntry = this.dataSource.getData(i);
      if (entry.kind === SectionEntryKind.HEADER) {
        headerCount++;
      } else if (entry.kind === SectionEntryKind.ITEM) {
        itemCount++;
      } else {
        footerCount++;
      }
    }
    this.result = '当前 spanCount=' + this.spanCount + '\n'
      + '总数=' + total + ' (头' + headerCount + ' + 条目' + itemCount + ' + 尾' + footerCount + ')\n'
      + '列模板: ' + this.buildColumnsTemplate(this.spanCount) + '\n'
      + '分组头/尾 columnStart(0).columnEnd(' + (this.spanCount - 1) + ') 占满整行\n'
      + '条目占1列, 按' + this.spanCount + '列自动换行排布';
  }

  buildColumnsTemplate(span: number): string {
    if (span <= 1) {
      return '1fr';
    }
    let template: string = '';
    for (let i = 0; i < span; i++) {
      if (i > 0) {
        template += ' ';
      }
      template += '1fr';
    }
    return template;
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

        Text('F-03-03 网格形态下不同列数配置下分组头尾始终占满且条目按列排布')
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
            '2. 点击【网格形态下不同列数配置下分组头尾始终占满且条目按列排布】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 观察【网格】当前列数下分组头尾的占位 [验证点: 分组头尾占满整行]',
            '4. 在【列数】下拉菜单中选择不同列数 [验证点: 列数变更]',
            '5. 观察分组头尾与条目的排布 [验证点: 分组头尾始终占满整行；条目按新列数自动换行排布]'
          ],
            expected_result: '不同列数下分组头尾始终占满整行；条目按新列数排布',
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
              Text('列数:')
                .fontSize(14)
                .fontColor('#333333')
                .margin({ right: 8 })

              Select(this.spanOptions)
                .id('select_span_count')
                .selected(this.spanCount - 1)
                .value(this.spanCount + ' 列')
                .onSelect((index: number, value: string) => {
                  this.spanCount = index + 1;
                  this.updateResult();
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Text('网格预览（切换列数后条件渲染, 头尾始终占满整行）')
              .fontSize(13)
              .fontColor('#666666')
              .margin({ bottom: 4 })

            Column() {
              if (this.spanCount === 1) {
                SectionedGrid({
                  dataSource: this.dataSource,
                  spanCount: 1,
                  columnsGap: 4,
                  rowsGap: 4,
                  headerBuilder: (entry: SectionEntry): void => { this.renderHeader(entry); },
                  itemBuilder: (entry: SectionEntry): void => { this.renderItem(entry); },
                  footerBuilder: (entry: SectionEntry): void => { this.renderFooter(entry); }
                })
              } else if (this.spanCount === 2) {
                SectionedGrid({
                  dataSource: this.dataSource,
                  spanCount: 2,
                  columnsGap: 4,
                  rowsGap: 4,
                  headerBuilder: (entry: SectionEntry): void => { this.renderHeader(entry); },
                  itemBuilder: (entry: SectionEntry): void => { this.renderItem(entry); },
                  footerBuilder: (entry: SectionEntry): void => { this.renderFooter(entry); }
                })
              } else if (this.spanCount === 3) {
                SectionedGrid({
                  dataSource: this.dataSource,
                  spanCount: 3,
                  columnsGap: 4,
                  rowsGap: 4,
                  headerBuilder: (entry: SectionEntry): void => { this.renderHeader(entry); },
                  itemBuilder: (entry: SectionEntry): void => { this.renderItem(entry); },
                  footerBuilder: (entry: SectionEntry): void => { this.renderFooter(entry); }
                })
              } else {
                SectionedGrid({
                  dataSource: this.dataSource,
                  spanCount: 4,
                  columnsGap: 4,
                  rowsGap: 4,
                  headerBuilder: (entry: SectionEntry): void => { this.renderHeader(entry); },
                  itemBuilder: (entry: SectionEntry): void => { this.renderItem(entry); },
                  footerBuilder: (entry: SectionEntry): void => { this.renderFooter(entry); }
                })
              }
            }
            .width('100%')
            .height(350)
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
