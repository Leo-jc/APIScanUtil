import { router } from '@kit.ArkUI';
import { ResultPanel } from '../widgets/ResultPanel';
import { TestInfoPanel } from '../widgets/TestInfoPanel';
import {
  SectionedModel,
  SectionedDataSource,
  SectionEntry,
  SectionEntryKind,
  TYPE_ITEM,
  SectionedList
} from 'sectionedrecyclerview';

const VIEW_TYPE_BLUE_BG: number = 100;
const VIEW_TYPE_GREEN_BG: number = 200;

class CustomViewTypeModel extends SectionedModel {
  getSectionCount(): number {
    return 3;
  }

  getItemCountForSection(section: number): number {
    return 2;
  }

  hasFooterInSection(section: number): boolean {
    return false;
  }

  getSectionItemViewType(section: number, position: number): number {
    if (section === 0) {
      return TYPE_ITEM;
    }
    if (section === 1) {
      return VIEW_TYPE_BLUE_BG;
    }
    return VIEW_TYPE_GREEN_BG;
  }
}

@Entry
@Component
struct TestCaseF0204Page {
  @State result: string = '等待操作 F-02-04...';
  @State dataSource: SectionedDataSource = new SectionedDataSource();

  @Builder
  renderHeader(entry: SectionEntry) {
    Row() {
      Text('段 ' + (entry.section + 1) + ' 头')
        .fontSize(15)
        .fontColor('#FFFFFF')
        .fontWeight(FontWeight.Bold)
        .padding(12)
    }
    .width('100%')
    .backgroundColor('#333333')
  }

  @Builder
  renderItem(entry: SectionEntry) {
    if (entry.viewType === TYPE_ITEM) {
      Row() {
        Text('viewType=' + entry.viewType + ' 段' + (entry.section + 1) + ' 位' + (entry.positionWithinSection + 1))
          .fontSize(14)
          .fontColor('#2196F3')
          .padding(12)
      }
      .width('100%')
      .backgroundColor('#FFFFFF')
      .border({ width: 1, color: '#2196F3' })
    } else if (entry.viewType === VIEW_TYPE_BLUE_BG) {
      Row() {
        Text('viewType=' + entry.viewType + ' 段' + (entry.section + 1) + ' 位' + (entry.positionWithinSection + 1))
          .fontSize(14)
          .fontColor('#FFFFFF')
          .padding(12)
      }
      .width('100%')
      .backgroundColor('#2196F3')
    } else {
      Row() {
        Text('viewType=' + entry.viewType + ' 段' + (entry.section + 1) + ' 位' + (entry.positionWithinSection + 1))
          .fontSize(14)
          .fontColor('#FFFFFF')
          .padding(12)
      }
      .width('100%')
      .backgroundColor('#009688')
    }
  }

  aboutToAppear(): void {
    this.dataSource.setModel(new CustomViewTypeModel());
    this.updateResult();
  }

  updateResult(): void {
    const total: number = this.dataSource.totalCount();
    const lines: string[] = [];
    for (let i = 0; i < total; i++) {
      const entry: SectionEntry = this.dataSource.getData(i);
      if (entry.kind === SectionEntryKind.ITEM) {
        lines.push('位置' + i + ': viewType=' + entry.viewType + ' (段' + (entry.section + 1) + ' 位' + (entry.positionWithinSection + 1) + ')');
      }
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

        Text('F-02-04 列表形态下自定义视图类型使不同段或位置的条目展示不同样式')
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
            '2. 点击【列表形态下自定义视图类型使不同段或位置的条目展示不同样式】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 观察【列表】中不同段或位置的条目 [验证点: 展示不同样式]',
            '4. 观察样式与自定义视图类型的对应关系 [验证点: 样式与视图类型正确对应]'
          ],
            expected_result: '不同段或位置条目展示不同样式；样式与自定义视图类型对应',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('刷新 viewType')
              .id('btn_refresh_viewtype')
              .fontSize(14)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.updateResult();
              })

            Text('分组列表预览（段0: 白底蓝字 / 段1: 蓝底白字 / 段2: 绿底白字）')
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
