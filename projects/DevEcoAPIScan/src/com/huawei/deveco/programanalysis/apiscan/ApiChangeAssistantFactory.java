/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.alibaba.fastjson2.JSON
 *  com.alibaba.fastjson2.JSONArray
 *  com.alibaba.fastjson2.JSONException
 *  com.alibaba.fastjson2.JSONObject
 *  com.alibaba.fastjson2.JSONWriter$Feature
 *  com.huawei.deveco.common.url.service.HelpUrlPathServiceImpl
 *  com.huawei.deveco.projectmgmt.ohos.cef.CefQueryHandler
 *  com.huawei.deveco.projectmgmt.ohos.cef.handler.SelectorHandler
 *  com.huawei.deveco.projectmodel.ohos.model.ModuleModel
 *  com.huawei.deveco.projectmodel.ohos.model.ProjectModel
 *  com.huawei.deveco.projectmodel.ohos.model.ProjectModelManager
 *  com.huawei.deveco.projectmodel.ohos.model.constants.RuntimeOS
 *  com.huawei.deveco.projectmodel.ohos.sync.listener.OhosSyncDataListener
 *  com.huawei.deveco.projectmodel.ohos.sync.listener.OhosSyncListenerManager
 *  com.intellij.ide.BrowserUtil
 *  com.intellij.openapi.application.ApplicationManager
 *  com.intellij.openapi.application.PathManager
 *  com.intellij.openapi.diagnostic.Logger
 *  com.intellij.openapi.editor.CaretModel
 *  com.intellij.openapi.editor.Document
 *  com.intellij.openapi.editor.Editor
 *  com.intellij.openapi.editor.FoldRegion
 *  com.intellij.openapi.editor.FoldingModel
 *  com.intellij.openapi.editor.ScrollType
 *  com.intellij.openapi.fileChooser.FileChooserDescriptorFactory
 *  com.intellij.openapi.fileEditor.FileEditorManager
 *  com.intellij.openapi.fileEditor.OpenFileDescriptor
 *  com.intellij.openapi.progress.ProcessCanceledException
 *  com.intellij.openapi.progress.ProgressIndicator
 *  com.intellij.openapi.progress.ProgressManager
 *  com.intellij.openapi.progress.Task
 *  com.intellij.openapi.progress.Task$Backgroundable
 *  com.intellij.openapi.project.DumbService
 *  com.intellij.openapi.project.Project
 *  com.intellij.openapi.startup.StartupManager
 *  com.intellij.openapi.util.Pair
 *  com.intellij.openapi.vfs.VfsUtil
 *  com.intellij.openapi.vfs.VirtualFile
 *  com.intellij.openapi.wm.ToolWindow
 *  com.intellij.openapi.wm.ToolWindowFactory
 *  com.intellij.openapi.wm.ToolWindowManager
 *  com.intellij.psi.PsiDocumentManager
 *  com.intellij.psi.PsiFile
 *  com.intellij.psi.PsiManager
 *  com.intellij.ui.content.Content
 *  com.intellij.ui.content.ContentManager
 *  lombok.Generated
 *  org.apache.commons.collections.CollectionUtils
 *  org.apache.commons.collections.MapUtils
 *  org.apache.commons.lang3.StringUtils
 *  org.cef.callback.CefQueryCallback
 *  org.jetbrains.annotations.NotNull
 */
package com.huawei.deveco.programanalysis.apiscan;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONException;
import com.alibaba.fastjson2.JSONObject;
import com.alibaba.fastjson2.JSONWriter;
import com.huawei.deveco.common.url.service.HelpUrlPathServiceImpl;
import com.huawei.deveco.programanalysis.apiscan.ApiChangeLineTracker;
import com.huawei.deveco.programanalysis.apiscan.ApiChangeTreeManager;
import com.huawei.deveco.programanalysis.apiscan.ApiChangeTreeUtil;
import com.huawei.deveco.programanalysis.apiscan.ApiChangeWindow;
import com.huawei.deveco.programanalysis.apiscan.ApiNotifyUtil;
import com.huawei.deveco.programanalysis.apiscan.ApiScanConfigs;
import com.huawei.deveco.programanalysis.apiscan.ApiScanUtil;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiChangeFilterParams;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiDisplayItem;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiScanData;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiScanParam;
import com.huawei.deveco.programanalysis.apiscan.bean.GetLocationParam;
import com.huawei.deveco.programanalysis.apiscan.bean.PageResult;
import com.huawei.deveco.programanalysis.apiscan.bean.ProcessStatusEnum;
import com.huawei.deveco.programanalysis.apiscan.bean.TreeApiDisplayItem;
import com.huawei.deveco.programanalysis.apiscan.handler.ApiChangeAddToChatHandler;
import com.huawei.deveco.programanalysis.apiscan.handler.ApichangeTreeFileOncheckHandler;
import com.huawei.deveco.programanalysis.apiscan.handler.LoadModuleInfosHandler;
import com.huawei.deveco.programanalysis.apiscan.handler.utils.ApiChangeIntelligentService;
import com.huawei.deveco.programanalysis.apiscan.resources.HosProjectMgmtBundle;
import com.huawei.deveco.programanalysis.apiscan.task.ThreadPoolScheduledExecutor;
import com.huawei.deveco.projectmgmt.ohos.cef.CefQueryHandler;
import com.huawei.deveco.projectmgmt.ohos.cef.handler.SelectorHandler;
import com.huawei.deveco.projectmodel.ohos.model.ModuleModel;
import com.huawei.deveco.projectmodel.ohos.model.ProjectModel;
import com.huawei.deveco.projectmodel.ohos.model.ProjectModelManager;
import com.huawei.deveco.projectmodel.ohos.model.constants.RuntimeOS;
import com.huawei.deveco.projectmodel.ohos.sync.listener.OhosSyncDataListener;
import com.huawei.deveco.projectmodel.ohos.sync.listener.OhosSyncListenerManager;
import com.intellij.ide.BrowserUtil;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.application.PathManager;
import com.intellij.openapi.diagnostic.Logger;
import com.intellij.openapi.editor.CaretModel;
import com.intellij.openapi.editor.Document;
import com.intellij.openapi.editor.Editor;
import com.intellij.openapi.editor.FoldRegion;
import com.intellij.openapi.editor.FoldingModel;
import com.intellij.openapi.editor.ScrollType;
import com.intellij.openapi.fileChooser.FileChooserDescriptorFactory;
import com.intellij.openapi.fileEditor.FileEditorManager;
import com.intellij.openapi.fileEditor.OpenFileDescriptor;
import com.intellij.openapi.progress.ProcessCanceledException;
import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.ProgressManager;
import com.intellij.openapi.progress.Task;
import com.intellij.openapi.project.DumbService;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.startup.StartupManager;
import com.intellij.openapi.util.Pair;
import com.intellij.openapi.vfs.VfsUtil;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.openapi.wm.ToolWindow;
import com.intellij.openapi.wm.ToolWindowFactory;
import com.intellij.openapi.wm.ToolWindowManager;
import com.intellij.psi.PsiDocumentManager;
import com.intellij.psi.PsiFile;
import com.intellij.psi.PsiManager;
import com.intellij.ui.content.Content;
import com.intellij.ui.content.ContentManager;
import java.awt.BorderLayout;
import java.awt.Component;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.InvalidPathException;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.FileAttribute;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.stream.Collectors;
import javax.swing.JComponent;
import javax.swing.JPanel;
import lombok.Generated;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.cef.callback.CefQueryCallback;
import org.jetbrains.annotations.NotNull;

