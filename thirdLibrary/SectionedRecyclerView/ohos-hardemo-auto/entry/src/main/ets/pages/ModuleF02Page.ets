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
    title: 'F-02-01 列表形态下单段按分组头、条目、可选分组尾顺序展示',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0201Page'
  },
  {
    caseId: 'F-02-02',
    title: 'F-02-02 列表形态下多段连续展示且段间不混淆',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0202Page'
  },
  {
    caseId: 'F-02-03',
    title: 'F-02-03 列表形态下仅可视区条目展示且滑出后回收',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0203Page'
  },
  {
    caseId: 'F-02-04',
    title: 'F-02-04 列表形态下自定义视图类型使不同段或位置的条目展示不同样式',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0204Page'
  },
  {
    caseId: 'F-02-05',
    title: 'F-02-05 列表形态下无条目段仅展示分组头或分组头与分组尾',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0205Page'
  },
  {
    caseId: 'F-02-06',
    title: 'F-02-06 列表形态下快速滚动时条目节点频繁回收与重新展示且数据正确',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0206Page'
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
        
        Text('F-02 分组渲染（线性列表形态）')
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
