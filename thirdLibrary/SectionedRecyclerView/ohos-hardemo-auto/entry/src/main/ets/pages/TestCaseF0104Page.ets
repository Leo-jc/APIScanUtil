import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import {
  SectionedModel,
  SectionedDataSource,
  SectionEntry,
  SectionedList
} from 'sectionedrecyclerview';

class EmptySectionModel extends SectionedModel {
  getSectionCount(): number {
    return 0;
  }

  getItemCountForSection(section: number): number {
    return 0;
  }

  hasFooterInSection(section: number): boolean {
    return false;
  }
}

@Entry
@Component
struct TestCaseF0104Page {
  @State result: string = '等待操作 F-01-04...';
  @State dataSource: SectionedDataSource = new SectionedDataSource();

  @Builder
  renderHeader(entry: SectionEntry) {
    Text('分组头 段' + (entry.section + 1))
      .fontSize(14)
      .padding(12)
      .width('100%')
  }

  @Builder
  renderItem(entry: SectionEntry) {
    Text('条目 段' + (entry.section + 1) + ' 位' + (entry.positionWithinSection + 1))
      .fontSize(14)
      .padding(12)
      .width('100%')
  }

  aboutToAppear(): void {
    this.dataSource.setModel(new EmptySectionModel());
    this.updateResult();
  }

  updateResult(): void {
    const total: number = this.dataSource.totalCount();
    const sections: number = this.dataSource.getModel().getSectionCount();
    this.result = 'totalCount=' + total + '\nsectionCount=' + sections
      + '\n无分组节点展示';
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

        Text('F-01-04 无段时条目总数为零且无分组展示')
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
            '2. 点击【无段时条目总数为零且无分组展示】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 观察【条目总数】显示的数值 [验证点: 总数显示为零]',
            '4. 观察【分组列表】区域 [验证点: 无分组节点展示]'
          ],
            expected_result: '总数为零；无可视区分组节点',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('刷新统计')
              .id('btn_refresh_stats')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.updateResult();
              })

            Text('分组列表预览（空数据源）')
              .fontSize(13)
              .fontColor('#666666')
              .margin({ bottom: 4 })

            Stack({ alignContent: Alignment.Center }) {
              Column() {
                SectionedList({
                  dataSource: this.dataSource,
                  headerBuilder: (entry: SectionEntry): void => { this.renderHeader(entry); },
                  itemBuilder: (entry: SectionEntry): void => { this.renderItem(entry); }
                })
              }
              .width('100%')
              .height('100%')

              Text('无分组节点（空数据源）')
                .fontSize(13)
                .fontColor('#999999')
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
