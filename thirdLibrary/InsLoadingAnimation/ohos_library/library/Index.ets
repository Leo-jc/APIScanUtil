/**
 * InsLoadingAnimation HarmonyOS HAR 公开入口。
 *
 * 导出：
 * - `InsLoadingView`：自绘头像加载动画组件（对应 Android `com.qintong.library.InsLoadingView`）
 * - `InsLoadingController`：命令式控制器，对应 Android 的运行态 setter
 * - `InsStatus`：状态枚举（LOADING / CLICKED / UNCLICKED）
 * - `InsStatusChangeListener`：状态变化回调类型
 * - `InsConstants`：自绘常量（用于外部按 Android 语义配置参数）
 */
export { InsLoadingView } from './src/main/ets/components/InsLoadingView';
export { InsLoadingController } from './src/main/ets/components/InsLoadingController';
export { InsStatus, InsStatusChangeListener, InsConstants } from './src/main/ets/components/InsLoadingTypes';
