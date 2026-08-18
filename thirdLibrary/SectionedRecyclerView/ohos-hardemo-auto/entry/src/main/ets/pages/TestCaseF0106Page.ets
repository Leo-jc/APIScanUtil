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

class NormalSectionModel extends SectionedModel {
  getSectionCount(): number {
    return 1;
  }

  getItemCountForSection(section: number): number {
    return 2;
  }

  hasFooterInSection(section: number): boolean {
    return false;
  }
}

class NegativeItemSectionModel extends SectionedModel {
  getSectionCount(): number {
    return 2;
  }

  getItemCountForSection(section: number): number {
    if (section === 0) {
      return -5;
    }
    if (section === 1) {
      return -3;
    }
    return 0;
  }

  hasFooterInSection(section: number): boolean {
    return false;
  }
}

@Entry
@Component
struct TestCaseF0106Page {
  @State result: string = '等待操作 F-01-06...';
  @State appliedNegative: boolean = false;
  @State dataSource: SectionedDataSource = new SectionedDataSource();

  @Builder
  renderHeader(entry: SectionEntry) {
    SectionedDefaultHeader('段 ' + (entry.section + 1))
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
    .backgroundColor('#FAFAFA')
  }

  aboutToAppear(): void {
    this.dataSource.setModel(new NormalSectionModel());
    this.appliedNegative = false;
    this.updateResult();
  }

  applyNegative(): void {
    this.dataSource.setModel(new NegativeItemSectionModel());
    this.appliedNegative = true;
    this.updateResult();
  }

  updateResult(): void {
    const total: number = this.dataSource.totalCount();
    const sections: number = this.dataSource.getModel().getSectionCount();
    if (this.appliedNegative) {
      this.result = '已提供负数 itemCount(-5, -3)\n'
        + '应用正常运行未崩溃\n'
        + 'totalCount=' + total + ' (负数被按 0 处理, 仅 '
        + sections + ' 个分组头)';
    } else {
      this.result = '初始正常数据\ntotalCount=' + total + '\n段数=' + sections;
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

        Text('F-01-06 段模型提供负数条目数时优雅处理不崩溃')
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
            '1. 点击【分组列表数据源】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【段模型提供负数条目数时优雅处理不崩溃】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 点击【提供负数数据】按钮，使段模型提供负数条目数 [验证点: 触发异常数据场景]',
            '4. 观察【应用状态】 [验证点: 应用保持正常运行不崩溃]'
          ],
            expected_result: '不崩溃；以安全方式处理（如按零条目处理或提示错误信息，以实际行为为准）',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('提供负数数据')
              .id('btn_apply_negative')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.applyNegative();
              })

            Text('分组列表预览（负数 itemCount 按 0 处理，仅分组头）')
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
            .height(160)
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
