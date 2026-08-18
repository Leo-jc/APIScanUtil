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

class FruitVeggieModel extends SimpleSectionedModel {
  getSectionCount(): number {
    return 2;
  }

  getItemCountForSection(section: number): number {
    if (section === 0) {
      return 3;
    }
    return 2;
  }

  getSectionHeaderTitle(section: number): string {
    if (section === 0) {
      return '水果';
    }
    return '蔬菜';
  }
}

@Entry
@Component
struct TestCaseF0401Page {
  @State result: string = '等待操作 F-04-01...';
  @State dataSource: SectionedDataSource = new SectionedDataSource();
  private model: FruitVeggieModel = new FruitVeggieModel();
  private sectionItems: string[][] = [['苹果', '香蕉', '橙子'], ['菠菜', '胡萝卜']];

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
    const lines: string[] = [];
    lines.push('段数=' + sections + ', 扁平化总数=' + total);
    lines.push('段0标题: ' + this.model.getSectionHeaderTitle(0));
    lines.push('段1标题: ' + this.model.getSectionHeaderTitle(1));
    lines.push('样式规范(HAR资源): 高度=48vp | 字色=#9E9E9E(灰) | 粗体 | 左右padding=16vp | maxLines=1+Ellipsis');
    lines.push('渲染: headerBuilder 调用 SectionedDefaultHeader(title), 读取 $r(app.float.sectioned_header_height) 等');
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

        Text('F-04-01 简化形态下短标题分组头完整单行展示且高度一致')
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
            '2. 点击【简化形态下短标题分组头完整单行展示且高度一致】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 观察【分组头】显示短标题文本 [验证点: 完整单行显示]',
            '4. 观察【分组头】高度 [验证点: 高度为 48vp]',
            '5. 观察样式细节 [验证点: 灰色文字、粗体、左右留白 16vp，与设计规范一致]'
          ],
            expected_result: '短标题完整单行显示；高度 48vp；样式与设计规范一致',
            postconditions: ''
          })
          // ╚─ FIXED SECTION END ─╝

          // Actions 区
          Column() {
            Text('Actions')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button('刷新样式信息')
              .id('btn_refresh_style')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.updateResult();
              })

            Text('分组列表预览（灰条=分组头 SectionedDefaultHeader / 彩块=条目）')
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
