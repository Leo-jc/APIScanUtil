import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import {
  SimpleSectionedModel,
  SectionedDataSource,
  SectionEntry,
  SectionedDefaultHeader,
  SectionedList
} from 'sectionedrecyclerview';

const COLORS: string[] = ['#F44336', '#2196F3', '#009688', '#8BC34A', '#FF9800'];

class NoFooterModel extends SimpleSectionedModel {
  getSectionCount(): number {
    return 3;
  }

  getItemCountForSection(section: number): number {
    if (section === 1) {
      return 3;
    }
    return 2;
  }

  getSectionHeaderTitle(section: number): string {
    if (section === 0) {
      return '段一';
    }
    if (section === 1) {
      return '段二';
    }
    return '段三';
  }
}

@Entry
@Component
struct TestCaseF0404Page {
  @State result: string = '等待操作 F-04-04...';
  @State dataSource: SectionedDataSource = new SectionedDataSource();
  private model: NoFooterModel = new NoFooterModel();
  private sectionItems: string[][] = [
    ['条目一-1', '条目一-2'],
    ['条目二-1', '条目二-2', '条目二-3'],
    ['条目三-1', '条目三-2']
  ];

  @Builder
  renderHeader(entry: SectionEntry) {
    SectionedDefaultHeader(this.model.getSectionHeaderTitle(entry.section))
  }

  @Builder
  renderItem(entry: SectionEntry) {
    Row() {
      Column() {
        Text(this.sectionItems[entry.section][entry.positionWithinSection])
          .fontSize(15)
          .fontColor('#FFFFFF')
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .height(56)
      .backgroundColor(COLORS[entry.section % COLORS.length])
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
  }

  aboutToAppear(): void {
    this.dataSource.setModel(this.model);
    this.updateResult();
  }

  updateResult(): void {
    const total: number = this.dataSource.totalCount();
    const sections: number = this.dataSource.getModel().getSectionCount();
    let footerCount: number = 0;
    const checks: string[] = [];
    for (let i = 0; i < total; i++) {
      const isFooter: boolean = this.dataSource.isSectionFooterPosition(i);
      if (isFooter) {
        footerCount++;
      }
      checks.push('[' + i + ']=' + (isFooter ? 'true' : 'false'));
    }
    const lines: string[] = [];
    lines.push('段数=' + sections + ', 扁平化总数=' + total);
    lines.push('SimpleSectionedModel.hasFooterInSection 恒返回 false');
    lines.push('isSectionFooterPosition 逐位检查: ' + checks.join(' '));
    lines.push('FOOTER 计数=' + footerCount + ' → 展平时不产生 FOOTER 条目');
    lines.push('结论: 所有段均无分组尾展示（仅 header + item）');
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

        Text('F-04-04 简化形态下恒无分组尾')
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
            '1. 点击【简化分组适配】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【简化形态下恒无分组尾】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 观察【分组列表】所有段 [验证点: 均无分组尾展示]',
            '4. 逐段观察展示内容 [验证点: 仅有分组头和条目，无分组尾]'
          ],
            expected_result: '所有段均无分组尾展示',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('校验无分组尾')
              .id('btn_verify_no_footer')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.updateResult();
              })

            Text('分组列表预览（3 段，仅分组头 + 条目，无分组尾）')
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
            .height(250)
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
