/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  lombok.Generated
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

import lombok.Generated;

public class ApiChangeFixPrompt {
    String description;
    String changeId;
    String additionPrompt;

    @Generated
    public String getDescription() {
        return this.description;
    }

    @Generated
    public String getChangeId() {
        return this.changeId;
    }

    @Generated
    public String getAdditionPrompt() {
        return this.additionPrompt;
    }

    @Generated
    public void setDescription(String description) {
        this.description = description;
    }

    @Generated
    public void setChangeId(String changeId) {
        this.changeId = changeId;
    }

    @Generated
    public void setAdditionPrompt(String additionPrompt) {
        this.additionPrompt = additionPrompt;
    }

    @Generated
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof ApiChangeFixPrompt)) {
            return false;
        }
        ApiChangeFixPrompt other = (ApiChangeFixPrompt)o;
        if (!other.canEqual(this)) {
            return false;
        }
        String this$description = this.getDescription();
        String other$description = other.getDescription();
        if (this$description == null ? other$description != null : !this$description.equals(other$description)) {
            return false;
        }
        String this$changeId = this.getChangeId();
        String other$changeId = other.getChangeId();
        if (this$changeId == null ? other$changeId != null : !this$changeId.equals(other$changeId)) {
            return false;
        }
        String this$additionPrompt = this.getAdditionPrompt();
        String other$additionPrompt = other.getAdditionPrompt();
        return !(this$additionPrompt == null ? other$additionPrompt != null : !this$additionPrompt.equals(other$additionPrompt));
    }

    @Generated
    protected boolean canEqual(Object other) {
        return other instanceof ApiChangeFixPrompt;
    }

    @Generated
    public int hashCode() {
        int PRIME = 59;
        int result = 1;
        String $description = this.getDescription();
        result = result * 59 + ($description == null ? 43 : $description.hashCode());
        String $changeId = this.getChangeId();
        result = result * 59 + ($changeId == null ? 43 : $changeId.hashCode());
        String $additionPrompt = this.getAdditionPrompt();
        result = result * 59 + ($additionPrompt == null ? 43 : $additionPrompt.hashCode());
        return result;
    }

    @Generated
    public String toString() {
        return "ApiChangeFixPrompt(description=" + this.getDescription() + ", changeId=" + this.getChangeId() + ", additionPrompt=" + this.getAdditionPrompt() + ")";
    }

    @Generated
    public ApiChangeFixPrompt(String description, String changeId, String additionPrompt) {
        this.description = description;
        this.changeId = changeId;
        this.additionPrompt = additionPrompt;
    }
}

