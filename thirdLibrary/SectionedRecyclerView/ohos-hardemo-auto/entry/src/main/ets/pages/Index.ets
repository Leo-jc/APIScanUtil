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
    title: 'F-01 分组列表数据源',
    subtitle: '实现分组数据源接口，承担段模型展平、类型分派、变更通知等数据层能力 · P0 · 6个测试用例',
    pageRoute: 'pages/ModuleF01Page'
  },
  {
    moduleId: 'F-02',
    title: 'F-02 分组渲染（线性列表形态）',
    subtitle: '列表形态下按分组顺序渲染分组头/条目/分组尾，支持懒加载与自定义视图类型 · P0 · 6个测试用例',
    pageRoute: 'pages/ModuleF02Page'
  },
  {
    moduleId: 'F-03',
    title: 'F-03 分组渲染（网格形态）',
    subtitle: '网格形态下分组头尾占满整行、条目占单列，支持列数配置 · P0 · 5个测试用例',
    pageRoute: 'pages/ModuleF03Page'
  },
  {
    moduleId: 'F-04',
    title: 'F-04 简化分组适配',
    subtitle: '无分组尾、分组头仅标题文本的简化形态，支持默认样式与自定义注入 · P1 · 7个测试用例',
    pageRoute: 'pages/ModuleF04Page'
  }
  ];

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('SectionedRecyclerView Demo')
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
