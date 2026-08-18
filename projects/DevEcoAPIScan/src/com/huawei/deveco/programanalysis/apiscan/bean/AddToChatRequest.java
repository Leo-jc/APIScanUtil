/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  lombok.Generated
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

import com.huawei.deveco.programanalysis.apiscan.bean.ApiChangeFixPrompt;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiDisplayItem;
import java.util.List;
import lombok.Generated;

public class AddToChatRequest {
    ApiChangeFixPrompt prompt;
    String filePath;
    List<ApiDisplayItem> apiDisplayItems;

    @Generated
    public ApiChangeFixPrompt getPrompt() {
        return this.prompt;
    }

    @Generated
    public String getFilePath() {
        return this.filePath;
    }

    @Generated
    public List<ApiDisplayItem> getApiDisplayItems() {
        return this.apiDisplayItems;
    }

    @Generated
    public void setPrompt(ApiChangeFixPrompt prompt) {
        this.prompt = prompt;
    }

    @Generated
    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    @Generated
    public void setApiDisplayItems(List<ApiDisplayItem> apiDisplayItems) {
        this.apiDisplayItems = apiDisplayItems;
    }

    @Generated
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof AddToChatRequest)) {
            return false;
        }
        AddToChatRequest other = (AddToChatRequest)o;
        if (!other.canEqual(this)) {
            return false;
        }
        ApiChangeFixPrompt this$prompt = this.getPrompt();
        ApiChangeFixPrompt other$prompt = other.getPrompt();
        if (this$prompt == null ? other$prompt != null : !((Object)this$prompt).equals(other$prompt)) {
            return false;
        }
        String this$filePath = this.getFilePath();
        String other$filePath = other.getFilePath();
        if (this$filePath == null ? other$filePath != null : !this$filePath.equals(other$filePath)) {
            return false;
        }
        List<ApiDisplayItem> this$apiDisplayItems = this.getApiDisplayItems();
        List<ApiDisplayItem> other$apiDisplayItems = other.getApiDisplayItems();
        return !(this$apiDisplayItems == null ? other$apiDisplayItems != null : !((Object)this$apiDisplayItems).equals(other$apiDisplayItems));
    }

    @Generated
    protected boolean canEqual(Object other) {
        return other instanceof AddToChatRequest;
    }

    @Generated
    public int hashCode() {
        int PRIME = 59;
        int result = 1;
        ApiChangeFixPrompt $prompt = this.getPrompt();
        result = result * 59 + ($prompt == null ? 43 : ((Object)$prompt).hashCode());
        String $filePath = this.getFilePath();
        result = result * 59 + ($filePath == null ? 43 : $filePath.hashCode());
        List<ApiDisplayItem> $apiDisplayItems = this.getApiDisplayItems();
        result = result * 59 + ($apiDisplayItems == null ? 43 : ((Object)$apiDisplayItems).hashCode());
        return result;
    }

    @Generated
    public String toString() {
        return "AddToChatRequest(prompt=" + String.valueOf(this.getPrompt()) + ", filePath=" + this.getFilePath() + ", apiDisplayItems=" + String.valueOf(this.getApiDisplayItems()) + ")";
    }

    @Generated
    public AddToChatRequest(ApiChangeFixPrompt prompt, String filePath, List<ApiDisplayItem> apiDisplayItems) {
        this.prompt = prompt;
        this.filePath = filePath;
        this.apiDisplayItems = apiDisplayItems;
    }
}

