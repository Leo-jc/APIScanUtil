# HarmonyOS 三方库升级 — 系统 API 变更与行为变更清单

生成时间：2026-08-17 17:06:45

## 升级窗口

- **源 API 版本**：12
- **目标 API 版本**：26
- **统计区间**：(12, 26]

## 汇总

- 使用的系统 API 数：**13**
- 系统 API 变更条目：**1094**（按 API 分组：**263** 个）
- 行为变更条目：**207**（按 API 分组：**12** 个）
- 变更条目合计：**1301**
- 审查结论（确定性启发式审查）：真实 **1285** / 误报 **0** / 存疑 **16**（误报条目已从下方清单过滤，存疑条目标注保留）

> 下方按 API 分组列出，每组给出变更类型 / 影响版本 / 变更影响 / 变更证据 URL 及全部涉及代码位置。同一 API 的多个调用位置聚拢展示，便于逐接口核对。

## 系统 API 变更（按 API 分组，共 263 个 API；已过滤误报 0 条）

### `MODE_AUTO = -1` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.0(20)
- **变更影响**：20
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-formkit-6001
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:1`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:10`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:1` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:10` |

  </details>

### `MODE_DARK = 0` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.0(20)
- **变更影响**：20
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-formkit-6001
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:1`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:10`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:1` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:10` |

  </details>

### `MODE_LIGHT = 1` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.0(20)
- **变更影响**：20
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-formkit-6001
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:1`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:10`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:1` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:10` |

  </details>

### `\[index: number\]: T` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：401
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkts-7001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:69`（来源：代码扫描）

### `backgroundColor(color: Optional<ResourceColor>): ArcDotIndicator` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：backgroundColor(color: Optional<ResourceColor>): ArcDotIndicator;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 9 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:128`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:165`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:67`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:138`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:177`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:79`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:105`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:116`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:36`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:128` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:165` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:67` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:138` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:177` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:79` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\SelectSimplePage.ets:105` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\SelectSimplePage.ets:116` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\SelectSimplePage.ets:36` |

  </details>

### `backgroundColor(color: Optional<ResourceColor>): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.0(20)
- **变更影响**：backgroundColor(color: Optional<ResourceColor \| ColorMetrics>): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 9 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:128`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:165`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:67`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:138`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:177`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:79`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:105`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:116`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:36`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:128` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:165` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:67` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:138` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:177` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:79` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:105` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:116` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:36` |

  </details>

### `backgroundColor(value: ResourceColor): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围不是包含关系
- **影响版本**：5.1.0(18)
- **变更影响**：backgroundColor(color: Optional<ResourceColor>): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 9 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:128`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:165`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:67`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:138`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:177`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:79`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:105`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:116`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:36`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:128` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:165` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:67` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:138` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:177` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:79` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\SelectSimplePage.ets:105` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\SelectSimplePage.ets:116` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\SelectSimplePage.ets:36` |

  </details>

### `bind(id: string): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：bind(id: string): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\components\FlexTags.ets:100`（来源：代码扫描）

### `borderRadius(radius: Dimension | BorderRadiuses): T` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：borderRadius(radius: Dimension \| BorderRadiuses): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5031
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:68`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:80`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:39`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:68` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:80` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:39` |

  </details>

### `borderRadius(value: Length | BorderRadiuses | LocalizedBorderRadiuses): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.2(22)
- **变更影响**：borderRadius(value: Length \| BorderRadiuses \| LocalizedBorderRadiuses, type?: RenderStrategy): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:68`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:80`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:39`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\EditSimplePage.ets:68` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:80` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\SelectSimplePage.ets:39` |

  </details>

### `borderRadius: number` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：borderRadius: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-formkit-6001
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:68`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:80`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:39`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:68` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:80` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:39` |

  </details>

### `borderRadius?: Length` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：borderRadius?: Length;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:68`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:80`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:39`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\EditSimplePage.ets:68` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:80` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\SelectSimplePage.ets:39` |

  </details>

### `borderRadius?: LengthMetrics` ✅

- **变更类型**：接口新增可选属性
- **影响版本**：26.0.0 Beta2、5.1.0(18)
- **变更影响**：borderRadius?: LengthMetrics;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:68`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:80`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:39`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:68` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:80` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\SelectSimplePage.ets:39` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:68` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:80` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:39` |

  </details>

### `borderRadius?: LengthMetrics | BorderRadiuses | LocalizedBorderRadiuses` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.0.2(22)
- **变更影响**：borderRadius?: LengthMetrics \| BorderRadiuses \| LocalizedBorderRadiuses;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:68`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:80`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:39`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:68` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:80` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:39` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\EditSimplePage.ets:68` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:80` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\SelectSimplePage.ets:39` |

  </details>

### `controller: functionalInputComponentManager.FunctionalInputController` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：controller: functionalInputComponentManager.FunctionalInputController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-scenariofusionkit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\components\FlexTags.ets:100`（来源：代码扫描）

### `controller: loginComponentManager.LoginPanelController` ✅

- **变更类型**：新增装饰器
- **影响版本**：26.0.0 Beta2
- **变更影响**：Require
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-accountkit-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\components\FlexTags.ets:100`（来源：代码扫描）

### `controller: loginComponentManager.LoginWithHuaweiIDButtonController` ✅

- **变更类型**：新增装饰器
- **影响版本**：26.0.0 Beta2
- **变更影响**：Require
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-accountkit-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\components\FlexTags.ets:100`（来源：代码扫描）

### `controller: readerCore.ReaderComponentController` ✅

- **变更类型**：新增API
- **影响版本**：5.0.4(16)
- **变更影响**：controller: readerCore.ReaderComponentController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-readerkit-504
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\components\FlexTags.ets:100`（来源：代码扫描）

### `controller?: FunctionController` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.0.1(21)
- **变更影响**：controller?: FunctionController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-agentframeworkkit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\components\FlexTags.ets:100`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\components\FlexTags.ets:100` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:100` |

  </details>

### `controller?: HdsTabsController` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：controller?: HdsTabsController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\components\FlexTags.ets:100`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:100` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:100` |

  </details>

### `controller?: SearchController` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：controller?: SearchController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\components\FlexTags.ets:100`（来源：代码扫描）

### `controller?: ShaderEffectController` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：controller?: ShaderEffectController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\components\FlexTags.ets:100`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:100` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:100` |

  </details>

### `controller?: TabsController` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：controller?: TabsController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\components\FlexTags.ets:100`（来源：代码扫描）

### `controller?: TextClockController` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：controller?: TextClockController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\components\FlexTags.ets:100`（来源：代码扫描）

