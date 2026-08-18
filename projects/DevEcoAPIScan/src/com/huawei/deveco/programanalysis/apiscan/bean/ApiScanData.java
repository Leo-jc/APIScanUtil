/*
 * Decompiled with CFR 0.152.
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

import com.huawei.deveco.programanalysis.apiscan.bean.ApiDisplayItem;
import com.huawei.deveco.programanalysis.apiscan.bean.TreeApiDisplayItem;
import java.util.List;

public class ApiScanData {
    private List<ApiDisplayItem> displayItem;
    private List<TreeApiDisplayItem> tree;
    private String treeSelect;
    private List<String> checkedKeys;

    public ApiScanData(List<ApiDisplayItem> displayItem, List<TreeApiDisplayItem> tree, String treeSelect, List<String> checkedKeys) {
        this.displayItem = displayItem;
        this.tree = tree;
        this.treeSelect = treeSelect;
        this.checkedKeys = checkedKeys;
    }

    public List<ApiDisplayItem> getDisplayItem() {
        return this.displayItem;
    }

    public void setDisplayItem(List<ApiDisplayItem> displayItem) {
        this.displayItem = displayItem;
    }

    public String getTreeSelect() {
        return this.treeSelect;
    }

    public void setTreeSelect(String treeSelect) {
        this.treeSelect = treeSelect;
    }

    public List<TreeApiDisplayItem> getTree() {
        return this.tree;
    }

    public void setTree(List<TreeApiDisplayItem> tree) {
        this.tree = tree;
    }

    public List<String> getCheckedKeys() {
        return this.checkedKeys;
    }

    public void setCheckedKeys(List<String> checkedKeys) {
        this.checkedKeys = checkedKeys;
    }
}

