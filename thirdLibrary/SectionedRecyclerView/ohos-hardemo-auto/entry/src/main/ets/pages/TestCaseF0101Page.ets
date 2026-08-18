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

const COLORS: string[] = ['#F44336', '#2196F3', '#009688'];

class ConfigurableSectionModel extends SectionedModel {
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
struct TestCaseF0101Page {
  @State result: string = '等待操作 F-01-01...';
  @State hasFooter: boolean = true;
  @State dataSource: SectionedDataSource = new SectionedDataSource();
  model: ConfigurableSectionModel = new ConfigurableSectionModel();

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
    this.model.sectionCount = 3;
    this.model.itemCounts = [2, 3, 1];
    this.model.footers = [true, true, true];
    this.dataSource.setModel(this.model);
    this.updateResult();
  }

  updateResult(): void {
    const total: number = this.dataSource.totalCount();
    const headers: number = this.model.sectionCount;
    let items: number = 0;
    for (let i = 0; i < this.model.itemCounts.length; i++) {
      items += this.model.itemCounts[i];
    }
    let footers: number = 0;
    for (let i = 0; i < this.model.footers.length; i++) {
      if (this.model.footers[i]) {
        footers += 1;
      }
    }
    this.result = '分组尾: ' + (this.hasFooter ? '有' : '无') + '\n'
      + '总数: ' + total + ' = ' + headers + ' 头 + '
      + items + ' 条目 + ' + footers + ' 尾';
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

        Text('F-01-01 含条目段在有/无分组尾时条目总数与渲染顺序正确')
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
            '2. 点击【含条目段在有/无分组尾时条目总数与渲染顺序正确】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 观察【分组列表】展示含条目的分组，每组有分组头、条目和分组尾 [验证点: 展示顺序为分组头→条目→分组尾]',
            '4. 观察【条目总数】显示的数值 [验证点: 总数等于各段分组头数加条目数加分组尾数之和]',
            '5. 将分组尾配置改为无分组尾，观察【分组列表】展示变化 [验证点: 展示分组头后直接为条目，无分组尾；总数相应减少]'
          ],
            expected_result: '条目总数随分组尾配置变化正确更新；展示顺序始终为分组头→条目→可选分组尾',
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
                  this.model.footers = [isOn, isOn, isOn];
                  this.dataSource.notifySectionReloaded();
                  this.updateResult();
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Text('分组列表预览（分组头→条目→分组尾）')
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
