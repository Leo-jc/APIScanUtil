import { router } from '@kit.ArkUI';
import { SideBar, SideBarListener } from 'sidebar';
import { HintBubble } from '../components/HintBubble';
import {
  FlatItem,
  ITEM_TYPE_HEADER,
  buildLetterArray,
  buildContactGroups,
  buildListData,
  buildIndexMap
} from '../common/DataUtil';

/**
 * 主页面：联系人列表 + 字母索引侧边栏 + 提示气泡，复刻 Android Demo MainActivity。
 *
 * 布局对应 Android activity_main.xml（ConstraintLayout）：
 * - RecyclerView 全屏 → List 全屏
 * - SideBarView 右侧 50dp 垂直居中 → SideBar .width(50) + Stack CenterEnd
 * - side_hint 提示气泡（gone，translationY=currentY）→ HintBubble if 不渲染 + .position
 *
 * 样式参数通过 @StorageLink 与配置页共享，对应 Android attrs.xml 的 6 个自定义属性（运行态可配置）。
 */
@Entry
@Component
struct Index {
  // 样式配置（与配置页共享），默认值对齐 Android Demo：黑字/白选中字/橙背景/14sp/10dp
  @StorageLink('text_color') textColor: string = '#000000';
  @StorageLink('pressed_text_color') pressedTextColor: string = '#FFFFFF';
  @StorageLink('pressed_bg_color') pressedTextBgColor: string = '#FF8800';
  @StorageLink('text_size') textSize: number = 14;
  @StorageLink('item_spacing') itemSpacing: number = 10;
  @StorageLink('item_height') itemHeight: number = 0; // 0 表示回退字号

  // 列表数据
  @State letters: string[] = buildLetterArray();
  @State listData: FlatItem[] = buildListData(buildContactGroups());
  @State indexMap: Map<string, number> = buildIndexMap(buildContactGroups());

  // 提示气泡状态
  @State hintVisible: boolean = false;
  @State hintY: number = 0;
  @State hintText: string = '';
  @State screenWidth: number = 0;

  private scroller: ListScroller = new ListScroller();
  private sideBarWidth: number = 50; // 对应 Android 50dp
  private hintWidth: number = 60; // 对应 Android 60dp
  private hintMargin: number = 20; // 对应 Android marginRight=20dp

  private scrollToList(selectedValue: string): void {
    let index = this.indexMap.get(selectedValue);
    if (index !== undefined) {
      this.scroller.scrollToIndex(index, true, ScrollAlign.START);
    }
  }

  private buildListener(): SideBarListener {
    return {
      onSideTouchState: (isTouch: boolean) => {
        // 抬起/取消隐藏气泡
        if (!isTouch) {
          this.hintVisible = false;
        }
      },
      onSideSelected: (position: number, currentY: number, selectedValue: string) => {
        // 滚动列表到选中字母 + 显示气泡
        this.scrollToList(selectedValue);
        this.hintY = currentY;
        this.hintText = selectedValue;
        this.hintVisible = true;
      }
    };
  }

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('SideBar')
          .fontSize(18)
          .fontColor($r('app.color.title_bar_text_color'))
          .margin({ left: 16 })

        Blank()

        Text($r('app.string.index_config'))
          .fontSize(16)
          .fontColor($r('app.color.title_bar_text_color'))
          .padding({ left: 12, right: 12, top: 8, bottom: 8 })
          .onClick(() => {
            router.pushUrl({ url: 'pages/Settings' });
          })
      }
      .width('100%')
      .height(56)
      .backgroundColor($r('app.color.title_bar_background'))
      .alignItems(VerticalAlign.Center)

      // 内容区
      Stack() {
        // 联系人列表
        List({ scroller: this.scroller }) {
          ForEach(this.listData, (item: FlatItem, index: number) => {
            ListItem() {
              if (item.type === ITEM_TYPE_HEADER) {
                Text(item.text)
                  .width('100%')
                  .padding({ left: 15, top: 6, bottom: 6 })
                  .fontSize(14)
                  .fontColor($r('app.color.header_text_color'))
                  .backgroundColor($r('app.color.header_background'))
              } else {
                Text(item.text)
                  .width('100%')
                  .padding(15)
                  .fontSize($r('app.float.item_text_size'))
                  .fontColor($r('app.color.item_text_color'))
              }
            }
          }, (item: FlatItem, index: number) => `${index}`)
        }
        .width('100%')
        .height('100%')
        .divider({ strokeWidth: 1, color: $r('app.color.list_divider_color'), startMargin: 15, endMargin: 0 })
        .scrollBar(BarState.Off)
        .edgeEffect(EdgeEffect.Spring)

        // 提示气泡（浮动，绝对定位，在 SideBar 左侧）
        HintBubble({
          text: this.hintText,
          visible: this.hintVisible,
          bubbleWidth: this.hintWidth,
          bubbleBgColor: this.pressedTextBgColor,
          textColor: '#FFFFFF',
        })
          .position({
            x: this.screenWidth - this.sideBarWidth - this.hintMargin - this.hintWidth,
            y: this.hintY
          })

        // 字母侧边栏（右侧垂直居中，对应 ConstraintLayout top+bottom 约束）
        SideBar({
          letters: this.letters,
          textColor: this.textColor,
          pressedTextColor: this.pressedTextColor,
          pressedTextBgColor: this.pressedTextBgColor,
          textSize: this.textSize,
          itemSpacing: this.itemSpacing,
          itemHeight: this.itemHeight,
          onSideBarListener: this.buildListener()
        })
          .width(this.sideBarWidth)
      }
      .width('100%')
      .layoutWeight(1)
      .alignContent(Alignment.End)
      .onAreaChange((old: Area, newArea: Area) => {
        this.screenWidth = Number(newArea.width);
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
  }
}
