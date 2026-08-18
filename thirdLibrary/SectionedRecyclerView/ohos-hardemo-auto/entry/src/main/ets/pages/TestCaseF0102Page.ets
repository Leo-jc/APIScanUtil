import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import {
  SectionedModel,
  SectionedDataSource,
  SectionEntry,
  SectionedList
} from 'sectionedrecyclerview';

class MultiSectionModel extends SectionedModel {
  getSectionCount(): number {
    return 3;
  }

  getItemCountForSection(section: number): number {
    if (section === 0) {
      return 2;
    }
    if (section === 1) {
      return 3;
    }
    if (section === 2) {
      return 1;
    }
    return 0;
  }

  hasFooterInSection(section: number): boolean {
    if (section === 0) {
      return true;
    }
    if (section === 1) {
      return false;
    }
    if (section === 2) {
      return true;
    }
    return false;
  }
}

@Entry
@Component
struct TestCaseF0102Page {
  @State result: string = '等待操作 F-01-02...';
  @State dataSource: SectionedDataSource = new SectionedDataSource();

  @Builder
  renderHeader(entry: SectionEntry) {
    Row() {
      Text('分组头 段' + (entry.section + 1))
        .fontSize(14)
        .fontColor('#FFFFFF')
        .fontWeight(FontWeight.Bold)
        .padding(12)
    }
    .width('100%')
    .backgroundColor('#2196F3')
  }

  @Builder
  renderItem(entry: SectionEntry) {
    Row() {
      Text('条目 段' + (entry.section + 1) + ' 位' + (entry.positionWithinSection + 1))
        .fontSize(14)
        .fontColor('#333333')
        .padding(12)
    }
    .width('100%')
    .backgroundColor('#FFFFFF')
    .border({ width: 0.5, color: '#CCCCCC' })
  }

  @Builder
  renderFooter(entry: SectionEntry) {
    Row() {
      Text('分组尾 段' + (entry.section + 1))
        .fontSize(13)
        .fontColor('#FFFFFF')
        .padding(12)
    }
    .width('100%')
    .backgroundColor('#9E9E9E')
  }

  aboutToAppear(): void {
    this.dataSource.setModel(new MultiSectionModel());
    this.refreshTypes();
  }

  refreshTypes(): void {
    const total: number = this.dataSource.totalCount();
    const lines: string[] = [];
    for (let i = 0; i < total; i++) {
      const entry: SectionEntry = this.dataSource.getData(i);
      let kindName: string;
      if (this.dataSource.isSectionHeaderPosition(i)) {
        kindName = 'HEADER';
      } else if (this.dataSource.isSectionFooterPosition(i)) {
        kindName = 'FOOTER';
      } else {
        kindName = 'ITEM';
      }
      lines.push('位置 ' + i + ': ' + kindName + '(段' + (entry.section + 1)
        + ',位' + (entry.positionWithinSection + 1) + ')');
    }
    this.result = lines.join('\n') + '\n总数: ' + total;
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

        Text('F-01-02 多段不同配置下条目总数与顺序正确且各位置正确识别为分组头、条目或分组尾')
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
            '2. 点击【多段不同配置下条目总数与顺序正确且各位置正确识别为分组头、条目或分组尾】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 观察【分组列表】展示多段分组，段间条目数与分组尾配置各不相同 [验证点: 多段连续展示，段间顺序正确]',
            '4. 观察【条目总数】显示的数值 [验证点: 总数与各段条目数之和一致]',
            '5. 逐段观察各位置的类型标识 [验证点: 每个位置正确识别为分组头、条目或分组尾]'
          ],
            expected_result: '多段展示总数与顺序正确；各位置类型正确分派为分组头、条目或分组尾；段间不混淆',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('刷新类型标识')
              .id('btn_refresh_types')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.refreshTypes();
              })

            Text('分组列表预览（蓝=头/白=条目/灰=尾）')
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
