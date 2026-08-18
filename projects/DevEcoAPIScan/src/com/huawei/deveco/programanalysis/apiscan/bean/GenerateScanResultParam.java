/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.intellij.openapi.diagnostic.Logger
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

import com.huawei.deveco.programanalysis.apiscan.bean.ApiChangeItem;
import com.intellij.openapi.diagnostic.Logger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GenerateScanResultParam {
    private static final int INVALID_HEADER_INDEX = -1;
    private static final int HEADER_INDEX = 0;
    private static final int COLUMN_NUMBER = 11;
    private static final String HEADER_INVOKE_LOCATION = "Invoke Location";
    private static final String HEADER_METHOD_DEFINITION = "MethodDefinition";
    private static final String HEADER_CHANGE_ID = "ChangeId";
    private static final String HEADER_API_FILE_PATH = "Api File Path";
    private static final String HEADER_API_PREFIX = "Api Prefix";
    private static final String HEADER_API_TYPE = "Api Type";
    private static final String HEADER_API_NAME = "Api Name";
    private static final String HEADER_INVOKE_INSTANCE = "Invoke Instance";
    private static final Logger LOGGER = Logger.getInstance(GenerateScanResultParam.class);
    private Map<String, ApiChangeItem> apiChangeMap = new HashMap<String, ApiChangeItem>();
    private List<List<String>> parsedCsvData;
    private List<String> ids = new ArrayList<String>();
    private int methodIndex;
    private int invokeLocationIndex;
    private int apiFilePathIndex;
    private int apiPrefixIndex;
    private int changeIdIndex;
    private int apiTypeIndex;
    private int apiNameIndex;
    private int invokeInstanceIndex;
    private String methodDef = "";
    private String invokeLocation = "";
    private String language = "";
    private String apiType;
    private String apiFilePath;
    private String apiPrefix;
    private String apiName;
    private String invokeInstance;

    public void setApiChangeMap(Map<String, ApiChangeItem> apiChangeMap) {
        this.apiChangeMap = apiChangeMap;
    }

    public void setIds(List<String> ids) {
        this.ids = ids;
    }

    public void setMethodDef(String methodDef) {
        this.methodDef = methodDef;
    }

    public void setInvokeLocation(String invokeLocation) {
        this.invokeLocation = invokeLocation;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public Map<String, ApiChangeItem> getApiChangeMap() {
        return this.apiChangeMap;
    }

    public List<String> getIds() {
        return this.ids;
    }

    public String getMethodDef() {
        return this.methodDef;
    }

    public String getInvokeLocation() {
        return this.invokeLocation;
    }

    public String getLanguage() {
        return this.language;
    }

    public List<List<String>> getParsedCsvData() {
        return this.parsedCsvData;
    }

    public void setParsedCsvData(List<List<String>> parsedCsvData) {
        this.parsedCsvData = parsedCsvData;
    }

    public int getMethodIndex() {
        return this.methodIndex;
    }

    public void setMethodIndex(int methodIndex) {
        this.methodIndex = methodIndex;
    }

    public int getInvokeLocationIndex() {
        return this.invokeLocationIndex;
    }

    public void setInvokeLocationIndex(int invokeLocationIndex) {
        this.invokeLocationIndex = invokeLocationIndex;
    }

    public int getApiFilePathIndex() {
        return this.apiFilePathIndex;
    }

    public void setApiFilePathIndex(int apiFilePathIndex) {
        this.apiFilePathIndex = apiFilePathIndex;
    }

    public int getApiPrefixIndex() {
        return this.apiPrefixIndex;
    }

    public void setApiPrefixIndex(int apiPrefixIndex) {
        this.apiPrefixIndex = apiPrefixIndex;
    }

    public int getChangeIdIndex() {
        return this.changeIdIndex;
    }

    public void setChangeIdIndex(int changeIdIndex) {
        this.changeIdIndex = changeIdIndex;
    }

    public int getApiTypeIndex() {
        return this.apiTypeIndex;
    }

    public void setApiTypeIndex(int apiTypeIndex) {
        this.apiTypeIndex = apiTypeIndex;
    }

    public String getApiType() {
        return this.apiType;
    }

    public void setApiType(String apiType) {
        this.apiType = apiType;
    }

    public String getApiFilePath() {
        return this.apiFilePath;
    }

    public void setApiFilePath(String apiFilePath) {
        this.apiFilePath = apiFilePath;
    }

    public String getApiPrefix() {
        return this.apiPrefix;
    }

    public void setApiPrefix(String apiPrefix) {
        this.apiPrefix = apiPrefix;
    }

    public String getApiName() {
        return this.apiName;
    }

    public void setApiName(String apiName) {
        this.apiName = apiName;
    }

    public int getApiNameIndex() {
        return this.apiNameIndex;
    }

    public void setApiNameIndex(int apiNameIndex) {
        this.apiNameIndex = apiNameIndex;
    }

    public String getInvokeInstance() {
        return this.invokeInstance;
    }

    public void setInvokeInstance(String invokeInstance) {
        this.invokeInstance = invokeInstance;
    }

    public int getInvokeInstanceIndex() {
        return this.invokeInstanceIndex;
    }

    public void setInvokeInstanceIndex(int invokeInstanceIndex) {
        this.invokeInstanceIndex = invokeInstanceIndex;
    }

    public void setIndexFromParsedCsvData(List<List<String>> parsedData) {
        this.invokeLocationIndex = -1;
        this.methodIndex = -1;
        this.changeIdIndex = -1;
        this.apiFilePathIndex = -1;
        this.apiPrefixIndex = -1;
        this.apiTypeIndex = -1;
        this.apiNameIndex = -1;
        this.invokeInstanceIndex = -1;
        List<String> headers = parsedData.get(0);
        for (int i = 0; i < headers.size(); ++i) {
            if (HEADER_INVOKE_LOCATION.equals(headers.get(i))) {
                this.invokeLocationIndex = i;
            }
            if (HEADER_METHOD_DEFINITION.equals(headers.get(i))) {
                this.methodIndex = i;
            }
            if (HEADER_CHANGE_ID.equals(headers.get(i))) {
                this.changeIdIndex = i;
            }
            if (HEADER_API_FILE_PATH.equals(headers.get(i))) {
                this.apiFilePathIndex = i;
            }
            if (HEADER_API_PREFIX.equals(headers.get(i))) {
                this.apiPrefixIndex = i;
            }
            if (HEADER_API_TYPE.equals(headers.get(i))) {
                this.apiTypeIndex = i;
            }
            if (HEADER_API_NAME.equals(headers.get(i))) {
                this.apiNameIndex = i;
            }
            if (!HEADER_INVOKE_INSTANCE.equals(headers.get(i))) continue;
            this.invokeInstanceIndex = i;
        }
    }

    public boolean setScanReportInfo(List<List<String>> parsedCsvData, int index) {
        if (index >= parsedCsvData.size()) {
            LOGGER.warn("Index out of bound when accessing parsedCsvData row " + parsedCsvData.size());
            return false;
        }
        if (parsedCsvData.get(index).size() < 11) {
            LOGGER.warn("Incomplete parsedCsvData row with size" + parsedCsvData.get(index).size());
            return false;
        }
        this.methodDef = parsedCsvData.get(index).get(this.methodIndex);
        this.invokeLocation = parsedCsvData.get(index).get(this.invokeLocationIndex);
        this.apiType = parsedCsvData.get(index).get(this.apiTypeIndex);
        this.apiFilePath = parsedCsvData.get(index).get(this.apiFilePathIndex);
        this.apiPrefix = parsedCsvData.get(index).get(this.apiPrefixIndex);
        this.apiName = parsedCsvData.get(index).get(this.apiNameIndex);
        this.invokeInstance = parsedCsvData.get(index).get(this.invokeInstanceIndex);
        return true;
    }

    public boolean isAllIndexValid() {
        return this.invokeLocationIndex != -1 && this.methodIndex != -1 && this.changeIdIndex != -1 && this.apiFilePathIndex != -1 && this.apiPrefixIndex != -1 && this.apiTypeIndex != -1;
    }
}

