# HarmonyOS 三方库升级 — 系统 API 变更与行为变更清单

生成时间：2026-08-17 17:06:40

## 升级窗口

- **源 API 版本**：12
- **目标 API 版本**：26
- **统计区间**：(12, 26]

## 汇总

- 使用的系统 API 数：**12**
- 系统 API 变更条目：**364**（按 API 分组：**74** 个）
- 行为变更条目：**232**（按 API 分组：**10** 个）
- 变更条目合计：**596**
- 审查结论（确定性启发式审查）：真实 **576** / 误报 **0** / 存疑 **20**（误报条目已从下方清单过滤，存疑条目标注保留）

> 下方按 API 分组列出，每组给出变更类型 / 影响版本 / 变更影响 / 变更证据 URL 及全部涉及代码位置。同一 API 的多个调用位置聚拢展示，便于逐接口核对。

## 系统 API 变更（按 API 分组，共 74 个 API；已过滤误报 0 条）

### `Error` ✅

- **变更类型**：枚举赋值发生改变
- **影响版本**：26.0.0 Beta2
- **变更影响**：4
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkweb-7002
- **涉及代码位置**（共 1 处）：
  - `library\src\main\ets\utils\CalendarUtils.ets:50`（来源：代码扫描）

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
  - `entry\src\main\ets\pages\Index.ets:248`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:252`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:302`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:307`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:330`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:482`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:495`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:582`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:248` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:252` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:302` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:307` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:330` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:482` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:495` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:582` |

  </details>

### `backgroundColor(color: Optional<ResourceColor>): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.0(20)
- **变更影响**：backgroundColor(color: Optional<ResourceColor \| ColorMetrics>): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:248`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:252`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:302`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:307`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:330`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:482`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:495`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:582`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:248` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:252` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:302` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:307` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:330` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:482` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:495` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:582` |

  </details>

### `backgroundColor(value: ResourceColor): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围不是包含关系
- **影响版本**：5.1.0(18)
- **变更影响**：backgroundColor(color: Optional<ResourceColor>): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:248`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:252`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:302`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:307`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:330`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:482`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:495`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:582`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:248` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:252` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:302` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:307` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:330` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:482` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:495` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:582` |

  </details>

### `borderRadius(radius: Dimension | BorderRadiuses): T` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：borderRadius(radius: Dimension \| BorderRadiuses): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5031
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:303`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:331`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:483`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:496`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:531`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:583`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:303` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:331` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:483` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:496` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:531` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:583` |

  </details>

### `borderRadius(value: Length | BorderRadiuses | LocalizedBorderRadiuses): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.2(22)
- **变更影响**：borderRadius(value: Length \| BorderRadiuses \| LocalizedBorderRadiuses, type?: RenderStrategy): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:303`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:331`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:483`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:496`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:531`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:583`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:303` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:331` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:483` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:496` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:531` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:583` |

  </details>

### `borderRadius: number` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：borderRadius: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-formkit-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:303`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:331`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:483`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:496`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:531`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:583`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:303` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:331` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:483` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:496` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:531` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:583` |

  </details>

### `borderRadius?: Length` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：borderRadius?: Length;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:303`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:331`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:483`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:496`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:531`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:583`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:303` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:331` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:483` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:496` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:531` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:583` |

  </details>

### `borderRadius?: LengthMetrics` ✅

- **变更类型**：接口新增可选属性
- **影响版本**：26.0.0 Beta2、5.1.0(18)
- **变更影响**：borderRadius?: LengthMetrics;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:303`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:331`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:483`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:496`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:531`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:583`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:303` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:331` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:483` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:496` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:531` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:583` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:303` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:331` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:483` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:496` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:531` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:583` |

  </details>

### `borderRadius?: LengthMetrics | BorderRadiuses | LocalizedBorderRadiuses` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.0.2(22)
- **变更影响**：borderRadius?: LengthMetrics \| BorderRadiuses \| LocalizedBorderRadiuses;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:303`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:331`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:483`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:496`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:531`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:583`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:303` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:331` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:483` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:496` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:531` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:583` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:303` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:331` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:483` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:496` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:531` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:583` |

  </details>

