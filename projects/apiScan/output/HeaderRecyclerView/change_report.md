# HarmonyOS 三方库升级 — 系统 API 变更与行为变更清单

生成时间：2026-08-17 17:06:49

## 升级窗口

- **源 API 版本**：12
- **目标 API 版本**：26
- **统计区间**：(12, 26]

## 汇总

- 使用的系统 API 数：**10**
- 系统 API 变更条目：**158**（按 API 分组：**61** 个）
- 行为变更条目：**85**（按 API 分组：**5** 个）
- 变更条目合计：**243**
- 审查结论（确定性启发式审查）：真实 **238** / 误报 **0** / 存疑 **5**（误报条目已从下方清单过滤，存疑条目标注保留）

> 下方按 API 分组列出，每组给出变更类型 / 影响版本 / 变更影响 / 变更证据 URL 及全部涉及代码位置。同一 API 的多个调用位置聚拢展示，便于逐接口核对。

## 系统 API 变更（按 API 分组，共 61 个 API；已过滤误报 0 条）

### `Error` ✅

- **变更类型**：枚举赋值发生改变
- **影响版本**：26.0.0 Beta2
- **变更影响**：4
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkweb-7002
- **涉及代码位置**（共 1 处）：
  - `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:196`（来源：代码扫描）

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

### `align(alignType: Alignment): T` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：align(alignType: Alignment): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5031
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\components\CharacterCard.ets:73`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:87`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:73` |
  | 5.0.3(15) | 新增API | `harmonyos_api_changes/HarmonyOS_5.0.3(15)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:87` |

  </details>

### `align(value: Alignment): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.0(20)
- **变更影响**：align(alignment: Alignment \| LocalizedAlignment): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\components\CharacterCard.ets:73`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:87`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:73` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:87` |

  </details>

### `backgroundColor(color: Optional<ResourceColor>): ArcDotIndicator` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：backgroundColor(color: Optional<ResourceColor>): ArcDotIndicator;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\components\CharacterCard.ets:57`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:196`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:241`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:249`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\components\CharacterCard.ets:57` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:196` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:241` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:249` |

  </details>

### `backgroundColor(color: Optional<ResourceColor>): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.0(20)
- **变更影响**：backgroundColor(color: Optional<ResourceColor \| ColorMetrics>): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\components\CharacterCard.ets:57`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:196`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:241`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:249`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\components\CharacterCard.ets:57` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:196` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:241` |
  | 6.0.0(20) | 类新增同名方法且参数类型与已有的参数类型范围是包含关系 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:249` |

  </details>

### `backgroundColor(value: ResourceColor): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围不是包含关系
- **影响版本**：5.1.0(18)
- **变更影响**：backgroundColor(color: Optional<ResourceColor>): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\components\CharacterCard.ets:57`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:196`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:241`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:249`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\components\CharacterCard.ets:57` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:196` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:241` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:249` |

  </details>

### `borderRadius(radius: Dimension | BorderRadiuses): T` ✅

- **变更类型**：新增API
- **影响版本**：5.0.3(15)
- **变更影响**：borderRadius(radius: Dimension \| BorderRadiuses): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5031
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\components\HeaderBanner.ets:70`（来源：代码扫描）

### `borderRadius(value: Length | BorderRadiuses | LocalizedBorderRadiuses): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.2(22)
- **变更影响**：borderRadius(value: Length \| BorderRadiuses \| LocalizedBorderRadiuses, type?: RenderStrategy): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\components\HeaderBanner.ets:70`（来源：代码扫描）

### `borderRadius: number` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：borderRadius: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-formkit-6001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\components\HeaderBanner.ets:70`（来源：代码扫描）

### `borderRadius?: Length` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：borderRadius?: Length;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\components\HeaderBanner.ets:70`（来源：代码扫描）

### `borderRadius?: LengthMetrics` ✅

- **变更类型**：接口新增可选属性
- **影响版本**：26.0.0 Beta2、5.1.0(18)
- **变更影响**：borderRadius?: LengthMetrics;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\components\HeaderBanner.ets:70`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 接口新增可选属性 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\components\HeaderBanner.ets:70` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\components\HeaderBanner.ets:70` |

  </details>

### `borderRadius?: LengthMetrics | BorderRadiuses | LocalizedBorderRadiuses` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)、6.0.2(22)
- **变更影响**：borderRadius?: LengthMetrics \| BorderRadiuses \| LocalizedBorderRadiuses;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\components\HeaderBanner.ets:70`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\components\HeaderBanner.ets:70` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\components\HeaderBanner.ets:70` |

  </details>

