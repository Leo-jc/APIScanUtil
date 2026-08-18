/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.intellij.openapi.extensions.ExtensionPoint
 *  com.intellij.openapi.extensions.ExtensionPointName
 *  com.intellij.openapi.project.Project
 *  org.jetbrains.annotations.NotNull
 */
package com.huawei.deveco.programanalysis.apiscan.handler.utils;

import com.huawei.deveco.programanalysis.apiscan.bean.AddToChatRequest;
import com.intellij.openapi.extensions.ExtensionPoint;
import com.intellij.openapi.extensions.ExtensionPointName;
import com.intellij.openapi.project.Project;
import org.jetbrains.annotations.NotNull;

public interface ApiChangeIntelligentService {
    public static final ExtensionPointName<ApiChangeIntelligentService> EP_NAME = ExtensionPointName.create((String)"com.huawei.harmony.apiChangeIntelligentService");

    public static ApiChangeIntelligentService getInstance(@NotNull Project project) {
        ExtensionPoint ep;
        ApiChangeIntelligentService[] extensions;
        if (project == null) {
            ApiChangeIntelligentService.$$$reportNull$$$0(0);
        }
        return (extensions = (ApiChangeIntelligentService[])(ep = EP_NAME.getPoint()).getExtensions()).length > 0 ? extensions[0] : null;
    }

    public void intelligentToWebView(Project var1, String var2);

    public void handleRequest(Project var1, AddToChatRequest var2);

    private static /* synthetic */ void $$$reportNull$$$0(int n) {
        throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", "project", "com/huawei/deveco/programanalysis/apiscan/handler/utils/ApiChangeIntelligentService", "getInstance"));
    }
}

