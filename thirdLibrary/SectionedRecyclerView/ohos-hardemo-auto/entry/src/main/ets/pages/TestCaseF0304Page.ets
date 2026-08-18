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

class GridCorrectModel extends SectionedModel {
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

class RawGridEntry {
  id: string = '';
  kind: number = 1;
  label: string = '';
  color: string = '#FFFFFF';

  constructor(id: string, kind: number, label: string, color: string) {
    this.id = id;
    this.kind = kind;
    this.label = label;
    this.color = color;
  }
}

@Entry
@Component
struct TestCaseF0304Page {
  @State result: string = '等待操作 F-03-04...';
  @State dataSource: SectionedDataSource = new SectionedDataSource();
  @State rawEntries: RawGridEntry[] = [];
  private hint: string = '未配置 columnsTemplate 时，GridItem 的 columnStart/columnEnd 不生效，分组头尾不占满整行。HAR 的 SectionedGrid 始终从 spanCount 派生 columnsTemplate，避免此错误用法。';

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
    .height(64)
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

  @Builder
  renderRawEntry(item: RawGridEntry) {
    Column() {
      Text(item.label)
        .fontSize(12)
        .fontColor('#FFFFFF')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .height(64)
    .backgroundColor(item.color)
    .justifyContent(FlexAlign.Center)
  }

  aboutToAppear(): void {
    this.dataSource.setModel(new GridCorrectModel());
    this.rawEntries = this.buildRawEntries();
    this.updateResult();
  }

  buildRawEntries(): RawGridEntry[] {
    const list: RawGridEntry[] = [];
    list.push(new RawGridEntry('h0', 0, '段1 头\n(未占满)', '#2196F3'));
    list.push(new RawGridEntry('i0', 1, '段1 条目1', COLORS[0]));
    list.push(new RawGridEntry('i1', 1, '段1 条目2', COLORS[0]));
    list.push(new RawGridEntry('i2', 1, '段1 条目3', COLORS[0]));
    list.push(new RawGridEntry('f0', 2, '段1 尾\n(未占满)', '#EEEEEE'));
    list.push(new RawGridEntry('h1', 0, '段2 头\n(未占满)', '#2196F3'));
    list.push(new RawGridEntry('i3', 1, '段2 条目1', COLORS[1]));
    list.push(new RawGridEntry('i4', 1, '段2 条目2', COLORS[1]));
    list.push(new RawGridEntry('i5', 1, '段2 条目3', COLORS[1]));
    list.push(new RawGridEntry('i6', 1, '段2 条目4', COLORS[1]));
    list.push(new RawGridEntry('f1', 2, '段2 尾\n(未占满)', '#EEEEEE'));
    return list;
  }

  updateResult(): void {
    const total: number = this.dataSource.totalCount();
    this.result = '【错误用法演示】原始 Grid 未设 columnsTemplate\n'
      + '  → GridItem 的 columnStart(0).columnEnd(1) 不生效\n'
      + '  → 分组头/尾不占满整行, 仅作为普通单元流入排布\n'
      + '【正确用法】HAR SectionedGrid (spanCount=2)\n'
      + '  → 始终派生 columnsTemplate=\'1fr 1fr\'\n'
      + '  → 分组头/尾 columnStart(0).columnEnd(1) 生效, 占满整行\n'
      + 'HAR dataSource 总数=' + total + '\n'
      + this.hint;
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

        Text('F-03-04 网格形态下未配置列模板时分组头尾不占满属错误用法')
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
            '2. 点击【网格形态下未配置列模板时分组头尾不占满属错误用法】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 观察未配置列模板时分组头尾的占位 [验证点: 分组头尾不占满整行]',
            '4. 观察【提示信息】 [验证点: 显示错误用法说明（以实际提示为准）]'
          ],
            expected_result: '未配置列模板时分组头尾不占满整行；属错误用法',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text('提示信息')
              .id('txt_hint_title')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor('#D32F2F')
              .margin({ bottom: 4 })

            Text(this.hint)
              .id('txt_hint_content')
              .fontSize(12)
              .fontColor('#666666')
              .backgroundColor('#FFF3E0')
              .padding(10)
              .borderRadius(6)
              .width('100%')
              .margin({ bottom: 8 })

            Button('刷新提示说明')
              .id('btn_refresh_hint')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.updateResult();
              })

            Text('错误用法演示: 原始 Grid 未设 columnsTemplate (头尾未占满)')
              .fontSize(13)
              .fontColor('#D32F2F')
              .margin({ bottom: 4 })

            Column() {
              Grid() {
                ForEach(this.rawEntries, (item: RawGridEntry) => {
                  GridItem() {
                    this.renderRawEntry(item)
                  }
                  .columnStart(0)
                  .columnEnd(1)
                }, (item: RawGridEntry) => item.id)
              }
              .width('100%')
              .height(160)
              .backgroundColor('#FAFAFA')
            }
            .width('100%')
            .height(170)
            .border({ width: 1, color: '#D32F2F' })
            .clip(true)
            .margin({ bottom: 8 })

            Text('正确用法演示: HAR SectionedGrid (spanCount=2, 头尾占满整行)')
              .fontSize(13)
              .fontColor('#388E3C')
              .margin({ bottom: 4 })

            Column() {
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
            .width('100%')
            .height(180)
            .border({ width: 1, color: '#388E3C' })
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
