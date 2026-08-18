/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  lombok.Generated
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

import com.huawei.deveco.programanalysis.apiscan.bean.ApiDisplayItem;
import java.util.ArrayList;
import java.util.List;
import lombok.Generated;

public class TreeApiDisplayItem {
    private String changeType;
    private String title;
    private String subtitle;
    private String key;
    private String type;
    private boolean checkable;
    private String url;
    private ApiDisplayItem apiDisplayItem = null;
    private String checked;
    private String changeTitle;
    private String isIsolated;
    private int childrenCount;
    private List<TreeApiDisplayItem> children;

    public static List<TreeApiDisplayItem> getAllLeafNodes(TreeApiDisplayItem root) {
        ArrayList<TreeApiDisplayItem> leafNodes = new ArrayList<TreeApiDisplayItem>();
        TreeApiDisplayItem.traverseTree(root, leafNodes);
        return leafNodes;
    }

    private static void traverseTree(TreeApiDisplayItem node, List<TreeApiDisplayItem> leafNodes) {
        if (node.getChildren() == null || node.getChildren().isEmpty()) {
            leafNodes.add(node);
            return;
        }
        for (TreeApiDisplayItem child : node.getChildren()) {
            TreeApiDisplayItem.traverseTree(child, leafNodes);
        }
    }

    @Generated
    public static TreeApiDisplayItemBuilder builder() {
        return new TreeApiDisplayItemBuilder();
    }

    @Generated
    public void setChangeType(String changeType) {
        this.changeType = changeType;
    }

    @Generated
    public void setTitle(String title) {
        this.title = title;
    }

    @Generated
    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    @Generated
    public void setKey(String key) {
        this.key = key;
    }

    @Generated
    public void setType(String type) {
        this.type = type;
    }

    @Generated
    public void setCheckable(boolean checkable) {
        this.checkable = checkable;
    }

    @Generated
    public void setUrl(String url) {
        this.url = url;
    }

    @Generated
    public void setApiDisplayItem(ApiDisplayItem apiDisplayItem) {
        this.apiDisplayItem = apiDisplayItem;
    }

    @Generated
    public void setChecked(String checked) {
        this.checked = checked;
    }

    @Generated
    public void setChangeTitle(String changeTitle) {
        this.changeTitle = changeTitle;
    }

    @Generated
    public void setIsIsolated(String isIsolated) {
        this.isIsolated = isIsolated;
    }

    @Generated
    public void setChildrenCount(int childrenCount) {
        this.childrenCount = childrenCount;
    }

    @Generated
    public void setChildren(List<TreeApiDisplayItem> children) {
        this.children = children;
    }

    @Generated
    public String getChangeType() {
        return this.changeType;
    }

    @Generated
    public String getTitle() {
        return this.title;
    }

    @Generated
    public String getSubtitle() {
        return this.subtitle;
    }

    @Generated
    public String getKey() {
        return this.key;
    }

    @Generated
    public String getType() {
        return this.type;
    }

    @Generated
    public boolean isCheckable() {
        return this.checkable;
    }

    @Generated
    public String getUrl() {
        return this.url;
    }

    @Generated
    public ApiDisplayItem getApiDisplayItem() {
        return this.apiDisplayItem;
    }

    @Generated
    public String getChecked() {
        return this.checked;
    }

    @Generated
    public String getChangeTitle() {
        return this.changeTitle;
    }

    @Generated
    public String getIsIsolated() {
        return this.isIsolated;
    }

    @Generated
    public int getChildrenCount() {
        return this.childrenCount;
    }

    @Generated
    public List<TreeApiDisplayItem> getChildren() {
        return this.children;
    }

    @Generated
    public TreeApiDisplayItem() {
    }