### `characters(content: string): void` ✅

- **变更类型**：新增API
- **影响版本**：6.1.1(24)
- **变更影响**：characters(content: string): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkts-6112
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\model\DragonBallHeader.ets:27`（来源：代码扫描）
  - `entry\src\main\ets\model\DragonBallHeader.ets:31`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Release.json` | `entry\src\main\ets\model\DragonBallHeader.ets:27` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Release.json` | `entry\src\main\ets\model\DragonBallHeader.ets:31` |

  </details>

### `clip(value: boolean | CircleAttribute | EllipseAttribute | PathAttribute | RectAttribute): T` ✅

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围不是包含关系
- **影响版本**：5.1.0(18)
- **变更影响**：clip(clip: Optional<boolean>): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 3 处）：
  - `entry\src\main\ets\components\CharacterCard.ets:95`（来源：代码扫描）
  - `entry\src\main\ets\components\HeaderBanner.ets:71`（来源：代码扫描）
  - `entry\src\main\ets\components\HeaderBanner.ets:78`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\components\CharacterCard.ets:95` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\components\HeaderBanner.ets:71` |
  | 5.1.0(18) | 类新增同名方法且参数类型与已有的参数类型范围不是包含关系 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\components\HeaderBanner.ets:78` |

  </details>

### `columnsGap(value: LengthMetrics | undefined): T` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：columnsGap(value: LengthMetrics \| undefined): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:237`（来源：代码扫描）

### `columnsGap(value: LengthMetrics): T` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：columnsGap(value: LengthMetrics): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:237`（来源：代码扫描）

### `columnsTemplate(value: string): GridAttribute` ⚠️[存疑]

- **变更类型**：类新增同名方法且参数类型与已有的参数类型范围是包含关系
- **影响版本**：6.0.2(22)
- **变更影响**：columnsTemplate(value: string \| ItemFillPolicy): GridAttribute;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6021
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:236`（来源：代码扫描 ⚠️存疑）

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
- **涉及代码位置**（共 14 处）：
  - `entry\src\main\ets\data\DragonBallDataSource.ets:36`（来源：代码扫描）
  - `entry\src\main\ets\data\DragonBallDataSource.ets:40`（来源：代码扫描）
  - `entry\src\main\ets\data\DragonBallDataSource.ets:44`（来源：代码扫描）
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
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\data\DragonBallDataSource.ets:36` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\data\DragonBallDataSource.ets:40` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\data\DragonBallDataSource.ets:44` |
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
- **涉及代码位置**（共 14 处）：
  - `entry\src\main\ets\data\DragonBallDataSource.ets:36`（来源：代码扫描）
  - `entry\src\main\ets\data\DragonBallDataSource.ets:40`（来源：代码扫描）
  - `entry\src\main\ets\data\DragonBallDataSource.ets:44`（来源：代码扫描）
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
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\data\DragonBallDataSource.ets:36` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\data\DragonBallDataSource.ets:40` |
  | 6.0.1(21) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.1(21)_Beta1.json` | `entry\src\main\ets\data\DragonBallDataSource.ets:44` |
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
  - `entry\src\main\ets\pages\Index.ets:182`（来源：代码扫描）

### `fontWeight(value: number | FontWeight | string): TextAttribute` ⚠️[存疑]

- **变更类型**：函数变更
- **影响版本**：6.0.0(20)
- **变更影响**：value: number \| FontWeight \| ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:182`（来源：代码扫描 ⚠️存疑）

### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute` ⚠️[存疑]

- **变更类型**：函数变更
- **影响版本**：6.0.0(20)
- **变更影响**：weight: number \| FontWeight \| ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:182`（来源：代码扫描 ⚠️存疑）

### `fontWeight: number` ✅

- **变更类型**：新增API
- **影响版本**：5.0.4(16)
- **变更影响**：fontWeight: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-readerkit-504
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:182`（来源：代码扫描）

### `fontWeight?: FontWeight` ✅

- **变更类型**：API从不支持元服务到支持元服务
- **影响版本**：6.0.2(22)
- **变更影响**：atomicservice
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6021
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:182`（来源：代码扫描）

### `fontWeight?: number | FontWeight | string` ✅

- **变更类型**：属性变更
- **影响版本**：6.0.0(20)
- **变更影响**：number,FontWeight,ResourceStr
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:182`（来源：代码扫描）

