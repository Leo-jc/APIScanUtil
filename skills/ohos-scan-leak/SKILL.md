---
name: ohos-scan-leak
description: 扫描鸿蒙移植库中 C/C++、NAPI、ArkTS/JS、文件媒体系统资源、监听定时器、Worker、任务、缓存和生命周期对象的资源泄漏与无界增长缺陷。
---

# 资源泄漏扫描

## 1. 扫描边界

只检查资源在正常使用、失败、取消、重试、页面离开、组件销毁或实例替换后仍被持有，或者随正常重复操作持续增长的问题：

- 堆对象、句柄、文件描述符、映射区域、线程和 native 上下文；
- NAPI reference、TSFN、FFI 对象、Handle Scope 和 ArkTS runtime；
- 文件、网络、数据库、媒体、图形、IPC 和 watcher；
- 事件订阅、定时器、Worker、TaskPool 任务、Promise 和回调上下文；
- 页面、Ability、组件、全局对象、闭包、缓存、集合、队列和注册表。

不归本扫描：

- 释放后继续访问、双重释放或其他立即崩溃问题，交给 crash scanner；
- 只影响功能结果而不造成资源留存或增长的问题，交给 malfunction scanner；
- 只凭 new、malloc、open、on、setInterval 或其他 API 名称命中，无法证明对应资源跨越应有生命周期的问题；
- 只是一时存活、随后由框架或 GC 明确回收的对象；
- 只是占用较大但有明确上限、正常生命周期内会释放的对象。

分析时区分三种情况：单次释放遗漏、重复操作导致资源逐次累积、无界缓存/集合增长。必须说明是哪一种以及增长或留存发生在哪里。

## 2. 主检查清单

主检查范围来自：

references/checklist.md

阶段三必须完整 Read 该文件，并逐项记录其中的检查项目。该文件是本 skill 的唯一主检查范围；API 名称和 CodeScanner 结果只是定位线索，不能扩大范围或代替生命周期证据。

本 skill 还提供 references/api-quickref.md 作为资源创建/释放配对速查，可在阶段三按需 Read；它不增加 Checklist 范围。

## 3. 总体执行要求

四个阶段必须串行完成：

1. 项目理解与范围，并强制运行本地 CodeScanner 预扫；
2. Git 错误模式和当前同类问题；
3. Checklist 驱动的独立资源生命周期审查；
4. 候选合并去重。

每阶段只读取对应 Schema，只写对应阶段 JSON。阶段三缺少真实 Read 证据时，读取被指出的文件后重新整理结果。

候选召回优先。只要已有真实资源位置、生命周期关系和初步释放缺口，就保留候选，并在 open_questions 中写明未确认的释放路径或增长条件。

## 4. 阶段一：项目理解与范围

### 执行流程

1. 读取 README、贡献说明、构建文件、依赖文件、测试说明和主要项目配置。
2. 列出 C/C++、NAPI/FFI、ArkTS/JS、媒体、文件、网络、数据库、图形、Worker 和 TaskPool 相关源码。
3. 找出公开入口、页面/Ability/组件生命周期和异步回调入口。
4. 按资源类型记录创建、打开、注册、保存、转移、使用、关闭、取消、销毁和释放位置。
5. 标记长生命周期持有者，包括单例、全局表、缓存、闭包、回调、页面路由、Worker 和任务池。
6. 记录跨语言边界、资源所有权约定、构建入口和排除目录。
7. 阶段一必须从本 skill 目录运行：

   python scripts/index.py -p <projectPath> -s <sdkPath> -o <outputDir> --no-table

   Windows 环境下如果 python/python3 命令异常（退出码 49），使用 py -3 替代：

   py -3 scripts/index.py -p <projectPath> -s <sdkPath> -o <outputDir> --no-table

   脚本内置自动探测：优先使用当前进程 Python、py -3 Launcher、python3、python。

   SDK 路径说明：Homeflow 要求 SDK 路径指向包含 default/ 子目录的上层目录（如 D:\DevEcoStudio\sdk），而非直接指向 openharmony 子目录。脚本已内置自动修正逻辑，传入过深路径会自动回溯。

   退出码：0=成功无高危问题，1=扫描失败，2=成功但发现 critical/high 问题。

   该工具必须尝试调用 Homeflow ArkTS 引擎和 CodeScanner C++ MemoryAndResourceLeakChecker，生成 report.json、report.md、SARIF 文件和 engine 日志。只有确认某个引擎不适用于当前项目时，才可以使用 --no-arkts 或 --no-cpp，并在结果中记录 not_applicable 和原因。
