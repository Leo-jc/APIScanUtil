import { router } from '@kit.ArkUI';

interface TestCaseEntry {
  caseId: string;
  title: string;
  level: string;
  pageRoute: string;
}

@Entry
@Component
struct ModuleF01Page {
  private testCases: TestCaseEntry[] = [
  {
    caseId: 'F-01-01',
    title: 'F-01-01 日历正确显示当前月份布局，可配置样式属性生效',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0101Page'
  },
  {
    caseId: 'F-01-02',
    title: 'F-01-02 单次点击日期可选中该日期，再次点击其他不同日期形成范围选择',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0102Page'
  },
  {
    caseId: 'F-01-03',
    title: 'F-01-03 日期选中和范围选择完成后宿主收到通知',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0103Page'
  },
  {
    caseId: 'F-01-04',
    title: 'F-01-04 CalendarDay 日期对象可表达指定日期，SelectedDays 选择容器正确追踪选中状态',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0104Page'
  },
  {
    caseId: 'F-01-05',
    title: 'F-01-05 宿主提供的最大年份小于当前年份时日历无月份显示',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0105Page'
  },
  {
    caseId: 'F-01-06',
    title: 'F-01-06 点击日期网格有效区域以外的空白处无选中事件',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0106Page'
  },
  {
    caseId: 'F-01-07',
    title: 'F-01-07 日期范围选择可跨越月份边界',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0107Page'
  },
  {
    caseId: 'F-01-08',
    title: 'F-01-08 CalendarDay 处理闰年2月29日、年初年末等边缘日期值',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0108Page'
  }
  ];

  build() {
    Column() {
      // 标题栏
      Row() {
        Image($r('sys.media.ohos_ic_public_arrow_left'))
          .width(24)
          .height(24)
          .fillColor('#333333')
          .onClick(() => {
            router.back();
          })
          .margin({ left: 16 })
        
        Text('F-01 日历日期选择器')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12, right: 16, top: 12, bottom: 12 })
          .layoutWeight(1)
      }
      .width('100%')
      .backgroundColor('#F1F3F5')
      
      // 测试用例列表
      List() {
        ForEach(this.testCases, (item: TestCaseEntry) => {
          ListItem() {
            Row() {
              Column() {
                Text(item.title)
                  .fontSize(15)
                  .fontWeight(FontWeight.Medium)
                  .margin({ bottom: 4 })
                Text('优先级: ' + item.level)
                  .fontSize(12)
                  .fontColor('#666666')
              }
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)
              
              Image($r('sys.media.ohos_ic_public_arrow_right'))
                .width(24)
                .height(24)
                .fillColor('#999999')
            }
            .width('100%')
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(8)
            .margin({ top: 8, bottom: 8, left: 12, right: 12 })
            .onClick(() => {
              router.pushUrl({ url: item.pageRoute });
            })
          }
        })
      }
      .width('100%')
      .layoutWeight(1)
      .backgroundColor('#F1F3F5')
    }
    .width('100%')
    .height('100%')
  }
}
