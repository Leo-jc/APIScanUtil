/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  lombok.Generated
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

import lombok.Generated;

public class ApiChangeFilterParams {
    private String changeType;
    private String searchValue;
    private String apiVersion;
    private String changeId;
    private String language;
    private String apiId;
    private String fixStatus;
    private int pageSize = 20;

    @Generated
    public void setChangeType(String changeType) {
        this.changeType = changeType;
    }

    @Generated
    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    @Generated
    public void setApiVersion(String apiVersion) {
        this.apiVersion = apiVersion;
    }

    @Generated
    public void setChangeId(String changeId) {
        this.changeId = changeId;
    }

    @Generated
    public void setLanguage(String language) {
        this.language = language;
    }

    @Generated
    public void setApiId(String apiId) {
        this.apiId = apiId;
    }

    @Generated
    public void setFixStatus(String fixStatus) {
        this.fixStatus = fixStatus;
    }

    @Generated
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    @Generated
    public String getChangeType() {
        return this.changeType;
    }

    @Generated
    public String getSearchValue() {
        return this.searchValue;
    }

    @Generated
    public String getApiVersion() {
        return this.apiVersion;
    }

    @Generated
    public String getChangeId() {
        return this.changeId;
    }

    @Generated
    public String getLanguage() {
        return this.language;
    }

    @Generated
    public String getApiId() {
        return this.apiId;
    }

    @Generated
    public String getFixStatus() {
        return this.fixStatus;
    }

    @Generated
    public int getPageSize() {
        return this.pageSize;
    }
}

