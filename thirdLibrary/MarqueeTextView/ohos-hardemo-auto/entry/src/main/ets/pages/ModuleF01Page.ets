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
    title: 'F-01-01 短文本时头尾无缝衔接循环滚动',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0101Page'
  },
  {
    caseId: 'F-01-02',
    title: 'F-01-02 长文本时超出部分循环衔接滚动',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0102Page'
  },
  {
    caseId: 'F-01-03',
    title: 'F-01-03 控件远大于文本时间隔自动夹紧不产生负间隔',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0103Page'
  },
  {
    caseId: 'F-01-04',
    title: 'F-01-04 未完成布局或位图未生成时画面空白且不崩溃',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0104Page'
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
        
        Text('F-01 横向滚动文本自绘渲染')
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
