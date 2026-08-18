interface GridCellItem {
  label: string;
  color: string;
}

const GRID_ITEMS: GridCellItem[] = [
  { label: 'A', color: '#FF3B82F6' },
  { label: 'B', color: '#FF8B5CF6' },
  { label: 'C', color: '#FFEF4444' },
  { label: 'D', color: '#FF22C55E' },
  { label: 'E', color: '#FFF97316' },
  { label: 'F', color: '#FF06B6D4' },
];

@CustomDialog
struct InfoDialog {
  controller?: CustomDialogController;
  message: string = '';

  build() {
    Column() {
      Text(this.message)
        .fontSize(15)
        .fontColor('#FF111827')
        .textAlign(TextAlign.Center)
        .width('100%')
        .padding(16)
      Button('关闭')
        .type(ButtonType.Normal)
        .fontSize(14)
        .backgroundColor('#FF1F2937')
        .fontColor('#FFFFFFFF')
        .width(120)
        .height(36)
        .margin({ top: 8, bottom: 16 })
        .onClick(() => {
          if (this.controller) {
            this.controller.close();
          }
        })
    }
    .width('80%')
    .backgroundColor('#FFFFFFFF')
    .borderRadius(12)
    .padding({ top: 24 })
  }
}

@Entry
@Component
struct Index {
  private pathStack: NavPathStack = new NavPathStack();
  private tabsController: TabsController = new TabsController();
  private videoController: VideoController = new VideoController();
  private listScroller: Scroller = new Scroller();
  @State showEmbeddedSheet: boolean = false;
  @State showLargeSheet: boolean = false;
  @State circleRadius: number = 8;
  @State zTop: boolean = false;
  @State progressValue: number = 60;
  @State inputText: string = 'showCounter 示例';
  @State qrValue: string = 'https://developer.huawei.com';
  @State longPressTimes: number = 0;
  @State toggleOn: boolean = false;
  @State matchFull: boolean = false;
  @State listItems: string[] = [];
  private dialogController: CustomDialogController | null = null;

  aboutToAppear(): void {
    this.dialogController = new CustomDialogController({
      builder: InfoDialog({ message: 'CustomDialogController 自定义弹窗' }),
    });
    for (let i = 0; i < 20; i++) {
      this.listItems.push(`列表项 ${i}`);
    }
  }

  private showToast(msg: string): void {
    try {
      this.getUIContext().getPromptAction().showToast({ message: msg, duration: 1500 });
    } catch (err) {
      console.error('showToast failed: ' + JSON.stringify(err));
    }
  }

  private matchParentWidth(): Length | LayoutPolicy {
    if (this.matchFull) {
      return '100%';
    }
    return LayoutPolicy.matchParent;
  }