### `config: ParticleColorPropertyUpdaterConfigs\[UPDATER\]` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：config: ParticleColorPropertyUpdaterConfigs\[UPDATER\];
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 3 处）：
  - `library\src\main\ets\components\SimpleMonthView.ets:275`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:294`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:407`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:275` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:294` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:407` |

  </details>

### `config: ParticleConfigs\[PARTICLE\]` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：config: ParticleConfigs\[PARTICLE\];
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 3 处）：
  - `library\src\main\ets\components\SimpleMonthView.ets:275`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:294`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:407`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:275` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:294` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:407` |

  </details>

### `config: ParticlePropertyUpdaterConfigs<TYPE>\[UPDATER\]` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：config: ParticlePropertyUpdaterConfigs<TYPE>\[UPDATER\];
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 3 处）：
  - `library\src\main\ets\components\SimpleMonthView.ets:275`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:294`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:407`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:275` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:294` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:407` |

  </details>

### `config: WindowAnimationConfig` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：config: WindowAnimationConfig;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 3 处）：
  - `library\src\main\ets\components\SimpleMonthView.ets:275`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:294`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:407`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:275` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:294` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:407` |

  </details>

### `config?: WindowAnimationConfig` ✅

- **变更类型**：接口新增可选属性
- **影响版本**：6.0.0(20)
- **变更影响**：config?: WindowAnimationConfig;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 3 处）：
  - `library\src\main\ets\components\SimpleMonthView.ets:275`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:294`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:407`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:275` |
  | 6.0.0(20) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:294` |
  | 6.0.0(20) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:407` |

  </details>

### `const AUTO_GAIN_TIME: string` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.1(21)
- **变更影响**：21
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6012
- **涉及代码位置**（共 2 处）：
  - `library\src\main\ets\model\CalendarDay.ets:65`（来源：代码扫描）
  - `library\src\main\ets\model\CalendarDay.ets:76`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.1(21) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json` | `library\src\main\ets\model\CalendarDay.ets:65` |
  | 6.0.1(21) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json` | `library\src\main\ets\model\CalendarDay.ets:76` |

  </details>

### `const AUTO_GAIN_TIME_ZONE: string` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.1(21)
- **变更影响**：21
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6012
- **涉及代码位置**（共 2 处）：
  - `library\src\main\ets\model\CalendarDay.ets:65`（来源：代码扫描）
  - `library\src\main\ets\model\CalendarDay.ets:76`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.1(21) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json` | `library\src\main\ets\model\CalendarDay.ets:65` |
  | 6.0.1(21) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json` | `library\src\main\ets\model\CalendarDay.ets:76` |

  </details>

### `const DATE_FORMAT: string` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.1(21)
- **变更影响**：21
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6012
- **涉及代码位置**（共 2 处）：
  - `library\src\main\ets\model\CalendarDay.ets:65`（来源：代码扫描）
  - `library\src\main\ets\model\CalendarDay.ets:76`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.1(21) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json` | `library\src\main\ets\model\CalendarDay.ets:65` |
  | 6.0.1(21) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Release.json` | `library\src\main\ets\model\CalendarDay.ets:76` |

  </details>

### `controller: functionalInputComponentManager.FunctionalInputController` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：controller: functionalInputComponentManager.FunctionalInputController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-scenariofusionkit-510
- **涉及代码位置**（共 2 处）：
  - `library\src\main\ets\components\DayPickerView.ets:181`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:304`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\DayPickerView.ets:181` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\DayPickerView.ets:304` |

  </details>

### `controller: loginComponentManager.LoginPanelController` ✅

- **变更类型**：新增装饰器
- **影响版本**：26.0.0 Beta2
- **变更影响**：Require
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-accountkit-7001
- **涉及代码位置**（共 2 处）：
  - `library\src\main\ets\components\DayPickerView.ets:181`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:304`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:181` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:304` |

  </details>

### `controller: loginComponentManager.LoginWithHuaweiIDButtonController` ✅

- **变更类型**：新增装饰器
- **影响版本**：26.0.0 Beta2
- **变更影响**：Require
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-accountkit-7001
- **涉及代码位置**（共 2 处）：
  - `library\src\main\ets\components\DayPickerView.ets:181`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:304`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:181` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:304` |

  </details>

