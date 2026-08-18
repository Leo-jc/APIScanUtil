import { router } from '@kit.ArkUI';

interface TestCaseEntry {
  caseId: string;
  title: string;
  level: string;
  pageRoute: string;
}

@Entry
@Component
struct ModuleF05Page {
  private testCases: TestCaseEntry[] = [
  {
    caseId: 'F-05-01',
    title: 'F-05-01 运行时变更内容与对齐后容器自动重新排列',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0501Page'
  },
  {
    caseId: 'F-05-02',
    title: 'F-05-02 运行时清空全部子项后容器内容区归零',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0502Page'
  },
  {
    caseId: 'F-05-03',
    title: 'F-05-03 频繁增删子项后容器布局状态正确无残留',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0503Page'
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
        
        Text('F-05 运行时动态变更')
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
