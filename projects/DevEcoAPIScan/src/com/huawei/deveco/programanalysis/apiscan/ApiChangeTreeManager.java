/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.intellij.openapi.diagnostic.Logger
 *  com.intellij.openapi.project.Project
 *  lombok.Generated
 *  org.apache.commons.collections4.CollectionUtils
 *  org.apache.commons.lang3.StringUtils
 */
package com.huawei.deveco.programanalysis.apiscan;

import com.huawei.deveco.programanalysis.apiscan.ApiChangeTreeUtil;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiChangeCheckStatusItem;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiChangeOnCheckedResponse;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiChangeTreeFileCheckItem;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiDisplayItem;
import com.huawei.deveco.programanalysis.apiscan.bean.TreeApiDisplayItem;
import com.huawei.deveco.programanalysis.apiscan.handler.ApichangeTreeFileOncheckHandler;
import com.intellij.openapi.diagnostic.Logger;
import com.intellij.openapi.project.Project;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.FileAttribute;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import lombok.Generated;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

public class ApiChangeTreeManager {
    public static final String CHECKED = "checked";
    private static final String TREE_CHECKED_FILE = ".csv";
    private static final String API_CHANGE_CACHE = "apiChangeCache";
    private static final String API_CHANGE = "apichange";
    private static final Logger LOGGER = Logger.getInstance(ApiChangeTreeManager.class);
    private static final String UNCHECKED = "unchecked";
    private List<TreeApiDisplayItem> treeApiDisplayItems;
    private HashMap<String, TreeApiDisplayItem> keyToTreeApiDisplayItem;
    private HashMap<String, TreeApiDisplayItem> keyToTreeApiDisplayItemParent;
    private HashMap<String, Integer> keyToLeafCount;
    private HashMap<String, Integer> keyToLeafCheckedCount;
    private HashMap<String, List<TreeApiDisplayItem>> fileNodeKeyToLeafs;
    private Project project;

    public ApiChangeTreeManager(Project project, List<TreeApiDisplayItem> treeApiDisplayItems) {
        this.treeApiDisplayItems = treeApiDisplayItems;
        this.keyToTreeApiDisplayItem = new HashMap();
        this.keyToTreeApiDisplayItemParent = new HashMap();
        this.keyToLeafCount = new HashMap();
        this.keyToLeafCheckedCount = new HashMap();
        this.fileNodeKeyToLeafs = new HashMap();
        this.project = project;
    }

    private void fillKeyToTreeApiDisplayItemMap(List<TreeApiDisplayItem> treeApiDisplayItems, HashMap<String, TreeApiDisplayItem> keyToItem) {
        if (treeApiDisplayItems == null) {
            LOGGER.warn("TreeApiDisplayItems is null.");
            return;
        }
        for (TreeApiDisplayItem treeApiDisplayItem : treeApiDisplayItems) {
            if (treeApiDisplayItem == null) {
                LOGGER.warn("TreeApiDisplayItem is null.");
                continue;
            }
            if (treeApiDisplayItem.getKey() == null) {
                LOGGER.warn("TreeApiDisplayItem key is null.");
                continue;
            }
            keyToItem.put(treeApiDisplayItem.getKey(), treeApiDisplayItem);
            if (treeApiDisplayItem.getChildren() == null) continue;
            this.fillKeyToTreeApiDisplayItemMap(treeApiDisplayItem.getChildren(), keyToItem);
        }
    }

    private boolean setParent(TreeApiDisplayItem childItem, TreeApiDisplayItem parentItem) {
        if (childItem == null || childItem.getKey() == null) {
            LOGGER.warn("TreeApiDisplayItem is illegal.");
            return false;
        }
        this.keyToTreeApiDisplayItemParent.put(childItem.getKey(), parentItem);
        return true;
    }

    private int calculateTreeApiDisplayItemLeafCount(TreeApiDisplayItem treeApiDisplayItem) {
        if (treeApiDisplayItem == null) {
            LOGGER.warn("TreeApiDisplayItem is null.");
            return 0;
        }
        if (treeApiDisplayItem.getChildren() == null || treeApiDisplayItem.getChildren().isEmpty()) {
            return 1;
        }
        int leafCount = 0;
        for (TreeApiDisplayItem child : treeApiDisplayItem.getChildren()) {
            leafCount += this.calculateTreeApiDisplayItemLeafCount(child);
        }
        if (treeApiDisplayItem.getKey() != null) {
            this.keyToLeafCount.put(treeApiDisplayItem.getKey(), leafCount);
        }
        return leafCount;
    }

