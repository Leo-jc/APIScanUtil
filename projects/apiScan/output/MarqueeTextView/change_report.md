# HarmonyOS 三方库升级 — 系统 API 变更与行为变更清单

生成时间：2026-08-17 17:06:56

## 升级窗口

- **源 API 版本**：12
- **目标 API 版本**：26
- **统计区间**：(12, 26]

## 汇总

- 使用的系统 API 数：**14**
- 系统 API 变更条目：**2519**（按 API 分组：**898** 个）
- 行为变更条目：**332**（按 API 分组：**21** 个）
- 变更条目合计：**2851**
- 审查结论（确定性启发式审查）：真实 **2845** / 误报 **0** / 存疑 **6**（误报条目已从下方清单过滤，存疑条目标注保留）

> 下方按 API 分组列出，每组给出变更类型 / 影响版本 / 变更影响 / 变更证据 URL 及全部涉及代码位置。同一 API 的多个调用位置聚拢展示，便于逐接口核对。

## 系统 API 变更（按 API 分组，共 898 个 API；已过滤误报 0 条）

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
- **涉及代码位置**（共 15 处）：
  - `entry\src\main\ets\pages\Index.ets:222`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:229`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:247`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:264`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:271`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:282`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:289`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:300`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:320`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:421`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:464`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:482`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:501`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:531`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:541`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:222` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:229` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:247` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:264` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:271` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:282` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:289` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:300` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:320` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:421` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:464` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:482` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:501` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:531` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:541` |

  </details>

### `backgroundColor(color: Optional<ResourceColor>): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.0(20)
- **变更影响**：backgroundColor(color: Optional<ResourceColor \| ColorMetrics>): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 15 处）：
  - `entry\src\main\ets\pages\Index.ets:222`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:229`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:247`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:264`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:271`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:282`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:289`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:300`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:320`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:421`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:464`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:482`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:501`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:531`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:541`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:222` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:229` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:247` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:264` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:271` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:282` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:289` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:300` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:320` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:421` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:464` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:482` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:501` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:531` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:541` |

  </details>

### `backgroundColor(value: ResourceColor): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围不是包含关系
- **影响版本**：5.1.0(18)
- **变更影响**：backgroundColor(color: Optional<ResourceColor>): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 15 处）：
  - `entry\src\main\ets\pages\Index.ets:222`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:229`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:247`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:264`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:271`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:282`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:289`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:300`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:320`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:421`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:464`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:482`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:501`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:531`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:541`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:222` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:229` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:247` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:264` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:271` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:282` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:289` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:300` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:320` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:421` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:464` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:482` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:501` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:531` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:541` |

  </details>

### `bind(id: string): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：bind(id: string): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116`（来源：代码扫描）

### `blockColor(value: ResourceColor): SliderAttribute` ⚠️[存疑]

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.1(21)
- **变更影响**：blockColor(value: ResourceColor \| LinearGradient): SliderAttribute;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6011
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:443`（来源：代码扫描 ⚠️存疑）

### `borderRadius(radius: Dimension | BorderRadiuses): T` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：borderRadius(radius: Dimension \| BorderRadiuses): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5031
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:224`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:230`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:301`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:321`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:422`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:463`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:532`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:542`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:224` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:230` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:301` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:321` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:422` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:463` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:532` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:542` |

  </details>

### `borderRadius(value: Length | BorderRadiuses | LocalizedBorderRadiuses): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.2(22)
- **变更影响**：borderRadius(value: Length \| BorderRadiuses \| LocalizedBorderRadiuses, type?: RenderStrategy): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:224`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:230`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:301`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:321`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:422`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:463`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:532`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:542`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:224` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:230` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:301` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:321` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:422` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:463` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:532` |
  | 6.0.2(22) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:542` |

  </details>

### `borderRadius: number` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：borderRadius: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-formkit-6001
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:224`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:230`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:301`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:321`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:422`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:463`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:532`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:542`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:224` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:230` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:301` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:321` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:422` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:463` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:532` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:542` |

  </details>

### `borderRadius?: Length` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：borderRadius?: Length;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:224`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:230`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:301`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:321`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:422`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:463`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:532`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:542`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:224` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:230` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:301` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:321` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:422` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:463` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:532` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:542` |

  </details>

### `borderRadius?: LengthMetrics` ✅

- **变更类型**：接口新增可选属性
- **影响版本**：26.0.0 Beta2、5.1.0(18)
- **变更影响**：borderRadius?: LengthMetrics;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:224`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:230`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:301`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:321`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:422`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:463`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:532`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:542`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:224` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:230` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:301` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:321` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:422` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:463` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:532` |
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:542` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:224` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:230` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:301` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:321` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:422` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:463` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:532` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:542` |

  </details>

### `borderRadius?: LengthMetrics | BorderRadiuses | LocalizedBorderRadiuses` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.0.2(22)
- **变更影响**：borderRadius?: LengthMetrics \| BorderRadiuses \| LocalizedBorderRadiuses;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:224`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:230`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:301`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:321`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:422`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:463`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:532`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:542`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:224` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:230` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:301` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:321` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:422` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:463` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:532` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:542` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:224` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:230` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:301` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:321` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:422` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:463` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:532` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:542` |

  </details>

### `const ANIMATOR_DURATION_SCALE: string` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.1(21)
- **变更影响**：21
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6012
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:304`（来源：代码扫描）

### `const DEFAULT_SCREEN_ROTATION: string` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.1(21)
- **变更影响**：21
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6012
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:304`（来源：代码扫描）

### `const DISPLAY_INVERSION_STATUS: string` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.1(21)
- **变更影响**：21
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6012
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:304`（来源：代码扫描）

### `const TRANSITION_ANIMATION_SCALE: string` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.1(21)
- **变更影响**：21
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6012
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:304`（来源：代码扫描）

