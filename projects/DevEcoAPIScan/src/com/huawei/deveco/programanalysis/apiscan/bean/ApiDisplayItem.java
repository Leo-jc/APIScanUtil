/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  lombok.Generated
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

import lombok.Generated;

public class ApiDisplayItem {
    private String apiDefinition;
    private String language;
    private String affectedVersions;
    private String location;
    private String tutoringUrl;
    private String sdkVersion;
    private String changeId;
    private String changeTitle;
    private String changeType;
    private String isIsolated;
    private String absolutePath;

    @Generated
    public void setApiDefinition(String apiDefinition) {
        this.apiDefinition = apiDefinition;
    }

    @Generated
    public void setLanguage(String language) {
        this.language = language;
    }

    @Generated
    public void setAffectedVersions(String affectedVersions) {
        this.affectedVersions = affectedVersions;
    }

    @Generated
    public void setLocation(String location) {
        this.location = location;
    }

    @Generated
    public void setTutoringUrl(String tutoringUrl) {
        this.tutoringUrl = tutoringUrl;
    }

    @Generated
    public void setSdkVersion(String sdkVersion) {
        this.sdkVersion = sdkVersion;
    }

    @Generated
    public void setChangeId(String changeId) {
        this.changeId = changeId;
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
    public void setIsIsolated(String isIsolated) {
        this.isIsolated = isIsolated;
    }

    @Generated
    public void setAbsolutePath(String absolutePath) {
        this.absolutePath = absolutePath;
    }

    @Generated
    public String getApiDefinition() {
        return this.apiDefinition;
    }

    @Generated
    public String getLanguage() {
        return this.language;
    }

    @Generated
    public String getAffectedVersions() {
        return this.affectedVersions;
    }

    @Generated
    public String getLocation() {
        return this.location;
    }

    @Generated
    public String getTutoringUrl() {
        return this.tutoringUrl;
    }

    @Generated
    public String getSdkVersion() {
        return this.sdkVersion;
    }

    @Generated
    public String getChangeId() {
        return this.changeId;
    }

    @Generated
    public String getChangeTitle() {
        return this.changeTitle;
    }

    @Generated
    public String getChangeType() {
        return this.changeType;
    }

    @Generated
    public String getIsIsolated() {
        return this.isIsolated;
    }

    @Generated
    public String getAbsolutePath() {
        return this.absolutePath;
    }

    @Generated
    public ApiDisplayItem(String apiDefinition, String language, String affectedVersions, String location, String tutoringUrl, String sdkVersion, String changeId, String changeTitle, String changeType, String isIsolated, String absolutePath) {
        this.apiDefinition = apiDefinition;
        this.language = language;
        this.affectedVersions = affectedVersions;
        this.location = location;
        this.tutoringUrl = tutoringUrl;
        this.sdkVersion = sdkVersion;
        this.changeId = changeId;
        this.changeTitle = changeTitle;
        this.changeType = changeType;
        this.isIsolated = isIsolated;
        this.absolutePath = absolutePath;
    }

    @Generated
    public ApiDisplayItem() {
    }
}

