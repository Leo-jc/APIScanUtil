/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  lombok.Generated
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

import com.huawei.deveco.programanalysis.apiscan.bean.AffectedApiItem;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiDisplayItem;
import com.huawei.deveco.programanalysis.apiscan.resources.HosProjectMgmtBundle;
import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import lombok.Generated;

public class ApiChangeItem {
    private static final Map<String, String> CHANGETYPE_MESSAGE = new ConcurrentHashMap<String, String>(Map.ofEntries(Map.entry("UX\u89c6\u89c9\u5e03\u5c40\u53d8\u66f4", HosProjectMgmtBundle.message("api.change.assistant.changeType.visualLayoutChange", new Object[0])), Map.entry("UX\u4ea4\u4e92\u884c\u4e3a\u53d8\u66f4", HosProjectMgmtBundle.message("api.change.assistant.changeType.interactionBehaviorChange", new Object[0])), Map.entry("\u63a5\u53e3\u884c\u4e3a\u53d8\u66f4", HosProjectMgmtBundle.message("api.change.assistant.changeType.apiBehaviorChange", new Object[0])), Map.entry("\u5220\u9664\u53d8\u66f4", HosProjectMgmtBundle.message("api.change.assistant.changeType.changesDeletion", new Object[0])), Map.entry("\u63a5\u53e3\u5b9a\u4e49\u53d8\u66f4", HosProjectMgmtBundle.message("api.change.assistant.changeType.apiDefinitionChange", new Object[0])), Map.entry("\u63a5\u53e3\u5e9f\u5f03\u53d8\u66f4", HosProjectMgmtBundle.message("api.change.assistant.changeType.apiChangeDeprecation", new Object[0]))));
    private boolean isPresent = false;
    private ArrayList<AffectedApiItem> affectedApis = new ArrayList();
    private InterfaceChange interfaceChanges = new InterfaceChange();

    @Generated
    public void setPresent(boolean isPresent) {
        this.isPresent = isPresent;
    }

    @Generated
    public void setAffectedApis(ArrayList<AffectedApiItem> affectedApis) {
        this.affectedApis = affectedApis;
    }

    @Generated
    public void setInterfaceChanges(InterfaceChange interfaceChanges) {
        this.interfaceChanges = interfaceChanges;
    }

    @Generated
    public boolean isPresent() {
        return this.isPresent;
    }

    @Generated
    public ArrayList<AffectedApiItem> getAffectedApis() {
        return this.affectedApis;
    }

    @Generated
    public InterfaceChange getInterfaceChanges() {
        return this.interfaceChanges;
    }

    public static class InterfaceChange {
        private String apiVersion = "";
        private String changeReasonCategory = "";
        private String id = "";
        private String url = "";
        private String sdkVersion = "";
        private String apiEffectiveVersion = "";
        private String changeTitle = "";
        private String changeType = "";

        public ApiDisplayItem toApiDisplayItem() {
            ApiDisplayItem apiDisplayItem = new ApiDisplayItem();
            apiDisplayItem.setSdkVersion(this.sdkVersion);
            apiDisplayItem.setChangeTitle(this.changeTitle);
            apiDisplayItem.setChangeType(CHANGETYPE_MESSAGE.get(this.changeType));
            return apiDisplayItem;
        }

        @Generated
        public void setApiVersion(String apiVersion) {
            this.apiVersion = apiVersion;
        }

        @Generated
        public void setChangeReasonCategory(String changeReasonCategory) {
            this.changeReasonCategory = changeReasonCategory;
        }

        @Generated
        public void setId(String id) {
            this.id = id;
        }

        @Generated
        public void setUrl(String url) {
            this.url = url;
        }

        @Generated
        public void setSdkVersion(String sdkVersion) {
            this.sdkVersion = sdkVersion;
        }

        @Generated
        public void setApiEffectiveVersion(String apiEffectiveVersion) {
            this.apiEffectiveVersion = apiEffectiveVersion;
        }

        @Generated
        public void setChangeTitle(String changeTitle) {
            this.changeTitle = changeTitle;
        }

        @Generated
        public void setChangeType(String changeType) {
            this.changeType = changeType;
        }

        @Generated
        public String getApiVersion() {
            return this.apiVersion;
        }

        @Generated
        public String getChangeReasonCategory() {
            return this.changeReasonCategory;
        }

        @Generated
        public String getId() {
            return this.id;
        }

        @Generated
        public String getUrl() {
            return this.url;
        }

        @Generated
        public String getSdkVersion() {
            return this.sdkVersion;
        }

        @Generated
        public String getApiEffectiveVersion() {
            return this.apiEffectiveVersion;
        }

        @Generated
        public String getChangeTitle() {
            return this.changeTitle;
        }

        @Generated
        public String getChangeType() {
            return this.changeType;
        }
    }
}

