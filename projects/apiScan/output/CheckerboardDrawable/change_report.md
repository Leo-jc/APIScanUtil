# HarmonyOS 三方库升级 — 系统 API 变更与行为变更清单

生成时间：2026-08-17 17:06:42

## 升级窗口

- **源 API 版本**：12
- **目标 API 版本**：26
- **统计区间**：(12, 26]

## 汇总

- 使用的系统 API 数：**11**
- 系统 API 变更条目：**238**（按 API 分组：**59** 个）
- 行为变更条目：**229**（按 API 分组：**10** 个）
- 变更条目合计：**467**
- 审查结论（确定性启发式审查）：真实 **459** / 误报 **0** / 存疑 **8**（误报条目已从下方清单过滤，存疑条目标注保留）

> 下方按 API 分组列出，每组给出变更类型 / 影响版本 / 变更影响 / 变更证据 URL 及全部涉及代码位置。同一 API 的多个调用位置聚拢展示，便于逐接口核对。

## 系统 API 变更（按 API 分组，共 59 个 API；已过滤误报 0 条）

### `Error` ✅

- **变更类型**：枚举赋值发生改变
- **影响版本**：26.0.0 Beta2
- **变更影响**：4
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkweb-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\CheckerboardDrawable.ets:170`（来源：代码扫描）

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
- **涉及代码位置**（共 7 处）：
  - `entry\src\main\ets\pages\Index.ets:234`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:261`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:328`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:340`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:363`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:371`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:234` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:261` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:328` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:340` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:363` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:371` |

  </details>

### `backgroundColor(color: Optional<ResourceColor>): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.0(20)
- **变更影响**：backgroundColor(color: Optional<ResourceColor \| ColorMetrics>): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 7 处）：
  - `entry\src\main\ets\pages\Index.ets:234`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:261`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:328`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:340`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:363`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:371`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:234` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:261` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:328` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:340` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:363` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:371` |

  </details>

### `backgroundColor(value: ResourceColor): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围不是包含关系
- **影响版本**：5.1.0(18)
- **变更影响**：backgroundColor(color: Optional<ResourceColor>): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 7 处）：
  - `entry\src\main\ets\pages\Index.ets:234`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:261`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:328`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:340`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:363`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:371`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:234` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:261` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:328` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:340` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:363` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:371` |

  </details>

### `borderRadius(radius: Dimension | BorderRadiuses): T` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：borderRadius(radius: Dimension \| BorderRadiuses): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5031
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:235`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:288`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:320`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:332`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:344`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:364`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:372`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:235` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:320` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:332` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:344` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:364` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:372` |

  </details>

### `borderRadius(value: Length | BorderRadiuses | LocalizedBorderRadiuses): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.2(22)
- **变更影响**：borderRadius(value: Length \| BorderRadiuses \| LocalizedBorderRadiuses, type?: RenderStrategy): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:235`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:288`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:320`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:332`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:344`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:364`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:372`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:235` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:320` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:332` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:344` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:364` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:372` |

  </details>

### `borderRadius: number` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：borderRadius: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-formkit-6001
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:235`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:288`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:320`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:332`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:344`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:364`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:372`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:235` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:320` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:332` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:344` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:364` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:372` |

  </details>

### `borderRadius?: Length` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：borderRadius?: Length;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:235`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:288`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:320`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:332`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:344`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:364`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:372`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:235` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:320` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:332` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:344` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:364` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:372` |

  </details>

### `borderRadius?: LengthMetrics` ✅

- **变更类型**：接口新增可选属性
- **影响版本**：26.0.0 Beta2、5.1.0(18)
- **变更影响**：borderRadius?: LengthMetrics;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:235`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:288`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:320`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:332`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:344`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:364`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:372`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:235` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:320` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:332` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:344` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:364` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:372` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:235` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:320` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:332` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:344` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:364` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:372` |

  </details>

### `borderRadius?: LengthMetrics | BorderRadiuses | LocalizedBorderRadiuses` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.0.2(22)
- **变更影响**：borderRadius?: LengthMetrics \| BorderRadiuses \| LocalizedBorderRadiuses;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:235`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:288`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:320`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:332`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:344`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:364`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:372`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:235` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:320` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:332` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:344` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:364` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:372` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:235` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:320` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:332` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:344` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:364` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:372` |

  </details>

