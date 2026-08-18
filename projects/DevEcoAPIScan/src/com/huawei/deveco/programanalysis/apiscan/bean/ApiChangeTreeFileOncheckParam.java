/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  lombok.Generated
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

import lombok.Generated;

public class ApiChangeTreeFileOncheckParam {
    private String filePath;
    private String key;
    private String checked;
    private String type;

    @Generated
    public ApiChangeTreeFileOncheckParam() {
    }

    @Generated
    public String getFilePath() {
        return this.filePath;
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
    public String getType() {
        return this.type;
    }

    @Generated
    public void setFilePath(String filePath) {
        this.filePath = filePath;
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
    public void setType(String type) {
        this.type = type;
    }

    @Generated
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof ApiChangeTreeFileOncheckParam)) {
            return false;
        }
        ApiChangeTreeFileOncheckParam other = (ApiChangeTreeFileOncheckParam)o;
        if (!other.canEqual(this)) {
            return false;
        }
        String this$filePath = this.getFilePath();
        String other$filePath = other.getFilePath();
        if (this$filePath == null ? other$filePath != null : !this$filePath.equals(other$filePath)) {
            return false;
        }
        String this$key = this.getKey();
        String other$key = other.getKey();
        if (this$key == null ? other$key != null : !this$key.equals(other$key)) {
            return false;
        }
        String this$checked = this.getChecked();
        String other$checked = other.getChecked();
        if (this$checked == null ? other$checked != null : !this$checked.equals(other$checked)) {
            return false;
        }
        String this$type = this.getType();
        String other$type = other.getType();
        return !(this$type == null ? other$type != null : !this$type.equals(other$type));
    }

    @Generated
    protected boolean canEqual(Object other) {
        return other instanceof ApiChangeTreeFileOncheckParam;
    }

    @Generated
    public int hashCode() {
        int PRIME = 59;
        int result = 1;
        String $filePath = this.getFilePath();
        result = result * 59 + ($filePath == null ? 43 : $filePath.hashCode());
        String $key = this.getKey();
        result = result * 59 + ($key == null ? 43 : $key.hashCode());
        String $checked = this.getChecked();
        result = result * 59 + ($checked == null ? 43 : $checked.hashCode());
        String $type = this.getType();
        result = result * 59 + ($type == null ? 43 : $type.hashCode());
        return result;
    }

    @Generated
    public String toString() {
        return "ApiChangeTreeFileOncheckParam(filePath=" + this.getFilePath() + ", key=" + this.getKey() + ", checked=" + this.getChecked() + ", type=" + this.getType() + ")";
    }
}

