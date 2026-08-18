/*
 * Decompiled with CFR 0.152.
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

public enum ProcessStatusEnum {
    STARTED("start"),
    PROCESSING_ARK_TS("processArkTs"),
    PROCESSING_CPP("processCpp"),
    FINISHED("end"),
    FAILED("failed");

    private final String description;

    private ProcessStatusEnum(String description) {
        this.description = description;
    }

    public String getDescription() {
        return this.description;
    }
}