### `const WINDOW_ANIMATION_SCALE: string` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.1(21)
- **变更影响**：21
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6012
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:304`（来源：代码扫描）

### `controller: functionalInputComponentManager.FunctionalInputController` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：controller: functionalInputComponentManager.FunctionalInputController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-scenariofusionkit-510
- **涉及代码位置**（共 7 处）：
  - `entry\src\main\ets\pages\Index.ets:104`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:89`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:94`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:99`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:104` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:89` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:94` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:99` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145` |

  </details>

### `controller: loginComponentManager.LoginPanelController` ✅

- **变更类型**：新增装饰器
- **影响版本**：26.0.0 Beta2
- **变更影响**：Require
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-accountkit-7001
- **涉及代码位置**（共 7 处）：
  - `entry\src\main\ets\pages\Index.ets:104`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:89`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:94`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:99`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:104` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:89` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:94` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:99` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145` |

  </details>

### `controller: loginComponentManager.LoginWithHuaweiIDButtonController` ✅

- **变更类型**：新增装饰器
- **影响版本**：26.0.0 Beta2
- **变更影响**：Require
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-accountkit-7001
- **涉及代码位置**（共 7 处）：
  - `entry\src\main\ets\pages\Index.ets:104`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:89`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:94`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:99`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:104` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:89` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:94` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:99` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145` |

  </details>

### `controller: readerCore.ReaderComponentController` ✅

- **变更类型**：新增API
- **影响版本**：5.0.4(16)
- **变更影响**：controller: readerCore.ReaderComponentController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-readerkit-504
- **涉及代码位置**（共 7 处）：
  - `entry\src\main\ets\pages\Index.ets:104`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:89`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:94`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:99`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:104` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:89` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:94` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:99` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145` |

  </details>

### `controller?: FunctionController` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.0.1(21)
- **变更影响**：controller?: FunctionController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-agentframeworkkit-6003
- **涉及代码位置**（共 7 处）：
  - `entry\src\main\ets\pages\Index.ets:104`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:89`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:94`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:99`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:104` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:89` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:94` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:99` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:104` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:89` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:94` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:99` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145` |

  </details>

### `controller?: HdsTabsController` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：controller?: HdsTabsController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6001
- **涉及代码位置**（共 7 处）：
  - `entry\src\main\ets\pages\Index.ets:104`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:89`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:94`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:99`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:104` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:89` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:94` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:99` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:104` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:89` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:94` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:99` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145` |

  </details>

### `controller?: SearchController` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：controller?: SearchController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 7 处）：
  - `entry\src\main\ets\pages\Index.ets:104`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:89`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:94`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:99`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:104` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:89` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:94` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:99` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145` |

  </details>

### `controller?: ShaderEffectController` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：controller?: ShaderEffectController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6001
- **涉及代码位置**（共 7 处）：
  - `entry\src\main\ets\pages\Index.ets:104`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:89`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:94`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:99`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:104` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:89` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:94` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:99` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:104` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:89` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:94` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:99` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145` |

  </details>

### `controller?: TabsController` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：controller?: TabsController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 7 处）：
  - `entry\src\main\ets\pages\Index.ets:104`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:89`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:94`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:99`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:104` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:89` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:94` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:99` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145` |

  </details>

### `controller?: TextClockController` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：controller?: TextClockController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 7 处）：
  - `entry\src\main\ets\pages\Index.ets:104`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:89`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:94`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:99`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:104` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:89` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:94` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:99` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145` |

  </details>

### `declare function getContext(component?: Object): Context` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：5.1.0(18)
- **变更影响**：18
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 2 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:104`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:235`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:104` |
  | 5.1.0(18) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:235` |

  </details>

### `declare type AccessibilityActionInterceptCallback = (action: AccessibilityAction) => AccessibilityActionInterceptResult` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type AccessibilityActionInterceptCallback = (action: AccessibilityAction) => AccessibilityActionInterceptResult;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type AccessibilityFocusCallback = (isFocus: boolean) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type AccessibilityFocusCallback = (isFocus: boolean) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type AccessibilityTransparentCallback = (event: TouchEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type AccessibilityTransparentCallback = (event: TouchEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type AnimationEndHandler = (index: number, event: SwiperAnimationEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type AnimationEndHandler = (index: number, event: SwiperAnimationEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type AnimationStartHandler = (index: number, targetIndex: number, event: SwiperAnimationEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type AnimationStartHandler = (index: number, targetIndex: number, event: SwiperAnimationEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type ArcScrollIndexHandler = (start: number, end: number, center: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type ArcScrollIndexHandler = (start: number, end: number, center: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type ArcSliderChangeHandler = (progress: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type ArcSliderChangeHandler = (progress: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type ArcSliderEnlargeHandler = (isEnlarged: boolean) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type ArcSliderEnlargeHandler = (isEnlarged: boolean) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type ArcSliderTouchHandler = (event: TouchEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type ArcSliderTouchHandler = (event: TouchEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type AreaChangeCallback = (oldValue: Area, newValue: Area) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type AreaChangeCallback = (oldValue: Area, newValue: Area) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type BuilderCallback = (...args: Args) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：declare type BuilderCallback = (...args: Args) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type BusinessError<T> = import('../api/@ohos.base').BusinessError<T>` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type BusinessError<T> = import('../api/@ohos.base').BusinessError<T>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type CommonModifier = import('../api/arkui/CommonModifier').CommonModifier` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：declare type CommonModifier = import('../api/arkui/CommonModifier').CommonModifier;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type ContentWillScrollCallback = (result: SwiperContentWillScrollResult) => boolean` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：declare type ContentWillScrollCallback = (result: SwiperContentWillScrollResult) => boolean;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5031
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type CustomBuilderT<T> = (t: T) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：declare type CustomBuilderT<T> = (t: T) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type CustomBuilderWithId = (id: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type CustomBuilderWithId = (id: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type DataLoadParams = import('../api/@ohos.data.unifiedDataChannel').default.DataLoadParams` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type DataLoadParams = import('../api/@ohos.data.unifiedDataChannel').default.DataLoadParams;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type DataSyncOptions = import('../api/@ohos.data.unifiedDataChannel').default.GetDataParams` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：declare type DataSyncOptions = import('../api/@ohos.data.unifiedDataChannel').default.GetDataParams;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type DidScrollCallback = (yOffset: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：declare type DidScrollCallback = (yOffset: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-penkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type DragSpringLoadingConfiguration = import('../api/@ohos.arkui.dragController').default.DragSpringLoadingConfiguration` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type DragSpringLoadingConfiguration = import('../api/@ohos.arkui.dragController').default.DragSpringLoadingConfiguration;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type DrawableDescriptor = import('../api/@ohos.arkui.drawableDescriptor').DrawableDescriptor` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：declare type DrawableDescriptor = import('../api/@ohos.arkui.drawableDescriptor').DrawableDescriptor;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type EditableTextOnChangeCallback = (value: string, previewText?: PreviewText) => void` ✅

- **变更类型**：自定义类型变更
- **影响版本**：5.0.3(15)
- **变更影响**：options?: TextChangeOptions
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.3(15) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.3(15) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.3(15) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.3(15) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.3(15) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type EnvDecorator = (value: SystemProperties) => PropertyDecorator` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：declare type EnvDecorator = (value: SystemProperties) => PropertyDecorator;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type FinishAnimationHandler = () => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type FinishAnimationHandler = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type FontVariation = import('../api/@ohos.graphics.text').default.FontVariation` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type FontVariation = import('../api/@ohos.graphics.text').default.FontVariation;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type FrameNode = import('../api/arkui/FrameNode').FrameNode` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：declare type FrameNode = import('../api/arkui/FrameNode').FrameNode;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b105
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type GestureCollectInterceptCallback = (recognizers: Array<GestureRecognizer>, touchRecognizers?: Array<TouchRecognizer>) => GestureCollectIntervention` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type GestureCollectInterceptCallback = (recognizers: Array<GestureRecognizer>, touchRecognizers?: Array<TouchRecognizer>) => GestureCollectIntervention;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type GestureRecognizerJudgeBeginCallback = (event: BaseGestureEvent, current: GestureRecognizer, recognizers: Array<GestureRecognizer>) => GestureJudgeResult` ✅

- **变更类型**：自定义类型变更
- **影响版本**：6.0.0(20)
- **变更影响**：touchRecognizers?: Array<TouchRecognizer>
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type GestureSwipeHandler = (index: number, event: SwiperAnimationEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type GestureSwipeHandler = (index: number, event: SwiperAnimationEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type HdsListItemCardInterface = (options: HdsListItemCardOptions) => HdsListItemCardAttribute` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：declare type HdsListItemCardInterface = (options: HdsListItemCardOptions) => HdsListItemCardAttribute;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type HdsSceneFinishCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.0.2(22)、6.1.0(23)
- **变更影响**：declare type HdsSceneFinishCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 6.0.2(22) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.2(22) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.2(22) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.2(22) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.2(22) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.2(22) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type HdsTabsInterface = (options?: HdsTabsOptions) => HdsTabsAttribute` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：declare type HdsTabsInterface = (options?: HdsTabsOptions) => HdsTabsAttribute;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type HdsVisualComponentInterface = () => HdsVisualComponentAttribute` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：declare type HdsVisualComponentInterface = () => HdsVisualComponentAttribute;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type ImageMatrix = import('../api/@ohos.matrix4').default.Matrix4Transit` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：declare type ImageMatrix = import('../api/@ohos.matrix4').default.Matrix4Transit;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type ImmersiveMode = import('../api/@ohos.promptAction').ImmersiveMode` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：declare type ImmersiveMode = import('../api/@ohos.promptAction').ImmersiveMode;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type IndexChangedHandler = (index: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type IndexChangedHandler = (index: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type InitCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type InitCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-penkit-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type InputEventListener = (event: RawInputEventWrapper) => InputEventInterceptResult` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type InputEventListener = (event: RawInputEventWrapper) => InputEventInterceptResult;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type InputMethodExtraConfig = import('../api/@ohos.inputMethod.ExtraConfig').InputMethodExtraConfig` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：declare type InputMethodExtraConfig = import('../api/@ohos.inputMethod.ExtraConfig').InputMethodExtraConfig;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type InterceptionCallback = (from: NavPathInfo | NavBar, to: NavPathInfo | NavBar, pathStack: NavPathStack, operation: NavigationOperation, isAnimated: boolean) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：declare type InterceptionCallback = (from: NavPathInfo \| NavBar, to: NavPathInfo \| NavBar, pathStack: NavPathStack, operation: NavigationOperation, isAnimated: boolean) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type LevelMode = import('../api/@ohos.promptAction').LevelMode` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：declare type LevelMode = import('../api/@ohos.promptAction').LevelMode;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type LevelOrder = import('../api/@ohos.promptAction').LevelOrder` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type LevelOrder = import('../api/@ohos.promptAction').LevelOrder;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type Material = import('../api/@ohos.arkui.uiMaterial').default.Material` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type Material = import('../api/@ohos.arkui.uiMaterial').default.Material;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type Matrix4Transit = import('../api/@ohos.matrix4').default.Matrix4Transit` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type Matrix4Transit = import('../api/@ohos.matrix4').default.Matrix4Transit;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type MenuCallback = (start: number, end: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：declare type MenuCallback = (start: number, end: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type MonitorDecorator = (value: string, ...args: string\[\]) => MethodDecorator` ✅

- **变更类型**：API卡片权限变更
- **影响版本**：6.1.0(23)
- **变更影响**：form
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type NavDestinationBuildFunction = (name: string, param?: object) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：declare type NavDestinationBuildFunction = (name: string, param?: object) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type NavDestinationTransitionDelegate = (operation: NavigationOperation, isEnter: boolean) => Array<NavDestinationTransition> | undefined` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：declare type NavDestinationTransitionDelegate = (operation: NavigationOperation, isEnter: boolean) => Array<NavDestinationTransition> \| undefined;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type NodeRenderStateChangeCallback = (state: NodeRenderState, node?: FrameNode) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type NodeRenderStateChangeCallback = (state: NodeRenderState, node?: FrameNode) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnActionCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type OnActionCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnActionTextClickCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type OnActionTextClickCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnAlphabetIndexerPopupSelectCallback = (index: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnAlphabetIndexerPopupSelectCallback = (index: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnAlphabetIndexerRequestPopupDataCallback = (index: number) => Array<string>` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnAlphabetIndexerRequestPopupDataCallback = (index: number) => Array<string>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnAlphabetIndexerSelectCallback = (index: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnAlphabetIndexerSelectCallback = (index: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnChangeCallback = (value: boolean) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type OnChangeCallback = (value: boolean) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnChangedCallback = (callbackParam: CallbackParamV2) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type OnChangedCallback = (callbackParam: CallbackParamV2) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnCheckboxChangeCallback = (value: boolean) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnCheckboxChangeCallback = (value: boolean) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnCheckboxGroupChangeCallback = (value: CheckboxGroupResult) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnCheckboxGroupChangeCallback = (value: CheckboxGroupResult) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnContainerCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type OnContainerCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnContentScrollCallback = (totalOffsetX: number, totalOffsetY: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnContentScrollCallback = (totalOffsetX: number, totalOffsetY: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnDidStopDraggingCallback = (willFling: boolean) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.1(21)
- **变更影响**：declare type OnDidStopDraggingCallback = (willFling: boolean) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6011
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnDragEventCallback = (event: DragEvent, extraParams?: string) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：declare type OnDragEventCallback = (event: DragEvent, extraParams?: string) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnFoldStatusChangeCallback = (event: OnFoldStatusChangeInfo) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnFoldStatusChangeCallback = (event: OnFoldStatusChangeInfo) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnGetPreviewBadgeCallback = () => boolean | number` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：declare type OnGetPreviewBadgeCallback = () => boolean \| number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnGridScrollIndexCallback = (first: number, last: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：declare type OnGridScrollIndexCallback = (first: number, last: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnHomeShowOnTopCallback = (name: string) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：declare type OnHomeShowOnTopCallback = (name: string) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnHoverCallback = (status: boolean, event: HoverEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：declare type OnHoverCallback = (status: boolean, event: HoverEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnHoverStatusChangeCallback = (param: HoverEventParam) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnHoverStatusChangeCallback = (param: HoverEventParam) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnItemDragStartCallback = (event: ItemDragInfo, itemIndex: number) => CustomBuilder` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：declare type OnItemDragStartCallback = (event: ItemDragInfo, itemIndex: number) => CustomBuilder;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnListScrollIndexCallback = (start: number, end: number, center: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：declare type OnListScrollIndexCallback = (start: number, end: number, center: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnNativeLoadCallback = (event?: object) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnNativeLoadCallback = (event?: object) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnNavigationModeChangeCallback = (mode: NavigationMode) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：declare type OnNavigationModeChangeCallback = (mode: NavigationMode) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnNeedSoftkeyboardCallback = () => boolean` ✅

- **变更类型**：新增API
- **影响版本**：6.1.1(24)
- **变更影响**：declare type OnNeedSoftkeyboardCallback = () => boolean;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6111
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnPasteCallback = (content: string, event: PasteEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnPasteCallback = (content: string, event: PasteEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnPasteCallback = (pasteValue: string, event: PasteEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnPasteCallback = (pasteValue: string, event: PasteEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnRadioChangeCallback = (isChecked: boolean) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnRadioChangeCallback = (isChecked: boolean) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnRatingChangeCallback = (rating: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnRatingChangeCallback = (rating: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnScrollEdgeCallback = (side: Edge) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnScrollEdgeCallback = (side: Edge) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnScrollFrameBeginCallback = (offset: number, state: ScrollState) => OnScrollFrameBeginHandlerResult` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnScrollFrameBeginCallback = (offset: number, state: ScrollState) => OnScrollFrameBeginHandlerResult;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnSelectCallback = (index: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnSelectCallback = (index: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnSelectCallback = (index: number, selectStr: string) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnSelectCallback = (index: number, selectStr: string) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnSelectCallback = (index: number, selectValue: string) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnSelectCallback = (index: number, selectValue: string) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnStateChangeCallback = (state: SwipeActionState) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：declare type OnStateChangeCallback = (state: SwipeActionState) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnSubmitCallback = (enterKey: EnterKeyType, event: SubmitEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnSubmitCallback = (enterKey: EnterKeyType, event: SubmitEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnSwiperAnimationEndCallback = (index: number, extraInfo: SwiperAnimationEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnSwiperAnimationEndCallback = (index: number, extraInfo: SwiperAnimationEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnSwiperAnimationStartCallback = (index: number, targetIndex: number, extraInfo: SwiperAnimationEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnSwiperAnimationStartCallback = (index: number, targetIndex: number, extraInfo: SwiperAnimationEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnSwiperGestureSwipeCallback = (index: number, extraInfo: SwiperAnimationEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnSwiperGestureSwipeCallback = (index: number, extraInfo: SwiperAnimationEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnTabsAnimationEndCallback = (index: number, extraInfo: TabsAnimationEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnTabsAnimationEndCallback = (index: number, extraInfo: TabsAnimationEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnTabsAnimationStartCallback = (index: number, targetIndex: number, extraInfo: TabsAnimationEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnTabsAnimationStartCallback = (index: number, targetIndex: number, extraInfo: TabsAnimationEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnTabsContentDidScrollCallback = (selectedIndex: number, index: number, position: number, mainAxisLength: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：declare type OnTabsContentDidScrollCallback = (selectedIndex: number, index: number, position: number, mainAxisLength: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnTabsContentWillChangeCallback = (currentIndex: number, comingIndex: number) => boolean` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnTabsContentWillChangeCallback = (currentIndex: number, comingIndex: number) => boolean;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnTabsGestureSwipeCallback = (index: number, extraInfo: TabsAnimationEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnTabsGestureSwipeCallback = (index: number, extraInfo: TabsAnimationEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnTextPickerChangeCallback = (selectItem: string | string\[\], index: number | number\[\]) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnTextPickerChangeCallback = (selectItem: string \| string\[\], index: number \| number\[\]) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnTextSelectionChangeCallback = (selectionStart: number, selectionEnd: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnTextSelectionChangeCallback = (selectionStart: number, selectionEnd: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnTimePickerChangeCallback = (result: TimePickerResult) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type OnTimePickerChangeCallback = (result: TimePickerResult) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnTipClickCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type OnTipClickCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnUIPickerComponentCallback = (selectedIndex: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：declare type OnUIPickerComponentCallback = (selectedIndex: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnVisibleIndexesChangeCallback = (start: number, end: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type OnVisibleIndexesChangeCallback = (start: number, end: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnWaterFlowScrollIndexCallback = (first: number, last: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：declare type OnWaterFlowScrollIndexCallback = (first: number, last: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type OnWillStopDraggingCallback = (velocity: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type OnWillStopDraggingCallback = (velocity: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type Orientation = import('../api/@ohos.window').default.Orientation` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：declare type Orientation = import('../api/@ohos.window').default.Orientation;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type PageTransitionCallback = (type: RouteType, progress: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type PageTransitionCallback = (type: RouteType, progress: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type PanListenerCallback = (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：declare type PanListenerCallback = (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type Paragraph = import('../api/@ohos.graphics.text').default.Paragraph` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type Paragraph = import('../api/@ohos.graphics.text').default.Paragraph;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type PopupStateChangeCallback = (event: PopupStateChangeParam) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type PopupStateChangeCallback = (event: PopupStateChangeParam) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type PromptActionCommonState = import('../api/@ohos.promptAction').promptAction.CommonState` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type PromptActionCommonState = import('../api/@ohos.promptAction').promptAction.CommonState;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type PromptActionDialogController = import('../api/@ohos.promptAction').promptAction.DialogController` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type PromptActionDialogController = import('../api/@ohos.promptAction').promptAction.DialogController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type RectHeightStyle = import('../api/@ohos.graphics.text').default.RectHeightStyle` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：declare type RectHeightStyle = import('../api/@ohos.graphics.text').default.RectHeightStyle;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type RectWidthStyle = import('../api/@ohos.graphics.text').default.RectWidthStyle` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：declare type RectWidthStyle = import('../api/@ohos.graphics.text').default.RectWidthStyle;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type RepeatInterface = <T>(arr: RepeatArray<T>) => RepeatAttribute<T>` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type RepeatInterface = <T>(arr: RepeatArray<T>) => RepeatAttribute<T>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type RequestDownloadInfo = import('../api/@ohos.request.cacheDownload').default.DownloadInfo` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：declare type RequestDownloadInfo = import('../api/@ohos.request.cacheDownload').default.DownloadInfo;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type RestoreStateCallback = (savedState: Record<string, Object> | null) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type RestoreStateCallback = (savedState: Record<string, Object> \| null) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type ReuseIdCallback = () => string` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type ReuseIdCallback = () => string;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type SaveStateCallback = () => Record<string, Object> | null` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type SaveStateCallback = () => Record<string, Object> \| null;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type ScaleCallback = (scale: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type ScaleCallback = (scale: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-penkit-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type ScrollOnDidZoomCallback = (scale: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type ScrollOnDidZoomCallback = (scale: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type SearchSubmitCallback = (searchContent: string, event?: SubmitEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：declare type SearchSubmitCallback = (searchContent: string, event?: SubmitEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type ShouldRecognizerParallelWithCallback = (current: GestureRecognizer, others: Array<GestureRecognizer>) => GestureRecognizer` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type ShouldRecognizerParallelWithCallback = (current: GestureRecognizer, others: Array<GestureRecognizer>) => GestureRecognizer;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type SpringLoadingContext = import('../api/@ohos.arkui.dragController').default.SpringLoadingContext` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type SpringLoadingContext = import('../api/@ohos.arkui.dragController').default.SpringLoadingContext;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type SwipeActionCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：declare type SwipeActionCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type SystemUiMaterial = import('../api/@ohos.arkui.uiMaterial').default.Material` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type SystemUiMaterial = import('../api/@ohos.arkui.uiMaterial').default.Material;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type TabsCustomContentTransitionCallback = (from: number, to: number) => TabContentAnimatedTransition | undefined` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type TabsCustomContentTransitionCallback = (from: number, to: number) => TabContentAnimatedTransition \| undefined;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type TaskCallback = () => T` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：declare type TaskCallback = () => T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type TextAreaSubmitCallback = (enterKeyType: EnterKeyType, event?: SubmitEvent) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：declare type TextAreaSubmitCallback = (enterKeyType: EnterKeyType, event?: SubmitEvent) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type TextBox = import('../api/@ohos.graphics.text').default.TextBox` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：declare type TextBox = import('../api/@ohos.graphics.text').default.TextBox;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type TextPickerEnterSelectedAreaCallback = (value: string | string\[\], index: number | number\[\]) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：declare type TextPickerEnterSelectedAreaCallback = (value: string \| string\[\], index: number \| number\[\]) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type TextPickerScrollStopCallback = (value: string | string\[\], index: number | number\[\]) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：declare type TextPickerScrollStopCallback = (value: string \| string\[\], index: number \| number\[\]) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type TouchTestDoneCallback = (event: BaseGestureEvent, recognizers: Array<GestureRecognizer>) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type TouchTestDoneCallback = (event: BaseGestureEvent, recognizers: Array<GestureRecognizer>) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type UIMaterial = import('../api/@ohos.arkui.uiMaterial').uiMaterial` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type UIMaterial = import('../api/@ohos.arkui.uiMaterial').uiMaterial;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type UIStatesChangeHandler = (node: FrameNode, currentUIStates: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：declare type UIStatesChangeHandler = (node: FrameNode, currentUIStates: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type Vector2T<T> = import('../api/arkui/Graphics').Vector2T<T>` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：declare type Vector2T<T> = import('../api/arkui/Graphics').Vector2T<T>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type VisibleAreaChangeCallback = (isVisible: boolean, currentRatio: number) => void` ✅

- **变更类型**：自定义类型变更
- **影响版本**：5.0.1(13)
- **变更影响**：isExpanding: boolean, currentRatio: number
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b105
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.1(13) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.1(13) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.1(13) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.1(13) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.1(13) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.1(13) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `declare type WindowEventListener = (windowId: number, event: window.WindowEventType) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：declare type WindowEventListener = (windowId: number, event: window.WindowEventType) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `drawImage(pixelmap: image.PixelMap, left: number, top: number, samplingOptions?: SamplingOptions): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6003
- **涉及代码位置**（共 4 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:284`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:286`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:293`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:295`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:284` |
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:286` |
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:293` |
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:295` |

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

### `enum CornerType` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：enum CornerType
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6101
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:304`（来源：代码扫描）

### `enum DisplaySourceMode` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：enum DisplaySourceMode
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:304`（来源：代码扫描）

### `enum FoldDisplayMode` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:304`（来源：代码扫描）

### `enum FoldStatus` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:304`（来源：代码扫描）

### `enum OutputType` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：enum OutputType
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-performanceanalysiskit-7002
- **涉及代码位置**（共 12 处）：
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
  - `entry\src\main\ets\pages\Index.ets:80`（来源：代码扫描）

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
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:80` |

  </details>

### `enum PreferStrategy` ✅

- **变更类型**：新增API
- **影响版本**：6.0.1(21)
- **变更影响**：enum PreferStrategy
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-performanceanalysiskit-6011
- **涉及代码位置**（共 12 处）：
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
  - `entry\src\main\ets\pages\Index.ets:80`（来源：代码扫描）

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
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:80` |

  </details>

### `enum ScreenShape` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：enum ScreenShape
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:304`（来源：代码扫描）

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
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type ClickCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：export type ClickCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type ClientConnectionCloseCallback = (clientConnection: WebSocketConnection, closeReason: CloseResult) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：export type ClientConnectionCloseCallback = (clientConnection: WebSocketConnection, closeReason: CloseResult) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkkit-5111
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type ContentCoding = 'aes128gcm' | 'br' | 'compress' | 'deflate' | 'exi' | 'gzip' | 'pack200-gzip' | 'x-compress' | 'x-gzip' | 'zstd' | (string \& NonNullable<unknown>)` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type ContentType = 'application/json' | 'text/plain' | 'multipart/form-data' | 'application/octet-stream' | 'application/x-www-form-urlencoded' | (string \& NonNullable<unknown>)` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type CurrentAlbumDeletedCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：export type CurrentAlbumDeletedCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-b105
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type DynamicDnsRule = (host: string, port: number) => IpAddress\[\]` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type DynamicExclusionRule = (url: URLOrString) => boolean` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type EmptyAreaClickCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：export type EmptyAreaClickCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-b105
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type ErrorCallback = (pickerError: PickerError) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：export type ErrorCallback = (pickerError: PickerError) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type ErrorHandler = (errObject: Error) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.1(21)
- **变更影响**：export type ErrorHandler = (errObject: Error) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-6011
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type ExceedMaxSelectedCallback = (exceedMaxCountType: MaxCountType) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：export type ExceedMaxSelectedCallback = (exceedMaxCountType: MaxCountType) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-b105
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type FreezeObserver = () => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：export type FreezeObserver = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type GSTileRequestCallback = (tiles: GSTile\[\]) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：export type GSTileRequestCallback = (tiles: GSTile\[\]) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-spatialreconkit-7002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type GetDataCallback = (maxSize: number) => ArrayBuffer | Promise<ArrayBuffer>` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type GlobalObserver = (reason: GlobalError) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：export type GlobalObserver = (reason: GlobalError) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type HttpMethod = 'GET' | 'POST' | 'HEAD' | 'PUT' | 'DELETE' | 'PATCH' | 'OPTIONS' | (string \& NonNullable<unknown>)` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type HttpVersionSelectCallback = (url: URL) => HttpVersion` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：export type HttpVersionSelectCallback = (url: URL) => HttpVersion;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-7001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type IncomingDataCallback = (incomingData: ArrayBuffer) => void | Promise<void>` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type ItemClickedNotifyCallback = (itemInfo: ItemInfo, clickType: ClickType) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、6.1.0(23)
- **变更影响**：export type ItemClickedNotifyCallback = (itemInfo: ItemInfo, clickType: ClickType) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type ItemsDeletedCallback = (baseItemInfos: Array<BaseItemInfo>) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：export type ItemsDeletedCallback = (baseItemInfos: Array<BaseItemInfo>) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-b105
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type ListComparatorFn<T> = (firstValue: T, secondValue: T) => number` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：export type ListComparatorFn<T> = (firstValue: T, secondValue: T) => number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkts-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type MovingPhotoBadgeStateChangedCallback = (uri: string, state: photoAccessHelper.MovingPhotoBadgeStateType) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：export type MovingPhotoBadgeStateChangedCallback = (uri: string, state: photoAccessHelper.MovingPhotoBadgeStateType) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-6021
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnAuthenticationChallenge = (info: AuthenticationChallengeInfo\[\], response: Response, challengeCount: number) => ServerAuthentication | null` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：export type OnAuthenticationChallenge = (info: AuthenticationChallengeInfo\[\], response: Response, challengeCount: number) => ServerAuthentication \| null;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnCanceled = () => void` ✅

- **变更类型**：自定义类型变更
- **影响版本**：6.0.0(20)
- **变更影响**：request?: Request
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnCanceled = (request?: Request) => void` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnClosed = () => void` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnCounterV2HoverCallback = (isHover: boolean) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：export type OnCounterV2HoverCallback = (isHover: boolean) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnDataCallback = (method: AgentOperation, context: RequestContext) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：export type OnDataCallback = (method: AgentOperation, context: RequestContext) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-agentframeworkkit-7002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnDataEnd = () => void` ✅

- **变更类型**：自定义类型变更
- **影响版本**：6.0.0(20)
- **变更影响**：request?: Request
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnDataEnd = (request?: Request) => void` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnDataReceive = (incomingData: ArrayBuffer) => number | void | Promise<void>` ✅

- **变更类型**：自定义类型变更
- **影响版本**：6.0.0(20)
- **变更影响**：request?: Request
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnDataReceive = (incomingData: ArrayBuffer, request?: Request) => number | void | Promise<void>` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnDateCounterV2ChangeCallback = (date: CounterV2DateData) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：export type OnDateCounterV2ChangeCallback = (date: CounterV2DateData) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnDownloadProgress = (totalSize: number, transferredSize: number) => void` ✅

- **变更类型**：自定义类型变更
- **影响版本**：6.0.0(20)
- **变更影响**：request?: Request
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnDownloadProgress = (totalSize: number, transferredSize: number, request?: Request) => void` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnHeaderReceive = (headers: ResponseHeaders) => void` ✅

- **变更类型**：自定义类型变更
- **影响版本**：6.0.0(20)
- **变更影响**：request?: Request
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnHeaderReceive = (headers: ResponseHeaders, request?: Request) => void` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnInlineCounterV2Change = (value: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：export type OnInlineCounterV2Change = (value: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnMenuItemClickWithTextCallback = (menuItem: TextMenuItem, value: string) => boolean` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：export type OnMenuItemClickWithTextCallback = (menuItem: TextMenuItem, value: string) => boolean;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnPickerStateCallback = (state: AVCastPickerState) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：export type OnPickerStateCallback = (state: AVCastPickerState) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnRequestFailureFn = (name: string, failureCode: AbilityStartFailureCode, failureMessage: string) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.1(21)
- **变更影响**：export type OnRequestFailureFn = (name: string, failureCode: AbilityStartFailureCode, failureMessage: string) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-6011
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnRequestSuccessFn = (name: string) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.1(21)
- **变更影响**：export type OnRequestSuccessFn = (name: string) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-6011
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnSelectedIndexChange = (selectedIndex: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.0.0(20)
- **变更影响**：export type OnSelectedIndexChange = (selectedIndex: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnSelectedIndexesChange = (selectedIndexes: number\[\]) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：export type OnSelectedIndexesChange = (selectedIndexes: number\[\]) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnStatusCodeReceive = (statusCode: number, request?: Request) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：export type OnStatusCodeReceive = (statusCode: number, request?: Request) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnTimeInfo = (timeInfo: TimeInfo) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)、6.0.0(20)
- **变更影响**：export type OnTimeInfo = (timeInfo: TimeInfo) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-5032
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnTimeInfo = (timeInfo: TimeInfo, request?: Request) => void` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnUploadProgress = (totalSize: number, transferredSize: number) => void` ✅

- **变更类型**：自定义类型变更
- **影响版本**：6.0.0(20)
- **变更影响**：request?: Request
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6001
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 自定义类型变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type OnUploadProgress = (totalSize: number, transferredSize: number, request?: Request) => void` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type PhotoBrowserChangeStartCallback = (targetPhotoInfo: BaseItemInfo) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、6.1.0(23)
- **变更影响**：export type PhotoBrowserChangeStartCallback = (targetPhotoInfo: BaseItemInfo) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type PhotoBrowserZoomCallback = (scale: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：export type PhotoBrowserZoomCallback = (scale: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-7002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type PinchGridSwitchedCallback = (gridLevel: photoAccessHelper.GridLevel) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、6.1.0(23)
- **变更影响**：export type PinchGridSwitchedCallback = (gridLevel: photoAccessHelper.GridLevel) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type ProxySender = (data: string) => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：export type ProxySender = (data: string) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-agentframeworkkit-7002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type RecentPhotoCheckInfoCallback = (recentPhotoExists: boolean, info: RecentPhotoInfo) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)、6.1.0(23)
- **变更影响**：export type RecentPhotoCheckInfoCallback = (recentPhotoExists: boolean, info: RecentPhotoInfo) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-b105
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 6.1.0(23) | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type ResourceUsageObserver = (resourceType: ResourceType, resourceSize: number, detailInfo?: Record<string, number>) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.1(24)
- **变更影响**：export type ResourceUsageObserver = (resourceType: ResourceType, resourceSize: number, detailInfo?: Record<string, number>) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-6111
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type ResponseHeaders = { \[k: string\]: string | string\[\] | undefined; 'accept-ranges'?: 'none' | 'bytes' | (string \& NonNullable<unknown>); 'allow'?: HttpMethod | HttpMethod\[\]; 'cache-control'?: string | string\[\]; 'content-encoding'?: ContentCoding; 'content-range'?: string; 'content-type'?: ContentType; 'date'?: string; 'etag'?: string; 'expires'?: string; 'location'?: string; 'retry-after'?: string; 'set-cookie'?: string | string\[\]; 'server'?: string; 'www-authenticate'?: string | string\[\]; }` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type ResponseValidationCallback = (response: Response) => boolean | Promise<boolean>` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type ScrollStopAtEndCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、6.1.0(23)
- **变更影响**：export type ScrollStopAtEndCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type ScrollStopAtStartCallback = () => void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、6.1.0(23)
- **变更影响**：export type ScrollStopAtStartCallback = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 6.1.0(23) | 新增导出符号 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type SearchKeyCallback = (results: SearchResultData\[\]) => boolean` ✅

- **变更类型**：新增API
- **影响版本**：6.0.1(21)
- **变更影响**：export type SearchKeyCallback = (results: SearchResultData\[\]) => boolean;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-pdfkit-6011
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type SetPreviewTextCallback = (text: string, range: Range) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.5(17)
- **变更影响**：export type SetPreviewTextCallback = (text: string, range: Range) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imekit-5051
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.5(17) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.5(17).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.5(17) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.5(17).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.5(17) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.5(17).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.5(17) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.5(17).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.5(17) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.5(17).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.5(17) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.5(17).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type SizeChangeCallback = (size: window.Size, keyboardArea?: KeyboardArea) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：export type SizeChangeCallback = (size: window.Size, keyboardArea?: KeyboardArea) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imekit-5032
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type SubHeaderV2OperationItemAction = () => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：export type SubHeaderV2OperationItemAction = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type SubHeaderV2SelectOnSelect = (selectedIndex: number, selectedContent?: string) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：export type SubHeaderV2SelectOnSelect = (selectedIndex: number, selectedContent?: string) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type SubHeaderV2TitleBuilder = () => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：export type SubHeaderV2TitleBuilder = () => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type TargetFileCallback = (request: Request, suggestedPath: Path) => TargetFile | Promise<TargetFile>` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type ToolBarV2ItemAction = (index: number) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：export type ToolBarV2ItemAction = (index: number) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type UpReadState = (readState: ReadStateCode) => void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.1(24)
- **变更影响**：export type UpReadState = (readState: ReadStateCode) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-speechkit-6111
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type ValidationCallback = (context: ValidationContext) => boolean | Promise<boolean>` ✅

- **变更类型**：API模型切换
- **影响版本**：26.0.0 Beta2、6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type customInfoWindowCallback = (markerDelegate: map.MarkerDelegate) => void` ✅

- **变更类型**：修改导出符号
- **影响版本**：26.0.0 Beta2
- **变更影响**：export { mapCommon, map, MapComponent, staticMap, site, navi, sceneMap, petalMaps, offlineMapData, customInfoWindowCallback };
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mapkit-7002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0 Beta2 | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `export type videoPlayStateChangedCallback = (state: VideoPlayerState) => void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)、6.0.2(22)
- **变更影响**：export type videoPlayStateChangedCallback = (state: VideoPlayerState) => void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-b123sp18
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 6.0.2(22) | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.2(22) | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.2(22) | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.2(22) | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.2(22) | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.2(22) | 修改导出符号 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `fontWeight(value: number | FontWeight | string): T` ✅

- **变更类型**：函数变更
- **影响版本**：6.0.0(20)
- **变更影响**：value: number \| FontWeight \| string \| Resource
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\Index.ets:149`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:193`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:213`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:345`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:149` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:193` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:213` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:345` |

  </details>

### `fontWeight(value: number | FontWeight | string): TextAttribute` ⚠️[存疑]

- **变更类型**：函数变更
- **影响版本**：6.0.0(20)
- **变更影响**：value: number \| FontWeight \| ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:193`（来源：代码扫描 ⚠️存疑）

### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute` ⚠️[存疑]

- **变更类型**：函数变更
- **影响版本**：6.0.0(20)
- **变更影响**：weight: number \| FontWeight \| ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:193`（来源：代码扫描 ⚠️存疑）

### `fontWeight: number` ✅

- **变更类型**：新增API
- **影响版本**：5.0.4(16)
- **变更影响**：fontWeight: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-readerkit-504
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:193`（来源：代码扫描）

### `fontWeight?: FontWeight` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：6.0.2(22)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6021
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:193`（来源：代码扫描）

### `fontWeight?: number | FontWeight | string` ✅

- **变更类型**：属性变更
- **影响版本**：6.0.0(20)
- **变更影响**：number,FontWeight,ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:193`（来源：代码扫描）

### `function bind(floatViewController: FloatViewController, floatingBallController: floatingBall.FloatingBallController, floatingBallParams: floatingBall.FloatingBallParams): Promise<void>` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：function bind(floatViewController: FloatViewController, floatingBallController: floatingBall.FloatingBallController, floatingBallParams: floatingBall.FloatingBallParams): Promise<void>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116`（来源：代码扫描）

### `function create(): ImageProcessor` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function create(): ImageProcessor;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imagekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72`（来源：代码扫描）

### `function create(config: FloatViewConfiguration): Promise<FloatViewController>` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：function create(config: FloatViewConfiguration): Promise<FloatViewController>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72`（来源：代码扫描）

### `function create(config: FloatingBallConfiguration): Promise<FloatingBallController>` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function create(config: FloatingBallConfiguration): Promise<FloatingBallController>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72`（来源：代码扫描）

### `function create(createParameters: CreateParameters): Promise<CreateResult>` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function create(createParameters: CreateParameters): Promise<CreateResult>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-gameservicekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72` |
  | 6.1.0(23) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72` |
  | 6.1.0(23) | 权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72` |

  </details>

### `function off(event: 'dataReceive', capability: RecvCapabilityRegistry, callback?: Callback<ReceivableTarget>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function off(event: 'dataReceive', capability: RecvCapabilityRegistry, callback?: Callback<ReceivableTarget>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sharekit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(event: 'gesturesShare', callback?: Callback<SharableTarget>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function off(event: 'gesturesShare', callback?: Callback<SharableTarget>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sharekit-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(event: 'gesturesShare', capability: SendCapabilityRegistry, callback?: Callback<SharableTarget>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function off(event: 'gesturesShare', capability: SendCapabilityRegistry, callback?: Callback<SharableTarget>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sharekit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(event: 'knockShare', capability: SendCapabilityRegistry, callback?: Callback<SharableTarget>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function off(event: 'knockShare', capability: SendCapabilityRegistry, callback?: Callback<SharableTarget>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sharekit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'BLEDeviceFind', callback?: Callback<Array<ScanResult>>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH \[since 10\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'acbStateChange', callback?: Callback<AcbStateParam>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function off(type: 'acbStateChange', callback?: Callback<AcbStateParam>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'accessibilityStateChange', callback?: Callback<boolean>): void` ✅

- **变更类型**：API卡片权限变更
- **影响版本**：6.1.0(23)
- **变更影响**：form
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-accessibilitykit-6101
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'add' | 'remove' | 'change', callback?: Callback<number>): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'advertisingStateChange', callback?: Callback<AdvertisingStateChangeInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：function off(type: 'advertisingStateChange', callback?: Callback<AdvertisingStateChangeInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'applicationState', observerId: number): Promise<void>` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function off(type: 'applicationState', observerId: number): Promise<void>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'applicationState', observerId: number, callback: AsyncCallback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：function off(type: 'applicationState', observerId: number, callback: AsyncCallback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'auditEventOccur', auditEventInfo: AuditEventInfo, callback?: Callback<AuditEvent>): void` ✅

- **变更类型**：删除错误码
- **影响版本**：6.1.0(23)
- **变更影响**：401
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-devicesecuritykit-6101
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'bluetoothDeviceFind', callback?: Callback<Array<string>>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH \[since 10\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'bluetoothScanResultChange', callback?: Callback<BluetoothScanResult>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.4(16)
- **变更影响**：function off(type: 'bluetoothScanResultChange', callback?: Callback<BluetoothScanResult>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-locationkit-504
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'bondStateChange', callback?: Callback<BondStateParam>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH \[since 10\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'brightnessInfoChange', callback?: BrightnessCallback<number, BrightnessInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：function off(type: 'brightnessInfoChange', callback?: BrightnessCallback<number, BrightnessInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'cachedGnssLocationsChange', callback?: Callback<Array<Location>>): void` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2、5.1.0(18)
- **变更影响**：3301200
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-locationkit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 26.0.0 Beta2 | 新增错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'callStateChangeEx', callback?: Callback<TelCallState>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.1(21)
- **变更影响**：function off(type: 'callStateChangeEx', callback?: Callback<TelCallState>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-telephonykit-6011
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'channelStateChange', channelId: number, callback?: Callback<ChannelStateInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)、6.1.1(24)
- **变更影响**：function off(type: 'channelStateChange', channelId: number, callback?: Callback<ChannelStateInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.1(24) | 新增错误码 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.1(24) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'complete', callback?: Callback<DownloadCompletedInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function off(type: 'complete', callback?: Callback<DownloadCompletedInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-graphicsacceleratekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'connect', sessionId: number, callback?: Callback<EventCallbackInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function off(type: 'connect', sessionId: number, callback?: Callback<EventCallbackInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'connectNotify', callback?: Callback<ConnectNotification>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function off(type: 'connectNotify', callback?: Callback<ConnectNotification>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-gameservicekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | 权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'connectionStateChange', callback?: Callback<ConnectionStateParam>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：function off(type: 'connectionStateChange', callback?: Callback<ConnectionStateParam>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'connectionStateChanged', callback?: Callback<ConnectionResult>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function off(type: 'connectionStateChanged', callback?: Callback<ConnectionResult>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'continuousTaskActive', callback?: Callback<ContinuousTaskActiveInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function off(type: 'continuousTaskActive', callback?: Callback<ContinuousTaskActiveInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-backgroundtaskskit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'continuousTaskCancel', callback?: Callback<ContinuousTaskCancelInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：function off(type: 'continuousTaskCancel', callback?: Callback<ContinuousTaskCancelInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-backgroundtaskskit-5031
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'continuousTaskSuspend', callback?: Callback<ContinuousTaskSuspendInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function off(type: 'continuousTaskSuspend', callback?: Callback<ContinuousTaskSuspendInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-backgroundtaskskit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'deviceConnect', callback?: Callback<ContinuationResult>): void` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-6101
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'deviceDisconnect', callback?: Callback<string>): void` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-6101
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'deviceFound', callback?: Callback<Array<ScanResults>>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：function off(type: 'deviceFound', callback?: Callback<Array<ScanResults>>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'deviceSelected', token: number): void` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.2(22)、6.1.0(23)
- **变更影响**：22
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'deviceUnselected', token: number): void` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.2(22)、6.1.0(23)
- **变更影响**：22
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'disconnect', sessionId: number, callback?: Callback<EventCallbackInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function off(type: 'disconnect', sessionId: number, callback?: Callback<EventCallbackInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'discovery', callback?: Callback<DiscoveryResult>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：function off(type: 'discovery', callback?: Callback<DiscoveryResult>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-gameservicekit-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | 权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'discoveryResult', callback?: Callback<Array<DiscoveryResult>>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function off(type: 'discoveryResult', callback?: Callback<Array<DiscoveryResult>>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'distributedMessageReceive', callback?: DistributedMessageCallback): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function off(type: 'distributedMessageReceive', callback?: DistributedMessageCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-pushkit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'dlpAntiPeep', callback?: Callback<DlpAntiPeepStatus>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function off(type: 'dlpAntiPeep', callback?: Callback<DlpAntiPeepStatus>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-devicesecuritykit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'doubleTap', receiver?: Callback<DoubleTapEvent>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：function off(type: 'doubleTap', receiver?: Callback<DoubleTapEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-penkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'downloadCancel', callback?: Callback<DownloadCancelData>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function off(type: 'downloadCancel', callback?: Callback<DownloadCancelData>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corevisionkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'downloadComplete', callback?: Callback<DownloadCompleteData>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function off(type: 'downloadComplete', callback?: Callback<DownloadCompleteData>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corevisionkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'downloadProgress', callback?: Callback<DownloadProgressData>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function off(type: 'downloadProgress', callback?: Callback<DownloadProgressData>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corevisionkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'downloadStart', callback?: Callback<DownloadStartData>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function off(type: 'downloadStart', callback?: Callback<DownloadStartData>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corevisionkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'downloadStatus', callback?: Callback<DownloadStatusData>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function off(type: 'downloadStatus', callback?: Callback<DownloadStatusData>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corevisionkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'error', callback?: Callback<ReturnResult>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function off(type: 'error', callback?: Callback<ReturnResult>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-gameservicekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | 权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'fail', callback?: Callback<DownloadFailedInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function off(type: 'fail', callback?: Callback<DownloadFailedInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-graphicsacceleratekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'filePreloadStateChanged', callback?: Callback<FilePreloadStatusInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、5.0.5(17)
- **变更影响**：function off(type: 'filePreloadStateChanged', callback?: Callback<FilePreloadStatusInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-previewkit-5051
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.5(17) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.5(17).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 26.0.0 Beta2 | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'foldAngleChange', callback?: Callback<Array<number>>): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'foldDisplayModeChange', callback?: Callback<FoldDisplayMode>): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'foldStatusChange', callback?: Callback<FoldStatus>): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'freeze', observer?: FreezeObserver): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function off(type: 'freeze', observer?: FreezeObserver): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'globalErrorOccurred', observer?: GlobalObserver): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function off(type: 'globalErrorOccurred', observer?: GlobalObserver): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'globalUnhandledRejectionDetected', observer?: GlobalObserver): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function off(type: 'globalUnhandledRejectionDetected', observer?: GlobalObserver): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'gnssFenceStatusChange', request: GeofenceRequest, want: WantAgent): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.APPROXIMATELY_LOCATION \[since 9 - 24\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-locationkit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'handoverChange', callback?: Callback<HandoverInfo>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：26.0.0 Beta2
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkboostkit-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'holdingHandChanged', callback?: Callback<HoldingHandStatus>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function off(type: 'holdingHandChanged', callback?: Callback<HoldingHandStatus>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-multimodalawarenesskit-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'hotkeyChange', hotkeyOptions: HotkeyOptions, callback?: Callback<HotkeyOptions>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function off(type: 'hotkeyChange', hotkeyOptions: HotkeyOptions, callback?: Callback<HotkeyOptions>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-inputkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'hotspotStateChange', callback?: Callback<number>): void` ✅

- **变更类型**：删除错误码
- **影响版本**：6.0.0(20)
- **变更影响**：202
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'keyPressed', callback?: Callback<KeyEvent>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.4(16)
- **变更影响**：function off(type: 'keyPressed', callback?: Callback<KeyEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-inputkit-504
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'locationChange', callback?: Callback<Location>): void` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2、5.1.0(18)
- **变更影响**：3301100,3301200
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-locationkit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 26.0.0 Beta2 | 新增错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 26.0.0 Beta2 | 删除错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 26.0.0 Beta2 | 权限变更 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'miniGameAddictionPrevented', callback?: Callback<string>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.1(21)
- **变更影响**：function off(type: 'miniGameAddictionPrevented', callback?: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-gameservicekit-6011
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'multiPathRecommendation', callback?: Callback<MultiPathRecommendationInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function off(type: 'multiPathRecommendation', callback?: Callback<MultiPathRecommendationInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkboostkit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'multiPathStateChange', callback?: Callback<MultiPathStateInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function off(type: 'multiPathStateChange', callback?: Callback<MultiPathStateInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkboostkit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'netQosChange', callback?: Callback<Array<NetworkQos>>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：26.0.0 Beta2
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkboostkit-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'netSceneChange', callback?: Callback<Array<NetworkScene>>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：26.0.0 Beta2
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkboostkit-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'operatingHandChanged', callback?: Callback<OperatingHandStatus>): void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、5.0.3(15)、5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: 'operatingHandChanged', callback?: Callback<OperatingHandStatus>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-multimodalawarenesskit-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 5.1.1(19) | syscap变更 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | syscap变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 26.0.0 Beta2 | 权限变更 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'operationSubmitMetadata', bundleName: string, callback?: Callback<number>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function off(type: 'operationSubmitMetadata', bundleName: string, callback?: Callback<number>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-multimodalawarenesskit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'pairingStateChange', callback?: Callback<PairingStateParam>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：function off(type: 'pairingStateChange', callback?: Callback<PairingStateParam>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'pause', callback?: Callback<AssetDownloadTask>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function off(type: 'pause', callback?: Callback<AssetDownloadTask>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-graphicsacceleratekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'pinRequired', callback?: Callback<PinRequiredParam>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH \[since 10\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'prepareContinue', context: Context, callback?: AsyncCallback<ContinueResultInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、5.1.1(19)、6.1.0(23)
- **变更影响**：function off(type: 'prepareContinue', context: Context, callback?: AsyncCallback<ContinueResultInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'printerChange', callback?: PrinterChangeCallback): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：function off(type: 'printerChange', callback?: PrinterChangeCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'progress', callback?: Callback<DownloadProgressInfo\[\]>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function off(type: 'progress', callback?: Callback<DownloadProgressInfo\[\]>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-graphicsacceleratekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'readData', callback?: Callback<DataParams>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function off(type: 'readData', callback?: Callback<DataParams>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'readProgress', callback?: Callback<ReadProgress>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function off(type: 'readProgress', callback?: Callback<ReadProgress>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-speechkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'readerModeWithInterval', elementName: ElementName, callback?: Callback<TagInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：function off(type: 'readerModeWithInterval', elementName: ElementName, callback?: Callback<TagInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-6102
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'receiveData', channelId: number, callback?: Callback<DataInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)、6.1.1(24)
- **变更影响**：function off(type: 'receiveData', channelId: number, callback?: Callback<DataInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.1(24) | 新增错误码 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.1(24) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'receiveData', sessionId: number, callback?: Callback<EventCallbackInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function off(type: 'receiveData', sessionId: number, callback?: Callback<EventCallbackInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'receiveMessage', sessionId: number, callback?: Callback<EventCallbackInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function off(type: 'receiveMessage', sessionId: number, callback?: Callback<EventCallbackInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'receivePackageInfo', callback?: Callback<PackageInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function off(type: 'receivePackageInfo', callback?: Callback<PackageInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-gameservicekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | 权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'requestMore', callback: Callback<string>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：function off(type: 'requestMore', callback: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-speechkit-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'rightMenuClick', callback?: Callback<emitter.EventData>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function off(type: 'rightMenuClick', callback?: Callback<emitter.EventData>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-statusbarextensionkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'scanDeviceFound', callback?: Callback<ScannerDevice>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function off(type: 'scanDeviceFound', callback?: Callback<ScannerDevice>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'scanDeviceSync', callback?: Callback<ScannerSyncDevice>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function off(type: 'scanDeviceSync', callback?: Callback<ScannerSyncDevice>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'screenReaderStateChange', callback?: Callback<boolean>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function off(type: 'screenReaderStateChange', callback?: Callback<boolean>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-accessibilitykit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'selectionCompleted', callback?: Callback<SelectionInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.1(24)
- **变更影响**：function off(type: 'selectionCompleted', callback?: Callback<SelectionInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'sensorStatusChange', callback?: Callback<SensorStatusEvent>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: 'sensorStatusChange', callback?: Callback<SensorStatusEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'serviceDie', callback?: Callback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function off(type: 'serviceDie', callback?: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-healthservicekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'squeeze', receiver?: Callback<SqueezeEvent>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：function off(type: 'squeeze', receiver?: Callback<SqueezeEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-penkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'stateChange', callback?: Callback<BluetoothState>): void` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2、5.1.0(18)
- **变更影响**：201
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 5.1.0(18) | 权限变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 26.0.0 Beta2 | 新增错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 26.0.0 Beta2 | 权限变更 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'stateChange', callback?: Callback<NearlinkState>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：function off(type: 'stateChange', callback?: Callback<NearlinkState>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'stateChanged', callback?: Callback<ServiceState>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、5.1.1(19)
- **变更影响**：function off(type: 'stateChanged', callback?: Callback<ServiceState>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'statusBarIconClick', callback?: Callback<emitter.EventData>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function off(type: 'statusBarIconClick', callback?: Callback<emitter.EventData>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-statusbarextensionkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'steadyStandingDetect', callback?: Callback<SteadyStandingStatus>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function off(type: 'steadyStandingDetect', callback?: Callback<SteadyStandingStatus>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-multimodalawarenesskit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'superPrivacyModeChange', callback?: Callback<SuperPrivacyMode>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：function off(type: 'superPrivacyModeChange', callback?: Callback<SuperPrivacyMode>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-devicesecuritykit-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'tokenUpdate', callback?: Callback<string>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function off(type: 'tokenUpdate', callback?: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-pushkit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'touchGuideStateChange', callback?: Callback<boolean>): void` ✅

- **变更类型**：API卡片权限变更
- **影响版本**：6.1.0(23)
- **变更影响**：form
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-accessibilitykit-6101
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'touchModeChange', callback?: Callback<string>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：function off(type: 'touchModeChange', callback?: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-accessibilitykit-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'transferNotify', callback?: Callback<TransferNotification>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function off(type: 'transferNotify', callback?: Callback<TransferNotification>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-gameservicekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | 权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'updateChange', callback?: Callback<UpdateSessionState>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function off(type: 'updateChange', callback?: Callback<UpdateSessionState>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-appgallerykit-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `function off(type: 'userAgeGroupDetected', callback?: Callback<UserClassification>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.1(24)
- **变更影响**：function off(type: 'userAgeGroupDetected', callback?: Callback<UserClassification>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-multimodalawarenesskit-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.1(24) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: 'vibratorStateChange', callback?: Callback<VibratorStatusEvent>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: 'vibratorStateChange', callback?: Callback<VibratorStatusEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.ACCELEROMETER, sensorInfoParam?: SensorInfoParam, callback?: Callback<AccelerometerResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.ACCELEROMETER, sensorInfoParam?: SensorInfoParam, callback?: Callback<AccelerometerResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.ACCELEROMETER_UNCALIBRATED, sensorInfoParam?: SensorInfoParam, callback?: Callback<AccelerometerUncalibratedResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.ACCELEROMETER_UNCALIBRATED, sensorInfoParam?: SensorInfoParam, callback?: Callback<AccelerometerUncalibratedResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.AMBIENT_LIGHT, sensorInfoParam?: SensorInfoParam, callback?: Callback<LightResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.AMBIENT_LIGHT, sensorInfoParam?: SensorInfoParam, callback?: Callback<LightResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.AMBIENT_TEMPERATURE, sensorInfoParam?: SensorInfoParam, callback?: Callback<AmbientTemperatureResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.AMBIENT_TEMPERATURE, sensorInfoParam?: SensorInfoParam, callback?: Callback<AmbientTemperatureResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.BAROMETER, sensorInfoParam?: SensorInfoParam, callback?: Callback<BarometerResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.BAROMETER, sensorInfoParam?: SensorInfoParam, callback?: Callback<BarometerResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.FUSION_PRESSURE, sensorInfoParam?: SensorInfoParam, callback?: Callback<FusionPressureResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)、6.1.0(23)
- **变更影响**：function off(type: SensorId.FUSION_PRESSURE, sensorInfoParam?: SensorInfoParam, callback?: Callback<FusionPressureResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | 新增错误码 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.GRAVITY, sensorInfoParam?: SensorInfoParam, callback?: Callback<GravityResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.GRAVITY, sensorInfoParam?: SensorInfoParam, callback?: Callback<GravityResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.GYROSCOPE, sensorInfoParam?: SensorInfoParam, callback?: Callback<GyroscopeResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.GYROSCOPE, sensorInfoParam?: SensorInfoParam, callback?: Callback<GyroscopeResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.GYROSCOPE_UNCALIBRATED, sensorInfoParam?: SensorInfoParam, callback?: Callback<GyroscopeUncalibratedResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.GYROSCOPE_UNCALIBRATED, sensorInfoParam?: SensorInfoParam, callback?: Callback<GyroscopeUncalibratedResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.HALL, sensorInfoParam?: SensorInfoParam, callback?: Callback<HallResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.HALL, sensorInfoParam?: SensorInfoParam, callback?: Callback<HallResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.HEART_RATE, sensorInfoParam?: SensorInfoParam, callback?: Callback<HeartRateResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.HEART_RATE, sensorInfoParam?: SensorInfoParam, callback?: Callback<HeartRateResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.HUMIDITY, sensorInfoParam?: SensorInfoParam, callback?: Callback<HumidityResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.HUMIDITY, sensorInfoParam?: SensorInfoParam, callback?: Callback<HumidityResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.LINEAR_ACCELEROMETER, sensorInfoParam?: SensorInfoParam, callback?: Callback<LinearAccelerometerResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.LINEAR_ACCELEROMETER, sensorInfoParam?: SensorInfoParam, callback?: Callback<LinearAccelerometerResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.MAGNETIC_FIELD, sensorInfoParam?: SensorInfoParam, callback?: Callback<MagneticFieldResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.MAGNETIC_FIELD, sensorInfoParam?: SensorInfoParam, callback?: Callback<MagneticFieldResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.MAGNETIC_FIELD_UNCALIBRATED, sensorInfoParam?: SensorInfoParam, callback?: Callback<MagneticFieldUncalibratedResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.MAGNETIC_FIELD_UNCALIBRATED, sensorInfoParam?: SensorInfoParam, callback?: Callback<MagneticFieldUncalibratedResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.ORIENTATION, sensorInfoParam?: SensorInfoParam, callback?: Callback<OrientationResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.ORIENTATION, sensorInfoParam?: SensorInfoParam, callback?: Callback<OrientationResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.PEDOMETER, sensorInfoParam?: SensorInfoParam, callback?: Callback<PedometerResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.PEDOMETER, sensorInfoParam?: SensorInfoParam, callback?: Callback<PedometerResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.PEDOMETER_DETECTION, sensorInfoParam?: SensorInfoParam, callback?: Callback<PedometerDetectionResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.PEDOMETER_DETECTION, sensorInfoParam?: SensorInfoParam, callback?: Callback<PedometerDetectionResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.PROXIMITY, sensorInfoParam?: SensorInfoParam, callback?: Callback<ProximityResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.PROXIMITY, sensorInfoParam?: SensorInfoParam, callback?: Callback<ProximityResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.ROTATION_VECTOR, sensorInfoParam?: SensorInfoParam, callback?: Callback<RotationVectorResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.ROTATION_VECTOR, sensorInfoParam?: SensorInfoParam, callback?: Callback<RotationVectorResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.SIGNIFICANT_MOTION, sensorInfoParam?: SensorInfoParam, callback?: Callback<SignificantMotionResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.SIGNIFICANT_MOTION, sensorInfoParam?: SensorInfoParam, callback?: Callback<SignificantMotionResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function off(type: SensorId.WEAR_DETECTION, sensorInfoParam?: SensorInfoParam, callback?: Callback<WearDetectionResponse>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function off(type: SensorId.WEAR_DETECTION, sensorInfoParam?: SensorInfoParam, callback?: Callback<WearDetectionResponse>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `function on(event: 'dataReceive', capability: RecvCapabilityRegistry, callback: Callback<ReceivableTarget>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function on(event: 'dataReceive', capability: RecvCapabilityRegistry, callback: Callback<ReceivableTarget>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sharekit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(event: 'gesturesShare', callback: Callback<SharableTarget>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function on(event: 'gesturesShare', callback: Callback<SharableTarget>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sharekit-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(event: 'gesturesShare', capability: SendCapabilityRegistry, callback: Callback<SharableTarget>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function on(event: 'gesturesShare', capability: SendCapabilityRegistry, callback: Callback<SharableTarget>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sharekit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(event: 'knockShare', capability: SendCapabilityRegistry, callback: Callback<SharableTarget>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function on(event: 'knockShare', capability: SendCapabilityRegistry, callback: Callback<SharableTarget>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sharekit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'BLEDeviceFind', callback: Callback<Array<ScanResult>>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH or (ohos.permission.ACCESS_BLUETOOTH and ohos.permission.GET_BLUETOOTH_PEERS_MAC) \[since 26.0.0\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'acbStateChange', callback: Callback<AcbStateParam>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function on(type: 'acbStateChange', callback: Callback<AcbStateParam>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'accessibilityStateChange', callback: Callback<boolean>): void` ✅

- **变更类型**：API卡片权限变更
- **影响版本**：6.1.0(23)
- **变更影响**：form
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-accessibilitykit-6101
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'add' | 'remove' | 'change', callback: Callback<number>): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'advertisingStateChange', callback: Callback<AdvertisingStateChangeInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：function on(type: 'advertisingStateChange', callback: Callback<AdvertisingStateChangeInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'applicationState', observer: ApplicationStateObserver): number` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function on(type: 'applicationState', observer: ApplicationStateObserver): number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'applicationState', observer: ApplicationStateObserver, bundleNameList: Array<string>): number` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function on(type: 'applicationState', observer: ApplicationStateObserver, bundleNameList: Array<string>): number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'auditEventOccur', auditEventInfo: AuditEventInfo, callback: Callback<AuditEvent>): void` ✅

- **变更类型**：删除错误码
- **影响版本**：6.1.0(23)
- **变更影响**：401
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-devicesecuritykit-6101
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'bluetoothDeviceFind', callback: Callback<Array<string>>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH or (ohos.permission.ACCESS_BLUETOOTH and ohos.permission.GET_BLUETOOTH_PEERS_MAC) \[since 26.0.0\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'bluetoothScanResultChange', callback: Callback<BluetoothScanResult>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.4(16)
- **变更影响**：function on(type: 'bluetoothScanResultChange', callback: Callback<BluetoothScanResult>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-locationkit-504
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'bondStateChange', callback: Callback<BondStateParam>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH or (ohos.permission.ACCESS_BLUETOOTH and ohos.permission.GET_BLUETOOTH_PEERS_MAC) \[since 26.0.0\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'brightnessInfoChange', callback: BrightnessCallback<number, BrightnessInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：function on(type: 'brightnessInfoChange', callback: BrightnessCallback<number, BrightnessInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'cachedGnssLocationsChange', request: CachedGnssLocationsRequest, callback: Callback<Array<Location>>): void` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2、5.1.0(18)
- **变更影响**：3301200
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-locationkit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 26.0.0 Beta2 | 新增错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'callStateChangeEx', callback: Callback<TelCallState>, options?: ObserverOptions): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.1(21)
- **变更影响**：function on(type: 'callStateChangeEx', callback: Callback<TelCallState>, options?: ObserverOptions): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-telephonykit-6011
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'channelStateChange', channelId: number, callback: Callback<ChannelStateInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)、6.1.1(24)
- **变更影响**：function on(type: 'channelStateChange', channelId: number, callback: Callback<ChannelStateInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.1(24) | 新增错误码 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.1(24) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'complete', callback: Callback<DownloadCompletedInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function on(type: 'complete', callback: Callback<DownloadCompletedInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-graphicsacceleratekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'connect', sessionId: number, callback: Callback<EventCallbackInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function on(type: 'connect', sessionId: number, callback: Callback<EventCallbackInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'connectNotify', callback: Callback<ConnectNotification>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function on(type: 'connectNotify', callback: Callback<ConnectNotification>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-gameservicekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | 权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'connectionStateChange', callback: Callback<ConnectionStateParam>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：function on(type: 'connectionStateChange', callback: Callback<ConnectionStateParam>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'connectionStateChanged', callback: Callback<ConnectionResult>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function on(type: 'connectionStateChanged', callback: Callback<ConnectionResult>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'continuousTaskActive', callback: Callback<ContinuousTaskActiveInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function on(type: 'continuousTaskActive', callback: Callback<ContinuousTaskActiveInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-backgroundtaskskit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'continuousTaskCancel', callback: Callback<ContinuousTaskCancelInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：function on(type: 'continuousTaskCancel', callback: Callback<ContinuousTaskCancelInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-backgroundtaskskit-5031
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'continuousTaskSuspend', callback: Callback<ContinuousTaskSuspendInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function on(type: 'continuousTaskSuspend', callback: Callback<ContinuousTaskSuspendInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-backgroundtaskskit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'deviceConnect', callback: Callback<ContinuationResult>): void` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-6101
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'deviceDisconnect', callback: Callback<string>): void` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-6101
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'deviceFound', callback: Callback<Array<ScanResults>>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：function on(type: 'deviceFound', callback: Callback<Array<ScanResults>>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'deviceSelected', token: number, callback: Callback<Array<ContinuationResult>>): void` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.2(22)、6.1.0(23)
- **变更影响**：22
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'deviceStateChanged', callback: Callback<DeviceInfo>, scope: Array<DeviceInfoType>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：function on(type: 'deviceStateChanged', callback: Callback<DeviceInfo>, scope: Array<DeviceInfoType>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-gameservicekit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'deviceUnselected', token: number, callback: Callback<Array<ContinuationResult>>): void` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.2(22)、6.1.0(23)
- **变更影响**：22
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'disconnect', sessionId: number, callback: Callback<EventCallbackInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function on(type: 'disconnect', sessionId: number, callback: Callback<EventCallbackInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'discovery', callback: Callback<DiscoveryResult>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：function on(type: 'discovery', callback: Callback<DiscoveryResult>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-gameservicekit-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | 权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'discoveryResult', callback: Callback<Array<DiscoveryResult>>): void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、5.1.0(18)
- **变更影响**：function on(type: 'discoveryResult', callback: Callback<Array<DiscoveryResult>>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 26.0.0 Beta2 | 权限变更 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'distributedMessageReceive', callee: Callee, callback: DistributedMessageCallback): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function on(type: 'distributedMessageReceive', callee: Callee, callback: DistributedMessageCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-pushkit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'dlpAntiPeep', callback: Callback<DlpAntiPeepStatus>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function on(type: 'dlpAntiPeep', callback: Callback<DlpAntiPeepStatus>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-devicesecuritykit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'doubleTap', receiver: Callback<DoubleTapEvent>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：function on(type: 'doubleTap', receiver: Callback<DoubleTapEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-penkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'downloadCancel', callback: Callback<DownloadCancelData>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function on(type: 'downloadCancel', callback: Callback<DownloadCancelData>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corevisionkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'downloadComplete', callback: Callback<DownloadCompleteData>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function on(type: 'downloadComplete', callback: Callback<DownloadCompleteData>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corevisionkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'downloadProgress', callback: Callback<DownloadProgressData>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function on(type: 'downloadProgress', callback: Callback<DownloadProgressData>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corevisionkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'downloadStart', callback: Callback<DownloadStartData>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function on(type: 'downloadStart', callback: Callback<DownloadStartData>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corevisionkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'downloadStatus', callback: Callback<DownloadStatusData>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function on(type: 'downloadStatus', callback: Callback<DownloadStatusData>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corevisionkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'error', callback: Callback<ReturnResult>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function on(type: 'error', callback: Callback<ReturnResult>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-gameservicekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | 权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'fail', callback: Callback<DownloadFailedInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function on(type: 'fail', callback: Callback<DownloadFailedInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-graphicsacceleratekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'filePreloadStateChanged', callback: Callback<FilePreloadStatusInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、5.0.5(17)
- **变更影响**：function on(type: 'filePreloadStateChanged', callback: Callback<FilePreloadStatusInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-previewkit-5051
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.5(17) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.5(17).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 26.0.0 Beta2 | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'foldAngleChange', callback: Callback<Array<number>>): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'foldDisplayModeChange', callback: Callback<FoldDisplayMode>): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'foldStatusChange', callback: Callback<FoldStatus>): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'freeze', observer: FreezeObserver): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function on(type: 'freeze', observer: FreezeObserver): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'globalErrorOccurred', observer: GlobalObserver): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function on(type: 'globalErrorOccurred', observer: GlobalObserver): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'globalUnhandledRejectionDetected', observer: GlobalObserver): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function on(type: 'globalUnhandledRejectionDetected', observer: GlobalObserver): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'handoverChange', callback: Callback<HandoverInfo>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：26.0.0 Beta2
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkboostkit-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'holdingHandChanged', callback: Callback<HoldingHandStatus>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function on(type: 'holdingHandChanged', callback: Callback<HoldingHandStatus>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-multimodalawarenesskit-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'hotkeyChange', hotkeyOptions: HotkeyOptions, callback: Callback<HotkeyOptions>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function on(type: 'hotkeyChange', hotkeyOptions: HotkeyOptions, callback: Callback<HotkeyOptions>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-inputkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'hotspotStateChange', callback: Callback<number>): void` ✅

- **变更类型**：删除错误码
- **影响版本**：6.0.0(20)
- **变更影响**：202
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'keyPressed', options: KeyPressedConfig, callback: Callback<KeyEvent>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.4(16)
- **变更影响**：function on(type: 'keyPressed', options: KeyPressedConfig, callback: Callback<KeyEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-inputkit-504
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'locationChange', request: LocationRequest | ContinuousLocationRequest, callback: Callback<Location>): void` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2、5.1.0(18)
- **变更影响**：3301200
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-locationkit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 26.0.0 Beta2 | 新增错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'miniGameAddictionPrevented', callback: Callback<string>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.1(21)
- **变更影响**：function on(type: 'miniGameAddictionPrevented', callback: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-gameservicekit-6011
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'multiPathRecommendation', callback: Callback<MultiPathRecommendationInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function on(type: 'multiPathRecommendation', callback: Callback<MultiPathRecommendationInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkboostkit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'multiPathStateChange', callback: Callback<MultiPathStateInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function on(type: 'multiPathStateChange', callback: Callback<MultiPathStateInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkboostkit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'netQosChange', callback: Callback<Array<NetworkQos>>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：26.0.0 Beta2
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkboostkit-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'netSceneChange', callback: Callback<Array<NetworkScene>>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：26.0.0 Beta2
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkboostkit-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'operatingHandChanged', callback: Callback<OperatingHandStatus>): void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、5.0.3(15)、5.1.1(19)、6.0.0(20)
- **变更影响**：function on(type: 'operatingHandChanged', callback: Callback<OperatingHandStatus>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-multimodalawarenesskit-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 5.1.1(19) | syscap变更 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.0.0(20) | syscap变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.0.0(20) | 权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 26.0.0 Beta2 | 权限变更 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'operationSubmitMetadata', bundleName: string, callback: Callback<number>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function on(type: 'operationSubmitMetadata', bundleName: string, callback: Callback<number>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-multimodalawarenesskit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'pairingStateChange', callback: Callback<PairingStateParam>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：function on(type: 'pairingStateChange', callback: Callback<PairingStateParam>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'pause', callback: Callback<AssetDownloadTask>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function on(type: 'pause', callback: Callback<AssetDownloadTask>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-graphicsacceleratekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'pinRequired', callback: Callback<PinRequiredParam>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH or (ohos.permission.ACCESS_BLUETOOTH and ohos.permission.GET_BLUETOOTH_PEERS_MAC) \[since 26.0.0\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'prepareContinue', context: Context, callback: AsyncCallback<ContinueResultInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、5.1.1(19)、6.1.0(23)
- **变更影响**：function on(type: 'prepareContinue', context: Context, callback: AsyncCallback<ContinueResultInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'printerChange', callback: PrinterChangeCallback): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：function on(type: 'printerChange', callback: PrinterChangeCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'progress', callback: Callback<DownloadProgressInfo\[\]>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function on(type: 'progress', callback: Callback<DownloadProgressInfo\[\]>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-graphicsacceleratekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'readData', callback: Callback<DataParams>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function on(type: 'readData', callback: Callback<DataParams>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'readProgress', callback: Callback<ReadProgress>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function on(type: 'readProgress', callback: Callback<ReadProgress>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-speechkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'readerModeWithInterval', elementName: ElementName, discTech: number\[\], callback: Callback<TagInfo>, interval: number): void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：function on(type: 'readerModeWithInterval', elementName: ElementName, discTech: number\[\], callback: Callback<TagInfo>, interval: number): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-6102
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'receiveData', channelId: number, callback: Callback<DataInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)、6.1.1(24)
- **变更影响**：function on(type: 'receiveData', channelId: number, callback: Callback<DataInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.1(24) | 新增错误码 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.1(24) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'receiveData', sessionId: number, callback: Callback<EventCallbackInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function on(type: 'receiveData', sessionId: number, callback: Callback<EventCallbackInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'receiveMessage', sessionId: number, callback: Callback<EventCallbackInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function on(type: 'receiveMessage', sessionId: number, callback: Callback<EventCallbackInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'receivePackageInfo', callback: Callback<PackageInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function on(type: 'receivePackageInfo', callback: Callback<PackageInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-gameservicekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | 权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'requestMore', callback: Callback<string>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function on(type: 'requestMore', callback: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-speechkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'rightMenuClick', callback: Callback<emitter.EventData>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function on(type: 'rightMenuClick', callback: Callback<emitter.EventData>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-statusbarextensionkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'scanDeviceFound', callback: Callback<ScannerDevice>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function on(type: 'scanDeviceFound', callback: Callback<ScannerDevice>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'scanDeviceSync', callback: Callback<ScannerSyncDevice>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function on(type: 'scanDeviceSync', callback: Callback<ScannerSyncDevice>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'screenReaderStateChange', callback: Callback<boolean>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function on(type: 'screenReaderStateChange', callback: Callback<boolean>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-accessibilitykit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'selectionCompleted', callback: Callback<SelectionInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.1(24)
- **变更影响**：function on(type: 'selectionCompleted', callback: Callback<SelectionInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'sensorStatusChange', callback: Callback<SensorStatusEvent>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function on(type: 'sensorStatusChange', callback: Callback<SensorStatusEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'serviceDie', callback: Callback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function on(type: 'serviceDie', callback: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-healthservicekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'squeeze', receiver: Callback<SqueezeEvent>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：function on(type: 'squeeze', receiver: Callback<SqueezeEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-penkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'stateChange', callback: Callback<BluetoothState>): void` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2、5.1.0(18)
- **变更影响**：201
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 5.1.0(18) | 权限变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 26.0.0 Beta2 | 新增错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 26.0.0 Beta2 | 权限变更 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'stateChange', callback: Callback<NearlinkState>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：function on(type: 'stateChange', callback: Callback<NearlinkState>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'stateChanged', callback: Callback<ServiceState>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、5.1.1(19)
- **变更影响**：function on(type: 'stateChanged', callback: Callback<ServiceState>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'statusBarIconClick', callback: Callback<emitter.EventData>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：function on(type: 'statusBarIconClick', callback: Callback<emitter.EventData>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-statusbarextensionkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'steadyStandingDetect', callback: Callback<SteadyStandingStatus>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function on(type: 'steadyStandingDetect', callback: Callback<SteadyStandingStatus>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-multimodalawarenesskit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'superPrivacyModeChange', callback: Callback<SuperPrivacyMode>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：function on(type: 'superPrivacyModeChange', callback: Callback<SuperPrivacyMode>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-devicesecuritykit-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'tokenUpdate', ability: Ability, callback: Callback<string>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function on(type: 'tokenUpdate', ability: Ability, callback: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-pushkit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'touchGuideStateChange', callback: Callback<boolean>): void` ✅

- **变更类型**：API卡片权限变更
- **影响版本**：6.1.0(23)
- **变更影响**：form
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-accessibilitykit-6101
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'touchModeChange', callback: Callback<string>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：function on(type: 'touchModeChange', callback: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-accessibilitykit-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | API卡片权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'transferNotify', callback: Callback<TransferNotification>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：function on(type: 'transferNotify', callback: Callback<TransferNotification>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-gameservicekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | 权限变更 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'updateChange', callback: Callback<UpdateSessionState>, timeout?: number): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：function on(type: 'updateChange', callback: Callback<UpdateSessionState>, timeout?: number): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-appgallerykit-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `function on(type: 'userAgeGroupDetected', callback: Callback<UserClassification>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.1(24)
- **变更影响**：function on(type: 'userAgeGroupDetected', callback: Callback<UserClassification>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-multimodalawarenesskit-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.1(24) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: 'vibratorStateChange', callback: Callback<VibratorStatusEvent>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：function on(type: 'vibratorStateChange', callback: Callback<VibratorStatusEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function on(type: SensorId.FUSION_PRESSURE, callback: Callback<FusionPressureResponse>, options?: Options): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)、6.1.0(23)
- **变更影响**：function on(type: SensorId.FUSION_PRESSURE, callback: Callback<FusionPressureResponse>, options?: Options): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sensorservicekit-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | 新增错误码 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `function stop(): Promise<void>` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：function stop(): Promise<void>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-healthservicekit-510
- **涉及代码位置**（共 3 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:129`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:358`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:368`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:129` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:358` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:368` |

  </details>

### `function unbind(floatViewController: FloatViewController, floatingBallController: floatingBall.FloatingBallController): Promise<void>` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：function unbind(floatViewController: FloatViewController, floatingBallController: floatingBall.FloatingBallController): Promise<void>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145`（来源：代码扫描）

### `getColorSync(resource: Resource): number` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.0(20)
- **变更影响**：20
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-localizationkit-6003
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:52`（来源：代码扫描）

### `getUIContext(): UIContext` ✅

- **变更类型**：成员由子类迁移至父类
- **影响版本**：5.1.0(18)
- **变更影响**：getUIContext(): UIContext;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:51`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:338`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 成员由子类迁移至父类 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:51` |
  | 5.1.0(18) | 成员由子类迁移至父类 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:338` |

  </details>

### `host: string` ✅

- **变更类型**：API模型切换
- **影响版本**：26.0.0 Beta2、6.1.0(23)
- **变更影响**：stagemodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-6101
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:52`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:52` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:52` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:52` |

  </details>

### `host?: string` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)、6.1.0(23)
- **变更影响**：host?: string;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-remotecommunicationkit-b105
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:52`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:52` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:52` |

  </details>

### `interface BrightnessInfo` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：interface BrightnessInfo
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:304`（来源：代码扫描）

### `interface Position` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：interface Position
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:304`（来源：代码扫描）

### `interface RelativePosition` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：interface RelativePosition
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:304`（来源：代码扫描）

### `interface RoundedCorner` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：interface RoundedCorner
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6101
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:304`（来源：代码扫描）

### `interface VirtualScreenConfig` ✅

- **变更类型**：新增API
- **影响版本**：5.0.4(16)
- **变更影响**：interface VirtualScreenConfig
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-504
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:304`（来源：代码扫描）

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

### `measureText(text: string, encoding: TextEncoding): number` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)、6.0.2(22)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:203`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:203` |
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:203` |

  </details>

### `off(event: 'batchDownload', callback?: Callback<MultiDownloadProgress>): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(event: 'batchDownload', callback?: Callback<MultiDownloadProgress>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corefilekit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(event: 'completed', callback?: (progress: Progress) => void): void` ✅

- **变更类型**：新增错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：21900005
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(event: 'dataChange', uris: string\[\], config: DataProxyConfig, callback?: AsyncCallback<DataProxyChangeInfo\[\]>): DataProxyResult\[\]` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：off(event: 'dataChange', uris: string\[\], config: DataProxyConfig, callback?: AsyncCallback<DataProxyChangeInfo\[\]>): DataProxyResult\[\];
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkdata-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(event: 'failed', callback?: (progress: Progress) => void): void` ✅

- **变更类型**：新增错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：21900005
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(event: 'faultOccur', callback?: Callback<Faults>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(event: 'faultOccur', callback?: Callback<Faults>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(event: 'pause', callback?: (progress: Progress) => void): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(event: 'perfStat', observer?: Callback<SqlExecutionInfo>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(event: 'perfStat', observer?: Callback<SqlExecutionInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkdata-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(event: 'progress', callback?: (progress: Progress) => void): void` ✅

- **变更类型**：新增错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：21900005
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(event: 'remove', callback?: (progress: Progress) => void): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(event: 'response', callback?: Callback<HttpResponse>): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(event: 'resume', callback?: (progress: Progress) => void): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(event: 'sqliteErrorOccurred', observer?: Callback<ExceptionMessage>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(event: 'sqliteErrorOccurred', observer?: Callback<ExceptionMessage>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkdata-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(event: 'statistics', observer?: Callback<SqlExecutionInfo>): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkdata-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(event: 'wait', callback?: Callback<WaitingReason>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(event: 'wait', callback?: Callback<WaitingReason>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(event: string, callback?: Callback<emitter.EventData>): void` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：401
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkts-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(eventId: string): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：off(eventId: string): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(eventId: string, callback: Callback<EventData>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：off(eventId: string, callback: Callback<EventData>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(eventType: 'uiExtensionSecureLimitChange', callback?: Callback<boolean>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(eventType: 'uiExtensionSecureLimitChange', callback?: Callback<boolean>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(eventType: 'windowStageClose', callback?: Callback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：off(eventType: 'windowStageClose', callback?: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(eventType: 'windowStageLifecycleEvent', callback?: Callback<WindowStageLifecycleEventType>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(eventType: 'windowStageLifecycleEvent', callback?: Callback<WindowStageLifecycleEventType>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: "headerReceive", callback?: AsyncCallback<Object>): void` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.1.0(23)
- **变更影响**：8 dynamic
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkkit-6102
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'BLECharacteristicChange', callback?: Callback<BLECharacteristic>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH \[since 10\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'BLEConnectionStateChange', callback?: Callback<BLEConnectChangedState>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH \[since 10\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'BLEDeviceFind', callback?: Callback<ScanReport>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：off(type: 'BLEDeviceFind', callback?: Callback<ScanReport>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'activeStatusChange', callback?: Callback<boolean>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：off(type: 'activeStatusChange', callback?: Callback<boolean>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'afterPanEnd', callback?: PanListenerCallback): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：5.1.1(19)
- **变更影响**：off(type: 'afterPanEnd', callback?: PanListenerCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'afterPanStart', callback?: PanListenerCallback): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：5.1.1(19)
- **变更影响**：off(type: 'afterPanStart', callback?: PanListenerCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'agentDialogClosed', callback?: Callback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.0.1(21)
- **变更影响**：off(type: 'agentDialogClosed', callback?: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-agentframeworkkit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'agentDialogOpened', callback?: Callback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.0.1(21)
- **变更影响**：off(type: 'agentDialogOpened', callback?: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-agentframeworkkit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'amplitudeUpdate', callback?: Callback<Array<Number>>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：off(type: 'amplitudeUpdate', callback?: Callback<Array<Number>>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 5.0.1(13) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'appVolumeChange', callback?: Callback<VolumeEvent>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.1(19)
- **变更影响**：off(type: 'appVolumeChange', callback?: Callback<VolumeEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'attachOptionsDidChange', callback?: Callback<AttachOptions>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.1(19)
- **变更影响**：off(type: 'attachOptionsDidChange', callback?: Callback<AttachOptions>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imekit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'audioCapturerChange'): void` ✅

- **变更类型**：函数变更
- **影响版本**：5.1.0(18)
- **变更影响**：callback?: Callback<AudioCapturerChangeInfoArray>
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'audioCapturerChange', callback?: Callback<AudioCapturerChangeInfoArray>): void` ✅

- **变更类型**：删除错误码
- **影响版本**：5.1.1(19)
- **变更影响**：401
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'audioInterrupt', callback?: Callback<InterruptEvent>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.0(18)、5.1.1(19)
- **变更影响**：off(type: 'audioInterrupt', callback?: Callback<InterruptEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 接口新增可选或必选方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'audioRendererChange'): void` ✅

- **变更类型**：函数变更
- **影响版本**：5.1.0(18)
- **变更影响**：callback?: Callback<AudioRendererChangeInfoArray>
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'audioRendererChange', callback?: Callback<AudioRendererChangeInfoArray>): void` ✅

- **变更类型**：删除错误码
- **影响版本**：5.1.1(19)
- **变更影响**：401
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'audioSceneChange', callback?: Callback<AudioScene>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'audioSceneChange', callback?: Callback<AudioScene>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'audioSessionDeactivated', callback?: Callback<AudioSessionDeactivatedEvent>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：26.0.0 Beta2
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'audioSessionStateChanged', callback?: Callback<AudioSessionStateChangedEvent>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'audioSessionStateChanged', callback?: Callback<AudioSessionStateChangedEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'authTip', callback?: AuthTipCallback): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'authTip', callback?: AuthTipCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-userauthenticationkit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'autoDeviceSwitchStatusChange', callback?: AsyncCallback<AutoDeviceSwitchStatus>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'availableAreaChange', callback?: Callback<Rect>): void` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：801
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'availableDeviceChange', callback?: Callback<DeviceChangeAction>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.1(21)
- **变更影响**：off(type: 'availableDeviceChange', callback?: Callback<DeviceChangeAction>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-6011
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'avoidAreaChange', callback?: Callback<AvoidAreaInfo>): void` ✅

- **变更类型**：新增错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：1300002
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'beforePanEnd', callback?: PanListenerCallback): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：5.1.1(19)
- **变更影响**：off(type: 'beforePanEnd', callback?: PanListenerCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'beforePanStart', callback?: PanListenerCallback): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：5.1.1(19)
- **变更影响**：off(type: 'beforePanStart', callback?: PanListenerCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'bitrateDone', callback?: Callback<number>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'callingDisplayDidChange', callback?: Callback<number>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.0(18)
- **变更影响**：off(type: 'callingDisplayDidChange', callback?: Callback<number>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'cameraOcclusionDetection', callback?: AsyncCallback<CameraOcclusionDetectionResult>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：off(type: 'cameraOcclusionDetection', callback?: AsyncCallback<CameraOcclusionDetectionResult>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-6101
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'cameraStatus', callback?: AsyncCallback<CameraStatusInfo>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'cancel', callback?: Callback<string>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.1.1(24)
- **变更影响**：off(type: 'cancel', callback?: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corespeechkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.1(24) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'captureEnd', callback?: AsyncCallback<CaptureEndInfo>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'captureReady', callback?: AsyncCallback<void>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'captureStartWithInfo', callback?: AsyncCallback<CaptureStartInfo>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'castControlAudioRendererError', callback?: ErrorCallback): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：off(type: 'castControlAudioRendererError', callback?: ErrorCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'castControlDecodingError', callback?: ErrorCallback): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：off(type: 'castControlDecodingError', callback?: ErrorCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'castControlDrmError', callback?: ErrorCallback): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：off(type: 'castControlDrmError', callback?: ErrorCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'castControlGenericError', callback?: ErrorCallback): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：off(type: 'castControlGenericError', callback?: ErrorCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'castControlIoError', callback?: ErrorCallback): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：off(type: 'castControlIoError', callback?: ErrorCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'castControlParsingError', callback?: ErrorCallback): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：off(type: 'castControlParsingError', callback?: ErrorCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'change', callback?: (sessionId: string, fields: Array<string>) => void): void` ✅

- **变更类型**：接口新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'change', callback?: DataObserver): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkdata-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'characteristicRead', callback?: Callback<CharacteristicReadRequest>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH \[since 10\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'characteristicWrite', callback?: Callback<CharacteristicWriteRequest>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH \[since 10\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'click', callback?: Callback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'click', callback?: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'close', callback?: ClientConnectionCloseCallback): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：off(type: 'close', callback?: ClientConnectionCloseCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'complete', callback?: Callback<VoiceInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.1.1(24)
- **变更影响**：off(type: 'complete', callback?: Callback<VoiceInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corespeechkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.1(24) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'complete', callback?: Callback<void>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：6.0.2(22)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'connect', callback?: Callback<WebSocketConnection>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：off(type: 'connect', callback?: Callback<WebSocketConnection>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'connectResult', callback?: Callback<ConnectResult>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：off(type: 'connectResult', callback?: Callback<ConnectResult>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'connectStateChange', callback?: Callback<BLEConnectChangedState>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH \[since 10\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'connectionAccepted', callback?: Callback<Connection>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：off(type: 'connectionAccepted', callback?: Callback<Connection>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'connectionStateChange', callback?: Callback<ConnectionChangeState>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：off(type: 'connectionStateChange', callback?: Callback<ConnectionChangeState>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'connectionStateChange', callback?: Callback<StateChangeParam>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH \[since 10\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'controlCenterEffectStatusChange', callback?: AsyncCallback<ControlCenterStatusInfo>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'controlCenterEffectStatusChange', callback?: AsyncCallback<ControlCenterStatusInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'controllerAttachStateChange', callback?: Callback<ControllerAttachState>): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'controllerAttachStateChange', callback?: Callback<ControllerAttachState>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkweb-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'currentInputDeviceChanged', callback?: Callback<CurrentInputDeviceChangedEvent>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.1(21)
- **变更影响**：off(type: 'currentInputDeviceChanged', callback?: Callback<CurrentInputDeviceChangedEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-6011
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'currentOutputDeviceChanged', callback?: Callback<CurrentOutputDeviceChangedEvent>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'currentOutputDeviceChanged', callback?: Callback<CurrentOutputDeviceChangedEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'cursorMoveInText', callback?: ErrorCallback): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：5.1.0(18)、5.1.1(19)
- **变更影响**：off(type: 'cursorMoveInText', callback?: ErrorCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-visionkit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 5.1.1(19) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'cursorMoveOutText', callback?: ErrorCallback): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：5.1.0(18)、5.1.1(19)
- **变更影响**：off(type: 'cursorMoveOutText', callback?: ErrorCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-visionkit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 5.1.1(19) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'customDataChange', callback?: Callback<Record<string, Object>>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'customDataChange', callback?: Callback<Record<string, Object>>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'dataChange', keys: Array<string>, callback?: Callback<Record<string, ValueType>>): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkdata-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'dataReceived', callback?: Callback<ArrayBuffer>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：off(type: 'dataReceived', callback?: Callback<ArrayBuffer>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'descriptorRead', callback?: Callback<DescriptorReadRequest>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH \[since 10\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'descriptorWrite', callback?: Callback<DescriptorWriteRequest>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH \[since 10\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'destroyed', callback?: Callback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.1(24)
- **变更影响**：off(type: 'destroyed', callback?: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'discardTypingText', callback?: Callback<void>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'discardTypingText', callback?: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imekit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'disconnected', callback?: Callback<number>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：off(type: 'disconnected', callback?: Callback<number>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'displayIdChange', callback?: Callback<number>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：off(type: 'displayIdChange', callback?: Callback<number>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'drawChildren', callback?: Callback<void>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'drawChildren', callback?: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'durationUpdate', callback?: Callback<number>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'endOfStream', callback?: Callback<void>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'error', callback?: ErrorCallback): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)、6.0.2(22)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'error', callback?: ErrorCallback<BusinessError>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.1.1(24)
- **变更影响**：off(type: 'error', callback?: ErrorCallback<BusinessError>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corespeechkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.1(24) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'error', camera: CameraDevice, callback?: ErrorCallback): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'errorOccurred', callback?: Callback<ErrorInfo>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'errorOccurred', callback?: Callback<ErrorInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'estimatedCaptureDuration', callback?: AsyncCallback<number>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'finishTextPreview', callback?: Callback<void>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.0.5(17)
- **变更影响**：off(type: 'finishTextPreview', callback?: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imekit-5051
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'focusStateChange', callback?: AsyncCallback<FocusState>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'foldStatusChange', callback?: AsyncCallback<FoldStatusInfo>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'frameEnd', callback?: AsyncCallback<void>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'frameMetricsMeasured', callback?: Callback<FrameMetrics>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：off(type: 'frameMetricsMeasured', callback?: Callback<FrameMetrics>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'frameShutter', callback?: AsyncCallback<FrameShutterInfo>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'frameShutterEnd', callback?: AsyncCallback<FrameShutterEndInfo>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'frameStart', callback?: AsyncCallback<void>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'freeWindowModeChange', callback?: Callback<boolean>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：off(type: 'freeWindowModeChange', callback?: Callback<boolean>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'hceCmd', callback?: AsyncCallback<number\[\]>): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：5.1.0(18)、5.1.1(19)
- **变更影响**：off(type: 'hceCmd', callback?: AsyncCallback<number\[\]>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'hidden', callback?: Callback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.1(24)
- **变更影响**：off(type: 'hidden', callback?: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'imageArrival', callback?: AsyncCallback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：off(type: 'imageArrival', callback?: AsyncCallback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imagekit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'imageRelease', callback?: AsyncCallback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：off(type: 'imageRelease', callback?: AsyncCallback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imagekit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'indoorMapEnter', callback?: Callback<IndoorMapInfo>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.1(19)
- **变更影响**：off(type: 'indoorMapEnter', callback?: Callback<IndoorMapInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mapkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'indoorMapExit', callback?: Callback<void>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.1(19)
- **变更影响**：off(type: 'indoorMapExit', callback?: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mapkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'inputStart', callback?: (kbController: KeyboardController, textInputClient: TextInputClient) => void): void` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.1.0(23)
- **变更影响**：23
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imekit-6101
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'keyboardDidHide', callback?: Callback<KeyboardInfo>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.0(18)、5.1.1(19)
- **变更影响**：off(type: 'keyboardDidHide', callback?: Callback<KeyboardInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 接口新增可选或必选方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'keyboardDidShow', callback?: Callback<KeyboardInfo>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.0(18)、5.1.1(19)
- **变更影响**：off(type: 'keyboardDidShow', callback?: Callback<KeyboardInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 接口新增可选或必选方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'keyboardShow' | 'keyboardHide', callback?: () => void): void` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.1.0(23)
- **变更影响**：23
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imekit-6101
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'keyboardWillHide', callback?: Callback<KeyboardInfo>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'keyboardWillHide', callback?: Callback<KeyboardInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'keyboardWillShow', callback?: Callback<KeyboardInfo>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'keyboardWillShow', callback?: Callback<KeyboardInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'kiaCompress', callback?: Callback<string>): void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、5.0.3(15)
- **变更影响**：off(type: 'kiaCompress', callback?: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-enterprisedataguardkit-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 26.0.0 Beta2 | 新增错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'kiaCopy', callback?: Callback<string>): void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、5.0.3(15)
- **变更影响**：off(type: 'kiaCopy', callback?: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-enterprisedataguardkit-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 26.0.0 Beta2 | 新增错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'kiaRename', callback?: Callback<string>): void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、5.0.3(15)
- **变更影响**：off(type: 'kiaRename', callback?: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-enterprisedataguardkit-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 26.0.0 Beta2 | 新增错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'macroStatusChanged', callback?: AsyncCallback<boolean>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'macroStatusChanged', callback?: AsyncCallback<boolean>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-6004
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'markReach'): void` ✅

- **变更类型**：函数变更
- **影响版本**：5.1.0(18)
- **变更影响**：callback?: Callback<number>
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'markerClusterClick', callback?: Callback<MarkerClusterInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：off(type: 'markerClusterClick', callback?: Callback<MarkerClusterInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mapkit-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'massPointOverlayClick', callback?: MassPointOverlayCallback): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'massPointOverlayClick', callback?: MassPointOverlayCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mapkit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'messageReceive', callback?: Callback<WebSocketMessage>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：off(type: 'messageReceive', callback?: Callback<WebSocketMessage>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'metadataObjectsAvailable', callback?: AsyncCallback<Array<MetadataObject>>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'micBlockStatusChanged', callback?: Callback<DeviceBlockStatusInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：off(type: 'micBlockStatusChanged', callback?: Callback<DeviceBlockStatusInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-b112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'mtuChange', callback?: Callback<number>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：off(type: 'mtuChange', callback?: Callback<number>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'navDestinationUpdateByUniqueId', navigationUniqueId: number, callback?: Callback<observer.NavDestinationInfo>): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'navDestinationUpdateByUniqueId', navigationUniqueId: number, callback?: Callback<observer.NavDestinationInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'nodeRenderState', nodeIdentity: NodeIdentity, callback?: NodeRenderStateChangeCallback): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'nodeRenderState', nodeIdentity: NodeIdentity, callback?: NodeRenderStateChangeCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'objectSearchPanelVisibilityChange', callback?: Callback<ObjectSearchPanelVisibility>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：off(type: 'objectSearchPanelVisibilityChange', callback?: Callback<ObjectSearchPanelVisibility>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-visionkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'occlusionStateChanged', callback?: Callback<OcclusionState>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：off(type: 'occlusionStateChanged', callback?: Callback<OcclusionState>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'onAttach', callback?: Callback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：off(type: 'onAttach', callback?: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'onDetach', callback?: Callback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：off(type: 'onDetach', callback?: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'openInfo', callback?: AsyncCallback<WebSocketOpenInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：off(type: 'openInfo', callback?: AsyncCallback<WebSocketOpenInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkkit-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'periodReach'): void` ✅

- **变更类型**：函数变更
- **影响版本**：5.1.0(18)
- **变更影响**：callback?: Callback<number>
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'photoAlbumChange', callback?: Callback<AlbumChangeInfos>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'photoAlbumChange', callback?: Callback<AlbumChangeInfos>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'photoAssetAvailable', callback?: AsyncCallback<photoAccessHelper.PhotoAsset>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'photoAvailable', callback?: AsyncCallback<Photo>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'photoChange', callback?: Callback<PhotoAssetChangeInfos>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'photoChange', callback?: Callback<PhotoAssetChangeInfos>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'pickerStateChange', callback?: Callback<AVCastPickerState>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)、5.0.4(16)
- **变更影响**：off(type: 'pickerStateChange', callback?: Callback<AVCastPickerState>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 5.0.4(16) | 错误码变更 | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'pipWindowSizeChange', callback?: Callback<PiPWindowSize>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)、6.0.0(20)
- **变更影响**：off(type: 'pipWindowSizeChange', callback?: Callback<PiPWindowSize>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'playFinishedWithStreamId'): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.0(18)
- **变更影响**：off(type: 'playFinishedWithStreamId'): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'playFromAssetId', callback?: (assetId: number) => void): void` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.0(20)
- **变更影响**：20
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'playWithAssetId', callback?: Callback<string>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'playWithAssetId', callback?: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'playbackRateDone', callback?: OnPlaybackRateDone): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'playbackRateDone', callback?: OnPlaybackRateDone): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'progress', callback?: Callback<string>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.1.1(24)
- **变更影响**：off(type: 'progress', callback?: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corespeechkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.1(24) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'progressChanged', callback?: ProgressObserver): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'progressChanged', callback?: ProgressObserver): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkdata-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'progressUpdate', callback?: Callback<number>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：6.0.2(22)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'propertyChange', callback?: Callback<Property>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：off(type: 'propertyChange', callback?: Callback<Property>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'propertyRead', callback?: Callback<PropertyReadRequest>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：off(type: 'propertyRead', callback?: Callback<PropertyReadRequest>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'propertyWrite', callback?: Callback<PropertyWriteRequest>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：off(type: 'propertyWrite', callback?: Callback<PropertyWriteRequest>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'rectChange', callback?: Callback<RectChangeOptions>): void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、5.0.2(14)
- **变更影响**：off(type: 'rectChange', callback?: Callback<RectChangeOptions>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 26.0.0 Beta2 | 新增错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'rectChangeInGlobalDisplay', callback?: Callback<RectChangeOptions>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'rectChangeInGlobalDisplay', callback?: Callback<RectChangeOptions>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'ringerModeChange', callback?: Callback<AudioRingMode>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.0(18)、5.1.1(19)
- **变更影响**：off(type: 'ringerModeChange', callback?: Callback<AudioRingMode>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 接口新增可选或必选方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'rotationChange', callback?: RotationChangeCallback<RotationChangeInfo, RotationChangeResult | void>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.1(19)
- **变更影响**：off(type: 'rotationChange', callback?: RotationChangeCallback<RotationChangeInfo, RotationChangeResult \| void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'screenshotAppEvent', callback?: Callback<ScreenshotEventType>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'screenshotAppEvent', callback?: Callback<ScreenshotEventType>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'seiMessageReceived', payloadTypes?: Array<number>, callback?: OnSeiMessageHandle): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.0(18)
- **变更影响**：off(type: 'seiMessageReceived', payloadTypes?: Array<number>, callback?: OnSeiMessageHandle): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'selfPermissionStateChange', permissionList: Array<Permissions>, callback?: Callback<PermissionStateChangeInfo>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.0(18)、6.1.0(23)
- **变更影响**：off(type: 'selfPermissionStateChange', permissionList: Array<Permissions>, callback?: Callback<PermissionStateChangeInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 接口新增可选或必选方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'serverStopped', callback?: Callback<number>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：off(type: 'serverStopped', callback?: Callback<number>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'serviceChange', callback?: Callback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：off(type: 'serviceChange', callback?: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'setPreviewText', callback?: SetPreviewTextCallback): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.0.5(17)
- **变更影响**：off(type: 'setPreviewText', callback?: SetPreviewTextCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imekit-5051
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'setTargetLoopMode', callback?: Callback<LoopMode>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.0(18)
- **变更影响**：off(type: 'setTargetLoopMode', callback?: Callback<LoopMode>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'shareCompleted', callback?: Callback<ShareOperationResult>): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：5.1.0(18)
- **变更影响**：off(type: 'shareCompleted', callback?: Callback<ShareOperationResult>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sharekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'sizeChange', callback?: Callback<window.Size>): void` ✅

- **变更类型**：函数变更
- **影响版本**：5.0.3(15)
- **变更影响**：callback?: SizeChangeCallback
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imekit-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'smartMobilityEvent', smartMobilityTypes: SmartMobilityType\[\], callback?: Callback<SmartMobilityEvent>): void` ✅

- **变更类型**：新增错误码
- **影响版本**：6.0.0(20)
- **变更影响**：801
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-carkit-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'smartMobilityStatus', smartMobilityTypes: SmartMobilityType\[\], callback?: Callback<SmartMobilityInfo>): void` ✅

- **变更类型**：新增错误码
- **影响版本**：6.0.0(20)
- **变更影响**：801
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-carkit-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'smoothZoomInfoAvailable', callback?: AsyncCallback<SmoothZoomInfo>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'spatializationEnabledChangeForCurrentDevice', callback?: Callback<boolean>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、5.1.1(19)
- **变更影响**：off(type: 'spatializationEnabledChangeForCurrentDevice', callback?: Callback<boolean>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'speedDone', callback?: Callback<number>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'start', callback?: Callback<string>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.1.1(24)
- **变更影响**：off(type: 'start', callback?: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corespeechkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.1.1(24) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'startRenderFrame', callback?: Callback<void>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'stateChange', callback?: Callback<AudioState>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.0(18)、5.1.1(19)
- **变更影响**：off(type: 'stateChange', callback?: Callback<AudioState>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 接口新增可选或必选方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'stateChange', callback?: Callback<FloatingBallState>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'stateChange', callback?: Callback<FloatingBallState>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'status', callback?: (sessionId: string, networkId: string, status: 'online' | 'offline') => void): void` ✅

- **变更类型**：接口新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'status', callback?: StatusObserver): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkdata-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'statusChange', callback?: Callback<AudioLoopbackStatus>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'statusChange', callback?: Callback<AudioLoopbackStatus>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'streamVolumeChange', callback?: Callback<StreamVolumeEvent>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'streamVolumeChange', callback?: Callback<StreamVolumeEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'superResolutionChanged', callback?: OnSuperResolutionChanged): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.0(18)
- **变更影响**：off(type: 'superResolutionChanged', callback?: OnSuperResolutionChanged): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'systemDensityChange', callback?: Callback<number>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：off(type: 'systemDensityChange', callback?: Callback<number>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5031
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'systemPressureLevelChange', callback?: AsyncCallback<SystemPressureLevel>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'systemPressureLevelChange', callback?: AsyncCallback<SystemPressureLevel>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'tabChange', callback?: Callback<observer.TabContentInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：off(type: 'tabChange', callback?: Callback<observer.TabContentInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'tabChange', config: observer.ObserverOptions, callback?: Callback<observer.TabContentInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：off(type: 'tabChange', config: observer.ObserverOptions, callback?: Callback<observer.TabContentInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'textChange', callback?: Callback<observer.TextChangeEventInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：off(type: 'textChange', callback?: Callback<observer.TextChangeEventInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'textChange', identity: observer.ObserverOptions, callback?: Callback<observer.TextChangeEventInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：off(type: 'textChange', identity: observer.ObserverOptions, callback?: Callback<observer.TextChangeEventInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'torchStatusChange', callback?: AsyncCallback<TorchStatusInfo>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'volumeChange', callback?: Callback<VolumeEvent>): void` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.0(20)
- **变更影响**：20
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'volumeChange', callback?: Callback<number>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)、6.0.0(20)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-5112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |
  | 6.0.0(20) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135` |

  </details>

### `off(type: 'windowHighlightChange', callback?: Callback<boolean>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：off(type: 'windowHighlightChange', callback?: Callback<boolean>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'windowSizeChange', callback?: Callback<window.Size>): void` ✅

- **变更类型**：新增错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：1300002
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'windowSizeLayoutBreakpointChange', callback?: Callback<observer.WindowSizeLayoutBreakpointInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：off(type: 'windowSizeLayoutBreakpointChange', callback?: Callback<observer.WindowSizeLayoutBreakpointInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'windowStatusDidChange', callback?: Callback<WindowStatusType>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：off(type: 'windowStatusDidChange', callback?: Callback<WindowStatusType>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: 'windowWillClose', callback?: Callback<void, Promise<boolean>>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：off(type: 'windowWillClose', callback?: Callback<void, Promise<boolean>>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off(type: string, listener?: WorkerEventListener): void` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：401
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkts-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `off<T>(eventId: string, callback: Callback<GenericEventData<T>>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：off<T>(eventId: string, callback: Callback<GenericEventData<T>>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `on(event: 'batchDownload', callback: Callback<MultiDownloadProgress>): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(event: 'batchDownload', callback: Callback<MultiDownloadProgress>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corefilekit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(event: 'completed', callback: (progress: Progress) => void): void` ✅

- **变更类型**：新增错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：21900005
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(event: 'dataChange', uris: string\[\], config: DataProxyConfig, callback: AsyncCallback<DataProxyChangeInfo\[\]>): DataProxyResult\[\]` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：on(event: 'dataChange', uris: string\[\], config: DataProxyConfig, callback: AsyncCallback<DataProxyChangeInfo\[\]>): DataProxyResult\[\];
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkdata-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(event: 'failed', callback: (progress: Progress) => void): void` ✅

- **变更类型**：新增错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：21900005
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(event: 'faultOccur', callback: Callback<Faults>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(event: 'faultOccur', callback: Callback<Faults>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(event: 'pause', callback: (progress: Progress) => void): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(event: 'perfStat', observer: Callback<SqlExecutionInfo>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(event: 'perfStat', observer: Callback<SqlExecutionInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkdata-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(event: 'progress', callback: (progress: Progress) => void): void` ✅

- **变更类型**：新增错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：21900005
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(event: 'remove', callback: (progress: Progress) => void): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(event: 'response', callback: Callback<HttpResponse>): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(event: 'resume', callback: (progress: Progress) => void): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(event: 'sqliteErrorOccurred', observer: Callback<ExceptionMessage>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(event: 'sqliteErrorOccurred', observer: Callback<ExceptionMessage>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkdata-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(event: 'statistics', observer: Callback<SqlExecutionInfo>): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkdata-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(event: 'wait', callback: Callback<WaitingReason>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(event: 'wait', callback: Callback<WaitingReason>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(event: string, callback: Callback<emitter.EventData>): void` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：401
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkts-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(eventId: string, callback: Callback<EventData>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：on(eventId: string, callback: Callback<EventData>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(eventType: 'uiExtensionSecureLimitChange', callback: Callback<boolean>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(eventType: 'uiExtensionSecureLimitChange', callback: Callback<boolean>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(eventType: 'windowStageClose', callback: Callback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：on(eventType: 'windowStageClose', callback: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(eventType: 'windowStageLifecycleEvent', callback: Callback<WindowStageLifecycleEventType>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(eventType: 'windowStageLifecycleEvent', callback: Callback<WindowStageLifecycleEventType>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: "headerReceive", callback: AsyncCallback<Object>): void` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.1.0(23)
- **变更影响**：8 dynamic
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkkit-6102
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'BLECharacteristicChange', callback: Callback<BLECharacteristic>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH \[since 10\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'BLEConnectionStateChange', callback: Callback<BLEConnectChangedState>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH \[since 10\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'BLEDeviceFind', callback: Callback<ScanReport>): void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、5.0.3(15)
- **变更影响**：on(type: 'BLEDeviceFind', callback: Callback<ScanReport>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 26.0.0 Beta2 | 权限变更 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'accountChange', owners: Array<string>, callback: Callback<Array<AppAccountInfo>>): void` ✅

- **变更类型**：错误码变更
- **影响版本**：26.0.0 Beta2、5.0.2(14)
- **变更影响**：12300001,12300002,401
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 错误码变更 | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 26.0.0 Beta2 | 错误码变更 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'activeStatusChange', callback: Callback<boolean>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：on(type: 'activeStatusChange', callback: Callback<boolean>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'afterPanEnd', callback: PanListenerCallback): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：5.1.1(19)
- **变更影响**：on(type: 'afterPanEnd', callback: PanListenerCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'afterPanStart', callback: PanListenerCallback): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：5.1.1(19)
- **变更影响**：on(type: 'afterPanStart', callback: PanListenerCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'agentDialogClosed', callback: Callback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.0.1(21)
- **变更影响**：on(type: 'agentDialogClosed', callback: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-agentframeworkkit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'agentDialogOpened', callback: Callback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.0.1(21)
- **变更影响**：on(type: 'agentDialogOpened', callback: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-agentframeworkkit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'amplitudeUpdate', callback: Callback<Array<Number>>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：on(type: 'amplitudeUpdate', callback: Callback<Array<Number>>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.1(13) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 5.0.1(13) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.0.1(13)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'appVolumeChange', callback: Callback<VolumeEvent>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.1(19)
- **变更影响**：on(type: 'appVolumeChange', callback: Callback<VolumeEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'attachOptionsDidChange', callback: Callback<AttachOptions>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：26.0.0 Beta2、5.1.1(19)、6.0.0(20)
- **变更影响**：on(type: 'attachOptionsDidChange', callback: Callback<AttachOptions>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imekit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 接口新增可选或必选方法 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.0.0(20) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 26.0.0 Beta2 | 新增错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'audioSceneChange', callback: Callback<AudioScene>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'audioSceneChange', callback: Callback<AudioScene>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'audioSessionDeactivated', callback: Callback<AudioSessionDeactivatedEvent>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：26.0.0 Beta2
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'audioSessionStateChanged', callback: Callback<AudioSessionStateChangedEvent>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'audioSessionStateChanged', callback: Callback<AudioSessionStateChangedEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'authTip', callback: AuthTipCallback): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'authTip', callback: AuthTipCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-userauthenticationkit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'autoDeviceSwitchStatusChange', callback: AsyncCallback<AutoDeviceSwitchStatus>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'availableAreaChange', callback: Callback<Rect>): void` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：801
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'availableDeviceChange', deviceUsage: DeviceUsage, callback: Callback<DeviceChangeAction>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.1(21)
- **变更影响**：on(type: 'availableDeviceChange', deviceUsage: DeviceUsage, callback: Callback<DeviceChangeAction>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-6011
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'avoidAreaChange', callback: Callback<AvoidAreaInfo>): void` ✅

- **变更类型**：新增错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：1300002
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'beforePanEnd', callback: PanListenerCallback): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：5.1.1(19)
- **变更影响**：on(type: 'beforePanEnd', callback: PanListenerCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'beforePanStart', callback: PanListenerCallback): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：5.1.1(19)
- **变更影响**：on(type: 'beforePanStart', callback: PanListenerCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'callingDisplayDidChange', callback: Callback<number>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.0(18)
- **变更影响**：on(type: 'callingDisplayDidChange', callback: Callback<number>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'cameraOcclusionDetection', callback: AsyncCallback<CameraOcclusionDetectionResult>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：on(type: 'cameraOcclusionDetection', callback: AsyncCallback<CameraOcclusionDetectionResult>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-6101
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'cameraStatus', callback: AsyncCallback<CameraStatusInfo>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'cancel', callback: Callback<string>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.1.1(24)
- **变更影响**：on(type: 'cancel', callback: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corespeechkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.1(24) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'captureEnd', callback: AsyncCallback<CaptureEndInfo>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'captureReady', callback: AsyncCallback<void>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'captureStartWithInfo', callback: AsyncCallback<CaptureStartInfo>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'castControlAudioRendererError', callback: ErrorCallback): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：on(type: 'castControlAudioRendererError', callback: ErrorCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'castControlDecodingError', callback: ErrorCallback): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：on(type: 'castControlDecodingError', callback: ErrorCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'castControlDrmError', callback: ErrorCallback): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：on(type: 'castControlDrmError', callback: ErrorCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'castControlGenericError', callback: ErrorCallback): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：on(type: 'castControlGenericError', callback: ErrorCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'castControlIoError', callback: ErrorCallback): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：on(type: 'castControlIoError', callback: ErrorCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'castControlParsingError', callback: ErrorCallback): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：on(type: 'castControlParsingError', callback: ErrorCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'change', callback: (sessionId: string, fields: Array<string>) => void): void` ✅

- **变更类型**：接口新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'change', callback: DataObserver): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkdata-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'characteristicRead', callback: Callback<CharacteristicReadRequest>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH or (ohos.permission.ACCESS_BLUETOOTH and ohos.permission.GET_BLUETOOTH_PEERS_MAC) \[since 26.0.0\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'characteristicWrite', callback: Callback<CharacteristicWriteRequest>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH or (ohos.permission.ACCESS_BLUETOOTH and ohos.permission.GET_BLUETOOTH_PEERS_MAC) \[since 26.0.0\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'click', callback: Callback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'click', callback: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'close', callback: ClientConnectionCloseCallback): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：on(type: 'close', callback: ClientConnectionCloseCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'complete', callback: Callback<VoiceInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.1.1(24)
- **变更影响**：on(type: 'complete', callback: Callback<VoiceInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corespeechkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.1(24) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'complete', callback: Callback<void>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：6.0.2(22)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'connect', callback: Callback<WebSocketConnection>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：on(type: 'connect', callback: Callback<WebSocketConnection>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'connectResult', callback: Callback<ConnectResult>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：on(type: 'connectResult', callback: Callback<ConnectResult>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'connectStateChange', callback: Callback<BLEConnectChangedState>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH \[since 10\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'connectionAccepted', callback: Callback<Connection>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：on(type: 'connectionAccepted', callback: Callback<Connection>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'connectionStateChange', callback: Callback<BLEConnectionChangeState>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH or (ohos.permission.ACCESS_BLUETOOTH and ohos.permission.GET_BLUETOOTH_PEERS_MAC) \[since 26.0.0\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'connectionStateChange', callback: Callback<ConnectionChangeState>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：on(type: 'connectionStateChange', callback: Callback<ConnectionChangeState>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'connectionStateChange', callback: Callback<StateChangeParam>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH or (ohos.permission.ACCESS_BLUETOOTH and ohos.permission.GET_BLUETOOTH_PEERS_MAC) \[since 26.0.0\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'controlCenterEffectStatusChange', callback: AsyncCallback<ControlCenterStatusInfo>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'controlCenterEffectStatusChange', callback: AsyncCallback<ControlCenterStatusInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'controllerAttachStateChange', callback: Callback<ControllerAttachState>): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'controllerAttachStateChange', callback: Callback<ControllerAttachState>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkweb-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'currentInputDeviceChanged', callback: Callback<CurrentInputDeviceChangedEvent>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.1(21)
- **变更影响**：on(type: 'currentInputDeviceChanged', callback: Callback<CurrentInputDeviceChangedEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-6011
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'currentOutputDeviceChanged', callback: Callback<CurrentOutputDeviceChangedEvent>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'currentOutputDeviceChanged', callback: Callback<CurrentOutputDeviceChangedEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'cursorMoveInText', callback: Callback<void>): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：5.1.0(18)、5.1.1(19)
- **变更影响**：on(type: 'cursorMoveInText', callback: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-visionkit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'cursorMoveOutText', callback: Callback<void>): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：5.1.0(18)、5.1.1(19)
- **变更影响**：on(type: 'cursorMoveOutText', callback: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-visionkit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'customDataChange', callback: Callback<Record<string, Object>>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'customDataChange', callback: Callback<Record<string, Object>>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'dataChange', keys: Array<string>, callback: Callback<Record<string, ValueType>>): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkdata-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'dataReceived', callback: Callback<ArrayBuffer>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：on(type: 'dataReceived', callback: Callback<ArrayBuffer>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'descriptorRead', callback: Callback<DescriptorReadRequest>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH or (ohos.permission.ACCESS_BLUETOOTH and ohos.permission.GET_BLUETOOTH_PEERS_MAC) \[since 26.0.0\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'descriptorWrite', callback: Callback<DescriptorWriteRequest>): void` ✅

- **变更类型**：权限变更
- **影响版本**：26.0.0 Beta2
- **变更影响**：ohos.permission.ACCESS_BLUETOOTH or (ohos.permission.ACCESS_BLUETOOTH and ohos.permission.GET_BLUETOOTH_PEERS_MAC) \[since 26.0.0\]
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'destroyed', callback: Callback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.1(24)
- **变更影响**：on(type: 'destroyed', callback: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'discardTypingText', callback: Callback<void>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'discardTypingText', callback: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imekit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'disconnected', callback: Callback<number>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：on(type: 'disconnected', callback: Callback<number>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'displayIdChange', callback: Callback<number>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)
- **变更影响**：on(type: 'displayIdChange', callback: Callback<number>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'drawChildren', callback: Callback<void>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'drawChildren', callback: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'error', callback: ErrorCallback): void` ✅

- **变更类型**：错误码变更
- **影响版本**：26.0.0 Beta2、5.0.2(14)、5.1.1(19)、6.0.0(20)、6.0.2(22)、6.1.0(23)
- **变更影响**：201,401,5400101,5400102,5400104,5400105,5400106,5411001,5411002,5411003,5411004,5411005,5411006,5411007,5411008,5411009,5411010,5411011,801
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 错误码变更 | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 5.1.1(19) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.0.0(20) | 新增错误码 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta5.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | 新增错误码 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 26.0.0 Beta2 | 新增错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'error', callback: ErrorCallback<BusinessError>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.1.1(24)
- **变更影响**：on(type: 'error', callback: ErrorCallback<BusinessError>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corespeechkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.1(24) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'error', camera: CameraDevice, callback: ErrorCallback): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'errorOccurred', callback: Callback<ErrorInfo>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'errorOccurred', callback: Callback<ErrorInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'estimatedCaptureDuration', callback: AsyncCallback<number>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'finishTextPreview', callback: Callback<void>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.0.5(17)
- **变更影响**：on(type: 'finishTextPreview', callback: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imekit-5051
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'focusStateChange', callback: AsyncCallback<FocusState>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'foldStatusChange', callback: AsyncCallback<FoldStatusInfo>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'frameEnd', callback: AsyncCallback<void>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'frameMetricsMeasured', callback: Callback<FrameMetrics>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：on(type: 'frameMetricsMeasured', callback: Callback<FrameMetrics>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'frameShutter', callback: AsyncCallback<FrameShutterInfo>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'frameShutterEnd', callback: AsyncCallback<FrameShutterEndInfo>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'frameStart', callback: AsyncCallback<void>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'freeWindowModeChange', callback: Callback<boolean>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：on(type: 'freeWindowModeChange', callback: Callback<boolean>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'hceCmd', callback: AsyncCallback<number\[\]>): void` ✅

- **变更类型**：新增错误码
- **影响版本**：5.1.0(18)
- **变更影响**：201,401,801
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'hidden', callback: Callback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.1(24)
- **变更影响**：on(type: 'hidden', callback: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'indoorMapEnter', callback: Callback<IndoorMapInfo>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.1(19)
- **变更影响**：on(type: 'indoorMapEnter', callback: Callback<IndoorMapInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mapkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'indoorMapExit', callback: Callback<void>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.1(19)
- **变更影响**：on(type: 'indoorMapExit', callback: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mapkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'inputStart', callback: (kbController: KeyboardController, textInputClient: TextInputClient) => void): void` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.1.0(23)
- **变更影响**：23
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imekit-6101
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'keyboardDidHide', callback: Callback<KeyboardInfo>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.0(18)、5.1.1(19)
- **变更影响**：on(type: 'keyboardDidHide', callback: Callback<KeyboardInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 接口新增可选或必选方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'keyboardDidShow', callback: Callback<KeyboardInfo>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.0(18)、5.1.1(19)
- **变更影响**：on(type: 'keyboardDidShow', callback: Callback<KeyboardInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 接口新增可选或必选方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'keyboardShow' | 'keyboardHide', callback: () => void): void` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.1.0(23)
- **变更影响**：23
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imekit-6101
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'keyboardWillHide', callback: Callback<KeyboardInfo>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'keyboardWillHide', callback: Callback<KeyboardInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'keyboardWillShow', callback: Callback<KeyboardInfo>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'keyboardWillShow', callback: Callback<KeyboardInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'kiaCompress', callback: Callback<string>): void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、5.0.3(15)
- **变更影响**：on(type: 'kiaCompress', callback: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-enterprisedataguardkit-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 26.0.0 Beta2 | 新增错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'kiaCopy', callback: Callback<string>): void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、5.0.3(15)
- **变更影响**：on(type: 'kiaCopy', callback: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-enterprisedataguardkit-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 26.0.0 Beta2 | 新增错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'kiaRename', callback: Callback<string>): void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、5.0.3(15)
- **变更影响**：on(type: 'kiaRename', callback: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-enterprisedataguardkit-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 26.0.0 Beta2 | 新增错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'macroStatusChanged', callback: AsyncCallback<boolean>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'macroStatusChanged', callback: AsyncCallback<boolean>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-6004
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'markerClusterClick', callback: Callback<MarkerClusterInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：on(type: 'markerClusterClick', callback: Callback<MarkerClusterInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mapkit-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'massPointOverlayClick', callback: MassPointOverlayCallback): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'massPointOverlayClick', callback: MassPointOverlayCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mapkit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'messageReceive', callback: Callback<WebSocketMessage>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：on(type: 'messageReceive', callback: Callback<WebSocketMessage>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'metadataObjectsAvailable', callback: AsyncCallback<Array<MetadataObject>>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'micBlockStatusChanged', callback: Callback<DeviceBlockStatusInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：on(type: 'micBlockStatusChanged', callback: Callback<DeviceBlockStatusInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-b112
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'mtuChange', callback: Callback<number>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：on(type: 'mtuChange', callback: Callback<number>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'navDestinationUpdateByUniqueId', navigationUniqueId: number, callback: Callback<observer.NavDestinationInfo>): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'navDestinationUpdateByUniqueId', navigationUniqueId: number, callback: Callback<observer.NavDestinationInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'nodeRenderState', nodeIdentity: NodeIdentity, callback: NodeRenderStateChangeCallback): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'nodeRenderState', nodeIdentity: NodeIdentity, callback: NodeRenderStateChangeCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'objectSearchPanelVisibilityChange', callback: Callback<ObjectSearchPanelVisibility>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：on(type: 'objectSearchPanelVisibilityChange', callback: Callback<ObjectSearchPanelVisibility>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-visionkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'occlusionStateChanged', callback: Callback<OcclusionState>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：on(type: 'occlusionStateChanged', callback: Callback<OcclusionState>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'onAttach', callback: Callback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：on(type: 'onAttach', callback: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'onDetach', callback: Callback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：on(type: 'onDetach', callback: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'openInfo', callback: AsyncCallback<WebSocketOpenInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：on(type: 'openInfo', callback: AsyncCallback<WebSocketOpenInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkkit-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'photoAlbumChange', callback: Callback<AlbumChangeInfos>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'photoAlbumChange', callback: Callback<AlbumChangeInfos>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'photoAssetAvailable', callback: AsyncCallback<photoAccessHelper.PhotoAsset>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'photoAvailable', callback: AsyncCallback<Photo>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'photoChange', callback: Callback<PhotoAssetChangeInfos>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'photoChange', callback: Callback<PhotoAssetChangeInfos>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-medialibrarykit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'pickerStateChange', callback: Callback<AVCastPickerState>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.2(14)、5.0.4(16)
- **变更影响**：on(type: 'pickerStateChange', callback: Callback<AVCastPickerState>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 5.0.4(16) | 错误码变更 | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'pipWindowSizeChange', callback: Callback<PiPWindowSize>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：on(type: 'pipWindowSizeChange', callback: Callback<PiPWindowSize>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'playFinishedWithStreamId', callback: Callback<number>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.0(18)
- **变更影响**：on(type: 'playFinishedWithStreamId', callback: Callback<number>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'playFromAssetId', callback: (assetId: number) => void): void` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.0(20)
- **变更影响**：20
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'playWithAssetId', callback: Callback<string>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'playWithAssetId', callback: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'playbackRateDone', callback: OnPlaybackRateDone): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'playbackRateDone', callback: OnPlaybackRateDone): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'progress', callback: Callback<string>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.1.1(24)
- **变更影响**：on(type: 'progress', callback: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corespeechkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.1(24) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'progressChanged', callback: ProgressObserver): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'progressChanged', callback: ProgressObserver): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkdata-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'progressUpdate', callback: Callback<number>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：6.0.2(22)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'propertyChange', callback: Callback<Property>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：on(type: 'propertyChange', callback: Callback<Property>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'propertyRead', callback: Callback<PropertyReadRequest>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：on(type: 'propertyRead', callback: Callback<PropertyReadRequest>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'propertyWrite', callback: Callback<PropertyWriteRequest>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.1(13)
- **变更影响**：on(type: 'propertyWrite', callback: Callback<PropertyWriteRequest>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-nearlinkkit-b105
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'rectChange', reasons: number, callback: Callback<RectChangeOptions>): void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、5.0.2(14)
- **变更影响**：on(type: 'rectChange', reasons: number, callback: Callback<RectChangeOptions>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-b123sp18
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.2(14).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 26.0.0 Beta2 | 新增错误码 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'rectChangeInGlobalDisplay', callback: Callback<RectChangeOptions>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'rectChangeInGlobalDisplay', callback: Callback<RectChangeOptions>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'rotationChange', callback: RotationChangeCallback<RotationChangeInfo, RotationChangeResult | void>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.1(19)
- **变更影响**：on(type: 'rotationChange', callback: RotationChangeCallback<RotationChangeInfo, RotationChangeResult \| void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'screenshotAppEvent', callback: Callback<ScreenshotEventType>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'screenshotAppEvent', callback: Callback<ScreenshotEventType>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'seiMessageReceived', payloadTypes: Array<number>, callback: OnSeiMessageHandle): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.0(18)
- **变更影响**：on(type: 'seiMessageReceived', payloadTypes: Array<number>, callback: OnSeiMessageHandle): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'selfPermissionStateChange', permissionList: Array<Permissions>, callback: Callback<PermissionStateChangeInfo>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.0(18)
- **变更影响**：on(type: 'selfPermissionStateChange', permissionList: Array<Permissions>, callback: Callback<PermissionStateChangeInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-abilitykit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'serverStopped', callback: Callback<number>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：on(type: 'serverStopped', callback: Callback<number>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'serviceChange', callback: Callback<void>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：on(type: 'serviceChange', callback: Callback<void>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-connectivitykit-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'setPreviewText', callback: SetPreviewTextCallback): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.0.5(17)
- **变更影响**：on(type: 'setPreviewText', callback: SetPreviewTextCallback): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imekit-5051
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'setTargetLoopMode', callback: Callback<LoopMode>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.0(18)
- **变更影响**：on(type: 'setTargetLoopMode', callback: Callback<LoopMode>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-avsessionkit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'shareCompleted', callback: Callback<ShareOperationResult>): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：5.1.0(18)
- **变更影响**：on(type: 'shareCompleted', callback: Callback<ShareOperationResult>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-sharekit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'sizeChange', callback: Callback<window.Size>): void` ✅

- **变更类型**：函数变更
- **影响版本**：5.0.3(15)
- **变更影响**：callback: SizeChangeCallback
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imekit-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'smartMobilityEvent', smartMobilityTypes: SmartMobilityType\[\], callback: Callback<SmartMobilityEvent>): void` ✅

- **变更类型**：新增错误码
- **影响版本**：6.0.0(20)
- **变更影响**：801
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-carkit-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'smartMobilityStatus', smartMobilityTypes: SmartMobilityType\[\], callback: Callback<SmartMobilityInfo>): void` ✅

- **变更类型**：新增错误码
- **影响版本**：6.0.0(20)
- **变更影响**：801
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-carkit-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'smoothZoomInfoAvailable', callback: AsyncCallback<SmoothZoomInfo>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'spatializationEnabledChangeForCurrentDevice', callback: Callback<boolean>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)、5.1.1(19)
- **变更影响**：on(type: 'spatializationEnabledChangeForCurrentDevice', callback: Callback<boolean>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 5.1.1(19) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'start', callback: Callback<string>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)、6.1.1(24)
- **变更影响**：on(type: 'start', callback: Callback<string>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corespeechkit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |
  | 6.1.1(24) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97` |

  </details>

### `on(type: 'stateChange', callback: Callback<FloatingBallState>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'stateChange', callback: Callback<FloatingBallState>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'status', callback: (sessionId: string, networkId: string, status: 'online' | 'offline') => void): void` ✅

- **变更类型**：接口新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'status', callback: StatusObserver): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkdata-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'statusChange', callback: Callback<AudioLoopbackStatus>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'statusChange', callback: Callback<AudioLoopbackStatus>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-6002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'streamVolumeChange', streamUsage: StreamUsage, callback: Callback<StreamVolumeEvent>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'streamVolumeChange', streamUsage: StreamUsage, callback: Callback<StreamVolumeEvent>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'superResolutionChanged', callback: OnSuperResolutionChanged): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：5.1.0(18)
- **变更影响**：on(type: 'superResolutionChanged', callback: OnSuperResolutionChanged): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'systemDensityChange', callback: Callback<number>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：on(type: 'systemDensityChange', callback: Callback<number>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5031
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'systemPressureLevelChange', callback: AsyncCallback<SystemPressureLevel>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'systemPressureLevelChange', callback: AsyncCallback<SystemPressureLevel>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'tabChange', callback: Callback<observer.TabContentInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：on(type: 'tabChange', callback: Callback<observer.TabContentInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'tabChange', config: observer.ObserverOptions, callback: Callback<observer.TabContentInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：on(type: 'tabChange', config: observer.ObserverOptions, callback: Callback<observer.TabContentInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'textChange', callback: Callback<observer.TextChangeEventInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：on(type: 'textChange', callback: Callback<observer.TextChangeEventInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'textChange', identity: observer.ObserverOptions, callback: Callback<observer.TextChangeEventInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：on(type: 'textChange', identity: observer.ObserverOptions, callback: Callback<observer.TextChangeEventInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'torchStatusChange', callback: AsyncCallback<TorchStatusInfo>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'volumeChange', callback: Callback<VolumeEvent>): void` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.0(20)
- **变更影响**：20
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-audiokit-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'windowHighlightChange', callback: Callback<boolean>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：on(type: 'windowHighlightChange', callback: Callback<boolean>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'windowSizeChange', callback: Callback<window.Size>): void` ✅

- **变更类型**：新增错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：1300002
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'windowSizeLayoutBreakpointChange', callback: Callback<observer.WindowSizeLayoutBreakpointInfo>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：on(type: 'windowSizeLayoutBreakpointChange', callback: Callback<observer.WindowSizeLayoutBreakpointInfo>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'windowStatusDidChange', callback: Callback<WindowStatusType>): void` ✅

- **变更类型**：接口新增可选或必选方法
- **影响版本**：6.0.0(20)
- **变更影响**：on(type: 'windowStatusDidChange', callback: Callback<WindowStatusType>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'windowWillClose', callback: Callback<void, Promise<boolean>>): void` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：on(type: 'windowWillClose', callback: Callback<void, Promise<boolean>>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: string, listener: WorkerEventListener): void` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：401
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkts-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on<T>(eventId: string, callback: Callback<GenericEventData<T>>): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：on<T>(eventId: string, callback: Callback<GenericEventData<T>>): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-basicserviceskit-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on?: On` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：on?: On;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-testkit-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `onAreaChange(event: (oldValue: Area, newValue: Area) => void): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：26.0.0 Beta2
- **变更影响**：onAreaChange(event: AreaChangeCallback, options?: AreaChangeOptions): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:395`（来源：代码扫描）

### `onChange?: (value: Date) => void` ✅

- **变更类型**：函数变更
- **影响版本**：5.1.0(18)
- **变更影响**：Callback<Date>
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:323`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:332`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:346`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:360`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:411`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:446`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:323` |
  | 5.1.0(18) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:332` |
  | 5.1.0(18) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:346` |
  | 5.1.0(18) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:360` |
  | 5.1.0(18) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:411` |
  | 5.1.0(18) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:446` |

  </details>

### `onStart(requestId: string, response: StartResponse): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：6.1.1(24)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corespeechkit-6111
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:266`（来源：代码扫描）

### `onStart(strategyName: string): Promise<void>` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：onStart(strategyName: string): Promise<void>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-screentimeguardkit-6001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:266`（来源：代码扫描）

### `onStop(requestId: string, response: StopResponse): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：6.1.1(24)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corespeechkit-6111
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:284`（来源：代码扫描）

### `onStop(strategyName: string): Promise<void>` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：onStop(strategyName: string): Promise<void>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-screentimeguardkit-6001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:284`（来源：代码扫描）

### `onStop?: OnStopFn` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：onStop?: OnStopFn;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-testkit-7001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:284`（来源：代码扫描）

### `selectedColor(value: ResourceColor): SliderAttribute` ⚠️[存疑]

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：5.1.0(18)
- **变更影响**：selectedColor(selectedColor: ResourceColor \| LinearGradient): SliderAttribute;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:444`（来源：代码扫描 ⚠️存疑）

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

### `space(space: LengthMetrics): DotIndicator` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：5.1.1(19)
- **变更影响**：space(space: LengthMetrics): DotIndicator;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:123`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:124`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:216`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:384`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:277`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:290`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:291`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:295`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:123` |
  | 5.1.1(19) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:124` |
  | 5.1.1(19) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:216` |
  | 5.1.1(19) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:384` |
  | 5.1.1(19) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:277` |
  | 5.1.1(19) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:290` |
  | 5.1.1(19) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:291` |
  | 5.1.1(19) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:295` |

  </details>

### `static create(blurRadius: number, x: number, y: number, color: common2D.Color | number): ShadowLayer` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72`（来源：代码扫描）

### `static create(blurRadius: number, x: number, y: number, color: common2D.Color): ShadowLayer` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：5.1.0(18)、6.0.0(20)
- **变更影响**：static create(blurRadius: number, x: number, y: number, color: common2D.Color \| number): ShadowLayer;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72` |
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72` |

  </details>

### `static create(encoding?: string): TextEncoder` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：401
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkts-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72`（来源：代码扫描）

### `static create(encoding?: string, options?: TextDecoderOptions): TextDecoder` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2
- **变更影响**：401
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkts-7001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72`（来源：代码扫描）

### `static create(options: AnimatorOptions): AnimatorResult` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：5.1.0(18)
- **变更影响**：18
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | API废弃版本变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72` |

  </details>

### `static create(strategy: PerfTestStrategy): PerfTest` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：static create(strategy: PerfTestStrategy): PerfTest;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-testkit-6001
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72`（来源：代码扫描）

### `static create<T>(): CustomEnvKey<T>` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：static create<T>(): CustomEnvKey<T>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72`（来源：代码扫描）

### `static create<T>(arrayLength: number, initialValue: T): Array<T>` ✅

- **变更类型**：删除错误码
- **影响版本**：26.0.0 Beta2、6.0.0(20)
- **变更影响**：10200011
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkts-6003
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 删除错误码 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72` |
  | 26.0.0 Beta2 | 错误码变更 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:72` |

  </details>

### `static measureText(options: MeasureOptions): number` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：5.1.0(18)
- **变更影响**：18
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:203`（来源：代码扫描）

### `stop(): Promise<boolean>` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：stop(): Promise<boolean>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkkit-5111
- **涉及代码位置**（共 3 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:129`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:358`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:368`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:129` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:358` |
  | 5.1.1(19) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:368` |

  </details>

### `stop(): Promise<void>` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：26.0.0 Beta2、5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 3 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:129`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:358`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:368`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:129` |
  | 5.1.1(19) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:358` |
  | 5.1.1(19) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:368` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:129` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:129` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:358` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:358` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:368` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:368` |

  </details>

### `stop(): void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2、6.0.0(20)、6.0.1(21)、6.1.0(23)、6.1.1(24)
- **变更影响**：stop(): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-distributedservicekit-6001
- **涉及代码位置**（共 3 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:129`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:358`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:368`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:129` |
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:129` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:358` |
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:358` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:368` |
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:368` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:129` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:358` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:368` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:129` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:358` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:368` |
  | 6.1.1(24) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:129` |
  | 6.1.1(24) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:358` |
  | 6.1.1(24) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:368` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:129` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:358` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:368` |

  </details>

### `stop(callback: AsyncCallback<void>): void` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：5.1.1(19)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-camerakit-5111
- **涉及代码位置**（共 3 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:129`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:358`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:368`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.1(19) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:129` |
  | 5.1.1(19) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:358` |
  | 5.1.1(19) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_5.1.1(19)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:368` |

  </details>

### `unbind(): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：unbind(): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145`（来源：代码扫描）

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

## 行为变更（按 API 分组，共 21 个 API；已过滤误报 0 条）

### `declare class CommonMethod<T>` ✅

- **变更类型**：接口定义变更
- **影响版本**：26.0.0(26)
- **变更影响**：ArkUI接口新增仅支持Stage模型的约束
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026010615012
- **涉及代码位置**（共 242 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:10`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:104`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:115`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:116`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:123`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:124`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:149`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:154`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:159`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:160`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:171`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:192`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:193`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:194`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:196`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:197`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:198`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:199`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:200`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:205`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:206`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:207`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:211`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:212`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:213`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:214`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:215`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:216`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:219`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:221`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:222`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:223`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:224`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:226`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:227`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:228`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:229`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:230`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:231`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:242`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:243`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:245`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:246`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:247`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:248`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:249`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:256`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:257`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:258`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:263`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:264`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:265`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:266`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:270`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:271`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:272`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:273`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:274`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:276`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:281`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:282`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:283`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:284`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:288`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:289`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:290`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:291`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:292`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:294`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:295`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:297`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:298`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:299`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:300`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:301`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:302`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:309`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:310`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:311`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:315`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:316`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:318`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:319`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:320`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:321`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:322`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:323`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:328`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:329`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:330`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:332`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:334`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:335`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:336`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:337`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:342`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:343`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:344`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:345`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:346`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:348`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:349`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:350`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:351`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:356`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:357`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:358`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:359`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:360`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:362`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:363`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:364`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:365`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:369`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:370`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:371`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:377`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:378`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:379`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:382`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:384`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:390`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:391`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:392`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:400`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:401`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:402`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:407`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:408`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:409`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:411`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:413`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:414`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:415`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:416`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:418`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:419`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:420`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:421`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:422`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:423`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:431`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:432`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:433`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:435`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:436`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:438`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:439`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:442`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:443`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:444`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:445`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:446`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:45`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:452`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:453`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:454`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:461`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:462`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:463`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:464`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:465`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:467`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:468`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:469`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:471`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:472`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:479`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:480`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:481`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:482`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:483`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:484`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:485`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:493`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:494`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:495`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:498`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:499`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:500`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:501`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:502`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:503`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:505`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:506`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:507`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:51`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:511`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:512`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:513`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:519`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:52`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:520`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:521`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:522`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:525`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:526`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:528`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:529`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:530`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:531`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:532`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:533`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:534`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:535`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:538`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:539`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:540`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:541`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:542`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:543`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:70`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:71`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:72`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:89`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:94`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:99`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:181`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:190`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:204`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:205`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:212`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:243`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:244`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:277`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:290`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:291`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:295`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:384`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:385`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:386`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:395`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:396`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:10` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:104` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:115` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:116` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:123` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:124` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:149` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:154` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:159` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:160` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:171` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:192` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:193` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:194` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:196` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:197` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:198` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:199` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:200` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:205` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:206` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:207` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:211` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:212` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:213` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:214` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:215` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:216` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:219` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:221` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:222` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:223` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:224` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:226` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:227` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:228` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:229` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:230` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:231` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:242` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:243` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:245` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:246` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:247` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:248` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:249` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:256` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:257` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:258` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:263` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:264` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:265` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:266` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:270` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:271` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:272` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:273` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:274` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:276` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:281` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:282` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:283` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:284` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:289` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:290` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:291` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:292` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:294` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:295` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:297` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:298` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:299` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:300` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:301` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:302` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:309` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:310` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:311` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:315` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:316` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:318` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:319` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:320` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:321` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:322` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:323` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:328` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:329` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:330` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:332` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:334` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:335` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:336` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:337` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:342` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:343` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:344` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:345` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:346` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:348` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:349` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:350` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:351` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:356` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:357` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:358` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:359` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:360` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:362` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:363` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:364` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:365` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:369` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:370` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:371` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:377` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:378` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:379` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:382` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:384` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:390` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:391` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:392` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:400` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:401` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:402` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:407` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:408` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:409` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:411` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:413` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:414` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:415` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:416` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:418` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:419` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:420` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:421` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:422` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:423` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:431` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:432` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:433` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:435` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:436` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:438` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:439` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:442` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:443` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:444` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:445` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:446` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:45` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:452` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:453` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:454` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:461` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:462` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:463` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:464` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:465` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:467` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:468` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:469` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:471` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:472` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:479` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:480` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:481` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:482` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:483` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:484` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:485` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:493` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:494` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:495` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:498` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:499` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:500` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:501` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:502` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:503` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:505` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:506` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:507` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:51` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:511` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:512` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:513` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:519` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:52` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:520` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:521` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:522` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:525` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:526` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:528` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:529` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:530` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:531` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:532` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:533` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:534` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:535` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:538` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:539` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:540` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:541` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:542` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:543` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:70` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:71` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:72` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:89` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:94` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:99` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:116` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:144` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:145` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:181` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:190` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:204` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:205` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:212` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:243` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:244` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:277` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:290` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:291` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:295` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:384` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:385` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:386` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:395` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:396` |

  </details>

### `declare const Button: ButtonInterface` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)、5.1.0(18)
- **变更影响**：按钮默认值变更为新增圆角矩形类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-510#ch174
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:261`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:268`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:279`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:286`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:477`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:496`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:261` |
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:268` |
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:279` |
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:286` |
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:477` |
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:496` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:261` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:261` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:268` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:268` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:279` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:279` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:286` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:286` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:477` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:477` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:496` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:496` |

  </details>

### `declare const Slider: SliderInterface` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)
- **变更影响**：内置文本的组件文本样式优化
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026032801249
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:441`（来源：代码扫描）

### `declare const Text: TextInterface` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)
- **变更影响**：Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026032761266
- **涉及代码位置**（共 18 处）：
  - `entry\src\main\ets\pages\Index.ets:191`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:204`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:255`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:308`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:314`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:327`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:341`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:355`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:368`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:389`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:406`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:430`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:434`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:460`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:466`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:492`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:510`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:518`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:191` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:204` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:255` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:308` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:314` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:327` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:341` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:355` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:368` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:389` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:406` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:430` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:434` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:460` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:466` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:492` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:510` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:518` |

  </details>

### `declare const Toggle: ToggleInterface` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)
- **变更影响**：表单类组件触摸热区最小高度变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026031846233
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\Index.ets:331`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:345`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:359`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:410`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:331` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:345` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:359` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:410` |

  </details>

### `declare type WithThemeInterface = (options: WithThemeOptions) => WithThemeAttribute` ✅

- **变更类型**：接口行为变更
- **影响版本**：26.0.0(26)
- **变更影响**：WithTheme相关组件行为变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026031417380
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 26.0.0(26) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0(26) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0(26) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 26.0.0(26) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 26.0.0(26) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

### `drawImage( image: ImageBitmap | PixelMap, sx: number, sy: number, sw: number, sh: number, dx: number, dy: number, dw: number, dh: number, ): void` ✅

- **变更类型**：接口行为变更
- **影响版本**：5.1.0(18)
- **变更影响**：CanvasRenderingContext2D的drawImage接口默认单位变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-510#ch155
- **涉及代码位置**（共 4 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:284`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:286`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:293`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:295`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:284` |
  | 5.1.0(18) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:286` |
  | 5.1.0(18) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:293` |
  | 5.1.0(18) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:295` |

  </details>

### `fillText(text: string, x: number, y: number, maxWidth?: number): void` ✅

- **变更类型**：接口行为变更
- **影响版本**：5.0.1(13)
- **变更影响**：画布组件在绘制文本时设置globalCompositeOperation、fillStyle和globalAlpha属性的效果变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/changelogs-ux-b112#canvasrenderingcontext2d%E5%92%8Coffscreencanvasrenderingcontext2d%E7%9A%84globalcompositeoperation%E5%B1%9E%E6%80%A7%E5%8F%98%E6%9B%B4%E4%B8%BA%E5%9C%A8%E7%BB%98%E5%88%B6%E6%96%87%E6%9C%AC%E6%97%B6%E7%94%9F%E6%95%88
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:246`（来源：代码扫描）

### `font: string` ✅

- **变更类型**：接口行为变更
- **影响版本**：6.0.0(20)
- **变更影响**：CanvasRenderer的font接口支持自定义字体行为变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#chCH2025062517095
- **涉及代码位置**（共 2 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:198`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:242`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:198` |
  | 6.0.0(20) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:242` |

  </details>

### `fontWeight(value: number | FontWeight | string): TextAttribute` ⚠️[存疑]

- **变更类型**：接口定义变更
- **影响版本**：6.0.0(20)
- **变更影响**：文本与输入、信息展示、按钮与选择、滚动与滑动、图形绘制组件接口支持Resource类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#ch383
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:193`（来源：代码扫描 ⚠️存疑）

### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute` ⚠️[存疑]

- **变更类型**：接口定义变更
- **影响版本**：6.0.0(20)
- **变更影响**：文本与输入、信息展示、按钮与选择、滚动与滑动、图形绘制组件接口支持Resource类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#ch383
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:193`（来源：代码扫描 ⚠️存疑）

### `off(type: 'availableDeviceChange', callback?: Callback<DeviceChangeAction>): void` ✅

- **变更类型**：接口行为变更
- **影响版本**：5.1.0(18)
- **变更影响**：音频框架识别USB音频设备类型行为变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-510#chCH2025041189292
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:135`（来源：代码扫描）

### `on(type: 'availableDeviceChange', deviceUsage: DeviceUsage, callback: Callback<DeviceChangeAction>): void` ✅

- **变更类型**：接口行为变更
- **影响版本**：5.1.0(18)
- **变更影响**：音频框架识别USB音频设备类型行为变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-510#chCH2025041189292
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'error', callback: ErrorCallback): void` ✅

- **变更类型**：接口行为变更
- **影响版本**：5.0.2(14)
- **变更影响**：AVErrorCode枚举值变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/changelogs-for-all-apps-b123sp16#averrorcode%E6%9E%9A%E4%B8%BE%E5%80%BC%E5%8F%98%E6%9B%B4
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'screenshot', callback: Callback<void>): void` ✅

- **变更类型**：接口行为变更
- **影响版本**：5.0.3(15)
- **变更影响**：系统录屏应用调用的截屏接口变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-503#ch309
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `on(type: 'windowStatusChange', callback: Callback<WindowStatusType>): void` ✅

- **变更类型**：接口行为变更
- **影响版本**：5.0.2(14)
- **变更影响**：在PC/2in1设备上getWindowStatus和on('windowStatusChange')接口在窗口最大化状态返回值变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/changelogs-for-all-apps-b123sp16#%E5%9C%A82in1%E8%AE%BE%E5%A4%87%E4%B8%8Agetwindowstatus%E5%92%8Conwindowstatuschange%E6%8E%A5%E5%8F%A3%E5%9C%A8%E7%AA%97%E5%8F%A3%E6%9C%80%E5%A4%A7%E5%8C%96%E7%8A%B6%E6%80%81%E8%BF%94%E5%9B%9E%E5%80%BC%E5%8F%98%E6%9B%B4
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:97`（来源：代码扫描）

### `start(): void` ✅

- **变更类型**：接口行为变更
- **影响版本**：6.0.0(20)
- **变更影响**：@ohos.useriam.userAuth限制应用从后台发起带交互界面的身份认证变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#ch390
- **涉及代码位置**（共 2 处）：
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:341`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:348`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:341` |
  | 6.0.0(20) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:348` |

  </details>

### `text?: LocationDescription` ✅

- **变更类型**：接口废弃变更
- **影响版本**：6.0.0(20)
- **变更影响**：位置控件功能变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#chCH2025051227329
- **涉及代码位置**（共 7 处）：
  - `entry\src\main\ets\pages\Index.ets:110`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:140`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:143`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:210`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:317`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:199`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:246`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:110` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:140` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:143` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:210` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:317` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:199` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:246` |

  </details>

### `text?: PasteDescription` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)
- **变更影响**：内置文本的组件文本样式优化
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026032801249
- **涉及代码位置**（共 7 处）：
  - `entry\src\main\ets\pages\Index.ets:110`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:140`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:143`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:210`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:317`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:199`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:246`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:110` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:140` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:143` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:210` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:317` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:199` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:246` |

  </details>

### `text?: SaveDescription` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)
- **变更影响**：内置文本的组件文本样式优化
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026032801249
- **涉及代码位置**（共 7 处）：
  - `entry\src\main\ets\pages\Index.ets:110`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:140`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:143`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:210`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:317`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:199`（来源：代码扫描）
  - `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:246`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:110` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:140` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:143` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:210` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:317` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:199` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\marquee\MarqueeTextView.ets:246` |

  </details>

### `type LocationButtonCallback = (event: ClickEvent, result: LocationButtonOnClickResult, error?: BusinessError<void>) => void` ✅

- **变更类型**：接口废弃变更
- **影响版本**：6.0.0(20)
- **变更影响**：位置控件功能变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#chCH2025051227329
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\pages\Index.ets:262`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:287`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:478`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:497`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:262` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:287` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:478` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:497` |

  </details>

---
*本文档由 hoscanner（HarmonyOS 升级 API 变更扫描工具）自动生成。*