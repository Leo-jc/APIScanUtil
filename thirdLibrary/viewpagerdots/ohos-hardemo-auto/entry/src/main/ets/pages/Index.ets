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
    title: 'F-01 指示点条容器构造与初始化',
    subtitle: '通过自定义属性配置点宽高、间距、视觉样式、着色、动画、方向与对齐，缺省值与原库一致 · P1 · 9个测试用例',
    pageRoute: 'pages/ModuleF01Page'
  },
  {
    moduleId: 'F-02',
    title: 'F-02 绑定轮播数据源',
    subtitle: '接收页数与当前选中索引，绑定有效数据源后渲染指示点并高亮当前页，支持重复绑定 · P0 · 4个测试用例',
    pageRoute: 'pages/ModuleF02Page'
  },
  {
    moduleId: 'F-03',
    title: 'F-03 翻页选中态切换',
    subtitle: '翻页时旧选中点缩小淡出、新选中点放大高亮，含首次选中、连续切换、重复选中与空数据源等场景 · P0 · 6个测试用例',
    pageRoute: 'pages/ModuleF03Page'
  },
  {
    moduleId: 'F-04',
    title: 'F-04 运行时切换点视觉样式',
    subtitle: '运行时更换选中/未选中点视觉样式后立即刷新所有点，不重建、不播动画，保持当前选中态 · P0 · 4个测试用例',
    pageRoute: 'pages/ModuleF04Page'
  },
  {
    moduleId: 'F-05',
    title: 'F-05 运行时着色',
    subtitle: '运行时对所有指示点应用统一着色或清除着色恢复原色，立即生效 · P0 · 3个测试用例',
    pageRoute: 'pages/ModuleF05Page'
  },
  {
    moduleId: 'F-06',
    title: 'F-06 默认资源等价',
    subtitle: '默认指示点为黑色实心圆，默认选中动画为 200ms 内 scale 1.0→1.8 + opacity 0.5→1.0 · P1 · 2个测试用例',
    pageRoute: 'pages/ModuleF06Page'
  }
  ];

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('ViewPager Dots Demo')
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
