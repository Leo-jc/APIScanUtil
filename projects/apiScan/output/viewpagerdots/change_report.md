# HarmonyOS 三方库升级 — 系统 API 变更与行为变更清单

生成时间：2026-08-17 17:07:08

## 升级窗口

- **源 API 版本**：12
- **目标 API 版本**：26
- **统计区间**：(12, 26]

## 汇总

- 使用的系统 API 数：**10**
- 系统 API 变更条目：**202**（按 API 分组：**44** 个）
- 行为变更条目：**201**（按 API 分组：**13** 个）
- 变更条目合计：**403**
- 审查结论（确定性启发式审查）：真实 **395** / 误报 **0** / 存疑 **8**（误报条目已从下方清单过滤，存疑条目标注保留）

> 下方按 API 分组列出，每组给出变更类型 / 影响版本 / 变更影响 / 变更证据 URL 及全部涉及代码位置。同一 API 的多个调用位置聚拢展示，便于逐接口核对。

## 系统 API 变更（按 API 分组，共 44 个 API；已过滤误报 0 条）

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
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\Index.ets:120`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:163`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:296`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:313`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:120` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:163` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:296` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:313` |

  </details>

### `backgroundColor(color: Optional<ResourceColor>): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.0(20)
- **变更影响**：backgroundColor(color: Optional<ResourceColor \| ColorMetrics>): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\Index.ets:120`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:163`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:296`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:313`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:120` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:163` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:296` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:313` |

  </details>

### `backgroundColor(value: ResourceColor): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围不是包含关系
- **影响版本**：5.1.0(18)
- **变更影响**：backgroundColor(color: Optional<ResourceColor>): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\Index.ets:120`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:163`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:296`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:313`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:120` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:163` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:296` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:313` |

  </details>

### `controller: functionalInputComponentManager.FunctionalInputController` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：controller: functionalInputComponentManager.FunctionalInputController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-scenariofusionkit-510
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:103`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:175`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:185`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:195`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:210`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:271`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:288`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:63`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:103` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:175` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:185` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:195` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:210` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:271` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:63` |

  </details>

### `controller: loginComponentManager.LoginPanelController` ✅

- **变更类型**：新增装饰器
- **影响版本**：26.0.0 Beta2
- **变更影响**：Require
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-accountkit-7001
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:103`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:175`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:185`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:195`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:210`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:271`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:288`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:63`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:103` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:175` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:185` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:195` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:210` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:271` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:63` |

  </details>

### `controller: loginComponentManager.LoginWithHuaweiIDButtonController` ✅

- **变更类型**：新增装饰器
- **影响版本**：26.0.0 Beta2
- **变更影响**：Require
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-accountkit-7001
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:103`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:175`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:185`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:195`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:210`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:271`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:288`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:63`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:103` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:175` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:185` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:195` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:210` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:271` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 26.0.0 Beta2 | 新增装饰器 | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:63` |

  </details>

### `controller: readerCore.ReaderComponentController` ✅

- **变更类型**：新增API
- **影响版本**：5.0.4(16)
- **变更影响**：controller: readerCore.ReaderComponentController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-readerkit-504
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:103`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:175`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:185`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:195`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:210`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:271`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:288`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:63`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:103` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:175` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:185` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:195` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:210` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:271` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:63` |

  </details>

### `controller?: FunctionController` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.0.1(21)
- **变更影响**：controller?: FunctionController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-agentframeworkkit-6003
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:103`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:175`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:185`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:195`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:210`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:271`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:288`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:63`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:103` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:175` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:185` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:195` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:210` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:271` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:63` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:103` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:175` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:185` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:195` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:210` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:271` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 6.0.1(21) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:63` |

  </details>

### `controller?: HdsTabsController` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：controller?: HdsTabsController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6001
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:103`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:175`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:185`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:195`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:210`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:271`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:288`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:63`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:103` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:175` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:185` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:195` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:210` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:271` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:63` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:103` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:175` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:185` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:195` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:210` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:271` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:63` |

  </details>

### `controller?: SearchController` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：controller?: SearchController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:103`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:175`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:185`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:195`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:210`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:271`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:288`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:63`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:103` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:175` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:185` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:195` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:210` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:271` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:63` |

  </details>

### `controller?: ShaderEffectController` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.1.0(23)
- **变更影响**：controller?: ShaderEffectController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-uidesignkit-6001
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:103`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:175`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:185`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:195`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:210`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:271`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:288`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:63`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:103` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:175` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:185` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:195` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:210` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:271` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:63` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:103` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:175` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:185` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:195` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:210` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:271` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:63` |

  </details>

### `controller?: TabsController` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：controller?: TabsController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:103`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:175`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:185`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:195`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:210`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:271`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:288`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:63`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:103` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:175` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:185` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:195` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:210` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:271` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:63` |

  </details>

