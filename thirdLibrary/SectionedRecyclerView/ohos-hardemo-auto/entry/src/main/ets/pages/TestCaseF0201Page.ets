import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import {
  SectionedModel,
  SectionedDataSource,
  SectionEntry,
  SectionEntryKind,
  SectionedList
} from 'sectionedrecyclerview';

class SingleSectionListModel extends SectionedModel {
  getSectionCount(): number {
    return 1;
  }

  getItemCountForSection(section: number): number {
    return 3;
  }

  hasFooterInSection(section: number): boolean {
    return true;
  }
}

@Entry
@Component
struct TestCaseF0201Page {
  @State result: string = '等待操作 F-02-01...';
  @State dataSource: SectionedDataSource = new SectionedDataSource();

  @Builder
  renderHeader(entry: SectionEntry) {
    Row() {
      Text('分组头')
        .fontSize(15)
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
      Text('条目 ' + (entry.positionWithinSection + 1))
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
      Text('分组尾')
        .fontSize(13)
        .fontColor('#666666')
        .padding(12)
    }
    .width('100%')
    .backgroundColor('#EEEEEE')
  }

  aboutToAppear(): void {
    this.dataSource.setModel(new SingleSectionListModel());
    this.updateResult();
  }

  updateResult(): void {
    const total: number = this.dataSource.totalCount();
    const lines: string[] = [];
    for (let i = 0; i < total; i++) {
      const entry: SectionEntry = this.dataSource.getData(i);
      let kindName: string = '';
      if (entry.kind === SectionEntryKind.HEADER) {
        kindName = '分组头';
      } else if (entry.kind === SectionEntryKind.ITEM) {
        kindName = '条目 ' + (entry.positionWithinSection + 1);
      } else {
        kindName = '分组尾';
      }
      lines.push('位置 ' + i + ': ' + kindName);
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

        Text('F-02-01 列表形态下单段按分组头、条目、可选分组尾顺序展示')
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
            '2. 点击【列表形态下单段按分组头、条目、可选分组尾顺序展示】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 观察【列表】展示单段分组 [验证点: 顺序为分组头→条目→可选分组尾]',
            '4. 逐个位置观察样式 [验证点: 每个位置样式与对应分组头、条目或分组尾一致]'
          ],
            expected_result: '单段顺序为分组头→条目→可选分组尾；每个位置样式正确',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('刷新顺序')
              .id('btn_refresh_order')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.updateResult();
              })

            Text('分组列表预览（蓝=分组头 / 白=条目 / 灰=分组尾）')
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