### `build(): Paragraph` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：6.0.2(22)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6021
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\Index.ets:79`（来源：代码扫描）
  - `ohos_library\src\main\ets\CheckerboardDrawable.ets:179`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\CheckerboardBackground.ets:67`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:79` |
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:179` |
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:67` |

  </details>

### `build(): VibratorPattern` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：build(): VibratorPattern;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-510
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\Index.ets:79`（来源：代码扫描）
  - `ohos_library\src\main\ets\CheckerboardDrawable.ets:179`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\CheckerboardBackground.ets:67`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:79` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:179` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:67` |

  </details>

### `build(): void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、5.0.4(16)、5.1.0(18)、6.0.0(20)、6.0.1(21)、6.1.0(23)、6.1.1(24)
- **变更影响**：build(): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-readerkit-504
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\Index.ets:79`（来源：代码扫描）
  - `ohos_library\src\main\ets\CheckerboardDrawable.ets:179`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\CheckerboardBackground.ets:67`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:79` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:179` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:67` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:79` |
  | 5.1.0(18) | 成员由子类迁移至父类 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:79` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:179` |
  | 5.1.0(18) | 成员由子类迁移至父类 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:179` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:67` |
  | 5.1.0(18) | 成员由子类迁移至父类 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:67` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:79` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:79` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:179` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:179` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:67` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:67` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:79` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:179` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:67` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:79` |
  | 6.1.0(23) | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:79` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:179` |
  | 6.1.0(23) | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta2.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:179` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:67` |
  | 6.1.0(23) | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta2.json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:67` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:79` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:179` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:67` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:79` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:179` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:67` |

  </details>

### `build(builder: WrappedBuilder<Args>, config: BuildOptions, ...args: Args): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：build(builder: WrappedBuilder<Args>, config: BuildOptions, ...args: Args): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\Index.ets:79`（来源：代码扫描）
  - `ohos_library\src\main\ets\CheckerboardDrawable.ets:179`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\CheckerboardBackground.ets:67`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:79` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:179` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:67` |

  </details>

### `builder: CustomBuilder` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：builder: CustomBuilder;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6001
- **涉及代码位置**（共 3 处）：
  - `ohos_library\src\main\ets\CheckerboardDrawable.ets:165`（来源：代码扫描）
  - `ohos_library\src\main\ets\CheckerboardDrawable.ets:166`（来源：代码扫描）
  - `ohos_library\src\main\ets\CheckerboardDrawable.ets:167`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:165` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:166` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:167` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:165` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:166` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:167` |

  </details>

### `builder?: CustomBuilder` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：builder?: CustomBuilder;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-7001
- **涉及代码位置**（共 3 处）：
  - `ohos_library\src\main\ets\CheckerboardDrawable.ets:165`（来源：代码扫描）
  - `ohos_library\src\main\ets\CheckerboardDrawable.ets:166`（来源：代码扫描）
  - `ohos_library\src\main\ets\CheckerboardDrawable.ets:167`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:165` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:166` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:167` |

  </details>

### `clip(value: boolean | CircleAttribute | EllipseAttribute | PathAttribute | RectAttribute): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围不是包含关系
- **影响版本**：5.1.0(18)
- **变更影响**：clip(clip: Optional<boolean>): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:321`（来源：代码扫描）

### `drawable?: DrawableDescriptor` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：drawable?: DrawableDescriptor;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 3 处）：
  - `ohos_library\src\main\ets\components\CheckerboardBackground.ets:68`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\CheckerboardBackground.ets:70`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\CheckerboardBackground.ets:72`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:68` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:70` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:72` |

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
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:162`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:176`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:162` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:176` |

  </details>

### `fontWeight(value: number | FontWeight | string): TextAttribute` ⚠️[存疑]

- **变更类型**：函数变更
- **影响版本**：6.0.0(20)
- **变更影响**：value: number \| FontWeight \| ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:162`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:176`（来源：代码扫描 ⚠️存疑）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:162` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:176` |

  </details>

### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute` ⚠️[存疑]

- **变更类型**：函数变更
- **影响版本**：6.0.0(20)
- **变更影响**：weight: number \| FontWeight \| ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:162`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:176`（来源：代码扫描 ⚠️存疑）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:162` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:176` |

  </details>

### `fontWeight: number` ✅

- **变更类型**：新增API
- **影响版本**：5.0.4(16)
- **变更影响**：fontWeight: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-readerkit-504
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:162`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:176`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:162` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:176` |

  </details>

### `fontWeight?: FontWeight` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：6.0.2(22)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6021
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:162`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:176`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:162` |
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:176` |

  </details>

