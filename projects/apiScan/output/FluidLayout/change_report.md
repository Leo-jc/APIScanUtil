# HarmonyOS 三方库升级 — 系统 API 变更与行为变更清单

生成时间：2026-08-17 17:06:47

## 升级窗口

- **源 API 版本**：12
- **目标 API 版本**：26
- **统计区间**：(12, 26]

## 汇总

- 使用的系统 API 数：**11**
- 系统 API 变更条目：**106**（按 API 分组：**33** 个）
- 行为变更条目：**140**（按 API 分组：**6** 个）
- 变更条目合计：**246**
- 审查结论（确定性启发式审查）：真实 **242** / 误报 **0** / 存疑 **4**（误报条目已从下方清单过滤，存疑条目标注保留）

> 下方按 API 分组列出，每组给出变更类型 / 影响版本 / 变更影响 / 变更证据 URL 及全部涉及代码位置。同一 API 的多个调用位置聚拢展示，便于逐接口核对。

## 系统 API 变更（按 API 分组，共 33 个 API；已过滤误报 0 条）

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

### `backgroundColor(color: Optional<ResourceColor>): ArcDotIndicator` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：backgroundColor(color: Optional<ResourceColor>): ArcDotIndicator;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:222`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:263`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:272`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:279`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:286`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:293`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:302`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:313`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:222` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:263` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:272` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:279` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:286` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:293` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:302` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:313` |

  </details>

### `backgroundColor(color: Optional<ResourceColor>): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.0(20)
- **变更影响**：backgroundColor(color: Optional<ResourceColor \| ColorMetrics>): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:222`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:263`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:272`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:279`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:286`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:293`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:302`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:313`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:222` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:263` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:272` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:279` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:286` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:293` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:302` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:313` |

  </details>

### `backgroundColor(value: ResourceColor): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围不是包含关系
- **影响版本**：5.1.0(18)
- **变更影响**：backgroundColor(color: Optional<ResourceColor>): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:222`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:263`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:272`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:279`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:286`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:293`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:302`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:313`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:222` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:263` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:272` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:279` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:286` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:293` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:302` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:313` |

  </details>

### `borderRadius(radius: Dimension | BorderRadiuses): T` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：borderRadius(radius: Dimension \| BorderRadiuses): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5031
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\Index.ets:179`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:186`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:195`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:179` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:186` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:195` |

  </details>

### `borderRadius(value: Length | BorderRadiuses | LocalizedBorderRadiuses): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.2(22)
- **变更影响**：borderRadius(value: Length \| BorderRadiuses \| LocalizedBorderRadiuses, type?: RenderStrategy): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\Index.ets:179`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:186`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:195`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:179` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:186` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:195` |

  </details>

### `borderRadius: number` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：borderRadius: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-formkit-6001
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\Index.ets:179`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:186`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:195`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:179` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:186` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:195` |

  </details>

### `borderRadius?: Length` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：borderRadius?: Length;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\Index.ets:179`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:186`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:195`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:179` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:186` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:195` |

  </details>

### `borderRadius?: LengthMetrics` ✅

- **变更类型**：接口新增可选属性
- **影响版本**：26.0.0 Beta2、5.1.0(18)
- **变更影响**：borderRadius?: LengthMetrics;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\Index.ets:179`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:186`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:195`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:179` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:186` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:195` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:179` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:186` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:195` |

  </details>

### `borderRadius?: LengthMetrics | BorderRadiuses | LocalizedBorderRadiuses` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.0.2(22)
- **变更影响**：borderRadius?: LengthMetrics \| BorderRadiuses \| LocalizedBorderRadiuses;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\Index.ets:179`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:186`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:195`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:179` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:186` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:195` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:179` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:186` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:195` |

  </details>

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

### `fontWeight(value: number | FontWeight | string): T` ✅

- **变更类型**：函数变更
- **影响版本**：6.0.0(20)
- **变更影响**：value: number \| FontWeight \| string \| Resource
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:212`（来源：代码扫描）

### `fontWeight(value: number | FontWeight | string): TextAttribute` ⚠️[存疑]

- **变更类型**：函数变更
- **影响版本**：6.0.0(20)
- **变更影响**：value: number \| FontWeight \| ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:212`（来源：代码扫描 ⚠️存疑）

### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute` ⚠️[存疑]

- **变更类型**：函数变更
- **影响版本**：6.0.0(20)
- **变更影响**：weight: number \| FontWeight \| ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:212`（来源：代码扫描 ⚠️存疑）

### `fontWeight: number` ✅

- **变更类型**：新增API
- **影响版本**：5.0.4(16)
- **变更影响**：fontWeight: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-readerkit-504
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:212`（来源：代码扫描）

### `fontWeight?: FontWeight` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：6.0.2(22)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6021
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:212`（来源：代码扫描）

### `fontWeight?: number | FontWeight | string` ✅

- **变更类型**：属性变更
- **影响版本**：6.0.0(20)
- **变更影响**：number,FontWeight,ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:212`（来源：代码扫描）

### `layout(width: number): Promise<void>` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：5.1.0(18)、6.0.2(22)
- **变更影响**：layout(width: number): Promise<void>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\components\FluidLayout.ets:377`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\components\FluidLayout.ets:377` |
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `ohos_library\src\main\ets\components\FluidLayout.ets:377` |

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
  - `entry\src\main\ets\pages\Index.ets:306`（来源：代码扫描）

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

### `visibility?: Visibility` ✅

