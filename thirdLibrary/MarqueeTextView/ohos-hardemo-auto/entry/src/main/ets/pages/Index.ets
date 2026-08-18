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
    title: 'F-01 横向滚动文本自绘渲染',
    subtitle: '将文本渲染为位图，并以两份位图错位贴图实现头尾无缝衔接的横向滚动，依据文本宽度与控件宽度的关系分为短文本循环与长文本循环两条绘制分支。 · P0 · 4个测试用例',
    pageRoute: 'pages/ModuleF01Page'
  },
  {
    moduleId: 'F-02',
    title: 'F-02 帧驱动滚动动画与速率归一化',
    subtitle: '以屏幕刷新率为基准驱动每帧位移，按基准帧率与当前刷新率比值计算每帧位移量，保证不同刷新率设备每秒滚动距离一致。 · P0 · 3个测试用例',
    pageRoute: 'pages/ModuleF02Page'
  },
  {
    moduleId: 'F-03',
    title: 'F-03 滚动控制 API',
    subtitle: '对外提供滚动启动、暂停、停止、重启控制，涉及停止、滚动、暂停三个状态之间的迁移，暂停保留当前位置不复位，停止复位到起点，重启先复位再启动。 · P0 · 8个测试用例',
    pageRoute: 'pages/ModuleF03Page'
  },
  {
    moduleId: 'F-04',
    title: 'F-04 文本与字号变更及自动重建',
    subtitle: '运行期变更文本或字号后自动重建位图并重启滚动，保持滚动内容与最新配置一致；构造期父类先调用时不触发重建以避免空引用。 · P0 · 5个测试用例',
    pageRoute: 'pages/ModuleF04Page'
  },
  {
    moduleId: 'F-05',
    title: 'F-05 构造期自定义属性',
    subtitle: '在构造时一次性读取滚动间隔与速度两个自定义属性，运行期不可变；初始化后强制单行。 · P1 · 4个测试用例',
    pageRoute: 'pages/ModuleF05Page'
  },
  {
    moduleId: 'F-06',
    title: 'F-06 生命周期与资源释放',
    subtitle: '控件从窗口分离时停止帧驱动并释放离屏位图资源，避免内存泄漏或残留；已停止时分离无可观测变化。 · P0 · 2个测试用例',
    pageRoute: 'pages/ModuleF06Page'
  }
  ];

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('MarqueeTextView Demo')
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