### `footer(builder: CustomBuilder | undefined): T` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：footer(builder: CustomBuilder \| undefined): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 6 处）：
  - `entry\src\main\ets\components\FooterLoading.ets:38`（来源：代码扫描）
  - `entry\src\main\ets\components\FooterLoading.ets:54`（来源：代码扫描）
  - `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:163`（来源：代码扫描）
  - `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:186`（来源：代码扫描）
  - `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:258`（来源：代码扫描）
  - `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:97`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\components\FooterLoading.ets:38` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\components\FooterLoading.ets:54` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:163` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:186` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:258` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:97` |

  </details>

### `header(builder: CustomBuilder | undefined): T` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：header(builder: CustomBuilder \| undefined): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7002
- **涉及代码位置**（共 7 处）：
  - `entry\src\main\ets\components\HeaderBanner.ets:50`（来源：代码扫描）
  - `entry\src\main\ets\components\HeaderBanner.ets:66`（来源：代码扫描）
  - `entry\src\main\ets\components\HeaderBanner.ets:73`（来源：代码扫描）
  - `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:158`（来源：代码扫描）
  - `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:181`（来源：代码扫描）
  - `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:253`（来源：代码扫描）
  - `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:95`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\components\HeaderBanner.ets:50` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\components\HeaderBanner.ets:66` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\components\HeaderBanner.ets:73` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:158` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:181` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:253` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:95` |

  </details>

### `header: Object` ✅

- **变更类型**：新增API
- **影响版本**：6.0.2(22)
- **变更影响**：header: Object;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-networkkit-6021
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\components\HeaderBanner.ets:66`（来源：代码扫描）
  - `entry\src\main\ets\components\HeaderBanner.ets:73`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\components\HeaderBanner.ets:66` |
  | 6.0.2(22) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.2(22).json` | `entry\src\main\ets\components\HeaderBanner.ets:73` |

  </details>

### `header?: ComponentContent` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：header?: ComponentContent;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\components\HeaderBanner.ets:66`（来源：代码扫描）
  - `entry\src\main\ets\components\HeaderBanner.ets:73`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\components\HeaderBanner.ets:66` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\components\HeaderBanner.ets:73` |

  </details>

### `header?: Record<string, string>` ✅

- **变更类型**：新增API
- **影响版本**：5.1.0(18)
- **变更影响**：header?: Record<string, string>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mediakit-510
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\components\HeaderBanner.ets:66`（来源：代码扫描）
  - `entry\src\main\ets\components\HeaderBanner.ets:73`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\components\HeaderBanner.ets:66` |
  | 5.1.0(18) | 新增API | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\components\HeaderBanner.ets:73` |

  </details>

### `indexes: Array<string>` ✅

- **变更类型**：删除API
- **影响版本**：6.1.0(23)
- **变更影响**：indexes: Array<string>;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkdata-6101
- **涉及代码位置**（共 2 处）：
  - `ohos_library\src\main\ets\HeaderSpanSizeLookup.ets:74`（来源：代码扫描）
  - `ohos_library\src\main\ets\HeaderSpanSizeLookup.ets:77`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 删除API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\HeaderSpanSizeLookup.ets:74` |
  | 6.1.0(23) | 删除API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `ohos_library\src\main\ets\HeaderSpanSizeLookup.ets:77` |

  </details>

### `level: AntiAliasingLevel` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：level: AntiAliasingLevel;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-imagekit-7002
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\components\CharacterCard.ets:83`（来源：代码扫描）

### `level: number` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)、6.1.1(24)
- **变更影响**：level: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-weatherservicekit-6101
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\components\CharacterCard.ets:83`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.1.0(23) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.0(23)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:83` |
  | 6.1.1(24) | 新增API | `harmonyos_api_changes/HarmonyOS_6.1.1(24)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:83` |

  </details>

### `level?: notification.SlotLevel` ✅

- **变更类型**：API废弃版本变更
- **影响版本**：6.0.0(20)
- **变更影响**：20
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-notificationkit-6004
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\components\CharacterCard.ets:83`（来源：代码扫描）

