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

class ZeroItemSectionModel extends SectionedModel {
  sectionCount: number = 0;
  footers: boolean[] = [];

  getSectionCount(): number {
    return this.sectionCount;
  }

  getItemCountForSection(section: number): number {
    return 0;
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
struct TestCaseF0105Page {
  @State result: string = '等待操作 F-01-05...';
  @State hasFooter: boolean = false;
  @State dataSource: SectionedDataSource = new SectionedDataSource();
  model: ZeroItemSectionModel = new ZeroItemSectionModel();

  @Builder
  renderHeader(entry: SectionEntry) {
    SectionedDefaultHeader('段 ' + (entry.section + 1) + '（无条目）')
  }

  @Builder
  renderItem(entry: SectionEntry) {
    Text('条目 段' + (entry.section + 1))
      .fontSize(14)
      .padding(12)
      .width('100%')
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
    this.model.sectionCount = 2;
    this.model.footers = [false, false];
    this.dataSource.setModel(this.model);
    this.updateResult();
  }

  updateResult(): void {
    const total: number = this.dataSource.totalCount();
    this.result = '分组尾: ' + (this.hasFooter ? '有' : '无') + '\n'
      + 'totalCount=' + total + '\n'
      + (this.hasFooter ? '2 头 + 2 尾（无条目）' : '2 头（无条目无尾）');
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

        Text('F-01-05 无条目段仅展示分组头或分组头与分组尾')
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
            '2. 点击【无条目段仅展示分组头或分组头与分组尾】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 观察【分组列表】展示无条目的分组，仅有分组头 [验证点: 无分组尾时仅展示分组头]',
            '4. 将分组尾配置改为有分组尾，观察该段展示 [验证点: 展示分组头与分组尾]',
            '5. 观察【条目总数】 [验证点: 仅包含分组头和分组尾，无条目]'
          ],
            expected_result: '无条目段在有分组尾时展示分组头+分组尾，无分组尾时仅展示分组头；总数正确',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Row() {
              Text('分组尾配置: ')
                .fontSize(14)
                .fontColor('#333333')
              Toggle({ type: ToggleType.Switch, isOn: this.hasFooter })
                .id('toggle_footer')
                .onChange((isOn: boolean) => {
                  this.hasFooter = isOn;
                  this.model.footers = [isOn, isOn];
                  this.dataSource.notifySectionReloaded();
                  this.updateResult();
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Text('分组列表预览（无条目段：头 / 头+尾）')
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
