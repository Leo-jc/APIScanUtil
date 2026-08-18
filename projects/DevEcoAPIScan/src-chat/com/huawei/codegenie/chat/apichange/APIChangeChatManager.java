/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.alibaba.fastjson2.JSON
 *  com.huawei.codegenie.chat.common.enums.ChatMessagePostType
 *  com.huawei.codegenie.chat.components.ChatMessageManager
 *  com.huawei.codegenie.chat.components.ChatMessageService
 *  com.huawei.codegenie.chat.model.ChatMessage
 *  com.huawei.codegenie.common.deveco.trace.TaskTypeEnum
 *  com.intellij.openapi.components.Service
 *  com.intellij.openapi.components.Service$Level
 *  com.intellij.openapi.project.Project
 *  lombok.Generated
 *  org.jetbrains.annotations.NotNull
 *  org.slf4j.Logger
 *  org.slf4j.LoggerFactory
 */
package com.huawei.codegenie.chat.apichange;

import com.alibaba.fastjson2.JSON;
import com.huawei.codegenie.chat.common.enums.ChatMessagePostType;
import com.huawei.codegenie.chat.components.ChatMessageManager;
import com.huawei.codegenie.chat.components.ChatMessageService;
import com.huawei.codegenie.chat.model.ChatMessage;
import com.huawei.codegenie.common.deveco.trace.TaskTypeEnum;
import com.intellij.openapi.components.Service;
import com.intellij.openapi.project.Project;
import java.util.UUID;
import lombok.Generated;
import org.jetbrains.annotations.NotNull;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service(value={Service.Level.PROJECT})
public final class APIChangeChatManager {
    @Generated
    private static final Logger log = LoggerFactory.getLogger(APIChangeChatManager.class);
    private static final String MENU_TASK = TaskTypeEnum.API_CHANGE.getValue();
    private final Project project;
    private String sessionId;
    private String chatId;

    private APIChangeChatManager(@NotNull Project project) {
        if (project == null) {
            APIChangeChatManager.$$$reportNull$$$0(0);
        }
        this.sessionId = UUID.randomUUID().toString();
        this.chatId = "";
        this.project = project;
    }

    public static APIChangeChatManager getInstance(@NotNull Project project) {
        if (project == null) {
            APIChangeChatManager.$$$reportNull$$$0(1);
        }
        if (project.isDisposed()) {
            return null;
        }
        return (APIChangeChatManager)project.getService(APIChangeChatManager.class);
    }

    public void init() {
        this.chatId = ChatMessageService.getInstance().createSessions(this.project);
    }

    public void sendWebviewAPIChangeMessage(String apiChangeMessage) {
        ChatMessage chatMessage = new ChatMessage();
        chatMessage.setType(ChatMessagePostType.SEND_API_CHANGE_MESSAGE.getType());
        chatMessage.setApiChangeMessage(apiChangeMessage);
        chatMessage.setValue("");
        chatMessage.setAnswerId(this.sessionId);
        chatMessage.setChatId(this.chatId);
        chatMessage.setMenuTask(MENU_TASK);
        ChatMessageManager.getInstance((Project)this.project).sendChatMessage(JSON.toJSONString((Object)chatMessage), false, false);
    }

    @Generated
    public String getSessionId() {
        return this.sessionId;
    }

    @Generated
    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    private static /* synthetic */ void $$$reportNull$$$0(int n) {
        Object[] objectArray;
        Object[] objectArray2 = new Object[3];
        objectArray2[0] = "project";
        objectArray2[1] = "com/huawei/codegenie/chat/apichange/APIChangeChatManager";
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
