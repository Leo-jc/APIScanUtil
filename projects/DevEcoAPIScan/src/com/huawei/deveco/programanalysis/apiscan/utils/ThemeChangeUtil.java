/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.intellij.ide.ui.LafManager
 *  com.intellij.ide.ui.LafManagerListener
 *  com.intellij.openapi.diagnostic.Logger
 *  com.intellij.ui.jcef.JBCefBrowser
 *  org.cef.browser.CefBrowser
 *  org.jetbrains.annotations.NotNull
 */
package com.huawei.deveco.programanalysis.apiscan.utils;

import com.intellij.ide.ui.LafManager;
import com.intellij.ide.ui.LafManagerListener;
import com.intellij.openapi.diagnostic.Logger;
import com.intellij.ui.jcef.JBCefBrowser;
import org.cef.browser.CefBrowser;
import org.jetbrains.annotations.NotNull;

public class ThemeChangeUtil {
    private static final Logger LOGGER = Logger.getInstance(ThemeChangeUtil.class);
    private String currentTheme;

    public void addThemeListener(final JBCefBrowser jbCefBrowser) {
        this.currentTheme = LafManager.getInstance().getCurrentLookAndFeel().getName().contains("Light") ? "light" : "dark";
        LafManager.getInstance().addLafManagerListener(new LafManagerListener(){

            public void lookAndFeelChanged(@NotNull LafManager lafManager) {
                String newTheme;
                if (lafManager == null) {
                    1.$$$reportNull$$$0(0);
                }
                String string = newTheme = lafManager.getCurrentLookAndFeel().getName().contains("Light") ? "light" : "dark";
                if (!newTheme.equals(ThemeChangeUtil.this.currentTheme)) {
                    ThemeChangeUtil.this.currentTheme = newTheme;
                    ThemeChangeUtil.this.postThemeMessage(jbCefBrowser, newTheme);
                }
            }

            private static /* synthetic */ void $$$reportNull$$$0(int n) {
                throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", "lafManager", "com/huawei/deveco/programanalysis/apiscan/utils/ThemeChangeUtil$1", "lookAndFeelChanged"));
            }
        });
    }

    private void postThemeMessage(JBCefBrowser jbCefBrowser, String theme) {
        ThemeChangeUtil.executeJavaScript(jbCefBrowser, String.format("{const event = new Event(\"getTheme\"); event.payload = {theme: \"%s\"}; window.dispatchEvent(event);}", theme));
    }

    public static void executeJavaScript(JBCefBrowser jbCefBrowser, String javaScript) {
        CefBrowser cefBrowser = jbCefBrowser.getCefBrowser();
        if (cefBrowser.getMainFrame() == null) {
            LOGGER.warn("executeJavaScript failed: cefBrowser main frame is null!");
            return;
        }
        cefBrowser.executeJavaScript(javaScript, cefBrowser.getMainFrame().getURL(), 0);
    }
}