### `fontWeight?: number | FontWeight | string` ✅

- **变更类型**：属性变更
- **影响版本**：6.0.0(20)
- **变更影响**：number,FontWeight,ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:162`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:176`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 属性变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:162` |
  | 6.0.0(20) | 属性变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:176` |

  </details>

### `function create(): ImageProcessor` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function create(): ImageProcessor;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imagekit-510
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:122`（来源：代码扫描）

### `function create(config: FloatViewConfiguration): Promise<FloatViewController>` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：function create(config: FloatViewConfiguration): Promise<FloatViewController>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:122`（来源：代码扫描）

### `function create(config: FloatingBallConfiguration): Promise<FloatingBallController>` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function create(config: FloatingBallConfiguration): Promise<FloatingBallController>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:122`（来源：代码扫描）

### `function create(createParameters: CreateParameters): Promise<CreateResult>` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function create(createParameters: CreateParameters): Promise<CreateResult>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-gameservicekit-510
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:122`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:122` |
  | 6.1.0(23) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:122` |
  | 6.1.0(23) | 权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:122` |

  </details>

### `getAlpha(): number` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6003
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:100`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:126`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:100` |
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:126` |

  </details>

### `getColorFilter(): ColorFilter` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6003
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:294`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:95`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:294` |
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:95` |

  </details>

### `getOpacity(): number | Record<number, number>` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：getOpacity(): number \| Record<number, number>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mapkit-6003
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:129`（来源：代码扫描）

### `getSize(): number` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)、6.0.2(22)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6003
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\Index.ets:123`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:128`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:99`（来源：代码扫描）
  - `ohos_library\src\main\ets\CheckerboardDrawable.ets:165`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:123` |
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:128` |
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:99` |
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:165` |
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:123` |
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:128` |
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:99` |
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:165` |

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
  - `entry\src\main\ets\pages\Index.ets:366`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:366` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:366` |

  </details>

### `onAreaChange(event: (oldValue: Area, newValue: Area) => void): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：26.0.0 Beta2
- **变更影响**：onAreaChange(event: AreaChangeCallback, options?: AreaChangeOptions): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\components\CheckerboardBackground.ets:49`（来源：代码扫描）

### `onChange?: (value: Date) => void` ✅

- **变更类型**：函数变更
- **影响版本**：5.1.0(18)
- **变更影响**：Callback<Date>
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:199`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:218`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:199` |
  | 5.1.0(18) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:218` |

  </details>

### `setAlpha(alpha: number): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6003
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:80`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\CheckerboardBackground.ets:68`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:80` |
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:68` |

  </details>

### `setColorFilter(filter: ColorFilter): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6003
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:82`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\CheckerboardBackground.ets:70`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:82` |
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:70` |
  | 6.1.0(23) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:82` |
  | 6.1.0(23) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:70` |

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

### `static create(blurRadius: number, x: number, y: number, color: common2D.Color | number): ShadowLayer` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6003
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:122`（来源：代码扫描）

### `static create(blurRadius: number, x: number, y: number, color: common2D.Color): ShadowLayer` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：5.1.0(18)、6.0.0(20)
- **变更影响**：static create(blurRadius: number, x: number, y: number, color: common2D.Color \| number): ShadowLayer;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-510
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:122`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:122` |
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:122` |

  </details>

### `static create(encoding?: string): TextEncoder` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：401
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkts-7001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:122`（来源：代码扫描）

### `static create(encoding?: string, options?: TextDecoderOptions): TextDecoder` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：401
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkts-7001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:122`（来源：代码扫描）

### `static create(options: AnimatorOptions): AnimatorResult` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：5.1.0(18)
- **变更影响**：18
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:122`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:122` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:122` |

  </details>

### `static create(strategy: PerfTestStrategy): PerfTest` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：static create(strategy: PerfTestStrategy): PerfTest;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-testkit-6001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:122`（来源：代码扫描）

### `static create<T>(): CustomEnvKey<T>` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：static create<T>(): CustomEnvKey<T>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:122`（来源：代码扫描）

