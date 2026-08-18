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
    title: 'F-01-01 表格配置有效适配器后完整显示所有行列内容',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0101Page'
  },
  {
    caseId: 'F-01-02',
    title: 'F-01-02 垂直滚动表格时行标题固定不随内容移动',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0102Page'
  },
  {
    caseId: 'F-01-03',
    title: 'F-01-03 水平滚动表格时列标题固定不随内容移动',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0103Page'
  },
  {
    caseId: 'F-01-04',
    title: 'F-01-04 触摸拖拽实现表格双向内容滚动',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0104Page'
  },
  {
    caseId: 'F-01-05',
    title: 'F-01-05 快速滑动后松开表格有惯性滑动效果',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0105Page'
  },
  {
    caseId: 'F-01-06',
    title: 'F-01-06 滚动到任意方向边界时显示渐变阴影提示',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0106Page'
  },
  {
    caseId: 'F-01-07',
    title: 'F-01-07 程序化滚动到指定位置',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0107Page'
  },
  {
    caseId: 'F-01-08',
    title: 'F-01-08 程序化相对当前位置偏移滚动',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0108Page'
  },
  {
    caseId: 'F-01-09',
    title: 'F-01-09 数据变更通知后表格内容全部刷新',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0109Page'
  },
  {
    caseId: 'F-01-10',
    title: 'F-01-10 数据失效通知后表格状态正常',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0110Page'
  },
  {
    caseId: 'F-01-11',
    title: 'F-01-11 查询当前滚动偏移位置与实际一致',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0111Page'
  },
  {
    caseId: 'F-01-12',
    title: 'F-01-12 切换适配器触发表格完全重新布局',
    level: 'L0',
    pageRoute: 'pages/TestCaseF0112Page'
  },
  {
    caseId: 'F-01-13',
    title: 'F-01-13 未设置适配器时表格显示为空',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0113Page'
  },
  {
    caseId: 'F-01-14',
    title: 'F-01-14 视图类型返回越界值时稳定处理',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0114Page'
  },
  {
    caseId: 'F-01-15',
    title: 'F-01-15 空行列数据时显示空表格',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0115Page'
  },
  {
    caseId: 'F-01-16',
    title: 'F-01-16 滚动达到最大边界时不再继续',
    level: 'L1',
    pageRoute: 'pages/TestCaseF0116Page'
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
        
        Text('F-01 TableFixHeaders 双向滚动固定表头表格控件')
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
