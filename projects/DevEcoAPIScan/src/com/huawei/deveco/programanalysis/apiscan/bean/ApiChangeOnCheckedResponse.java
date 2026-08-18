/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  lombok.Generated
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

import com.huawei.deveco.programanalysis.apiscan.bean.ApiChangeCheckStatusItem;
import java.util.ArrayList;
import java.util.List;
import lombok.Generated;

public class ApiChangeOnCheckedResponse {
    private List<ApiChangeCheckStatusItem> itemsNeededUpdate = new ArrayList<ApiChangeCheckStatusItem>();

    @Generated
    public ApiChangeOnCheckedResponse() {
    }

    @Generated
    public List<ApiChangeCheckStatusItem> getItemsNeededUpdate() {
        return this.itemsNeededUpdate;
    }

    @Generated
    public void setItemsNeededUpdate(List<ApiChangeCheckStatusItem> itemsNeededUpdate) {
        this.itemsNeededUpdate = itemsNeededUpdate;
    }

    @Generated
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof ApiChangeOnCheckedResponse)) {
            return false;
        }
        ApiChangeOnCheckedResponse other = (ApiChangeOnCheckedResponse)o;
        if (!other.canEqual(this)) {
            return false;
        }
        List<ApiChangeCheckStatusItem> this$itemsNeededUpdate = this.getItemsNeededUpdate();
        List<ApiChangeCheckStatusItem> other$itemsNeededUpdate = other.getItemsNeededUpdate();
        return !(this$itemsNeededUpdate == null ? other$itemsNeededUpdate != null : !((Object)this$itemsNeededUpdate).equals(other$itemsNeededUpdate));
    }

    @Generated
    protected boolean canEqual(Object other) {
        return other instanceof ApiChangeOnCheckedResponse;
    }

    @Generated
    public int hashCode() {
        int PRIME = 59;
        int result = 1;
        List<ApiChangeCheckStatusItem> $itemsNeededUpdate = this.getItemsNeededUpdate();
        result = result * 59 + ($itemsNeededUpdate == null ? 43 : ((Object)$itemsNeededUpdate).hashCode());
        return result;
    }

    @Generated
    public String toString() {
        return "ApiChangeOnCheckedResponse(itemsNeededUpdate=" + String.valueOf(this.getItemsNeededUpdate()) + ")";
    }
}