### `controller: readerCore.ReaderComponentController` ✅

- **变更类型**：新增API
- **影响版本**：5.0.4(16)
- **变更影响**：controller: readerCore.ReaderComponentController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-readerkit-504
- **涉及代码位置**（共 2 处）：
  - `library\src\main\ets\components\DayPickerView.ets:181`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:304`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `library\src\main\ets\components\DayPickerView.ets:181` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `library\src\main\ets\components\DayPickerView.ets:304` |

  </details>

### `controller?: FunctionController` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.0.1(21)
- **变更影响**：controller?: FunctionController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-agentframeworkkit-6003
- **涉及代码位置**（共 2 处）：
  - `library\src\main\ets\components\DayPickerView.ets:181`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:304`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `library\src\main\ets\components\DayPickerView.ets:181` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `library\src\main\ets\components\DayPickerView.ets:304` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:181` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:304` |

  </details>

### `controller?: HdsTabsController` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：controller?: HdsTabsController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6001
- **涉及代码位置**（共 2 处）：
  - `library\src\main\ets\components\DayPickerView.ets:181`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:304`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:181` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:304` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:181` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:304` |

  </details>

### `controller?: SearchController` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：controller?: SearchController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 2 处）：
  - `library\src\main\ets\components\DayPickerView.ets:181`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:304`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\DayPickerView.ets:181` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\DayPickerView.ets:304` |

  </details>

### `controller?: ShaderEffectController` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：controller?: ShaderEffectController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6001
- **涉及代码位置**（共 2 处）：
  - `library\src\main\ets\components\DayPickerView.ets:181`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:304`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:181` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:304` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:181` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:304` |

  </details>

### `controller?: TabsController` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：controller?: TabsController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 2 处）：
  - `library\src\main\ets\components\DayPickerView.ets:181`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:304`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `library\src\main\ets\components\DayPickerView.ets:181` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `library\src\main\ets\components\DayPickerView.ets:304` |

  </details>

### `controller?: TextClockController` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：controller?: TextClockController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 2 处）：
  - `library\src\main\ets\components\DayPickerView.ets:181`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:304`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\DayPickerView.ets:181` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\DayPickerView.ets:304` |

  </details>

### `day: number` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：day: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\pages\Index.ets:78`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:82`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:90`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:91`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:411`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:78` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:82` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:90` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:91` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `library\src\main\ets\components\SimpleMonthView.ets:411` |

  </details>

### `day?: TextStyle` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：day?: TextStyle;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-localizationkit-6101
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\pages\Index.ets:78`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:82`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:90`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:91`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:411`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:78` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:82` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:90` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:91` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:411` |

  </details>

### `day?: number` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：day?: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\pages\Index.ets:78`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:82`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:90`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:91`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:411`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:78` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:82` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:90` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:91` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `library\src\main\ets\components\SimpleMonthView.ets:411` |

  </details>

### `day?: string` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.0(20)
- **变更影响**：20
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-localizationkit-6001
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\pages\Index.ets:78`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:82`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:90`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:91`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:411`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:78` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:78` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:78` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:82` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:82` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:82` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:90` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:90` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:90` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:91` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:91` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:91` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:411` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `library\src\main\ets\components\SimpleMonthView.ets:411` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `library\src\main\ets\components\SimpleMonthView.ets:411` |

  </details>