    @Generated
    public TreeApiDisplayItem(String changeType, String title, String subtitle, String key, String type, boolean checkable, String url, ApiDisplayItem apiDisplayItem, String checked, String changeTitle, String isIsolated, int childrenCount, List<TreeApiDisplayItem> children) {
        this.changeType = changeType;
        this.title = title;
        this.subtitle = subtitle;
        this.key = key;
        this.type = type;
        this.checkable = checkable;
        this.url = url;
        this.apiDisplayItem = apiDisplayItem;
        this.checked = checked;
        this.changeTitle = changeTitle;
        this.isIsolated = isIsolated;
        this.childrenCount = childrenCount;
        this.children = children;
    }

    @Generated
    public static class TreeApiDisplayItemBuilder {
        @Generated
        private String changeType;
        @Generated
        private String title;
        @Generated
        private String subtitle;
        @Generated
        private String key;
        @Generated
        private String type;
        @Generated
        private boolean checkable;
        @Generated
        private String url;
        @Generated
        private ApiDisplayItem apiDisplayItem;
        @Generated
        private String checked;
        @Generated
        private String changeTitle;
        @Generated
        private String isIsolated;
        @Generated
        private int childrenCount;
        @Generated
        private List<TreeApiDisplayItem> children;

        @Generated
        TreeApiDisplayItemBuilder() {
        }

        @Generated
        public TreeApiDisplayItemBuilder changeType(String changeType) {
            this.changeType = changeType;
            return this;
        }

        @Generated
        public TreeApiDisplayItemBuilder title(String title) {
            this.title = title;
            return this;
        }

        @Generated
        public TreeApiDisplayItemBuilder subtitle(String subtitle) {
            this.subtitle = subtitle;
            return this;
        }

        @Generated
        public TreeApiDisplayItemBuilder key(String key) {
            this.key = key;
            return this;
        }

        @Generated
        public TreeApiDisplayItemBuilder type(String type) {
            this.type = type;
            return this;
        }

        @Generated
        public TreeApiDisplayItemBuilder checkable(boolean checkable) {
            this.checkable = checkable;
            return this;
        }

        @Generated
        public TreeApiDisplayItemBuilder url(String url) {
            this.url = url;
            return this;
        }

        @Generated
        public TreeApiDisplayItemBuilder apiDisplayItem(ApiDisplayItem apiDisplayItem) {
            this.apiDisplayItem = apiDisplayItem;
            return this;
        }

        @Generated
        public TreeApiDisplayItemBuilder checked(String checked) {
            this.checked = checked;
            return this;
        }

        @Generated
        public TreeApiDisplayItemBuilder changeTitle(String changeTitle) {
            this.changeTitle = changeTitle;
            return this;
        }

        @Generated
        public TreeApiDisplayItemBuilder isIsolated(String isIsolated) {
            this.isIsolated = isIsolated;
            return this;
        }

        @Generated
        public TreeApiDisplayItemBuilder childrenCount(int childrenCount) {
            this.childrenCount = childrenCount;
            return this;
        }

        @Generated
        public TreeApiDisplayItemBuilder children(List<TreeApiDisplayItem> children) {
            this.children = children;
            return this;
        }

        @Generated
        public TreeApiDisplayItem build() {
            return new TreeApiDisplayItem(this.changeType, this.title, this.subtitle, this.key, this.type, this.checkable, this.url, this.apiDisplayItem, this.checked, this.changeTitle, this.isIsolated, this.childrenCount, this.children);
        }

        @Generated
        public String toString() {
            return "TreeApiDisplayItem.TreeApiDisplayItemBuilder(changeType=" + this.changeType + ", title=" + this.title + ", subtitle=" + this.subtitle + ", key=" + this.key + ", type=" + this.type + ", checkable=" + this.checkable + ", url=" + this.url + ", apiDisplayItem=" + String.valueOf(this.apiDisplayItem) + ", checked=" + this.checked + ", changeTitle=" + this.changeTitle + ", isIsolated=" + this.isIsolated + ", childrenCount=" + this.childrenCount + ", children=" + String.valueOf(this.children) + ")";
        }
    }
}

