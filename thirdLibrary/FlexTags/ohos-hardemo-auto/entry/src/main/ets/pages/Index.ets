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
    title: 'F-01 标签弹性布局容器',
    subtitle: '自定义容器组件，暴露布局参数与数据源挂载接口，按弹性规则排列标签子项 · P0 · 5个测试用例',
    pageRoute: 'pages/ModuleF01Page'
  },
  {
    moduleId: 'F-02',
    title: 'F-02 数据适配器',
    subtitle: '抽象基类，使用方继承实现三个回调驱动容器渲染，数据源变更触发整体重建 · P0 · 3个测试用例',
    pageRoute: 'pages/ModuleF02Page'
  },
  {
    moduleId: 'F-03',
    title: 'F-03 热门搜索页',
    subtitle: '示例页面，随机测试填充标签、点击弹提示、跳转其他示例 · P2 · 6个测试用例',
    pageRoute: 'pages/ModuleF03Page'
  },
  {
    moduleId: 'F-04',
    title: 'F-04 兴趣标签选中页',
    subtitle: '示例页面，固定兴趣标签多选、背景色切换 · P2 · 2个测试用例',
    pageRoute: 'pages/ModuleF04Page'
  },
  {
    moduleId: 'F-05',
    title: 'F-05 个人标签编辑页',
    subtitle: '示例页面，删除已有标签、输入新增标签 · P2 · 4个测试用例',
    pageRoute: 'pages/ModuleF05Page'
  }
  ];

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('FlexTags Demo')
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
