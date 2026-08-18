/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.alibaba.fastjson2.JSONArray
 *  com.alibaba.fastjson2.JSONObject
 *  com.huawei.deveco.projectmgmt.ohos.utils.TraceUtils
 */
package com.huawei.deveco.programanalysis.apiscan;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.huawei.deveco.programanalysis.apiscan.ApiScanConfigs;
import com.huawei.deveco.projectmgmt.ohos.utils.TraceUtils;

public class ApiChangeAssistantTraceUtil {
    private static final String API_CHANGE_ASSISTANT_ACTION = "api_change_assistant";
    private static final String API_CHANGE_SOURCE_VERSION_ACTION = "APIChangeAssistant";
    private static final String API_CHANGE_TRACE_DATA_VERSION = "1.0.0";

    public static void traceUsage() {
        TraceUtils.traceUsage((String)API_CHANGE_ASSISTANT_ACTION);
    }

    public static void traceSourceVersion(String sourceModelVersion, String targetModelVersion, JSONObject scanCppDetail, JSONObject scanArkTSDetail) {
        JSONObject meta = new JSONObject();
        meta.put((Object)"version", (Object)API_CHANGE_TRACE_DATA_VERSION);
        JSONArray detail = new JSONArray();
        detail.add((Object)scanCppDetail);
        detail.add((Object)scanArkTSDetail);
        JSONObject data = new JSONObject();
        data.put((Object)"srcModelVersion", (Object)sourceModelVersion);
        data.put((Object)"targetAPIVersion", (Object)targetModelVersion);
        data.put((Object)"maxMemory", (Object)ApiScanConfigs.getMaxOldSpaceSize());
        data.put((Object)"detail", (Object)detail);
        JSONObject result = new JSONObject();
        result.put((Object)"meta", (Object)meta);
        result.put((Object)"data", (Object)data);
        TraceUtils.trace((String)API_CHANGE_SOURCE_VERSION_ACTION, (JSONObject)result);
    }
}

