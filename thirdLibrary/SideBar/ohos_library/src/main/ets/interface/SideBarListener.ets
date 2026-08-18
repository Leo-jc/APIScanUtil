/**
 * SideBar 侧边栏交互回调接口。
 *
 * 对应 Android 端 OnSideBarListener，去除 SideBarView 参数（ArkUI 声明式中宿主持有组件引用，无需回传），
 * 保留 isTouch、position、currentY、selectedValue 等全部可观测数据。
 */
export interface SideBarListener {
  /**
   * 触摸状态回调。
   * 按下时回调 isTouch=true；抬起或取消时回调 isTouch=false。用于驱动提示气泡显示/隐藏。
   */
  onSideTouchState: (isTouch: boolean) => void;

  /**
   * 选中项变化回调。
   * @param position 选中项在 letters 中的索引。
   * @param currentY 选中项在父布局中的 Y 坐标（vp），用于定位提示气泡。
   * @param selectedValue 选中的字符串。
   */
  onSideSelected: (position: number, currentY: number, selectedValue: string) => void;
}