### `controller?: TextClockController` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：controller?: TextClockController;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 8 处）：
  - `entry\src\main\ets\pages\Index.ets:103`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:175`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:185`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:195`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:210`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:271`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:288`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:63`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:103` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:175` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:185` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:195` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:210` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:271` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:63` |

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

### `fillColor(color: ResourceColor | ColorContent): ImageAttribute` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)、6.0.0(20)
- **变更影响**：fillColor(color: ResourceColor \| ColorContent): ImageAttribute;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5032
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:324`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta2.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:324` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:324` |

  </details>

### `fontWeight(value: number | FontWeight | string): T` ✅

- **变更类型**：函数变更
- **影响版本**：6.0.0(20)
- **变更影响**：value: number \| FontWeight \| string \| Resource
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:113`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:132`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:113` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:132` |

  </details>

### `fontWeight(value: number | FontWeight | string): TextAttribute` ⚠️[存疑]

- **变更类型**：函数变更
- **影响版本**：6.0.0(20)
- **变更影响**：value: number \| FontWeight \| ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:113`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:132`（来源：代码扫描 ⚠️存疑）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:113` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:132` |

  </details>

### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute` ⚠️[存疑]

- **变更类型**：函数变更
- **影响版本**：6.0.0(20)
- **变更影响**：weight: number \| FontWeight \| ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:113`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:132`（来源：代码扫描 ⚠️存疑）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:113` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:132` |

  </details>

### `fontWeight: number` ✅

- **变更类型**：新增API
- **影响版本**：5.0.4(16)
- **变更影响**：fontWeight: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-readerkit-504
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:113`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:132`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:113` |
  | 5.0.4(16) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.4(16).json` | `entry\src\main\ets\pages\Index.ets:132` |

  </details>

### `fontWeight?: FontWeight` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：6.0.2(22)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6021
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:113`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:132`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:113` |
  | 6.0.2(22) | API从不支持元服务到支持元服务 | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\pages\Index.ets:132` |

  </details>

### `fontWeight?: number | FontWeight | string` ✅

- **变更类型**：属性变更
- **影响版本**：6.0.0(20)
- **变更影响**：number,FontWeight,ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:113`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:132`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 属性变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:113` |
  | 6.0.0(20) | 属性变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:132` |

  </details>

### `indicator(value: IndicatorStyle): SubTabBarStyle` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.2(22)
- **变更影响**：indicator(value: IndicatorStyle \| DrawableTabBarIndicator): SubTabBarStyle;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:142`（来源：代码扫描）

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
  - `entry\src\main\ets\pages\Index.ets:115`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:115` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:115` |

  </details>

### `onChange?: (value: Date) => void` ✅

- **变更类型**：函数变更
- **影响版本**：5.1.0(18)
- **变更影响**：Callback<Date>
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:145`（来源：代码扫描）

### `opacity(value: number | Resource): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围不是包含关系
- **影响版本**：5.1.0(18)
- **变更影响**：opacity(opacity: Optional<number \| Resource>): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 3 处）：
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:329`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:345`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:362`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:329` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:345` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:362` |

  </details>

### `readonly orientation?: Orientation` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：readonly orientation?: Orientation;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imagekit-7001
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\pages\Index.ets:156`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:219`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:221`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:284`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:174`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:156` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:219` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:221` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `entry\src\main\ets\pages\Index.ets:284` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:174` |

  </details>

### `scale(sx: number, sy: number): void` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6003
- **涉及代码位置**（共 3 处）：
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:325`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:341`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:358`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:325` |
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:341` |
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:358` |

  </details>

### `scale(sx?: number, sy?: number): Matrix2D` ✅

- **变更类型**：API模型切换
- **影响版本**：6.1.0(23)
- **变更影响**：famodelonly
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6101
- **涉及代码位置**（共 3 处）：
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:325`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:341`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:358`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:325` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:341` |
  | 6.1.0(23) | API模型切换 | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:358` |

  </details>

### `scale(value: ScaleOptions): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围不是包含关系
- **影响版本**：5.1.0(18)
- **变更影响**：scale(options: Optional<ScaleOptions>): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 3 处）：
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:325`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:341`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:358`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:325` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:341` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:358` |

  </details>

### `scale(value: { x?: number; y?: number; z?: number; centerX?: number | string; centerY?: number | string; }): T` ✅

- **变更类型**：函数变更
- **影响版本**：5.1.0(18)
- **变更影响**：value: ScaleOptions
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 3 处）：
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:325`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:341`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:358`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:325` |
  | 5.1.0(18) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:341` |
  | 5.1.0(18) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:358` |

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

### `textOverflow(value: { overflow: TextOverflow; }): TextAttribute` ✅