### `drawRoundRect(roundRect: RoundRect): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6003
- **涉及代码位置**（共 2 处）：
  - `library\src\main\ets\components\DayPickerView.ets:157`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:365`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `library\src\main\ets\components\DayPickerView.ets:157` |
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `library\src\main\ets\components\SimpleMonthView.ets:365` |

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
- **涉及代码位置**（共 25 处）：
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
  - `entry\src\main\ets\pages\Index.ets:170`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:174`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:192`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:214`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:309`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:336`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:349`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:361`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:371`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:80`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:91`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:253`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:483`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:511`（来源：代码扫描）

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
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:170` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `library\src\main\ets\components\DayPickerView.ets:174` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `library\src\main\ets\components\DayPickerView.ets:192` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `library\src\main\ets\components\DayPickerView.ets:214` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `library\src\main\ets\components\DayPickerView.ets:309` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `library\src\main\ets\components\DayPickerView.ets:336` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `library\src\main\ets\components\DayPickerView.ets:349` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `library\src\main\ets\components\DayPickerView.ets:361` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `library\src\main\ets\components\DayPickerView.ets:371` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `library\src\main\ets\components\DayPickerView.ets:80` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `library\src\main\ets\components\DayPickerView.ets:91` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `library\src\main\ets\components\SimpleMonthView.ets:253` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `library\src\main\ets\components\SimpleMonthView.ets:483` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `library\src\main\ets\components\SimpleMonthView.ets:511` |

  </details>

### `enum PreferStrategy` ✅

- **变更类型**：新增API
- **影响版本**：6.0.1(21)
- **变更影响**：enum PreferStrategy
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-performanceanalysiskit-6011
- **涉及代码位置**（共 25 处）：
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
  - `entry\src\main\ets\pages\Index.ets:170`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:174`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:192`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:214`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:309`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:336`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:349`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:361`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:371`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:80`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:91`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:253`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:483`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:511`（来源：代码扫描）

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
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:170` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:174` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:192` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:214` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:309` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:336` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:349` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:361` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:371` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:80` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:91` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:253` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:483` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:511` |

  </details>

### `export function getApplicationContext(): ApplicationContext` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：export function getApplicationContext(): ApplicationContext;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:10`（来源：代码扫描）

### `first: boolean` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：first: boolean;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:90`（来源：代码扫描）

### `fontWeight(value: number | FontWeight | string): T` ✅

- **变更类型**：函数变更
- **影响版本**：6.0.0(20)
- **变更影响**：value: number \| FontWeight \| string \| Resource
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\pages\Index.ets:268`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:282`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:295`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:345`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:523`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:268` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:282` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:295` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:345` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:523` |

  </details>

### `fontWeight(value: number | FontWeight | string): TextAttribute` ⚠️[存疑]

- **变更类型**：函数变更
- **影响版本**：6.0.0(20)
- **变更影响**：value: number \| FontWeight \| ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\pages\Index.ets:268`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:282`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:295`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:345`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:523`（来源：代码扫描 ⚠️存疑）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:268` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:282` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:295` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:345` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:523` |

  </details>

### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute` ⚠️[存疑]

- **变更类型**：函数变更
- **影响版本**：6.0.0(20)
- **变更影响**：weight: number \| FontWeight \| ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\pages\Index.ets:268`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:282`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:295`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:345`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:523`（来源：代码扫描 ⚠️存疑）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:268` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:282` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:295` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:345` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:523` |

  </details>

### `fontWeight: number` ✅

- **变更类型**：新增API
- **影响版本**：5.0.4(16)
- **变更影响**：fontWeight: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-readerkit-504
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\pages\Index.ets:268`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:282`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:295`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:345`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:523`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:268` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:282` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:295` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:345` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:523` |

  </details>

### `fontWeight?: FontWeight` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：6.0.2(22)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6021
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\pages\Index.ets:268`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:282`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:295`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:345`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:523`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:268` |
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:282` |
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:295` |
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:345` |
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:523` |

  </details>

### `fontWeight?: number | FontWeight | string` ✅

- **变更类型**：属性变更
- **影响版本**：6.0.0(20)
- **变更影响**：number,FontWeight,ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\pages\Index.ets:268`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:282`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:295`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:345`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:523`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 属性变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:268` |
  | 6.0.0(20) | 属性变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:282` |
  | 6.0.0(20) | 属性变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:295` |
  | 6.0.0(20) | 属性变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:345` |
  | 6.0.0(20) | 属性变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:523` |

  </details>