- **变更类型**：接口新增可选属性
- **影响版本**：6.0.0(20)
- **变更影响**：visibility?: Visibility;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkdata-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\components\FluidLayout.ets:165`（来源：代码扫描）

### `visibility?: number` ✅

- **变更类型**：接口新增可选属性
- **影响版本**：6.0.1(21)
- **变更影响**：visibility?: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6011
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\components\FluidLayout.ets:165`（来源：代码扫描）

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

## 行为变更（按 API 分组，共 6 个 API；已过滤误报 0 条）

### `declare class CommonMethod<T>` ✅

- **变更类型**：接口定义变更
- **影响版本**：26.0.0(26)
- **变更影响**：ArkUI接口新增仅支持Stage模型的约束
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026010615012
- **涉及代码位置**（共 112 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:10`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:174`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:175`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:176`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:177`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:178`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:179`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:180`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:181`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:183`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:184`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:185`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:186`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:187`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:188`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:192`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:193`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:194`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:195`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:196`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:197`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:200`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:201`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:202`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:211`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:212`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:213`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:216`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:217`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:219`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:220`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:221`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:222`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:234`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:236`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:237`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:238`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:239`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:244`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:245`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:246`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:251`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:252`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:253`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:254`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:257`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:258`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:260`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:261`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:263`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:265`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:270`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:271`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:272`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:273`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:274`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:275`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:277`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:278`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:279`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:281`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:282`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:284`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:285`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:286`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:288`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:289`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:291`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:292`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:293`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:294`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:295`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:296`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:299`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:300`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:302`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:303`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:304`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:305`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:306`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:308`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:309`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:311`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:312`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:313`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:84`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:86`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:87`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:88`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:89`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:90`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:91`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FluidLayout.ets:155`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FluidLayout.ets:163`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FluidLayout.ets:164`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FluidLayout.ets:165`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FluidLayout.ets:176`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FluidLayout.ets:177`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FluidLayout.ets:182`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FluidLayout.ets:228`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FluidLayout.ets:240`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FluidLayout.ets:241`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FluidLayout.ets:262`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FluidLayout.ets:268`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FluidLayout.ets:269`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FluidLayout.ets:290`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FluidLayout.ets:312`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FluidLayout.ets:358`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FluidLayout.ets:362`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:10` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:174` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:175` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:176` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:177` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:178` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:179` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:180` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:181` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:183` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:184` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:185` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:186` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:187` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:188` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:192` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:193` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:194` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:195` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:196` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:197` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:200` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:201` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:202` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:211` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:212` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:213` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:216` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:217` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:219` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:220` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:221` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:222` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:234` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:236` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:237` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:238` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:239` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:244` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:245` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:246` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:251` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:252` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:253` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:254` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:257` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:258` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:260` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:261` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:263` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:265` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:270` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:271` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:272` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:273` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:274` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:275` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:277` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:278` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:279` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:281` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:282` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:284` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:285` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:286` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:289` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:291` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:292` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:293` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:294` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:295` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:296` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:299` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:300` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:302` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:303` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:304` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:305` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:306` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:308` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:309` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:311` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:312` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:313` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:84` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:86` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:87` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:88` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:89` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:90` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:91` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FluidLayout.ets:155` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FluidLayout.ets:163` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FluidLayout.ets:164` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FluidLayout.ets:165` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FluidLayout.ets:176` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FluidLayout.ets:177` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FluidLayout.ets:182` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FluidLayout.ets:228` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FluidLayout.ets:240` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FluidLayout.ets:241` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FluidLayout.ets:262` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FluidLayout.ets:268` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FluidLayout.ets:269` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FluidLayout.ets:290` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FluidLayout.ets:312` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FluidLayout.ets:358` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FluidLayout.ets:362` |

  </details>

### `declare const Button: ButtonInterface` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)、5.1.0(18)
- **变更影响**：按钮默认值变更为新增圆角矩形类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-510#ch174
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:276`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:283`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:290`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:297`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:276` |
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:283` |
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:290` |
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:297` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:276` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:276` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:283` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:283` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:290` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:290` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:297` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:297` |

  </details>

### `declare const Text: TextInterface` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)
- **变更影响**：Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026032761266
- **涉及代码位置**（共 10 处）：
  - `entry\src\main\ets\pages\Index.ets:174`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:183`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:192`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:200`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:210`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:215`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:243`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:250`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:298`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\FluidLayout.ets:155`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:174` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:183` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:192` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:200` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:210` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:215` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:243` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:250` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:298` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\FluidLayout.ets:155` |

  </details>

### `declare const Toggle: ToggleInterface` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)
- **变更影响**：表单类组件触摸热区最小高度变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026031846233
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:297`（来源：代码扫描）

### `fontWeight(value: number | FontWeight | string): TextAttribute` ⚠️[存疑]

- **变更类型**：接口定义变更
- **影响版本**：6.0.0(20)
- **变更影响**：文本与输入、信息展示、按钮与选择、滚动与滑动、图形绘制组件接口支持Resource类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#ch383
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:212`（来源：代码扫描 ⚠️存疑）

### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute` ⚠️[存疑]

- **变更类型**：接口定义变更
- **影响版本**：6.0.0(20)
- **变更影响**：文本与输入、信息展示、按钮与选择、滚动与滑动、图形绘制组件接口支持Resource类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#ch383
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:212`（来源：代码扫描 ⚠️存疑）

---
*本文档由 hoscanner（HarmonyOS 升级 API 变更扫描工具）自动生成。*