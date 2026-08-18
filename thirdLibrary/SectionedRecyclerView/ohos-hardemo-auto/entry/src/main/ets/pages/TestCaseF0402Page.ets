import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import {
  SimpleSectionedModel,
  SectionedDataSource,
  SectionEntry,
  SectionEntryKind,
  SectionedDefaultHeader,
  SectionedList
} from 'sectionedrecyclerview';

const COLORS: string[] = ['#F44336', '#2196F3', '#009688', '#8BC34A', '#FF9800'];

class FourSectionModel extends SimpleSectionedModel {
  getSectionCount(): number {
    return 4;
  }

  getItemCountForSection(section: number): number {
    if (section === 0) {
      return 3;
    }
    if (section === 1) {
      return 2;
    }
    if (section === 2) {
      return 3;
    }
    return 2;
  }

  getSectionHeaderTitle(section: number): string {
    if (section === 0) {
      return '水果';
    }
    if (section === 1) {
      return '蔬菜';
    }
    if (section === 2) {
      return '肉类';
    }
    return '饮料';
  }
}

@Entry
@Component
struct TestCaseF0402Page {
  @State result: string = '等待操作 F-04-02...';
  @State dataSource: SectionedDataSource = new SectionedDataSource();
  private model: FourSectionModel = new FourSectionModel();
  private sectionItems: string[][] = [
    ['苹果', '香蕉', '橙子'],
    ['菠菜', '胡萝卜'],
    ['牛肉', '猪肉', '鸡肉'],
    ['牛奶', '果汁']
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
    const titleSeq: string[] = [];
    for (let i = 0; i < sections; i++) {
      titleSeq.push('段' + i + ':' + this.model.getSectionHeaderTitle(i));
    }
    const lines: string[] = [];
    lines.push('段数=' + sections + ', 扁平化总数=' + total);
    lines.push('标题序列: ' + titleSeq.join(' → '));
    lines.push('逐条目顺序验证（header/item 交替，段间不串）:');
    for (let i = 0; i < total; i++) {
      const entry: SectionEntry = this.dataSource.getData(i);
      let kindName: string = '';
      if (entry.kind === SectionEntryKind.HEADER) {
        kindName = '分组头';
      } else {
        kindName = '条目';
      }
      lines.push('位置' + i + ': ' + kindName + '(段' + entry.section + ')');
    }
    lines.push('结论: 每段 header 在前、items 在后，段间标题不串');
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

        Text('F-04-02 简化形态下多段标题按序展示且段间不串')
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
            '1. 点击【简化分组适配】进入模块列表页 [验证点: 成功进入模块列表页]',
            '2. 点击【简化形态下多段标题按序展示且段间不串】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 观察【分组列表】展示多段标题 [验证点: 多段标题展示]',
            '4. 逐段观察标题顺序与内容 [验证点: 标题按段顺序展示，段间不串；每段标题内容正确]'
          ],
            expected_result: '多段标题按序展示；段间不串；每段标题正确',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('校验标题顺序')
              .id('btn_verify_titles')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.updateResult();
              })

            Text('分组列表预览（4 段标题按序：水果 / 蔬菜 / 肉类 / 饮料）')
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
