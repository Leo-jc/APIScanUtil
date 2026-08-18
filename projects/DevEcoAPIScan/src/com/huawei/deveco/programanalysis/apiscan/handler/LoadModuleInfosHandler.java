/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.alibaba.fastjson2.JSON
 *  com.huawei.deveco.projectmgmt.ohos.cef.CefQueryHandler
 *  com.intellij.openapi.project.Project
 *  org.cef.callback.CefQueryCallback
 *  org.jetbrains.annotations.NotNull
 */
package com.huawei.deveco.programanalysis.apiscan.handler;

import com.alibaba.fastjson2.JSON;
import com.huawei.deveco.programanalysis.apiscan.ApiScanUtil;
import com.huawei.deveco.programanalysis.apiscan.bean.ModuleNode;
import com.huawei.deveco.projectmgmt.ohos.cef.CefQueryHandler;
import com.intellij.openapi.project.Project;
import java.util.List;
import org.cef.callback.CefQueryCallback;
import org.jetbrains.annotations.NotNull;

public class LoadModuleInfosHandler
implements CefQueryHandler {
    private final Project project;

    public LoadModuleInfosHandler(Project project) {
        this.project = project;
    }

    public void onQuery(@NotNull String startVersion, @NotNull CefQueryCallback cefQueryCallback) {
        if (startVersion == null) {
            LoadModuleInfosHandler.$$$reportNull$$$0(0);
        }
        if (cefQueryCallback == null) {
            LoadModuleInfosHandler.$$$reportNull$$$0(1);
        }
        List<ModuleNode> moduleTreeInfos = ApiScanUtil.getModuleTreeInfos(this.project);
        cefQueryCallback.success(JSON.toJSONString(moduleTreeInfos));
    }

    private static /* synthetic */ void $$$reportNull$$$0(int n) {
        Object[] objectArray;
        Object[] objectArray2 = new Object[3];
        switch (n) {
            default: {
                objectArray = objectArray2;
                objectArray2[0] = "startVersion";
                break;
            }
            case 1: {
                objectArray = objectArray2;
                objectArray2[0] = "cefQueryCallback";
                break;
            }
        }
        objectArray[1] = "com/huawei/deveco/programanalysis/apiscan/handler/LoadModuleInfosHandler";
        objectArray[2] = "onQuery";
        throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objectArray));
    }
}

