/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.alibaba.fastjson2.JSON
 *  com.alibaba.fastjson2.JSONException
 *  com.alibaba.fastjson2.JSONObject
 *  com.huawei.deveco.projectmgmt.ohos.cef.CefQueryHandler
 *  com.intellij.openapi.diagnostic.Logger
 *  com.intellij.openapi.project.Project
 *  com.intellij.openapi.util.Pair
 *  com.intellij.util.ResourceUtil
 *  org.cef.callback.CefQueryCallback
 *  org.jetbrains.annotations.NotNull
 */
package com.huawei.deveco.programanalysis.apiscan.handler;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONException;
import com.alibaba.fastjson2.JSONObject;
import com.huawei.deveco.programanalysis.apiscan.ApiChangeAssistantFactory;
import com.huawei.deveco.programanalysis.apiscan.ApiChangeLineTracker;
import com.huawei.deveco.programanalysis.apiscan.bean.AddToChatRequest;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiChangeFixPrompt;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiDisplayItem;
import com.huawei.deveco.programanalysis.apiscan.handler.utils.ApiChangeIntelligentService;
import com.huawei.deveco.projectmgmt.ohos.cef.CefQueryHandler;
import com.intellij.openapi.diagnostic.Logger;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Pair;
import com.intellij.util.ResourceUtil;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.cef.callback.CefQueryCallback;
import org.jetbrains.annotations.NotNull;

