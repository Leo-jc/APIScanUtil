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
    title: 'F-01 组件构造与样式配置',
    subtitle: '构造时配置颜色/字号/间距/项高等样式，项高缺省回退字号 · P1 · 3个测试用例',
    pageRoute: 'pages/ModuleF01Page'
  },
  {
    moduleId: 'F-02',
    title: 'F-02 索引内容配置',
    subtitle: '运行态提供字母列表，行数与高度随长度变化并重绘，重复提供时旧内容被替换 · P0 · 4个测试用例',
    pageRoute: 'pages/ModuleF02Page'
  },
  {
    moduleId: 'F-03',
    title: 'F-03 字母索引自绘渲染',
    subtitle: '根据字母列表与选中位置自绘渲染，纵向居中、选中圆形高亮、透明仅变色、空列表空白 · P0 · 5个测试用例',
    pageRoute: 'pages/ModuleF03Page'
  },
  {
    moduleId: 'F-04',
    title: 'F-04 触摸滑动选择交互',
    subtitle: '按下/移动/抬起/取消按触点Y计算选中字母，高亮跟随并通知宿主，越界不选中 · P0 · 5个测试用例',
    pageRoute: 'pages/ModuleF04Page'
  },
  {
    moduleId: 'F-05',
    title: 'F-05 选中项计算与通知',
    subtitle: '命中有效位置时计算选中项，仅位置变化时通知宿主选中信息并高亮 · P1 · 2个测试用例',
    pageRoute: 'pages/ModuleF05Page'
  },
  {
    moduleId: 'F-06',
    title: 'F-06 交互通知绑定',
    subtitle: '提供回调绑定与清除，绑定后触摸通知宿主，清除后仅视觉变化不再通知 · P1 · 2个测试用例',
    pageRoute: 'pages/ModuleF06Page'
  },
  {
    moduleId: 'F-07',
    title: 'F-07 测量与动态尺寸',
    subtitle: '按父布局尺寸规格计算宽高，固定取规格值、自适应取较小值、无约束取默认/内容值 · P1 · 6个测试用例',
    pageRoute: 'pages/ModuleF07Page'
  }
  ];

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('SideBar Demo')
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
