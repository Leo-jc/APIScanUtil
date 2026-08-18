/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.intellij.openapi.util.IconLoader
 *  com.intellij.ui.NewUI
 */
package com.huawei.deveco.programanalysis.apiscan.icon;

import com.intellij.openapi.util.IconLoader;
import com.intellij.ui.NewUI;
import javax.swing.Icon;

public class Icons {
    public static final Icon API_CHANGE_ASSISTANT_ICON_LIGHT = NewUI.isEnabled() ? Icons.load("/icons/menu_icons/apiChange/api_change.svg") : Icons.load("/icons/menu_icons/api_change.svg");

    public static Icon load(String path) {
        return IconLoader.findIcon((String)path, (ClassLoader)Icons.class.getClassLoader());
    }
}

