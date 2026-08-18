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

class GridSpanModel extends SectionedModel {
  getSectionCount(): number {
    return 3;
  }

  getItemCountForSection(section: number): number {
    if (section === 1) {
      return 4;
    }
    return 3;
  }

  hasFooterInSection(section: number): boolean {
    return true;
  }
}

@Entry
@Component
struct TestCaseF0301Page {
  @State result: string = '等待操作 F-03-01...';
  @State dataSource: SectionedDataSource = new SectionedDataSource();
  private spanCount: number = 3;

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
    .height(80)
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
    this.dataSource.setModel(new GridSpanModel());
    this.updateResult();
  }

  updateResult(): void {
    const total: number = this.dataSource.totalCount();
    const sections: number = this.dataSource.getModel().getSectionCount();
    const lines: string[] = [];
    lines.push('spanCount=' + this.spanCount + ', 段数=' + sections + ', 总数=' + total);
    for (let i = 0; i < total; i++) {
      const entry: SectionEntry = this.dataSource.getData(i);
      let kindName: string = '';
      let spanInfo: string = '';
      if (entry.kind === SectionEntryKind.HEADER) {
        kindName = '分组头(段' + (entry.section + 1) + ')';
        spanInfo = '跨' + this.spanCount + '列占满整行';
      } else if (entry.kind === SectionEntryKind.ITEM) {
        kindName = '条目(段' + (entry.section + 1) + ' 第' + (entry.positionWithinSection + 1) + ')';
        spanInfo = '占1列';
      } else {
        kindName = '分组尾(段' + (entry.section + 1) + ')';
        spanInfo = '跨' + this.spanCount + '列占满整行';
      }
      lines.push('位置' + i + ': ' + kindName + ' → ' + spanInfo);
    }
    lines.push('说明: 分组头/尾 columnStart(0).columnEnd(spanCount-1) 占满整行; 条目占1列按列数自动排列');
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

        Text('F-03-01 网格形态下分组头与分组尾占满整行且条目占单列')
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
            '2. 点击【网格形态下分组头与分组尾占满整行且条目占单列】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 观察【网格】中分组头的占位 [验证点: 分组头占满整行（跨所有列）]',
            '4. 观察分组尾的占位 [验证点: 分组尾占满整行（跨所有列）]',
            '5. 观察条目的占位 [验证点: 条目占单列并按列数自动排列]'
          ],
            expected_result: '分组头占满整行；分组尾占满整行；条目占 1 列',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('刷新跨列说明')
              .id('btn_refresh_span_info')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.updateResult();
              })

            Text('网格预览（spanCount=' + this.spanCount + ', 蓝=分组头 / 彩块=条目 / 灰=分组尾）')
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
