/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.intellij.openapi.Disposable
 *  com.intellij.openapi.diagnostic.Logger
 *  com.intellij.openapi.editor.Document
 *  com.intellij.openapi.editor.Editor
 *  com.intellij.openapi.editor.RangeMarker
 *  com.intellij.openapi.editor.event.DocumentEvent
 *  com.intellij.openapi.editor.event.DocumentListener
 *  com.intellij.openapi.fileEditor.FileDocumentManager
 *  com.intellij.openapi.fileEditor.FileEditorManager
 *  com.intellij.openapi.fileEditor.FileEditorManagerEvent
 *  com.intellij.openapi.fileEditor.FileEditorManagerListener
 *  com.intellij.openapi.project.Project
 *  com.intellij.openapi.util.Pair
 *  com.intellij.openapi.util.TextRange
 *  com.intellij.openapi.vfs.VirtualFile
 *  org.apache.commons.collections.CollectionUtils
 *  org.jetbrains.annotations.NotNull
 */
package com.huawei.deveco.programanalysis.apiscan;

import com.huawei.deveco.programanalysis.apiscan.ApiChangeAssistantFactory;
import com.huawei.deveco.programanalysis.apiscan.ApiChangeTreeManager;
import com.huawei.deveco.programanalysis.apiscan.ApiChangeTreeUtil;
import com.huawei.deveco.programanalysis.apiscan.ApiChangeWindow;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiDisplayItem;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiLineChangeData;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiMarker;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiScanData;
import com.intellij.openapi.Disposable;
import com.intellij.openapi.diagnostic.Logger;
import com.intellij.openapi.editor.Document;
import com.intellij.openapi.editor.Editor;
import com.intellij.openapi.editor.RangeMarker;
import com.intellij.openapi.editor.event.DocumentEvent;
import com.intellij.openapi.editor.event.DocumentListener;
import com.intellij.openapi.fileEditor.FileDocumentManager;
import com.intellij.openapi.fileEditor.FileEditorManager;
import com.intellij.openapi.fileEditor.FileEditorManagerEvent;
import com.intellij.openapi.fileEditor.FileEditorManagerListener;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Pair;
import com.intellij.openapi.util.TextRange;
import com.intellij.openapi.vfs.VirtualFile;
import java.nio.file.InvalidPathException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;
import javax.swing.JPanel;
import org.apache.commons.collections.CollectionUtils;
import org.jetbrains.annotations.NotNull;

public class ApiChangeLineTracker {
    private static final Logger LOGGER = Logger.getInstance(ApiChangeLineTracker.class);
    private static final String CODE_LOCATION_SEPARATOR = ":";
    private ApiScanData apiScanData = null;
    private Project project = null;
    private String projectPath;
    private Map<VirtualFile, List<ApiMarker>> fileToMarkers = new ConcurrentHashMap<VirtualFile, List<ApiMarker>>();
    private ApiChangeWindow contentPanel;
    private DocumentListener documentListener;
    private Map<VirtualFile, DocumentListener> fileToListner = new ConcurrentHashMap<VirtualFile, DocumentListener>();

    private void addListenerOnFile(VirtualFile file, DocumentListener listener) {
        if (file == null || this.fileToListner.containsKey(file)) {
            return;
        }
        Document document = FileDocumentManager.getInstance().getDocument(file);
        if (document == null) {
            return;
        }
        if (!this.fileToListner.isEmpty()) {
            this.fileToListner.forEach((k, v) -> document.removeDocumentListener(v));
        }
        document.addDocumentListener(listener, (Disposable)this.project);
        this.fileToListner.put(file, listener);
    }

    private void removeListenerOnFile(VirtualFile file) {
        if (!this.fileToListner.containsKey(file)) {
            return;
        }
        Document document = FileDocumentManager.getInstance().getDocument(file);
        if (document == null || this.fileToListner.get(file) == null) {
            return;
        }
        document.removeDocumentListener(this.fileToListner.get(file));
        this.fileToListner.remove(file);
    }

