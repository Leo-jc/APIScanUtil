import { router } from '@kit.ArkUI';

interface TestCaseEntry {
  caseId: string;
  title: string;
  level: string;
  pageRoute: string;
}

@Entry
@Component
struct ModuleF03Page {
  private testCases: TestCaseEntry[] = [
  {
    caseId: 'F-03-01',
    title: 'F-03-01 首次翻页选中后切换到另一页时旧点淡出新点高亮',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0301Page'
  },
  {
    caseId: 'F-03-02',
    title: 'F-03-02 连续翻页切换时指示点选中态正确切换无残留',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0302Page'
  },
  {
    caseId: 'F-03-03',
    title: 'F-03-03 首次翻页选中后重复选中当前页时选中态动画叠加',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0303Page'
  },
  {
    caseId: 'F-03-04',
    title: 'F-03-04 翻页选中后空数据源翻页不产生视觉变化',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0304Page'
  },
  {
    caseId: 'F-03-05',
    title: 'F-03-05 翻页切换后空数据源翻页时指示点保持当前选中态',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0305Page'
  },
  {
    caseId: 'F-03-06',
    title: 'F-03-06 重复选中当前页后空数据源翻页不产生视觉变化',
    level: 'L2',
    pageRoute: 'pages/TestCaseF0306Page'
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
        
        Text('F-03 翻页选中态切换')
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