public class ApiChangeAssistantFactory
implements ToolWindowFactory {
    public static final ApiChangeAssistantFactory INSTANCE = new ApiChangeAssistantFactory();
    private static final Logger LOGGER = Logger.getInstance(ApiChangeAssistantFactory.class);
    private static final Map<String, List<ApiDisplayItem>> apiDisplayItemMap = new ConcurrentHashMap<String, List<ApiDisplayItem>>();
    private static final Map<String, List<ApiDisplayItem>> apiDisplayItemsSearchMap = new ConcurrentHashMap<String, List<ApiDisplayItem>>();
    private static final Map<String, List<TreeApiDisplayItem>> treeApiDisplayItemMap = new ConcurrentHashMap<String, List<TreeApiDisplayItem>>();
    private static final Map<String, ApiChangeTreeManager> apiChangeTreeManagerMap = new ConcurrentHashMap<String, ApiChangeTreeManager>();
    private static final String API_CSV_SUFFIX = "_apiChange.csv";
    private static final String[] DISPLAY_HEADER = new String[]{HosProjectMgmtBundle.message("api.change.assistant.csv.output.apiDefinition", new Object[0]), HosProjectMgmtBundle.message("api.change.assistant.csv.output.language", new Object[0]), HosProjectMgmtBundle.message("api.change.assistant.csv.output.changedInSDK", new Object[0]), HosProjectMgmtBundle.message("api.change.assistant.csv.output.affectedVersions", new Object[0]), HosProjectMgmtBundle.message("api.change.assistant.csv.output.title", new Object[0]), HosProjectMgmtBundle.message("api.change.assistant.csv.output.codeLocation", new Object[0]), HosProjectMgmtBundle.message("api.change.assistant.csv.output.fixed", new Object[0]), HosProjectMgmtBundle.message("api.change.assistant.csv.output.changeType", new Object[0])};
    private static final String SPLIT_REGEX = ":";
    private static final int INDEX_PATH = 0;
    private static final int INDEX_CODE_LOCATION = 1;
    private static final int DEFAULT_PAGE_SIZE = 20;
    private static final String ARK_TS_LANGUAGE = "ArkTS";
    private static final String ALL_SELECTION = "All";
    private static final String CHANGE_TYPE_LINK_SYMBOL = ",";
    private static final String STATUS_UNFIXED = "Unfixed";
    private static final String STATUS_FIXED = "Fixed";
    private static final String CSV_INSIDE_HYPERLINK = "\"=HYPERLINK(\"\"%s\"\",\"\"%s\"\")\"";
    private static final Character CSV_UTF_8_INPUT_CHAR = Character.valueOf('\ufeff');
    private static final String FILE_NODE_TYPE = "fileNode";
    private static final Map<String, ApiChangeLineTracker> apiChangeLineTrackerMap = new ConcurrentHashMap<String, ApiChangeLineTracker>();
    private static final Map<String, JPanel> contentPanelMap = new ConcurrentHashMap<String, JPanel>();
    private JPanel contentPanel = new JPanel(new BorderLayout());

    public void init(@NotNull ToolWindow toolWindow) {
        if (toolWindow == null) {
            ApiChangeAssistantFactory.$$$reportNull$$$0(0);
        }
        toolWindow.setShowStripeButton(false);
        toolWindow.setStripeTitleProvider(() -> HosProjectMgmtBundle.message("toolwindow.stripe.APIChangeAssistant", new Object[0]));
        Project project = toolWindow.getProject();
        StartupManager.getInstance((Project)project).runAfterOpened(() -> DumbService.getInstance((Project)project).runWhenSmart(() -> {
            ProjectModel targetProjectModel = ProjectModelManager.getInstance().getTargetProjectModel(project);
            if (targetProjectModel != null) {
                ApiChangeAssistantFactory.registerAvailableListener(targetProjectModel);
            }
        }));
    }

    public static ApiChangeAssistantFactory getInstance() {
        return INSTANCE;
    }

    public void createToolWindowContent(@NotNull Project project, @NotNull ToolWindow toolWindow) {
        if (project == null) {
            ApiChangeAssistantFactory.$$$reportNull$$$0(1);
        }
        if (toolWindow == null) {
            ApiChangeAssistantFactory.$$$reportNull$$$0(2);
        }
        ApiChangeWindow apiChangeWindow = new ApiChangeWindow("ApichangeAssistant", project);
        String projectPath = project.getBasePath();
        if (projectPath != null) {
            contentPanelMap.put(projectPath, apiChangeWindow);
        }
        this.contentPanel = apiChangeWindow;
        HashMap<String, CefQueryHandler> cefQueryHandlerMap = new HashMap<String, CefQueryHandler>();
        cefQueryHandlerMap.put("ApiChangeScan", new ApiChangeScanHandler(this, project, apiChangeWindow));
        cefQueryHandlerMap.put("DocumentLinkJump", new LinkJumpHandler());
        cefQueryHandlerMap.put("CodeLocationJump", new CodeLocationHandler(project));
        cefQueryHandlerMap.put("ChooseApiVersion", new ChooseApiVersionHandler(project));
        cefQueryHandlerMap.put("ChooseDir", (CefQueryHandler)this.createSelectorHandler());
        cefQueryHandlerMap.put("CsvFileLocation", new CsvFileLocationHandler(project));
        cefQueryHandlerMap.put("SearchContent", new SearchContentHandler(project));
        cefQueryHandlerMap.put("loadApiScanSetting", new LoadApiScanSettingHandler());
        cefQueryHandlerMap.put("saveApiScanSetting", new SaveApiScanSettingHandler());
        cefQueryHandlerMap.put("browseSettingHelp", new SettingHelpHandler());
        cefQueryHandlerMap.put("loadModulesInfo", new LoadModuleInfosHandler(project));
        cefQueryHandlerMap.put("apichangeTreeFileOncheck", new ApichangeTreeFileOncheckHandler(project));
        cefQueryHandlerMap.put("loadPageData", new PageDataHandler(project));
        cefQueryHandlerMap.put("FilterApiChanges", new FilterApiChangesHandler(project));
        cefQueryHandlerMap.put("apiChangeAddToChat", new ApiChangeAddToChatHandler(project));
        cefQueryHandlerMap.put("getLocation", new GetLocationHandler(project));
        apiChangeWindow.initJCEF(cefQueryHandlerMap);
        ContentManager contentManager = toolWindow.getContentManager();
        Content content = contentManager.getFactory().createContent((JComponent)apiChangeWindow, null, false);
        contentManager.addContent(content);
    }

    private static JSONObject createPagedResult(List<ApiDisplayItem> pageItems, int total, Integer page, Project project) {
        JSONObject result = new JSONObject();
        if (pageItems.isEmpty() || project.getBasePath() == null) {
            result.put((Object)"data", (Object)JSON.toJSONString(pageItems, (JSONWriter.Feature[])new JSONWriter.Feature[]{JSONWriter.Feature.LargeObject}));
        } else {
            ApiScanData data = ApiChangeAssistantFactory.getApiScanData(pageItems, project);
            data.getTree().forEach(item -> ApiChangeAssistantFactory.groupCodeLocationsByFile(project, item));
            String searchParams = ApiChangeTreeUtil.extractTreeLevelKeys(apiDisplayItemMap.get(project.getBasePath()));
            result.put((Object)"searchParams", (Object)searchParams);
            result.put((Object)"data", (Object)JSON.toJSONString((Object)data, (JSONWriter.Feature[])new JSONWriter.Feature[]{JSONWriter.Feature.LargeObject}));
            boolean isCodeGenieEnable = ApiChangeIntelligentService.getInstance(project) != null;
            result.put((Object)"isCodeGenieEnable", (Object)isCodeGenieEnable);
        }
        result.put((Object)"total", (Object)total);
        if (page != null) {
            result.put((Object)"page", (Object)page);
        }
        return result;
    }

    private static boolean isCheckedStatus(Project project, String key) {
        ApiChangeTreeManager apiChangeTreeManager = apiChangeTreeManagerMap.get(project.getBasePath());
        if (apiChangeTreeManager == null) {
            return false;
        }
        return apiChangeTreeManager.isKeyChecked(key);
    }

    private static boolean isFileNodeCheckedStatus(Project project, String key) {
        ApiChangeTreeManager apiChangeTreeManager = apiChangeTreeManagerMap.get(project.getBasePath());
        if (apiChangeTreeManager == null) {
            return false;
        }
        return apiChangeTreeManager.isFileNodeKeyChecked(key);
    }

    private static JSONObject createLeftPagedResult(List<ApiDisplayItem> pageItems, Integer page, int pageSize, Project project) {
        PageResult pageResult = new PageResult();
        if (pageItems.isEmpty() || project.getBasePath() == null) {
            pageResult.setData(JSON.toJSONString(pageItems, (JSONWriter.Feature[])new JSONWriter.Feature[]{JSONWriter.Feature.LargeObject}));
        } else {
            ApiScanData data = ApiChangeAssistantFactory.getApiScanData(pageItems, project);
            String searchParams = ApiChangeTreeUtil.extractTreeLevelKeys(apiDisplayItemMap.get(project.getBasePath()));
            pageResult.setSearchParams(searchParams);
            int total = data.getTree().size();
            int start = page * pageSize;
            int end = Math.min(start + pageSize, total);
            data.setTree(data.getTree().subList(start, end));
            for (TreeApiDisplayItem treeApiDisplayItem : data.getTree()) {
                for (TreeApiDisplayItem secondTreeApiDisplayItem : treeApiDisplayItem.getChildren()) {
                    secondTreeApiDisplayItem.setChildrenCount(secondTreeApiDisplayItem.getChildren().size());
                    secondTreeApiDisplayItem.setChildren(secondTreeApiDisplayItem.getChildren().subList(0, 1));
                }
            }
            pageResult.setData(JSON.toJSONString((Object)data, (JSONWriter.Feature[])new JSONWriter.Feature[]{JSONWriter.Feature.LargeObject}));
            pageResult.setTotal(total);
        }
        if (page != null) {
            pageResult.setPage(page);
        }
        return JSON.parseObject((String)JSON.toJSONString((Object)pageResult, (JSONWriter.Feature[])new JSONWriter.Feature[]{JSONWriter.Feature.LargeObject}));
    }

    private static TreeApiDisplayItem getSecondSingleItem(TreeApiDisplayItem treeApiDisplayItem) {
        if (treeApiDisplayItem.getChildren().size() != 1 || treeApiDisplayItem.getChildren().getFirst() == null) {
            LOGGER.warn("treeApiDisplayItem is not single structure.");
            return null;
        }
        return treeApiDisplayItem.getChildren().getFirst();
    }

    private static TreeApiDisplayItem buildFileNode(Project project, Map.Entry<String, List<TreeApiDisplayItem>> entry) {
        TreeApiDisplayItem fileNode = TreeApiDisplayItem.builder().checkable(true).title(Path.of(entry.getKey(), new String[0]).getFileName().toString()).subtitle(entry.getKey()).children(entry.getValue()).childrenCount(entry.getValue().size()).type(FILE_NODE_TYPE).apiDisplayItem(entry.getValue().getFirst().getApiDisplayItem()).build();
        fileNode.setKey(ApiChangeTreeUtil.generateKeyForFileNode(fileNode));
        if (ApiChangeAssistantFactory.isFileNodeCheckedStatus(project, fileNode.getKey())) {
            fileNode.setChecked("checked");
        }
        return fileNode;
    }

    private static void groupCodeLocationsByFile(Project project, TreeApiDisplayItem treeApiDisplayItem) {
        List<TreeApiDisplayItem> codeLocations = TreeApiDisplayItem.getAllLeafNodes(treeApiDisplayItem);
        TreeApiDisplayItem methodDefinition = ApiChangeAssistantFactory.getSecondSingleItem(treeApiDisplayItem);
        if (methodDefinition == null) {
            LOGGER.warn("Invalid structure of right treeDisplayItem, keep origin structure");
            return;
        }
        Map<String, List<TreeApiDisplayItem>> codeLoactionMap = codeLocations.stream().collect(Collectors.groupingBy(item -> {
            ApiDisplayItem apiDisplayItem = item.getApiDisplayItem();
            Pair<String, Integer> codeLocation = ApiChangeLineTracker.parseApiDisplayItemLocation(apiDisplayItem.getLocation());
            if (codeLocation == null) {
                return "";
            }
            return (String)codeLocation.getFirst();
        }));
        ArrayList<TreeApiDisplayItem> fileNodes = new ArrayList<TreeApiDisplayItem>();
        for (Map.Entry<String, List<TreeApiDisplayItem>> entry : codeLoactionMap.entrySet()) {
            if (StringUtils.isBlank((CharSequence)entry.getKey())) {
                LOGGER.warn("Invalid path to parse.");
            }
            fileNodes.add(ApiChangeAssistantFactory.buildFileNode(project, entry));
        }
        methodDefinition.setChildren(fileNodes);
    }

    private static ApiChangeTreeManager createTreeDataManager(List<ApiDisplayItem> pageItems, Project project) {
        if (CollectionUtils.isEmpty(pageItems) || project.getBasePath() == null) {
            return new ApiChangeTreeManager(project, Collections.emptyList());
        }
        List<TreeApiDisplayItem> treeApiDisplayItemList = ApiChangeTreeUtil.transferToTree(pageItems, project);
        return new ApiChangeTreeManager(project, treeApiDisplayItemList);
    }

    private static ApiScanData getApiScanData(List<ApiDisplayItem> pageItems, Project project) {
        List<TreeApiDisplayItem> treeApiDisplayItemList = ApiChangeTreeUtil.transferToTree(pageItems, project);
        for (TreeApiDisplayItem treeApiDisplayItem : treeApiDisplayItemList) {
            if (ApiChangeAssistantFactory.isCheckedStatus(project, treeApiDisplayItem.getKey())) {
                treeApiDisplayItem.setChecked("checked");
            }
            for (TreeApiDisplayItem children : treeApiDisplayItem.getChildren()) {
                if (!ApiChangeAssistantFactory.isCheckedStatus(project, children.getKey())) continue;
                children.setChecked("checked");
            }
        }
        treeApiDisplayItemMap.put(project.getBasePath(), treeApiDisplayItemList);
        String treeSelectData = ApiChangeTreeUtil.extractTreeLevelKeys(pageItems);
        List<String> checkedKeys = ApiChangeTreeUtil.getCheckedKeys(project);
        return new ApiScanData(pageItems, treeApiDisplayItemList, treeSelectData, checkedKeys);
    }

    private static String trimPrefix(String basePath, String fullPath) {
        Path base = Paths.get(basePath, new String[0]).normalize();
        Path full = Paths.get(fullPath, new String[0]).normalize();
        if (!full.startsWith(base)) {
            LOGGER.warn("Code Location path does not include project path" + fullPath);
            return fullPath;
        }
        Path relative = base.relativize(full);
        return relative.toString();
    }

    public static String getAbsolutePathForRelativeApiPath(Project project, String pathFromEntry) {
        ProjectModel projectModel = ProjectModelManager.getInstance().getTargetProjectModel(project);
        if (projectModel == null) {
            LOGGER.warn("Unable to get absolute path because the projectModel is null");
            return null;
        }
        if (pathFromEntry == null) {
            LOGGER.warn("Unable to get absolute path because the pathFromEntry is null");
            return null;
        }
        try {
            Path path = Path.of(pathFromEntry, new String[0]);
            if (path.getNameCount() < 2) {
                LOGGER.warn("Unable to get absolute path because the pathFromEntry is invalid: " + pathFromEntry);
                return null;
            }
            String pathEntryName = path.getName(0).toString();
            String relativeToModulePath = path.subpath(1, path.getNameCount()).toString();
            Optional<ModuleModel> matchedModule = Optional.ofNullable(projectModel.getModuleModelList()).orElseGet(ArrayList::new).stream().filter(module -> pathEntryName.equals(new File(module.getModulePath()).getName())).filter(module -> Files.exists(Path.of(module.getModulePath(), relativeToModulePath), new LinkOption[0])).findFirst();
            return matchedModule.map(ModuleModel::getModulePath).map(p -> Path.of(p, new String[0]).resolve(path.subpath(1, path.getNameCount())).toString()).orElse(null);
        }
        catch (InvalidPathException e) {
            LOGGER.warn("Unable to get absolute path for invalid path: " + pathFromEntry);
            return null;
        }
        catch (IllegalArgumentException e) {
            LOGGER.warn("Unable to get absolute path for path: " + pathFromEntry);
            return null;
        }
    }

    private static String getRelativePathFromModuleForAbsolutePath(Project project, String absolutePath) {
        ProjectModel projectModel = ProjectModelManager.getInstance().getTargetProjectModel(project);
        if (projectModel == null) {
            LOGGER.warn("Unable to get module path because the projectModel is null");
            return null;
        }
        if (absolutePath == null) {
            LOGGER.warn("Unable to get module path because the absolutePath is null");
            return null;
        }
        try {
            Optional<ModuleModel> matchedModule = Optional.ofNullable(projectModel.getModuleModelList()).orElseGet(ArrayList::new).stream().filter(module -> Path.of(absolutePath, new String[0]).normalize().startsWith(Path.of(module.getModulePath(), new String[0]).normalize())).findFirst();
            return matchedModule.map(ModuleModel::getModulePath).map(p -> {
                Path path = Path.of(p, new String[0]);
                return path.getRoot().resolve(path.subpath(0, path.getNameCount() - 1)).relativize(Path.of(absolutePath, new String[0])).normalize().toString();
            }).orElse(null);
        }
        catch (InvalidPathException e) {
            LOGGER.warn("Unable to get path for invalid path: " + absolutePath);
            return null;
        }
        catch (IllegalArgumentException e) {
            LOGGER.warn("Unable to get relative path for path: " + absolutePath);
            return null;
        }
    }

    private static void unifiedPath(List<ApiDisplayItem> apiDisplayItems, Project project) {
        String basePathString = project.getBasePath();
        for (ApiDisplayItem item : apiDisplayItems) {
            Pair<String, Integer> codeLocation = ApiChangeLineTracker.parseApiDisplayItemLocation(item.getLocation());
            if (codeLocation == null) {
                LOGGER.warn("Parse code location failed: " + item.getLocation());
                continue;
            }
            if (ARK_TS_LANGUAGE.equals(item.getLanguage())) {
                item.setAbsolutePath(ApiChangeAssistantFactory.getAbsolutePathForRelativeApiPath(project, (String)codeLocation.getFirst()));
                continue;
            }
            item.setAbsolutePath((String)codeLocation.getFirst());
            item.setLocation(Optional.ofNullable(ApiChangeAssistantFactory.getRelativePathFromModuleForAbsolutePath(project, (String)codeLocation.getFirst())).map(relativePath -> relativePath + SPLIT_REGEX + String.valueOf(codeLocation.getSecond())).orElse(ApiChangeAssistantFactory.trimPrefix(basePathString, (String)codeLocation.getFirst()) + SPLIT_REGEX + String.valueOf(codeLocation.getSecond())));
        }
    }

    private SelectorHandler createSelectorHandler() {
        return new SelectorHandler((Component)this.contentPanel, null, FileChooserDescriptorFactory.createSingleFolderDescriptor(), path -> path);
    }

    private static void registerAvailableListener(@NotNull ProjectModel projectModel) {
        if (projectModel == null) {
            ApiChangeAssistantFactory.$$$reportNull$$$0(3);
        }
        OhosSyncListenerManager.getInstance((ProjectModel)projectModel).addListener(new OhosSyncDataListener(){

            public void syncSucceed(@NotNull ProjectModel projectModel) {
                ToolWindow toolWindow;
                if (projectModel == null) {
                    1.$$$reportNull$$$0(0);
                }
                if ((toolWindow = ToolWindowManager.getInstance((Project)projectModel.getProject()).getToolWindow("API Change Assistant")) == null) {
                    return;
                }
                ApplicationManager.getApplication().invokeLater(() -> {
                    boolean isOhHarmony = RuntimeOS.OPEN_HARMONY.getValue().equals(projectModel.getActiveRuntimeOS().getValue());
                    toolWindow.setAvailable(!isOhHarmony);
                });
            }

            public void syncFailed(@NotNull ProjectModel projectModel, @NotNull String errorMsg) {
                if (projectModel == null) {
                    1.$$$reportNull$$$0(1);
                }
                if (errorMsg == null) {
                    1.$$$reportNull$$$0(2);
                }
            }

            private static /* synthetic */ void $$$reportNull$$$0(int n) {
                Object[] objectArray;
                Object[] objectArray2;
                Object[] objectArray3 = new Object[3];
                switch (n) {
                    default: {
                        objectArray2 = objectArray3;
                        objectArray3[0] = "projectModel";
                        break;
                    }
                    case 2: {
                        objectArray2 = objectArray3;
                        objectArray3[0] = "errorMsg";
                        break;
                    }
                }
                objectArray2[1] = "com/huawei/deveco/programanalysis/apiscan/ApiChangeAssistantFactory$1";
                switch (n) {
                    default: {
                        objectArray = objectArray2;
                        objectArray2[2] = "syncSucceed";
                        break;
                    }
                    case 1: 
                    case 2: {
                        objectArray = objectArray2;
                        objectArray2[2] = "syncFailed";
                        break;
                    }
                }
                throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objectArray));
            }
        });
    }

    @Generated
    public static Map<String, List<ApiDisplayItem>> getApiDisplayItemMap() {
        return apiDisplayItemMap;
    }

    @Generated
    public static Map<String, ApiChangeTreeManager> getApiChangeTreeManagerMap() {
        return apiChangeTreeManagerMap;
    }

    private static /* synthetic */ void $$$reportNull$$$0(int n) {
        Object[] objectArray;
        Object[] objectArray2;
        Object[] objectArray3 = new Object[3];
        switch (n) {
            default: {
                objectArray2 = objectArray3;
                objectArray3[0] = "toolWindow";
                break;
            }
            case 1: {
                objectArray2 = objectArray3;
                objectArray3[0] = "project";
                break;
            }
            case 3: {
                objectArray2 = objectArray3;
                objectArray3[0] = "projectModel";
                break;
            }
        }
        objectArray2[1] = "com/huawei/deveco/programanalysis/apiscan/ApiChangeAssistantFactory";
        switch (n) {
            default: {
                objectArray = objectArray2;
                objectArray2[2] = "init";
                break;
            }
            case 1: 
            case 2: {
                objectArray = objectArray2;
                objectArray2[2] = "createToolWindowContent";
                break;
            }
            case 3: {
                objectArray = objectArray2;
                objectArray2[2] = "registerAvailableListener";
                break;
            }
        }
        throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objectArray));
    }

    private class ApiChangeScanHandler
    implements CefQueryHandler {
        private static final String PROGRESS_CPP_FILENAME = "progressCpp.txt";
        private static final String PROGRESS_ARKTS_FILENAME = "processArkTs.txt";
        private static final String TOTAL_NUM = "totalNum";
        private static final String CURRENT_MODULE = "currentModule";
        private static final String FINISHED_NUM = "finishedNum";
        private static final String CURRENT_PERCENT = "currentPercent";
        private static final Map<String, List<ApiDisplayItem>> apiDisplayItemTmpMap = new ConcurrentHashMap<String, List<ApiDisplayItem>>();
        private static final Map<String, List<ApiDisplayItem>> apiDisplayItemsSearchTmpMap = new ConcurrentHashMap<String, List<ApiDisplayItem>>();
        private static final Map<String, List<TreeApiDisplayItem>> treeApiDisplayItemTmpMap = new ConcurrentHashMap<String, List<TreeApiDisplayItem>>();
        private static final Map<String, ApiChangeTreeManager> apiChangeTreeManagerTmpMap = new ConcurrentHashMap<String, ApiChangeTreeManager>();
        private static final Map<String, ProgressIndicator> indicatorMap = new ConcurrentHashMap<String, ProgressIndicator>();
        private final Project project;
        private ApiChangeWindow apiChangeWindow;

        public ApiChangeScanHandler(@NotNull ApiChangeAssistantFactory apiChangeAssistantFactory, Project project, ApiChangeWindow apiChangeWindow) {
            if (project == null) {
                ApiChangeScanHandler.$$$reportNull$$$0(0);
            }
            this.project = project;
            this.apiChangeWindow = apiChangeWindow;
        }

        public void onQuery(@NotNull String scanParam, final @NotNull CefQueryCallback cefQueryCallback) {
            if (scanParam == null) {
                ApiChangeScanHandler.$$$reportNull$$$0(1);
            }
            if (cefQueryCallback == null) {
                ApiChangeScanHandler.$$$reportNull$$$0(2);
            }
            final String projectBasePath = this.project.getBasePath();
            final ApiScanParam apiScanParam = (ApiScanParam)JSON.parseObject((String)scanParam, ApiScanParam.class);
            if (apiScanParam.cancel() && indicatorMap.containsKey(projectBasePath)) {
                indicatorMap.get(projectBasePath).cancel();
                LOGGER.info("API scan task was cancelled");
                cefQueryCallback.failure(RequestErrorCode.EXIT_CODE_CANCEL.getCode(), "Task was cancelled");
                return;
            }
            Task.Backgroundable task = new Task.Backgroundable(this.project, "Scanning for API changes", true){

                public void run(@NotNull ProgressIndicator progressIndicator) {
                    if (progressIndicator == null) {
                        1.$$$reportNull$$$0(0);
                    }
                    if (projectBasePath == null) {
                        LOGGER.warn("project path is null");
                        cefQueryCallback.failure(RequestErrorCode.PROJECT_PATH_IS_NULL.getCode(), "project path is null");
                        return;
                    }
                    ApiChangeScanHandler.this.dataBackup(projectBasePath);
                    indicatorMap.put(projectBasePath, progressIndicator);
                    ApiChangeScanHandler.this.processQuery(apiScanParam, projectBasePath, cefQueryCallback);
                    indicatorMap.remove(projectBasePath);
                }

                public void onCancel() {
                    LOGGER.info("API scan task was cancelled");
                    cefQueryCallback.failure(RequestErrorCode.EXIT_CODE_CANCEL.getCode(), "Task was cancelled");
                }

                private static /* synthetic */ void $$$reportNull$$$0(int n) {
                    throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", "progressIndicator", "com/huawei/deveco/programanalysis/apiscan/ApiChangeAssistantFactory$ApiChangeScanHandler$1", "run"));
                }
            };
            ProgressManager.getInstance().run((Task)task);
        }

        private void processQuery(ApiScanParam apiScanParam, String projectBasePath, @NotNull CefQueryCallback cefQueryCallback) {
            if (cefQueryCallback == null) {
                ApiChangeScanHandler.$$$reportNull$$$0(3);
            }
            Future future = null;
            Future futureProcessDisplayItem = null;
            try {
                String failedFiles;
                Pair pair = null;
                List apiDisplayItems = new ArrayList();
                this.submitProcessTask(projectBasePath);
                future = ApplicationManager.getApplication().executeOnPooledThread(() -> ApiScanUtil.scanData(apiScanParam.startVersion(), apiScanParam.endVersion(), apiScanParam.modulePaths(), projectBasePath));
                while (!future.isDone()) {
                    try {
                        pair = (Pair)future.get(100L, TimeUnit.MILLISECONDS);
                        break;
                    }
                    catch (TimeoutException e) {
                        ProgressManager.checkCanceled();
                    }
                }
                ProgressManager.checkCanceled();
                if (pair == null) {
                    failedFiles = "";
                    LOGGER.warn("API Change Assistant Scan Failed.");
                    ApiNotifyUtil.showFailedNotify("", "", this.project);
                } else {
                    apiDisplayItems = (List)pair.getFirst();
                    failedFiles = (String)pair.getSecond();
                }
                List finalApiDisplayItems = apiDisplayItems;
                futureProcessDisplayItem = ApplicationManager.getApplication().executeOnPooledThread(() -> this.processDisplayItem(finalApiDisplayItems, apiScanParam, cefQueryCallback, failedFiles));
                while (!futureProcessDisplayItem.isDone()) {
                    try {
                        futureProcessDisplayItem.get(100L, TimeUnit.MILLISECONDS);
                        break;
                    }
                    catch (TimeoutException e) {
                        ProgressManager.checkCanceled();
                    }
                }
            }
            catch (ProcessCanceledException | InterruptedException | ExecutionException exception) {
                LOGGER.info("API scan task was cancelled");
                cefQueryCallback.failure(RequestErrorCode.EXIT_CODE_CANCEL.getCode(), "Task was cancelled");
                this.processException(projectBasePath, future, futureProcessDisplayItem);
            }
            this.removeFromMap(projectBasePath);
        }

        private void processException(String projectBasePath, Future<Pair<List<ApiDisplayItem>, String>> future, Future<?> futureProcessDisplayItem) {
            if (future != null) {
                future.cancel(true);
            }
            if (futureProcessDisplayItem != null) {
                futureProcessDisplayItem.cancel(true);
            }
            this.dataRecover(projectBasePath);
            ApiScanUtil.cancelApiScanProcess(projectBasePath);
            indicatorMap.remove(projectBasePath);
        }

        private void removeFromMap(String projectBasePath) {
            apiDisplayItemTmpMap.remove(projectBasePath);
            apiDisplayItemsSearchTmpMap.remove(projectBasePath);
            treeApiDisplayItemTmpMap.remove(projectBasePath);
            apiChangeTreeManagerTmpMap.remove(projectBasePath);
        }

        private void dataBackup(String projectBasePath) {
            if (CollectionUtils.isNotEmpty((Collection)apiDisplayItemMap.get(projectBasePath))) {
                apiDisplayItemTmpMap.put(projectBasePath, apiDisplayItemMap.get(projectBasePath));
            }
            if (CollectionUtils.isNotEmpty((Collection)apiDisplayItemsSearchMap.get(projectBasePath))) {
                apiDisplayItemsSearchTmpMap.put(projectBasePath, apiDisplayItemsSearchMap.get(projectBasePath));
            }
            if (CollectionUtils.isNotEmpty((Collection)treeApiDisplayItemMap.get(projectBasePath))) {
                treeApiDisplayItemTmpMap.put(projectBasePath, treeApiDisplayItemMap.get(projectBasePath));
            }
            if (apiChangeTreeManagerMap.get(projectBasePath) != null) {
                apiChangeTreeManagerTmpMap.put(projectBasePath, apiChangeTreeManagerMap.get(projectBasePath));
            }
        }

        private void dataRecover(String projectBasePath) {
            if (CollectionUtils.isEmpty((Collection)apiDisplayItemTmpMap.get(projectBasePath))) {
                apiDisplayItemMap.remove(projectBasePath);
            }
            if (CollectionUtils.isNotEmpty((Collection)apiDisplayItemTmpMap.get(projectBasePath)) && !apiDisplayItemTmpMap.get(projectBasePath).equals(apiDisplayItemMap.get(projectBasePath))) {
                apiDisplayItemMap.put(projectBasePath, apiDisplayItemTmpMap.get(projectBasePath));
            }
            if (CollectionUtils.isEmpty((Collection)apiDisplayItemsSearchTmpMap.get(projectBasePath))) {
                apiDisplayItemsSearchMap.remove(projectBasePath);
            }
            if (CollectionUtils.isNotEmpty((Collection)apiDisplayItemsSearchTmpMap.get(projectBasePath)) && !apiDisplayItemsSearchTmpMap.get(projectBasePath).equals(apiDisplayItemsSearchMap.get(projectBasePath))) {
                apiDisplayItemsSearchMap.put(projectBasePath, apiDisplayItemsSearchTmpMap.get(projectBasePath));
            }
            if (CollectionUtils.isEmpty((Collection)treeApiDisplayItemTmpMap.get(projectBasePath))) {
                treeApiDisplayItemMap.remove(projectBasePath);
            }
            if (CollectionUtils.isNotEmpty((Collection)treeApiDisplayItemTmpMap.get(projectBasePath)) && !treeApiDisplayItemTmpMap.get(projectBasePath).equals(treeApiDisplayItemMap.get(projectBasePath))) {
                treeApiDisplayItemMap.put(projectBasePath, treeApiDisplayItemTmpMap.get(projectBasePath));
            }
            if (apiChangeTreeManagerTmpMap.get(projectBasePath) == null) {
                apiChangeTreeManagerMap.remove(projectBasePath);
            }
            if (apiChangeTreeManagerTmpMap.get(projectBasePath) != null && !apiChangeTreeManagerTmpMap.get(projectBasePath).equals(apiChangeTreeManagerMap.get(projectBasePath))) {
                apiChangeTreeManagerMap.put(projectBasePath, apiChangeTreeManagerTmpMap.get(projectBasePath));
            }
        }

        private void processDisplayItem(List<ApiDisplayItem> apiDisplayItems, ApiScanParam apiScanParam, @NotNull CefQueryCallback cefQueryCallback, String failedFiles) {
            if (cefQueryCallback == null) {
                ApiChangeScanHandler.$$$reportNull$$$0(4);
            }
            LocalDateTime start = LocalDateTime.now();
            LOGGER.info("start processDisplayItem");
            ApiChangeAssistantFactory.unifiedPath(apiDisplayItems, this.project);
            String projectBasePath = this.project.getBasePath();
            if (projectBasePath != null) {
                apiDisplayItemMap.put(projectBasePath, apiDisplayItems);
                apiDisplayItemsSearchMap.put(projectBasePath, apiDisplayItems);
                ApiChangeTreeManager apiChangeTreeManager = ApiChangeAssistantFactory.createTreeDataManager(apiDisplayItems, this.project);
                apiChangeTreeManager.init();
                apiChangeTreeManagerMap.put(projectBasePath, apiChangeTreeManager);
                JSONObject result = ApiChangeAssistantFactory.createLeftPagedResult(apiDisplayItems, 0, 20, this.project);
                cefQueryCallback.success(result.toJSONString(new JSONWriter.Feature[]{JSONWriter.Feature.LargeObject}));
            } else {
                LOGGER.warn("project path is null");
                cefQueryCallback.failure(RequestErrorCode.PROJECT_PATH_IS_NULL.getCode(), "Task was cancelled");
            }
            ApiChangeLineTracker apiChangeLineTracker = apiChangeLineTrackerMap.get(this.project.getBasePath());
            if (Objects.isNull(apiChangeLineTracker)) {
                apiChangeLineTracker = new ApiChangeLineTracker();
            }
            JPanel contentPanelByProject = contentPanelMap.get(this.project.getBasePath());
            apiChangeLineTracker.setUp(ApiChangeAssistantFactory.getApiScanData(apiDisplayItems, this.project), this.project, contentPanelByProject);
            apiChangeLineTrackerMap.put(this.project.getBasePath(), apiChangeLineTracker);
            if (!failedFiles.isEmpty()) {
                LOGGER.info(String.format(Locale.ENGLISH, "C++ First Scan Skipped File List (excessively high nesting levels):\n%s", failedFiles));
            }
            LOGGER.info(String.format(Locale.ENGLISH, "processDisplayItem finished, cost time: %s ms", Duration.between(start, LocalDateTime.now()).toMillis()));
        }

        public void submitProcessTask(String projectPath) {
            ApiScanUtil.apiScanStageMap.put(projectPath, ProcessStatusEnum.STARTED.toString());
            ThreadPoolScheduledExecutor executor = new ThreadPoolScheduledExecutor();
            Runnable task = () -> {
                LOGGER.info(String.format(Locale.ENGLISH, "submit api scan process:%s", projectPath));
                if (MapUtils.isEmpty(ApiScanUtil.apiScanStageMap) || !ApiScanUtil.apiScanStageMap.containsKey(projectPath)) {
                    executor.shutdown();
                    return;
                }
                if (StringUtils.isBlank((CharSequence)ApiScanUtil.apiScanTmpPathMap.get(projectPath))) {
                    return;
                }
                String progressTmpPath = Paths.get(PathManager.getTempPath(), ApiScanUtil.apiScanTmpPathMap.get(projectPath)).toString();
                if (ApiScanUtil.apiScanStageMap.get(projectPath).equals(ProcessStatusEnum.PROCESSING_ARK_TS.toString())) {
                    this.executeProgress(projectPath, progressTmpPath, PROGRESS_ARKTS_FILENAME, ProcessStatusEnum.PROCESSING_ARK_TS);
                } else if (ApiScanUtil.apiScanStageMap.get(projectPath).equals(ProcessStatusEnum.PROCESSING_CPP.toString())) {
                    this.executeProgress(projectPath, progressTmpPath, PROGRESS_CPP_FILENAME, ProcessStatusEnum.PROCESSING_CPP);
                } else {
                    LOGGER.warn("API scan task is not normal");
                }
            };
            executor.startScheduledTask(task, 0L, 300L, TimeUnit.MILLISECONDS);
        }

        private void executeProgress(String projectPath, String progressTmpPath, String progressFilename, ProcessStatusEnum processStatus) {
            LOGGER.info(String.format("executeProgress projectPath: %s, progressTmpPath: %s, progressFilename: %s", projectPath, progressTmpPath, progressFilename));
            try {
                File processingFile = Paths.get(progressTmpPath, progressFilename).toFile();
                StringBuilder content = new StringBuilder();
                try (BufferedReader reader = new BufferedReader(new FileReader(processingFile));){
                    String line;
                    while ((line = reader.readLine()) != null) {
                        content.append(line);
                    }
                }
                catch (FileNotFoundException e) {
                    LOGGER.warn(String.format("get exists %s file FileNotFoundException:%s", processingFile.toPath(), e.getMessage()));
                    return;
                }
                catch (IOException e) {
                    LOGGER.warn(String.format("get exists %s file IOException:%s", processingFile.toPath(), e.getMessage()));
                    return;
                }
                if (StringUtils.isBlank((CharSequence)content.toString())) {
                    LOGGER.warn("scan content is empty");
                    return;
                }
                JSONObject jsonObject = JSONObject.parseObject((String)content.toString());
                Integer totalNum = jsonObject.getInteger(TOTAL_NUM);
                Integer finishedNum = jsonObject.getInteger(FINISHED_NUM);
                String currentModule = jsonObject.getString(CURRENT_MODULE);
                if (Objects.nonNull(totalNum) && Objects.nonNull(finishedNum) && !totalNum.equals(0)) {
                    Double percent = (double)finishedNum.intValue() / (double)totalNum.intValue() * 100.0;
                    Double percentResult = this.getPercent(processStatus, jsonObject, percent, totalNum);
                    this.apiChangeWindow.sendProgressUpdate(processStatus.toString(), percentResult.intValue(), currentModule);
                }
            }
            catch (InvalidPathException e) {
                LOGGER.warn("Invalid progress path: " + progressTmpPath);
            }
            catch (JSONException e) {
                LOGGER.warn("JSON Parse Exception.");
            }
        }

        private Double getPercent(ProcessStatusEnum processStatus, JSONObject jsonObject, Double percent, Integer totalNum) {
            Double percentResult = percent;
            if (processStatus == ProcessStatusEnum.PROCESSING_ARK_TS) {
                String currentPercent = jsonObject.getString(CURRENT_PERCENT);
                try {
                    percentResult = percentResult + (StringUtils.isNotBlank((CharSequence)currentPercent) ? Double.parseDouble(currentPercent) / (double)totalNum.intValue() : 0.0);
                }
                catch (NumberFormatException e) {
                    LOGGER.warn("Invalid percent format: " + currentPercent);
                }
            }
            return percentResult;
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
                    objectArray3[0] = "scanParam";
                    break;
                }
                case 2: 
                case 3: 
                case 4: {
                    objectArray2 = objectArray3;
                    objectArray3[0] = "cefQueryCallback";
                    break;
                }
            }
            objectArray2[1] = "com/huawei/deveco/programanalysis/apiscan/ApiChangeAssistantFactory$ApiChangeScanHandler";
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
                case 3: {
                    objectArray = objectArray2;
                    objectArray2[2] = "processQuery";
                    break;
                }
                case 4: {
                    objectArray = objectArray2;
                    objectArray2[2] = "processDisplayItem";
                    break;
                }
            }
            throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objectArray));
        }
    }

    private static class LinkJumpHandler
    implements CefQueryHandler {
        private LinkJumpHandler() {
        }

        public void onQuery(@NotNull String data, @NotNull CefQueryCallback cefQueryCallback) {
            if (data == null) {
                LinkJumpHandler.$$$reportNull$$$0(0);
            }
            if (cefQueryCallback == null) {
                LinkJumpHandler.$$$reportNull$$$0(1);
            }
            BrowserUtil.browse((String)data);
        }

        private static /* synthetic */ void $$$reportNull$$$0(int n) {
            Object[] objectArray;
            Object[] objectArray2 = new Object[3];
            switch (n) {
                default: {
                    objectArray = objectArray2;
                    objectArray2[0] = "data";
                    break;
                }
                case 1: {
                    objectArray = objectArray2;
                    objectArray2[0] = "cefQueryCallback";
                    break;
                }
            }
            objectArray[1] = "com/huawei/deveco/programanalysis/apiscan/ApiChangeAssistantFactory$LinkJumpHandler";
            objectArray[2] = "onQuery";
            throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objectArray));
        }
    }

    private static class CodeLocationHandler
    implements CefQueryHandler {
        private final Project project;

        public CodeLocationHandler(@NotNull Project project) {
            if (project == null) {
                CodeLocationHandler.$$$reportNull$$$0(0);
            }
            this.project = project;
        }

        public void onQuery(@NotNull String location, @NotNull CefQueryCallback cefQueryCallback) {
            if (location == null) {
                CodeLocationHandler.$$$reportNull$$$0(1);
            }
            if (cefQueryCallback == null) {
                CodeLocationHandler.$$$reportNull$$$0(2);
            }
            LOGGER.info(String.format(Locale.ENGLISH, "start CodeLocationHandler.location:%s", location));
            LocalDateTime startAll = LocalDateTime.now();
            String basePath = this.project.getBasePath();
            if (basePath == null) {
                LOGGER.warn("base Path is null");
                return;
            }
            String[] locationSplit = location.split(ApiChangeAssistantFactory.SPLIT_REGEX);
            Path codeFilePath = this.locateFile(locationSplit[0]);
            if (codeFilePath == null) {
                LOGGER.warn("Unable to locate the line of code because codeFilePath is null");
                return;
            }
            LocalDateTime startVirtualFile = LocalDateTime.now();
            VirtualFile virtualFile = VfsUtil.findFile((Path)codeFilePath, (boolean)true);
            LOGGER.info(String.format(Locale.ENGLISH, "find virtualFile finished, cost time: %s ms", Duration.between(startVirtualFile, LocalDateTime.now()).toMillis()));
            if (virtualFile == null) {
                LOGGER.warn("virtual file is null");
                return;
            }
            this.processCodeLocation(virtualFile, locationSplit);
            LOGGER.info(String.format(Locale.ENGLISH, "CodeLocationHandler finished, cost time: %s ms", Duration.between(startAll, LocalDateTime.now()).toMillis()));
        }

        private void processCodeLocation(VirtualFile virtualFile, String[] locationSplit) {
            ApplicationManager.getApplication().invokeLater(() -> {
                LocalDateTime startPsiFile = LocalDateTime.now();
                PsiFile targetFile = PsiManager.getInstance((Project)this.project).findFile(virtualFile);
                LOGGER.info(String.format(Locale.ENGLISH, "get PsiFile finished, cost time: %s ms", Duration.between(startPsiFile, LocalDateTime.now()).toMillis()));
                if (targetFile != null) {
                    LocalDateTime startDocument = LocalDateTime.now();
                    Document document = PsiDocumentManager.getInstance((Project)this.project).getDocument(targetFile);
                    LOGGER.info(String.format(Locale.ENGLISH, "get Document finished, cost time: %s ms", Duration.between(startDocument, LocalDateTime.now()).toMillis()));
                    if (document == null) {
                        LOGGER.warn("doucument is null, can not jump to specified code row");
                        return;
                    }
                    int targetOffset = 0;
                    int codeLine = 0;
                    try {
                        codeLine = Integer.parseInt(locationSplit[1]) - 1;
                        targetOffset = document.getLineStartOffset(codeLine);
                    }
                    catch (NumberFormatException exception) {
                        LOGGER.warn("parseInt exception", (Throwable)exception);
                    }
                    OpenFileDescriptor descriptor = new OpenFileDescriptor(this.project, virtualFile);
                    LocalDateTime startEditor = LocalDateTime.now();
                    Editor editor = FileEditorManager.getInstance((Project)this.project).openTextEditor(descriptor, true);
                    LOGGER.info(String.format(Locale.ENGLISH, "get Editor finished, cost time: %s ms", Duration.between(startEditor, LocalDateTime.now()).toMillis()));
                    if (editor == null) {
                        LOGGER.warn("editor is null, can not jump to specified code row");
                        return;
                    }
                    FoldingModel foldingModel = editor.getFoldingModel();
                    LocalDateTime startexpandIfFolded = LocalDateTime.now();
                    CodeLocationHandler.expandIfFolded(foldingModel, codeLine, editor);
                    LOGGER.info(String.format(Locale.ENGLISH, "expandIfFolded finished, cost time: %s ms", Duration.between(startexpandIfFolded, LocalDateTime.now()).toMillis()));
                    CaretModel caretModel = editor.getCaretModel();
                    caretModel.moveToOffset(targetOffset);
                    editor.getScrollingModel().scrollToCaret(ScrollType.CENTER);
                    LOGGER.info(String.format(Locale.ENGLISH, "EDT invokeLater finished, cost time: %s ms", Duration.between(startPsiFile, LocalDateTime.now()).toMillis()));
                }
            });
        }

        private Path locateFile(String relativePath) {
            if (StringUtils.isEmpty((CharSequence)relativePath)) {
                LOGGER.warn("Unable to locate the file where the code resides because relativePath is empty");
                return null;
            }
            ProjectModel projectModel = ProjectModelManager.getInstance().getTargetProjectModel(this.project);
            if (projectModel == null) {
                LOGGER.warn("Unable to locate the file where the code resides because projectModel is null");
                return null;
            }
            try {
                Path path = Paths.get(relativePath, new String[0]);
                if (path.getNameCount() < 2) {
                    LOGGER.warn("Unable to locate the file where the code resides because relativePath is not valid: " + relativePath);
                    return null;
                }
                String modulePathName = path.getName(0).toString();
                String relativeToModulePath = path.subpath(1, path.getNameCount()).toString();
                List<ModuleModel> moduleModelList = projectModel.getModuleModelList().stream().filter(module -> modulePathName.equals(new File(module.getModulePath()).getName())).toList();
                if (moduleModelList.size() != 1) {
                    String template = "locate the file where the code resides, expecting to locate one unique module by module name: %s, but actually get %d";
                    LOGGER.warn(String.format(Locale.ENGLISH, template, modulePathName, moduleModelList.size()));
                    return this.getPathByRelativeToModulePath(moduleModelList, relativeToModulePath);
                }
                return Paths.get(moduleModelList.get(0).getModulePath(), relativeToModulePath);
            }
            catch (InvalidPathException exception) {
                LOGGER.warn("Unable to locate the file where the code resides");
                return null;
            }
        }

        private Path getPathByRelativeToModulePath(List<ModuleModel> moduleModelList, String relativeToModulePath) {
            for (ModuleModel module : moduleModelList) {
                if (!Files.exists(Path.of(module.getModulePath(), relativeToModulePath), new LinkOption[0])) continue;
                return Paths.get(module.getModulePath(), relativeToModulePath);
            }
            return null;
        }

        private static void expandIfFolded(FoldingModel foldingModel, int targetLine, Editor editor) {
            foldingModel.runBatchFoldingOperation(() -> {
                Document document = editor.getDocument();
                for (FoldRegion region : foldingModel.getAllFoldRegions()) {
                    int startOffset = region.getStartOffset();
                    int endOffset = region.getEndOffset();
                    int targetLineStartOffset = document.getLineStartOffset(targetLine);
                    int targetLineEndOffset = document.getLineEndOffset(targetLine);
                    if (startOffset > targetLineEndOffset || endOffset < targetLineStartOffset) continue;
                    region.setExpanded(true);
                }
            });
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
                    objectArray3[0] = "location";
                    break;
                }
                case 2: {
                    objectArray2 = objectArray3;
                    objectArray3[0] = "cefQueryCallback";
                    break;
                }
            }
            objectArray2[1] = "com/huawei/deveco/programanalysis/apiscan/ApiChangeAssistantFactory$CodeLocationHandler";
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

    private static class ChooseApiVersionHandler
    implements CefQueryHandler {
        private final ProjectModel projectModel;

        public ChooseApiVersionHandler(@NotNull Project project) {
            if (project == null) {
                ChooseApiVersionHandler.$$$reportNull$$$0(0);
            }
            this.projectModel = ProjectModelManager.getInstance().getTargetProjectModel(project);
        }

        public void onQuery(@NotNull String data, @NotNull CefQueryCallback cefQueryCallback) {
            if (data == null) {
                ChooseApiVersionHandler.$$$reportNull$$$0(1);
            }
            if (cefQueryCallback == null) {
                ChooseApiVersionHandler.$$$reportNull$$$0(2);
            }
            JSONObject sendData = new JSONObject();
            sendData.put((Object)"startVersion", (Object)ApiScanUtil.getScanStartVersion(this.projectModel));
            sendData.put((Object)"versionList", (Object)new JSONArray(ApiScanUtil.VERSION_LIST));
            cefQueryCallback.success(sendData.toJSONString(new JSONWriter.Feature[]{JSONWriter.Feature.LargeObject}));
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
                    objectArray3[0] = "data";
                    break;
                }
                case 2: {
                    objectArray2 = objectArray3;
                    objectArray3[0] = "cefQueryCallback";
                    break;
                }
            }
            objectArray2[1] = "com/huawei/deveco/programanalysis/apiscan/ApiChangeAssistantFactory$ChooseApiVersionHandler";
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

    private record CsvFileLocationHandler(Project project) implements CefQueryHandler
    {
        private CsvFileLocationHandler(@NotNull Project project) {
            if (project == null) {
                CsvFileLocationHandler.$$$reportNull$$$0(0);
            }
        }

        public void onQuery(@NotNull String filePath, @NotNull CefQueryCallback cefQueryCallback) {
            if (filePath == null) {
                CsvFileLocationHandler.$$$reportNull$$$0(1);
            }
            if (cefQueryCallback == null) {
                CsvFileLocationHandler.$$$reportNull$$$0(2);
            }
            Path path = Path.of(filePath, new String[0]);
            String csvFilePath = this.getCSVFilePath(filePath, path);
            this.createCSVFile(csvFilePath);
            try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter((OutputStream)new FileOutputStream(csvFilePath), StandardCharsets.UTF_8));){
                this.writeCSVHeader(writer);
                this.writeCSVContent(writer, csvFilePath);
            }
            catch (IOException exception) {
                this.handleCSVIOException(exception);
            }
        }

        private String getCSVFilePath(String filePath, Path path) {
            if (Files.isDirectory(path, new LinkOption[0])) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
                Date date = new Date();
                String timestamp = sdf.format(date);
                return Path.of(filePath, timestamp + ApiChangeAssistantFactory.API_CSV_SUFFIX).toString();
            }
            return filePath;
        }

        private void createCSVFile(String csvFilePath) {
            try {
                Files.createFile(Path.of(csvFilePath, new String[0]), new FileAttribute[0]);
            }
            catch (IOException exception) {
                this.handleCSVIOException(exception);
            }
        }

        private void writeCSVHeader(BufferedWriter writer) throws IOException {
            String header = String.join((CharSequence)ApiChangeAssistantFactory.CHANGE_TYPE_LINK_SYMBOL, DISPLAY_HEADER);
            writer.write(CSV_UTF_8_INPUT_CHAR.charValue());
            writer.write(header);
            writer.newLine();
        }

        private void writeCSVContent(BufferedWriter writer, String csvFilePath) throws IOException {
            List<ApiDisplayItem> apiDisplayItemsSearch = apiDisplayItemsSearchMap.get(this.project.getBasePath());
            List<TreeApiDisplayItem> treeApiDisplayItems = ApiChangeTreeUtil.transferToTree(apiDisplayItemsSearch, this.project);
            treeApiDisplayItems.forEach(item -> TreeApiDisplayItem.getAllLeafNodes(item).forEach(leafNode -> {
                List<String> row = this.createCSVRow((TreeApiDisplayItem)leafNode);
                String line = String.join((CharSequence)ApiChangeAssistantFactory.CHANGE_TYPE_LINK_SYMBOL, row);
                try {
                    writer.write(line);
                    writer.newLine();
                }
                catch (IOException e) {
                    this.handleCSVIOException(e);
                }
            }));
            ApiNotifyUtil.showSuccessNotify(new File(csvFilePath), this.project);
        }

        private List<String> createCSVRow(TreeApiDisplayItem leafNode) {
            ArrayList<String> row = new ArrayList<String>();
            row.add(CsvFileLocationHandler.escapeCsvField(leafNode.getApiDisplayItem().getApiDefinition()));
            row.add(CsvFileLocationHandler.escapeCsvField(leafNode.getApiDisplayItem().getLanguage()));
            row.add(CsvFileLocationHandler.escapeCsvField(leafNode.getApiDisplayItem().getSdkVersion()));
            row.add(CsvFileLocationHandler.escapeCsvField(leafNode.getApiDisplayItem().getAffectedVersions()));
            String hyperlinkFormula = String.format(ApiChangeAssistantFactory.CSV_INSIDE_HYPERLINK, CsvFileLocationHandler.escapeCsvField(leafNode.getApiDisplayItem().getTutoringUrl()), CsvFileLocationHandler.escapeCsvField(leafNode.getApiDisplayItem().getChangeTitle()));
            row.add(hyperlinkFormula);
            row.add(CsvFileLocationHandler.escapeCsvField(leafNode.getApiDisplayItem().getLocation()));
            row.add(CsvFileLocationHandler.escapeCsvField(leafNode.getChecked() != null ? HosProjectMgmtBundle.message("api.change.assistant.csv.output.fixed.fixed", new Object[0]) : HosProjectMgmtBundle.message("api.change.assistant.csv.output.fixed.unfixed", new Object[0])));
            row.add(CsvFileLocationHandler.escapeCsvField(leafNode.getApiDisplayItem().getChangeType()));
            return row;
        }

        private void handleCSVIOException(IOException exception) {
            LOGGER.warn("CSV file IO Exception.");
            ApiNotifyUtil.showWarnNotify(exception.getMessage(), this.project);
        }

        private static String escapeCsvField(String field) {
            if (field == null) {
                return "";
            }
            Object result = field;
            if (field.contains("\"") || field.contains(ApiChangeAssistantFactory.CHANGE_TYPE_LINK_SYMBOL) || field.contains("\n")) {
                result = "\"" + field.replace("\"", "\"\"") + "\"";
            }
            return result;
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
                    objectArray3[0] = "filePath";
                    break;
                }
                case 2: {
                    objectArray2 = objectArray3;
                    objectArray3[0] = "cefQueryCallback";
                    break;
                }
            }
            objectArray2[1] = "com/huawei/deveco/programanalysis/apiscan/ApiChangeAssistantFactory$CsvFileLocationHandler";
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

    private static class SearchContentHandler
    implements CefQueryHandler {
        private final Project project;

        public SearchContentHandler(@NotNull Project project) {
            if (project == null) {
                SearchContentHandler.$$$reportNull$$$0(0);
            }
            this.project = project;
        }

        public void onQuery(@NotNull String searchParam, @NotNull CefQueryCallback cefQueryCallback) {
            if (searchParam == null) {
                SearchContentHandler.$$$reportNull$$$0(1);
            }
            if (cefQueryCallback == null) {
                SearchContentHandler.$$$reportNull$$$0(2);
            }
            try {
                List<ApiDisplayItem> apiDisplayItems;
                JSONObject param = JSON.parseObject((String)searchParam);
                String content = param.getString("content");
                int pageSize = 20;
                if (param.containsKey("pageSize")) {
                    pageSize = param.getIntValue("pageSize");
                }
                if ((apiDisplayItems = apiDisplayItemMap.get(this.project.getBasePath())) == null) {
                    JSONObject result = ApiChangeAssistantFactory.createPagedResult(new ArrayList<ApiDisplayItem>(), 0, null, null);
                    cefQueryCallback.success(result.toJSONString(new JSONWriter.Feature[]{JSONWriter.Feature.LargeObject}));
                    return;
                }
                List<ApiDisplayItem> apiDisplayItemsSearch = StringUtils.isEmpty((CharSequence)content) ? new ArrayList<ApiDisplayItem>(apiDisplayItems) : apiDisplayItems.stream().filter(apiDisplayItem -> apiDisplayItem.getApiDefinition().contains(content) || apiDisplayItem.getLocation().contains(content)).collect(Collectors.toList());
                apiDisplayItemsSearchMap.put(this.project.getBasePath(), apiDisplayItemsSearch);
                int totalSize = apiDisplayItemsSearch.size();
                int endIndex = Math.min(pageSize, totalSize);
                List<ApiDisplayItem> firstPageData = apiDisplayItemsSearch.subList(0, endIndex);
                JSONObject result = ApiChangeAssistantFactory.createPagedResult(firstPageData, totalSize, null, this.project);
                cefQueryCallback.success(result.toJSONString(new JSONWriter.Feature[]{JSONWriter.Feature.LargeObject}));
            }
            catch (JSONException exception) {
                LOGGER.warn("Failed to parse search content");
                cefQueryCallback.failure(RequestErrorCode.EXIT_CODE_JSON_FAILED.getCode(), "Invalid JSON format");
            }
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
                    objectArray3[0] = "searchParam";
                    break;
                }
                case 2: {
                    objectArray2 = objectArray3;
                    objectArray3[0] = "cefQueryCallback";
                    break;
                }
            }
            objectArray2[1] = "com/huawei/deveco/programanalysis/apiscan/ApiChangeAssistantFactory$SearchContentHandler";
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

    private static class LoadApiScanSettingHandler
    implements CefQueryHandler {
        private LoadApiScanSettingHandler() {
        }

        public void onQuery(@NotNull String data, @NotNull CefQueryCallback cefQueryCallback) {
            if (data == null) {
                LoadApiScanSettingHandler.$$$reportNull$$$0(0);
            }
            if (cefQueryCallback == null) {
                LoadApiScanSettingHandler.$$$reportNull$$$0(1);
            }
            Map<String, Integer> configs = Map.of("maxOldSpaceSize", ApiScanConfigs.getMaxOldSpaceSize(), "systemMemory", ApiScanConfigs.getSystemMemoryMB());
            cefQueryCallback.success(JSON.toJSONString(configs));
        }

        private static /* synthetic */ void $$$reportNull$$$0(int n) {
            Object[] objectArray;
            Object[] objectArray2 = new Object[3];
            switch (n) {
                default: {
                    objectArray = objectArray2;
                    objectArray2[0] = "data";
                    break;
                }
                case 1: {
                    objectArray = objectArray2;
                    objectArray2[0] = "cefQueryCallback";
                    break;
                }
            }
            objectArray[1] = "com/huawei/deveco/programanalysis/apiscan/ApiChangeAssistantFactory$LoadApiScanSettingHandler";
            objectArray[2] = "onQuery";
            throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objectArray));
        }
    }

    private static class SaveApiScanSettingHandler
    implements CefQueryHandler {
        private SaveApiScanSettingHandler() {
        }

        public void onQuery(@NotNull String data, @NotNull CefQueryCallback cefQueryCallback) {
            if (data == null) {
                SaveApiScanSettingHandler.$$$reportNull$$$0(0);
            }
            if (cefQueryCallback == null) {
                SaveApiScanSettingHandler.$$$reportNull$$$0(1);
            }
            try {
                JSONObject jsonObject = JSON.parseObject((String)data);
                if (jsonObject != null) {
                    ApiScanConfigs.setMaxOldSpaceSize(jsonObject.getInteger("maxOldSpaceSize"));
                }
            }
            catch (JSONException exception) {
                LOGGER.warn("parse json object error.");
            }
        }

        private static /* synthetic */ void $$$reportNull$$$0(int n) {
            Object[] objectArray;
            Object[] objectArray2 = new Object[3];
            switch (n) {
                default: {
                    objectArray = objectArray2;
                    objectArray2[0] = "data";
                    break;
                }
                case 1: {
                    objectArray = objectArray2;
                    objectArray2[0] = "cefQueryCallback";
                    break;
                }
            }
            objectArray[1] = "com/huawei/deveco/programanalysis/apiscan/ApiChangeAssistantFactory$SaveApiScanSettingHandler";
            objectArray[2] = "onQuery";
            throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objectArray));
        }
    }

    private static class SettingHelpHandler
    implements CefQueryHandler {
        private SettingHelpHandler() {
        }

        public void onQuery(@NotNull String data, @NotNull CefQueryCallback cefQueryCallback) {
            if (data == null) {
                SettingHelpHandler.$$$reportNull$$$0(0);
            }
            if (cefQueryCallback == null) {
                SettingHelpHandler.$$$reportNull$$$0(1);
            }
            String url = HelpUrlPathServiceImpl.getInstance().getDevelopUrl("ide.api.change.setting.help.url");
            BrowserUtil.browse((String)url);
        }

        private static /* synthetic */ void $$$reportNull$$$0(int n) {
            Object[] objectArray;
            Object[] objectArray2 = new Object[3];
            switch (n) {
                default: {
                    objectArray = objectArray2;
                    objectArray2[0] = "data";
                    break;
                }
                case 1: {
                    objectArray = objectArray2;
                    objectArray2[0] = "cefQueryCallback";
                    break;
                }
            }
            objectArray[1] = "com/huawei/deveco/programanalysis/apiscan/ApiChangeAssistantFactory$SettingHelpHandler";
            objectArray[2] = "onQuery";
            throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objectArray));
        }
    }

    private static class PageDataHandler
    implements CefQueryHandler {
        private final Project project;

        public PageDataHandler(@NotNull Project project) {
            if (project == null) {
                PageDataHandler.$$$reportNull$$$0(0);
            }
            this.project = project;
        }

        public void onQuery(@NotNull String pageParam, @NotNull CefQueryCallback cefQueryCallback) {
            if (pageParam == null) {
                PageDataHandler.$$$reportNull$$$0(1);
            }
            if (cefQueryCallback == null) {
                PageDataHandler.$$$reportNull$$$0(2);
            }
            try {
                JSONObject param = JSON.parseObject((String)pageParam);
                int page = param.getInteger("page");
                int pageSize = param.getIntValue("pageSize");
                if (page < 0 || pageSize <= 0) {
                    cefQueryCallback.failure(RequestErrorCode.INVALID_PAGE_PARAM.getCode(), "Invalid page parameters");
                    return;
                }
                List<ApiDisplayItem> apiDisplayItemsSearch = apiDisplayItemsSearchMap.get(this.project.getBasePath());
                if (apiDisplayItemsSearch == null) {
                    JSONObject result = ApiChangeAssistantFactory.createPagedResult(new ArrayList<ApiDisplayItem>(), 0, page, null);
                    cefQueryCallback.success(result.toJSONString(new JSONWriter.Feature[]{JSONWriter.Feature.LargeObject}));
                    return;
                }
                JSONObject result = ApiChangeAssistantFactory.createLeftPagedResult(apiDisplayItemsSearch, page, pageSize, this.project);
                cefQueryCallback.success(result.toJSONString(new JSONWriter.Feature[]{JSONWriter.Feature.LargeObject}));
            }
            catch (JSONException e) {
                LOGGER.warn("Failed to parse page parameters.");
                cefQueryCallback.failure(RequestErrorCode.EXIT_CODE_JSON_FAILED.getCode(), "Invalid JSON format");
            }
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
                    objectArray3[0] = "pageParam";
                    break;
                }
                case 2: {
                    objectArray2 = objectArray3;
                    objectArray3[0] = "cefQueryCallback";
                    break;
                }
            }
            objectArray2[1] = "com/huawei/deveco/programanalysis/apiscan/ApiChangeAssistantFactory$PageDataHandler";
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

    public static class FilterApiChangesHandler
    implements CefQueryHandler {
        private final Project project;

        public FilterApiChangesHandler(@NotNull Project project) {
            if (project == null) {
                FilterApiChangesHandler.$$$reportNull$$$0(0);
            }
            this.project = project;
        }

        public void onQuery(@NotNull String filterParam, @NotNull CefQueryCallback cefQueryCallback) {
            if (filterParam == null) {
                FilterApiChangesHandler.$$$reportNull$$$0(1);
            }
            if (cefQueryCallback == null) {
                FilterApiChangesHandler.$$$reportNull$$$0(2);
            }
            ApiChangeFilterParams apiChangeFilterParams = (ApiChangeFilterParams)JSON.parseObject((String)filterParam, ApiChangeFilterParams.class);
            List<ApiDisplayItem> apiDisplayItems = apiDisplayItemMap.get(this.project.getBasePath());
            if (apiDisplayItems == null) {
                JSONObject result = ApiChangeAssistantFactory.createPagedResult(new ArrayList<ApiDisplayItem>(), 0, null, null);
                cefQueryCallback.success(result.toJSONString(new JSONWriter.Feature[]{JSONWriter.Feature.LargeObject}));
                return;
            }
            List<ApiDisplayItem> filterItems = apiDisplayItems.stream().filter(item -> FilterApiChangesHandler.isKeptItem(apiChangeFilterParams, item)).toList();
            List<String> checkedKeys = ApiChangeTreeUtil.getCheckedKeys(this.project);
            List<TreeApiDisplayItem> treeData = ApiChangeTreeUtil.transferToTree(filterItems, this.project);
            ArrayList<ApiDisplayItem> filteredItems = new ArrayList<ApiDisplayItem>();
            treeData.forEach(firstItem -> firstItem.getChildren().forEach(secondItem -> this.processSecondItem((TreeApiDisplayItem)secondItem, apiChangeFilterParams, checkedKeys, filteredItems)));
            apiDisplayItemsSearchMap.put(this.project.getBasePath(), filteredItems);
            JSONObject result = ApiChangeAssistantFactory.createLeftPagedResult(filteredItems, 0, apiChangeFilterParams.getPageSize(), this.project);
            cefQueryCallback.success(result.toJSONString(new JSONWriter.Feature[]{JSONWriter.Feature.LargeObject}));
        }

        private void processSecondItem(TreeApiDisplayItem secondItem, ApiChangeFilterParams apiChangeFilterParams, List<String> checkedKeys, List<ApiDisplayItem> filteredItems) {
            List<TreeApiDisplayItem> thirdItems = secondItem.getChildren();
            thirdItems.removeIf(thirdItem -> {
                if (ApiChangeAssistantFactory.STATUS_FIXED.equals(apiChangeFilterParams.getFixStatus())) {
                    return !checkedKeys.contains(thirdItem.getKey());
                }
                if (ApiChangeAssistantFactory.STATUS_UNFIXED.equals(apiChangeFilterParams.getFixStatus())) {
                    return checkedKeys.contains(thirdItem.getKey());
                }
                return false;
            });
            filteredItems.addAll(thirdItems.stream().map(TreeApiDisplayItem::getApiDisplayItem).toList());
        }

        private static boolean isChangeTypeMatch(ApiChangeFilterParams filterParams, ApiDisplayItem item) {
            if (filterParams.getChangeType() == null) {
                return true;
            }
            String[] changeTypeList = filterParams.getChangeType().split(ApiChangeAssistantFactory.CHANGE_TYPE_LINK_SYMBOL);
            return Arrays.asList(changeTypeList).contains(item.getChangeType());
        }

        private static boolean isKeptItem(ApiChangeFilterParams filterParams, ApiDisplayItem item) {
            if (filterParams.getApiVersion() != null && !filterParams.getApiVersion().equals(ApiChangeAssistantFactory.ALL_SELECTION) && !item.getSdkVersion().equals(filterParams.getApiVersion())) {
                return false;
            }
            if (filterParams.getChangeId() != null && !filterParams.getChangeId().equals(ApiChangeAssistantFactory.ALL_SELECTION) && !item.getChangeId().equals(filterParams.getChangeId())) {
                return false;
            }
            if (filterParams.getLanguage() != null && !filterParams.getLanguage().equals(ApiChangeAssistantFactory.ALL_SELECTION) && !item.getLanguage().equals(filterParams.getLanguage())) {
                return false;
            }
            if (filterParams.getApiId() != null && !filterParams.getApiId().equals(ApiChangeAssistantFactory.ALL_SELECTION) && !item.getApiDefinition().equals(filterParams.getApiId())) {
                return false;
            }
            if (!FilterApiChangesHandler.isChangeTypeMatch(filterParams, item)) {
                return false;
            }
            String searchValue = filterParams.getSearchValue();
            return searchValue == null || searchValue.isEmpty() || item.getApiDefinition().toLowerCase(Locale.ENGLISH).contains(searchValue.toLowerCase(Locale.ENGLISH)) || item.getLocation().toLowerCase(Locale.ENGLISH).contains(searchValue.toLowerCase(Locale.ENGLISH));
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
                    objectArray3[0] = "filterParam";
                    break;
                }
                case 2: {
                    objectArray2 = objectArray3;
                    objectArray3[0] = "cefQueryCallback";
                    break;
                }
            }
            objectArray2[1] = "com/huawei/deveco/programanalysis/apiscan/ApiChangeAssistantFactory$FilterApiChangesHandler";
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

    private static class GetLocationHandler
    implements CefQueryHandler {
        private final Project project;

        public GetLocationHandler(@NotNull Project project) {
            if (project == null) {
                GetLocationHandler.$$$reportNull$$$0(0);
            }
            this.project = project;
        }

        public void onQuery(@NotNull String pageParam, @NotNull CefQueryCallback cefQueryCallback) {
            if (pageParam == null) {
                GetLocationHandler.$$$reportNull$$$0(1);
            }
            if (cefQueryCallback == null) {
                GetLocationHandler.$$$reportNull$$$0(2);
            }
            try {
                GetLocationParam requestParams = (GetLocationParam)JSON.parseObject((String)pageParam, GetLocationParam.class);
                String changeID = requestParams.getChangeID();
                String methodDefinition = requestParams.getMethodDefinition();
                int page = requestParams.getPage();
                int pageSize = requestParams.getPageSize();
                if (page < 0 || pageSize <= 0) {
                    cefQueryCallback.failure(RequestErrorCode.INVALID_PAGE_PARAM.getCode(), "Invalid page parameters");
                    return;
                }
                List<ApiDisplayItem> locationList = apiDisplayItemsSearchMap.get(this.project.getBasePath()).stream().filter(item -> item.getChangeId().equals(changeID) && item.getApiDefinition().equals(methodDefinition)).toList();
                int start = page * pageSize;
                int end = Math.min(start + pageSize, locationList.size());
                JSONObject result = ApiChangeAssistantFactory.createPagedResult(locationList.subList(start, end), locationList.size(), page, this.project);
                cefQueryCallback.success(result.toJSONString(new JSONWriter.Feature[]{JSONWriter.Feature.LargeObject}));
            }
            catch (JSONException e) {
                LOGGER.warn("Failed to parse page parameters.");
                cefQueryCallback.failure(RequestErrorCode.EXIT_CODE_JSON_FAILED.getCode(), "Invalid JSON format");
            }
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
                    objectArray3[0] = "pageParam";
                    break;
                }
                case 2: {
                    objectArray2 = objectArray3;
                    objectArray3[0] = "cefQueryCallback";
                    break;
                }
            }
            objectArray2[1] = "com/huawei/deveco/programanalysis/apiscan/ApiChangeAssistantFactory$GetLocationHandler";
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

    private static enum RequestErrorCode {
        EXIT_CODE_CANCEL(1),
        EXIT_CODE_JSON_FAILED(2),
        PROJECT_PATH_IS_NULL(3),
        INVALID_PAGE_PARAM(400);

        private final int code;

        private RequestErrorCode(int code) {
            this.code = code;
        }

        @Generated
        public int getCode() {
            return this.code;
        }
    }
}

