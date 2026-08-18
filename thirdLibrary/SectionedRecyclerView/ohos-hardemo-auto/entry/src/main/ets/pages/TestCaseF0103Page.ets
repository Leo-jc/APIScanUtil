import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import {
  SectionedModel,
  SectionedDataSource,
  SectionEntry,
  SectionedDefaultHeader,
  SectionedList
} from 'sectionedrecyclerview';

const COLORS: string[] = ['#F44336', '#2196F3', '#009688', '#8BC34A'];

class MutableSectionModel extends SectionedModel {
  sectionCount: number = 0;
  itemCounts: number[] = [];
  footers: boolean[] = [];

  getSectionCount(): number {
    return this.sectionCount;
  }

  getItemCountForSection(section: number): number {
    if (section < 0 || section >= this.itemCounts.length) {
      return 0;
    }
    return this.itemCounts[section];
  }

  hasFooterInSection(section: number): boolean {
    if (section < 0 || section >= this.footers.length) {
      return false;
    }
    return this.footers[section];
  }
}

@Entry
@Component
struct TestCaseF0103Page {
  @State result: string = '等待操作 F-01-03...';
  @State changedFlag: boolean = false;
  @State dataSource: SectionedDataSource = new SectionedDataSource();
  prevTotal: number = 0;
  prevSections: number = 0;

  @Builder
  renderHeader(entry: SectionEntry) {
    SectionedDefaultHeader('段 ' + (entry.section + 1))
  }

  @Builder
  renderItem(entry: SectionEntry) {
    Row() {
      Text('条目 段' + (entry.section + 1) + ' 位' + (entry.positionWithinSection + 1))
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
    const m: MutableSectionModel = new MutableSectionModel();
    m.sectionCount = 2;
    m.itemCounts = [2, 1];
    m.footers = [true, true];
    this.dataSource.setModel(m);
    this.changedFlag = false;
    this.updateResult();
  }

  changeData(): void {
    this.prevTotal = this.dataSource.totalCount();
    this.prevSections = this.dataSource.getModel().getSectionCount();
    const m: MutableSectionModel = new MutableSectionModel();
    m.sectionCount = 4;
    m.itemCounts = [1, 3, 2, 1];
    m.footers = [true, false, true, false];
    this.dataSource.setModel(m);
    this.changedFlag = true;
    this.updateResult();
  }

  updateResult(): void {
    const total: number = this.dataSource.totalCount();
    const sections: number = this.dataSource.getModel().getSectionCount();
    if (this.changedFlag) {
      this.result = '数据已变更\n变更前: totalCount=' + this.prevTotal
        + ', 段数=' + this.prevSections
        + '\n变更后: totalCount=' + total + ', 段数=' + sections;
    } else {
      this.result = '初始数据\ntotalCount=' + total + '\n段数=' + sections;
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

        Text('F-01-03 数据变更后条目总数与顺序刷新正确')
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
            '1. 点击【分组列表数据源】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【数据变更后条目总数与顺序刷新正确】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 观察【分组列表】初始展示的分组与条目数 [验证点: 初始展示正确]',
            '4. 点击【变更数据】按钮，修改段模型 [验证点: 触发数据刷新]',
            '5. 观察【条目总数】更新后的数值 [验证点: 总数与最新段模型一致]',
            '6. 观察【分组列表】的分组顺序 [验证点: 分组顺序与最新段模型一致]'
          ],
            expected_result: '变更后总数与顺序与最新段模型一致；变更通知正确触发刷新',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('变更数据')
              .id('btn_change_data')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.changeData();
              })

            Text('分组列表预览（变更后段数/顺序刷新）')
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
