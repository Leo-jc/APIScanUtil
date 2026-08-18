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
    title: 'F-01 圆形头像底图绘制',
    subtitle: '以组件中心为圆心绘制圆形头像，图片按短边等比放大并居中裁剪后填充圆形区域，作为进度弧的内层视觉锚点常驻显示 · P0 · 3个测试用例',
    pageRoute: 'pages/ModuleF01Page'
  },
  {
    moduleId: 'F-02',
    title: 'F-02 外围渐变进度弧绘制',
    subtitle: '在头像外圈绘制沿圆周分布的渐变色弧带，弧带循环伸缩并整体匀速旋转，由多段弧拼接形成头部粗尾部渐细的拖尾渐变效果 · P0 · 4个测试用例',
    pageRoute: 'pages/ModuleF02Page'
  },
  {
    moduleId: 'F-03',
    title: 'F-03 三态切换与状态绘制分支',
    subtitle: '通过状态枚举在加载中、未点击、已点击三种绘制形态间切换，各状态对应不同绘制分支和动画启停 · P0 · 5个测试用例',
    pageRoute: 'pages/ModuleF03Page'
  },
  {
    moduleId: 'F-04',
    title: 'F-04 触摸按下缩放反馈',
    subtitle: '指针在组件区域按下时以中心为锚点缩放至 0.9，抬起或取消时回弹至 1.0，缩放过程实时重绘头像与进度弧 · P1 · 3个测试用例',
    pageRoute: 'pages/ModuleF04Page'
  },
  {
    moduleId: 'F-05',
    title: 'F-05 动画驱动与可见性联动',
    subtitle: '组件可见且处于加载中状态时启动进度弧与旋转动画，不可见或非加载中状态时停止，重新可见时恢复，动画时长支持运行态修改 · P1 · 5个测试用例',
    pageRoute: 'pages/ModuleF05Page'
  }
  ];

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('InsLoadingAnimation Demo')
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
