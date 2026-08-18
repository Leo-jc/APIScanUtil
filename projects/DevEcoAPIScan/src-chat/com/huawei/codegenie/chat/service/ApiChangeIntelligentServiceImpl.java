/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.alibaba.fastjson2.JSON
 *  com.huawei.codegenie.chat.util.ChatMessageUtil
 *  com.huawei.codegenie.chat.util.LoginStatusChangedHandler
 *  com.huawei.codegenie.common.i18n.I18nBundle
 *  com.huawei.codegenie.common.login.LoginService
 *  com.huawei.codegenie.common.util.PluginInfoUtils
 *  com.huawei.deveco.programanalysis.apiscan.bean.AddToChatRequest
 *  com.huawei.deveco.programanalysis.apiscan.bean.ApiDisplayItem
 *  com.huawei.deveco.programanalysis.apiscan.handler.utils.ApiChangeIntelligentService
 *  com.intellij.openapi.application.ApplicationManager
 *  com.intellij.openapi.diagnostic.Logger
 *  com.intellij.openapi.editor.Document
 *  com.intellij.openapi.fileEditor.FileDocumentManager
 *  com.intellij.openapi.project.Project
 *  com.intellij.openapi.util.Pair
 *  com.intellij.openapi.vfs.LocalFileSystem
 *  com.intellij.openapi.vfs.VirtualFile
 */
package com.huawei.codegenie.chat.service;

