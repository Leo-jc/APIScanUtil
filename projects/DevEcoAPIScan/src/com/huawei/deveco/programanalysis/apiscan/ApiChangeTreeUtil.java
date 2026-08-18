/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.alibaba.fastjson2.JSON
 *  com.intellij.openapi.diagnostic.Logger
 *  com.intellij.openapi.project.Project
 *  com.intellij.openapi.util.Pair
 *  org.apache.commons.collections.CollectionUtils
 *  org.apache.commons.lang3.StringUtils
 */
package com.huawei.deveco.programanalysis.apiscan;

import com.alibaba.fastjson2.JSON;
import com.huawei.deveco.programanalysis.apiscan.ApiChangeLineTracker;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiChangeTreeFileCheckItem;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiDisplayItem;
import com.huawei.deveco.programanalysis.apiscan.bean.TreeApiDisplayItem;
import com.huawei.deveco.programanalysis.apiscan.resources.HosProjectMgmtBundle;
import com.intellij.openapi.diagnostic.Logger;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Pair;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.function.Function;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

public class ApiChangeTreeUtil {
    private static final Logger LOGGER = Logger.getInstance(ApiChangeTreeUtil.class);
    private static final String KEY = "key";
    private static final String CHECKED = "checked";
    private static final String UNCHECKED = "unchecked";
    private static final String CHANGE_ID = "changeId";
    private static final String API_DEFINITION = "apiDefinition";
    private static final String FILE_PATH = "filePath";
    private static final String MODULE = "module";
    private static final String LINE = "line";
    private static final Pattern NUMBER_PATTERN = Pattern.compile("\\d+");
    private static final String SDK_VERSION = "sdkVersion";
    private static final String CHANGE_TYPE = "changeType";
    private static final String LANGUAGE = "language";

    private static TreeApiDisplayItem createTreeApiDisplayItem(String type, String[] keyParts, String title, boolean checkable) {
        TreeApiDisplayItem item = new TreeApiDisplayItem();
        item.setType(type);
        String key = String.join((CharSequence)"-", keyParts);
        item.setKey(ApiChangeTreeUtil.generateSha256(key));
        item.setTitle(title);
        item.setCheckable(checkable);
        return item;
    }

    public static List<TreeApiDisplayItem> transferToTree(List<ApiDisplayItem> apiDisplayItems, Project project) {
        if (CollectionUtils.isEmpty(apiDisplayItems)) {
            return new ArrayList<TreeApiDisplayItem>();
        }
        ArrayList<TreeApiDisplayItem> treeApiDisplayItems = new ArrayList<TreeApiDisplayItem>();
        Map<String, List<ApiDisplayItem>> firstLevelMap = apiDisplayItems.stream().collect(Collectors.groupingBy(ApiDisplayItem::getChangeId));
        HashMap<String, Integer> indexMap = new HashMap<String, Integer>();
        for (Map.Entry<String, List<ApiDisplayItem>> firstLevelEntry : firstLevelMap.entrySet()) {
            List<ApiDisplayItem> list = firstLevelEntry.getValue();
            ApiDisplayItem sample = list.get(0);
            TreeApiDisplayItem treeApiDisplayItemFirstLevel = new TreeApiDisplayItem();
            treeApiDisplayItemFirstLevel.setType(CHANGE_ID);
            String firstKey = "changeId-" + firstLevelEntry.getKey();
            treeApiDisplayItemFirstLevel.setKey(ApiChangeTreeUtil.generateSha256(firstKey));
            String url = sample.getTutoringUrl();
            int splitIndexSdk = sample.getSdkVersion().lastIndexOf(")");
            String sdkVersion = sample.getSdkVersion().substring(0, splitIndexSdk + 1);
            indexMap.put(sdkVersion, indexMap.getOrDefault(sdkVersion, 0) + 1);
            treeApiDisplayItemFirstLevel.setTitle(sdkVersion + HosProjectMgmtBundle.message("api.change.tree.firstlevel.change", new Object[0]) + String.valueOf(indexMap.get(sdkVersion)));
            treeApiDisplayItemFirstLevel.setUrl(url);
            treeApiDisplayItemFirstLevel.setCheckable(false);
            Map<String, List<ApiDisplayItem>> secondLevelMap = firstLevelEntry.getValue().stream().collect(Collectors.groupingBy(ApiDisplayItem::getApiDefinition));
            List<TreeApiDisplayItem> secondLevel = ApiChangeTreeUtil.getSecondLevel(project, firstLevelEntry.getKey(), secondLevelMap);
            treeApiDisplayItemFirstLevel.setChildren(secondLevel);
            treeApiDisplayItemFirstLevel.setChangeTitle(sample.getChangeTitle());
            treeApiDisplayItemFirstLevel.setIsIsolated(sample.getIsIsolated());
            treeApiDisplayItems.add(treeApiDisplayItemFirstLevel);
        }
        treeApiDisplayItems.sort((item1, item2) -> {
            if (item1.getTitle() == null && item2.getTitle() == null) {
                return 0;
            }
            if (item1.getTitle() == null) {
                return -1;
            }
            if (item2.getTitle() == null) {
                return 1;
            }
            return item1.getTitle().compareTo(item2.getTitle());
        });
        return treeApiDisplayItems;
    }