public class ApiChangeAddToChatHandler
implements CefQueryHandler {
    private static final int EXIT_CODE_JSON_FAILED = 2;
    private static final int SERVICE_NOT_AVAILABLE = -1;
    private static final Logger LOGGER = Logger.getInstance(ApiChangeAddToChatHandler.class);
    private static final String FILE_NODE_TYPE = "fileNode";
    private static final String API_CHANGE_FIX_PROMPTS_PATH = "apiChangeDescription/apiChangePrompts.json";
    private static final ApiChangeFixPrompt API_CHANGE_DEFAULT_PROMPT = new ApiChangeFixPrompt("", "", "");
    private static Map<String, ApiChangeFixPrompt> apiChangeFixPromptsMap;
    private final Project project;

    public ApiChangeAddToChatHandler(@NotNull Project project) {
        if (project == null) {
            ApiChangeAddToChatHandler.$$$reportNull$$$0(0);
        }
        this.project = project;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    private static List<ApiChangeFixPrompt> readApiChangePrompts() {
        try (InputStream inputStream = ApiChangeAddToChatHandler.class.getClassLoader().getResourceAsStream(API_CHANGE_FIX_PROMPTS_PATH);){
            if (inputStream == null) {
                LOGGER.info("input stream of resource api change prompts json file is null");
                ArrayList<ApiChangeFixPrompt> arrayList = new ArrayList<ApiChangeFixPrompt>();
                return arrayList;
            }
            String promptsText = ResourceUtil.loadText((InputStream)inputStream);
            List apiChangeFixPrompts = JSON.parseArray((String)promptsText, ApiChangeFixPrompt.class);
            if (apiChangeFixPrompts == null) {
                LOGGER.info("apiChangeFixPrompts is null");
                ArrayList<ApiChangeFixPrompt> arrayList = new ArrayList<ApiChangeFixPrompt>();
                return arrayList;
            }
            List list = apiChangeFixPrompts;
            return list;
        }
        catch (JSONException | IOException exception) {
            LOGGER.warn("read api change prompts file failed.");
            return new ArrayList<ApiChangeFixPrompt>();
        }
    }

    private List<ApiDisplayItem> getApiDisplayItemsToAsk(String changId, String apiDefinition, String filePath) {
        List<ApiDisplayItem> apiDisplayItems = ApiChangeAssistantFactory.getApiDisplayItemMap().get(this.project.getBasePath());
        return apiDisplayItems.stream().filter(apiDisplayItem -> apiDisplayItem.getChangeId().equals(changId) && apiDisplayItem.getApiDefinition().equals(apiDefinition) && apiDisplayItem.getLocation().contains(filePath)).toList();
    }

    private String getAbsolutePath(ApiDisplayItem apiDisplayItem) {
        String location = apiDisplayItem.getLocation();
        Pair<String, Integer> locationInfo = ApiChangeLineTracker.parseApiDisplayItemLocation(location);
        return ApiChangeAssistantFactory.getAbsolutePathForRelativeApiPath(this.project, (String)locationInfo.getFirst());
    }

    private AddToChatRequest buildAddtoChatRequest(ApiDisplayItem apiDisplayItem, String requestType) {
        String changeId = apiDisplayItem.getChangeId();
        String apiDefinition = apiDisplayItem.getApiDefinition();
        Pair<String, Integer> locationInfo = ApiChangeLineTracker.parseApiDisplayItemLocation(apiDisplayItem.getLocation());
        String filePath = this.getAbsolutePath(apiDisplayItem);
        ArrayList<ApiDisplayItem> apiDisplayItemsToAsk = new ArrayList<ApiDisplayItem>();
        if (FILE_NODE_TYPE.equals(requestType)) {
            apiDisplayItemsToAsk = this.getApiDisplayItemsToAsk(changeId, apiDefinition, (String)locationInfo.getFirst());
        } else {
            apiDisplayItemsToAsk.add(apiDisplayItem);
        }
        ApiChangeFixPrompt apiChangeFixPrompt = apiChangeFixPromptsMap.get(changeId);
        if (apiChangeFixPrompt == null) {
            apiChangeFixPrompt = API_CHANGE_DEFAULT_PROMPT;
            LOGGER.warn("apiChangeFixPrompt is null");
        }
        return new AddToChatRequest(apiChangeFixPrompt, filePath, apiDisplayItemsToAsk);
    }

    public void onQuery(@NotNull String nodeInfo, @NotNull CefQueryCallback cefQueryCallback) {
        if (nodeInfo == null) {
            ApiChangeAddToChatHandler.$$$reportNull$$$0(1);
        }
        if (cefQueryCallback == null) {
            ApiChangeAddToChatHandler.$$$reportNull$$$0(2);
        }
        try {
            ApiChangeIntelligentService service = ApiChangeIntelligentService.getInstance(this.project);
            if (service == null) {
                LOGGER.warn("ApiChangeIntelligentService could not be loaded for project: " + this.project.getName());
                cefQueryCallback.failure(-1, "Service not available");
                return;
            }
            JSONObject nodeInfoJson = JSON.parseObject((String)nodeInfo);
            if (nodeInfoJson == null || nodeInfoJson.getString("type") == null || nodeInfoJson.getString("apiDisplayItem") == null) {
                LOGGER.warn("NodeInfo is invalid.");
                cefQueryCallback.failure(2, "NodeInfo is invalid.");
                return;
            }
            String requestType = nodeInfoJson.getString("type");
            ApiDisplayItem node = (ApiDisplayItem)JSON.parseObject((String)nodeInfoJson.getString("apiDisplayItem"), ApiDisplayItem.class);
            service.handleRequest(this.project, this.buildAddtoChatRequest(node, requestType));
        }
        catch (JSONException e) {
            LOGGER.error("NodeInfo parse error.");
            cefQueryCallback.failure(2, "NodeInfo parse error.");
        }
    }

    static {
        List<ApiChangeFixPrompt> apiChangeFixPrompts = ApiChangeAddToChatHandler.readApiChangePrompts();
        apiChangeFixPromptsMap = new HashMap<String, ApiChangeFixPrompt>();
        apiChangeFixPrompts.forEach(prompt -> apiChangeFixPromptsMap.put(prompt.getChangeId(), (ApiChangeFixPrompt)prompt));
    }

    private static /* synthetic */ void $$$reportNull$$$0(int n) {
        Object[] objectArray;
        Object[] objectArray2;
        Object[] objectArray3 = new Object[3];
        switch (n) {
            default: {
                objectArray2 = objectArray3;
                objectArray3[0] = "project";
                break;
            }
            case 1: {
                objectArray2 = objectArray3;
                objectArray3[0] = "nodeInfo";
                break;
            }
            case 2: {
                objectArray2 = objectArray3;
                objectArray3[0] = "cefQueryCallback";
                break;
            }
        }
        objectArray2[1] = "com/huawei/deveco/programanalysis/apiscan/handler/ApiChangeAddToChatHandler";
        switch (n) {
            default: {
                objectArray = objectArray2;
                objectArray2[2] = "<init>";
                break;
            }
            case 1: 
            case 2: {
                objectArray = objectArray2;
                objectArray2[2] = "onQuery";
                break;
            }
        }
        throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objectArray));
    }
}

