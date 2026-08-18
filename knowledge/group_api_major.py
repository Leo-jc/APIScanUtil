# -*- coding: utf-8 -*-
"""将 API 变更的 42 个 operation 小类聚合为若干大类，并精确统计数量与占比。"""
import json, glob, sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent
API_DIR = ROOT / "harmonyos_api_changes"

# 大类 -> [小类 operation 列表]（按语义聚合，MECE）
MAJOR = {
    "1. 新增（净新增 API/符号/Kit/装饰器）": [
        "新增API", "新增错误码", "新增kit", "新增导出符号", "新增装饰器", "新增继承父类",
    ],
    "2. 删除（净删除 API/符号/Kit/函数）": [
        "删除API", "删除错误码", "删除kit", "删除导出符号", "删除同名函数",
    ],
    "3. 既有类型成员扩展（向类/接口新增成员与重载）": [
        "类新增必选属性或非同名方法",
        "类新增可选成员",
        "类新增同名方法且参数类型与已有的参数类型范围是包含关系",
        "类新增同名方法且参数类型与已有的参数类型范围不是包含关系",
        "接口新增可选属性",
        "接口新增必选属性",
        "接口新增可选或必选方法",
        "接口新增同名方法且参数类型与已有的参数类型范围是包含关系",
        "接口新增同名方法且参数类型与已有的参数类型范围不是包含关系",
    ],
    "4. 声明内容变更（函数/属性/枚举/类型/符号/错误码内容修改）": [
        "函数变更", "属性变更", "自定义类型变更", "自定义类型变为接口兼容",
        "修改导出符号", "枚举赋值发生改变", "错误码变更", "错误码变更兼容",
    ],
    "5. 权限变更（跨平台/卡片/通用权限）": [
        "权限变更", "API跨平台权限变更", "API卡片权限变更",
    ],
    "6. 版本与生命周期（废弃/起始版本）": [
        "API废弃版本变更", "起始版本有变化",
    ],
    "7. 模型与能力范围（模型切换/元服务/syscap/kit）": [
        "API模型切换", "API从不支持元服务到支持元服务", "syscap变更", "kit变更",
    ],
    "8. 迁移与整改（成员迁移/继承调整/ArkTS 整改）": [
        "成员由子类迁移至父类",
        "继承关系由继承A类到继承B类，且A类是B类的父类",
        "属性类型匿名对象整改兼容",
        "属性类型匿名对象整改不兼容",
        "arkts演进版本整改兼容变化",
    ],
}

# 统计全部 operation
counter = Counter()
all_ops_seen = set()
for fp in sorted(API_DIR.glob("*.json")):
    d = json.load(open(fp, encoding="utf-8"))
    for kit in d.get("kits", []) or []:
        for ch in kit.get("changes", []) or []:
            op = ch.get("operation") or "<null>"
            counter[op] += 1
            all_ops_seen.add(op)

TOTAL = sum(counter.values())

# 校验：大类映射是否覆盖全部 operation，且无重复
mapped = set()
for ops in MAJOR.values():
    for o in ops:
        assert o not in mapped, f"重复映射: {o}"
        mapped.add(o)
unmapped = all_ops_seen - mapped
extramapped = mapped - all_ops_seen
print(f"总变更数: {TOTAL}")
print(f"实际 distinct operation 数: {len(all_ops_seen)}")
print(f"大类已映射 operation 数: {len(mapped)}")
print(f"未映射到大类的 operation: {unmapped if unmapped else '无'}")
print(f"大类中不存在于数据的 operation: {extramapped if extramapped else '无'}")
assert not unmapped and not extramapped, "映射不完整！"
print("映射完整性校验: PASS\n")

def pct(n, t):
    return f"{n/t*100:.2f}%"

print("=" * 80)
print("API 变更大类 → 小类 分级分类（合计 {}）".format(TOTAL))
print("=" * 80)

major_totals = []
for major, ops in MAJOR.items():
    m_total = sum(counter[o] for o in ops)
    major_totals.append((major, m_total))
    print(f"\n### {major}")
    print(f"    大类合计: {m_total}  ({pct(m_total, TOTAL)})")
    print(f"    {'小类(operation)':<55}{'数量':>8}{'占大类':>10}{'占总数':>10}")
    # 小类按数量降序
    for o in sorted(ops, key=lambda x: -counter[x]):
        c = counter[o]
        print(f"    {o:<55}{c:>8}{pct(c, m_total):>10}{pct(c, TOTAL):>10}")

print("\n" + "=" * 80)
print("大类汇总（按数量降序）")
print("=" * 80)
print(f"{'大类':<55}{'数量':>8}{'占比':>10}")
for major, m_total in sorted(major_totals, key=lambda x: -x[1]):
    print(f"{major:<55}{m_total:>8}{pct(m_total, TOTAL):>10}")

sum_major = sum(t for _, t in major_totals)
print(f"\n各大类求和: {sum_major}  (应等于 {TOTAL})  {'PASS' if sum_major==TOTAL else 'FAIL'}")