### `static create<T>(arrayLength: number, initialValue: T): Array<T>` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2、6.0.0(20)
- **变更影响**：10200011
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkts-6003
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:122`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:122` |
  | 26.0.0 Beta2 | 错误码变更 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:122` |

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

## 行为变更（按 API 分组，共 10 个 API；已过滤误报 0 条）

### `declare class CommonMethod<T>` ✅

- **变更类型**：接口定义变更
- **影响版本**：26.0.0(26)
- **变更影响**：ArkUI接口新增仅支持Stage模型的约束
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026010615012
- **涉及代码位置**（共 133 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:10`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:149`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:150`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:151`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:161`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:162`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:163`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:165`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:166`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:167`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:168`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:175`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:176`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:177`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:178`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:180`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:181`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:182`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:187`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:188`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:190`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:191`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:193`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:194`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:195`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:198`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:199`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:206`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:207`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:209`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:210`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:212`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:213`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:214`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:217`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:218`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:224`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:225`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:226`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:232`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:233`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:234`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:235`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:236`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:241`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:242`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:247`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:251`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:252`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:253`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:259`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:260`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:261`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:263`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:268`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:274`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:278`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:279`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:285`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:286`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:288`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:289`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:290`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:291`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:303`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:307`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:308`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:309`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:318`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:319`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:320`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:321`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:326`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:327`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:328`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:329`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:330`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:331`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:332`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:333`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:338`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:339`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:340`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:341`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:342`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:343`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:344`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:345`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:346`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:350`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:351`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:355`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:356`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:357`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:360`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:361`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:362`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:363`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:364`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:365`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:366`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:368`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:369`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:371`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:372`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:373`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:374`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:376`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:377`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:379`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:380`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:76`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:77`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:78`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:79`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:89`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:90`（来源：代码扫描）
  - `ohos_library\src\main\ets\CheckerboardDrawable.ets:179`（来源：代码扫描）
  - `ohos_library\src\main\ets\CheckerboardDrawable.ets:29`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\CheckerboardBackground.ets:44`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\CheckerboardBackground.ets:45`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\CheckerboardBackground.ets:46`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\CheckerboardBackground.ets:49`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\CheckerboardBackground.ets:60`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\CheckerboardBackground.ets:61`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\CheckerboardBackground.ets:64`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\CheckerboardBackground.ets:65`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\CheckerboardBackground.ets:66`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\CheckerboardBackground.ets:67`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:10` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:149` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:150` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:151` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:161` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:162` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:163` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:165` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:166` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:167` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:168` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:175` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:176` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:177` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:178` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:180` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:181` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:182` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:187` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:188` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:190` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:191` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:193` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:194` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:195` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:198` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:199` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:206` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:207` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:209` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:210` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:212` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:213` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:214` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:217` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:218` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:224` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:225` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:226` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:232` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:233` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:234` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:235` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:236` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:241` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:242` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:247` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:251` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:252` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:253` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:259` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:260` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:261` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:263` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:268` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:274` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:278` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:279` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:285` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:286` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:289` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:290` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:291` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:303` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:307` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:308` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:309` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:318` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:319` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:320` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:321` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:326` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:327` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:328` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:329` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:330` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:331` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:332` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:333` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:338` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:339` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:340` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:341` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:342` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:343` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:344` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:345` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:346` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:350` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:351` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:355` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:356` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:357` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:360` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:361` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:362` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:363` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:364` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:365` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:366` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:368` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:369` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:371` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:372` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:373` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:374` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:376` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:377` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:379` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:380` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:76` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:77` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:78` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:79` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:89` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:90` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:179` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:29` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:44` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:45` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:46` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:49` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:60` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:61` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:64` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:65` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:66` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\CheckerboardBackground.ets:67` |

  </details>

### `declare const Slider: SliderInterface` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)
- **变更影响**：内置文本的组件文本样式优化
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026032801249
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:197`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:216`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:197` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:216` |

  </details>

### `declare const Text: TextInterface` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)
- **变更影响**：Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026032761266
- **涉及代码位置**（共 18 处）：
  - `entry\src\main\ets\pages\Index.ets:160`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:174`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:179`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:186`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:189`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:205`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:208`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:223`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:231`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:250`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:258`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:277`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:284`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:306`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:325`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:337`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:354`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:359`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:160` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:174` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:179` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:186` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:189` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:205` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:208` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:223` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:231` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:250` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:258` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:277` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:284` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:306` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:325` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:337` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:354` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:359` |

  </details>

### `fontWeight(value: number | FontWeight | string): TextAttribute` ⚠️[存疑]

- **变更类型**：接口定义变更
- **影响版本**：6.0.0(20)
- **变更影响**：文本与输入、信息展示、按钮与选择、滚动与滑动、图形绘制组件接口支持Resource类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#ch383
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:162`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:176`（来源：代码扫描 ⚠️存疑）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:162` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:176` |

  </details>

### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute` ⚠️[存疑]

