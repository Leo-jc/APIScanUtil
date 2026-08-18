import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import {
  SectionedModel,
  SectionedDataSource,
  SectionEntry,
  SectionEntryKind,
  SectionedDefaultHeader,
  SectionedList
} from 'sectionedrecyclerview';

const COLORS: string[] = ['#F44336', '#2196F3', '#009688', '#8BC34A', '#FF9800'];

class LargeFastScrollModel extends SectionedModel {
  getSectionCount(): number {
    return 15;
  }

  getItemCountForSection(section: number): number {
    return 4;
  }

  hasFooterInSection(section: number): boolean {
    return true;
  }
}

class ExpectedEntry {
  kind: SectionEntryKind = SectionEntryKind.ITEM;
  section: number = 0;
  positionWithinSection: number = 0;
}

@Entry
@Component
struct TestCaseF0206Page {
  @State result: string = '等待操作 F-02-06...';
  @State dataSource: SectionedDataSource = new SectionedDataSource();

  @Builder
  renderHeader(entry: SectionEntry) {
    SectionedDefaultHeader('段 ' + (entry.section + 1))
  }

  @Builder
  renderItem(entry: SectionEntry) {
    Row() {
      Text('段' + (entry.section + 1) + ' 条目' + (entry.positionWithinSection + 1))
        .fontSize(14)
        .fontColor('#FFFFFF')
        .padding(12)
    }
    .width('100%')
    .backgroundColor(COLORS[entry.section % COLORS.length])
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
  }

  aboutToAppear(): void {
    this.dataSource.setModel(new LargeFastScrollModel());
    this.updateResult();
  }

  buildExpectedEntries(): ExpectedEntry[] {
    const expected: ExpectedEntry[] = [];
    for (let s = 0; s < 15; s++) {
      const header: ExpectedEntry = new ExpectedEntry();
      header.kind = SectionEntryKind.HEADER;
      header.section = s;
      header.positionWithinSection = 0;
      expected.push(header);
      for (let p = 0; p < 4; p++) {
        const item: ExpectedEntry = new ExpectedEntry();
        item.kind = SectionEntryKind.ITEM;
        item.section = s;
        item.positionWithinSection = p;
        expected.push(item);
      }
      const footer: ExpectedEntry = new ExpectedEntry();
      footer.kind = SectionEntryKind.FOOTER;
      footer.section = s;
      footer.positionWithinSection = 0;
      expected.push(footer);
    }
    return expected;
  }

  checkIntegrity(): void {
    const total: number = this.dataSource.totalCount();
    const expected: ExpectedEntry[] = this.buildExpectedEntries();
    const expectedTotal: number = expected.length;

    let pass: boolean = true;
    const errors: string[] = [];

    if (total !== expectedTotal) {
      pass = false;
      errors.push('总数不符: 实际=' + total + ' 期望=' + expectedTotal);
    }

    const checkCount: number = Math.min(total, expectedTotal);
    for (let i = 0; i < checkCount; i++) {
      const entry: SectionEntry = this.dataSource.getData(i);
      const exp: ExpectedEntry = expected[i];
      if (entry.kind !== exp.kind || entry.section !== exp.section || entry.positionWithinSection !== exp.positionWithinSection) {
        pass = false;
        if (errors.length < 5) {
          errors.push('位置' + i + ': 实际(段' + entry.section + ',位' + entry.positionWithinSection + ',kind=' + entry.kind + ')≠期望(段' + exp.section + ',位' + exp.positionWithinSection + ',kind=' + exp.kind + ')');
        }
      }
    }

    if (pass) {
      this.result = '校验通过\n总数: ' + total + ' (期望 ' + expectedTotal + ')\n15段x(1头+4条目+1尾) 全部一致\n频繁回收与重新展示后状态一致';
    } else {
      this.result = '校验失败\n' + errors.join('\n');
    }
  }

  updateResult(): void {
    const total: number = this.dataSource.totalCount();
    this.result = '大数据量: ' + total + ' 条目 (15段x(1头+4条目+1尾))\n快速滚动后点击【校验数据完整性】验证';
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

        Text('F-02-06 列表形态下快速滚动时条目节点频繁回收与重新展示且数据正确')
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
            '1. 点击【分组渲染（线性列表形态）】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【列表形态下快速滚动时条目节点频繁回收与重新展示且数据正确】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 快速向上滑动屏幕，使列表快速滚动 [验证点: 列表快速滚动]',
            '4. 停止滑动后，观察【列表】条目数据 [验证点: 条目数据正确不丢失]',
            '5. 观察频繁回收与重新展示后的状态 [验证点: 状态一致]'
          ],
            expected_result: '快速滚动时数据正确不丢失；频繁回收与重新展示后状态一致',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('校验数据完整性')
              .id('btn_check_integrity')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.checkIntegrity();
              })

            Text('分组列表预览（快速滚动, 频繁回收与重新展示）')
              .fontSize(13)
              .fontColor('#666666')
              .margin({ bottom: 4 })

            Column() {
              SectionedList({
                dataSource: this.dataSource,
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
