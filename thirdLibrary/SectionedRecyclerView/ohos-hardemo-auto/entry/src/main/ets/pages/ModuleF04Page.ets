import { router } from '@kit.ArkUI';

interface TestCaseEntry {
  caseId: string;
  title: string;
  level: string;
  pageRoute: string;
}

@Entry
@Component
struct ModuleF04Page {
  private testCases: TestCaseEntry[] = [
  {
    caseId: 'F-04-01',
    title: 'F-04-01 简化形态下短标题分组头完整单行展示且高度一致',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0401Page'
  },
  {
    caseId: 'F-04-02',
    title: 'F-04-02 简化形态下多段标题按序展示且段间不串',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0402Page'
  },
  {
    caseId: 'F-04-03',
    title: 'F-04-03 简化形态下超长标题单行尾部省略且不换行',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0403Page'
  },
  {
    caseId: 'F-04-04',
    title: 'F-04-04 简化形态下恒无分组尾',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0404Page'
  },
  {
    caseId: 'F-04-05',
    title: 'F-04-05 简化形态下自定义分组头样式完全替代默认样式',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0405Page'
  },
  {
    caseId: 'F-04-06',
    title: 'F-04-06 简化形态下标题来源于自定义字段时取值正确',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0406Page'
  },
  {
    caseId: 'F-04-07',
    title: 'F-04-07 简化形态下空串标题仍占满分组头高度',
    level: 'L2',
    pageRoute: 'pages/TestCaseF0407Page'
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
        
        Text('F-04 简化分组适配')
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
