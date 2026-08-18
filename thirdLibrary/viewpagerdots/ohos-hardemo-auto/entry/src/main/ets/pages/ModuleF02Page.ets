import { router } from '@kit.ArkUI';

interface TestCaseEntry {
  caseId: string;
  title: string;
  level: string;
  pageRoute: string;
}

@Entry
@Component
struct ModuleF02Page {
  private testCases: TestCaseEntry[] = [
  {
    caseId: 'F-02-01',
    title: 'F-02-01 绑定有效轮播数据源后渲染指示点并高亮当前选中页',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0201Page'
  },
  {
    caseId: 'F-02-02',
    title: 'F-02-02 重复绑定轮播数据源时清除旧点并重建新点',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0202Page'
  },
  {
    caseId: 'F-02-03',
    title: 'F-02-03 绑定空数据源时指示点条保持空白无点渲染',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0203Page'
  },
  {
    caseId: 'F-02-04',
    title: 'F-02-04 已绑定数据源后解绑时指示点消失恢复空白',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0204Page'
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
        
        Text('F-02 绑定轮播数据源')
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