import com.alibaba.fastjson2.JSON;
import com.huawei.codegenie.chat.apichange.ApiChangeService;
import com.huawei.codegenie.chat.apichange.AskItem;
import com.huawei.codegenie.chat.apichange.CodeLine;
import com.huawei.codegenie.chat.apichange.CodeRange;
import com.huawei.codegenie.chat.util.ChatMessageUtil;
import com.huawei.codegenie.chat.util.LoginStatusChangedHandler;
import com.huawei.codegenie.common.i18n.I18nBundle;
import com.huawei.codegenie.common.login.LoginService;
import com.huawei.codegenie.common.util.PluginInfoUtils;
import com.huawei.deveco.programanalysis.apiscan.bean.AddToChatRequest;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiDisplayItem;
import com.huawei.deveco.programanalysis.apiscan.handler.utils.ApiChangeIntelligentService;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.diagnostic.Logger;
import com.intellij.openapi.editor.Document;
import com.intellij.openapi.fileEditor.FileDocumentManager;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Pair;
import com.intellij.openapi.vfs.LocalFileSystem;
import com.intellij.openapi.vfs.VirtualFile;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class ApiChangeIntelligentServiceImpl
implements ApiChangeIntelligentService {
    private static final Logger LOGGER = Logger.getInstance(ApiChangeIntelligentServiceImpl.class);
    private static final String PROMPT_HEAD = "\u8bf7\u7ed9\u51fa\u4e0d\u517c\u5bb9API\u9002\u914d\u5efa\u8bae\uff0c\u5177\u4f53\u4fe1\u606f\u5982\u4e0b\uff1a\n";
    private static final String PROMPT_END = "\u53ef\u4ee5\u53c2\u8003\u5982\u4e0b\u53d8\u66f4\u6587\u6863\n";
    private static final String PROMPT_SHOW = I18nBundle.message((String)"code.chat.api.change.prompt.show", (Object[])new Object[0]);
    private static final String SPLIT_LINE_REGEX = "(?<=\\R)";
    private static final String CODE_LOCATION_SEPARATOR = ":";
    private static final String CODE_LINE_NUMBER_SEPARATOR = "-";
    private static final String MESSAGE_KEY = "message";
    private static final String FIX_API_INFO_KEY = "fixApiInfo";
    private static final String PROMPT_SHOW_KEY = "promptShow";
    private static final int QUESTION_MAX_LENGTH = 80000;
    private static final int CODE_INTERVAL_LENGTH = 10;

    public ApiChangeIntelligentServiceImpl() {
        LOGGER.info("ApiChangeIntelligentServiceImpl constructor called");
    }

    public static Pair<String, Integer> parseApiDisplayItemLocation(String location) {
        if (location == null) {
            LOGGER.warn("Unable to parse code location of null.");
            return null;
        }
        int index = location.lastIndexOf(CODE_LOCATION_SEPARATOR);
        if (index == -1) {
            LOGGER.warn("Unable to parse code location without separator.");
            return null;
        }
        String fileUrl = location.substring(0, index);
        String lineNumberString = location.substring(index + 1);
        try {
            int lineNumber = Integer.parseInt(lineNumberString);
            return Pair.create((Object)fileUrl, (Object)lineNumber);
        }
        catch (NumberFormatException e) {
            LOGGER.info(String.format(Locale.ENGLISH, "Parse apiDisplayItem location error, location:%s", location));
            return null;
        }
    }

    private static String readFile(String filePath) {
        Document document;
        VirtualFile file = LocalFileSystem.getInstance().findFileByPath(filePath);
        if (file != null && file.exists() && (document = FileDocumentManager.getInstance().getDocument(file)) != null) {
            return document.getText();
        }
        LOGGER.error("read file error");
        return "";
    }

    private CodeLine[] getCodeLines(String sourceCode) {
        String[] rawLines = sourceCode.split(SPLIT_LINE_REGEX, -1);
        CodeLine[] lines = new CodeLine[rawLines.length];
        int startIndex = 0;
        for (int i = 0; i < rawLines.length; ++i) {
            int endIndex = startIndex + rawLines[i].length() - 1;
            lines[i] = new CodeLine(rawLines[i], startIndex, endIndex);
            startIndex = endIndex + 1;
        }
        return lines;
    }

    private AskItem buildAskItem(CodeLine[] codeLines, String sourceCode, int currentLineNumber) {
        int codeStartLineNumber = currentLineNumber - 10;
        int codeEndLineNumber = currentLineNumber + 10;
        codeStartLineNumber = Math.max(codeStartLineNumber, 1);
        codeEndLineNumber = Math.min(codeEndLineNumber, codeLines.length);
        String content = "";
        int startIndex = codeLines[codeStartLineNumber - 1].startIndex();
        int endIndex = codeLines[codeEndLineNumber - 1].endIndex();
        if (endIndex >= startIndex && startIndex >= 0 && endIndex <= sourceCode.length()) {
            content = sourceCode.substring(startIndex, endIndex);
        }
        CodeRange range = new CodeRange(codeStartLineNumber, codeEndLineNumber);
        List<Integer> changeLines = List.of(Integer.valueOf(currentLineNumber));
        return new AskItem(range, content, changeLines);
    }

    private List<AskItem> getAskItemList(CodeLine[] codeLines, String sourceCode, AddToChatRequest addToChatRequest) {
        ArrayList<AskItem> askItemList = new ArrayList<AskItem>();
        for (ApiDisplayItem apiDisplayItem : addToChatRequest.getApiDisplayItems()) {
            Pair<String, Integer> codeLocation = ApiChangeIntelligentServiceImpl.parseApiDisplayItemLocation(apiDisplayItem.getLocation());
            if (codeLocation == null || codeLocation.getSecond() == null) continue;
            int currentLineNumber = (Integer)codeLocation.getSecond();
            askItemList.add(this.buildAskItem(codeLines, sourceCode, currentLineNumber));
        }
        return askItemList;
    }

    private List<String> buildQuestion(List<AskItem> askItemList) {
        ArrayList<String> questions = new ArrayList<String>();
        StringBuilder questionBuilder = new StringBuilder(PROMPT_HEAD);
        for (AskItem askItem : askItemList) {
            String info = JSON.toJSONString((Object)askItem);
            if (questionBuilder.length() + info.length() < 80000) {
                questionBuilder.append(info);
                continue;
            }
            questions.add(questionBuilder.toString());
            questionBuilder = new StringBuilder(PROMPT_HEAD);
            questionBuilder.append(info);
        }
        questions.add(questionBuilder.toString());
        return questions;
    }

    public void intelligentToWebView(Project project, String errorMessage) {
        if (!this.checkLoginStatus(project)) {
            return;
        }
        ApiChangeService apiChangeService = ApiChangeService.getInstance(project);
        if (apiChangeService != null) {
            apiChangeService.showAPIChangeMessageInWebview(errorMessage);
        }
    }

    public void handleRequest(Project project, AddToChatRequest addToChatRequest) {
        String filePath = addToChatRequest.getFilePath();
        Object fixApiInfo = Path.of(filePath, new String[0]).getFileName().toString();
        String fileContent = ApiChangeIntelligentServiceImpl.readFile(filePath);
        CodeLine[] codeLines = this.getCodeLines(fileContent);
        List<AskItem> askItemList = this.getAskItemList(codeLines, fileContent, addToChatRequest);
        List<String> questions = this.buildQuestion(askItemList);
        questions.replaceAll(question -> question + PROMPT_END + addToChatRequest.getPrompt().getDescription());
        if (askItemList.size() == 1) {
            int line = askItemList.get(0).getChangeLines().get(0);
            fixApiInfo = (String)fixApiInfo + CODE_LOCATION_SEPARATOR + line + CODE_LINE_NUMBER_SEPARATOR + line;
        }
        String questionList = JSON.toJSONString(questions);
        Map<String, String> messageMap = Map.of(MESSAGE_KEY, questionList, FIX_API_INFO_KEY, fixApiInfo, PROMPT_SHOW_KEY, PROMPT_SHOW);
        String message = JSON.toJSONString(messageMap);
        this.intelligentToWebView(project, message);
    }

    private boolean checkLoginStatus(Project project) {
        if (!LoginService.getInstance().isLogin()) {
            LoginStatusChangedHandler.notifyWithLogin((Project)project);
            return false;
        }
        if (!LoginService.getInstance().getServiceStatement()) {
            ApplicationManager.getApplication().invokeLater(() -> ChatMessageUtil.showChatToolWindow((Project)project));
            LoginService.getInstance().showLoginTip(project, I18nBundle.message((String)"duty.agree.required", (Object[])new Object[]{PluginInfoUtils.getPluginName()}), null);
            return false;
        }
        return true;
    }
}