### `function config(workoutConfig: WorkoutConfig): Promise<void>` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function config(workoutConfig: WorkoutConfig): Promise<void>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-healthservicekit-510
- **涉及代码位置**（共 22 处）：
  - `library\src\main\ets\components\SimpleMonthView.ets:172`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:272`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:275`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:279`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:293`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:294`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:296`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:306`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:324`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:353`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:362`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:363`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:365`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:388`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:390`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:391`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:392`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:394`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:403`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:407`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:432`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:479`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:172` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:272` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:275` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:279` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:293` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:294` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:296` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:306` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:324` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:353` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:362` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:363` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:365` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:388` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:390` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:391` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:392` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:394` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:403` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:407` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:432` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:479` |

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

### `maxLines(line: number): T` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：5.1.0(18)、6.0.0(20)
- **变更影响**：maxLines(line: number): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:568`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:568` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:568` |

  </details>

### `month: number` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：month: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-localizationkit-7001
- **涉及代码位置**（共 1 处）：
  - `library\src\main\ets\components\DayPickerView.ets:251`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:251` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `library\src\main\ets\components\DayPickerView.ets:251` |

  </details>

### `month?: TextStyle` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：month?: TextStyle;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-localizationkit-6101
- **涉及代码位置**（共 1 处）：
  - `library\src\main\ets\components\DayPickerView.ets:251`（来源：代码扫描）

### `month?: number` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：month?: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 1 处）：
  - `library\src\main\ets\components\DayPickerView.ets:251`（来源：代码扫描）

### `month?: string` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.0(20)
- **变更影响**：20
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-localizationkit-6001
- **涉及代码位置**（共 1 处）：
  - `library\src\main\ets\components\DayPickerView.ets:251`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:251` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `library\src\main\ets\components\DayPickerView.ets:251` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `library\src\main\ets\components\DayPickerView.ets:251` |

  </details>

### `onAreaChange(event: (oldValue: Area, newValue: Area) => void): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：26.0.0 Beta2
- **变更影响**：onAreaChange(event: AreaChangeCallback, options?: AreaChangeOptions): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 1 处）：
  - `library\src\main\ets\components\SimpleMonthView.ets:516`（来源：代码扫描）

### `onChange?: (value: Date) => void` ✅

- **变更类型**：函数变更
- **影响版本**：5.1.0(18)
- **变更影响**：Callback<Date>
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\Index.ets:401`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:442`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:459`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:401` |
  | 5.1.0(18) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:442` |
  | 5.1.0(18) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:459` |

  </details>

### `range: \[ ResourceColor, ResourceColor \]` ✅

- **变更类型**：属性变更
- **影响版本**：5.1.0(18)
- **变更影响**：ParticleTuple<ResourceColor, ResourceColor>
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 2 处）：
  - `library\src\main\ets\components\DayPickerView.ets:357`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:358`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 属性变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\DayPickerView.ets:357` |
  | 5.1.0(18) | 属性变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\DayPickerView.ets:358` |

  </details>

### `range: \[ TYPE, TYPE \]` ✅

- **变更类型**：属性变更
- **影响版本**：5.1.0(18)
- **变更影响**：ParticleTuple<TYPE, TYPE>
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 2 处）：
  - `library\src\main\ets\components\DayPickerView.ets:357`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:358`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 属性变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\DayPickerView.ets:357` |
  | 5.1.0(18) | 属性变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\DayPickerView.ets:358` |

  </details>

### `readonly canvasWidth?: number` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、6.1.1(24)
- **变更影响**：readonly canvasWidth?: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imagekit-6111
- **涉及代码位置**（共 6 处）：
  - `library\src\main\ets\components\SimpleMonthView.ets:171`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:229`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:234`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:426`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:518`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:519`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:171` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:229` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:234` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:426` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:518` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:519` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:171` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:229` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:234` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:426` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:518` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:519` |

  </details>

### `readonly config: AssetDownloadConfig` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：readonly config: AssetDownloadConfig;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-graphicsacceleratekit-510
- **涉及代码位置**（共 22 处）：
  - `library\src\main\ets\components\SimpleMonthView.ets:172`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:272`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:275`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:279`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:293`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:294`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:296`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:306`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:324`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:353`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:362`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:363`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:365`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:388`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:390`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:391`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:392`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:394`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:403`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:407`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:432`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:479`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:172` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:272` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:275` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:279` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:293` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:294` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:296` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:306` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:324` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:353` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:362` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:363` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:365` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:388` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:390` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:391` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:392` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:394` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:403` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:407` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:432` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `library\src\main\ets\components\SimpleMonthView.ets:479` |

  </details>

### `readonly timestamp: number` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、5.1.1(19)、6.0.0(20)
- **变更影响**：readonly timestamp: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arengine-510
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\Index.ets:121`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:560`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:574`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:121` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:560` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:574` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:121` |
  | 5.1.1(19) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:121` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:560` |
  | 5.1.1(19) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:560` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:574` |
  | 5.1.1(19) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:574` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:121` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:560` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:574` |

  </details>