    private void fillKeyToLeafCountMap() {
        for (TreeApiDisplayItem treeApiDisplayItem : this.treeApiDisplayItems) {
            this.calculateTreeApiDisplayItemLeafCount(treeApiDisplayItem);
        }
    }

    private void fillFileNodeKeyToLeafs() {
        if (this.treeApiDisplayItems == null) {
            return;
        }
        for (TreeApiDisplayItem treeApiDisplayItem : this.treeApiDisplayItems) {
            if (treeApiDisplayItem == null) continue;
            List<TreeApiDisplayItem> leafs = TreeApiDisplayItem.getAllLeafNodes(treeApiDisplayItem);
            for (TreeApiDisplayItem leaf : leafs) {
                String curFileNodeKey = ApiChangeTreeUtil.generateKeyForFileNode(leaf);
                if (this.fileNodeKeyToLeafs.containsKey(curFileNodeKey)) {
                    this.fileNodeKeyToLeafs.get(curFileNodeKey).add(leaf);
                    continue;
                }
                ArrayList<TreeApiDisplayItem> items = new ArrayList<TreeApiDisplayItem>();
                items.add(leaf);
                this.fileNodeKeyToLeafs.put(curFileNodeKey, items);
            }
        }
    }

    private int calculateTreeApiDisplayItemLeafCheckedCount(TreeApiDisplayItem treeApiDisplayItem) {
        if (treeApiDisplayItem == null) {
            LOGGER.warn("TreeApiDisplayItem is null.");
            return 0;
        }
        if (treeApiDisplayItem.getChildren() == null || treeApiDisplayItem.getChildren().isEmpty()) {
            return CHECKED.equals(treeApiDisplayItem.getChecked()) ? 1 : 0;
        }
        int leafCheckedCount = 0;
        for (TreeApiDisplayItem child : treeApiDisplayItem.getChildren()) {
            leafCheckedCount += this.calculateTreeApiDisplayItemLeafCheckedCount(child);
        }
        if (treeApiDisplayItem.getKey() != null) {
            this.keyToLeafCheckedCount.put(treeApiDisplayItem.getKey(), leafCheckedCount);
            if (leafCheckedCount == this.keyToLeafCount.get(treeApiDisplayItem.getKey())) {
                treeApiDisplayItem.setChecked(CHECKED);
            }
        }
        return leafCheckedCount;
    }

    private void fillKeyToLeafCheckedCountMap() {
        for (TreeApiDisplayItem treeApiDisplayItem : this.treeApiDisplayItems) {
            this.calculateTreeApiDisplayItemLeafCheckedCount(treeApiDisplayItem);
        }
    }

    private void fillKeyToTreeApiDisplayItemParentMap(List<TreeApiDisplayItem> treeApiDisplayItems, TreeApiDisplayItem parent) {
        if (treeApiDisplayItems == null) {
            LOGGER.warn("TreeApiDisplayItems is null.");
            return;
        }
        for (TreeApiDisplayItem treeApiDisplayItem : treeApiDisplayItems) {
            if (!this.setParent(treeApiDisplayItem, parent) || treeApiDisplayItem.getChildren() == null) continue;
            this.fillKeyToTreeApiDisplayItemParentMap(treeApiDisplayItem.getChildren(), treeApiDisplayItem);
        }
    }

    public void init() {
        this.fillKeyToTreeApiDisplayItemMap(this.treeApiDisplayItems, this.keyToTreeApiDisplayItem);
        this.fillKeyToTreeApiDisplayItemParentMap(this.treeApiDisplayItems, null);
        this.fillKeyToLeafCountMap();
        this.fillKeyToLeafCheckedCountMap();
        this.fillFileNodeKeyToLeafs();
    }

    private List<String> findKeysNeededUpdate(String key, String nodeType) {
        if (StringUtils.isBlank((CharSequence)key)) {
            return new ArrayList<String>();
        }
        if (ApichangeTreeFileOncheckHandler.KeyType.FILE_NODE.getValue().equals(nodeType)) {
            List<TreeApiDisplayItem> result = this.fileNodeKeyToLeafs.get(key);
            return result == null ? new ArrayList<String>() : result.stream().map(TreeApiDisplayItem::getKey).toList();
        }
        TreeApiDisplayItem treeApiDisPlayItem = this.keyToTreeApiDisplayItem.get(key);
        return this.getLeafKeys(treeApiDisPlayItem);
    }

