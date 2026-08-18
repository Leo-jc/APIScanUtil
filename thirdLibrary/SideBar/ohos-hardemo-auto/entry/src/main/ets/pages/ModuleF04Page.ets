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
    title: 'F-04-01 按下字母时高亮触点字母并通知触摸开始与选中',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0401Page'
  },
  {
    caseId: 'F-04-02',
    title: 'F-04-02 滑动手指时高亮与选中跟随手指移动',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0402Page'
  },
  {
    caseId: 'F-04-03',
    title: 'F-04-03 抬起或取消时清除高亮并通知触摸结束',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0403Page'
  },
  {
    caseId: 'F-04-04',
    title: 'F-04-04 触点落在字母范围外时不选中不通知',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0404Page'
  },
  {
    caseId: 'F-04-05',
    title: 'F-04-05 滑动停留在同一字母时无变化无通知',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0405Page'
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
        
        Text('F-04 触摸滑动选择交互')
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
