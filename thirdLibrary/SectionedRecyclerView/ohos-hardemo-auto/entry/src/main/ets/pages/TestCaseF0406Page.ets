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

class FieldTitleModel extends SimpleSectionedModel {
  fieldA: string[] = ['苹果类', '蔬菜类', '饮品类'];
  fieldB: string[] = ['Fruits', 'Vegetables', 'Beverages'];
  selectedField: string = 'A';

  getSectionCount(): number {
    return 3;
  }

  getItemCountForSection(section: number): number {
    return 2;
  }

  getSectionHeaderTitle(section: number): string {
    if (this.selectedField === 'A') {
      return this.fieldA[section];
    }
    return this.fieldB[section];
  }
}

@Entry
@Component
struct TestCaseF0406Page {
  @State result: string = '等待操作 F-04-06...';
  @State dataSource: SectionedDataSource = new SectionedDataSource();
  @State selectedField: string = 'A';
  private model: FieldTitleModel = new FieldTitleModel();
  private sectionItems: string[][] = [
    ['苹果', '香蕉'],
    ['菠菜', '胡萝卜'],
    ['牛奶', '果汁']
  ];
  private fieldOptions: SelectOption[] = [
    { value: '字段 A (中文)' },
    { value: '字段 B (英文)' }
  ];

  @Builder
  renderHeaderA(entry: SectionEntry) {
    SectionedDefaultHeader(this.model.fieldA[entry.section])
  }

  @Builder
  renderHeaderB(entry: SectionEntry) {
    SectionedDefaultHeader(this.model.fieldB[entry.section])
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
    this.model.selectedField = this.selectedField;
    this.dataSource.setModel(this.model);
    this.updateResult();
  }

  getHeaderTitle(section: number): string {
    if (this.selectedField === 'A') {
      return this.model.fieldA[section];
    }
    return this.model.fieldB[section];
  }

  updateResult(): void {
    const lines: string[] = [];
    this.model.selectedField = this.selectedField;
    lines.push('当前标题字段: ' + this.selectedField);
    const titles: string[] = [];
    for (let i = 0; i < this.model.getSectionCount(); i++) {
      titles.push('段' + i + '=' + this.getHeaderTitle(i));
    }
    lines.push('各段标题: ' + titles.join(' | '));
    lines.push('取值来源: getSectionHeaderTitle 按 selectedField 返回对应字段值');
    lines.push('切换后已调用 dataSource.notifySectionHeaderChanged() 刷新 header');
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

        Text('F-04-06 简化形态下标题来源于自定义字段时取值正确')
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
            '2. 点击【简化形态下标题来源于自定义字段时取值正确】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 在【标题字段】下拉菜单中选择自定义字段 [验证点: 切换为自定义标题字段]',
            '4. 观察【分组头】显示的标题内容 [验证点: 标题内容与自定义字段值一致]'
          ],
            expected_result: '标题来源为自定义字段时取值正确；展示内容与自定义字段值一致',
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
              Text('标题字段:')
                .fontSize(14)
                .fontColor('#333333')
                .margin({ right: 8 })

              Select(this.fieldOptions)
                .id('select_title_field')
                .selected(this.selectedField === 'A' ? 0 : 1)
                .value(this.selectedField === 'A' ? '字段 A (中文)' : '字段 B (英文)')
                .onSelect((index: number, value: string) => {
                  const nextField: string = index === 0 ? 'A' : 'B';
                  this.selectedField = nextField;
                  this.model.selectedField = nextField;
                  for (let i = 0; i < this.model.getSectionCount(); i++) {
                    this.dataSource.notifySectionHeaderChanged(i);
                  }
                  this.updateResult();
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Text('分组列表预览（切换字段：A=中文类名 / B=英文类名）')
              .fontSize(13)
              .fontColor('#666666')
              .margin({ bottom: 4 })

            Column() {
              if (this.selectedField === 'B') {
                SectionedList({
                  dataSource: this.dataSource,
                  headerBuilder: (entry: SectionEntry): void => { this.renderHeaderB(entry); },
                  itemBuilder: (entry: SectionEntry): void => { this.renderItem(entry); }
                })
              } else {
                SectionedList({
                  dataSource: this.dataSource,
                  headerBuilder: (entry: SectionEntry): void => { this.renderHeaderA(entry); },
                  itemBuilder: (entry: SectionEntry): void => { this.renderItem(entry); }
                })
              }
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
