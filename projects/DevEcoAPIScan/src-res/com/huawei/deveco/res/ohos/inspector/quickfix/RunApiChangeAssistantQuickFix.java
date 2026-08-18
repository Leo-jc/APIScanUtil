/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.huawei.deveco.res.ohos.common.ResourceEditorBundle
 *  com.huawei.deveco.res.ohos.inspector.quickfix.IgnoreQuickFix
 *  com.huawei.deveco.res.utils.LogLabelUtil
 *  com.huawei.deveco.sdkmanager.core.domain.ApiVersion
 *  com.intellij.openapi.actionSystem.ActionManager
 *  com.intellij.openapi.actionSystem.ActionUiKind
 *  com.intellij.openapi.actionSystem.AnAction
 *  com.intellij.openapi.actionSystem.AnActionEvent
 *  com.intellij.openapi.actionSystem.DataContext
 *  com.intellij.openapi.actionSystem.DataKey
 *  com.intellij.openapi.actionSystem.PlatformDataKeys
 *  com.intellij.openapi.actionSystem.impl.SimpleDataContext
 *  com.intellij.openapi.application.ApplicationManager
 *  com.intellij.openapi.diagnostic.Logger
 *  com.intellij.openapi.project.Project
 *  com.intellij.psi.PsiElement
 *  com.intellij.psi.PsiFile
 *  org.jetbrains.annotations.NotNull
 */
package com.huawei.deveco.res.ohos.inspector.quickfix;

import com.huawei.deveco.res.ohos.common.ResourceEditorBundle;
import com.huawei.deveco.res.ohos.inspector.quickfix.IgnoreQuickFix;
import com.huawei.deveco.res.utils.LogLabelUtil;
import com.huawei.deveco.sdkmanager.core.domain.ApiVersion;
import com.intellij.openapi.actionSystem.ActionManager;
import com.intellij.openapi.actionSystem.ActionUiKind;
import com.intellij.openapi.actionSystem.AnAction;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.DataContext;
import com.intellij.openapi.actionSystem.DataKey;
import com.intellij.openapi.actionSystem.PlatformDataKeys;
import com.intellij.openapi.actionSystem.impl.SimpleDataContext;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.diagnostic.Logger;
import com.intellij.openapi.project.Project;
import com.intellij.psi.PsiElement;
import com.intellij.psi.PsiFile;
import org.jetbrains.annotations.NotNull;

public class RunApiChangeAssistantQuickFix
extends IgnoreQuickFix {
    private static final String ACTION_ID = "Api change";
    private static final Logger LOG = LogLabelUtil.getLogger(RunApiChangeAssistantQuickFix.class);
    private static final String NAME = ResourceEditorBundle.message((String)"harmony.editor.inspections.wrong.target.sdk.change.fix", (Object[])new Object[0]);

    public RunApiChangeAssistantQuickFix(@NotNull PsiElement element, @NotNull ApiVersion newApiVersion, int weight) {
        if (element == null) {
            RunApiChangeAssistantQuickFix.$$$reportNull$$$0(0);
        }
        if (newApiVersion == null) {
            RunApiChangeAssistantQuickFix.$$$reportNull$$$0(1);
        }
        super(element, newApiVersion, weight);
    }

    @NotNull
    public String getText() {
        String string = NAME;
        if (string == null) {
            RunApiChangeAssistantQuickFix.$$$reportNull$$$0(2);
        }
        return string;
    }

    public void invoke(@NotNull Project project, @NotNull PsiFile file, @NotNull PsiElement startElement, @NotNull PsiElement endElement) {
        if (project == null) {
            RunApiChangeAssistantQuickFix.$$$reportNull$$$0(3);
        }
        if (file == null) {
            RunApiChangeAssistantQuickFix.$$$reportNull$$$0(4);
        }
        if (startElement == null) {
            RunApiChangeAssistantQuickFix.$$$reportNull$$$0(5);
        }
        if (endElement == null) {
            RunApiChangeAssistantQuickFix.$$$reportNull$$$0(6);
        }
        super.invoke(project, file, startElement, endElement);
        ApplicationManager.getApplication().invokeLater(() -> {
            AnAction apiChangeAssistant = ActionManager.getInstance().getAction(ACTION_ID);
            if (apiChangeAssistant == null) {
                LOG.warn("invoke: apiChangeAssistant is null");
                return;
            }
            DataContext dataContext = SimpleDataContext.getSimpleContext((DataKey)PlatformDataKeys.PROJECT, (Object)project);
            AnActionEvent event = AnActionEvent.createEvent((DataContext)dataContext, null, (String)"unknown", (ActionUiKind)ActionUiKind.NONE, null);
            apiChangeAssistant.actionPerformed(event);
        });
    }

    private static /* synthetic */ void $$$reportNull$$$0(int n) {
        Object[] objectArray;
        Object[] objectArray2;
        Object[] objectArray3 = new Object[switch (n) {
            default -> 3;
            case 2 -> 2;
        }];
        switch (n) {
            default: {
                objectArray2 = objectArray3;
                objectArray3[0] = "element";
                break;
            }
            case 1: {
                objectArray2 = objectArray3;
                objectArray3[0] = "newApiVersion";
                break;
            }
            case 2: {
                objectArray2 = objectArray3;
                objectArray3[0] = "com/huawei/deveco/res/ohos/inspector/quickfix/RunApiChangeAssistantQuickFix";
                break;
            }
            case 3: {
                objectArray2 = objectArray3;
                objectArray3[0] = "project";
                break;
            }
            case 4: {
                objectArray2 = objectArray3;
                objectArray3[0] = "file";
                break;
            }
            case 5: {
                objectArray2 = objectArray3;
                objectArray3[0] = "startElement";
                break;
            }
            case 6: {
                objectArray2 = objectArray3;
                objectArray3[0] = "endElement";
                break;
            }
        }
        switch (n) {
            default: {
                objectArray = objectArray2;
                objectArray2[1] = "com/huawei/deveco/res/ohos/inspector/quickfix/RunApiChangeAssistantQuickFix";
                break;
            }
            case 2: {
                objectArray = objectArray2;
                objectArray2[1] = "getText";
                break;
            }
        }
        switch (n) {
            default: {
                objectArray = objectArray;
                objectArray[2] = "<init>";
                break;
            }
            case 2: {
                break;
            }
            case 3: 
            case 4: 
            case 5: 
            case 6: {
                objectArray = objectArray;
                objectArray[2] = "invoke";
                break;
            }
        }
        String string = String.format(v0, objectArray);
        throw switch (n) {
            default -> new IllegalArgumentException(string);
            case 2 -> new IllegalStateException(string);
        };
    }
}
