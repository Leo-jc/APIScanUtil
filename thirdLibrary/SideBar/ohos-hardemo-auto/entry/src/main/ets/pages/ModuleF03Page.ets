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
    title: 'F-03-01 非空字母列表纵向居中渲染未选中态',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0301Page'
  },
  {
    caseId: 'F-03-02',
    title: 'F-03-02 选中项以圆形高亮背景与变色文字呈现',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0302Page'
  },
  {
    caseId: 'F-03-03',
    title: 'F-03-03 选中背景透明时选中项仅文字变色无背景圆',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0303Page'
  },
  {
    caseId: 'F-03-04',
    title: 'F-03-04 抬起后清除高亮恢复全部未选中态',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0304Page'
  },
  {
    caseId: 'F-03-05',
    title: 'F-03-05 空字母列表时画布空白无任何绘制',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0305Page'
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
        
        Text('F-03 字母索引自绘渲染')
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
