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
    title: 'F-03-01 最大透明度下棋盘格纹理完全不透明',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0301Page'
  },
  {
    caseId: 'F-03-02',
    title: 'F-03-02 中间透明度下棋盘格纹理半透明叠加底层',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0302Page'
  },
  {
    caseId: 'F-03-03',
    title: 'F-03-03 零透明度下棋盘格纹理完全不可见',
    level: 'L2',
    pageRoute: 'pages/TestCaseF0303Page'
  },
  {
    caseId: 'F-03-04',
    title: 'F-03-04 超出范围透明度值被限制在有效区间',
    level: 'L2',
    pageRoute: 'pages/TestCaseF0304Page'
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
        
        Text('F-03 运行时透明度调节')
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
