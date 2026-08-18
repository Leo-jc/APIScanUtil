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

const COLORS: string[] = ['#F44336', '#2196F3', '#009688', '#8BC34A', '#FF9800'];

class LargeListModel extends SectionedModel {
  getSectionCount(): number {
    return 10;
  }

  getItemCountForSection(section: number): number {
    return 5;
  }

  hasFooterInSection(section: number): boolean {
    return true;
  }
}

@Entry
@Component
struct TestCaseF0203Page {
  @State result: string = '等待操作 F-02-03...';
  @State dataSource: SectionedDataSource = new SectionedDataSource();
  initialTotal: number = 0;

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
    this.dataSource.setModel(new LargeListModel());
    this.initialTotal = this.dataSource.totalCount();
    this.updateResult();
  }

  updateResult(): void {
    const total: number = this.dataSource.totalCount();
    this.result = 'LazyForEach 懒加载: 仅创建可视区节点, 滑出回收\n'
      + 'cachedCount=1 (激进回收)\n'
      + '总条目数: ' + total + ' (10段x(1头+5条目+1尾))\n'
      + '滑动后重新进入可视区时正确展示';
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

        Text('F-02-03 列表形态下仅可视区条目展示且滑出后回收')
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
            '1. 点击【分组渲染（线性列表形态）】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【列表形态下仅可视区条目展示且滑出后回收】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 向上滑动屏幕，观察【列表】展示内容 [验证点: 仅展示可视区内的条目]',
            '4. 向下滑动屏幕回到之前位置 [验证点: 条目重新展示且内容正确]'
          ],
            expected_result: '仅可视区条目节点存在；滑出可视区后回收；重新进入时正确展示',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('统计总数')
              .id('btn_count_total')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                const current: number = this.dataSource.totalCount();
                this.result = '当前 totalCount=' + current + '\n'
                  + '初始 totalCount=' + this.initialTotal + '\n'
                  + (current === this.initialTotal ? '一致: 不因滚动变化' : '不一致');
              })

            Text('分组列表预览（可滚动, cachedCount=1, 仅可视区渲染）')
              .fontSize(13)
              .fontColor('#666666')
              .margin({ bottom: 4 })

            Column() {
              SectionedList({
                dataSource: this.dataSource,
                cachedCount: 1,
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
