/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.alibaba.fastjson2.JSON
 *  com.alibaba.fastjson2.JSONArray
 *  com.alibaba.fastjson2.JSONException
 *  com.alibaba.fastjson2.JSONObject
 *  com.alibaba.fastjson2.JSONReader$Feature
 *  com.huawei.deveco.common.country.setting.CountryRegionSetting
 *  com.huawei.deveco.common.ide.InnerToolsLocationUtil
 *  com.huawei.deveco.programanalysis.apiscan.capiscan.CAPIScanner
 *  com.huawei.deveco.projectmgmt.ohos.utils.IntegrationUtil
 *  com.huawei.deveco.projectmodel.hos.v2.impl.HosProductV2
 *  com.huawei.deveco.projectmodel.hos.v2.impl.HosProjectModelV2
 *  com.huawei.deveco.projectmodel.ohos.model.ModuleModel
 *  com.huawei.deveco.projectmodel.ohos.model.ProjectModel
 *  com.huawei.deveco.projectmodel.ohos.model.ProjectModelManager
 *  com.huawei.deveco.sdkmanager.core.constants.ComponentConstants
 *  com.huawei.deveco.sdkmanager.core.domain.ApiVersion
 *  com.huawei.deveco.sdkmanager.hos.common.api.SimpleHosVersionMapper
 *  com.huawei.deveco.sdkmanager.hos.core.domain.HosSdkVersion
 *  com.intellij.ide.plugins.IdeaPluginDescriptor
 *  com.intellij.ide.plugins.PluginManagerCore
 *  com.intellij.openapi.application.ApplicationManager
 *  com.intellij.openapi.application.PathManager
 *  com.intellij.openapi.diagnostic.Logger
 *  com.intellij.openapi.extensions.PluginId
 *  com.intellij.openapi.fileEditor.FileDocumentManager
 *  com.intellij.openapi.progress.ProcessCanceledException
 *  com.intellij.openapi.progress.ProgressManager
 *  com.intellij.openapi.project.Project
 *  com.intellij.openapi.util.ClassLoaderUtil
 *  com.intellij.openapi.util.Pair
 *  com.intellij.openapi.util.SystemInfo
 *  com.intellij.util.ResourceUtil
 *  com.opencsv.CSVParser
 *  com.opencsv.CSVParserBuilder
 *  com.opencsv.CSVReader
 *  com.opencsv.CSVReaderBuilder
 *  com.opencsv.ICSVParser
 *  com.opencsv.exceptions.CsvValidationException
 *  org.apache.commons.io.FileUtils
 *  org.apache.commons.lang3.StringUtils
 *  org.jetbrains.annotations.NotNull
 *  org.jetbrains.annotations.Nullable
 */