- **变更类型**：函数变更
- **影响版本**：5.1.0(18)
- **变更影响**：options: TextOverflowOptions
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:116`（来源：代码扫描）

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

## 行为变更（按 API 分组，共 13 个 API；已过滤误报 0 条）

### `declare class CommonMethod<T>` ✅

- **变更类型**：接口定义变更
- **影响版本**：26.0.0(26)
- **变更影响**：ArkUI接口新增仅支持Stage模型的约束
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026010615012
- **涉及代码位置**（共 148 处）：
  - `entry\src\main\ets\entryability\EntryAbility.ets:10`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:103`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:112`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:113`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:114`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:115`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:116`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:118`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:119`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:120`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:121`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:122`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:130`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:131`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:132`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:134`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:135`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:136`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:137`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:140`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:141`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:142`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:143`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:144`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:145`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:150`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:159`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:160`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:162`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:163`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:169`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:170`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:171`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:172`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:173`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:175`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:179`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:180`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:181`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:182`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:183`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:185`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:189`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:190`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:191`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:192`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:193`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:195`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:199`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:200`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:204`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:205`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:206`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:207`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:208`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:210`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:214`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:215`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:216`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:217`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:218`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:225`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:226`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:227`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:228`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:229`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:243`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:244`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:248`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:249`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:250`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:251`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:252`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:266`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:267`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:268`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:269`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:270`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:271`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:275`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:276`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:277`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:278`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:279`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:280`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:288`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:292`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:294`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:295`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:296`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:303`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:304`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:305`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:306`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:309`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:311`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:312`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:313`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:314`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:316`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:317`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:63`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:180`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:181`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:182`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:183`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:184`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:191`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:192`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:193`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:194`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:201`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:202`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:203`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:204`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:205`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:212`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:213`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:214`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:215`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:321`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:322`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:323`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:324`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:325`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:329`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:330`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:332`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:333`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:334`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:338`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:339`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:340`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:341`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:345`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:346`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:348`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:349`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:350`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:355`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:356`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:357`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:358`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:362`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:363`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:365`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:366`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:367`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:10` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:103` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:112` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:113` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:114` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:115` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:116` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:118` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:119` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:120` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:121` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:122` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:130` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:131` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:132` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:134` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:135` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:136` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:137` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:140` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:141` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:142` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:143` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:144` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:145` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:150` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:159` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:160` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:162` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:163` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:169` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:170` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:171` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:172` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:173` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:175` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:179` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:180` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:181` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:182` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:183` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:185` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:189` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:190` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:191` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:192` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:193` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:195` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:199` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:200` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:204` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:205` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:206` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:207` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:208` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:210` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:214` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:215` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:216` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:217` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:218` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:225` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:226` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:227` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:228` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:229` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:243` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:244` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:248` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:249` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:250` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:251` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:252` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:266` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:267` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:268` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:269` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:270` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:271` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:275` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:276` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:277` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:278` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:279` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:280` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:288` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:292` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:294` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:295` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:296` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:303` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:304` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:305` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:306` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:309` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:311` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:312` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:313` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:314` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:316` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:317` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:63` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:180` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:181` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:182` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:183` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:184` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:191` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:192` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:193` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:194` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:201` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:202` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:203` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:204` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:205` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:212` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:213` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:214` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:215` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:321` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:322` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:323` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:324` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:325` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:329` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:330` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:332` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:333` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:334` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:338` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:339` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:340` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:341` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:345` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:346` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:348` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:349` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:350` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:355` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:356` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:357` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:358` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:362` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:363` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:365` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:366` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:367` |

  </details>

### `declare const Button: ButtonInterface` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)、5.1.0(18)
- **变更影响**：按钮默认值变更为新增圆角矩形类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-510#ch174
- **涉及代码位置**（共 9 处）：
  - `entry\src\main\ets\pages\Index.ets:168`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:178`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:188`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:203`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:213`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:224`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:247`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:265`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:274`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:168` |
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:178` |
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:188` |
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:203` |
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:213` |
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:224` |
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:247` |
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:265` |
  | 5.1.0(18) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `entry\src\main\ets\pages\Index.ets:274` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:168` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:168` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:178` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:178` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:188` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:188` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:203` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:203` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:213` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:213` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:224` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:224` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:247` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:247` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:265` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:265` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:274` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:274` |

  </details>

### `declare const Text: TextInterface` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)
- **变更影响**：Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026032761266
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\pages\Index.ets:111`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:129`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:302`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:111` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:129` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:302` |

  </details>

### `declare interface AnimateParam` ✅

