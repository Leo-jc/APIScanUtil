import { router } from '@kit.ArkUI';

interface TestCaseEntry {
  caseId: string;
  title: string;
  level: string;
  pageRoute: string;
}

@Entry
@Component
struct ModuleF06Page {
  private testCases: TestCaseEntry[] = [
  {
    caseId: 'F-06-01',
    title: 'F-06-01 子项标记为不占位隐藏时不参与测量布局与渲染',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0601Page'
  },
  {
    caseId: 'F-06-02',
    title: 'F-06-02 子项标记为占位隐藏时保留布局位置但不可见',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0602Page'
  },
  {
    caseId: 'F-06-03',
    title: 'F-06-03 部分子项隐藏时其余子项正常参与排列',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0603Page'
  },
  {
    caseId: 'F-06-04',
    title: 'F-06-04 全部子项均标记为不占位隐藏时容器内容区为零',
    level: 'L2',
    pageRoute: 'pages/TestCaseF0604Page'
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
        
        Text('F-06 可见性处理')
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