### `linearGradient(options: Optional<LinearGradientOptions>): T` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：5.1.0(18)
- **变更影响**：linearGradient(options: Optional<LinearGradientOptions>): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\components\CharacterCard.ets:69`（来源：代码扫描）
  - `entry\src\main\ets\components\FooterLoading.ets:62`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\components\CharacterCard.ets:69` |
  | 5.1.0(18) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\components\FooterLoading.ets:62` |

  </details>

### `linearGradient(value: { angle?: number | string; direction?: GradientDirection; colors: Array<\[ ResourceColor, number \]>; repeating?: boolean; }): T` ✅

- **变更类型**：函数变更
- **影响版本**：5.1.0(18)
- **变更影响**：value: LinearGradientOptions
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\components\CharacterCard.ets:69`（来源：代码扫描）
  - `entry\src\main\ets\components\FooterLoading.ets:62`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\components\CharacterCard.ets:69` |
  | 5.1.0(18) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\components\FooterLoading.ets:62` |

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
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\components\CharacterCard.ets:80`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:191`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\components\CharacterCard.ets:80` |
  | 5.1.0(18) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:191` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\components\CharacterCard.ets:80` |
  | 6.0.0(20) | 函数变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:191` |

  </details>

### `offset(): OffsetResult | undefined` ✅

- **变更类型**：新增API
- **影响版本**：6.1.0(23)
- **变更影响**：offset(): OffsetResult \| undefined;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-6101
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\components\HeaderBanner.ets:73`（来源：代码扫描）

### `offset(dx: number, dy: number): Path` ✅

- **变更类型**：API跨平台权限变更
- **影响版本**：6.0.0(20)
- **变更影响**：crossplatform
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6003
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\components\HeaderBanner.ets:73`（来源：代码扫描）

### `offset(dx: number, dy: number): void` ✅

- **变更类型**：类新增必选属性或非同名方法
- **影响版本**：6.0.0(20)
- **变更影响**：offset(dx: number, dy: number): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\components\HeaderBanner.ets:73`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 类新增必选属性或非同名方法 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\components\HeaderBanner.ets:73` |
  | 6.0.0(20) | API跨平台权限变更 | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\components\HeaderBanner.ets:73` |

  </details>

### `parts: Part\[\]` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：parts: Part\[\];
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-agentframeworkkit-7002
- **涉及代码位置**（共 9 处）：
  - `entry\src\main\ets\pages\Index.ets:122`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:123`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:124`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:125`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:126`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:127`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:131`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:132`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:133`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:122` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:123` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:124` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:125` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:126` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:127` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:131` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:132` |
  | 26.0.0 Beta2 | 新增API | `harmonyos_api_changes/HarmonyOS_26.0.0_Beta2.json` | `entry\src\main\ets\pages\Index.ets:133` |

  </details>

### `readonly totalCount?: number` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：readonly totalCount?: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-assetstorekit-6001
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\Index.ets:113`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:124`（来源：代码扫描）
  - `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:233`（来源：代码扫描）
  - `ohos_library\src\main\ets\HeaderSpanSizeLookup.ets:77`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:113` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:124` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:233` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta1.json` | `ohos_library\src\main\ets\HeaderSpanSizeLookup.ets:77` |

  </details>

### `rowsGap(value: LengthMetrics | undefined): T` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：rowsGap(value: LengthMetrics \| undefined): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-7001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:238`（来源：代码扫描）

### `rowsGap(value: LengthMetrics): T` ✅

- **变更类型**：新增API
- **影响版本**：5.1.1(19)
- **变更影响**：rowsGap(value: LengthMetrics): T;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-5111
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:238`（来源：代码扫描）

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

### `setItems(items: mapCommon.MassPointItem\[\]): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：setItems(items: mapCommon.MassPointItem\[\]): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-mapkit-6003
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\pages\Index.ets:79`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:96`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:79` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:96` |

  </details>

### `static offset(point: common2D.Point, dx: number, dy: number): void` ✅

- **变更类型**：新增API
- **影响版本**：26.0.0 Beta2
- **变更影响**：static offset(point: common2D.Point, dx: number, dy: number): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-7001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\components\HeaderBanner.ets:73`（来源：代码扫描）

### `static offset(rect: common2D.Rect, dx: number, dy: number): void` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：static offset(rect: common2D.Rect, dx: number, dy: number): void;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkgraphics2d-6001
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\components\HeaderBanner.ets:73`（来源：代码扫描）

### `textOverflow(value: { overflow: TextOverflow; }): TextAttribute` ✅

- **变更类型**：函数变更
- **影响版本**：5.1.0(18)
- **变更影响**：options: TextOverflowOptions
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-arkui-510
- **涉及代码位置**（共 2 处）：
  - `entry\src\main\ets\components\CharacterCard.ets:81`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:192`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 5.1.0(18) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\components\CharacterCard.ets:81` |
  | 5.1.0(18) | 函数变更 | `harmonyos_api_changes/HarmonyOS_5.1.0(18).json` | `entry\src\main\ets\pages\Index.ets:192` |

  </details>

