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
    title: 'F-01-01 头部、普通条目和尾部数据可独立装配且条目总数正确',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0101Page'
  },
  {
    caseId: 'F-01-02',
    title: 'F-01-02 列表按位置正确区分条目类别并展示对应数据',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0102Page'
  },
  {
    caseId: 'F-01-03',
    title: 'F-01-03 尾部条目显隐切换及数据变更后列表正确刷新',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0103Page'
  },
  {
    caseId: 'F-01-04',
    title: 'F-01-04 列表数据为空时提示错误',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0104Page'
  },
  {
    caseId: 'F-01-05',
    title: 'F-01-05 普通条目位置越界时的异常处理',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0105Page'
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
        
        Text('F-01 HeaderRecyclerViewAdapter')
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
