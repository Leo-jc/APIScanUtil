/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.alibaba.fastjson2.JSON
 *  com.alibaba.fastjson2.JSONException
 *  com.huawei.deveco.projectmgmt.ohos.cef.CefQueryHandler
 *  com.intellij.openapi.diagnostic.Logger
 *  com.intellij.openapi.project.Project
 *  lombok.Generated
 *  org.cef.callback.CefQueryCallback
 *  org.jetbrains.annotations.NotNull
 */
package com.huawei.deveco.programanalysis.apiscan.handler;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONException;
import com.huawei.deveco.programanalysis.apiscan.ApiChangeAssistantFactory;
import com.huawei.deveco.programanalysis.apiscan.ApiChangeTreeManager;
import com.huawei.deveco.programanalysis.apiscan.ApiChangeTreeUtil;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiChangeOnCheckedResponse;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiChangeTreeFileCheckItem;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiChangeTreeFileOncheckParam;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiDisplayItem;
import com.huawei.deveco.programanalysis.apiscan.bean.TreeApiDisplayItem;
import com.huawei.deveco.projectmgmt.ohos.cef.CefQueryHandler;
import com.intellij.openapi.diagnostic.Logger;
import com.intellij.openapi.project.Project;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.FileAttribute;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import lombok.Generated;
import org.cef.callback.CefQueryCallback;
import org.jetbrains.annotations.NotNull;

