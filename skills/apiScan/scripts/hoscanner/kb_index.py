#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
kb_index.py —— 知识库索引器

读取 knowledge_root 下两个目录的全部 API 变更清单：
  * harmonyos_api_changes/  —— 系统 API 变更清单（dict 结构：kits[] → changes[]）
  * harmonyos_behavior_changes/  —— 行为 / UX 变更清单（list 结构：affectedApis + interfaceChanges）

提供：
  * KB_INDEX : 关键词 → {知识文件相对路径}   （用于 API 使用 ↔ 知识文件交叉匹配）
  * all_kb_files : 全部 53 个知识文件相对路径
  * change_records : 去重后的变更记录（用于升级变更清单报告）
  * kb_file_meta : 每个知识文件的元数据（版本、目录、变更数…）
"""
import json
import os
import re

from .config import (API_CHANGE_DIR_NAME, API_CHANGE_DIR_NAME_LEGACY,
                     API_CHANGES_DIR_NAME, FN_RE_PATTERN,
                     NOISE_CLS, NOT_FOUND_LABEL)

# 文件名 → (显示版本, apiVersion, subVersion)
_FN_RE = re.compile(FN_RE_PATTERN)

# HarmonyOS 官方变更文档前缀；apiChange 记录的 url 多为相对片段（changelogs-ux-b106#…），
# 需补此前缀得到完整证据链接。
_DOC_BASE = "https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/"


def _absolute_doc_url(url: str) -> str:
    """把相对文档片段补全为绝对 URL；已是绝对地址则原样返回。"""
    url = (url or "").strip()
    if not url:
        return ""
    if url.startswith("http://") or url.startswith("https://"):
        return url
    return _DOC_BASE + url.lstrip("/")


def parse_file_name(fname: str):
    """HarmonyOS_6.0.0(20)_Beta1.json → ('6.0.0(20)', 20, 'Beta1')"""
    m = _FN_RE.match(fname)
    if not m:
        return fname, 0, ""
    major = m.group(1)
    api_ver = int(m.group(2)) if m.group(2) else 0
    sub = m.group(3) or ""
    display = f"{major}({api_ver})" if api_ver else major
    return display, api_ver, sub


class KnowledgeBase:
    """知识库索引。"""

    def __init__(self, knowledge_root: str):
        self.root = knowledge_root
        # 行为变更目录：优先用新名 harmonyos_behavior_changes，缺失时回退旧名 apiChange
        self.api_change_dir = os.path.join(knowledge_root, API_CHANGE_DIR_NAME)
        if not os.path.isdir(self.api_change_dir):
            legacy = os.path.join(knowledge_root, API_CHANGE_DIR_NAME_LEGACY)
            if os.path.isdir(legacy):
                self.api_change_dir = legacy
        # 行为变更目录名（用于记录的 category 字段，对齐旧清单 apiChange/）
        self.api_change_dir_name = (API_CHANGE_DIR_NAME
                                    if os.path.isdir(os.path.join(knowledge_root, API_CHANGE_DIR_NAME))
                                    else API_CHANGE_DIR_NAME_LEGACY)
        self.api_changes_dir = os.path.join(knowledge_root, API_CHANGES_DIR_NAME)

        # 关键词 → set(相对路径)  与参考实现语义一致
        self.kb_index: dict[str, set[str]] = {}
        # 相对路径 → 元数据
        self.file_meta: dict[str, dict] = {}
        # 相对路径 → 变更记录列表（用于升级报告）
        self.file_records: dict[str, list[dict]] = {}
        # 扫描顺序（全部知识文件相对路径）
        self.scan_order: list[str] = []
        # 解析出错的文件
        self.errors: list[str] = []
        # 归一化签名 → records 列表（apiChange 方法签名精确索引，供匹配器 O(1) 查找）
        self.sig_index: dict[str, list[dict]] = {}

        self._load()

    # ------------------------------------------------------------------
    # 索引构建
    # ------------------------------------------------------------------
    def _add(self, cls: str, fname: str, cat: str):
        cls = (cls or "").strip()
        if cls and cls not in NOISE_CLS:
            rel = f"{cat}/{fname}"
            self.kb_index.setdefault(cls, set()).add(rel)

    def _load(self):
        # 1) harmonyos_api_changes（dict 结构）
        if os.path.isdir(self.api_changes_dir):
            for fname in sorted(os.listdir(self.api_changes_dir)):
                if not fname.endswith(".json"):
                    continue
                rel = f"{API_CHANGES_DIR_NAME}/{fname}"
                self.scan_order.append(rel)
                try:
                    meta, records = self._parse_api_changes_file(
                        os.path.join(self.api_changes_dir, fname), fname)
                    self.file_meta[rel] = meta
                    self.file_records[rel] = records
                except Exception as e:  # noqa: BLE001
                    self.errors.append(f"{rel}: {e}")

        # 2) apiChange（list 结构）——目录名可能是 harmonyos_behavior_changes 或旧名 apiChange
        if os.path.isdir(self.api_change_dir):
            dir_name = self.api_change_dir_name
            for fname in sorted(os.listdir(self.api_change_dir)):
                if not fname.endswith(".json"):
                    continue
                rel = f"{dir_name}/{fname}"
                self.scan_order.append(rel)
                try:
                    meta, records = self._parse_api_change_file(
                        os.path.join(self.api_change_dir, fname), fname)
                    self.file_meta[rel] = meta
                    self.file_records[rel] = records
                except Exception as e:  # noqa: BLE001
                    self.errors.append(f"{rel}: {e}")

    # -- harmonyos_api_changes -------------------------------------------------
    @staticmethod
    def _diff_content(side: dict) -> str:
        """取 change 的 old/new 一侧 diffContent（错误码或声明文本），NA 视为无。"""
        dc = (side or {}).get("diffContent") or ""
        dc = dc.strip()
        return "" if dc.upper() == "NA" else dc

    @staticmethod
    def _strip_sig(s: str) -> str:
        """规整签名：去多余空白、去结尾分号（参考 apiName 不带分号），不截断。"""
        s = re.sub(r"\s+", " ", (s or "").strip())
        return s.rstrip(";").strip()

    def _parse_api_changes_file(self, path: str, fname: str):
        with open(path, encoding="utf-8") as f:
            data = json.load(f)
        if not isinstance(data, dict):
            raise ValueError("非 dict 结构")
        display, api_ver, sub = parse_file_name(fname)
        version_name = (data.get("versionName") or display).strip()
        sub_version = (data.get("subVersion") or sub).strip()
        source_url = (data.get("sourceUrl") or "").strip()
        kits = data.get("kits") or []
        records = []
        for kit in kits:
            kit_name = (kit.get("name") or "").strip()
            kit_url = (kit.get("url") or "").strip()
            for ch in (kit.get("changes") or []):
                cls = (ch.get("className") or "").strip()
                op = (ch.get("operation") or "").strip()
                decl = self._truncate(ch.get("apiDeclaration"))
                # apiName 对齐参考清单：优先取旧签名（old.apiDeclaration），其次新签名。
                # 新增API 等无 old 形式时 old.apiDeclaration 为空，回退到 apiDeclaration。
                old_rec = ch.get("old") or {}
                api_name = self._strip_sig(
                    old_rec.get("apiDeclaration") or ch.get("apiDeclaration") or "")
                # 变更影响：取 new/old 的 diffContent（错误码或声明文本，NA 视为无）
                new_diff = self._diff_content(ch.get("new") or {})
                old_diff = self._diff_content(ch.get("old") or {})
                impact = new_diff or old_diff or ""
                # 索引关键词（与参考 index_kb 一致：只索引 className）
                self._add(cls, fname, API_CHANGES_DIR_NAME)
                records.append({
                    "category": API_CHANGES_DIR_NAME,
                    "fileName": fname,
                    "version": version_name,
                    "subVersion": sub_version,
                    "apiVersion": data.get("apiVersion") or api_ver,
                    "kit": kit_name,
                    "cls": cls,
                    "op": op,
                    "decl": decl,
                    "apiName": api_name,
                    "sourceUrl": source_url,
                    "kitUrl": kit_url,
                    "impact": impact,
                })
        meta = {
            "category": API_CHANGES_DIR_NAME,
            "fileName": fname,
            "versionName": version_name,
            "subVersion": sub_version,
            "apiVersion": data.get("apiVersion") or api_ver,
            "sizeBytes": os.path.getsize(path),
            "changeCount": len(records),
            "kitCount": len(kits),
            "releaseDate": (data.get("releaseDate") or "").strip(),
            "sourceUrl": (data.get("sourceUrl") or "").strip(),
        }
        return meta, records

    # -- apiChange -------------------------------------------------------------
    def _parse_api_change_file(self, path: str, fname: str):
        with open(path, encoding="utf-8") as f:
            data = json.load(f)
        # apiChange 文件为 dict，变更在 data["interfaceBehaviorChanges"]（list）。
        # 兼容历史 list 结构以保持健壮。
        if isinstance(data, list):
            items = data
            display, api_ver, sub = parse_file_name(fname)
            file_api_ver = api_ver or 0
            overview_url = ""
        elif isinstance(data, dict):
            items = data.get("interfaceBehaviorChanges") or []
            display, api_ver, sub = parse_file_name(fname)
            # 顶层 apiVersion 优先（数值版本，用于升级窗口过滤）
            file_api_ver = data.get("apiVersion") or api_ver or 0
            overview_url = (data.get("overviewUrl") or "").strip()
        else:
            raise ValueError("非 dict/list 结构")
        records = []
        cat = self.api_change_dir_name
        for item in items:
            ic = item.get("interfaceChanges") or {}
            title = (ic.get("changeTitle") or "").strip()
            ctype = (ic.get("changeType") or "行为变更").strip()
            url = (ic.get("url") or "").strip()
            change_id = ic.get("id")
            change_id = str(change_id) if change_id is not None else ""
            # 证据 URL：优先用相对片段补全；无片段时用 changeId 作锚点附在 overview 页
            if url:
                evidence_url = _absolute_doc_url(url)
            elif change_id and overview_url:
                evidence_url = f"{overview_url}#ch{change_id}"
            else:
                evidence_url = overview_url
            # 变更影响：行为变更标题即影响描述
            impact = title
            # 单条 interfaceChange 可能声明自己的 apiVersion
            ic_api_ver = ic.get("apiVersion")
            if ic_api_ver:
                try:
                    ic_api_ver = int(str(ic_api_ver).split(".")[0])
                except (ValueError, TypeError):
                    ic_api_ver = None
            rec_api_ver = ic_api_ver or file_api_ver or 0
            affected_apis = item.get("affectedApis") or []
            if not affected_apis:
                decl = self._truncate(title, 200)
                rec = {
                    "category": cat,
                    "fileName": fname,
                    "version": display,
                    "subVersion": sub,
                    "apiVersion": rec_api_ver,
                    "kit": "行为变更",
                    "cls": "",
                    "iface": "",
                    "ifaceType": "",
                    "op": ctype,
                    "decl": decl,
                    "apiName": title,
                    "changeId": change_id,
                    "url": url,
                    "evidenceUrl": evidence_url,
                    "impact": impact,
                }
                records.append(rec)
                self._index_sig(rec)
                continue
            # 每个 affectedApi 产出一条独立 record（对齐参考：一条参考记录对应一个 affectedApi）
            for a in affected_apis:
                cls = (a.get("className") or "").strip()
                iface = (a.get("interfaceName") or "").strip()
                iface_type = (a.get("interfaceType") or "").strip()
                pkg = (a.get("packageName") or "").strip()
                method_def = self._strip_sig(a.get("methodDefinition") or "")
                # DevEcoAPIScan AffectedApiItem.invokeInstance：实例方法调用时
                # 限定 base 类型（如 'Window'/'UIContext'），用于二次过滤使用点。
                invoke_instance = (a.get("invokeInstance") or "").strip()
                # DevEcoAPIScan AffectedApiItem.completePath：声明文件路径，
                # 用于 isSameArkTsAPI 的路径归一匹配（/component/ets → /component）。
                complete_path = (a.get("completePath") or "").strip()
                # 索引关键词（与参考 index_kb 一致）
                full = f"{cls}.{iface}".strip(".")
                self._add(full, fname, cat)
                self._add(cls, fname, cat)
                if iface:
                    self._add(iface, fname, cat)
                api_name = method_def or full or cls or pkg or title
                decl = self._truncate(title + ("：" + full if full else ""), 200)
                rec = {
                    "category": cat,
                    "fileName": fname,
                    "version": display,
                    "subVersion": sub,
                    "apiVersion": rec_api_ver,
                    "kit": "行为变更",
                    "cls": cls,
                    "iface": iface,
                    "ifaceType": iface_type,
                    "op": ctype,
                    "decl": decl,
                    "apiName": api_name,
                    "changeId": change_id,
                    "url": url,
                    "evidenceUrl": evidence_url,
                    "impact": impact,
                    # DevEcoAPIScan AffectedApiItem 扩展字段（用于精确匹配）：
                    "invokeInstance": invoke_instance,
                    "completePath": complete_path,
                }
                records.append(rec)
                self._index_sig(rec)
        meta = {
            "category": cat,
            "fileName": fname,
            "versionName": display,
            "subVersion": sub,
            "apiVersion": file_api_ver or 0,
            "sizeBytes": os.path.getsize(path),
            "changeCount": len(records),
            "kitCount": len(set(r["cls"] for r in records if r["cls"])),
            "releaseDate": "",
            "sourceUrl": (records[0]["url"] if records else ""),
        }
        return meta, records

    def _index_sig(self, rec: dict):
        """把 apiChange 记录按归一化签名加入 sig_index（精确签名查找）。"""
        sig = self._strip_sig(rec.get("apiName") or "")
        if sig:
            self.sig_index.setdefault(sig, []).append(rec)

    @staticmethod
    def _truncate(s, n=180):
        s = re.sub(r"\s+", " ", (s or "").strip())
        return s if len(s) <= n else s[:n - 1] + "…"

    # ------------------------------------------------------------------
    # 对外接口
    # ------------------------------------------------------------------
    @property
    def all_kb_files(self) -> list[str]:
        return self.scan_order

    @property
    def total_kb_files(self) -> int:
        return len(self.scan_order)

    def dedup_records(self) -> list[dict]:
        """跨文件去重后的全部变更记录（去重键：version/kit/cls/op/decl）。"""
        seen = set()
        out = []
        for recs in self.file_records.values():
            for r in recs:
                key = (r["version"], r["kit"], r["cls"], r["op"], r["decl"])
                if key in seen:
                    continue
                seen.add(key)
                out.append(r)
        return out

    def match_kb_files(self, candidates: list[str]) -> list[str]:
        """按候选关键词收集知识文件相对路径（去重排序）。"""
        files = set()
        for c in candidates:
            if c in self.kb_index:
                files.update(self.kb_index[c])
        return sorted(files) if files else [NOT_FOUND_LABEL]