8. 读取预扫汇总结果，记录工具状态、报告路径、引擎状态、规则命中数和 Checklist 映射，再将资源画像写入阶段一 JSON。DevEco、SDK 或引擎不可用时不得静默跳过，必须记录 failed 或 not_applicable；源码审查仍需继续。

   预扫结果必须写入 `project_profile.code_scanner_result`，结构如下：
   - `status`：completed / partial / failed / not_applicable
   - `report_path`：report.json 的绝对路径
   - `log_dir`：引擎日志目录的绝对路径
   - `engines[]`：每个引擎一条，包含 `tool_id`（homeflow 或 cpp-agent）、`status`、`error`（如失败）、`duration_ms` 和 `rule_hits[]`
   - `rule_hits[].rule_id`：规则 ID；`count`：命中数；`checklist_mapping[]`：映射到 checklist 条目 ID（如 A1、D2）

   阶段三读取 `code_scanner_result.rule_hits` 时只作为定位线索，不扩大 checklist 范围，不直接当作候选结论。

阶段一只建立资源和生命周期知识图谱，不读 Git、不判断泄漏、不形成候选。

### 禁止事项

- 禁止把分配、打开或注册 API 本身写成候选；
- 禁止把资源画像中的创建位置直接当作泄漏证据；
- 禁止读取 Git 历史；
- 禁止凭经验假设释放责任而不读所有权转移和销毁路径；
- 禁止把 CodeScanner 或 Homeflow 的命中直接写成 candidate；
- 禁止把预扫报告、SARIF 或工具台账当作源码 Read 证据；
- 禁止把预扫工具不可用或某个引擎失败静默处理为“未执行”；
- 禁止生成 candidates。

### 阶段一检查清单

- [ ] 已识别项目类型和资源相关源码范围
- [ ] 已记录公开入口和生命周期入口
- [ ] 已记录主要资源的创建/打开位置
- [ ] 已记录资源所有者和转移边界
- [ ] 已记录关闭/取消/销毁/释放位置
- [ ] 已记录全局、缓存、闭包和异步持有者
- [ ] 已记录跨语言边界和排除目录
- [ ] 已执行 CodeScanner 预扫
- [ ] 已记录预扫工具状态、报告路径和引擎结果
- [ ] 已将预扫结果写入 project_profile.code_scanner_result（含 engines[].rule_hits[].checklist_mapping）
- [ ] 已将预扫规则映射到 Checklist 线索
- [ ] 已写入阶段一 JSON

## 5. 阶段二：Git 错误模式和当前同类问题

### 执行流程

1. Read 阶段一 JSON，按资源类型、所有权边界和生命周期范围确定历史与源码搜索范围。
2. 检查项目是否为 Git 仓库（预扫阶段已自动检测并提示）。如果不是 Git 仓库，记录 `git_history.available = false` 和原因，跳过步骤 3-5，直接进入步骤 6。
3. 只查看当前 HEAD 及其祖先提交。
3. 使用中英文关键词搜索 leak、release、close、destroy、dispose、unsubscribe、cancel、cache、fd、worker、task、memory、资源、释放、关闭、销毁、取消、缓存、句柄、文件描述符、泄漏等模式。
4. 对命中的提交读取完整 diff，区分真正修复资源泄漏和代码质量维护。
5. 将历史模式写入 repository_error_rules[]，记录实际关键词、证据、风险和当前审查重点。
6. 回到当前源码主动搜索同类创建/持有/释放关系和重复增长路径。
7. 当前源码候选必须重新 Read 相关函数、错误路径、取消路径和销毁路径。
8. 将历史规则和当前候选写入阶段二 JSON。