public class ApichangeTreeFileOncheckHandler
implements CefQueryHandler {
    private static final Logger LOGGER = Logger.getInstance(ApichangeTreeFileOncheckHandler.class);
    public static final String TREE_CHECKED_FILE = ".csv";
    public static final String API_CHANGE_CACHE = "apiChangeCache";
    public static final String API_CHANGE = "apichange";
    private static final int EXIT_CODE_PROJECT_PATH_NOT_FOUND = 1;
    private static final int EXIT_CODE_JSON_FAILED = 1;
    private static final int EXIT_CODE_HANDLE_FAILED = 1;
    private final Project project;

    public ApichangeTreeFileOncheckHandler(@NotNull Project project) {
        if (project == null) {
            ApichangeTreeFileOncheckHandler.$$$reportNull$$$0(0);
        }
        this.project = project;
    }

    public void onQuery(@NotNull String param, @NotNull CefQueryCallback cefQueryCallback) {
        if (param == null) {
            ApichangeTreeFileOncheckHandler.$$$reportNull$$$0(1);
        }
        if (cefQueryCallback == null) {
            ApichangeTreeFileOncheckHandler.$$$reportNull$$$0(2);
        }
        try {
            ApiChangeTreeFileOncheckParam apichangeTreeFileOncheckParam = (ApiChangeTreeFileOncheckParam)JSON.parseObject((String)param, ApiChangeTreeFileOncheckParam.class);
            ApiChangeTreeManager apiChangeTreeManager = ApiChangeAssistantFactory.getApiChangeTreeManagerMap().get(this.project.getBasePath());
            if (apiChangeTreeManager == null) {
                LOGGER.warn("Can not find apiChangeTreeManager.");
                cefQueryCallback.failure(1, "Can not find apiChangeTreeManager.");
                return;
            }
            ApiChangeOnCheckedResponse apiChangeOnCheckedResponse = apiChangeTreeManager.handleStatus(apichangeTreeFileOncheckParam.getKey(), apichangeTreeFileOncheckParam.getChecked(), apichangeTreeFileOncheckParam.getType());
            if (apiChangeOnCheckedResponse == null) {
                LOGGER.warn("apiChangeOnCheckedResponse is null.");
                cefQueryCallback.failure(1, "apiChangeOnCheckedResponse is null.");
                return;
            }
            cefQueryCallback.success(JSON.toJSONString((Object)apiChangeOnCheckedResponse));
        }
        catch (JSONException e) {
            LOGGER.warn("parse json fail");
            cefQueryCallback.failure(1, "parse json failed");
        }
    }

    private TreeApiDisplayItem findTreeApiDisplayItemByKey(String key, String type, List<TreeApiDisplayItem> treeApiDisplayItemList) {
        if (KeyType.CHANGE_ID.getValue().equals(type)) {
            return treeApiDisplayItemList.stream().filter(item -> item.getKey().equals(key)).findFirst().orElse(null);
        }
        if (KeyType.API_DEFINITION.getValue().equals(type)) {
            return treeApiDisplayItemList.stream().flatMap(treeApiDisplayItem -> treeApiDisplayItem.getChildren().stream()).filter(secondTreeItem -> secondTreeItem.getKey().equals(key)).findFirst().orElse(null);
        }
        if (KeyType.FILE_PATH.getValue().equals(type)) {
            return treeApiDisplayItemList.stream().flatMap(treeApiDisplayItem -> treeApiDisplayItem.getChildren().stream()).flatMap(secondTreeApiDisplayItem -> secondTreeApiDisplayItem.getChildren().stream()).filter(thirdTreeApiDisplayItem -> thirdTreeApiDisplayItem.getKey().equals(key)).findFirst().orElse(null);
        }
        LOGGER.warn("Can not find Item for illegal key type:" + type);
        return null;
    }

    private List<String> getLeafKeys(TreeApiDisplayItem treeApiDisplayItem) {
        if (treeApiDisplayItem == null) {
            LOGGER.warn("Can not get leafs for treeApiDisplayItem with null value.");
            return new ArrayList<String>();
        }
        return TreeApiDisplayItem.getAllLeafNodes(treeApiDisplayItem).stream().map(TreeApiDisplayItem::getKey).toList();
    }

    private List<ApiChangeTreeFileCheckItem> getApiChangeTreeFileCheckItemList(Project project, String key, String type, String checked) {
        Map<String, List<ApiDisplayItem>> apiDisplayItemListMap = ApiChangeAssistantFactory.getApiDisplayItemMap();
        List<ApiDisplayItem> apiDisplayItemList = apiDisplayItemListMap.get(project.getBasePath());
        List<TreeApiDisplayItem> treeApiDisplayItemList = ApiChangeTreeUtil.transferToTree(apiDisplayItemList, project);
        TreeApiDisplayItem updateItem = this.findTreeApiDisplayItemByKey(key, type, treeApiDisplayItemList);
        List<String> leafKeys = this.getLeafKeys(updateItem);
        return leafKeys.stream().map(leafKey -> new ApiChangeTreeFileCheckItem((String)leafKey, checked)).toList();
    }

    public static Path createOrGetFileFloderPath(String projectPath) {
        Path filePath = Paths.get(projectPath, ".idea", API_CHANGE);
        if (!Files.exists(filePath, new LinkOption[0])) {
            try {
                Files.createDirectories(filePath, new FileAttribute[0]);
            }
            catch (IOException e) {
                LOGGER.warn("create directory failed");
            }
        }
        return filePath;
    }

    private Path getApiChangeFileCache(String projectPath) {
        Path fileFloderPath = ApichangeTreeFileOncheckHandler.createOrGetFileFloderPath(projectPath);
        return Paths.get(fileFloderPath.toString(), "apiChangeCache.csv");
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
                objectArray3[0] = "param";
                break;
            }
            case 2: {
                objectArray2 = objectArray3;
                objectArray3[0] = "cefQueryCallback";
                break;
            }
        }
        objectArray2[1] = "com/huawei/deveco/programanalysis/apiscan/handler/ApichangeTreeFileOncheckHandler";
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

    public static enum KeyType {
        CHANGE_ID("changeId"),
        API_DEFINITION("apiDefinition"),
        FILE_PATH("filePath"),
        FILE_NODE("fileNode");

        private final String value;

        private KeyType(String value) {
            this.value = value;
        }

        @Generated
        public String getValue() {
            return this.value;
        }
    }
}

