/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.huawei.deveco.common.country.setting.CountryRegionSetting
 *  com.huawei.deveco.projectmodel.ohos.model.ProjectModel
 *  com.huawei.deveco.projectmodel.ohos.model.ProjectModelManager
 *  com.huawei.deveco.projectmodel.ohos.model.constants.RuntimeOS
 *  com.intellij.openapi.actionSystem.AnAction
 *  com.intellij.openapi.actionSystem.AnActionEvent
 *  com.intellij.openapi.actionSystem.Presentation
 *  com.intellij.openapi.project.Project
 *  com.intellij.openapi.wm.ToolWindow
 *  com.intellij.openapi.wm.ToolWindowManager
 *  org.jetbrains.annotations.NotNull
 */
package com.huawei.deveco.programanalysis.apiscan.actions;

import com.huawei.deveco.common.country.setting.CountryRegionSetting;
import com.huawei.deveco.programanalysis.apiscan.ApiChangeAssistantTraceUtil;
import com.huawei.deveco.programanalysis.apiscan.resources.HosProjectMgmtBundle;
import com.huawei.deveco.projectmodel.ohos.model.ProjectModel;
import com.huawei.deveco.projectmodel.ohos.model.ProjectModelManager;
import com.huawei.deveco.projectmodel.ohos.model.constants.RuntimeOS;
import com.intellij.openapi.actionSystem.AnAction;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.Presentation;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.wm.ToolWindow;
import com.intellij.openapi.wm.ToolWindowManager;
import org.jetbrains.annotations.NotNull;

public class ApiChangeAssistantAction
extends AnAction {
    public static final String API_CHANGE_WINDOW_ID = "API Change Assistant";

    public ApiChangeAssistantAction() {
        super(HosProjectMgmtBundle.message("toolwindow.stripe.APIChangeAssistant", new Object[0]));
    }

    public void actionPerformed(@NotNull AnActionEvent anActionEvent) {
        Project project;
        if (anActionEvent == null) {
            ApiChangeAssistantAction.$$$reportNull$$$0(0);
        }
        if ((project = anActionEvent.getProject()) == null) {
            return;
        }
        ToolWindow toolWindow = ToolWindowManager.getInstance((Project)project).getToolWindow(API_CHANGE_WINDOW_ID);
        if (toolWindow == null) {
            return;
        }
        toolWindow.show();
        ApiChangeAssistantTraceUtil.traceUsage();
    }

    public static boolean isProjectChinaCountryCode() {
        String userCountryRegion = CountryRegionSetting.getInstance().getUserCountryRegion();
        return "CN".equals(userCountryRegion);
    }

    public void update(@NotNull AnActionEvent event) {
        Project project;
        if (event == null) {
            ApiChangeAssistantAction.$$$reportNull$$$0(1);
        }
        if ((project = event.getProject()) == null) {
            return;
        }
        Presentation presentation = event.getPresentation();
        if (!ApiChangeAssistantAction.isProjectChinaCountryCode()) {
            presentation.setEnabledAndVisible(false);
            this.setToolWindowAvailable(project, false);
            return;
        }
        ProjectModel targetProjectModel = ProjectModelManager.getInstance().getTargetProjectModel(project);
        if (targetProjectModel == null) {
            return;
        }
        if (RuntimeOS.OPEN_HARMONY.getValue().equals(targetProjectModel.getActiveRuntimeOS().getValue())) {
            presentation.setEnabledAndVisible(false);
            this.setToolWindowAvailable(project, false);
            return;
        }
        presentation.setEnabledAndVisible(true);
        this.setToolWindowAvailable(project, true);
    }

    private void setToolWindowAvailable(@NotNull Project project, boolean enable) {
        ToolWindow toolWindow;
        if (project == null) {
            ApiChangeAssistantAction.$$$reportNull$$$0(2);
        }
        if ((toolWindow = ToolWindowManager.getInstance((Project)project).getToolWindow(API_CHANGE_WINDOW_ID)) != null) {
            toolWindow.setAvailable(enable);
        }
    }

    private static /* synthetic */ void $$$reportNull$$$0(int n) {
        Object[] objectArray;
        Object[] objectArray2;
        Object[] objectArray3 = new Object[3];
        switch (n) {
            default: {
                objectArray2 = objectArray3;
                objectArray3[0] = "anActionEvent";
                break;
            }
            case 1: {
                objectArray2 = objectArray3;
                objectArray3[0] = "event";
                break;
            }
            case 2: {
                objectArray2 = objectArray3;
                objectArray3[0] = "project";
                break;
            }
        }
        objectArray2[1] = "com/huawei/deveco/programanalysis/apiscan/actions/ApiChangeAssistantAction";
        switch (n) {
            default: {
                objectArray = objectArray2;
                objectArray2[2] = "actionPerformed";
                break;
            }
            case 1: {
                objectArray = objectArray2;
                objectArray2[2] = "update";
                break;
            }
            case 2: {
                objectArray = objectArray2;
                objectArray2[2] = "setToolWindowAvailable";
                break;
            }
        }
        throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objectArray));
    }
}

