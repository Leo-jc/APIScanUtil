import { router } from '@kit.ArkUI';

interface ModuleEntry {
  moduleId: string;
  title: string;
  subtitle: string;
  pageRoute: string;
}

@Entry
@Component
struct Index {
  private modules: ModuleEntry[] = [
  {
    moduleId: 'F-01',
    title: 'F-01 TableFixHeaders 双向滚动固定表头表格控件',
    subtitle: '宿主配置 TableAdapter 后，控件呈现可双向滚动、表头固定的表格。支持触摸拖拽滚动、惯性滑动、四种方向滚动边界阴影、视图回收复用、数据变更刷新。 · P0 · 16个测试用例',
    pageRoute: 'pages/ModuleF01Page'
  }
  ];

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('TableFixHeaders Demo')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 16, right: 16, top: 12, bottom: 12 })
      }
      .width('100%')
      .backgroundColor('#F1F3F5')
      
      // 功能模块列表
      List() {
        ForEach(this.modules, (item: ModuleEntry) => {
          ListItem() {
            Row() {
              Column() {
                Text(item.title)
                  .fontSize(16)
                  .fontWeight(FontWeight.Medium)
                  .margin({ bottom: 4 })
                Text(item.subtitle)
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
