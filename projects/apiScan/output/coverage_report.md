# HarmonyOS 三方库升级 API 变更扫描 —— 测试集覆盖率报告

> 生成时间对应数据源：`output/coverage_report.json`  
> 测试集：`D:\Projects\APIScanUtil\testSet`  
> 扫描结果：`D:\Projects\APIScanUtil\projects\apiScan\output`

---

## 一、结论

**整体覆盖率（召回率 Recall）：1543/1543 = 100.0%**  
**结论：✅ 全部项目完全覆盖真实清单（缺失 = 0）**

| 指标 | 值 |
|---|---:|
| 测试项目数 | 11 |
| 真实清单总条数 | 1543 |
| 命中条数 | 1543 |
| 缺失条数 | 0 |
| 多余条数（不扣分） | 13850 |
| 整体召回率 | **100.0%** |

## 二、口径说明

| 项 | 定义 |
|---|---|
| 覆盖率定义 | 召回率 Recall = matched / 真实清单总条数 |
| 匹配键 | (api, codeLocation) 严格匹配（分隔符归一为反斜杠，不剥离模块前缀） |
| 数据源 | 本次重新扫描 output/{项目名}_scan_result.json（API 12→26） |
| 多余项处理 | 仅统计分类，不修改工具，不参与覆盖率扣分 |

## 三、各项目覆盖率

| 项目 | 真实清单 | 扫描结果 | 命中 | 缺失 | 多余 | 覆盖率 | 状态 |
|---|---:|---:|---:|---:|---:|---:|:---:|
| CalendarListview | 116 | 522 | 116 | 0 | 406 | **100.0%** | ✅ |
| CheckerboardDrawable | 92 | 382 | 92 | 0 | 290 | **100.0%** | ✅ |
| FlexTags | 95 | 1176 | 95 | 0 | 1081 | **100.0%** | ✅ |
| FluidLayout | 66 | 218 | 66 | 0 | 152 | **100.0%** | ✅ |
| HeaderRecyclerView | 50 | 221 | 50 | 0 | 171 | **100.0%** | ✅ |
| InsLoadingAnimation | 430 | 4787 | 430 | 0 | 4357 | **100.0%** | ✅ |
| MarqueeTextView | 138 | 2438 | 138 | 0 | 2300 | **100.0%** | ✅ |
| SectionedRecyclerView | 208 | 3345 | 208 | 0 | 3137 | **100.0%** | ✅ |
| SideBar | 122 | 753 | 122 | 0 | 631 | **100.0%** | ✅ |
| TableFixHeaders | 124 | 1205 | 124 | 0 | 1081 | **100.0%** | ✅ |
| viewpagerdots | 102 | 346 | 102 | 0 | 244 | **100.0%** | ✅ |
| **合计** | **1543** | — | **1543** | **0** | **13850** | **100.0%** | |

### 覆盖率分布

```
CalendarListview       ████████████████████ 100.0%
CheckerboardDrawable   ████████████████████ 100.0%
FlexTags               ████████████████████ 100.0%
FluidLayout            ████████████████████ 100.0%
HeaderRecyclerView     ████████████████████ 100.0%
InsLoadingAnimation    ████████████████████ 100.0%
MarqueeTextView        ████████████████████ 100.0%
SectionedRecyclerView  ████████████████████ 100.0%
SideBar                ████████████████████ 100.0%
TableFixHeaders        ████████████████████ 100.0%
viewpagerdots          ████████████████████ 100.0%
```

## 四、缺失项明细（参考有、扫描无）

无缺失项。
## 五、多余项汇总（扫描有、参考无，合理补充候选，不扣分）

| 项目 | 多余合计 | 系统 API 变更 | 行为变更 |
|---|---:|---:|---:|
| CalendarListview | 406 | 359 | 114 |
| CheckerboardDrawable | 290 | 236 | 137 |
| FlexTags | 1081 | 1090 | 103 |
| FluidLayout | 152 | 105 | 66 |
| HeaderRecyclerView | 171 | 156 | 35 |
| InsLoadingAnimation | 4357 | 4637 | 393 |
| MarqueeTextView | 2300 | 2518 | 182 |
| SectionedRecyclerView | 3137 | 3319 | 180 |
| SideBar | 631 | 592 | 101 |
| TableFixHeaders | 1081 | 1031 | 176 |
| viewpagerdots | 244 | 200 | 81 |
| **合计** | **13850** | | |

> 多余项是工具相对参考清单的额外补充候选，覆盖率口径不扣分。

## 六、缺失项 API 模式分析


---

*本报告由 `tests/coverage_to_md.py` 从 `output/coverage_report.json` 生成。*