    public static List<TreeApiDisplayItem> getSecondLevel(Project project, String firstLevelEntryKey, Map<String, List<ApiDisplayItem>> secondLevelMap) {
        ArrayList<TreeApiDisplayItem> secondLevel = new ArrayList<TreeApiDisplayItem>();
        for (Map.Entry<String, List<ApiDisplayItem>> secondLevelEntry : secondLevelMap.entrySet()) {
            String apiDefinition = secondLevelEntry.getKey();
            TreeApiDisplayItem treeApiDisplayItemSecondLevel = new TreeApiDisplayItem();
            treeApiDisplayItemSecondLevel.setType(API_DEFINITION);
            String secondKey = "changeId-" + firstLevelEntryKey + "-apiDefinition-" + apiDefinition;
            treeApiDisplayItemSecondLevel.setKey(ApiChangeTreeUtil.generateSha256(secondKey));
            treeApiDisplayItemSecondLevel.setTitle(apiDefinition);
            treeApiDisplayItemSecondLevel.setCheckable(false);
            List<TreeApiDisplayItem> thirdLevel = ApiChangeTreeUtil.getThirdLevel(project, firstLevelEntryKey, secondLevelEntry, apiDefinition);
            thirdLevel.sort((item1, item2) -> {
                if (item1.getSubtitle() == null && item2.getSubtitle() == null) {
                    return 0;
                }
                if (item1.getSubtitle() == null) {
                    return -1;
                }
                if (item2.getSubtitle() == null) {
                    return 1;
                }
                return item1.getSubtitle().compareTo(item2.getSubtitle());
            });
            treeApiDisplayItemSecondLevel.setChildren(thirdLevel);
            secondLevel.add(treeApiDisplayItemSecondLevel);
        }
        return secondLevel;
    }

    public static String getThirdKeyFromApiDisplayItem(ApiDisplayItem apiDisplayItem) {
        String location = apiDisplayItem.getLocation();
        String subTitle = location.replaceAll(":", " | ");
        TreeApiDisplayItem treeApiDisplayItemThirdLevel = new TreeApiDisplayItem();
        treeApiDisplayItemThirdLevel.setType(FILE_PATH);
        int splitIndexFile = location.lastIndexOf(":");
        String filePath = location.substring(0, splitIndexFile);
        String line = location.substring(splitIndexFile + 1);
        String thirdKey = "changeId-" + apiDisplayItem.getChangeId() + "-apiDefinition-" + apiDisplayItem.getApiDefinition() + "-filePath-" + filePath + "-line-" + line;
        return ApiChangeTreeUtil.generateSha256(thirdKey);
    }

    public static List<TreeApiDisplayItem> getThirdLevel(Project project, String firstLevelEntryKey, Map.Entry<String, List<ApiDisplayItem>> secondLevelEntry, String apiDefinition) {
        List<String> checkedKeys = ApiChangeTreeUtil.getCheckedKeys(project);
        ArrayList<TreeApiDisplayItem> thirdLevel = new ArrayList<TreeApiDisplayItem>();
        for (ApiDisplayItem apiDisplayItem : secondLevelEntry.getValue()) {
            String location = apiDisplayItem.getLocation();
            String subTitle = location.replaceAll(":", " | ");
            TreeApiDisplayItem treeApiDisplayItemThirdLevel = new TreeApiDisplayItem();
            treeApiDisplayItemThirdLevel.setType(FILE_PATH);
            int splitIndexFile = location.lastIndexOf(":");
            String filePath = location.substring(0, splitIndexFile);
            String line = location.substring(splitIndexFile + 1);
            String thirdKey = "changeId-" + firstLevelEntryKey + "-apiDefinition-" + apiDefinition + "-filePath-" + filePath + "-line-" + line;
            treeApiDisplayItemThirdLevel.setKey(ApiChangeTreeUtil.generateSha256(thirdKey));
            Path path = Paths.get(project.getBasePath(), filePath);
            String fileName = path.getFileName().toString();
            treeApiDisplayItemThirdLevel.setTitle(fileName);
            treeApiDisplayItemThirdLevel.setSubtitle(subTitle);
            treeApiDisplayItemThirdLevel.setCheckable(true);
            treeApiDisplayItemThirdLevel.setUrl(location);
            treeApiDisplayItemThirdLevel.setApiDisplayItem(apiDisplayItem);
            if (checkedKeys.contains(treeApiDisplayItemThirdLevel.getKey())) {
                treeApiDisplayItemThirdLevel.setChecked(CHECKED);
            }
            thirdLevel.add(treeApiDisplayItemThirdLevel);
        }
        return thirdLevel;
    }