### `declare type AccessibilityActionInterceptCallback = (action: AccessibilityAction) => AccessibilityActionInterceptResult` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type AccessibilityActionInterceptCallback = (action: AccessibilityAction) => AccessibilityActionInterceptResult;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type AccessibilityFocusCallback = (isFocus: boolean) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type AccessibilityFocusCallback = (isFocus: boolean) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type AccessibilityTransparentCallback = (event: TouchEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type AccessibilityTransparentCallback = (event: TouchEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type AnimationEndHandler = (index: number, event: SwiperAnimationEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type AnimationEndHandler = (index: number, event: SwiperAnimationEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type AnimationStartHandler = (index: number, targetIndex: number, event: SwiperAnimationEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type AnimationStartHandler = (index: number, targetIndex: number, event: SwiperAnimationEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type ArcScrollIndexHandler = (start: number, end: number, center: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type ArcScrollIndexHandler = (start: number, end: number, center: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type ArcSliderChangeHandler = (progress: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type ArcSliderChangeHandler = (progress: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type ArcSliderEnlargeHandler = (isEnlarged: boolean) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type ArcSliderEnlargeHandler = (isEnlarged: boolean) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type ArcSliderTouchHandler = (event: TouchEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type ArcSliderTouchHandler = (event: TouchEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type AreaChangeCallback = (oldValue: Area, newValue: Area) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type AreaChangeCallback = (oldValue: Area, newValue: Area) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type BuilderCallback = (...args: Args) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：declare type BuilderCallback = (...args: Args) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type BusinessError<T> = import('../api/@ohos.base').BusinessError<T>` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type BusinessError<T> = import('../api/@ohos.base').BusinessError<T>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type CommonModifier = import('../api/arkui/CommonModifier').CommonModifier` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：declare type CommonModifier = import('../api/arkui/CommonModifier').CommonModifier;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type ContentWillScrollCallback = (result: SwiperContentWillScrollResult) => boolean` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：declare type ContentWillScrollCallback = (result: SwiperContentWillScrollResult) => boolean;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5031
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type CustomBuilderT<T> = (t: T) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：declare type CustomBuilderT<T> = (t: T) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type CustomBuilderWithId = (id: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type CustomBuilderWithId = (id: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type DataLoadParams = import('../api/@ohos.data.unifiedDataChannel').default.DataLoadParams` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type DataLoadParams = import('../api/@ohos.data.unifiedDataChannel').default.DataLoadParams;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type DataSyncOptions = import('../api/@ohos.data.unifiedDataChannel').default.GetDataParams` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：declare type DataSyncOptions = import('../api/@ohos.data.unifiedDataChannel').default.GetDataParams;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type DidScrollCallback = (yOffset: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：declare type DidScrollCallback = (yOffset: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-penkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type DragSpringLoadingConfiguration = import('../api/@ohos.arkui.dragController').default.DragSpringLoadingConfiguration` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type DragSpringLoadingConfiguration = import('../api/@ohos.arkui.dragController').default.DragSpringLoadingConfiguration;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type DrawableDescriptor = import('../api/@ohos.arkui.drawableDescriptor').DrawableDescriptor` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：declare type DrawableDescriptor = import('../api/@ohos.arkui.drawableDescriptor').DrawableDescriptor;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type EditableTextOnChangeCallback = (value: string, previewText?: PreviewText) => void` ✅

- **变更类型**：自定义类型变更
- **影响版本**：5.0.3(15)
- **变更影响**：options?: TextChangeOptions
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.3(15) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.3(15) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.3(15) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type EnvDecorator = (value: SystemProperties) => PropertyDecorator` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：declare type EnvDecorator = (value: SystemProperties) => PropertyDecorator;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type FinishAnimationHandler = () => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type FinishAnimationHandler = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type FontVariation = import('../api/@ohos.graphics.text').default.FontVariation` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type FontVariation = import('../api/@ohos.graphics.text').default.FontVariation;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type FrameNode = import('../api/arkui/FrameNode').FrameNode` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：declare type FrameNode = import('../api/arkui/FrameNode').FrameNode;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b105
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type GestureCollectInterceptCallback = (recognizers: Array<GestureRecognizer>, touchRecognizers?: Array<TouchRecognizer>) => GestureCollectIntervention` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type GestureCollectInterceptCallback = (recognizers: Array<GestureRecognizer>, touchRecognizers?: Array<TouchRecognizer>) => GestureCollectIntervention;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type GestureRecognizerJudgeBeginCallback = (event: BaseGestureEvent, current: GestureRecognizer, recognizers: Array<GestureRecognizer>) => GestureJudgeResult` ✅

- **变更类型**：自定义类型变更
- **影响版本**：6.0.0(20)
- **变更影响**：touchRecognizers?: Array<TouchRecognizer>
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type GestureSwipeHandler = (index: number, event: SwiperAnimationEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type GestureSwipeHandler = (index: number, event: SwiperAnimationEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type HdsListItemCardInterface = (options: HdsListItemCardOptions) => HdsListItemCardAttribute` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：declare type HdsListItemCardInterface = (options: HdsListItemCardOptions) => HdsListItemCardAttribute;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type HdsSceneFinishCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.0.2(22)、6.1.0(23)
- **变更影响**：declare type HdsSceneFinishCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 6.0.2(22) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.2(22) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.2(22) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.2(22) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type HdsTabsInterface = (options?: HdsTabsOptions) => HdsTabsAttribute` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：declare type HdsTabsInterface = (options?: HdsTabsOptions) => HdsTabsAttribute;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type HdsVisualComponentInterface = () => HdsVisualComponentAttribute` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：declare type HdsVisualComponentInterface = () => HdsVisualComponentAttribute;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type ImageMatrix = import('../api/@ohos.matrix4').default.Matrix4Transit` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：declare type ImageMatrix = import('../api/@ohos.matrix4').default.Matrix4Transit;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type ImmersiveMode = import('../api/@ohos.promptAction').ImmersiveMode` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：declare type ImmersiveMode = import('../api/@ohos.promptAction').ImmersiveMode;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type IndexChangedHandler = (index: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type IndexChangedHandler = (index: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type InitCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type InitCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-penkit-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type InputEventListener = (event: RawInputEventWrapper) => InputEventInterceptResult` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type InputEventListener = (event: RawInputEventWrapper) => InputEventInterceptResult;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type InputMethodExtraConfig = import('../api/@ohos.inputMethod.ExtraConfig').InputMethodExtraConfig` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：declare type InputMethodExtraConfig = import('../api/@ohos.inputMethod.ExtraConfig').InputMethodExtraConfig;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type InterceptionCallback = (from: NavPathInfo | NavBar, to: NavPathInfo | NavBar, pathStack: NavPathStack, operation: NavigationOperation, isAnimated: boolean) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：declare type InterceptionCallback = (from: NavPathInfo \| NavBar, to: NavPathInfo \| NavBar, pathStack: NavPathStack, operation: NavigationOperation, isAnimated: boolean) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type LevelMode = import('../api/@ohos.promptAction').LevelMode` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：declare type LevelMode = import('../api/@ohos.promptAction').LevelMode;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type LevelOrder = import('../api/@ohos.promptAction').LevelOrder` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type LevelOrder = import('../api/@ohos.promptAction').LevelOrder;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type Material = import('../api/@ohos.arkui.uiMaterial').default.Material` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type Material = import('../api/@ohos.arkui.uiMaterial').default.Material;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type Matrix4Transit = import('../api/@ohos.matrix4').default.Matrix4Transit` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type Matrix4Transit = import('../api/@ohos.matrix4').default.Matrix4Transit;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type MenuCallback = (start: number, end: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：declare type MenuCallback = (start: number, end: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type MonitorDecorator = (value: string, ...args: string\[\]) => MethodDecorator` ✅

- **变更类型**：API卡片权限变更
- **影响版本**：6.1.0(23)
- **变更影响**：form
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type NavDestinationBuildFunction = (name: string, param?: object) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：declare type NavDestinationBuildFunction = (name: string, param?: object) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type NavDestinationTransitionDelegate = (operation: NavigationOperation, isEnter: boolean) => Array<NavDestinationTransition> | undefined` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：declare type NavDestinationTransitionDelegate = (operation: NavigationOperation, isEnter: boolean) => Array<NavDestinationTransition> \| undefined;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type NodeRenderStateChangeCallback = (state: NodeRenderState, node?: FrameNode) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type NodeRenderStateChangeCallback = (state: NodeRenderState, node?: FrameNode) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnActionCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type OnActionCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnActionTextClickCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type OnActionTextClickCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnAlphabetIndexerPopupSelectCallback = (index: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnAlphabetIndexerPopupSelectCallback = (index: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnAlphabetIndexerRequestPopupDataCallback = (index: number) => Array<string>` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnAlphabetIndexerRequestPopupDataCallback = (index: number) => Array<string>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnAlphabetIndexerSelectCallback = (index: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnAlphabetIndexerSelectCallback = (index: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnChangeCallback = (value: boolean) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type OnChangeCallback = (value: boolean) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnChangedCallback = (callbackParam: CallbackParamV2) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type OnChangedCallback = (callbackParam: CallbackParamV2) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnCheckboxChangeCallback = (value: boolean) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnCheckboxChangeCallback = (value: boolean) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnCheckboxGroupChangeCallback = (value: CheckboxGroupResult) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnCheckboxGroupChangeCallback = (value: CheckboxGroupResult) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnContainerCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type OnContainerCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnContentScrollCallback = (totalOffsetX: number, totalOffsetY: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnContentScrollCallback = (totalOffsetX: number, totalOffsetY: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnDidStopDraggingCallback = (willFling: boolean) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.1(21)
- **变更影响**：declare type OnDidStopDraggingCallback = (willFling: boolean) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6011
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnDragEventCallback = (event: DragEvent, extraParams?: string) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：declare type OnDragEventCallback = (event: DragEvent, extraParams?: string) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnFoldStatusChangeCallback = (event: OnFoldStatusChangeInfo) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnFoldStatusChangeCallback = (event: OnFoldStatusChangeInfo) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnGetPreviewBadgeCallback = () => boolean | number` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：declare type OnGetPreviewBadgeCallback = () => boolean \| number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnGridScrollIndexCallback = (first: number, last: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：declare type OnGridScrollIndexCallback = (first: number, last: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnHomeShowOnTopCallback = (name: string) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：declare type OnHomeShowOnTopCallback = (name: string) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnHoverCallback = (status: boolean, event: HoverEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：declare type OnHoverCallback = (status: boolean, event: HoverEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnHoverStatusChangeCallback = (param: HoverEventParam) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnHoverStatusChangeCallback = (param: HoverEventParam) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnItemDragStartCallback = (event: ItemDragInfo, itemIndex: number) => CustomBuilder` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：declare type OnItemDragStartCallback = (event: ItemDragInfo, itemIndex: number) => CustomBuilder;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnListScrollIndexCallback = (start: number, end: number, center: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：declare type OnListScrollIndexCallback = (start: number, end: number, center: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnNativeLoadCallback = (event?: object) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnNativeLoadCallback = (event?: object) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnNavigationModeChangeCallback = (mode: NavigationMode) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：declare type OnNavigationModeChangeCallback = (mode: NavigationMode) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnNeedSoftkeyboardCallback = () => boolean` ✅

- **变更类型**：新增API
- **影响版本**：6.1.1(24)
- **变更影响**：declare type OnNeedSoftkeyboardCallback = () => boolean;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6111
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnPasteCallback = (content: string, event: PasteEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnPasteCallback = (content: string, event: PasteEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnPasteCallback = (pasteValue: string, event: PasteEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnPasteCallback = (pasteValue: string, event: PasteEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnRadioChangeCallback = (isChecked: boolean) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnRadioChangeCallback = (isChecked: boolean) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnRatingChangeCallback = (rating: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnRatingChangeCallback = (rating: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnScrollEdgeCallback = (side: Edge) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnScrollEdgeCallback = (side: Edge) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnScrollFrameBeginCallback = (offset: number, state: ScrollState) => OnScrollFrameBeginHandlerResult` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnScrollFrameBeginCallback = (offset: number, state: ScrollState) => OnScrollFrameBeginHandlerResult;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnSelectCallback = (index: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnSelectCallback = (index: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnSelectCallback = (index: number, selectStr: string) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnSelectCallback = (index: number, selectStr: string) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnSelectCallback = (index: number, selectValue: string) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnSelectCallback = (index: number, selectValue: string) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnStateChangeCallback = (state: SwipeActionState) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：declare type OnStateChangeCallback = (state: SwipeActionState) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnSubmitCallback = (enterKey: EnterKeyType, event: SubmitEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnSubmitCallback = (enterKey: EnterKeyType, event: SubmitEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnSwiperAnimationEndCallback = (index: number, extraInfo: SwiperAnimationEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnSwiperAnimationEndCallback = (index: number, extraInfo: SwiperAnimationEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnSwiperAnimationStartCallback = (index: number, targetIndex: number, extraInfo: SwiperAnimationEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnSwiperAnimationStartCallback = (index: number, targetIndex: number, extraInfo: SwiperAnimationEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnSwiperGestureSwipeCallback = (index: number, extraInfo: SwiperAnimationEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnSwiperGestureSwipeCallback = (index: number, extraInfo: SwiperAnimationEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnTabsAnimationEndCallback = (index: number, extraInfo: TabsAnimationEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnTabsAnimationEndCallback = (index: number, extraInfo: TabsAnimationEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnTabsAnimationStartCallback = (index: number, targetIndex: number, extraInfo: TabsAnimationEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnTabsAnimationStartCallback = (index: number, targetIndex: number, extraInfo: TabsAnimationEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnTabsContentDidScrollCallback = (selectedIndex: number, index: number, position: number, mainAxisLength: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：declare type OnTabsContentDidScrollCallback = (selectedIndex: number, index: number, position: number, mainAxisLength: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnTabsContentWillChangeCallback = (currentIndex: number, comingIndex: number) => boolean` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnTabsContentWillChangeCallback = (currentIndex: number, comingIndex: number) => boolean;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnTabsGestureSwipeCallback = (index: number, extraInfo: TabsAnimationEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnTabsGestureSwipeCallback = (index: number, extraInfo: TabsAnimationEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnTextPickerChangeCallback = (selectItem: string | string\[\], index: number | number\[\]) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnTextPickerChangeCallback = (selectItem: string \| string\[\], index: number \| number\[\]) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnTextSelectionChangeCallback = (selectionStart: number, selectionEnd: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnTextSelectionChangeCallback = (selectionStart: number, selectionEnd: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnTimePickerChangeCallback = (result: TimePickerResult) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnTimePickerChangeCallback = (result: TimePickerResult) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnTipClickCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type OnTipClickCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnUIPickerComponentCallback = (selectedIndex: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：declare type OnUIPickerComponentCallback = (selectedIndex: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnVisibleIndexesChangeCallback = (start: number, end: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type OnVisibleIndexesChangeCallback = (start: number, end: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnWaterFlowScrollIndexCallback = (first: number, last: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：declare type OnWaterFlowScrollIndexCallback = (first: number, last: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type OnWillStopDraggingCallback = (velocity: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type OnWillStopDraggingCallback = (velocity: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type Orientation = import('../api/@ohos.window').default.Orientation` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：declare type Orientation = import('../api/@ohos.window').default.Orientation;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type PageTransitionCallback = (type: RouteType, progress: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type PageTransitionCallback = (type: RouteType, progress: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type PanListenerCallback = (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：declare type PanListenerCallback = (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type Paragraph = import('../api/@ohos.graphics.text').default.Paragraph` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type Paragraph = import('../api/@ohos.graphics.text').default.Paragraph;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type PopupStateChangeCallback = (event: PopupStateChangeParam) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type PopupStateChangeCallback = (event: PopupStateChangeParam) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type PromptActionCommonState = import('../api/@ohos.promptAction').promptAction.CommonState` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type PromptActionCommonState = import('../api/@ohos.promptAction').promptAction.CommonState;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type PromptActionDialogController = import('../api/@ohos.promptAction').promptAction.DialogController` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type PromptActionDialogController = import('../api/@ohos.promptAction').promptAction.DialogController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type RectHeightStyle = import('../api/@ohos.graphics.text').default.RectHeightStyle` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：declare type RectHeightStyle = import('../api/@ohos.graphics.text').default.RectHeightStyle;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type RectWidthStyle = import('../api/@ohos.graphics.text').default.RectWidthStyle` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：declare type RectWidthStyle = import('../api/@ohos.graphics.text').default.RectWidthStyle;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type RepeatInterface = <T>(arr: RepeatArray<T>) => RepeatAttribute<T>` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type RepeatInterface = <T>(arr: RepeatArray<T>) => RepeatAttribute<T>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type RequestDownloadInfo = import('../api/@ohos.request.cacheDownload').default.DownloadInfo` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：declare type RequestDownloadInfo = import('../api/@ohos.request.cacheDownload').default.DownloadInfo;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type RestoreStateCallback = (savedState: Record<string, Object> | null) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type RestoreStateCallback = (savedState: Record<string, Object> \| null) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type ReuseIdCallback = () => string` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type ReuseIdCallback = () => string;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type SaveStateCallback = () => Record<string, Object> | null` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type SaveStateCallback = () => Record<string, Object> \| null;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type ScaleCallback = (scale: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type ScaleCallback = (scale: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-penkit-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type ScrollOnDidZoomCallback = (scale: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type ScrollOnDidZoomCallback = (scale: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type SearchSubmitCallback = (searchContent: string, event?: SubmitEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：declare type SearchSubmitCallback = (searchContent: string, event?: SubmitEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type ShouldRecognizerParallelWithCallback = (current: GestureRecognizer, others: Array<GestureRecognizer>) => GestureRecognizer` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type ShouldRecognizerParallelWithCallback = (current: GestureRecognizer, others: Array<GestureRecognizer>) => GestureRecognizer;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type SpringLoadingContext = import('../api/@ohos.arkui.dragController').default.SpringLoadingContext` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type SpringLoadingContext = import('../api/@ohos.arkui.dragController').default.SpringLoadingContext;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type SwipeActionCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：declare type SwipeActionCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type SystemUiMaterial = import('../api/@ohos.arkui.uiMaterial').default.Material` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type SystemUiMaterial = import('../api/@ohos.arkui.uiMaterial').default.Material;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type TabsCustomContentTransitionCallback = (from: number, to: number) => TabContentAnimatedTransition | undefined` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type TabsCustomContentTransitionCallback = (from: number, to: number) => TabContentAnimatedTransition \| undefined;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type TaskCallback = () => T` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：declare type TaskCallback = () => T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type TextAreaSubmitCallback = (enterKeyType: EnterKeyType, event?: SubmitEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：declare type TextAreaSubmitCallback = (enterKeyType: EnterKeyType, event?: SubmitEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type TextBox = import('../api/@ohos.graphics.text').default.TextBox` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：declare type TextBox = import('../api/@ohos.graphics.text').default.TextBox;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type TextPickerEnterSelectedAreaCallback = (value: string | string\[\], index: number | number\[\]) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type TextPickerEnterSelectedAreaCallback = (value: string \| string\[\], index: number \| number\[\]) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type TextPickerScrollStopCallback = (value: string | string\[\], index: number | number\[\]) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：declare type TextPickerScrollStopCallback = (value: string \| string\[\], index: number \| number\[\]) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type TouchTestDoneCallback = (event: BaseGestureEvent, recognizers: Array<GestureRecognizer>) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type TouchTestDoneCallback = (event: BaseGestureEvent, recognizers: Array<GestureRecognizer>) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type UIMaterial = import('../api/@ohos.arkui.uiMaterial').uiMaterial` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type UIMaterial = import('../api/@ohos.arkui.uiMaterial').uiMaterial;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type UIStatesChangeHandler = (node: FrameNode, currentUIStates: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type UIStatesChangeHandler = (node: FrameNode, currentUIStates: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type Vector2T<T> = import('../api/arkui/Graphics').Vector2T<T>` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：declare type Vector2T<T> = import('../api/arkui/Graphics').Vector2T<T>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type VisibleAreaChangeCallback = (isVisible: boolean, currentRatio: number) => void` ✅

- **变更类型**：自定义类型变更
- **影响版本**：5.0.1(13)
- **变更影响**：isExpanding: boolean, currentRatio: number
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b105
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.1(13) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.1(13) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.1(13) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.1(13) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `declare type WindowEventListener = (windowId: number, event: window.WindowEventType) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type WindowEventListener = (windowId: number, event: window.WindowEventType) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `direction(direction: PlayMode): SimpleAnimatorOptions` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：direction(direction: PlayMode): SimpleAnimatorOptions;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\components\FlexTags.ets:170`（来源：代码扫描）

### `enum ColorMode` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.0(20)
- **变更影响**：20
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-formkit-6001
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:1`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:10`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:1` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:10` |

  </details>

### `enum OutputType` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：enum OutputType
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-performanceanalysiskit-7002
- **涉及代码位置**（共 11 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:12`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:14`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:18`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:23`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:27`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:30`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:36`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:41`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:46`（来源：代码扫描）
  - `entry\src\main\ets\entrybackupability\EntryBackupAbility.ets:13`（来源：代码扫描）
  - `entry\src\main\ets\entrybackupability\EntryBackupAbility.ets:8`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\entryability\EntryAbility.ets:12` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\entryability\EntryAbility.ets:14` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\entryability\EntryAbility.ets:18` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\entryability\EntryAbility.ets:23` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\entryability\EntryAbility.ets:27` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\entryability\EntryAbility.ets:30` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\entryability\EntryAbility.ets:36` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\entryability\EntryAbility.ets:41` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\entryability\EntryAbility.ets:46` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\entrybackupability\EntryBackupAbility.ets:13` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\entrybackupability\EntryBackupAbility.ets:8` |

  </details>

### `enum PreferStrategy` ✅

- **变更类型**：新增API
- **影响版本**：6.0.1(21)
- **变更影响**：enum PreferStrategy
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-performanceanalysiskit-6011
- **涉及代码位置**（共 11 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:12`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:14`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:18`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:23`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:27`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:30`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:36`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:41`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:46`（来源：代码扫描）
  - `entry\src\main\ets\entrybackupability\EntryBackupAbility.ets:13`（来源：代码扫描）
  - `entry\src\main\ets\entrybackupability\EntryBackupAbility.ets:8`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:12` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:14` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:18` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:23` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:27` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:30` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:36` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:41` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:46` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\entrybackupability\EntryBackupAbility.ets:13` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\entrybackupability\EntryBackupAbility.ets:8` |

  </details>

### `export function getApplicationContext(): ApplicationContext` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：export function getApplicationContext(): ApplicationContext;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:10`（来源：代码扫描）

### `export type ArrayListComparatorFn<T> = (firstValue: T, secondValue: T) => number` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：export type ArrayListComparatorFn<T> = (firstValue: T, secondValue: T) => number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkts-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type ClickCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：export type ClickCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type ClientConnectionCloseCallback = (clientConnection: WebSocketConnection, closeReason: CloseResult) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：export type ClientConnectionCloseCallback = (clientConnection: WebSocketConnection, closeReason: CloseResult) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkkit-5111
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type ContentCoding = 'aes128gcm' | 'br' | 'compress' | 'deflate' | 'exi' | 'gzip' | 'pack200-gzip' | 'x-compress' | 'x-gzip' | 'zstd' | (string \& NonNullable<unknown>)` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type ContentType = 'application/json' | 'text/plain' | 'multipart/form-data' | 'application/octet-stream' | 'application/x-www-form-urlencoded' | (string \& NonNullable<unknown>)` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type CurrentAlbumDeletedCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：export type CurrentAlbumDeletedCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-b105
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type DynamicDnsRule = (host: string, port: number) => IpAddress\[\]` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type DynamicExclusionRule = (url: URLOrString) => boolean` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type EmptyAreaClickCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：export type EmptyAreaClickCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-b105
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type ErrorCallback = (pickerError: PickerError) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：export type ErrorCallback = (pickerError: PickerError) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type ErrorHandler = (errObject: Error) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.1(21)
- **变更影响**：export type ErrorHandler = (errObject: Error) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-6011
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type ExceedMaxSelectedCallback = (exceedMaxCountType: MaxCountType) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：export type ExceedMaxSelectedCallback = (exceedMaxCountType: MaxCountType) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-b105
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type FreezeObserver = () => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：export type FreezeObserver = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type GSTileRequestCallback = (tiles: GSTile\[\]) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：export type GSTileRequestCallback = (tiles: GSTile\[\]) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-spatialreconkit-7002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type GetDataCallback = (maxSize: number) => ArrayBuffer | Promise<ArrayBuffer>` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type GlobalObserver = (reason: GlobalError) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：export type GlobalObserver = (reason: GlobalError) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type HttpMethod = 'GET' | 'POST' | 'HEAD' | 'PUT' | 'DELETE' | 'PATCH' | 'OPTIONS' | (string \& NonNullable<unknown>)` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type HttpVersionSelectCallback = (url: URL) => HttpVersion` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：export type HttpVersionSelectCallback = (url: URL) => HttpVersion;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-7001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type IncomingDataCallback = (incomingData: ArrayBuffer) => void | Promise<void>` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type ItemClickedNotifyCallback = (itemInfo: ItemInfo, clickType: ClickType) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、6.1.0(23)
- **变更影响**：export type ItemClickedNotifyCallback = (itemInfo: ItemInfo, clickType: ClickType) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type ItemsDeletedCallback = (baseItemInfos: Array<BaseItemInfo>) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：export type ItemsDeletedCallback = (baseItemInfos: Array<BaseItemInfo>) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-b105
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type ListComparatorFn<T> = (firstValue: T, secondValue: T) => number` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：export type ListComparatorFn<T> = (firstValue: T, secondValue: T) => number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkts-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type MovingPhotoBadgeStateChangedCallback = (uri: string, state: photoAccessHelper.MovingPhotoBadgeStateType) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：export type MovingPhotoBadgeStateChangedCallback = (uri: string, state: photoAccessHelper.MovingPhotoBadgeStateType) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-6021
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnAuthenticationChallenge = (info: AuthenticationChallengeInfo\[\], response: Response, challengeCount: number) => ServerAuthentication | null` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：export type OnAuthenticationChallenge = (info: AuthenticationChallengeInfo\[\], response: Response, challengeCount: number) => ServerAuthentication \| null;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnCanceled = () => void` ✅

- **变更类型**：自定义类型变更
- **影响版本**：6.0.0(20)
- **变更影响**：request?: Request
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnCanceled = (request?: Request) => void` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnClosed = () => void` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnCounterV2HoverCallback = (isHover: boolean) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：export type OnCounterV2HoverCallback = (isHover: boolean) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnDataCallback = (method: AgentOperation, context: RequestContext) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：export type OnDataCallback = (method: AgentOperation, context: RequestContext) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-agentframeworkkit-7002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnDataEnd = () => void` ✅

- **变更类型**：自定义类型变更
- **影响版本**：6.0.0(20)
- **变更影响**：request?: Request
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnDataEnd = (request?: Request) => void` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnDataReceive = (incomingData: ArrayBuffer) => number | void | Promise<void>` ✅

- **变更类型**：自定义类型变更
- **影响版本**：6.0.0(20)
- **变更影响**：request?: Request
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnDataReceive = (incomingData: ArrayBuffer, request?: Request) => number | void | Promise<void>` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnDateCounterV2ChangeCallback = (date: CounterV2DateData) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：export type OnDateCounterV2ChangeCallback = (date: CounterV2DateData) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnDownloadProgress = (totalSize: number, transferredSize: number) => void` ✅

- **变更类型**：自定义类型变更
- **影响版本**：6.0.0(20)
- **变更影响**：request?: Request
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnDownloadProgress = (totalSize: number, transferredSize: number, request?: Request) => void` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnHeaderReceive = (headers: ResponseHeaders) => void` ✅

- **变更类型**：自定义类型变更
- **影响版本**：6.0.0(20)
- **变更影响**：request?: Request
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnHeaderReceive = (headers: ResponseHeaders, request?: Request) => void` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnInlineCounterV2Change = (value: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：export type OnInlineCounterV2Change = (value: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnMenuItemClickWithTextCallback = (menuItem: TextMenuItem, value: string) => boolean` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：export type OnMenuItemClickWithTextCallback = (menuItem: TextMenuItem, value: string) => boolean;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnPickerStateCallback = (state: AVCastPickerState) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：export type OnPickerStateCallback = (state: AVCastPickerState) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnRequestFailureFn = (name: string, failureCode: AbilityStartFailureCode, failureMessage: string) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.1(21)
- **变更影响**：export type OnRequestFailureFn = (name: string, failureCode: AbilityStartFailureCode, failureMessage: string) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-6011
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnRequestSuccessFn = (name: string) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.1(21)
- **变更影响**：export type OnRequestSuccessFn = (name: string) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-6011
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnSelectedIndexChange = (selectedIndex: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.0.0(20)
- **变更影响**：export type OnSelectedIndexChange = (selectedIndex: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnSelectedIndexesChange = (selectedIndexes: number\[\]) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：export type OnSelectedIndexesChange = (selectedIndexes: number\[\]) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnStatusCodeReceive = (statusCode: number, request?: Request) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：export type OnStatusCodeReceive = (statusCode: number, request?: Request) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnTimeInfo = (timeInfo: TimeInfo) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)、6.0.0(20)
- **变更影响**：export type OnTimeInfo = (timeInfo: TimeInfo) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-5032
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnTimeInfo = (timeInfo: TimeInfo, request?: Request) => void` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnUploadProgress = (totalSize: number, transferredSize: number) => void` ✅

- **变更类型**：自定义类型变更
- **影响版本**：6.0.0(20)
- **变更影响**：request?: Request
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type OnUploadProgress = (totalSize: number, transferredSize: number, request?: Request) => void` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type PhotoBrowserChangeStartCallback = (targetPhotoInfo: BaseItemInfo) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、6.1.0(23)
- **变更影响**：export type PhotoBrowserChangeStartCallback = (targetPhotoInfo: BaseItemInfo) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type PhotoBrowserZoomCallback = (scale: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：export type PhotoBrowserZoomCallback = (scale: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-7002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type PinchGridSwitchedCallback = (gridLevel: photoAccessHelper.GridLevel) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、6.1.0(23)
- **变更影响**：export type PinchGridSwitchedCallback = (gridLevel: photoAccessHelper.GridLevel) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type ProxySender = (data: string) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：export type ProxySender = (data: string) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-agentframeworkkit-7002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type RecentPhotoCheckInfoCallback = (recentPhotoExists: boolean, info: RecentPhotoInfo) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)、6.1.0(23)
- **变更影响**：export type RecentPhotoCheckInfoCallback = (recentPhotoExists: boolean, info: RecentPhotoInfo) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-b105
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 6.1.0(23) | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type ResourceUsageObserver = (resourceType: ResourceType, resourceSize: number, detailInfo?: Record<string, number>) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.1(24)
- **变更影响**：export type ResourceUsageObserver = (resourceType: ResourceType, resourceSize: number, detailInfo?: Record<string, number>) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-6111
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type ResponseHeaders = { \[k: string\]: string | string\[\] | undefined; 'accept-ranges'?: 'none' | 'bytes' | (string \& NonNullable<unknown>); 'allow'?: HttpMethod | HttpMethod\[\]; 'cache-control'?: string | string\[\]; 'content-encoding'?: ContentCoding; 'content-range'?: string; 'content-type'?: ContentType; 'date'?: string; 'etag'?: string; 'expires'?: string; 'location'?: string; 'retry-after'?: string; 'set-cookie'?: string | string\[\]; 'server'?: string; 'www-authenticate'?: string | string\[\]; }` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type ResponseValidationCallback = (response: Response) => boolean | Promise<boolean>` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type ScrollStopAtEndCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、6.1.0(23)
- **变更影响**：export type ScrollStopAtEndCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type ScrollStopAtStartCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、6.1.0(23)
- **变更影响**：export type ScrollStopAtStartCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type SearchKeyCallback = (results: SearchResultData\[\]) => boolean` ✅

- **变更类型**：新增API
- **影响版本**：6.0.1(21)
- **变更影响**：export type SearchKeyCallback = (results: SearchResultData\[\]) => boolean;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-pdfkit-6011
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type SetPreviewTextCallback = (text: string, range: Range) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.5(17)
- **变更影响**：export type SetPreviewTextCallback = (text: string, range: Range) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imekit-5051
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.5(17) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.5(17).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.5(17) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.5(17).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.5(17) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.5(17).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.5(17) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.5(17).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type SizeChangeCallback = (size: window.Size, keyboardArea?: KeyboardArea) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：export type SizeChangeCallback = (size: window.Size, keyboardArea?: KeyboardArea) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imekit-5032
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type SubHeaderV2OperationItemAction = () => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：export type SubHeaderV2OperationItemAction = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type SubHeaderV2SelectOnSelect = (selectedIndex: number, selectedContent?: string) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：export type SubHeaderV2SelectOnSelect = (selectedIndex: number, selectedContent?: string) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type SubHeaderV2TitleBuilder = () => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：export type SubHeaderV2TitleBuilder = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type TargetFileCallback = (request: Request, suggestedPath: Path) => TargetFile | Promise<TargetFile>` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type ToolBarV2ItemAction = (index: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：export type ToolBarV2ItemAction = (index: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type UpReadState = (readState: ReadStateCode) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.1(24)
- **变更影响**：export type UpReadState = (readState: ReadStateCode) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-speechkit-6111
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type ValidationCallback = (context: ValidationContext) => boolean | Promise<boolean>` ✅

- **变更类型**：API模型切换
- **影响版本**：26.0.0 Beta2、6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type customInfoWindowCallback = (markerDelegate: map.MarkerDelegate) => void` ✅

- **变更类型**：修改导出符号
- **影响版本**：26.0.0 Beta2
- **变更影响**：export { mapCommon, map, MapComponent, staticMap, site, navi, sceneMap, petalMaps, offlineMapData, customInfoWindowCallback };
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mapkit-7002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `export type videoPlayStateChangedCallback = (state: VideoPlayerState) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)、6.0.2(22)
- **变更影响**：export type videoPlayStateChangedCallback = (state: VideoPlayerState) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-b123sp18
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 6.0.2(22) | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.2(22) | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.2(22) | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.2(22) | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `fontWeight(value: number | FontWeight | string): T` ✅

- **变更类型**：函数变更
- **影响版本**：6.0.0(20)
- **变更影响**：value: number \| FontWeight \| string \| Resource
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:100`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:135`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:147`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:110`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:77`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:100` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:135` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:147` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:110` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:77` |

  </details>

### `fontWeight(value: number | FontWeight | string): TextAttribute` ⚠️[存疑]

- **变更类型**：函数变更
- **影响版本**：6.0.0(20)
- **变更影响**：value: number \| FontWeight \| ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:100`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\EditSimplePage.ets:135`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:110`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:77`（来源：代码扫描 ⚠️存疑）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:100` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:135` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:110` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:77` |

  </details>

### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute` ⚠️[存疑]

- **变更类型**：函数变更
- **影响版本**：6.0.0(20)
- **变更影响**：weight: number \| FontWeight \| ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:100`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\EditSimplePage.ets:135`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:110`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:77`（来源：代码扫描 ⚠️存疑）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:100` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:135` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:110` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:77` |

  </details>

### `fontWeight: number` ✅

- **变更类型**：新增API
- **影响版本**：5.0.4(16)
- **变更影响**：fontWeight: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-readerkit-504
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:100`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:135`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:147`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:110`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:77`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\EditSimplePage.ets:100` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\EditSimplePage.ets:135` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\EditSimplePage.ets:147` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:110` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\SelectSimplePage.ets:77` |

  </details>

### `fontWeight?: FontWeight` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：6.0.2(22)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6021
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:100`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:135`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:147`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:110`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:77`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\EditSimplePage.ets:100` |
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\EditSimplePage.ets:135` |
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\EditSimplePage.ets:147` |
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:110` |
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\SelectSimplePage.ets:77` |

  </details>

### `fontWeight?: number | FontWeight | string` ✅

- **变更类型**：属性变更
- **影响版本**：6.0.0(20)
- **变更影响**：number,FontWeight,ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:100`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:135`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:147`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:110`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:77`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 属性变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:100` |
  | 6.0.0(20) | 属性变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:135` |
  | 6.0.0(20) | 属性变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:147` |
  | 6.0.0(20) | 属性变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:110` |
  | 6.0.0(20) | 属性变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:77` |

  </details>

### `function back(index: number, params?: Object): void` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：5.1.0(18)
- **变更影响**：18
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:88`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:65`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:88` |
  | 5.1.0(18) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\SelectSimplePage.ets:65` |

  </details>

### `function back(options?: RouterOptions): void` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：5.1.0(18)
- **变更影响**：18
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:88`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:65`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:88` |
  | 5.1.0(18) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\SelectSimplePage.ets:65` |

  </details>

### `function bind(floatViewController: FloatViewController, floatingBallController: floatingBall.FloatingBallController, floatingBallParams: floatingBall.FloatingBallParams): Promise<void>` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：function bind(floatViewController: FloatViewController, floatingBallController: floatingBall.FloatingBallController, floatingBallParams: floatingBall.FloatingBallParams): Promise<void>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\components\FlexTags.ets:100`（来源：代码扫描）

### `function pushUrl(options: RouterOptions): Promise<void>` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：5.1.0(18)
- **变更影响**：18
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:153`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:159`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:153` |
  | 5.1.0(18) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:159` |

  </details>

### `function pushUrl(options: RouterOptions, callback: AsyncCallback<void>): void` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：5.1.0(18)
- **变更影响**：18
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:153`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:159`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:153` |
  | 5.1.0(18) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:159` |

  </details>

### `function pushUrl(options: RouterOptions, mode: RouterMode): Promise<void>` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：5.1.0(18)
- **变更影响**：18
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:153`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:159`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:153` |
  | 5.1.0(18) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:159` |

  </details>

### `function pushUrl(options: RouterOptions, mode: RouterMode, callback: AsyncCallback<void>): void` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：5.1.0(18)
- **变更影响**：18
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:153`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:159`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:153` |
  | 5.1.0(18) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:159` |

  </details>

### `function showToast(options: ShowToastOptions): void` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：5.1.0(18)
- **变更影响**：18
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:52`（来源：代码扫描）

### `getUIContext(): UIContext` ✅

- **变更类型**：成员由子类迁移至父类
- **影响版本**：5.1.0(18)
- **变更影响**：getUIContext(): UIContext;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:88`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:153`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:159`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:52`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:65`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 成员由子类迁移至父类 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\EditSimplePage.ets:88` |
  | 5.1.0(18) | 成员由子类迁移至父类 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:153` |
  | 5.1.0(18) | 成员由子类迁移至父类 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:159` |
  | 5.1.0(18) | 成员由子类迁移至父类 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:52` |
  | 5.1.0(18) | 成员由子类迁移至父类 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\SelectSimplePage.ets:65` |

  </details>

### `inputText(p: Point, text: string): Promise<void>` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.0(20)
- **变更影响**：inputText(p: Point, text: string, mode: InputTextMode): Promise<void>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-testkit-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:138`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:141`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:40`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:43`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:138` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:141` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:40` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:43` |

  </details>

### `inputText(text: string): Promise<void>` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.0(20)
- **变更影响**：inputText(text: string, mode: InputTextMode): Promise<void>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-testkit-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:138`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:141`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:40`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:43`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:138` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:141` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:40` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:43` |

  </details>

### `loadContent(path: string, callback: AsyncCallback<void>): void` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2、5.1.1(19)、6.0.0(20)
- **变更影响**：1300005
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5112
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:25`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `entry\src\main\ets\entryability\EntryAbility.ets:25` |
  | 6.0.0(20) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:25` |
  | 26.0.0 Beta2 | 新增错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\entryability\EntryAbility.ets:25` |

  </details>

### `loadContent(path: string, storage: LocalStorage): Promise<void>` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2、5.1.1(19)、6.0.0(20)
- **变更影响**：1300003
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5112
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:25`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `entry\src\main\ets\entryability\EntryAbility.ets:25` |
  | 6.0.0(20) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:25` |
  | 26.0.0 Beta2 | 新增错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\entryability\EntryAbility.ets:25` |

  </details>

### `loadContent(path: string, storage: LocalStorage, callback: AsyncCallback<void>): void` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2、5.1.1(19)、6.0.0(20)
- **变更影响**：1300003
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5112
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:25`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `entry\src\main\ets\entryability\EntryAbility.ets:25` |
  | 6.0.0(20) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:25` |
  | 26.0.0 Beta2 | 新增错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\entryability\EntryAbility.ets:25` |

  </details>

### `loadContent(path: string, storage?: LocalStorage): Promise<void>` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2、5.1.1(19)、6.0.0(20)
- **变更影响**：1300005
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5112
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:25`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `entry\src\main\ets\entryability\EntryAbility.ets:25` |
  | 6.0.0(20) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:25` |
  | 26.0.0 Beta2 | 新增错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\entryability\EntryAbility.ets:25` |

  </details>

### `onChange?: (value: Date) => void` ✅

- **变更类型**：函数变更
- **影响版本**：5.1.0(18)
- **变更影响**：Callback<Date>
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:140`（来源：代码扫描）

### `readonly options?: DecorationOptions` ✅

- **变更类型**：类新增可选成员
- **影响版本**：6.0.0(20)
- **变更影响**：readonly options?: DecorationOptions;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 5 处）：
  - `ohos_library\src\main\ets\components\FlexTags.ets:170`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FlexTags.ets:171`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FlexTags.ets:172`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FlexTags.ets:173`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FlexTags.ets:174`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 类新增可选成员 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:170` |
  | 6.0.0(20) | 类新增可选成员 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:171` |
  | 6.0.0(20) | 类新增可选成员 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:172` |
  | 6.0.0(20) | 类新增可选成员 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:173` |
  | 6.0.0(20) | 类新增可选成员 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:174` |

  </details>

### `readonly options?: LineSpacingOptions` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：readonly options?: LineSpacingOptions;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 5 处）：
  - `ohos_library\src\main\ets\components\FlexTags.ets:170`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FlexTags.ets:171`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FlexTags.ets:172`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FlexTags.ets:173`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FlexTags.ets:174`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:170` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:171` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:172` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:173` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:174` |

  </details>

### `setColorMode(colorMode: ConfigurationConstant.ColorMode): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：5.1.0(18)、5.1.1(19)
- **变更影响**：setColorMode(colorMode: ConfigurationConstant.ColorMode): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-510
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:10`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\entryability\EntryAbility.ets:10` |
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:10` |

  </details>

### `tags: Array<string>` ✅

- **变更类型**：新增API
- **影响版本**：6.1.1(24)
- **变更影响**：tags: Array<string>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-6111
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\model\ItemViews.ets:120`（来源：代码扫描）
  - `entry\src\main\ets\model\ItemViews.ets:122`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:43`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\model\ItemViews.ets:120` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\model\ItemViews.ets:122` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:43` |

  </details>

### `tags?: string\[\]` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：tags?: string\[\];
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-6101
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\model\ItemViews.ets:120`（来源：代码扫描）
  - `entry\src\main\ets\model\ItemViews.ets:122`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:43`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\model\ItemViews.ets:120` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\model\ItemViews.ets:122` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:43` |

  </details>

### `windowStage: window.WindowStage` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.1(21)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-6012
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:25`（来源：代码扫描）

### `windowStage?: window.WindowStage` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：windowStage?: window.WindowStage;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-6001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:25`（来源：代码扫描）

## 行为变更（按 API 分组，共 12 个 API；已过滤误报 0 条）

### `declare class CommonMethod<T>` ✅

- **变更类型**：接口定义变更
- **影响版本**：26.0.0(26)
- **变更影响**：ArkUI接口新增仅支持Stage模型的约束
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026010615012
- **涉及代码位置**（共 135 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:10`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:100`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:101`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:102`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:107`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:108`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:112`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:126`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:127`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:128`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:133`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:134`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:135`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:136`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:139`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:140`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:145`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:147`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:148`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:152`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:153`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:154`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:156`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:157`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:163`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:164`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:165`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:166`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:167`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:51`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:52`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:53`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:56`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:57`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:58`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:59`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:60`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:67`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:68`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:69`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:75`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:76`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:85`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:86`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:87`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:88`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:90`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:93`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:94`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:95`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:98`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:99`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:103`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:104`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:105`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:108`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:109`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:110`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:111`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:112`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:117`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:118`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:122`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:136`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:137`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:138`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:143`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:145`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:152`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:153`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:158`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:159`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:162`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:164`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:165`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:166`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:168`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:169`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:175`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:176`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:177`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:178`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:179`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:52`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:77`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:78`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:79`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:80`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:81`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:87`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:88`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:89`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:103`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:104`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:105`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:107`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:108`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:114`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:115`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:116`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:117`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:118`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:34`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:35`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:36`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:39`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:40`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:46`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:47`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:48`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:62`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:63`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:64`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:65`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:67`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:70`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:71`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:72`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:75`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:76`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:77`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:78`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:79`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:84`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:85`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:89`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FlexTags.ets:100`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FlexTags.ets:170`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FlexTags.ets:172`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FlexTags.ets:173`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FlexTags.ets:99`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:10` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:100` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:101` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:102` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:107` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:108` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:112` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:126` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:127` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:128` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:133` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:134` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:135` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:136` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:139` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:140` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:145` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:147` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:148` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:152` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:153` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:154` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:156` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:157` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:163` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:164` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:165` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:166` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:167` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:51` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:52` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:53` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:56` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:57` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:58` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:59` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:60` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:67` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:68` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:69` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:75` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:76` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:85` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:86` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:87` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:88` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:90` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:93` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:94` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:95` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:98` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:99` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:103` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:104` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:105` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:108` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:109` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:110` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:111` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:112` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:117` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:118` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:122` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:136` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:137` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:138` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:143` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:145` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:152` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:153` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:158` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:159` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:162` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:164` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:165` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:166` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:168` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:169` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:175` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:176` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:177` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:178` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:179` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:52` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:77` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:78` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:79` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:80` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:81` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:87` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:88` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:89` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:103` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:104` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:105` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:107` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:108` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:114` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:115` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:116` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:117` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:118` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:34` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:35` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:36` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:39` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:40` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:46` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:47` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:48` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:62` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:63` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:64` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:65` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:67` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:70` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:71` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:72` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:75` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:76` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:77` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:78` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:79` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:84` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:85` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:89` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:100` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:170` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:172` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:173` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:99` |

  </details>

### `declare const Button: ButtonInterface` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)、5.1.0(18)
- **变更影响**：按钮默认值变更为新增圆角矩形类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-510#ch174
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:142`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:150`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:156`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\EditSimplePage.ets:144` |
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:142` |
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:150` |
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:156` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:144` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:144` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:142` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:142` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:150` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:150` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:156` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:156` |

  </details>

### `declare const Text: TextInterface` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)
- **变更影响**：Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026032761266
- **涉及代码位置**（共 10 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:132`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:50`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:84`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:97`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:107`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:76`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:33`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:61`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:74`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FlexTags.ets:94`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:132` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:50` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:84` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:97` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:107` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:76` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:33` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:61` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:74` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FlexTags.ets:94` |

  </details>

### `declare type WithThemeInterface = (options: WithThemeOptions) => WithThemeAttribute` ✅

- **变更类型**：接口行为变更
- **影响版本**：26.0.0(26)
- **变更影响**：WithTheme相关组件行为变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026031417380
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 26.0.0(26) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0(26) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0(26) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

### `fontWeight(value: number | FontWeight | string): TextAttribute` ⚠️[存疑]

- **变更类型**：接口定义变更
- **影响版本**：6.0.0(20)
- **变更影响**：文本与输入、信息展示、按钮与选择、滚动与滑动、图形绘制组件接口支持Resource类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#ch383
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:100`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\EditSimplePage.ets:135`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:110`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:77`（来源：代码扫描 ⚠️存疑）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:100` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:135` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:110` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:77` |

  </details>

### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute` ⚠️[存疑]

- **变更类型**：接口定义变更
- **影响版本**：6.0.0(20)
- **变更影响**：文本与输入、信息展示、按钮与选择、滚动与滑动、图形绘制组件接口支持Resource类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#ch383
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:100`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\EditSimplePage.ets:135`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:110`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:77`（来源：代码扫描 ⚠️存疑）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:100` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:135` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:110` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:77` |

  </details>

### `function showToast(options: ShowToastOptions): void` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)
- **变更影响**：Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026032761266
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:52`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:52` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:52` |

  </details>

### `showToast(options: promptAction.ShowToastOptions): void` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)
- **变更影响**：Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026032761266
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:52`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:52` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:52` |

  </details>

### `text?: LocationDescription` ✅

- **变更类型**：接口废弃变更
- **影响版本**：6.0.0(20)
- **变更影响**：位置控件功能变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#chCH2025051227329
- **涉及代码位置**（共 10 处）：
  - `entry\src\main\ets\model\ItemViews.ets:118`（来源：代码扫描）
  - `entry\src\main\ets\model\ItemViews.ets:14`（来源：代码扫描）
  - `entry\src\main\ets\model\ItemViews.ets:29`（来源：代码扫描）
  - `entry\src\main\ets\model\ItemViews.ets:45`（来源：代码扫描）
  - `entry\src\main\ets\model\ItemViews.ets:64`（来源：代码扫描）
  - `entry\src\main\ets\model\ItemViews.ets:92`（来源：代码扫描）
  - `entry\src\main\ets\model\SelectBean.ets:10`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:50`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:76`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:33`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\model\ItemViews.ets:118` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\model\ItemViews.ets:14` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\model\ItemViews.ets:29` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\model\ItemViews.ets:45` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\model\ItemViews.ets:64` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\model\ItemViews.ets:92` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\model\SelectBean.ets:10` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:50` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:76` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:33` |

  </details>

### `text?: PasteDescription` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)
- **变更影响**：内置文本的组件文本样式优化
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026032801249
- **涉及代码位置**（共 10 处）：
  - `entry\src\main\ets\model\ItemViews.ets:118`（来源：代码扫描）
  - `entry\src\main\ets\model\ItemViews.ets:14`（来源：代码扫描）
  - `entry\src\main\ets\model\ItemViews.ets:29`（来源：代码扫描）
  - `entry\src\main\ets\model\ItemViews.ets:45`（来源：代码扫描）
  - `entry\src\main\ets\model\ItemViews.ets:64`（来源：代码扫描）
  - `entry\src\main\ets\model\ItemViews.ets:92`（来源：代码扫描）
  - `entry\src\main\ets\model\SelectBean.ets:10`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:50`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:76`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:33`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\model\ItemViews.ets:118` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\model\ItemViews.ets:14` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\model\ItemViews.ets:29` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\model\ItemViews.ets:45` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\model\ItemViews.ets:64` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\model\ItemViews.ets:92` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\model\SelectBean.ets:10` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:50` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:76` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:33` |

  </details>

### `text?: SaveDescription` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)
- **变更影响**：内置文本的组件文本样式优化
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026032801249
- **涉及代码位置**（共 10 处）：
  - `entry\src\main\ets\model\ItemViews.ets:118`（来源：代码扫描）
  - `entry\src\main\ets\model\ItemViews.ets:14`（来源：代码扫描）
  - `entry\src\main\ets\model\ItemViews.ets:29`（来源：代码扫描）
  - `entry\src\main\ets\model\ItemViews.ets:45`（来源：代码扫描）
  - `entry\src\main\ets\model\ItemViews.ets:64`（来源：代码扫描）
  - `entry\src\main\ets\model\ItemViews.ets:92`（来源：代码扫描）
  - `entry\src\main\ets\model\SelectBean.ets:10`（来源：代码扫描）
  - `entry\src\main\ets\pages\EditSimplePage.ets:50`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:76`（来源：代码扫描）
  - `entry\src\main\ets\pages\SelectSimplePage.ets:33`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\model\ItemViews.ets:118` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\model\ItemViews.ets:14` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\model\ItemViews.ets:29` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\model\ItemViews.ets:45` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\model\ItemViews.ets:64` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\model\ItemViews.ets:92` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\model\SelectBean.ets:10` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\EditSimplePage.ets:50` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:76` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\SelectSimplePage.ets:33` |

  </details>

### `type LocationButtonCallback = (event: ClickEvent, result: LocationButtonOnClickResult, error?: BusinessError<void>) => void` ✅

- **变更类型**：接口废弃变更
- **影响版本**：6.0.0(20)
- **变更影响**：位置控件功能变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#chCH2025051227329
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\EditSimplePage.ets:146`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:157`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\EditSimplePage.ets:146` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:157` |

  </details>

---
*本文档由 hoscanner（HarmonyOS 升级 API 变更扫描工具）自动生成。*