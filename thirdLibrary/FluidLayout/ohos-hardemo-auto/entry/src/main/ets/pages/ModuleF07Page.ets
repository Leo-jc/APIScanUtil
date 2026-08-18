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
    title: 'F-07-01 容器宽高为固定尺寸时按指定尺寸撑满',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0701Page'
  },
  {
    caseId: 'F-07-02',
    title: 'F-07-02 容器宽高自适应内容时取内容计算值加内边距',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0702Page'
  },
  {
    caseId: 'F-07-03',
    title: 'F-07-03 容器宽高同时为固定尺寸且内容超出时按固定尺寸截断',
    level: 'L2',
    pageRoute: 'pages/TestCaseF0703Page'
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
        
        Text('F-07 尺寸模式自适应')
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
