/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.huawei.codegenie.chat.components.ChatMessageManager
 *  com.huawei.codegenie.chat.util.ChatMessageUtil
 *  com.intellij.openapi.application.ApplicationManager
 *  com.intellij.openapi.components.Service
 *  com.intellij.openapi.components.Service$Level
 *  com.intellij.openapi.diagnostic.Logger
 *  com.intellij.openapi.project.Project
 *  org.jetbrains.annotations.NotNull
 */
package com.huawei.codegenie.chat.apichange;

import com.huawei.codegenie.chat.apichange.APIChangeChatManager;
import com.huawei.codegenie.chat.components.ChatMessageManager;
import com.huawei.codegenie.chat.util.ChatMessageUtil;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.Service;
import com.intellij.openapi.diagnostic.Logger;
import com.intellij.openapi.project.Project;
import org.jetbrains.annotations.NotNull;

@Service(value={Service.Level.PROJECT})
public final class ApiChangeService {
    private static final Logger LOGGER = Logger.getInstance(ApiChangeService.class);
    private final Project project;
    private String apiChangeMessage;

    private ApiChangeService(@NotNull Project project) {
        if (project == null) {
            ApiChangeService.$$$reportNull$$$0(0);
        }
        this.project = project;
    }

    public static ApiChangeService getInstance(@NotNull Project project) {
        if (project == null) {
            ApiChangeService.$$$reportNull$$$0(1);
        }
        if (project.isDisposed()) {
            return null;
        }
        return (ApiChangeService)project.getService(ApiChangeService.class);
    }

    public void showAPIChangeMessageInWebview(String apiChangeMessage) {
        this.apiChangeMessage = apiChangeMessage;
        boolean isInEDT = ApplicationManager.getApplication().isDispatchThread();
        if (!isInEDT) {
            ApplicationManager.getApplication().invokeAndWait(this::sendAPIChangeMessageToWebview);
        } else {
            this.sendAPIChangeMessageToWebview();
        }
    }

    private void sendAPIChangeMessageToWebview() {
        String errorMessageToWebView = this.apiChangeMessage;
        ChatMessageUtil.showChatToolWindow((Project)this.project);
        if (!ChatMessageManager.getInstance((Project)this.project).isInit()) {
            ChatMessageManager.getInstance((Project)this.project).setApiChangeFixChat(true);
            ChatMessageManager.getInstance((Project)this.project).setApiChangeFixMessage(errorMessageToWebView);
            return;
        }
        APIChangeChatManager chatManager = APIChangeChatManager.getInstance(this.project);
        if (chatManager == null) {
            return;
        }
        chatManager.init();
        chatManager.sendWebviewAPIChangeMessage(errorMessageToWebView);
    }

    private static /* synthetic */ void $$$reportNull$$$0(int n) {
        Object[] objectArray;
        Object[] objectArray2 = new Object[3];
        objectArray2[0] = "project";
        objectArray2[1] = "com/huawei/codegenie/chat/apichange/ApiChangeService";
        switch (n) {
            default: {
                objectArray = objectArray2;
                objectArray2[2] = "<init>";
                break;
            }
            case 1: {
                objectArray = objectArray2;
                objectArray2[2] = "getInstance";
                break;
            }
        }
        throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objectArray));
    }
}
