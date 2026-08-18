/*
 * Decompiled with CFR 0.152.
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

import java.util.ArrayList;
import java.util.List;

public class ModuleNode {
    private String key;
    private String value;
    private String title;
    private List<ModuleNode> children;

    public ModuleNode(String value, String key, String title) {
        this.value = value;
        this.key = key;
        this.title = title;
        this.children = new ArrayList<ModuleNode>();
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getKey() {
        return this.key;
    }

    public String getValue() {
        return this.value;
    }

    public String getTitle() {
        return this.title;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<ModuleNode> getChildren() {
        return this.children;
    }

    public void setChildren(List<ModuleNode> children) {
        this.children = children;
    }
}

