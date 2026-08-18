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

class CustomStyleModel extends SimpleSectionedModel {
  getSectionCount(): number {
    return 2;
  }

  getItemCountForSection(section: number): number {
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
struct TestCaseF0405Page {
  @State result: string = '等待操作 F-04-05...';
  @State dataSource: SectionedDataSource = new SectionedDataSource();
  @State useCustom: boolean = false;
  private model: CustomStyleModel = new CustomStyleModel();
  private sectionItems: string[][] = [['苹果', '香蕉'], ['菠菜', '胡萝卜']];

  @Builder
  renderHeader(entry: SectionEntry) {
    if (this.useCustom) {
      Row() {
        Text(this.model.getSectionHeaderTitle(entry.section))
          .fontSize(18)
          .fontColor('#FFFFFF')
          .fontWeight(FontWeight.Bold)
          .margin({ left: 16 })
      }
      .width('100%')
      .height(48)
      .backgroundColor('#2196F3')
      .borderRadius(8)
      .alignItems(VerticalAlign.Center)
    } else {
      SectionedDefaultHeader(this.model.getSectionHeaderTitle(entry.section))
    }
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
    const lines: string[] = [];
    lines.push('当前样式: ' + (this.useCustom ? '自定义' : '默认'));
    if (this.useCustom) {
      lines.push('自定义: 蓝底(#2196F3) + 白色粗体 18fp + 圆角8 + 左padding16');
      lines.push('默认样式不出现: 无灰色#9E9E9E文本, 无 SectionedDefaultHeader');
    } else {
      lines.push('默认: SectionedDefaultHeader 灰色#9E9E9E 粗体 48vp 左右padding16');
    }
    lines.push('切换后已调用 dataSource.notifySectionReloaded() 触发 LazyForEach 重建 header');
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

        Text('F-04-05 简化形态下自定义分组头样式完全替代默认样式')
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
            '2. 点击【简化形态下自定义分组头样式完全替代默认样式】进入用例详情页 [验证点: 成功进入用例详情页]',
            '3. 点击【使用自定义样式】开关 [验证点: 切换为自定义样式]',
            '4. 观察【分组头】展示样式 [验证点: 展示自定义样式，完全替代默认文本样式]',
            '5. 观察默认灰色文本样式是否出现 [验证点: 默认样式不出现]'
          ],
            expected_result: '自定义样式完全替代默认样式；默认样式不出现',
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
              Text('使用自定义样式:')
                .fontSize(14)
                .fontColor('#333333')
                .margin({ right: 8 })

              Toggle({ type: ToggleType.Switch, isOn: this.useCustom })
                .id('toggle_custom_style')
                .onChange((isOn: boolean) => {
                  this.useCustom = isOn;
                  this.dataSource.notifySectionReloaded();
                  this.updateResult();
                })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Text('分组列表预览（开关切换：默认灰文本 / 自定义蓝底白字）')
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
