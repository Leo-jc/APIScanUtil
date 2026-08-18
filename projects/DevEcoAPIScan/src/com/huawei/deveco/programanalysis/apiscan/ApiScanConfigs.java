/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.huawei.deveco.projectmgmt.ohos.component.service.ProjectMgmtPropertiesComponent
 *  com.intellij.openapi.diagnostic.Logger
 *  org.apache.commons.lang3.StringUtils
 *  org.jetbrains.annotations.NotNull
 */
package com.huawei.deveco.programanalysis.apiscan;

import com.huawei.deveco.projectmgmt.ohos.component.service.ProjectMgmtPropertiesComponent;
import com.intellij.openapi.diagnostic.Logger;
import com.sun.management.OperatingSystemMXBean;
import java.lang.management.ManagementFactory;
import java.util.Locale;
import org.apache.commons.lang3.StringUtils;
import org.jetbrains.annotations.NotNull;

public class ApiScanConfigs {
    private static final Logger LOGGER = Logger.getInstance(ApiScanConfigs.class);
    private static final String KEY_MAX_OLD_SPACE_SIZE = "API_SCAN_MAX_OLD_SPACE_SIZE";
    private static final int DEFAULT_MAX_OLD_SPACE_SIZE_MB = 3072;
    private static final int DEFAULT_BATCH_SIZE = 1000;
    private static final int BATCH_SIZE_INCREMENTAL = 500;

    public static int getBatchSize() {
        int maxOldSpaceSize = ApiScanConfigs.getMaxOldSpaceSize();
        if (maxOldSpaceSize <= 3072) {
            return 1000;
        }
        int increment = (maxOldSpaceSize - 3072) / 1024 * 500;
        return 1000 + increment;
    }

    public static int getMaxOldSpaceSize() {
        return ApiScanConfigs.getIntegerOrDefault(KEY_MAX_OLD_SPACE_SIZE, 3072);
    }

    public static int getSystemMemoryMB() {
        java.lang.management.OperatingSystemMXBean operatingSystemMXBean = ManagementFactory.getOperatingSystemMXBean();
        if (operatingSystemMXBean instanceof OperatingSystemMXBean) {
            OperatingSystemMXBean osmxb = (OperatingSystemMXBean)operatingSystemMXBean;
            long totalMemorySize = osmxb.getTotalMemorySize();
            return (int)(totalMemorySize / 0x100000L);
        }
        LOGGER.warn("System memory information is unavailable due to type conversion failure.");
        return 204800;
    }

    public static void setMaxOldSpaceSize(int maxOldSpaceSize) {
        ApiScanConfigs.setInteger(KEY_MAX_OLD_SPACE_SIZE, maxOldSpaceSize);
    }

    private static int getIntegerOrDefault(@NotNull String key, int defaultValue) {
        ProjectMgmtPropertiesComponent properties;
        String value;
        if (key == null) {
            ApiScanConfigs.$$$reportNull$$$0(0);
        }
        if (StringUtils.isEmpty((CharSequence)(value = (properties = ProjectMgmtPropertiesComponent.getInstance()).getValue(key)))) {
            return defaultValue;
        }
        try {
            return Integer.parseInt(value);
        }
        catch (NumberFormatException exception) {
            String message = String.format(Locale.ENGLISH, "state %s is not a valid integer", key);
            LOGGER.warn(message);
            return defaultValue;
        }
    }

    private static void setInteger(@NotNull String key, int value) {
        if (key == null) {
            ApiScanConfigs.$$$reportNull$$$0(1);
        }
        ProjectMgmtPropertiesComponent properties = ProjectMgmtPropertiesComponent.getInstance();
        properties.setValue(key, String.valueOf(value));
    }

    private static /* synthetic */ void $$$reportNull$$$0(int n) {
        Object[] objectArray;
        Object[] objectArray2 = new Object[3];
        objectArray2[0] = "key";
        objectArray2[1] = "com/huawei/deveco/programanalysis/apiscan/ApiScanConfigs";
        switch (n) {
            default: {
                objectArray = objectArray2;
                objectArray2[2] = "getIntegerOrDefault";
                break;
            }
            case 1: {
                objectArray = objectArray2;
                objectArray2[2] = "setInteger";
                break;
            }
        }
        throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objectArray));
    }
}

