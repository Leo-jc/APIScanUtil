/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  lombok.Generated
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

import lombok.Generated;

public class ApiChangeCheckStatusItem {
    private String type;
    private String key;
    private String checked;

    @Generated
    public String getType() {
        return this.type;
    }

    @Generated
    public String getKey() {
        return this.key;
    }

    @Generated
    public String getChecked() {
        return this.checked;
    }

    @Generated
    public void setType(String type) {
        this.type = type;
    }

    @Generated
    public void setKey(String key) {
        this.key = key;
    }

    @Generated
    public void setChecked(String checked) {
        this.checked = checked;
    }

    @Generated
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof ApiChangeCheckStatusItem)) {
            return false;
        }
        ApiChangeCheckStatusItem other = (ApiChangeCheckStatusItem)o;
        if (!other.canEqual(this)) {
            return false;
        }
        String this$type = this.getType();
        String other$type = other.getType();
        if (this$type == null ? other$type != null : !this$type.equals(other$type)) {
            return false;
        }
        String this$key = this.getKey();
        String other$key = other.getKey();
        if (this$key == null ? other$key != null : !this$key.equals(other$key)) {
            return false;
        }
        String this$checked = this.getChecked();
        String other$checked = other.getChecked();
        return !(this$checked == null ? other$checked != null : !this$checked.equals(other$checked));
    }

    @Generated
    protected boolean canEqual(Object other) {
        return other instanceof ApiChangeCheckStatusItem;
    }

    @Generated
    public int hashCode() {
        int PRIME = 59;
        int result = 1;
        String $type = this.getType();
        result = result * 59 + ($type == null ? 43 : $type.hashCode());
        String $key = this.getKey();
        result = result * 59 + ($key == null ? 43 : $key.hashCode());
        String $checked = this.getChecked();
        result = result * 59 + ($checked == null ? 43 : $checked.hashCode());
        return result;
    }

    @Generated
    public String toString() {
        return "ApiChangeCheckStatusItem(type=" + this.getType() + ", key=" + this.getKey() + ", checked=" + this.getChecked() + ")";
    }

    @Generated
    public ApiChangeCheckStatusItem(String type, String key, String checked) {
        this.type = type;
        this.key = key;
        this.checked = checked;
    }
}

