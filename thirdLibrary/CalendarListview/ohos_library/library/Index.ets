// CalendarListview SDK — 统一导出入口
//
// 注意：所有月份（month）参数均为 0-indexed
//  0 = January, 1 = February, ..., 11 = December
// 与 JS Date.getMonth() 和 Android Calendar.JANUARY 行为一致

// 数据模型
export { CalendarDay } from './src/main/ets/model/CalendarDay';
export { SelectedDays } from './src/main/ets/model/SelectedDays';

// 宿主契约接口
export { DatePickerController } from './src/main/ets/model/DatePickerController';

// 日期计算工具
export { CalendarUtils } from './src/main/ets/utils/CalendarUtils';

// 主入口组件（本 WU-03 新增）
export { DayPickerView } from './src/main/ets/components/DayPickerView';

// 样式配置（本 WU-03 新增，仅导出 type）
export type { DayPickerStyleConfig } from './src/main/ets/components/DayPickerStyleConfig';
