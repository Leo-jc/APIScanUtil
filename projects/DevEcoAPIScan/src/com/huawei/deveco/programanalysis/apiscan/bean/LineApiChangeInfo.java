/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  lombok.Generated
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

import com.huawei.deveco.programanalysis.apiscan.bean.AffectedApiItem;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiChangeItem;
import lombok.Generated;

public class LineApiChangeInfo {
    String filePath;
    int lineNumber;
    ApiChangeItem apiChangeItem;
    AffectedApiItem affectedApiItem;

    public LineApiChangeInfo(String filePath, int lineNumber, ApiChangeItem apiChangeItem, AffectedApiItem affectedApiItem) {
        this.filePath = filePath;
        this.lineNumber = lineNumber;
        this.apiChangeItem = apiChangeItem;
        this.affectedApiItem = affectedApiItem;
    }

    @Generated
    public String getFilePath() {
        return this.filePath;
    }

    @Generated
    public int getLineNumber() {
        return this.lineNumber;
    }

    @Generated
    public ApiChangeItem getApiChangeItem() {
        return this.apiChangeItem;
    }

    @Generated
    public AffectedApiItem getAffectedApiItem() {
        return this.affectedApiItem;
    }

    @Generated
    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    @Generated
    public void setLineNumber(int lineNumber) {
        this.lineNumber = lineNumber;
    }

    @Generated
    public void setApiChangeItem(ApiChangeItem apiChangeItem) {
        this.apiChangeItem = apiChangeItem;
    }

    @Generated
    public void setAffectedApiItem(AffectedApiItem affectedApiItem) {
        this.affectedApiItem = affectedApiItem;
    }

    @Generated
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof LineApiChangeInfo)) {
            return false;
        }
        LineApiChangeInfo other = (LineApiChangeInfo)o;
        if (!other.canEqual(this)) {
            return false;
        }
        if (this.getLineNumber() != other.getLineNumber()) {
            return false;
        }
        String this$filePath = this.getFilePath();
        String other$filePath = other.getFilePath();
        if (this$filePath == null ? other$filePath != null : !this$filePath.equals(other$filePath)) {
            return false;
        }
        ApiChangeItem this$apiChangeItem = this.getApiChangeItem();
        ApiChangeItem other$apiChangeItem = other.getApiChangeItem();
        if (this$apiChangeItem == null ? other$apiChangeItem != null : !this$apiChangeItem.equals(other$apiChangeItem)) {
            return false;
        }
        AffectedApiItem this$affectedApiItem = this.getAffectedApiItem();
        AffectedApiItem other$affectedApiItem = other.getAffectedApiItem();
        return !(this$affectedApiItem == null ? other$affectedApiItem != null : !((Object)this$affectedApiItem).equals(other$affectedApiItem));
    }

    @Generated
    protected boolean canEqual(Object other) {
        return other instanceof LineApiChangeInfo;
    }

    @Generated
    public int hashCode() {
        int PRIME = 59;
        int result = 1;
        result = result * 59 + this.getLineNumber();
        String $filePath = this.getFilePath();
        result = result * 59 + ($filePath == null ? 43 : $filePath.hashCode());
        ApiChangeItem $apiChangeItem = this.getApiChangeItem();
        result = result * 59 + ($apiChangeItem == null ? 43 : $apiChangeItem.hashCode());
        AffectedApiItem $affectedApiItem = this.getAffectedApiItem();
        result = result * 59 + ($affectedApiItem == null ? 43 : ((Object)$affectedApiItem).hashCode());
        return result;
    }

    @Generated
    public String toString() {
        return "LineApiChangeInfo(filePath=" + this.getFilePath() + ", lineNumber=" + this.getLineNumber() + ", apiChangeItem=" + String.valueOf(this.getApiChangeItem()) + ", affectedApiItem=" + String.valueOf(this.getAffectedApiItem()) + ")";
    }
}