- **变更类型**：接口定义变更
- **影响版本**：6.0.0(20)
- **变更影响**：文本与输入、信息展示、按钮与选择、滚动与滑动、图形绘制组件接口支持Resource类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#ch383
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:162`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:176`（来源：代码扫描 ⚠️存疑）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:162` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:176` |

  </details>

### `globalAlpha: number` ✅

- **变更类型**：接口行为变更
- **影响版本**：5.1.0(18)
- **变更影响**：CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-510#ch159
- **涉及代码位置**（共 2 处）：
  - `ohos_library\src\main\ets\CheckerboardDrawable.ets:278`（来源：代码扫描）
  - `ohos_library\src\main\ets\CheckerboardDrawable.ets:297`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:278` |
  | 5.1.0(18) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `ohos_library\src\main\ets\CheckerboardDrawable.ets:297` |

  </details>

### `value: string` ✅

- **变更类型**：接口定义变更
- **影响版本**：6.0.0(20)
- **变更影响**：文本与输入、信息展示、按钮与选择、滚动与滑动、图形绘制组件接口支持Resource类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#ch383
- **涉及代码位置**（共 14 处）：
  - `entry\src\main\ets\pages\Index.ets:234`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:237`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:238`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:243`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:245`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:261`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:264`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:265`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:270`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:272`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:286`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:292`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:301`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:234` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:237` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:238` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:243` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:245` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:261` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:264` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:265` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:270` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:272` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:286` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:292` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:301` |

  </details>

### `value: string | Resource` ✅

- **变更类型**：接口定义变更
- **影响版本**：5.0.2(14)
- **变更影响**：Navigation的menus接口、NavDestination的title和menus接口支持Resource类型资源
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/changelogs-for-all-apps-b123sp16#navigationnavdestination%E7%9A%84title%E5%92%8Cmenus%E6%8E%A5%E5%8F%A3%E6%94%AF%E6%8C%81resource%E7%B1%BB%E5%9E%8B%E8%B5%84%E6%BA%90
- **涉及代码位置**（共 14 处）：
  - `entry\src\main\ets\pages\Index.ets:234`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:237`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:238`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:243`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:245`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:261`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:264`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:265`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:270`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:272`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:286`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:292`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:301`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:234` |
  | 5.0.2(14) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:237` |
  | 5.0.2(14) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:238` |
  | 5.0.2(14) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:243` |
  | 5.0.2(14) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:245` |
  | 5.0.2(14) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:261` |
  | 5.0.2(14) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:264` |
  | 5.0.2(14) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:265` |
  | 5.0.2(14) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:270` |
  | 5.0.2(14) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:272` |
  | 5.0.2(14) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:286` |
  | 5.0.2(14) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.2(14) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:292` |
  | 5.0.2(14) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:301` |

  </details>

### `value?: string` ✅

- **变更类型**：接口定义变更
- **影响版本**：6.0.0(20)
- **变更影响**：文本与输入、信息展示、按钮与选择、滚动与滑动、图形绘制组件接口支持Resource类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#ch383
- **涉及代码位置**（共 14 处）：
  - `entry\src\main\ets\pages\Index.ets:234`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:237`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:238`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:243`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:245`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:261`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:264`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:265`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:270`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:272`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:286`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:292`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:301`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:234` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:234` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:237` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:237` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:238` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:238` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:243` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:243` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:245` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:245` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:261` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:261` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:264` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:264` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:265` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:265` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:270` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:270` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:272` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:272` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:286` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:286` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:292` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:292` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:301` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:301` |

  </details>

### `value?: string | string[]` ✅

- **变更类型**：接口定义变更
- **影响版本**：6.0.0(20)
- **变更影响**：文本与输入、信息展示、按钮与选择、滚动与滑动、图形绘制组件接口支持Resource类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#ch383
- **涉及代码位置**（共 14 处）：
  - `entry\src\main\ets\pages\Index.ets:234`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:237`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:238`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:243`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:245`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:261`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:264`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:265`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:270`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:272`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:286`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:292`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:301`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:234` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:237` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:238` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:243` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:245` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:261` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:264` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:265` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:270` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:272` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:286` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:292` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:301` |

  </details>

---
*本文档由 hoscanner（HarmonyOS 升级 API 变更扫描工具）自动生成。*