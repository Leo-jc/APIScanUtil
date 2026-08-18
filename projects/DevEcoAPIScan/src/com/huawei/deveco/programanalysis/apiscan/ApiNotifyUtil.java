/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.huawei.deveco.common.trace.TraceUtil
 *  com.intellij.notification.Notification
 *  com.intellij.notification.NotificationType
 *  com.intellij.openapi.actionSystem.ActionManager
 *  com.intellij.openapi.actionSystem.AnAction
 *  com.intellij.openapi.actionSystem.AnActionEvent
 *  com.intellij.openapi.actionSystem.DataContext
 *  com.intellij.openapi.actionSystem.DataKey
 *  com.intellij.openapi.actionSystem.impl.SimpleDataContext
 *  com.intellij.openapi.application.ApplicationManager
 *  com.intellij.openapi.diagnostic.Logger
 *  com.intellij.openapi.project.Project
 *  com.intellij.openapi.ui.Messages
 */
package com.huawei.deveco.programanalysis.apiscan;

import com.huawei.deveco.common.trace.TraceUtil;
import com.huawei.deveco.programanalysis.apiscan.resources.HosProjectMgmtBundle;
import com.intellij.notification.Notification;
import com.intellij.notification.NotificationType;
import com.intellij.openapi.actionSystem.ActionManager;
import com.intellij.openapi.actionSystem.AnAction;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.DataContext;
import com.intellij.openapi.actionSystem.DataKey;
import com.intellij.openapi.actionSystem.impl.SimpleDataContext;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.diagnostic.Logger;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.ui.Messages;
import java.awt.Desktop;
import java.io.File;
import java.io.IOException;
import java.util.Locale;
import java.util.UUID;

public class ApiNotifyUtil {
    private static final Logger LOGGER = Logger.getInstance(ApiNotifyUtil.class);
    private static final String GROUP_ID = "Export.CSV.Notification";
    private static final DataKey<String> API_SCAN_UNIQUE_ID = DataKey.create((String)"apiScanUniqueId");
    private static final DataKey<String> API_SCAN_EVENT_ID = DataKey.create((String)"apiScanEventId");
    private static final DataKey<Project> PROJECT_KEY = DataKey.create((String)"projectKey");

    public static void showSuccessNotify(File file, Project project) {
        if (file == null) {
            LOGGER.warn("Export file is null");
            return;
        }
        String message = "Succeed to export: " + file.getPath();
        ApiNotifyUtil.showNotification(HosProjectMgmtBundle.message("export.message.success", file.getPath()), project, HosProjectMgmtBundle.message("export.CSV.file.success", new Object[0]), NotificationType.INFORMATION);
        LOGGER.info(message);
        try {
            Desktop.getDesktop().open(file.getParentFile());
            LOGGER.info("Open explorer success.");
        }
        catch (IOException e) {
            LOGGER.error("Open explorer failed.");
        }
    }

    public static void showWarnNotify(String message, Project project) {
        ApiNotifyUtil.showNotification(HosProjectMgmtBundle.message("export.message.failed", message), project, HosProjectMgmtBundle.message("export.CSV.file.failed", new Object[0]), NotificationType.WARNING);
    }

    public static void showWarnNotify(String message, String title, Project project) {
        ApiNotifyUtil.showNotification(HosProjectMgmtBundle.message("scan.failed.message.failed", message), project, title, NotificationType.WARNING);
    }

    public static void showFailedNotify(String message, String title, Project project) {
        String uniqueId = UUID.randomUUID().toString();
        String eventId = "APIScanError";
        LOGGER.info(String.format(Locale.ENGLISH, "TraceUtil detail: uniqueId=%s; title=%s; message=%s; NotificationType.ERROR=%s; Project=%s", uniqueId, title, message, NotificationType.ERROR, project));
        TraceUtil.trace((String)"APIScanError", (String)uniqueId);
        AnAction action = ActionManager.getInstance().getAction("ApiScanErrorAction");
        if (action == null) {
            LOGGER.error("Cannot find action ApiScanErrorAction");
        }
        DataContext dataContext = SimpleDataContext.builder().add(API_SCAN_EVENT_ID, (Object)eventId).add(API_SCAN_UNIQUE_ID, (Object)uniqueId).add(PROJECT_KEY, (Object)project).build();
        action.actionPerformed(AnActionEvent.createFromDataContext((String)"ApiScanErrorAction", null, (DataContext)dataContext));
    }

    public static void showWarningDialog(String message, String title, Project project) {
        ApplicationManager.getApplication().invokeLater(() -> Messages.showWarningDialog((Project)project, (String)message, (String)title));
    }

    private static void showNotification(String message, Project project, String title, NotificationType notificationType) {
        Notification notification = new Notification(GROUP_ID, title, message, notificationType);
        notification.setImportant(true);
        notification.notify(project);
    }
}

