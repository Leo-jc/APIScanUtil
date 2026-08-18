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
    title: 'F-01 流式换行布局',
    subtitle: '子项从左到右排列，超宽换行，多行自上而下堆叠 · P0 · 4个测试用例',
    pageRoute: 'pages/ModuleF01Page'
  },
  {
    moduleId: 'F-02',
    title: 'F-02 容器级垂直对齐',
    subtitle: '容器级 top/center/bottom 对齐，运行态可变 · P0 · 4个测试用例',
    pageRoute: 'pages/ModuleF02Page'
  },
  {
    moduleId: 'F-03',
    title: 'F-03 逐子项垂直对齐覆盖',
    subtitle: '单个子项可单独指定对齐，覆盖容器默认，同内可混合 · P0 · 7个测试用例',
    pageRoute: 'pages/ModuleF03Page'
  },
  {
    moduleId: 'F-04',
    title: 'F-04 外边距与内边距',
    subtitle: 'margins 与 padding 参与换行判定与行高计算 · P1 · 4个测试用例',
    pageRoute: 'pages/ModuleF04Page'
  },
  {
    moduleId: 'F-05',
    title: 'F-05 运行时动态变更',
    subtitle: '运行时增删子项、切换对齐触发重排 · P0 · 3个测试用例',
    pageRoute: 'pages/ModuleF05Page'
  },
  {
    moduleId: 'F-06',
    title: 'F-06 可见性处理',
    subtitle: '不占位隐藏的子项不参与测量/布局/渲染 · P1 · 4个测试用例',
    pageRoute: 'pages/ModuleF06Page'
  },
  {
    moduleId: 'F-07',
    title: 'F-07 尺寸模式自适应',
    subtitle: '固定尺寸或自适应内容，决定容器最终尺寸 · P1 · 3个测试用例',
    pageRoute: 'pages/ModuleF07Page'
  }
  ];

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('FluidLayout Demo')
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