    private static long extractNumber(String changeId) {
        Matcher matcher = NUMBER_PATTERN.matcher(changeId);
        if (matcher.find()) {
            try {
                return Long.parseLong(matcher.group());
            }
            catch (NumberFormatException e) {
                LOGGER.warn("Failed to parse change ID number: " + changeId);
            }
        }
        return Long.MAX_VALUE;
    }

    private static void setChangeInfoToMap(Map<String, String> resultMap, List<ApiDisplayItem> apiDisplayItems, String key, Function<ApiDisplayItem, String> valueExtractor) {
        if (apiDisplayItems == null || apiDisplayItems.isEmpty()) {
            resultMap.put(key, "[]");
        } else {
            HashSet values = new HashSet();
            apiDisplayItems.forEach(item -> {
                String value = (String)valueExtractor.apply((ApiDisplayItem)item);
                if (value != null) {
                    values.add(value);
                }
            });
            resultMap.put(key, JSON.toJSONString(values.stream().sorted().toList()));
        }
    }

    private static String handleEmptyApiDisplayItems() {
        HashMap emptyKeyMap = new HashMap();
        List<String> keys = Arrays.asList(SDK_VERSION, CHANGE_ID, LANGUAGE, API_DEFINITION, CHANGE_TYPE);
        keys.forEach(key -> emptyKeyMap.put(key, "[]"));
        return JSON.toJSONString(emptyKeyMap);
    }

    public static String extractTreeLevelKeys(List<ApiDisplayItem> apiDisplayItems) {
        if (CollectionUtils.isEmpty(apiDisplayItems)) {
            return ApiChangeTreeUtil.handleEmptyApiDisplayItems();
        }
        HashMap<String, String> resultMap = new HashMap<String, String>();
        Map<String, Function<ApiDisplayItem, String>> extractors = Map.of(SDK_VERSION, ApiDisplayItem::getSdkVersion, CHANGE_ID, ApiDisplayItem::getChangeId, LANGUAGE, ApiDisplayItem::getLanguage, API_DEFINITION, ApiDisplayItem::getApiDefinition, CHANGE_TYPE, ApiDisplayItem::getChangeType);
        for (Map.Entry<String, Function<ApiDisplayItem, String>> entry : extractors.entrySet()) {
            ApiChangeTreeUtil.setChangeInfoToMap(resultMap, apiDisplayItems, entry.getKey(), entry.getValue());
        }
        return JSON.toJSONString(resultMap);
    }

    public static List<String> getCheckedKeys(Project project) {
        Path path = Paths.get(project.getBasePath(), ".idea", "apichange", "apiChangeCache.csv");
        ArrayList<String> keys = new ArrayList<String>();
        File csvFile = new File(path.toString());
        if (!csvFile.exists()) {
            return keys;
        }
        try (BufferedReader reader = new BufferedReader(new FileReader(path.toString()));){
            String line;
            String firstLine = reader.readLine();
            while ((line = reader.readLine()) != null) {
                ApiChangeTreeFileCheckItem apiChangeTreeFileCheckItem = ApiChangeTreeFileCheckItem.of(line);
                if (apiChangeTreeFileCheckItem == null || !apiChangeTreeFileCheckItem.getChecked().equals(CHECKED)) continue;
                keys.add(apiChangeTreeFileCheckItem.getKey());
            }
        }
        catch (FileNotFoundException e) {
            LOGGER.warn(String.format("get exists %s file FileNotFoundException:%s", path, e.getMessage()));
        }
        catch (IOException e) {
            LOGGER.warn(String.format("get exists %s file IOException:%s", path, e.getMessage()));
        }
        return keys;
    }

