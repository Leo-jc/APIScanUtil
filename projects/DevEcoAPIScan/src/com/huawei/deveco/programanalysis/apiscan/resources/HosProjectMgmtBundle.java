/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.intellij.DynamicBundle
 *  org.jetbrains.annotations.NotNull
 *  org.jetbrains.annotations.PropertyKey
 */
package com.huawei.deveco.programanalysis.apiscan.resources;

import com.intellij.DynamicBundle;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.PropertyKey;

public class HosProjectMgmtBundle
extends DynamicBundle {
    private static final String BUNDLE_NAME = "messages.HosProjectApichangeMgmt";
    private static final HosProjectMgmtBundle INSTANCE = new HosProjectMgmtBundle();

    private HosProjectMgmtBundle() {
        super(BUNDLE_NAME);
    }

    public static String message(@NotNull @PropertyKey(resourceBundle="messages.HosProjectApichangeMgmt") @NotNull @PropertyKey(resourceBundle="messages.HosProjectApichangeMgmt") String key, Object ... params) {
        if (key == null) {
            HosProjectMgmtBundle.$$$reportNull$$$0(0);
        }
        if (params == null) {
            HosProjectMgmtBundle.$$$reportNull$$$0(1);
        }
        return INSTANCE.getMessage(key, params);
    }

    private static /* synthetic */ void $$$reportNull$$$0(int n) {
        Object[] objectArray;
        Object[] objectArray2 = new Object[3];
        switch (n) {
            default: {
                objectArray = objectArray2;
                objectArray2[0] = "key";
                break;
            }
            case 1: {
                objectArray = objectArray2;
                objectArray2[0] = "params";
                break;
            }
        }
        objectArray[1] = "com/huawei/deveco/programanalysis/apiscan/resources/HosProjectMgmtBundle";
        objectArray[2] = "message";
        throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objectArray));
    }
}

