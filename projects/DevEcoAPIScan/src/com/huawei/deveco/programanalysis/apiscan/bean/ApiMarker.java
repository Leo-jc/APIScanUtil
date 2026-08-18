/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.intellij.openapi.editor.RangeMarker
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

import com.huawei.deveco.programanalysis.apiscan.bean.ApiDisplayItem;
import com.intellij.openapi.editor.RangeMarker;

public class ApiMarker {
    private RangeMarker rangeMarker;
    private String filePath;
    private int oldLineNumber;
    private ApiDisplayItem apiDisplayItem;

    public ApiMarker(RangeMarker rangeMarker, String filePath, int oldLineNumber, ApiDisplayItem apiDisplayItem) {
        this.rangeMarker = rangeMarker;
        this.filePath = filePath;
        this.oldLineNumber = oldLineNumber;
        this.apiDisplayItem = apiDisplayItem;
    }

    public RangeMarker getRangeMarker() {
        return this.rangeMarker;
    }

    public void setRangeMarker(RangeMarker rangeMarker) {
        this.rangeMarker = rangeMarker;
    }

    public String getFilePath() {
        return this.filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public int getOldLineNumber() {
        return this.oldLineNumber;
    }

    public void setOldLineNumber(int oldLineNumber) {
        this.oldLineNumber = oldLineNumber;
    }

    public ApiDisplayItem getApiDisplayItem() {
        return this.apiDisplayItem;
    }

    public void setApiDisplayItem(ApiDisplayItem apiDisplayItem) {
        this.apiDisplayItem = apiDisplayItem;
    }
}