package com.huawei.deveco.programanalysis.apiscan;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONException;
import com.alibaba.fastjson2.JSONObject;
import com.alibaba.fastjson2.JSONReader;
import com.huawei.deveco.common.country.setting.CountryRegionSetting;
import com.huawei.deveco.common.ide.InnerToolsLocationUtil;
import com.huawei.deveco.programanalysis.apiscan.ApiChangeAssistantTraceUtil;
import com.huawei.deveco.programanalysis.apiscan.ApiScanConfigs;
import com.huawei.deveco.programanalysis.apiscan.CppCodeScanner;
import com.huawei.deveco.programanalysis.apiscan.bean.AffectedApiItem;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiChangeItem;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiDisplayItem;
import com.huawei.deveco.programanalysis.apiscan.bean.GenerateScanResultParam;
import com.huawei.deveco.programanalysis.apiscan.bean.LineApiChangeInfo;
import com.huawei.deveco.programanalysis.apiscan.bean.ModuleNode;
import com.huawei.deveco.programanalysis.apiscan.bean.ProcessStatusEnum;
import com.huawei.deveco.programanalysis.apiscan.capiscan.CAPIScanner;
import com.huawei.deveco.programanalysis.apiscan.resources.HosProjectMgmtBundle;
import com.huawei.deveco.projectmgmt.ohos.utils.IntegrationUtil;
import com.huawei.deveco.projectmodel.hos.v2.impl.HosProductV2;
import com.huawei.deveco.projectmodel.hos.v2.impl.HosProjectModelV2;
import com.huawei.deveco.projectmodel.ohos.model.ModuleModel;
import com.huawei.deveco.projectmodel.ohos.model.ProjectModel;
import com.huawei.deveco.projectmodel.ohos.model.ProjectModelManager;
import com.huawei.deveco.sdkmanager.core.constants.ComponentConstants;
import com.huawei.deveco.sdkmanager.core.domain.ApiVersion;
import com.huawei.deveco.sdkmanager.hos.common.api.SimpleHosVersionMapper;
import com.huawei.deveco.sdkmanager.hos.core.domain.HosSdkVersion;
import com.intellij.ide.plugins.IdeaPluginDescriptor;
import com.intellij.ide.plugins.PluginManagerCore;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.application.PathManager;
import com.intellij.openapi.diagnostic.Logger;
import com.intellij.openapi.extensions.PluginId;
import com.intellij.openapi.fileEditor.FileDocumentManager;
import com.intellij.openapi.progress.ProcessCanceledException;
import com.intellij.openapi.progress.ProgressManager;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.ClassLoaderUtil;
import com.intellij.openapi.util.Pair;
import com.intellij.openapi.util.SystemInfo;
import com.intellij.util.ResourceUtil;
import com.opencsv.CSVParser;
import com.opencsv.CSVParserBuilder;
import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;
import com.opencsv.ICSVParser;
import com.opencsv.exceptions.CsvValidationException;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.io.StringReader;
import java.lang.invoke.CallSite;
import java.nio.file.FileVisitOption;
import java.nio.file.Files;
import java.nio.file.InvalidPathException;
import java.nio.file.LinkOption;
import java.nio.file.OpenOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.FileAttribute;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.TreeMap;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class ApiScanUtil {
    private static final Logger LOGGER = Logger.getInstance(ApiScanUtil.class);
    public static final List<String> VERSION_LIST = List.of("HarmonyOS_5.0.0(12)_Release", "HarmonyOS_5.0.1(13)_Beta3", "HarmonyOS_5.0.1(13)_Release", "HarmonyOS_5.0.2(14)_Beta1", "HarmonyOS_5.0.2(14)_Release", "HarmonyOS_5.0.3(15)_Beta1", "HarmonyOS_5.0.3(15)_Beta2", "HarmonyOS_5.0.3(15)_Release", "HarmonyOS_5.0.4(16)_Release", "HarmonyOS_5.0.5(17)_Beta1", "HarmonyOS_5.0.5(17)_Release", "HarmonyOS_5.1.0(18)_Release", "HarmonyOS_5.1.1(19)_Beta1", "HarmonyOS_5.1.1(19)_Release", "HarmonyOS_6.0.0(20)_Beta1", "HarmonyOS_6.0.0(20)_Beta2", "HarmonyOS_6.0.0(20)_Beta3", "HarmonyOS_6.0.0(20)_Beta5", "HarmonyOS_6.0.0(20)_Release", "HarmonyOS_6.0.1(21)_Beta1", "HarmonyOS_6.0.1(21)_Release", "HarmonyOS_6.0.2(22)_Beta1", "HarmonyOS_6.0.2(22)_Release", "HarmonyOS_6.1.0(23)_Beta1", "HarmonyOS_6.1.0(23)_Beta2", "HarmonyOS_6.1.0(23)_Release", "HarmonyOS_6.1.1(24)_Beta1", "HarmonyOS_6.1.1(24)_Release", "HarmonyOS_26.0.0(26)_Beta1", "HarmonyOS_26.0.0(26)_Beta2");
    public static final Map<String, String> apiScanStageMap = new ConcurrentHashMap<String, String>();
    public static final Map<String, String> apiScanTmpPathMap = new ConcurrentHashMap<String, String>();
    private static final List<String> EARLY_URL_VERSIONS = List.of("5.0.1(13) Release", "5.0.1(13) Beta3", "5.0.2(14) Beta1");
    private static final List<String> CLASSNAME_WITH_INTERFACE_NAME_TYPES = List.of("interface");
    private static final List<String> USE_CN_DOCUMENT_VERSIONS = List.of("13", "14", "15");
    private static final Map<String, String> PUBLISH_NUMBER_MAP = Map.ofEntries(Map.entry("5.0.3(15) Beta1", "5031"), Map.entry("5.0.3(15) Beta2", "5032"), Map.entry("5.0.3(15) Release", "5033"), Map.entry("5.1.0(18) Release", "5101"), Map.entry("6.0.0(20) Beta1", "6001"), Map.entry("6.0.0(20) Beta2", "6002"), Map.entry("6.0.0(20) Beta3", "6003"), Map.entry("6.1.0(23) Beta1", "6101"), Map.entry("7.0.0(26) Beta1", "7001"), Map.entry("7.0.0(26) Beta2", "7002"));
    private static final String HARMONEY_PLUGIN_ID = "com.huawei.harmony";
    private static final String API_SCAN_TOOL_DIRECTORY_NAME = "arkanalyzer-apiscan";
    private static final String API_SCAN_LOG_FILE_NAME = "APIScan.log";
    private static final int EXIT_CODE_SUCCESS = 0;
    private static final String OUT_DIRECTORY_NAME = "out";
    private static final String CONFIG_FILE_NAME = "configSample.json";
    private static final String API_CHANGE_FILE_NAME = "apiChange.json";
    private static final String INDEX_JS_FILE_NAME = "index.js";
    private static final String WORKSPACE_DIRECTORY_NAME = "workspace";
    private static final int READ_BUFFER_SIZE = 1024;
    private static final String API_CHANGE_LIST_PATH = "apiChange/";
    private static final String API_CLASSNAME_SEPARATOR = ".";
    private static final char CSV_CELL_SEPARATOR = ',';
    private static final String CSV_LINE_SEPARATOR = "\n";
    private static final int DATA_START_INDEX = 1;
    private static final int DEFAULT_VERSION_INDEX = 0;
    private static final String SECTION_SUFFIX = "/#";
    private static final String KEY_SECTION = "section";
    private static final String SPLIT_REGEX = "-";
    private static final int CHECK_CANCEL_INTERVAL_MILLIS = 500;
    private static final String TYPE_SCRIPT_LANGUAGE = "typeScript";
    private static final String ARK_TS_LANGUAGE = "ArkTS";
    private static final String C_LANGUAGE = "C";
    private static final String API_SCAN_TASK_CODE_SUCCESS = "Success";
    private static final String API_SCAN_TASK_CODE_FAILURE = "Failure";
    private static final String ORIGINAL_API_PATH = "/component/ets";
    private static final String API_PATH_IN_SDK = "/component";
    private static final String API_PREFIX_SEPARATOR_IN_CHANGE_DATA = "\\.";
    private static final String API_PREFIX_SEPARATOR_IN_SCANNER_REPORT = "#";
    private static final String UX_SPECIFICATION_CHANGE = "UX_SPECIFICATION_CHANGE";
    private static final String CHANGELOGS_UX = "changelogs-ux";
    private static final String CHANGELOGS_FOR_APPS = "changelogs-for-all-apps";
    private static final int CPP_TIME_OUT = 60;
    private static final String API_EFFECTIVE_VERSION_ISOLATED = "ISOLATED";
    private static final String API_EFFECTIVE_VERSION_NOT_ISOLATED = "NOT_ISOLATED";
    private static final String API_EFFECTIVE_VERSION_COULD_NOT_ISOLATED = "COULD_NOT_ISOLATED";
    private static final String ALL_MODULES = "All";
    private static final Set<String> API_TYPES_SHOULD_CHECK_UNNAMED = Set.of("Method", "Property");
    private static final String API_CLASS_UNNAMED = "unnamed";
    private static final TreeMap<Integer, String> cppNeededColumn = new TreeMap<Integer, String>(Map.of(0, "Api Name", 1, "Api Type", 7, "Invoke Location", 10, "ChangeId", 11, "MethodDefinition"));

    @Nullable(value="When the execution is abnormal")
    public static @Nullable(value="When the execution is abnormal") String scan(List<String> projectPaths, List<ApiChangeItem> apiChangeItems, JSONObject scanArkTSDetail, String ramdomTmpFolder) throws ProcessCanceledException, IOException, InterruptedException {
        long start = System.currentTimeMillis();
        Path tmpPath = null;
        try {
            tmpPath = Files.createDirectories(Paths.get(PathManager.getTempPath(), ramdomTmpFolder), new FileAttribute[0]);
            Path outPath = Files.createDirectories(tmpPath.resolve(OUT_DIRECTORY_NAME), new FileAttribute[0]);
            String configPath = ApiScanUtil.prepareConfigFile(projectPaths, outPath.toString(), tmpPath);
            String apiChangePath = ApiScanUtil.dumpApiChange(tmpPath, apiChangeItems);
            LOGGER.info("Start to scan ArkTs files.");
            int exitCode = ApiScanUtil.executeApiScan(configPath, apiChangePath, ramdomTmpFolder);
            LOGGER.info("The ArkTs files scan finished.");
            if (exitCode != 0) {
                String template = "The API scan exited with code %d; please refer to the %s for detailed information";
                LOGGER.warn(String.format(Locale.ENGLISH, template, exitCode, API_SCAN_LOG_FILE_NAME));
                return null;
            }
            JSONObject result = ApiScanUtil.readResult(outPath);
            String scanResult = result.getString("content");
            if (StringUtils.isBlank((CharSequence)scanResult)) {
                LOGGER.warn("The API scan result is empty.");
                return null;
            }
            long fileNum = result.getLong("fileNum");
            if (fileNum == -1L) {
                scanArkTSDetail.put((Object)"taskCode", (Object)API_SCAN_TASK_CODE_FAILURE);
                scanArkTSDetail.put((Object)"failureCause", (Object)"The execution of the API scanning task has encountered an anomaly.");
                return null;
            }
            long duration = System.currentTimeMillis() - start;
            ApiScanUtil.setScanDetail(scanArkTSDetail, duration, fileNum, ARK_TS_LANGUAGE);
            return scanResult;
        }
        catch (ProcessCanceledException exception) {
            scanArkTSDetail.put((Object)"taskCode", (Object)API_SCAN_TASK_CODE_FAILURE);
            scanArkTSDetail.put((Object)"failureCause", (Object)"Task was cancelled");
            throw exception;
        }
        catch (IOException | IllegalStateException | InterruptedException | InvalidPathException exception) {
            LOGGER.warn(String.format(Locale.ENGLISH, "The execution of the API scanning task has encountered an anomaly: %s", exception.getClass().getSimpleName()));
            scanArkTSDetail.put((Object)"taskCode", (Object)API_SCAN_TASK_CODE_FAILURE);
            scanArkTSDetail.put((Object)"failureCause", (Object)exception.getMessage());
            throw exception;
        }
    }

    private static List<String> getFilteredPaths(String modulePath) {
        List<String> list;
        block9: {
            Set<String> excludeNames = Set.of("oh_modules", "node_modules", "build", "build-tools", "hvigorfile.ts", "hvigorfile.js", "hvigor-wrapper.js", ".cxx", ".test", ".preview");
            Path moduleDir = Paths.get(modulePath, new String[0]);
            if (!Files.exists(moduleDir, new LinkOption[0]) || !Files.isDirectory(moduleDir, new LinkOption[0])) {
                return new ArrayList<String>();
            }
            Stream<Path> pathStream = Files.list(moduleDir);
            try {
                list = pathStream.filter(path -> !excludeNames.contains(path.getFileName().toString())).map(Path::toString).collect(Collectors.toList());
                if (pathStream == null) break block9;
            }
            catch (Throwable throwable) {
                try {
                    if (pathStream != null) {
                        try {
                            pathStream.close();
                        }
                        catch (Throwable throwable2) {
                            throwable.addSuppressed(throwable2);
                        }
                    }
                    throw throwable;
                }
                catch (IOException e) {
                    LOGGER.warn("Failed to list directories in module path: " + modulePath);
                    return new ArrayList<String>();
                }
            }
            pathStream.close();
        }
        return list;
    }

    private static String findNinja(String modulePath) {
        String string;
        block9: {
            Path moduleDir = Path.of(Paths.get(modulePath, new String[0]).toString(), ".cxx");
            if (!Files.exists(moduleDir, new LinkOption[0]) || !Files.isDirectory(moduleDir, new LinkOption[0])) {
                return null;
            }
            Stream<Path> paths = Files.walk(moduleDir, new FileVisitOption[0]);
            try {
                string = paths.filter(x$0 -> Files.isRegularFile(x$0, new LinkOption[0])).filter(path -> path.getFileName().toString().equals("build.ninja")).findFirst().map(Path::toString).orElse(null);
                if (paths == null) break block9;
            }
            catch (Throwable throwable) {
                try {
                    if (paths != null) {
                        try {
                            paths.close();
                        }
                        catch (Throwable throwable2) {
                            throwable.addSuppressed(throwable2);
                        }
                    }
                    throw throwable;
                }
                catch (IOException e) {
                    LOGGER.warn("Failed to list directories in module path: " + modulePath);
                    return null;
                }
            }
            paths.close();
        }
        return string;
    }

    private static void addPath(JSONArray modulePathArray, List<String> modulePaths) {
        for (String modulePath : modulePaths) {
            List<String> filteredPaths = ApiScanUtil.getFilteredPaths(modulePath);
            for (String path : filteredPaths) {
                JSONObject modulePathJson = new JSONObject();
                modulePathJson.put((Object)"path", (Object)path);
                modulePathJson.put((Object)"ninja", (Object)ApiScanUtil.findNinja(modulePath));
                modulePathArray.add((Object)modulePathJson);
            }
        }
    }

    private static List<LineApiChangeInfo> scanCppFilesByGrep(List<String> filePaths, List<ApiChangeItem> mergedAPIChangeList) {
        ArrayList<LineApiChangeInfo> result = new ArrayList<LineApiChangeInfo>();
        CppCodeScanner cppCodeScanner = new CppCodeScanner(mergedAPIChangeList);
        for (String filePath : filePaths) {
            cppCodeScanner.setUp(filePath);
            result.addAll(cppCodeScanner.scanSingleCppFileByGrep());
        }
        return result;
    }

    private static void addEmptyCell(StringBuilder stringBuilder, int length) {
        stringBuilder.append(String.valueOf(',').repeat(Math.max(0, length)));
    }

    private static String getCsvStringFromLineApiChangeInfo(List<LineApiChangeInfo> changeInfos) {
        StringBuilder stringBuilder = new StringBuilder();
        HashMap<String, Object> scanInfo = new HashMap<String, Object>();
        for (LineApiChangeInfo lineApiChangeInfo : changeInfos) {
            scanInfo.put("Api Name", lineApiChangeInfo.getAffectedApiItem().getInterfaceName());
            scanInfo.put("Api Type", lineApiChangeInfo.getAffectedApiItem().getInterfaceType());
            scanInfo.put("ChangeId", lineApiChangeInfo.getApiChangeItem().getInterfaceChanges().getId());
            scanInfo.put("MethodDefinition", "\"" + lineApiChangeInfo.getAffectedApiItem().getMethodDefinition() + "\"");
            scanInfo.put("Invoke Location", lineApiChangeInfo.getFilePath() + ":" + lineApiChangeInfo.getLineNumber());
            int currentIndex = 0;
            for (Map.Entry<Integer, String> e : cppNeededColumn.entrySet()) {
                ApiScanUtil.addEmptyCell(stringBuilder, e.getKey() - currentIndex);
                stringBuilder.append((String)scanInfo.get(e.getValue()));
                currentIndex = e.getKey();
            }
            ApiScanUtil.addEmptyCell(stringBuilder, 1);
            stringBuilder.append("\r\n");
        }
        return stringBuilder.toString();
    }

    private static Pair<String, String> scanCpp(List<String> modulePaths, List<ApiChangeItem> mergedAPIChangeList, JSONObject scanCppDetail, String ramdomTmpFolder) throws ProcessCanceledException {
        JSONObject jsonObject = new JSONObject();
        ApiScanUtil.processJsonObject(modulePaths, mergedAPIChangeList, jsonObject, ramdomTmpFolder);
        long start = System.currentTimeMillis();
        Future future = null;
        try {
            LOGGER.info("Start to scan C++ files.");
            future = ApplicationManager.getApplication().executeOnPooledThread(() -> {
                if (jsonObject == null) {
                    LOGGER.info("C++ scan skipped due to null jsonObject");
                    return null;
                }
                if (CAPIScanner.getDefault() == null) {
                    LOGGER.info("C++ scan skipped due to null scanner");
                    return null;
                }
                try {
                    return CAPIScanner.getDefault().run(jsonObject);
                }
                catch (IllegalArgumentException | IllegalStateException | NullPointerException ex) {
                    LOGGER.info("C++ scan failed due to exception: " + ex.getClass().getSimpleName());
                    return null;
                }
            });
            JSONObject result = ApiScanUtil.awaitCppScanResult(future);
            if (result == null) {
                return null;
            }
            LOGGER.info("C++ first scan finished.");
            ProgressManager.checkCanceled();
            return ApiScanUtil.buildCppScanResult(result, mergedAPIChangeList, scanCppDetail, start);
        }
        catch (ProcessCanceledException e) {
            ApiScanUtil.handlerException(scanCppDetail, "C++ scan was cancelled during execution", "Operation was cancelled by user", future);
            throw e;
        }
        catch (ExecutionException e) {
            ApiScanUtil.handlerException(scanCppDetail, "C++ scan failed: " + String.valueOf(e.getCause()), "C++ scan execution failed: " + e.getClass().getSimpleName(), future);
            return null;
        }
        catch (InterruptedException e) {
            ApiScanUtil.handlerException(scanCppDetail, "C++ scan failed: ", "C++ scan execution failed: " + e.getClass().getSimpleName(), future);
            throw new ProcessCanceledException((Throwable)e);
        }
        catch (OutOfMemoryError e) {
            ApiScanUtil.handlerException(scanCppDetail, "C++ scan failed due to OutOfMemoryError", "Memory allocation failed.", future);
            return null;
        }
    }

    private static JSONObject awaitCppScanResult(Future<JSONObject> future) throws ExecutionException, InterruptedException {
        JSONObject result = null;
        while (!future.isDone()) {
            try {
                result = future.get(100L, TimeUnit.MILLISECONDS);
                break;
            }
            catch (TimeoutException e) {
                ProgressManager.checkCanceled();
            }
        }
        if (result == null) {
            result = future.get();
        }
        if (result == null) {
            LOGGER.info("C++ scan skipped: CDT plugin is not initialized.");
        }
        return result;
    }

    private static Pair<String, String> buildCppScanResult(JSONObject result, List<ApiChangeItem> mergedAPIChangeList, JSONObject scanCppDetail, long start) {
        Object scanResult = ApiScanUtil.getScanResult(result);
        if (scanResult == null) {
            LOGGER.warn("C++ first scan failed: no scan result was obtained.");
            return null;
        }
        LOGGER.info(String.format(Locale.ENGLISH, "C++ first scan finished with string content with length of %s", ((String)scanResult).length()));
        List<String> filePaths = ApiScanUtil.getFilePathsFromJson(result);
        String lowLevelScanResultByGrep = ApiScanUtil.getCsvStringFromLineApiChangeInfo(ApiScanUtil.scanCppFilesByGrep(filePaths, mergedAPIChangeList));
        LOGGER.info("C++ second scan finished.");
        scanResult = (String)scanResult + lowLevelScanResultByGrep;
        long duration = System.currentTimeMillis() - start;
        long fileNum = result.getLong("fileNum");
        ApiScanUtil.setScanDetail(scanCppDetail, duration, fileNum, C_LANGUAGE);
        return new Pair(scanResult, (Object)String.join((CharSequence)CSV_LINE_SEPARATOR, filePaths));
    }

    private static List<String> getFilePathsFromJson(JSONObject result) {
        List<String> filePaths = new ArrayList<String>();
        JSONArray fileList = result.getJSONArray("failedFiles");
        if (Objects.nonNull(fileList) && !fileList.isEmpty()) {
            filePaths = fileList.toJavaList(String.class, new JSONReader.Feature[0]);
            LOGGER.warn("C++ first scan skipped file list: " + String.valueOf(filePaths));
        }
        return filePaths;
    }

    @Nullable
    private static String getScanResult(JSONObject result) {
        if (result == null) {
            LOGGER.warn("C++ scan failed: no result was obtained.");
            return null;
        }
        String scanResult = result.getString("content");
        if (scanResult == null) {
            LOGGER.warn("C++ scan failed: no scan result was obtained.");
            return null;
        }
        return scanResult;
    }

    private static void handlerException(JSONObject scanCppDetail, String errorMessage, String failureCause, Future<JSONObject> future) {
        ApiScanUtil.scanErrorProcess(scanCppDetail, errorMessage, failureCause);
        if (future != null) {
            future.cancel(true);
        }
    }

    private static void processJsonObject(List<String> modulePaths, List<ApiChangeItem> mergedAPIChangeList, JSONObject jsonObject, String ramdomTmpFolder) {
        jsonObject.put((Object)"sdkPath", ApiScanUtil.getCPPSdkPath());
        jsonObject.put((Object)"timeout", (Object)60);
        JSONArray modulePathArray = new JSONArray();
        ApiScanUtil.addPath(modulePathArray, modulePaths);
        jsonObject.put((Object)"modules", (Object)modulePathArray);
        jsonObject.put((Object)"apiChanges", mergedAPIChangeList);
        jsonObject.put((Object)"tmpPath", (Object)Paths.get(PathManager.getTempPath(), ramdomTmpFolder).toString());
    }

    private static void scanErrorProcess(JSONObject scanCppDetail, String errorMessage, String failureCause) {
        LOGGER.info(errorMessage);
        scanCppDetail.put((Object)"taskCode", (Object)API_SCAN_TASK_CODE_FAILURE);
        scanCppDetail.put((Object)"failureCause", (Object)failureCause);
    }

    private static void setScanDetail(JSONObject scanDetail, long duration, long fileNum, String language) {
        scanDetail.put((Object)"language", (Object)language);
        scanDetail.put((Object)"useTime", (Object)duration);
        long num = (long)Math.ceil((double)fileNum / 100.0) * 100L;
        scanDetail.put((Object)"fileNum", (Object)num);
        scanDetail.put((Object)"taskCode", (Object)API_SCAN_TASK_CODE_SUCCESS);
        scanDetail.put((Object)"failureCause", (Object)"");
    }

    private static List<String> getCPPSdkPath() {
        ArrayList<String> sdkPath = new ArrayList<String>();
        String ohosSdkPath = Paths.get(InnerToolsLocationUtil.getSdkLocation(), "default", "openharmony", "native", "sysroot", "usr", "include").toString();
        String hosSdkPath = Paths.get(InnerToolsLocationUtil.getSdkLocation(), "default", "hms", "native", "sysroot", "usr", "include").toString();
        sdkPath.add(ohosSdkPath);
        sdkPath.add(hosSdkPath);
        return sdkPath;
    }

    private static String prepareConfigFile(List<String> projectPath, String outPath, Path workspace) throws IOException {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put((Object)"projectPath", projectPath);
        jsonObject.put((Object)"outPath", (Object)outPath);
        jsonObject.put((Object)"sdks", (Object)ApiScanUtil.createSdks());
        Path configPath = workspace.resolve(CONFIG_FILE_NAME);
        Files.writeString(configPath, (CharSequence)JSON.toJSONString((Object)jsonObject), new OpenOption[0]);
        return configPath.toString();
    }

    private static JSONArray createSdks() {
        JSONArray result = new JSONArray();
        Path ohosEts = Paths.get(InnerToolsLocationUtil.getSdkLocation(), "default", "openharmony", "ets");
        Path hmsEts = Paths.get(InnerToolsLocationUtil.getSdkLocation(), "default", "hms", "ets");
        JSONObject ohos = new JSONObject();
        ohos.put((Object)"name", (Object)"ohos");
        ohos.put((Object)"path", (Object)ohosEts);
        JSONObject hms = new JSONObject();
        hms.put((Object)"name", (Object)"hms");
        hms.put((Object)"path", (Object)hmsEts);
        result.add((Object)ohos);
        result.add((Object)hms);
        return result;
    }

    private static String dumpApiChange(Path tmpPath, List<ApiChangeItem> apiChangeItems) throws IOException {
        String jsonStr = JSON.toJSONString(apiChangeItems);
        Path apiChangePath = tmpPath.resolve(API_CHANGE_FILE_NAME);
        Files.writeString(apiChangePath, (CharSequence)jsonStr, new OpenOption[0]);
        return apiChangePath.toString();
    }

    private static int executeApiScan(String configPath, String apiModifiedPath, String ramdomTmpFolder) throws IOException, InterruptedException {
        Path logPath = PathManager.getLogDir().resolve(API_SCAN_LOG_FILE_NAME);
        String scannerIndexPath = ApiScanUtil.getScannerIndexPath();
        List<CallSite> commands = List.of(ApiScanUtil.getNodeExePath(), "--max_old_space_size=" + ApiScanConfigs.getMaxOldSpaceSize(), scannerIndexPath, "--configPath=" + configPath, "--apiModifiedPath=" + apiModifiedPath, "--logPath=" + String.valueOf(logPath), "--batchSize=" + ApiScanConfigs.getBatchSize(), "--tmpPath=" + String.valueOf(Paths.get(PathManager.getTempPath(), ramdomTmpFolder)));
        ProcessBuilder processBuilder = new ProcessBuilder(commands);
        Path workspace = Paths.get(scannerIndexPath, new String[0]).getParent();
        processBuilder.directory(workspace.toFile());
        processBuilder.redirectErrorStream(true);
        Process process = processBuilder.start();
        DiscardStreamConsumer discardStreamConsumer = new DiscardStreamConsumer(process.getInputStream());
        discardStreamConsumer.start();
        try {
            while (!process.waitFor(500L, TimeUnit.MILLISECONDS)) {
                ProgressManager.checkCanceled();
            }
            discardStreamConsumer.join();
            return process.exitValue();
        }
        catch (ProcessCanceledException exception) {
            process.destroyForcibly();
            discardStreamConsumer.join();
            throw exception;
        }
        catch (InterruptedException exception) {
            process.destroyForcibly();
            discardStreamConsumer.join();
            throw new ProcessCanceledException((Throwable)exception);
        }
    }

    private static String getNodeExePath() throws IOException {
        String result;
        String ideNodeLocation = InnerToolsLocationUtil.getIdeNodeLocation();
        String string = result = SystemInfo.isWindows ? Paths.get(ideNodeLocation, "node.exe").toString() : Paths.get(ideNodeLocation, "bin", "node").toString();
        if (!Files.exists(Paths.get(result, new String[0]), new LinkOption[0])) {
            throw new IOException(" The node executable file does not exist.");
        }
        return result;
    }

    private static String getScannerIndexPath() {
        IdeaPluginDescriptor plugin = PluginManagerCore.getPlugin((PluginId)PluginId.getId((String)HARMONEY_PLUGIN_ID));
        if (plugin == null) {
            throw new IllegalStateException("Can not get plugin descriptor for com.huawei.harmony");
        }
        Path indexPath = plugin.getPluginPath().resolve(API_SCAN_TOOL_DIRECTORY_NAME).resolve(INDEX_JS_FILE_NAME);
        if (!indexPath.toFile().exists()) {
            String message = String.format(Locale.ENGLISH, "The %s file for the API scanning tool was not found.", INDEX_JS_FILE_NAME);
            throw new IllegalStateException(message);
        }
        return indexPath.toString();
    }

    private static JSONObject readResult(Path outPath) throws IOException, IllegalStateException {
        File[] files = outPath.toFile().listFiles();
        JSONObject result = new JSONObject();
        if (files != null && files.length == 1 && files[0].isFile()) {
            String[] fileNameArray = files[0].getName().split("_");
            long fileNum = ApiScanUtil.parseLong(fileNameArray[fileNameArray.length - 1].split(API_PREFIX_SEPARATOR_IN_CHANGE_DATA)[0]);
            String content = Files.readString(files[0].toPath());
            result.put((Object)"fileNum", (Object)fileNum);
            result.put((Object)"content", (Object)content);
            return result;
        }
        result.put((Object)"fileNum", (Object)-1);
        result.put((Object)"content", (Object)"");
        return result;
    }

    private static long parseLong(String numberStr) throws IllegalStateException {
        try {
            return Long.parseLong(numberStr);
        }
        catch (NumberFormatException e) {
            throw new IllegalStateException(e);
        }
    }

    private static void deleteTmpFileQuietly(Path tmpPath) {
        if (tmpPath != null && tmpPath.toFile().exists()) {
            try {
                FileUtils.forceDelete((File)tmpPath.toFile());
            }
            catch (IOException exception) {
                LOGGER.warn("Failed to delete the temporary files for API scanning.");
            }
        }
    }

    public static List<ApiDisplayItem> getApiChangeResult(@Nullable String scanResult, @NotNull Map<String, ApiChangeItem> apiChangeMap) {
        if (apiChangeMap == null) {
            ApiScanUtil.$$$reportNull$$$0(0);
        }
        ArrayList<ApiDisplayItem> result = new ArrayList<ApiDisplayItem>();
        List<List<String>> parsedData = ApiScanUtil.parseCSVContent(scanResult);
        if (parsedData.isEmpty()) {
            LOGGER.warn("scan result is empty");
            return result;
        }
        GenerateScanResultParam generateResultParam = new GenerateScanResultParam();
        generateResultParam.setIndexFromParsedCsvData(parsedData);
        if (!generateResultParam.isAllIndexValid()) {
            LOGGER.warn("scan result do not contain Invoke Location or MethodDefinition or ChangeId column");
            return result;
        }
        generateResultParam.setApiChangeMap(apiChangeMap);
        generateResultParam.setParsedCsvData(parsedData);
        ApiScanUtil.processParsedCsvData(generateResultParam, result);
        return result;
    }

    private static void processParsedCsvData(GenerateScanResultParam param, List<ApiDisplayItem> result) {
        List<List<String>> parsedCsvData = param.getParsedCsvData();
        Map<String, ApiChangeItem> apiChangeMap = param.getApiChangeMap();
        for (int i = 1; i < parsedCsvData.size(); ++i) {
            try {
                ProgressManager.checkCanceled();
            }
            catch (ProcessCanceledException e) {
                LOGGER.info("User canceled the operation.");
                break;
            }
            boolean isValidData = param.setScanReportInfo(parsedCsvData, i);
            if (!isValidData) continue;
            String language = ApiScanUtil.getLanguage(apiChangeMap, param.getMethodDef());
            param.setLanguage(language);
            List<String> ids = ApiScanUtil.getIds(param, language);
            if (ids.isEmpty()) continue;
            param.setIds(ids);
            ApiScanUtil.generateScanResult(param, result);
        }
    }

    private static List<String> getIds(GenerateScanResultParam param, String language) {
        ArrayList<String> ids = new ArrayList<String>();
        Map<String, ApiChangeItem> apiChangeMap = param.getApiChangeMap();
        apiChangeMap.forEach((id, item) -> item.getAffectedApis().forEach(affectedAPIItem -> {
            if (ApiScanUtil.isSameAPI(param, affectedAPIItem, language)) {
                ids.add((String)id);
            }
        }));
        return ids;
    }

    private static String getLanguage(Map<String, ApiChangeItem> apiChangeMap, String methodDef) {
        StringBuilder language = new StringBuilder();
        apiChangeMap.forEach((id, item) -> item.getAffectedApis().forEach(affectedAPIItem -> {
            if (methodDef.equals(affectedAPIItem.getMethodDefinition())) {
                language.setLength(0);
                String implementLanguage = affectedAPIItem.getImplementLanguage();
                language.append(TYPE_SCRIPT_LANGUAGE.equals(implementLanguage) ? ARK_TS_LANGUAGE : implementLanguage.toUpperCase(Locale.ROOT));
            }
        }));
        return language.toString();
    }

    private static boolean isSameAPI(GenerateScanResultParam param, AffectedApiItem affectedAPIItem, String language) {
        if (ARK_TS_LANGUAGE.contentEquals(language)) {
            return ApiScanUtil.isSameArkTsAPI(param, affectedAPIItem);
        }
        return param.getMethodDef().equals(affectedAPIItem.getMethodDefinition());
    }

    private static String connectPrefix(String prefix, String interfaceName) {
        if (prefix.isEmpty()) {
            return interfaceName;
        }
        return prefix + API_PREFIX_SEPARATOR_IN_SCANNER_REPORT + interfaceName;
    }

    private static boolean isSameArkTsAPI(GenerateScanResultParam param, AffectedApiItem affectedAPIItem) {
        String completePath = affectedAPIItem.getCompletePath().replace(ORIGINAL_API_PATH, API_PATH_IN_SDK);
        if (!completePath.contains(param.getApiFilePath())) {
            return false;
        }
        String scanResultClassName = param.getApiPrefix();
        if (CLASSNAME_WITH_INTERFACE_NAME_TYPES.contains(affectedAPIItem.getInterfaceType())) {
            scanResultClassName = ApiScanUtil.connectPrefix(param.getApiPrefix(), param.getApiName());
        }
        if (!ApiScanUtil.isSameApiPrefix(affectedAPIItem.getClassName(), scanResultClassName)) {
            return false;
        }
        if (!affectedAPIItem.getInvokeInstance().isEmpty() && !param.getInvokeInstance().equals(affectedAPIItem.getInvokeInstance())) {
            return false;
        }
        return param.getMethodDef().equals(affectedAPIItem.getMethodDefinition());
    }

    private static boolean isSameApiPrefix(String className, String apiPrefix) {
        if ("".equals(apiPrefix)) {
            return true;
        }
        String apiPrefixFromItem = className.replaceAll(API_PREFIX_SEPARATOR_IN_CHANGE_DATA, API_PREFIX_SEPARATOR_IN_SCANNER_REPORT);
        return apiPrefixFromItem.equals(apiPrefix);
    }

    private static void generateScanResult(GenerateScanResultParam generateResultParam, List<ApiDisplayItem> result) {
        String methodDef = generateResultParam.getMethodDef();
        String invokeLocation = generateResultParam.getInvokeLocation();
        String language = generateResultParam.getLanguage();
        for (String id : generateResultParam.getIds()) {
            ApiChangeItem apiChangeItem = generateResultParam.getApiChangeMap().get(id);
            String apiEffectiveVersion = apiChangeItem.getInterfaceChanges().getApiEffectiveVersion();
            String apiVersion = apiChangeItem.getInterfaceChanges().getApiVersion();
            ApiDisplayItem apiDisplayItem = apiChangeItem.getInterfaceChanges().toApiDisplayItem();
            apiDisplayItem.setApiDefinition(methodDef);
            apiDisplayItem.setLanguage(language);
            apiDisplayItem.setTutoringUrl(ApiScanUtil.getDocumentUrl(apiChangeItem));
            apiDisplayItem.setLocation(invokeLocation);
            apiDisplayItem.setChangeId(id);
            if (API_EFFECTIVE_VERSION_NOT_ISOLATED.equals(apiEffectiveVersion) || API_EFFECTIVE_VERSION_COULD_NOT_ISOLATED.equals(apiEffectiveVersion)) {
                apiDisplayItem.setAffectedVersions("ALL");
                result.add(apiDisplayItem);
                apiDisplayItem.setIsIsolated("false");
                continue;
            }
            String displayAffectedApiVersion = ApiScanUtil.getDisplayAffectedApiVersion(apiVersion);
            apiDisplayItem.setAffectedVersions(displayAffectedApiVersion);
            apiDisplayItem.setIsIsolated("true");
            result.add(apiDisplayItem);
        }
    }

    private static List<List<String>> parseCSVContent(String csvContent) {
        ArrayList<List<String>> data = new ArrayList<List<String>>();
        if (csvContent == null) {
            return data;
        }
        CSVParser parser = new CSVParserBuilder().withEscapeChar('\u0000').build();
        try (CSVReader reader = new CSVReaderBuilder((Reader)new StringReader(csvContent)).withCSVParser((ICSVParser)parser).build();){
            String[] nextLine;
            while ((nextLine = reader.readNext()) != null) {
                data.add(new ArrayList<String>(Arrays.asList(nextLine)));
            }
        }
        catch (IOException e) {
            LOGGER.warn("Failed to read scan result.");
            return data;
        }
        catch (CsvValidationException e) {
            LOGGER.warn("Invalid csv scan result.");
            return data;
        }
        return data;
    }

    private static String getEarlyVersionDocUrl(ApiChangeItem apiChangeItem) {
        return HosProjectMgmtBundle.message("api.change.document.url", "cn") + apiChangeItem.getInterfaceChanges().getUrl();
    }

    public static String getDocumentUrl(ApiChangeItem apiChangeItem) {
        if (apiChangeItem == null) {
            return "";
        }
        if (EARLY_URL_VERSIONS.contains(apiChangeItem.getInterfaceChanges().getSdkVersion())) {
            return ApiScanUtil.getEarlyVersionDocUrl(apiChangeItem);
        }
        String apiVersion = apiChangeItem.getInterfaceChanges().getApiVersion();
        String changeReasonCategory = apiChangeItem.getInterfaceChanges().getChangeReasonCategory();
        String publishNum = PUBLISH_NUMBER_MAP.getOrDefault(apiChangeItem.getInterfaceChanges().getSdkVersion(), "");
        String id = apiChangeItem.getInterfaceChanges().getId();
        return ApiScanUtil.getUrlByVersion(apiVersion, changeReasonCategory, publishNum, id);
    }

    private static String getSectionByIDType(String id) {
        if (id.matches("\\d+")) {
            return "/#section" + id;
        }
        return SECTION_SUFFIX + id.toLowerCase(Locale.ENGLISH);
    }

    private static boolean useCNDocument(String apiVersion) {
        return "CN".equalsIgnoreCase(CountryRegionSetting.getInstance().getUserCountryRegion()) || USE_CN_DOCUMENT_VERSIONS.contains(apiVersion);
    }

    private static String getUrlByVersion(String changeImportVersion, String changeReasonCategory, String publishNum, String id) {
        Object url = HosProjectMgmtBundle.message("api.change.document.url", "cn");
        if (UX_SPECIFICATION_CHANGE.equals(changeReasonCategory)) {
            url = (String)url + "changelogs-ux-" + publishNum + ApiScanUtil.getSectionByIDType(id);
            return url;
        }
        url = (String)url + "changelogs-for-all-apps-" + publishNum + ApiScanUtil.getSectionByIDType(id);
        return url;
    }

    public static List<ApiChangeItem> getAllApiChanges(String startVersion, String endVersion) {
        ArrayList<ApiChangeItem> result = new ArrayList<ApiChangeItem>();
        boolean insideSelected = false;
        for (String version : VERSION_LIST) {
            if (Objects.equals(startVersion, version)) {
                insideSelected = true;
                continue;
            }
            if (!insideSelected) continue;
            result.addAll(ApiScanUtil.getApiChangeList(version));
            if (!Objects.equals(endVersion, version)) continue;
            break;
        }
        return result;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    private static List<ApiChangeItem> getApiChangeList(String fileName) {
        try (InputStream inputStream = ApiScanUtil.class.getClassLoader().getResourceAsStream(API_CHANGE_LIST_PATH + fileName + ".json");){
            if (inputStream == null) {
                LOGGER.info("input stream of resource json file is empty");
                ArrayList<ApiChangeItem> arrayList = new ArrayList<ApiChangeItem>();
                return arrayList;
            }
            String text = ResourceUtil.loadText((InputStream)inputStream);
            List jsonArray = (List)ClassLoaderUtil.computeWithClassLoader((ClassLoader)ApiScanUtil.class.getClassLoader(), () -> JSON.parseArray((String)text, ApiChangeItem.class));
            if (jsonArray == null) {
                LOGGER.info("jsonArray is null");
                ArrayList<ApiChangeItem> arrayList = new ArrayList<ApiChangeItem>();
                return arrayList;
            }
            List list = jsonArray;
            return list;
        }
        catch (JSONException | IOException exception) {
            LOGGER.warn("read api change file failed, fileName:" + fileName);
            return new ArrayList<ApiChangeItem>();
        }
    }

    /*
     * WARNING - Removed try catching itself - possible behaviour change.
     */
    public static Pair<List<ApiDisplayItem>, String> scanData(String startVersion, String endVersion, @NotNull List<String> modulePaths, String projectPath) throws IOException, InterruptedException, ProcessCanceledException {
        if (modulePaths == null) {
            ApiScanUtil.$$$reportNull$$$0(1);
        }
        List<ApiChangeItem> mergedApiChangeList = ApiScanUtil.getAllApiChanges(startVersion, endVersion);
        ApplicationManager.getApplication().invokeAndWait(() -> FileDocumentManager.getInstance().saveAllDocuments());
        if (mergedApiChangeList.isEmpty()) {
            LOGGER.info("No API changes from start version to end version. Skip scan.");
            return new Pair(Collections.emptyList(), (Object)"");
        }
        JSONObject scanCppDetail = new JSONObject();
        JSONObject scanArkTSDetail = new JSONObject();
        Object scanContent = "";
        String failedFiles = "";
        try {
            LOGGER.info("start scan task");
            ApiScanUtil.clearProgress(projectPath);
            String ramdomTmpFolder = UUID.randomUUID().toString();
            apiScanTmpPathMap.put(projectPath, ramdomTmpFolder);
            apiScanStageMap.put(projectPath, ProcessStatusEnum.PROCESSING_ARK_TS.toString());
            String scanArkTs = ApiScanUtil.scan(modulePaths, mergedApiChangeList, scanArkTSDetail, ramdomTmpFolder);
            apiScanStageMap.put(projectPath, ProcessStatusEnum.PROCESSING_CPP.toString());
            Pair<String, String> cppResult = ApiScanUtil.scanCpp(modulePaths, mergedApiChangeList, scanCppDetail, ramdomTmpFolder);
            apiScanStageMap.put(projectPath, ProcessStatusEnum.FINISHED.toString());
            LOGGER.info("end scan task");
            if (StringUtils.isBlank((CharSequence)scanArkTs) || cppResult == null) {
                LOGGER.warn("API Change Assistant Scan Result is Null.");
                Pair<List<ApiDisplayItem>, String> pair = null;
                return pair;
            }
            scanContent = scanArkTs + (String)cppResult.getFirst();
            failedFiles = (String)cppResult.getSecond();
        }
        finally {
            ApiChangeAssistantTraceUtil.traceSourceVersion(startVersion, endVersion, scanCppDetail, scanArkTSDetail);
            ApiScanUtil.clearProgress(projectPath);
        }
        Map<String, ApiChangeItem> apiChangeItemMap = mergedApiChangeList.stream().collect(Collectors.toMap(item -> item.getInterfaceChanges().getId(), item -> item, (existing, replacement) -> existing));
        return new Pair(ApiScanUtil.getApiChangeResult((String)scanContent, apiChangeItemMap), (Object)failedFiles);
    }

    public static void clearProgress(String projectPath) {
        Path tmpPath;
        if (StringUtils.isNotBlank((CharSequence)apiScanTmpPathMap.get(projectPath)) && Files.exists(tmpPath = Paths.get(PathManager.getTempPath(), apiScanTmpPathMap.get(projectPath)), new LinkOption[0])) {
            ApiScanUtil.deleteTmpFileQuietly(tmpPath);
        }
        if (StringUtils.isNotBlank((CharSequence)apiScanStageMap.get(projectPath))) {
            apiScanStageMap.remove(projectPath);
        }
        if (StringUtils.isNotBlank((CharSequence)apiScanTmpPathMap.get(projectPath))) {
            apiScanTmpPathMap.remove(projectPath);
        }
    }

    public static List<ModuleNode> getModuleTreeInfos(@NotNull Project project) {
        if (project == null) {
            ApiScanUtil.$$$reportNull$$$0(2);
        }
        ProjectModel targetProjectModel = ProjectModelManager.getInstance().getTargetProjectModel(project);
        ArrayList<ModuleNode> moduleParentNodes = new ArrayList<ModuleNode>();
        if (targetProjectModel == null) {
            LOGGER.warn("Target project model is null");
            return moduleParentNodes;
        }
        ModuleNode topNode = new ModuleNode(ALL_MODULES, ALL_MODULES, ALL_MODULES);
        List<ModuleNode> children = topNode.getChildren();
        List moduleModelList = targetProjectModel.getModuleModelList();
        for (ModuleModel moduleModel : moduleModelList) {
            String modulePath = moduleModel.getModulePath();
            String moduleName = moduleModel.getModuleName();
            ModuleNode child = new ModuleNode(modulePath, modulePath, moduleName);
            children.add(child);
        }
        moduleParentNodes.add(topNode);
        moduleParentNodes.sort(Comparator.comparing(ModuleNode::getTitle));
        moduleParentNodes.forEach(ApiScanUtil::sortChildren);
        return moduleParentNodes;
    }

    private static String getDisplayAffectedApiVersion(String apiVersion) {
        List supportVersions = SimpleHosVersionMapper.INSTANCE.getSupportVersions();
        supportVersions.sort(Comparator.reverseOrder());
        HosSdkVersion hosSdkVersion = (HosSdkVersion)supportVersions.get(0);
        if (hosSdkVersion == null) {
            LOGGER.warn("fail to get hos sdk version");
            return "";
        }
        String platformVersion = hosSdkVersion.getPlatformVersion().getVersion();
        ApiVersion baseApi = hosSdkVersion.getFullBaseApi();
        String interfaceChangeApi = apiVersion;
        if (ComponentConstants.API_VERSION_PATTERN.matcher(apiVersion).matches()) {
            interfaceChangeApi = ApiScanUtil.findHosSdkVersionFromMapper(apiVersion);
        }
        String latestApiVersion = String.format(Locale.ROOT, "%s(%s)", platformVersion, baseApi.getValue());
        return String.format(Locale.ROOT, "%s - %s", interfaceChangeApi, latestApiVersion);
    }

    private static String findHosSdkVersionFromMapper(String apiVersion) {
        Map hosWithOhVersionMapper = IntegrationUtil.getHosWithOhVersionMapper();
        for (Map.Entry entry : hosWithOhVersionMapper.entrySet()) {
            if (!((String)entry.getValue()).equals(apiVersion)) continue;
            return String.format(Locale.ROOT, "%s(%s)", entry.getKey(), entry.getValue());
        }
        LOGGER.warn("failed to get hos sdk version from mapper");
        return "";
    }

    public static String getScanStartVersion(ProjectModel projectModel) {
        HosProjectModelV2 hosProjectModel;
        if (!(projectModel instanceof HosProjectModelV2) || (hosProjectModel = (HosProjectModelV2)projectModel).getActiveProduct() == null) {
            return "";
        }
        HosProductV2 activeProduct = hosProjectModel.getActiveProduct();
        HosSdkVersion targetSdkVersion = activeProduct.getTargetSdkVersion();
        String platformVersion = targetSdkVersion != null ? targetSdkVersion.getPlatformVersion().getVersion() : (activeProduct.getCompatibleSdkVersion() == null ? "" : activeProduct.getCompatibleSdkVersion().getPlatformVersion().getVersion());
        String apiVersion = IntegrationUtil.getHosWithOhVersionMapper().getOrDefault(platformVersion, "");
        return String.format(Locale.ROOT, "%s(%s)", platformVersion, apiVersion);
    }

    public static void sortChildren(ModuleNode node) {
        if (node == null || node.getChildren() == null) {
            LOGGER.warn("node is null or child of node is null");
            return;
        }
        node.getChildren().sort(Comparator.comparing(ModuleNode::getTitle));
        for (ModuleNode child : node.getChildren()) {
            ApiScanUtil.sortChildren(child);
        }
    }

    public static void cancelApiScanProcess(String projectPath) {
        LOGGER.info(String.format(Locale.ENGLISH, "cancel api scan process: %s", projectPath));
        ApiScanUtil.clearProgress(projectPath);
    }

    private static /* synthetic */ void $$$reportNull$$$0(int n) {
        Object[] objectArray;
        Object[] objectArray2;
        Object[] objectArray3 = new Object[3];
        switch (n) {
            default: {
                objectArray2 = objectArray3;
                objectArray3[0] = "apiChangeMap";
                break;
            }
            case 1: {
                objectArray2 = objectArray3;
                objectArray3[0] = "modulePaths";
                break;
            }
            case 2: {
                objectArray2 = objectArray3;
                objectArray3[0] = "project";
                break;
            }
        }
        objectArray2[1] = "com/huawei/deveco/programanalysis/apiscan/ApiScanUtil";
        switch (n) {
            default: {
                objectArray = objectArray2;
                objectArray2[2] = "getApiChangeResult";
                break;
            }
            case 1: {
                objectArray = objectArray2;
                objectArray2[2] = "scanData";
                break;
            }
            case 2: {
                objectArray = objectArray2;
                objectArray2[2] = "getModuleTreeInfos";
                break;
            }
        }
        throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objectArray));
    }

    private static class DiscardStreamConsumer
    extends Thread {
        private final InputStream is;

        DiscardStreamConsumer(InputStream is) {
            super("DiscardStreamConsumer-" + String.valueOf(UUID.randomUUID()));
            this.is = is;
        }

        @Override
        public void run() {
            try {
                byte[] buffer = new byte[1024];
                int ret = 0;
                while (ret != -1) {
                    ret = this.is.read(buffer);
                }
            }
            catch (IOException ex) {
                LOGGER.warn("Read input stream failed.");
            }
        }
    }
}