- **变更类型**：UX交互行为变更
- **影响版本**：5.0.1(13)
- **变更影响**：属性动画onFinish结束回调在UIAbility退后台时因有限循环动画被终止而提前触发
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/changelogs-ux-b106#%E5%B1%9E%E6%80%A7%E5%8A%A8%E7%94%BBonfinish%E7%BB%93%E6%9D%9F%E5%9B%9E%E8%B0%83%E5%9C%A8uiability%E9%80%80%E5%90%8E%E5%8F%B0%E6%97%B6%E5%9B%A0%E6%9C%89%E9%99%90%E5%BE%AA%E7%8E%AF%E5%8A%A8%E7%94%BB%E8%A2%AB%E7%BB%88%E6%AD%A2%E8%80%8C%E6%8F%90%E5%89%8D%E8%A7%A6%E5%8F%91
- **涉及代码位置**（共 3 处）：
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:330`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:346`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:363`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.1(13) | UX交互行为变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:330` |
  | 5.0.1(13) | UX交互行为变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:346` |
  | 5.0.1(13) | UX交互行为变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.1(13)_Beta3.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:363` |

  </details>

### `fontWeight(value: number | FontWeight | string): TextAttribute` ⚠️[存疑]

- **变更类型**：接口定义变更
- **影响版本**：6.0.0(20)
- **变更影响**：文本与输入、信息展示、按钮与选择、滚动与滑动、图形绘制组件接口支持Resource类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#ch383
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:113`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:132`（来源：代码扫描 ⚠️存疑）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:113` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:132` |

  </details>

### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute` ⚠️[存疑]

- **变更类型**：接口定义变更
- **影响版本**：6.0.0(20)
- **变更影响**：文本与输入、信息展示、按钮与选择、滚动与滑动、图形绘制组件接口支持Resource类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#ch383
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:113`（来源：代码扫描 ⚠️存疑）
  - `entry\src\main\ets\pages\Index.ets:132`（来源：代码扫描 ⚠️存疑）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:113` |
  | 6.0.0(20) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:132` |

  </details>

### `height?: string | number` ✅

- **变更类型**：接口定义变更
- **影响版本**：6.0.0(20)
- **变更影响**：文本与输入、信息展示、按钮与选择、滚动与滑动、图形绘制组件接口支持Resource类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#ch383
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:354`（来源：代码扫描）

### `orientation: Orientation` ✅

- **变更类型**：接口行为变更
- **影响版本**：5.0.2(14)
- **变更影响**：屏幕Display对象rotation和orientation属性变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/changelogs-for-all-apps-b123sp16#%E5%B1%8F%E5%B9%95display%E5%AF%B9%E8%B1%A1rotation%E5%92%8Corientation%E5%B1%9E%E6%80%A7%E5%8F%98%E6%9B%B4
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\pages\Index.ets:156`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:219`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:221`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:284`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:174`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.2(14) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:156` |
  | 5.0.2(14) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:219` |
  | 5.0.2(14) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:221` |
  | 5.0.2(14) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:284` |
  | 5.0.2(14) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_5.0.2(14)_Beta1.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:174` |

  </details>

### `scale(x: number, y: number): void` ✅

- **变更类型**：接口行为变更
- **影响版本**：5.1.0(18)
- **变更影响**：CanvasRenderingContext2D方法传NaN和Infinity值后执行的其他绘制方法由不绘制变更为正常绘制
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-510#ch159
- **涉及代码位置**（共 3 处）：
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:325`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:341`（来源：代码扫描）
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:358`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:325` |
  | 5.1.0(18) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:341` |
  | 5.1.0(18) | 接口行为变更 | `harmonyos_behavior_changes/HarmonyOS_5.1.0(18)_Release.json` | `ohos_library\src\main\ets\components\DotsIndicator.ets:358` |

  </details>

### `text?: LocationDescription` ✅

- **变更类型**：接口废弃变更
- **影响版本**：6.0.0(20)
- **变更影响**：位置控件功能变更
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#chCH2025051227329
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:30`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:302`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:30` |
  | 6.0.0(20) | 接口废弃变更 | `harmonyos_behavior_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:302` |

  </details>

### `text?: PasteDescription` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)
- **变更影响**：内置文本的组件文本样式优化
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026032801249
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:30`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:302`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:30` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:302` |

  </details>

### `text?: SaveDescription` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)
- **变更影响**：内置文本的组件文本样式优化
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026032801249
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:30`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:302`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:30` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:302` |

  </details>

### `width?: string | number` ✅

- **变更类型**：接口定义变更
- **影响版本**：6.0.0(20)
- **变更影响**：文本与输入、信息展示、按钮与选择、滚动与滑动、图形绘制组件接口支持Resource类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#ch383
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\components\DotsIndicator.ets:354`（来源：代码扫描）

---
*本文档由 hoscanner（HarmonyOS 升级 API 变更扫描工具）自动生成。*