### `roundRect(x: number, y: number, w: number, h: number, radii?: number | Array<number>): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：6.0.0(20)
- **变更影响**：roundRect(x: number, y: number, w: number, h: number, radii?: number \| Array<number>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `library\src\main\ets\components\SimpleMonthView.ets:374`（来源：代码扫描）

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

### `textOverflow(value: { overflow: TextOverflow; }): TextAttribute` ✅

- **变更类型**：函数变更
- **影响版本**：5.1.0(18)
- **变更影响**：options: TextOverflowOptions
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:569`（来源：代码扫描）

### `updated?: boolean` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：updated?: boolean;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-7001
- **涉及代码位置**（共 1 处）：
  - `library\src\main\ets\components\DayPickerView.ets:272`（来源：代码扫描）

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

### `year: number` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：year: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\Index.ets:80`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:251`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:269`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:80` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `library\src\main\ets\components\DayPickerView.ets:251` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `library\src\main\ets\components\SimpleMonthView.ets:269` |

  </details>

### `year?: TextStyle` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：year?: TextStyle;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-localizationkit-6101
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\Index.ets:80`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:251`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:269`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:80` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:251` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:269` |

  </details>

### `year?: number` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：year?: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\Index.ets:80`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:251`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:269`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:80` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `library\src\main\ets\components\DayPickerView.ets:251` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `library\src\main\ets\components\SimpleMonthView.ets:269` |

  </details>

### `year?: string` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.0(20)
- **变更影响**：20
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-localizationkit-6001
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\Index.ets:80`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:251`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:269`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:80` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:80` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:80` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:251` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `library\src\main\ets\components\DayPickerView.ets:251` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `library\src\main\ets\components\DayPickerView.ets:251` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:269` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `library\src\main\ets\components\SimpleMonthView.ets:269` |
  | 6.0.0(20) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `library\src\main\ets\components\SimpleMonthView.ets:269` |

  </details>

## 行为变更（按 API 分组，共 10 个 API；已过滤误报 0 条）

### `arc(x: number, y: number, radius: number, startAngle: number, endAngle: number, counterclockwise?: boolean): void` ✅

- **变更类型**：接口行为变更
- **影响版本**：5.1.0(18)
- **变更影响**：CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-510#ch159
- **涉及代码位置**（共 1 处）：
  - `library\src\main\ets\components\SimpleMonthView.ets:380`（来源：代码扫描）

### `declare class CommonMethod<T>` ✅

- **变更类型**：接口定义变更
- **影响版本**：26.0.0(26)
- **变更影响**：ArkUI接口新增仅支持Stage模型的约束
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026010615012
- **涉及代码位置**（共 186 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:10`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:160`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:161`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:162`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:163`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:235`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:241`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:243`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:244`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:246`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:247`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:248`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:250`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:251`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:252`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:267`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:268`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:270`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:272`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:278`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:279`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:281`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:282`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:283`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:285`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:291`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:292`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:294`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:295`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:296`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:298`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:300`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:301`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:302`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:303`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:305`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:306`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:307`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:326`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:328`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:329`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:330`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:331`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:332`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:344`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:345`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:346`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:351`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:352`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:354`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:355`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:356`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:357`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:365`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:366`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:369`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:370`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:372`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:373`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:374`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:384`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:385`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:386`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:388`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:393`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:394`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:397`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:398`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:399`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:401`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:406`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:407`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:408`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:413`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:414`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:417`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:418`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:420`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:421`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:422`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:429`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:430`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:431`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:433`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:438`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:439`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:442`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:448`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:449`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:450`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:455`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:456`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:459`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:464`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:465`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:466`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:469`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:472`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:473`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:474`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:475`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:477`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:481`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:482`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:483`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:493`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:494`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:495`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:496`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:499`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:500`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:502`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:522`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:523`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:524`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:529`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:530`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:531`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:532`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:534`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:537`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:538`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:539`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:541`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:542`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:543`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:544`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:550`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:552`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:553`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:554`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:555`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:556`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:561`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:562`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:563`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:564`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:566`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:567`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:568`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:569`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:570`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:572`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:573`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:577`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:578`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:581`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:582`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:583`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:78`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:81`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:90`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:91`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:112`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:172`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:181`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:286`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:304`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:335`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:348`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:359`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:370`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:403`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:420`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:422`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:423`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:426`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:427`（来源：代码扫描）
  - `library\src\main\ets\components\DayPickerView.ets:99`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:241`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:300`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:376`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:382`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:508`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:509`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:510`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:516`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:517`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:529`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:530`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:532`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:534`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:10` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:160` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:161` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:162` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:163` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:235` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:241` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:243` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:244` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:246` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:247` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:248` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:250` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:251` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:252` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:267` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:268` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:270` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:272` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:278` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:279` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:281` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:282` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:283` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:285` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:291` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:292` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:294` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:295` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:296` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:298` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:300` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:301` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:302` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:303` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:305` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:306` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:307` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:326` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:328` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:329` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:330` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:331` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:332` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:344` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:345` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:346` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:351` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:352` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:354` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:355` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:356` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:357` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:365` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:366` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:369` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:370` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:372` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:373` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:374` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:384` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:385` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:386` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:388` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:393` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:394` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:397` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:398` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:399` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:401` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:406` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:407` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:408` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:413` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:414` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:417` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:418` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:420` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:421` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:422` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:429` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:430` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:431` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:433` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:438` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:439` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:442` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:448` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:449` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:450` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:455` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:456` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:459` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:464` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:465` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:466` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:469` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:472` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:473` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:474` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:475` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:477` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:481` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:482` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:483` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:493` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:494` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:495` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:496` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:499` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:500` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:502` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:522` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:523` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:524` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:529` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:530` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:531` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:532` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:534` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:537` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:538` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:539` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:541` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:542` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:543` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:544` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:550` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:552` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:553` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:554` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:555` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:556` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:561` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:562` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:563` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:564` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:566` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:567` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:568` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:569` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:570` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:572` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:573` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:577` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:578` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:581` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:582` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:583` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:78` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:81` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:90` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:91` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:112` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:172` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:181` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:286` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:304` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:335` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:348` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:359` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:370` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:403` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:420` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:422` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:423` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:426` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:427` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\DayPickerView.ets:99` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:241` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:300` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:376` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:382` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:508` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:509` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:510` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:516` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:517` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:529` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:530` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:532` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `library\src\main\ets\components\SimpleMonthView.ets:534` |

  </details>

### `declare const Button: ButtonInterface` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)、5.1.0(18)
- **变更影响**：按钮默认值变更为新增圆角矩形类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-510#ch174
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:528`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:528` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:528` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:528` |

  </details>

### `declare const Text: TextInterface` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)
- **变更影响**：Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026032761266
- **涉及代码位置**（共 22 处）：
  - `entry\src\main\ets\pages\Index.ets:266`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:277`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:290`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:293`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:343`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:350`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:364`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:368`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:392`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:396`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:412`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:416`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:437`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:454`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:471`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:498`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:521`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:536`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:551`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:560`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:565`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:266` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:277` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:290` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:293` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:343` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:350` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:364` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:368` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:392` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:396` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:412` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:416` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:437` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:454` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:471` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:498` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:521` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:536` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:551` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:560` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:565` |

  </details>

### `declare const Toggle: ToggleInterface` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)
- **变更影响**：表单类组件触摸热区最小高度变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026031846233
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\Index.ets:400`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:441`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:458`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:400` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:441` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:458` |

  </details>

### `fillText(text: string, x: number, y: number, maxWidth?: number): void` ✅

- **变更类型**：接口行为变更
- **影响版本**：5.0.1(13)
- **变更影响**：画布组件在绘制文本时设置globalCompositeOperation、fillStyle和globalAlpha属性的效果变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/changelogs-ux-b112#canvasrenderingcontext2d%E5%92%8Coffscreencanvasrenderingcontext2d%E7%9A%84globalcompositeoperation%E5%B1%9E%E6%80%A7%E5%8F%98%E6%9B%B4%E4%B8%BA%E5%9C%A8%E7%BB%98%E5%88%B6%E6%96%87%E6%9C%AC%E6%97%B6%E7%94%9F%E6%95%88
- **涉及代码位置**（共 3 处）：
  - `library\src\main\ets\components\SimpleMonthView.ets:280`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:308`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:411`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.1(13) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Release.json` | `library\src\main\ets\components\SimpleMonthView.ets:280` |
  | 5.0.1(13) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Release.json` | `library\src\main\ets\components\SimpleMonthView.ets:308` |
  | 5.0.1(13) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Release.json` | `library\src\main\ets\components\SimpleMonthView.ets:411` |

  </details>

### `font: string` ✅

- **变更类型**：接口行为变更
- **影响版本**：6.0.0(20)
- **变更影响**：CanvasRenderer的font接口支持自定义字体行为变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#chCH2025062517095
- **涉及代码位置**（共 3 处）：
  - `library\src\main\ets\components\SimpleMonthView.ets:275`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:294`（来源：代码扫描）
  - `library\src\main\ets\components\SimpleMonthView.ets:408`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `library\src\main\ets\components\SimpleMonthView.ets:275` |
  | 6.0.0(20) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `library\src\main\ets\components\SimpleMonthView.ets:294` |
  | 6.0.0(20) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `library\src\main\ets\components\SimpleMonthView.ets:408` |

  </details>

### `fontWeight(value: number | FontWeight | string): TextAttribute` ⚠️[存疑]

- **变更类型**：接口定义变更
- **影响版本**：6.0.0(20)
- **变更影响**：文本与输入、信息展示、按钮与选择、滚动与滑动、图形绘制组件接口支持Resource类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#ch383
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\pages\Index.ets:268`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:282`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:295`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:345`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:523`（来源：代码扫描 ⚠️存疑）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:268` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:282` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:295` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:345` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:523` |

  </details>

### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute` ⚠️[存疑]

- **变更类型**：接口定义变更
- **影响版本**：6.0.0(20)
- **变更影响**：文本与输入、信息展示、按钮与选择、滚动与滑动、图形绘制组件接口支持Resource类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#ch383
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\pages\Index.ets:268`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:282`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:295`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:345`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:523`（来源：代码扫描 ⚠️存疑）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:268` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:282` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:295` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:345` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:523` |

  </details>

### `initialIndex?: number` ✅

- **变更类型**：接口行为变更
- **影响版本**：5.0.2(14)
- **变更影响**：List组件首次创建布局时，Scroller控制器的跳转方法优先级变更为高于initialIndex的优先级
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/changelogs-for-all-apps-b123sp16#list%E7%BB%84%E4%BB%B6%E9%A6%96%E6%AC%A1%E5%88%9B%E5%BB%BA%E5%B8%83%E5%B1%80%E6%97%B6scroller%E6%8E%A7%E5%88%B6%E5%99%A8%E7%9A%84%E8%B7%B3%E8%BD%AC%E6%96%B9%E6%B3%95%E4%BC%98%E5%85%88%E7%BA%A7%E5%8F%98%E6%9B%B4%E4%B8%BA%E9%AB%98%E4%BA%8Einitialindex%E7%9A%84%E4%BC%98%E5%85%88%E7%BA%A7
- **涉及代码位置**（共 1 处）：
  - `library\src\main\ets\components\DayPickerView.ets:404`（来源：代码扫描）

---
*本文档由 hoscanner（HarmonyOS 升级 API 变更扫描工具）自动生成。*