    public static String getLineContent(String filefullPath, Integer lineNum) {
        String content = "";
        File csvFile = new File(filefullPath);
        if (csvFile.exists() && lineNum > 0) {
            try (BufferedReader reader = new BufferedReader(new FileReader(filefullPath));){
                String line;
                int index = 0;
                while ((line = reader.readLine()) != null && index++ < lineNum) {
                    content = line.trim();
                }
            }
            catch (FileNotFoundException e) {
                LOGGER.warn(String.format("get exists %s file FileNotFoundException:%s", filefullPath, e.getMessage()));
            }
            catch (IOException e) {
                LOGGER.warn(String.format("get exists %s file IOException:%s", filefullPath, e.getMessage()));
            }
        }
        return content;
    }

    public static String generateSha256(String filePath) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = digest.digest(filePath.getBytes(StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashBytes) {
                String hex = String.format("%02x", b);
                hexString.append(hex);
            }
            return hexString.toString();
        }
        catch (NoSuchAlgorithmException e) {
            LOGGER.warn("Algorithm to translate not found.");
            return "";
        }
    }

    public static String generateKeyForFileNode(TreeApiDisplayItem treeApiDisplayItem) {
        ApiDisplayItem sampleItem = treeApiDisplayItem.getApiDisplayItem();
        if (sampleItem == null) {
            LOGGER.warn("Invalid structure of right treeDisplayItem to generate key.");
            return "";
        }
        Pair<String, Integer> codeLocation = ApiChangeLineTracker.parseApiDisplayItemLocation(sampleItem.getLocation());
        if (codeLocation == null) {
            LOGGER.warn("Invalid location of right treeDisplayItem to generate key.");
            return "";
        }
        String keyInfoString = sampleItem.getChangeId() + sampleItem.getApiDefinition() + (String)codeLocation.getFirst();
        return ApiChangeTreeUtil.generateSha256(keyInfoString);
    }

    public static void writeToFile(String filefullPath, List<ApiChangeTreeFileCheckItem> apiChangeTreeFileCheckItemList) {
        if (CollectionUtils.isEmpty(apiChangeTreeFileCheckItemList)) {
            LOGGER.warn("apiChageTreeFileCheckItemList is empty");
            return;
        }
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filefullPath));){
            writer.write("key,checked\n");
            for (ApiChangeTreeFileCheckItem item : apiChangeTreeFileCheckItemList) {
                writer.write(item.getKey() + "," + item.getChecked() + "\n");
            }
        }
        catch (FileNotFoundException e) {
            LOGGER.warn(String.format("get exists %s file FileNotFoundException:%s", filefullPath, e.getMessage()));
        }
        catch (IOException e) {
            LOGGER.warn(String.format("get exists %s file IOException:%s", filefullPath, e.getMessage()));
        }
    }

    public static void updateFile(String filefullPath, List<ApiChangeTreeFileCheckItem> apiChageTreeFileCheckItemList) {
        File csvFile = new File(filefullPath);
        if (!csvFile.exists()) {
            LOGGER.warn(String.format("file :%s does not exists", filefullPath));
            return;
        }
        if (CollectionUtils.isEmpty(apiChageTreeFileCheckItemList)) {
            LOGGER.warn("apiChageTreeFileCheckItemList is empty");
            return;
        }
        ApiChangeTreeFileCheckItem sample = apiChageTreeFileCheckItemList.get(0);
        List<ApiChangeTreeFileCheckItem> records = ApiChangeTreeUtil.getRecordsByFullPath(filefullPath);
        List<ApiChangeTreeFileCheckItem> mergedRecords = ApiChangeTreeUtil.processMergedRecords(apiChageTreeFileCheckItemList, sample, records);
        ApiChangeTreeUtil.writeToFile(filefullPath, mergedRecords);
    }

    public static List<ApiChangeTreeFileCheckItem> getRecordsByFullPath(String filefullPath) {
        ArrayList<ApiChangeTreeFileCheckItem> records = new ArrayList<ApiChangeTreeFileCheckItem>();
        try (BufferedReader reader = new BufferedReader(new FileReader(filefullPath));){
            String line;
            String firstLine = reader.readLine();
            while ((line = reader.readLine()) != null) {
                ApiChangeTreeFileCheckItem apiChangeTreeFileCheckItem = ApiChangeTreeFileCheckItem.of(line);
                records.add(apiChangeTreeFileCheckItem);
            }
        }
        catch (FileNotFoundException e) {
            LOGGER.warn(String.format("get exists %s file FileNotFoundException:%s", filefullPath, e.getMessage()));
        }
        catch (IOException e) {
            LOGGER.warn(String.format("get exists %s file IOException:%s", filefullPath, e.getMessage()));
        }
        return records;
    }

    public static List<ApiChangeTreeFileCheckItem> processMergedRecords(List<ApiChangeTreeFileCheckItem> apiChangeTreeFileCheckItemList, ApiChangeTreeFileCheckItem sample, List<ApiChangeTreeFileCheckItem> records) {
        HashSet<ApiChangeTreeFileCheckItem> mergedRecords = new HashSet<ApiChangeTreeFileCheckItem>();
        if (CHECKED.equals(sample.getChecked())) {
            List<String> existsKeys = records.stream().map(ApiChangeTreeFileCheckItem::getKey).toList();
            ApiChangeTreeUtil.processExistsRecord(apiChangeTreeFileCheckItemList, records, existsKeys, mergedRecords);
        } else {
            ApiChangeTreeUtil.processUncheckedRecords(apiChangeTreeFileCheckItemList, records, mergedRecords);
        }
        return new ArrayList<ApiChangeTreeFileCheckItem>(mergedRecords);
    }

    public static void processUncheckedRecords(List<ApiChangeTreeFileCheckItem> apiChageTreeFileCheckItemList, List<ApiChangeTreeFileCheckItem> records, Set<ApiChangeTreeFileCheckItem> mergedRecords) {
        List<String> existsCheckedKeys = records.stream().filter(item -> CHECKED.equals(item.getChecked())).map(ApiChangeTreeFileCheckItem::getKey).toList();
        List<String> newUnCheckedKeys = apiChageTreeFileCheckItemList.stream().map(ApiChangeTreeFileCheckItem::getKey).toList();
        for (ApiChangeTreeFileCheckItem record : records) {
            if (existsCheckedKeys.contains(record.getKey()) && newUnCheckedKeys.contains(record.getKey())) {
                record.setChecked(UNCHECKED);
            }
            mergedRecords.add(record);
        }
    }

    public static void processExistsRecord(List<ApiChangeTreeFileCheckItem> apiChangeTreeFileCheckItemList, List<ApiChangeTreeFileCheckItem> records, List<String> existsKeys, Set<ApiChangeTreeFileCheckItem> mergedRecords) {
        for (ApiChangeTreeFileCheckItem item : apiChangeTreeFileCheckItemList) {
            if (existsKeys.contains(item.getKey())) {
                ApiChangeTreeUtil.processExistsRecordByOne(records, item);
                continue;
            }
            mergedRecords.add(item);
        }
        mergedRecords.addAll(records);
    }

    public static void processExistsRecordByOne(List<ApiChangeTreeFileCheckItem> records, ApiChangeTreeFileCheckItem item) {
        for (ApiChangeTreeFileCheckItem record : records) {
            if (!record.getKey().equals(item.getKey()) || record.getChecked().equals(item.getChecked())) continue;
            record.setChecked(item.getChecked());
        }
    }

    public static void processLineChange(Project project, String oldKey, String newKey) {
        if (Objects.isNull(project)) {
            LOGGER.warn("Project not exits");
            return;
        }
        String projectPath = project.getBasePath();
        if (StringUtils.isBlank((CharSequence)projectPath)) {
            LOGGER.warn("projectPath not exits");
            return;
        }
        Path path = Paths.get(project.getBasePath(), ".idea", "apichange", "apiChangeCache.csv");
        String filefullPath = path.toString();
        File csvFile = new File(filefullPath);
        if (!csvFile.exists()) {
            LOGGER.warn(String.format("file %s not exits", filefullPath));
            return;
        }
        List<ApiChangeTreeFileCheckItem> existsRecords = ApiChangeTreeUtil.getRecordsByFullPath(filefullPath);
        if (CollectionUtils.isEmpty(existsRecords)) {
            LOGGER.warn("existsRecords is empty");
            return;
        }
        Iterator<ApiChangeTreeFileCheckItem> iterator = existsRecords.iterator();
        Boolean needUpdate = false;
        while (iterator.hasNext()) {
            ApiChangeTreeFileCheckItem record = iterator.next();
            if (!record.getKey().equals(oldKey)) continue;
            record.setKey(newKey);
            needUpdate = true;
        }
        if (needUpdate.booleanValue()) {
            ApiChangeTreeUtil.writeToFile(filefullPath, existsRecords);
        }
    }
}

