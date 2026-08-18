/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  lombok.Generated
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

import lombok.Generated;

public class GetLocationParam {
    String changeID;
    String methodDefinition;
    int page;
    int pageSize;

    @Generated
    public GetLocationParam() {
    }

    @Generated
    public String getChangeID() {
        return this.changeID;
    }

    @Generated
    public String getMethodDefinition() {
        return this.methodDefinition;
    }

    @Generated
    public int getPage() {
        return this.page;
    }

    @Generated
    public int getPageSize() {
        return this.pageSize;
    }

    @Generated
    public void setChangeID(String changeID) {
        this.changeID = changeID;
    }

    @Generated
    public void setMethodDefinition(String methodDefinition) {
        this.methodDefinition = methodDefinition;
    }

    @Generated
    public void setPage(int page) {
        this.page = page;
    }

    @Generated
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    @Generated
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof GetLocationParam)) {
            return false;
        }
        GetLocationParam other = (GetLocationParam)o;
        if (!other.canEqual(this)) {
            return false;
        }
        if (this.getPage() != other.getPage()) {
            return false;
        }
        if (this.getPageSize() != other.getPageSize()) {
            return false;
        }
        String this$changeID = this.getChangeID();
        String other$changeID = other.getChangeID();
        if (this$changeID == null ? other$changeID != null : !this$changeID.equals(other$changeID)) {
            return false;
        }
        String this$methodDefinition = this.getMethodDefinition();
        String other$methodDefinition = other.getMethodDefinition();
        return !(this$methodDefinition == null ? other$methodDefinition != null : !this$methodDefinition.equals(other$methodDefinition));
    }

    @Generated
    protected boolean canEqual(Object other) {
        return other instanceof GetLocationParam;
    }

    @Generated
    public int hashCode() {
        int PRIME = 59;
        int result = 1;
        result = result * 59 + this.getPage();
        result = result * 59 + this.getPageSize();
        String $changeID = this.getChangeID();
        result = result * 59 + ($changeID == null ? 43 : $changeID.hashCode());
        String $methodDefinition = this.getMethodDefinition();
        result = result * 59 + ($methodDefinition == null ? 43 : $methodDefinition.hashCode());
        return result;
    }

    @Generated
    public String toString() {
        return "GetLocationParam(changeID=" + this.getChangeID() + ", methodDefinition=" + this.getMethodDefinition() + ", page=" + this.getPage() + ", pageSize=" + this.getPageSize() + ")";
    }
}

