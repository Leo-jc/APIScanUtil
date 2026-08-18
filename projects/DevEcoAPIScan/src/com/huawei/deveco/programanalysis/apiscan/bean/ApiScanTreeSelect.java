/*
 * Decompiled with CFR 0.152.
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

import java.util.List;

public class ApiScanTreeSelect {
    private String id;
    private List<ApiScanTreeSelect> children;

    public ApiScanTreeSelect(String id, List<ApiScanTreeSelect> children) {
        this.id = id;
        this.children = children;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<ApiScanTreeSelect> getChildren() {
        return this.children;
    }

    public void setChildren(List<ApiScanTreeSelect> children) {
        this.children = children;
    }
}