  build() {
    Navigation(this.pathStack) {
      Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
        TabContent() {
          this.buildInputTab()
        }
        .tabBar($r('app.string.tab_input'))

        TabContent() {
          this.buildLayoutTab()
        }
        .tabBar($r('app.string.tab_layout'))

        TabContent() {
          this.buildDialogTab()
        }
        .tabBar($r('app.string.tab_dialog'))

        TabContent() {
          this.buildStyleTab()
        }
        .tabBar($r('app.string.tab_style'))

        TabContent() {
          this.buildGestureTab()
        }
        .tabBar($r('app.string.tab_gesture'))
      }
      .barOverlap(true)
      .width('100%')
      .height('100%')
    }
    .title({ main: $r('app.string.nav_main'), sub: $r('app.string.nav_sub') })
    .menus([
      {
        value: $r('app.string.menu_source'),
        action: (): void => {
          this.showToast('覆盖版本 5.0.1(13) ~ 26.0.0(26)');
        }
      },
      {
        value: 'push NavDestination',
        action: (): void => {
          this.pathStack.pushPathByName('dest', null);
        }
      }
    ])
    .navDestination(this.PageMap)
    .mode(NavigationMode.Stack)
    .width('100%')
    .height('100%')
  }

  @Builder
  PageMap(name: string) {
    NavDestination() {
      Column() {
        Text('NavDestination title / menus 支持 Resource')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF111827')
          .width('100%')
          .margin({ top: 12, bottom: 8 })
        TextClock({ timeZoneOffset: 0 })
          .format($r('app.string.clock_format'))
          .fontSize(28)
          .fontColor('#FF3B82F6')
        Button('显示 Toast')
          .type(ButtonType.Normal)
          .fontSize(14)
          .backgroundColor('#FF1F2937')
          .fontColor('#FFFFFFFF')
          .margin({ top: 16 })
          .onClick(() => {
            this.showToast('showToast 沉浸式材质');
          })
        Button('返回')
          .type(ButtonType.Normal)
          .fontSize(14)
          .backgroundColor('#FFE5E7EB')
          .fontColor('#FF1F2937')
          .margin({ top: 12 })
          .onClick(() => {
            this.pathStack.pop();
          })
      }
      .width('100%')
      .height('100%')
      .padding(16)
      .alignItems(HorizontalAlign.Center)
    }
    .title({ main: $r('app.string.dest_main'), sub: $r('app.string.dest_sub') })
    .menus([
      {
        value: $r('app.string.dest_menu'),
        action: (): void => {
          this.showToast('NavDestination 菜单使用 Resource');
        }
      }
    ])
  }

  @Builder
  buildInputTab() {
    Scroll() {
      Column() {
        Text('TextInput showCounter')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF111827')
          .width('100%')
          .margin({ top: 8, bottom: 4 })
        TextInput({ text: this.inputText, placeholder: '输入字符观察计数' })
          .width('100%')
          .height(48)
          .maxLength(20)
          .showCounter(true, { thresholdPercentage: 80, highlightBorder: true })
          .onChange((value: string) => {
            this.inputText = value;
          })

        Text('QRCode 深浅色默认配色')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF111827')
          .width('100%')
          .margin({ top: 16, bottom: 4 })
        Row() {
          QRCode(this.qrValue)
            .width(160)
            .height(160)
            .color('#FF000000')
            .backgroundColor('#FFFFFFFF')
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)

        Text('Video 拖拽不再自动播放')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF111827')
          .width('100%')
          .margin({ top: 16, bottom: 4 })
        Video({ controller: this.videoController })
          .controls(true)
          .width('100%')
          .height(160)
          .backgroundColor('#FFE5E7EB')
      }
      .width('100%')
      .padding({ left: 16, right: 16, bottom: 24 })
    }
    .width('100%')
    .height('100%')
    .backToTop(true)
    .scrollBar(BarState.Auto)
  }

  @Builder
  buildLayoutTab() {
    Scroll() {
      Column() {
        Text('List initialIndex 与 Scroller 优先级')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF111827')
          .width('100%')
          .margin({ top: 8, bottom: 4 })
        List({ initialIndex: 3, scroller: this.listScroller }) {
          ForEach(this.listItems, (item: string) => {
            ListItem() {
              Text(item)
                .width('100%')
                .height(40)
                .backgroundColor('#FF3B82F6')
                .fontColor('#FFFFFFFF')
                .textAlign(TextAlign.Center)
                .borderRadius(6)
            }
          }, (item: string) => item)
        }
        .width('100%')
        .height(160)
        .backgroundColor('#FFF9FAFB')
        .borderRadius(8)
        Row() {
          Button('scrollToIndex(10)')
            .type(ButtonType.Normal)
            .fontSize(12)
            .layoutWeight(1)
            .onClick(() => {
              this.listScroller.scrollToIndex(10, true);
            })
          Button('scrollToIndex(0)')
            .type(ButtonType.Normal)
            .fontSize(12)
            .layoutWeight(1)
            .margin({ left: 8 })
            .onClick(() => {
              this.listScroller.scrollToIndex(0, true);
            })
        }
        .width('100%')
        .margin({ top: 8 })

        Text('GridRow columns / GridCol span')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF111827')
          .width('100%')
          .margin({ top: 16, bottom: 4 })
        GridRow({ columns: 4, gutter: { x: 8, y: 8 } }) {
          ForEach(GRID_ITEMS, (item: GridCellItem) => {
            GridCol({ span: 2 }) {
              Text(item.label)
                .width('100%')
                .height(48)
                .backgroundColor(item.color)
                .fontColor('#FFFFFFFF')
                .textAlign(TextAlign.Center)
                .borderRadius(6)
            }
          }, (item: GridCellItem) => item.label)
        }
        .width('100%')

        Text('LayoutPolicy.matchParent 内容区适配')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF111827')
          .width('100%')
          .margin({ top: 16, bottom: 4 })
        Column() {
          Row() {
            Text('matchParent')
              .width('100%')
              .height(36)
              .fontColor('#FF111827')
              .textAlign(TextAlign.Center)
          }
          .width(this.matchParentWidth())
          .backgroundColor('#FFFFD900')
        }
        .width('100%')
        .padding(16)
        .backgroundColor('#FFE5E7EB')
        .border({ width: 1, color: '#FFD1D5DB' })
        .borderRadius(8)
        Button('切换 matchParent 宽度')
          .type(ButtonType.Normal)
          .fontSize(13)
          .width('100%')
          .margin({ top: 8 })
          .onClick(() => {
            this.matchFull = !this.matchFull;
          })
      }
      .width('100%')
      .padding({ left: 16, right: 16, bottom: 24 })
    }
    .width('100%')
    .height('100%')
    .backToTop(true)
    .scrollBar(BarState.Auto)
  }

  @Builder
  buildDialogTab() {
    Scroll() {
      Column() {
        Text('bindSheet SheetMode.EMBEDDED')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF111827')
          .width('100%')
          .margin({ top: 8, bottom: 4 })
        Button('打开 EMBEDDED 半模态')
          .type(ButtonType.Normal)
          .fontSize(13)
          .width('100%')
          .height(40)
          .backgroundColor('#FF1F2937')
          .fontColor('#FFFFFFFF')
          .onClick(() => {
            this.showEmbeddedSheet = true;
          })
          .bindSheet(this.showEmbeddedSheet, this.EmbeddedSheetBuilder(), {
            mode: SheetMode.EMBEDDED,
            detents: [SheetSize.MEDIUM, SheetSize.LARGE],
            showClose: true,
            dragBar: true
          })

        Text('bindSheet SheetSize.LARGE 安全区避让')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF111827')
          .width('100%')
          .margin({ top: 16, bottom: 4 })
        Button('打开 LARGE 半模态')
          .type(ButtonType.Normal)
          .fontSize(13)
          .width('100%')
          .height(40)
          .backgroundColor('#FF1F2937')
          .fontColor('#FFFFFFFF')
          .onClick(() => {
            this.showLargeSheet = true;
          })
          .bindSheet(this.showLargeSheet, this.LargeSheetBuilder(), {
            detents: [SheetSize.LARGE],
            showClose: true,
            dragBar: true
          })

        Text('CustomDialogController')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF111827')
          .width('100%')
          .margin({ top: 16, bottom: 4 })
        Button('打开自定义弹窗')
          .type(ButtonType.Normal)
          .fontSize(13)
          .width('100%')
          .height(40)
          .backgroundColor('#FF1F2937')
          .fontColor('#FFFFFFFF')
          .onClick(() => {
            if (this.dialogController) {
              this.dialogController.open();
            }
          })

        Text('showToast 沉浸式材质')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF111827')
          .width('100%')
          .margin({ top: 16, bottom: 4 })
        Button('显示 Toast')
          .type(ButtonType.Normal)
          .fontSize(13)
          .width('100%')
          .height(40)
          .backgroundColor('#FF1F2937')
          .fontColor('#FFFFFFFF')
          .onClick(() => {
            this.showToast('showToast 在 26.0.0 默认开启沉浸式材质');
          })
      }
      .width('100%')
      .padding({ left: 16, right: 16, bottom: 24 })
    }
    .width('100%')
    .height('100%')
    .backToTop(true)
    .scrollBar(BarState.Auto)
  }

  @Builder
  buildStyleTab() {
    Scroll() {
      Column() {
        Text('Image borderRadius 动态修改')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF111827')
          .width('100%')
          .margin({ top: 8, bottom: 4 })
        Row() {
          Image($r('app.media.startIcon'))
            .width(140)
            .height(140)
            .borderRadius(this.circleRadius)
            .objectFit(ImageFit.Cover)
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
        Slider({ value: this.circleRadius, min: 0, max: 70, step: 1, style: SliderStyle.InSet })
          .width('100%')
          .onChange((value: number) => {
            this.circleRadius = Math.round(value);
          })
        Text(`圆角 ${this.circleRadius}`)
          .fontSize(12)
          .fontColor('#FF4B5563')
          .width('100%')
          .textAlign(TextAlign.End)

        Text('zIndex 与 3D 变换')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF111827')
          .width('100%')
          .margin({ top: 16, bottom: 4 })
        Stack() {
          Column() {
            Text('z1')
              .fontColor('#FFFFFFFF')
              .fontSize(18)
          }
          .width(120)
          .height(120)
          .backgroundColor('#FF3B82F6')
          .borderRadius(12)
          .rotate({ x: 1, y: 0, z: 0, angle: 30 })
          .zIndex(this.zTop ? 1 : 2)
          Column() {
            Text('z2')
              .fontColor('#FFFFFFFF')
              .fontSize(18)
          }
          .width(120)
          .height(120)
          .backgroundColor('#FFF97316')
          .borderRadius(12)
          .rotate({ x: 1, y: 0, z: 0, angle: 30 })
          .zIndex(this.zTop ? 2 : 1)
          .margin({ left: 60, top: 40 })
        }
        .width('100%')
        .height(190)
        Button('切换 zIndex')
          .type(ButtonType.Normal)
          .fontSize(13)
          .width('100%')
          .onClick(() => {
            this.zTop = !this.zTop;
          })

        Text('TextClock format 支持 Resource')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF111827')
          .width('100%')
          .margin({ top: 16, bottom: 4 })
        TextClock({ timeZoneOffset: 0 })
          .format($r('app.string.clock_format'))
          .fontSize(28)
          .fontColor('#FF111827')

        Text('Progress color 渐变色')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF111827')
          .width('100%')
          .margin({ top: 16, bottom: 4 })
        Progress({ value: this.progressValue, total: 100, type: ProgressType.Linear })
          .width('100%')
          .color({ angle: 90, colors: [['#FF3B82F6', 0.0], ['#FF22C55E', 1.0]] })
        Slider({ value: this.progressValue, min: 0, max: 100, step: 5, style: SliderStyle.InSet })
          .width('100%')
          .onChange((value: number) => {
            this.progressValue = Math.round(value);
          })
        Text(`进度 ${this.progressValue}`)
          .fontSize(12)
          .fontColor('#FF4B5563')
          .width('100%')
          .textAlign(TextAlign.End)
      }
      .width('100%')
      .padding({ left: 16, right: 16, bottom: 24 })
    }
    .width('100%')
    .height('100%')
    .backToTop(true)
    .scrollBar(BarState.Auto)
  }

  @Builder
  buildGestureTab() {
    Scroll() {
      Column() {
        Text('Button 默认类型')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF111827')
          .width('100%')
          .margin({ top: 8, bottom: 4 })
        Button('默认 Button（圆角矩形）')
          .width('100%')
          .height(44)

        Text('LongPressGesture 双指长按')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF111827')
          .width('100%')
          .margin({ top: 16, bottom: 4 })
        Text(`双指长按次数 ${this.longPressTimes}`)
          .width('100%')
          .height(80)
          .backgroundColor('#FFE5E7EB')
          .textAlign(TextAlign.Center)
          .borderRadius(8)
          .gesture(
            LongPressGesture({ repeat: false, fingers: 2, duration: 400 })
              .onAction(() => {
                this.longPressTimes++;
              })
          )

        Text('Toggle / Select 触摸热区')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF111827')
          .width('100%')
          .margin({ top: 16, bottom: 4 })
        Row() {
          Toggle({ type: ToggleType.Switch, isOn: this.toggleOn })
            .onChange((isOn: boolean) => {
              this.toggleOn = isOn;
            })
          Select([{ value: '选项一' }, { value: '选项二' }, { value: '选项三' }])
            .selected(0)
            .width(140)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
        .padding(16)
        .backgroundColor('#FFF9FAFB')
        .borderRadius(8)

        Text('backToTop 状态栏回顶')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF111827')
          .width('100%')
          .margin({ top: 16, bottom: 4 })
        Text('点击状态栏可回到本页顶部')
          .fontSize(12)
          .fontColor('#FF4B5563')
          .width('100%')
          .padding(12)
          .backgroundColor('#FFF9FAFB')
          .borderRadius(8)
      }
      .width('100%')
      .padding({ left: 16, right: 16, bottom: 24 })
    }
    .width('100%')
    .height('100%')
    .backToTop(true)
    .scrollBar(BarState.Auto)
  }

  @Builder
  EmbeddedSheetBuilder() {
    Column() {
      Text('SheetMode.EMBEDDED')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor('#FF111827')
      Text('5.0.3 起支持 ESC 键退出')
        .fontSize(13)
        .fontColor('#FF4B5563')
        .margin({ top: 8 })
      Button('关闭')
        .type(ButtonType.Normal)
        .fontSize(14)
        .margin({ top: 16 })
        .onClick(() => {
          this.showEmbeddedSheet = false;
        })
    }
    .width('100%')
    .padding(24)
  }

  @Builder
  LargeSheetBuilder() {
    Column() {
      Text('SheetSize.LARGE')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor('#FF111827')
      Text('5.1.0 起最大高度默认避让状态栏安全区')
        .fontSize(13)
        .fontColor('#FF4B5563')
        .margin({ top: 8 })
      Button('关闭')
        .type(ButtonType.Normal)
        .fontSize(14)
        .margin({ top: 16 })
        .onClick(() => {
          this.showLargeSheet = false;
        })
    }
    .width('100%')
    .padding(24)
  }
}