### `totalCount: number` ✅

- **变更类型**：新增API
- **影响版本**：6.0.0(20)
- **变更影响**：totalCount: number;
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/js-apidiff-corefilekit-6002
- **涉及代码位置**（共 4 处）：
  - `entry\src\main\ets\pages\Index.ets:113`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:124`（来源：代码扫描）
  - `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:233`（来源：代码扫描）
  - `ohos_library\src\main\ets\HeaderSpanSizeLookup.ets:77`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:113` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:113` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `entry\src\main\ets\pages\Index.ets:124` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `entry\src\main\ets\pages\Index.ets:124` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:233` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:233` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta2.json` | `ohos_library\src\main\ets\HeaderSpanSizeLookup.ets:77` |
  | 6.0.0(20) | 新增API | `harmonyos_api_changes/HarmonyOS_6.0.0(20)_Beta3.json` | `ohos_library\src\main\ets\HeaderSpanSizeLookup.ets:77` |

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

## 行为变更（按 API 分组，共 5 个 API；已过滤误报 0 条）

### `borderRadius(value: Length | BorderRadiuses | LocalizedBorderRadiuses): T` ✅

- **变更类型**：接口行为变更
- **影响版本**：5.0.2(14)
- **变更影响**：Image组件的borderRadius接口支持动态修改
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/changelogs-for-all-apps-b123sp16#image%E7%BB%84%E4%BB%B6%E7%9A%84borderradius%E6%8E%A5%E5%8F%A3%E6%94%AF%E6%8C%81%E5%8A%A8%E6%80%81%E4%BF%AE%E6%94%B9
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\components\HeaderBanner.ets:70`（来源：代码扫描）

### `declare class CommonMethod<T>` ✅

- **变更类型**：接口定义变更
- **影响版本**：26.0.0(26)
- **变更影响**：ArkUI接口新增仅支持Stage模型的约束
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026010615012
- **涉及代码位置**（共 77 处）：
  - `entry\src\main\ets\components\CharacterCard.ets:55`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:56`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:57`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:61`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:62`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:63`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:67`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:68`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:69`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:73`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:78`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:79`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:80`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:81`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:84`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:85`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:87`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:88`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:93`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:94`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:95`（来源：代码扫描）
  - `entry\src\main\ets\components\FooterLoading.ets:50`（来源：代码扫描）
  - `entry\src\main\ets\components\FooterLoading.ets:51`（来源：代码扫描）
  - `entry\src\main\ets\components\FooterLoading.ets:52`（来源：代码扫描）
  - `entry\src\main\ets\components\FooterLoading.ets:55`（来源：代码扫描）
  - `entry\src\main\ets\components\FooterLoading.ets:56`（来源：代码扫描）
  - `entry\src\main\ets\components\FooterLoading.ets:57`（来源：代码扫描）
  - `entry\src\main\ets\components\FooterLoading.ets:59`（来源：代码扫描）
  - `entry\src\main\ets\components\FooterLoading.ets:60`（来源：代码扫描）
  - `entry\src\main\ets\components\FooterLoading.ets:61`（来源：代码扫描）
  - `entry\src\main\ets\components\FooterLoading.ets:62`（来源：代码扫描）
  - `entry\src\main\ets\components\HeaderBanner.ets:62`（来源：代码扫描）
  - `entry\src\main\ets\components\HeaderBanner.ets:63`（来源：代码扫描）
  - `entry\src\main\ets\components\HeaderBanner.ets:64`（来源：代码扫描）
  - `entry\src\main\ets\components\HeaderBanner.ets:68`（来源：代码扫描）
  - `entry\src\main\ets\components\HeaderBanner.ets:69`（来源：代码扫描）
  - `entry\src\main\ets\components\HeaderBanner.ets:70`（来源：代码扫描）
  - `entry\src\main\ets\components\HeaderBanner.ets:71`（来源：代码扫描）
  - `entry\src\main\ets\components\HeaderBanner.ets:72`（来源：代码扫描）
  - `entry\src\main\ets\components\HeaderBanner.ets:73`（来源：代码扫描）
  - `entry\src\main\ets\components\HeaderBanner.ets:76`（来源：代码扫描）
  - `entry\src\main\ets\components\HeaderBanner.ets:77`（来源：代码扫描）
  - `entry\src\main\ets\components\HeaderBanner.ets:78`（来源：代码扫描）
  - `entry\src\main\ets\entryability\EntryAbility.ets:10`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:100`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:123`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:124`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:131`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:181`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:182`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:183`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:184`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:187`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:188`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:189`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:190`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:191`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:192`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:194`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:195`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:196`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:210`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:211`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:220`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:221`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:236`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:237`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:238`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:239`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:240`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:241`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:242`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:243`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:247`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:248`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:249`（来源：代码扫描）
  - `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:93`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:55` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:56` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:57` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:61` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:62` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:63` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:67` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:68` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:69` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:73` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:78` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:79` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:80` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:81` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:84` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:85` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:87` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:88` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:93` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:94` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:95` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\FooterLoading.ets:50` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\FooterLoading.ets:51` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\FooterLoading.ets:52` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\FooterLoading.ets:55` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\FooterLoading.ets:56` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\FooterLoading.ets:57` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\FooterLoading.ets:59` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\FooterLoading.ets:60` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\FooterLoading.ets:61` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\FooterLoading.ets:62` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\HeaderBanner.ets:62` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\HeaderBanner.ets:63` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\HeaderBanner.ets:64` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\HeaderBanner.ets:68` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\HeaderBanner.ets:69` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\HeaderBanner.ets:70` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\HeaderBanner.ets:71` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\HeaderBanner.ets:72` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\HeaderBanner.ets:73` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\HeaderBanner.ets:76` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\HeaderBanner.ets:77` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\HeaderBanner.ets:78` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\entryability\EntryAbility.ets:10` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:100` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:123` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:124` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:131` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:181` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:182` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:183` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:184` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:187` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:188` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:189` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:190` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:191` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:192` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:194` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:195` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:196` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:210` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:211` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:220` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:221` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:236` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:237` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:238` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:239` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:240` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:241` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:242` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:243` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:247` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:248` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:249` |
  | 26.0.0(26) | 接口定义变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `ohos_library\src\main\ets\HeaderRecyclerViewDataSource.ets:93` |

  </details>

### `declare const Text: TextInterface` ✅

- **变更类型**：UX视觉布局变更
- **影响版本**：26.0.0(26)
- **变更影响**：Dialog、Toast、AlphabetIndexer和文本选择菜单默认开启沉浸式系统材质
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/changelogs-overview-pre#chCH2026032761266
- **涉及代码位置**（共 5 处）：
  - `entry\src\main\ets\components\CharacterCard.ets:77`（来源：代码扫描）
  - `entry\src\main\ets\components\CharacterCard.ets:83`（来源：代码扫描）
  - `entry\src\main\ets\components\FooterLoading.ets:54`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:180`（来源：代码扫描）
  - `entry\src\main\ets\pages\Index.ets:186`（来源：代码扫描）

  <details><summary>组内明细（按版本）</summary>

  | 版本 | 变更类型 | 来源知识文件 | 代码位置 |
  |------|----------|--------------|----------|
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:77` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\CharacterCard.ets:83` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\components\FooterLoading.ets:54` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:180` |
  | 26.0.0(26) | UX视觉布局变更 | `harmonyos_behavior_changes/HarmonyOS_26.0.0(26)_Beta1.json` | `entry\src\main\ets\pages\Index.ets:186` |

  </details>

### `fontWeight(value: number | FontWeight | string): TextAttribute` ⚠️[存疑]

- **变更类型**：接口定义变更
- **影响版本**：6.0.0(20)
- **变更影响**：文本与输入、信息展示、按钮与选择、滚动与滑动、图形绘制组件接口支持Resource类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#ch383
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:182`（来源：代码扫描 ⚠️存疑）

### `fontWeight(weight: number | FontWeight | string, options?: FontSettingOptions): TextAttribute` ⚠️[存疑]

- **变更类型**：接口定义变更
- **影响版本**：6.0.0(20)
- **变更影响**：文本与输入、信息展示、按钮与选择、滚动与滑动、图形绘制组件接口支持Resource类型
- **变更证据**：https://developer.huawei.com/consumer/cn/doc/harmonyos-roadmap/all-changelogs-600#ch383
- **涉及代码位置**（共 1 处）：
  - `entry\src\main\ets\pages\Index.ets:182`（来源：代码扫描 ⚠️存疑）

---
*本文档由 hoscanner（HarmonyOS 升级 API 变更扫描工具）自动生成。*