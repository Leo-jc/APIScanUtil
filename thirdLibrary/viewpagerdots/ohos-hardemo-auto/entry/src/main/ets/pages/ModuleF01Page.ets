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
    title: 'F-01-01 默认配置下指示点条容器渲染为黑色圆点横向居中排列',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0101Page'
  },
  {
    caseId: 'F-01-02',
    title: 'F-01-02 自定义点宽高与间距后指示点按指定尺寸渲染',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0102Page'
  },
  {
    caseId: 'F-01-03',
    title: 'F-01-03 自定义选中与未选中视觉样式后指示点按指定样式渲染',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0103Page'
  },
  {
    caseId: 'F-01-04',
    title: 'F-01-04 构造期指定着色后所有指示点统一着色渲染',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0104Page'
  },
  {
    caseId: 'F-01-05',
    title: 'F-01-05 指定自定义选中动画后选中点播放指定动画效果',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0105Page'
  },
  {
    caseId: 'F-01-06',
    title: 'F-01-06 指定自定义反向动画后取消选中点播放指定反向动画',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0106Page'
  },
  {
    caseId: 'F-01-07',
    title: 'F-01-07 指定纵向排列后指示点从上到下排列',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0107Page'
  },
  {
    caseId: 'F-01-08',
    title: 'F-01-08 指定自定义对齐方式后指示点条按指定方式对齐',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0108Page'
  },
  {
    caseId: 'F-01-09',
    title: 'F-01-09 指定部分属性时未指定属性使用默认值渲染',
    level: 'L2',
    pageRoute: 'pages/TestCaseF0109Page'
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
        
        Text('F-01 指示点条容器构造与初始化')
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