    private void addEditorChangeListener(@NotNull Project project) {
        if (project == null) {
            ApiChangeLineTracker.$$$reportNull$$$0(0);
        }
        project.getMessageBus().connect().subscribe(FileEditorManagerListener.FILE_EDITOR_MANAGER, (Object)new FileEditorManagerListener(){

            public void fileOpened(@NotNull FileEditorManager source, @NotNull VirtualFile file) {
                if (source == null) {
                    1.$$$reportNull$$$0(0);
                }
                if (file == null) {
                    1.$$$reportNull$$$0(1);
                }
                ApiChangeLineTracker.this.setTrackerOnFile(file);
                ApiChangeLineTracker.this.addListenerOnFile(file, ApiChangeLineTracker.this.documentListener);
            }

            public void fileClosed(@NotNull FileEditorManager source, @NotNull VirtualFile file) {
                if (source == null) {
                    1.$$$reportNull$$$0(2);
                }
                if (file == null) {
                    1.$$$reportNull$$$0(3);
                }
                ApiChangeLineTracker.this.removeListenerOnFile(file);
            }

            public void selectionChanged(@NotNull FileEditorManagerEvent event) {
                if (event == null) {
                    1.$$$reportNull$$$0(4);
                }
                VirtualFile oldFile = event.getOldFile();
                VirtualFile newFile = event.getNewFile();
                if (oldFile != null) {
                    ApiChangeLineTracker.this.removeListenerOnFile(oldFile);
                }
                if (newFile != null) {
                    ApiChangeLineTracker.this.setTrackerOnFile(newFile);
                    ApiChangeLineTracker.this.addListenerOnFile(newFile, ApiChangeLineTracker.this.documentListener);
                }
            }

            private static /* synthetic */ void $$$reportNull$$$0(int n) {
                Object[] objectArray;
                Object[] objectArray2;
                Object[] objectArray3 = new Object[3];
                switch (n) {
                    default: {
                        objectArray2 = objectArray3;
                        objectArray3[0] = "source";
                        break;
                    }
                    case 1: 
                    case 3: {
                        objectArray2 = objectArray3;
                        objectArray3[0] = "file";
                        break;
                    }
                    case 4: {
                        objectArray2 = objectArray3;
                        objectArray3[0] = "event";
                        break;
                    }
                }
                objectArray2[1] = "com/huawei/deveco/programanalysis/apiscan/ApiChangeLineTracker$1";
                switch (n) {
                    default: {
                        objectArray = objectArray2;
                        objectArray2[2] = "fileOpened";
                        break;
                    }
                    case 2: 
                    case 3: {
                        objectArray = objectArray2;
                        objectArray2[2] = "fileClosed";
                        break;
                    }
                    case 4: {
                        objectArray = objectArray2;
                        objectArray2[2] = "selectionChanged";
                        break;
                    }
                }
                throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objectArray));
            }
        });
    }

    private void updateTreeManagerInfo(ApiDisplayItem apiDisplayItem, String oldKey) {
        ApiChangeTreeManager apiChangeTreeManager = ApiChangeAssistantFactory.getApiChangeTreeManagerMap().get(this.project.getBasePath());
        if (apiChangeTreeManager == null) {
            LOGGER.warn("ApiChangeTreeManager is null.");
            return;
        }
        apiChangeTreeManager.syncApiDisplayItemChange(apiDisplayItem, oldKey);
    }

    private void sendCodeLineNumberChanges(VirtualFile file, Document document, ApiChangeWindow contentPanel) {
        if (contentPanel == null) {
            return;
        }
        ArrayList<ApiLineChangeData> apiLineChangeDataList = new ArrayList<ApiLineChangeData>();
        HashMap<String, ApiDisplayItem> oldKeyToApiDisplayItem = new HashMap<String, ApiDisplayItem>();
        boolean isAdd = false;
        for (ApiMarker apiMarker : this.fileToMarkers.get(file)) {
            int newOffset = apiMarker.getRangeMarker().getStartOffset();
            int newLine = document.getLineNumber(newOffset) + 1;
            int oldLine = apiMarker.getOldLineNumber();
            if (oldLine == newLine) continue;
            if (oldLine < newLine) {
                isAdd = true;
            }
            apiMarker.setOldLineNumber(newLine);
            apiMarker.getApiDisplayItem().setLocation(apiMarker.getFilePath() + CODE_LOCATION_SEPARATOR + newLine);
            String oldKey = this.generateKey(apiMarker.getApiDisplayItem(), oldLine);
            String newKey = this.generateKey(apiMarker.getApiDisplayItem(), newLine);
            String filePath = apiMarker.getFilePath();
            apiLineChangeDataList.add(new ApiLineChangeData(filePath, newKey, oldKey, oldLine, newLine));
            oldKeyToApiDisplayItem.put(oldKey, apiMarker.getApiDisplayItem());
        }
        if (isAdd) {
            apiLineChangeDataList.sort((o1, o2) -> o2.oldLineNumber() - o1.oldLineNumber());
        } else {
            apiLineChangeDataList.sort((o1, o2) -> o1.oldLineNumber() - o2.oldLineNumber());
        }
        for (ApiLineChangeData apiLineChangeData : apiLineChangeDataList) {
            ApiDisplayItem apiDisplayItem = (ApiDisplayItem)oldKeyToApiDisplayItem.get(apiLineChangeData.oldKey());
            this.updateTreeManagerInfo(apiDisplayItem, apiLineChangeData.oldKey());
            ApiChangeTreeUtil.processLineChange(this.project, apiLineChangeData.oldKey(), apiLineChangeData.key());
            contentPanel.updateLineNumber(apiLineChangeData);
        }
    }

    public void setUp(ApiScanData apiScanData, Project project, JPanel contentPanel) {
        this.apiScanData = apiScanData;
        this.project = project;
        if (!(contentPanel instanceof ApiChangeWindow)) {
            LOGGER.warn("contentPanel is not ApiChangeWindow");
            return;
        }
        this.contentPanel = (ApiChangeWindow)contentPanel;
        this.fileToMarkers.clear();
        this.documentListener = new DocumentListener(){

            public void documentChanged(@NotNull DocumentEvent event) {
                if (event == null) {
                    2.$$$reportNull$$$0(0);
                }
                Document document = event.getDocument();
                VirtualFile file = FileDocumentManager.getInstance().getFile(document);
                if (file == null) {
                    return;
                }
                if (ApiChangeLineTracker.this.fileToMarkers.get(file) == null) {
                    return;
                }
                ApiChangeLineTracker.this.sendCodeLineNumberChanges(file, document, ApiChangeLineTracker.this.contentPanel);
            }

            private static /* synthetic */ void $$$reportNull$$$0(int n) {
                throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", "event", "com/huawei/deveco/programanalysis/apiscan/ApiChangeLineTracker$2", "documentChanged"));
            }
        };
        if (project == null || apiScanData == null) {
            return;
        }
        this.projectPath = project.getBasePath();
        if (this.projectPath == null) {
            return;
        }
        this.addEditorChangeListener(project);
        Optional.ofNullable(FileEditorManager.getInstance((Project)project)).map(FileEditorManager::getSelectedTextEditor).map(Editor::getVirtualFile).ifPresent(file -> {
            Document document = FileDocumentManager.getInstance().getDocument(file);
            if (document == null) {
                return;
            }
            this.setTrackerOnFile((VirtualFile)file);
            this.addListenerOnFile((VirtualFile)file, this.documentListener);
        });
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

    private Map<Integer, Integer> findApiScanDataInSingleFile(VirtualFile virtualFile) {
        String filePathStr = virtualFile.getPath();
        Path filePath = Paths.get(filePathStr, new String[0]).normalize();
        HashMap<Integer, Integer> apiScanDataIndexToLineNumber = new HashMap<Integer, Integer>();
        if (Objects.isNull(this.apiScanData) || CollectionUtils.isEmpty(this.apiScanData.getDisplayItem())) {
            return Collections.emptyMap();
        }
        for (int i = 0; i < this.apiScanData.getDisplayItem().size(); ++i) {
            String fullPathStr;
            ApiDisplayItem apiDisplayItem = this.apiScanData.getDisplayItem().get(i);
            Pair<String, Integer> codeLocation = ApiChangeLineTracker.parseApiDisplayItemLocation(apiDisplayItem.getLocation());
            if (codeLocation == null || (fullPathStr = apiDisplayItem.getAbsolutePath()) == null) continue;
            try {
                Path fullPath = Path.of(apiDisplayItem.getAbsolutePath(), new String[0]);
                if (!fullPath.equals(filePath)) continue;
                apiScanDataIndexToLineNumber.put(i, (Integer)codeLocation.second);
                continue;
            }
            catch (InvalidPathException e) {
                LOGGER.warn(String.format(Locale.ENGLISH, "Find ApiScanData In SingleFile Error For AbsolutePath: %s", apiDisplayItem.getAbsolutePath()));
            }
        }
        return apiScanDataIndexToLineNumber;
    }

    private void addApiMarkers(Map<Integer, Integer> apiScanDataIndexToLineNumber, VirtualFile virtualFile, Document document) {
        this.fileToMarkers.put(virtualFile, new ArrayList());
        for (Map.Entry<Integer, Integer> entry : apiScanDataIndexToLineNumber.entrySet()) {
            int index;
            int lineEnd;
            int lineStart;
            String lineText;
            ApiDisplayItem apiDisplayItem = this.apiScanData.getDisplayItem().get(entry.getKey());
            if (apiDisplayItem == null || (lineText = document.getText(new TextRange(lineStart = document.getLineStartOffset(entry.getValue() - 1), lineEnd = document.getLineEndOffset(entry.getValue() - 1)))).isEmpty()) continue;
            for (index = 0; index < lineText.length() && Character.isWhitespace(lineText.charAt(index)); ++index) {
            }
            int contentStart = lineStart + index;
            if (contentStart > lineEnd) continue;
            RangeMarker rangeMarker = document.createRangeMarker(contentStart, lineEnd);
            rangeMarker.setGreedyToLeft(false);
            rangeMarker.setGreedyToRight(false);
            List<ApiMarker> markers = this.fileToMarkers.get(virtualFile);
            Pair<String, Integer> codeLocation = ApiChangeLineTracker.parseApiDisplayItemLocation(apiDisplayItem.getLocation());
            if (codeLocation == null) {
                LOGGER.warn("Failed to Parse CodeLocation." + apiDisplayItem.getLocation());
                return;
            }
            if (markers == null) continue;
            markers.add(new ApiMarker(rangeMarker, (String)codeLocation.first, (Integer)codeLocation.second, apiDisplayItem));
        }
    }

    private void setTrackerOnFile(VirtualFile virtualFile) {
        if (virtualFile == null) {
            return;
        }
        if (this.fileToMarkers.containsKey(virtualFile)) {
            return;
        }
        Map<Integer, Integer> apiScanDataIndexToLineNumber = this.findApiScanDataInSingleFile(virtualFile);
        Document document = FileDocumentManager.getInstance().getDocument(virtualFile);
        if (document == null) {
            return;
        }
        this.addApiMarkers(apiScanDataIndexToLineNumber, virtualFile, document);
    }

    private String generateKey(ApiDisplayItem apiDisplayItem, Integer lineNumber) {
        Pair<String, Integer> codeLocation = ApiChangeLineTracker.parseApiDisplayItemLocation(apiDisplayItem.getLocation());
        if (codeLocation == null) {
            LOGGER.warn("Failed to Parse CodeLocation:" + apiDisplayItem.getLocation());
            return null;
        }
        String keyString = "changeId-" + apiDisplayItem.getChangeId() + "-apiDefinition-" + apiDisplayItem.getApiDefinition() + "-filePath-" + (String)codeLocation.first + "-line-" + lineNumber.toString();
        return ApiChangeTreeUtil.generateSha256(keyString);
    }

    private static /* synthetic */ void $$$reportNull$$$0(int n) {
        throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", "project", "com/huawei/deveco/programanalysis/apiscan/ApiChangeLineTracker", "addEditorChangeListener"));
    }
}

