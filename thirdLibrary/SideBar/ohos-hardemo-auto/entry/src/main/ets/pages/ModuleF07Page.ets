import { router } from '@kit.ArkUI';

interface TestCaseEntry {
  caseId: string;
  title: string;
  level: string;
  pageRoute: string;
}

@Entry
@Component
struct ModuleF07Page {
  private testCases: TestCaseEntry[] = [
  {
    caseId: 'F-07-01',
    title: 'F-07-01 固定宽度规格下宽度取规格值',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0701Page'
  },
  {
    caseId: 'F-07-02',
    title: 'F-07-02 自适应宽度规格下宽度取默认与规格较小值',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0702Page'
  },
  {
    caseId: 'F-07-03',
    title: 'F-07-03 无约束宽度规格下宽度取默认值',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0703Page'
  },
  {
    caseId: 'F-07-04',
    title: 'F-07-04 固定高度规格下高度取规格值',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0704Page'
  },
  {
    caseId: 'F-07-05',
    title: 'F-07-05 自适应高度规格下高度取内容与规格较小值',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0705Page'
  },
  {
    caseId: 'F-07-06',
    title: 'F-07-06 无约束高度规格下高度取内容高度',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0706Page'
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
        
        Text('F-07 测量与动态尺寸')
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