    private void updateCheckedStatusInMemory(String key, String checked) {
        if (StringUtils.isBlank((CharSequence)checked) || StringUtils.isBlank((CharSequence)key)) {
            LOGGER.warn("Key or checkedStatus is illegal.");
            return;
        }
        TreeApiDisplayItem treeApiDisplayItem = this.keyToTreeApiDisplayItem.get(key);
        if (treeApiDisplayItem != null) {
            TreeApiDisplayItem parentItem = this.keyToTreeApiDisplayItemParent.get(key);
            if (CHECKED.equals(checked) && (UNCHECKED.equals(treeApiDisplayItem.getChecked()) || treeApiDisplayItem.getChecked() == null) && parentItem != null) {
                this.updateParentCheckedStatus(treeApiDisplayItem, 1);
                this.updateParentCheckedStatus(parentItem, 1);
            }
            if (UNCHECKED.equals(checked) && CHECKED.equals(treeApiDisplayItem.getChecked()) && parentItem != null) {
                this.updateParentCheckedStatus(treeApiDisplayItem, -1);
                this.updateParentCheckedStatus(parentItem, -1);
            }
            treeApiDisplayItem.setChecked(checked);
        }
    }

    public boolean isKeyChecked(String key) {
        return Objects.equals(this.keyToLeafCheckedCount.get(key), this.keyToLeafCount.get(key));
    }

    public boolean isFileNodeKeyChecked(String key) {
        List<TreeApiDisplayItem> leafItems = this.fileNodeKeyToLeafs.get(key);
        if (CollectionUtils.isEmpty(leafItems)) {
            return false;
        }
        List<String> leafKeys = leafItems.stream().map(TreeApiDisplayItem::getKey).toList();
        for (String leafKey : leafKeys) {
            if (CHECKED.equals(this.keyToTreeApiDisplayItem.get(leafKey).getChecked())) continue;
            return false;
        }
        return true;
    }

    private void updateParentCheckedStatus(TreeApiDisplayItem treeApiDisplayItem, int delta) {
        if (treeApiDisplayItem == null) {
            LOGGER.warn("TreeApiDisplayItem is null.");
            return;
        }
        TreeApiDisplayItem parentItem = this.keyToTreeApiDisplayItemParent.get(treeApiDisplayItem.getKey());
        if (parentItem == null) {
            LOGGER.warn("ParentItem is null.");
            return;
        }
        this.keyToLeafCheckedCount.put(parentItem.getKey(), this.keyToLeafCheckedCount.get(parentItem.getKey()) + delta);
    }

    private ApiChangeCheckStatusItem getCheckedStatus(TreeApiDisplayItem treeApiDisplayItem) {
        if (treeApiDisplayItem == null || treeApiDisplayItem.getKey() == null) {
            return null;
        }
        if (Objects.equals(this.keyToLeafCheckedCount.get(treeApiDisplayItem.getKey()), this.keyToLeafCount.get(treeApiDisplayItem.getKey()))) {
            return new ApiChangeCheckStatusItem(treeApiDisplayItem.getType(), treeApiDisplayItem.getKey(), CHECKED);
        }
        return new ApiChangeCheckStatusItem(treeApiDisplayItem.getType(), treeApiDisplayItem.getKey(), UNCHECKED);
    }

    private List<ApiChangeCheckStatusItem> getAffectedCheckStatusItem(String key) {
        TreeApiDisplayItem parentItem;
        ArrayList<ApiChangeCheckStatusItem> result = new ArrayList<ApiChangeCheckStatusItem>();
        String fileNodeKey = ApiChangeTreeUtil.generateKeyForFileNode(this.keyToTreeApiDisplayItem.get(key));
        if (StringUtils.isNotBlank((CharSequence)fileNodeKey)) {
            if (this.isFileNodeKeyChecked(fileNodeKey)) {
                result.add(new ApiChangeCheckStatusItem(ApichangeTreeFileOncheckHandler.KeyType.FILE_NODE.getValue(), fileNodeKey, CHECKED));
            } else {
                result.add(new ApiChangeCheckStatusItem(ApichangeTreeFileOncheckHandler.KeyType.FILE_NODE.getValue(), fileNodeKey, UNCHECKED));
            }
        }
        if ((parentItem = this.keyToTreeApiDisplayItemParent.get(key)) == null || Objects.equals(parentItem.getKey(), key)) {
            return new ArrayList<ApiChangeCheckStatusItem>();
        }
        result.add(this.getCheckedStatus(parentItem));
        TreeApiDisplayItem grandParentItem = this.keyToTreeApiDisplayItemParent.get(parentItem.getKey());
        if (grandParentItem != null && !Objects.equals(grandParentItem.getKey(), parentItem.getKey())) {
            result.add(this.getCheckedStatus(grandParentItem));
        }
        return result;
    }

