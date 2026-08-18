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
    title: 'F-03-01 启动滚动后立即暂停，画面静止于当前位置不复位',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0301Page'
  },
  {
    caseId: 'F-03-02',
    title: 'F-03-02 启动滚动后立即停止，画面复位到滚动起点',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0302Page'
  },
  {
    caseId: 'F-03-03',
    title: 'F-03-03 滚动中重复启动，不因重复投递产生异常或多重滚动',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0303Page'
  },
  {
    caseId: 'F-03-04',
    title: 'F-03-04 暂停后恢复滚动，从当前位置继续而非从起点',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0304Page'
  },
  {
    caseId: 'F-03-05',
    title: 'F-03-05 暂停后停止，画面复位到滚动起点',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0305Page'
  },
  {
    caseId: 'F-03-06',
    title: 'F-03-06 停止后重新启动，从起点开始滚动',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0306Page'
  },
  {
    caseId: 'F-03-07',
    title: 'F-03-07 重启滚动，先复位再从起点重新滚动',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0307Page'
  },
  {
    caseId: 'F-03-08',
    title: 'F-03-08 未滚动时重复暂停或停止，无可观测变化',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0308Page'
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
        
        Text('F-03 滚动控制 API')
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
