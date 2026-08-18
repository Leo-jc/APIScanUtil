# APIScanUtil

HarmonyOS / 鸿蒙 **API 变更扫描与升级兼容性评估** 工具集 —— 围绕「工程从旧版 HarmonyOS SDK 升级到新版时，哪些代码受影响、应如何适配」这一场景，整合了自研扫描器、官方工具反编译源码、变更知识库与 Claude Code 技能。

本仓库是一个**多组件工作区**，根目录只做总览与导航，每个子目录有独立的说明文档。

---

## 仓库结构

```
APIScanUtil/
├── projects/
│   ├── apiScan/          # hoscanner —— 自研 API 变更扫描器（Python，仅标准库）
│   └── DevEcoAPIScan/    # DevEco Studio 内置 API Change Assistant 的反编译源码
├── knowledge/            # HarmonyOS API 变更知识库（JSON 清单）+ 分析 / 审计脚本
├── skills/               # Claude Code 技能（API 变更助手 / 资源泄漏扫描）
├── testSet/              # 扫描测试集（样本工程输出）
└── thirdLibrary/         # 三方库样本（用于扫描验证）
```

---

## 各组件说明

### 1. `projects/apiScan` — hoscanner（自研扫描器）

HarmonyOS 三方库 / 应用进行 OS 版本升级时的 **API 调用图谱提取** 与 **系统 API 变更 / 行为变更清单扫描**。纯 Python 标准库实现，无第三方依赖。

**能力：**

- **API 使用记录** —— 规则引擎逐行扫描 `.ets` 源码，定位每个系统 API 的使用位置（文件:行号）与代码片段，交叉匹配知识库。
- **API 调用图谱** —— 轻量词法器独立解析源码，提取 `@kit / @ohos` 导入、函数 / 方法 / 组件边界、每个系统 API 的调用点。
- **升级变更清单** —— 在升级窗口 `(fromApiVersion, toApiVersion]` 内，从知识库筛出本工程涉及的系统 API 变更与行为变更，按 API 分组输出。
- **AI 升级建议** —— 汇总高影响变更（删除 / 废弃 / 行为变更 / UX 变更）与分版本分布；可选接入 OpenAI 兼容 LLM 生成自然语言评估，未配置时回退到确定性规则建议。

**快速运行：**

```bash
cd projects/apiScan

python -m hoscanner \
  --project "<工程根目录>" \
  --sdk-root "<DevEco Studio SDK 根目录>" \
  --knowledge-root "../../knowledge" \
  --out "<输出目录>" \
  --from 12 --to 26
```

详见 [`projects/apiScan/README.md`](projects/apiScan/README.md)。

### 2. `projects/DevEcoAPIScan` — API Change Assistant 源码

从 DevEco Studio（26.0.0.621，IntelliJ Platform 2026.1.1）中提取并反编译的 **API Change Assistant（API 变更助手）** 完整源码与资源 —— 即 IDE 底部内置的「API 变更」工具窗口，用于在 SDK 版本间扫描工程代码中使用了不兼容变更 API 的位置，提供树形列表、过滤、导出 CSV、跳转代码、AI 适配建议等能力。

> 反编译产物使用 CFR 0.152 生成，保留了反编译标记，不影响对流程与逻辑的理解。

详见 [`projects/DevEcoAPIScan/README.md`](projects/DevEcoAPIScan/README.md) 与架构文档 [`projects/DevEcoAPIScan/docs/ARCHITECTURE.md`](projects/DevEcoAPIScan/docs/ARCHITECTURE.md)。

### 3. `knowledge/` — API 变更知识库

HarmonyOS 系统 API 变更与行为变更的**结构化知识库**，是扫描器与官方工具比对变更的数据底座。

- `harmonyos_api_changes/` —— 系统 API 变更清单（按 SDK 版本，`kits[].changes[].operation` 结构）。
- `harmonyos_behavior_changes/` —— 行为 / UX 变更清单（`interfaceBehaviorChanges[]` 结构）。
- 覆盖 HarmonyOS 5.0.1(13) ～ 26.0.0(26) 各 Beta / Release 版本。

**分析 / 审计脚本：**

| 脚本 | 作用 |
|------|------|
| `analyze_changes.py` | 按变更类型分类统计、跨版本分布、原始记录转储 |
| `audit_perfile.py` | 逐文件审计 |
| `audit_recalc.py` | 审计结果重算 |
| `audit_versions.py` | 版本维度审计 |
| `group_api_major.py` | 按主版本归组 |

### 4. `skills/` — Claude Code 技能

两个可在 Claude Code 中调用的技能：

- **`hmos-api-change-assistant`** —— 调用 DevEco Studio 内置 `ApiScanUtil` 接口，输出两个 SDK 版本间的 API 变更清单与受影响代码位置（三阶段：工具扫描+编译 → Agent 复核 → 汇总）。
- **`ohos-scan-leak`** —— 扫描鸿蒙移植库中的资源泄漏与无界增长缺陷（C/C++、NAPI、ArkTS/JS、媒体资源、监听器、Worker、缓存、生命周期对象）。

### 5. `testSet/` 与 `thirdLibrary/`

- `thirdLibrary/FluidLayout` —— 用于扫描验证的三方库样本工程。
- `testSet/FluidLayout` —— 对应的扫描测试输出（`apiChange.csv` / `apiChange.json`）。

---

## 工作区关系

```
                   ┌─────────────────────────────────────────┐
                   │            knowledge/ (变更知识库)         │
                   │  harmonyos_api_changes + behavior_changes │
                   └───────────────┬─────────────────────────┘
                                   │ 数据底座（比对变更）
            ┌──────────────────────┼──────────────────────┐
            ▼                      ▼                      ▼
   projects/apiScan          projects/DevEcoAPIScan     skills/
   (hoscanner 自研扫描器)     (官方工具反编译源码)       (Claude Code 技能)
            │                      │                      │
            └──────────┬───────────┘                      │
                       ▼                                  │
            testSet/ + thirdLibrary/ ◄────────────────────┘
            (样本工程 + 测试输出)        (技能可对样本工程运行)
```

- **`projects/apiScan`** 与 **`projects/DevEcoAPIScan`** 是同一目标的两条路径：前者是自研、纯标准库的离线扫描器；后者是 DevEco 官方工具的源码，用于理解官方实现逻辑并交叉验证。
- 两者共享 `knowledge/` 知识库作为变更数据来源。

---

## 环境要求

- **hoscanner**：Python 3.10+（仅标准库，无第三方依赖）、DevEco Studio SDK（识别系统 API 声明）。
- **DevEcoAPIScan**：JDK（运行 / 阅读反编译产物，依赖由 DevEco Studio 运行期提供）。
- **技能**：Claude Code CLI、DevEco Studio（`ApiScanUtil` 接口）。

---

## 许可

本仓库包含从 DevEco Studio 反编译的产物（`projects/DevEcoAPIScan`），仅供学习与内部研究；其版权归华为 / 原始权利人所有。自研代码（`projects/apiScan`）可按需使用。