    public ApiChangeOnCheckedResponse handleStatus(String rootKey, String checked, String nodeType) {
        List<String> keys = this.findKeysNeededUpdate(rootKey, nodeType);
        if (CollectionUtils.isEmpty(keys)) {
            return new ApiChangeOnCheckedResponse();
        }
        ArrayList<ApiChangeTreeFileCheckItem> apiChangeTreeFileCheckItemList = new ArrayList<ApiChangeTreeFileCheckItem>();
        ApiChangeOnCheckedResponse response = new ApiChangeOnCheckedResponse();
        for (String key : keys) {
            this.updateCheckedStatusInMemory(key, checked);
            apiChangeTreeFileCheckItemList.add(new ApiChangeTreeFileCheckItem(key, checked));
        }
        response.getItemsNeededUpdate().addAll(this.getAffectedCheckStatusItem(keys.getFirst()));
        String projectPath = this.project.getBasePath();
        if (projectPath != null) {
            Path fileFullPath = this.getApiChangeFileCache(projectPath);
            File csvFile = fileFullPath.toFile();
            if (!csvFile.exists()) {
                ApiChangeTreeUtil.writeToFile(String.valueOf(fileFullPath), apiChangeTreeFileCheckItemList);
            } else {
                ApiChangeTreeUtil.updateFile(String.valueOf(fileFullPath), apiChangeTreeFileCheckItemList);
            }
        } else {
            LOGGER.warn("project path is null");
        }
        return response;
    }

    private List<String> getLeafKeys(TreeApiDisplayItem treeApiDisplayItem) {
        if (treeApiDisplayItem == null) {
            LOGGER.warn("Can not get leafs for treeApiDisplayItem with null value.");
            return new ArrayList<String>();
        }
        return TreeApiDisplayItem.getAllLeafNodes(treeApiDisplayItem).stream().map(TreeApiDisplayItem::getKey).toList();
    }

    private void updateKeyToTreeApiDisplayItem(List<TreeApiDisplayItem> treeApiDisplayItems, HashMap<String, TreeApiDisplayItem> keyToItem) {
        keyToItem.clear();
        this.fillKeyToTreeApiDisplayItemMap(treeApiDisplayItems, keyToItem);
    }

    public void syncApiDisplayItemChange(ApiDisplayItem newApiDisplayItem, String oldKey) {
        TreeApiDisplayItem leafItem = this.keyToTreeApiDisplayItem.get(oldKey);
        String newKey = ApiChangeTreeUtil.getThirdKeyFromApiDisplayItem(newApiDisplayItem);
        if (leafItem != null) {
            leafItem.setKey(newKey);
            this.keyToTreeApiDisplayItem.put(newKey, leafItem);
            this.keyToLeafCount.put(newKey, this.keyToLeafCount.get(oldKey));
            this.keyToLeafCheckedCount.put(newKey, this.keyToLeafCheckedCount.get(oldKey));
            this.keyToTreeApiDisplayItemParent.put(newKey, this.keyToTreeApiDisplayItemParent.get(oldKey));
            this.keyToTreeApiDisplayItem.remove(oldKey);
            this.keyToLeafCount.remove(oldKey);
            this.keyToLeafCheckedCount.remove(oldKey);
            this.keyToTreeApiDisplayItemParent.remove(oldKey);
        }
    }

    private Path getApiChangeFileCache(String projectPath) {
        Path fileFloderPath = ApiChangeTreeManager.createOrGetFileFloderPath(projectPath);
        return Paths.get(fileFloderPath.toString(), "apiChangeCache.csv");
    }

    private static Path createOrGetFileFloderPath(String projectPath) {
        Path filePath = Paths.get(projectPath, ".idea", API_CHANGE);
        if (!Files.exists(filePath, new LinkOption[0])) {
            try {
                Files.createDirectories(filePath, new FileAttribute[0]);
            }
            catch (IOException e) {
                LOGGER.warn("create directory failed");
            }
        }
        return filePath;
    }

    @Generated
    public HashMap<String, TreeApiDisplayItem> getKeyToTreeApiDisplayItem() {
        return this.keyToTreeApiDisplayItem;
    }

    @Generated
    public HashMap<String, TreeApiDisplayItem> getKeyToTreeApiDisplayItemParent() {
        return this.keyToTreeApiDisplayItemParent;
    }

    @Generated
    public HashMap<String, Integer> getKeyToLeafCount() {
        return this.keyToLeafCount;
    }

    @Generated
    public HashMap<String, Integer> getKeyToLeafCheckedCount() {
        return this.keyToLeafCheckedCount;
    }
}