Git 历史边界：

- 只允许当前 HEAD 及其祖先；
- 所有历史列表命令必须带 --no-merges；
- 禁止 --all、--branches、--tags、--remotes、远程 ref、分支名、tag、reflog、fetch、git branch、git tag 和 git for-each-ref；
- 历史 SHA 必须确认属于当前 HEAD 的祖先；
- 合并提交和 merge 请求不作为规则来源。

历史规则只提供搜索方向，不能替代当前资源生命周期证据。历史已经修复的位置，如果当前 checkout 仍有相似创建/持有关系，必须进入阶段三。

### 禁止事项

- 禁止把历史提交或提交标题直接写成当前泄漏；
- 禁止只根据 API 名称判断缺少释放；
- 禁止只看正常返回路径而跳过失败、取消、超时和销毁路径；
- 禁止因为没有历史命中而跳过当前源码搜索；
- 禁止在阶段二删除尚未确认完整释放关系的候选；
- 禁止使用当前 HEAD 之外的历史。

### 阶段二检查清单

- [ ] 已读取阶段一 JSON
- [ ] 已限制 Git 历史为当前 HEAD 及其祖先
- [ ] 历史命令已排除 merge commit
- [ ] 已尝试资源、释放和生命周期相关中英文关键词
- [ ] 已读取相关提交完整 diff
- [ ] 已区分 problem_fix 和 code_quality_maintenance
- [ ] 已记录实际命中的 keywords[]
- [ ] 已回到当前源码搜索同类资源关系
- [ ] 当前候选都有创建/持有/释放证据
- [ ] 已写入阶段二 JSON

## 6. 阶段三：Checklist 驱动的独立资源生命周期审查

### 执行流程

1. Read input_path 及 input inventory，确认 eligible_files、must_read_files、源码根目录和排除目录。
2. Read 阶段一 JSON，确认资源类型、入口、所有权和生命周期范围。
3. 完整 Read references/checklist.md，逐项检查 A1、A2、B1、B2、C1、C2、D1、D2、E1、E2。
4. 对每个清单项目主动 Read 相关源码，真实记录 reviewed_files、file:line evidence 和审查说明。
5. 完成第一轮独立 Checklist 审查后，如阶段一存在 CodeScanner 结果，再 Read report.json 及必要日志，将 ruleId、引擎和位置作为第二路定位线索。
6. 对每种资源追踪完整因果链：公开入口触发 → 资源创建/注册 → 保存/持有 → 生命周期结束事件（组件销毁、页面离开、取消、失败、重试）→ 释放缺口（应释放但未释放的位置）。每个候选必须在 `reachability.trigger_sequence` 中写明从公开入口到释放缺口的完整触发序列，在 `root_cause.data_flow` 中写明资源从创建到被持有的变量传递链。只写"资源未释放"而不追踪入口触发和生命周期结束事件，不算完整候选。
7. 对跨语言资源同时阅读两端，确认 reference、回调、TSFN、Worker、Context、文件描述符和 native 对象的所有权是否一致。
8. 对缓存、集合、队列、注册表、定时器和任务，检查是否有上限、淘汰、取消、清空或生命周期结束后的移除。
9. 区分显式释放资源、GC 管理对象、框架托管资源和仍在使用的合法缓存；只有缺少应有释放或明确无界增长才形成候选。
10. 完成第一轮独立 Checklist 审查并读取预扫线索后，再 Read 阶段二 JSON 作对照。
11. 对阶段二候选和预扫命中重新打开当前源码确认；相同资源和释放缺口保留各自来源和证据，交给阶段四去重。
12. 写入 checklist_gate、read_audit 和完整 candidates。

