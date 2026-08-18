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

class GridSingleSpanModel extends SectionedModel {
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
    return true;
  }
}

@Entry
@Component
struct TestCaseF0305Page {
  @State result: string = '等待操作 F-03-05...';
  @State dataSource: SectionedDataSource = new SectionedDataSource();
  @State spanCount: number = 2;
  private spanOptions: SelectOption[] = [
    { value: '1 列' },
    { value: '2 列' }
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
    this.dataSource.setModel(new GridSingleSpanModel());
    this.updateResult();
  }

  updateResult(): void {
    const total: number = this.dataSource.totalCount();
    if (this.spanCount === 1) {
      this.result = '当前 spanCount=1\n'
        + '列模板: 1fr (buildColumnsTemplate spanCount<=1 返回 \'1fr\')\n'
        + '分组头 columnStart(0).columnEnd(0) → 占满整行(1列宽度)\n'
        + '条目 占1列 = 整行宽度\n'
        + '分组尾 columnStart(0).columnEnd(0) → 占满整行(1列宽度)\n'
        + '结论: 单列配置时分组头、分组尾、条目均占满整行\n'
        + '总数=' + total;
    } else {
      this.result = '当前 spanCount=2\n'
        + '列模板: 1fr 1fr\n'
        + '分组头/尾 columnStart(0).columnEnd(1) 占满整行; 条目占1列\n'
        + '请选择 1 列以验证单列占满整行行为\n'
        + '总数=' + total;
    }
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

        Text('F-03-05 网格形态下单列配置时所有条目均占满整行')
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
            '1. 点击【分组渲染（网格形态）】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【网格形态下单列配置时所有条目均占满整行】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 在【列数】下拉菜单中选择 1 列 [验证点: 列数变更为单列]',
            '4. 观察分组头、分组尾、条目的占位 [验证点: 均占满整行（1 列宽度）]'
          ],
            expected_result: '单列配置时分组头、分组尾、条目均占满整行',
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

            Text('网格预览（选择 1 列时所有元素占满整行）')
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
              } else {
                SectionedGrid({
                  dataSource: this.dataSource,
                  spanCount: 2,
                  columnsGap: 4,
                  rowsGap: 4,
                  headerBuilder: (entry: SectionEntry): void => { this.renderHeader(entry); },
                  itemBuilder: (entry: SectionEntry): void => { this.renderItem(entry); },
                  footerBuilder: (entry: SectionEntry): void => { this.renderFooter(entry); }
                })
              }
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
