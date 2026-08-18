/*
 * Decompiled with CFR 0.152.
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

import java.util.List;

public record ApiScanParam(String startVersion, String endVersion, List<String> modulePaths, int pageSize, boolean cancel) {
}