候选必须说明资源如何在正常、失败、取消、重试、销毁或重复进入后继续被持有，以及为什么该持有不再符合资源生命周期。不要只写“内存增长”，要说明增长对象、增长触发、释放缺口和影响。

### 禁止事项

- 禁止只按 API 速查或函数名填清单；
- 禁止把一次分配、一次缓存或 GC 延迟直接写成泄漏；
- 禁止只证明资源创建而不追踪所有权和释放路径；
- 禁止只写"资源未释放"而不追踪从公开入口到释放缺口的完整因果链；
- 禁止漏读异常、取消、超时、重试和生命周期销毁分支；
- 禁止把 UAF、双重释放或立即崩溃混入资源泄漏候选；
- 禁止为清单项目填写未实际 Read 的文件；
- 禁止把预扫报告中的文件或行号直接当作 Read 过的源码；
- 禁止把工具的 severity、ruleId 或 SARIF 结果直接当作候选结论；
- 禁止伪造 Read 次数、文件覆盖或 file:line 证据；
- 禁止静默删除有真实位置和初步资源关系的待复核候选；
- 禁止声称运行时或设备已验证。

### 阶段三检查清单

- [ ] 已读取输入范围和 input inventory
- [ ] 已读取阶段一 JSON
- [ ] 已完整读取 references/checklist.md
- [ ] A1 到 E2 每个清单项目均有一条结果
- [ ] 每条清单结果都有真实 Read 文件和证据
- [ ] 已读取阶段一记录的预扫报告，且只作为辅助线索
- [ ] 预扫命中已回到当前源码重新 Read
- [ ] 已主动阅读阶段二未覆盖的资源相关源码
- [ ] 已检查成功、失败、取消、重试和销毁路径
- [ ] 已检查跨语言、异步、Worker、TaskPool 和回调持有关系
- [ ] 已检查缓存、集合、注册表和重复进入的增长条件
- [ ] 每条候选都有创建/持有/释放数据流
- [ ] 每条候选都有从公开入口到释放缺口的完整触发序列（入口→创建→生命周期结束→缺口）
- [ ] 不确定候选已保留并记录 open_questions
- [ ] 第一轮独立审查完成后才读取阶段二作对照
- [ ] 已写入阶段三 JSON

## 7. 阶段四：候选合并去重

### 执行流程

1. Read 阶段二和阶段三 JSON 的完整候选。
2. 先按同一资源对象、同一所有权关系、同一释放缺口和同一文件的相邻故障位置建立候选组。
3. 判断两个候选是否描述同一资源在同一生命周期结束后仍被持有，或同一重复路径造成同一增长。
4. 同一资源和同一释放缺口合并，保留两路 candidate ID、创建/持有/释放证据和合并原因。
5. 不同资源对象、不同所有者、不同生命周期或不同释放缺口分别保留，即使现象都是内存增长。
6. 写入输入数量、来源 ID、分组、决策和最终 candidate_ids。

### 禁止事项

- 禁止只按标题、API 名称或“内存增长”去重；
- 禁止复制阶段二或阶段三候选正文；
- 禁止把不同资源的同类 API 使用合并成一条；
- 禁止跨 scanner 合并；
- 禁止在本阶段重新编造释放证据。

### 阶段四检查清单

- [ ] 已读取阶段二完整 JSON
- [ ] 已读取阶段三完整 JSON
- [ ] 已统计两路候选数量
- [ ] 已记录两路 candidate ID
- [ ] 已按资源和生命周期建立候选分组
- [ ] 每个合并决定都有资源关系和原因
- [ ] 合并结果保留独立创建/持有/释放证据
- [ ] 未复制候选正文
- [ ] 已写入阶段四 JSON
