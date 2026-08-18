/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.alibaba.fastjson2.JSON
 *  com.alibaba.fastjson2.JSONException
 *  com.alibaba.fastjson2.JSONObject
 *  com.huawei.deveco.common.cef.CefMessageRouterHandlerProxy
 *  com.huawei.deveco.common.country.setting.CountryRegionSetting
 *  com.huawei.deveco.projectmgmt.ohos.cef.CefQueryHandler
 *  com.huawei.deveco.projectmgmt.ohos.cef.ThemeHandler
 *  com.huawei.deveco.projectmgmt.ohos.signature.common.SignConfigManager
 *  com.huawei.deveco.projectmodel.ohos.model.ProjectModel
 *  com.huawei.deveco.projectmodel.ohos.model.ProjectModelManager
 *  com.huawei.deveco.projectmodel.ohos.sync.listener.OhosSyncDataListener
 *  com.huawei.deveco.projectmodel.ohos.sync.listener.OhosSyncListenerManager
 *  com.intellij.DynamicBundle
 *  com.intellij.ide.plugins.PluginManagerCore
 *  com.intellij.openapi.Disposable
 *  com.intellij.openapi.diagnostic.Logger
 *  com.intellij.openapi.extensions.PluginDescriptor
 *  com.intellij.openapi.extensions.PluginId
 *  com.intellij.openapi.project.Project
 *  com.intellij.openapi.util.SystemInfo
 *  com.intellij.openapi.util.SystemInfoRt
 *  com.intellij.openapi.util.text.StringUtil
 *  com.intellij.ui.Gray
 *  com.intellij.ui.JBColor
 *  com.intellij.ui.NewUI
 *  com.intellij.ui.jcef.JBCefBrowser
 *  com.intellij.ui.jcef.JBCefClient
 *  com.intellij.util.ui.JBDimension
 *  com.intellij.util.ui.UIUtil
 *  org.cef.browser.CefBrowser
 *  org.cef.browser.CefFrame
 *  org.cef.browser.CefMessageRouter
 *  org.cef.callback.CefContextMenuParams
 *  org.cef.callback.CefMenuModel
 *  org.cef.callback.CefQueryCallback
 *  org.cef.handler.CefContextMenuHandler
 *  org.cef.handler.CefContextMenuHandlerAdapter
 *  org.cef.handler.CefLoadHandler
 *  org.cef.handler.CefLoadHandlerAdapter
 *  org.cef.handler.CefMessageRouterHandler
 *  org.cef.handler.CefMessageRouterHandlerAdapter
 *  org.jetbrains.annotations.NotNull
 */
package com.huawei.deveco.programanalysis.apiscan;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONException;
import com.alibaba.fastjson2.JSONObject;
import com.huawei.deveco.common.cef.CefMessageRouterHandlerProxy;
import com.huawei.deveco.common.country.setting.CountryRegionSetting;
import com.huawei.deveco.programanalysis.apiscan.ApiScanUtil;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiLineChangeData;
import com.huawei.deveco.programanalysis.apiscan.bean.ModuleNode;
import com.huawei.deveco.programanalysis.apiscan.utils.ThemeChangeUtil;
import com.huawei.deveco.projectmgmt.ohos.cef.CefQueryHandler;
import com.huawei.deveco.projectmgmt.ohos.cef.ThemeHandler;
import com.huawei.deveco.projectmgmt.ohos.signature.common.SignConfigManager;
import com.huawei.deveco.projectmodel.ohos.model.ProjectModel;
import com.huawei.deveco.projectmodel.ohos.model.ProjectModelManager;
import com.huawei.deveco.projectmodel.ohos.sync.listener.OhosSyncDataListener;
import com.huawei.deveco.projectmodel.ohos.sync.listener.OhosSyncListenerManager;
import com.intellij.DynamicBundle;
import com.intellij.ide.plugins.PluginManagerCore;
import com.intellij.openapi.Disposable;
import com.intellij.openapi.diagnostic.Logger;
import com.intellij.openapi.extensions.PluginDescriptor;
import com.intellij.openapi.extensions.PluginId;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.SystemInfo;
import com.intellij.openapi.util.SystemInfoRt;
import com.intellij.openapi.util.text.StringUtil;
import com.intellij.ui.Gray;
import com.intellij.ui.JBColor;
import com.intellij.ui.NewUI;
import com.intellij.ui.jcef.JBCefBrowser;
import com.intellij.ui.jcef.JBCefClient;
import com.intellij.util.ui.JBDimension;
import com.intellij.util.ui.UIUtil;
import java.awt.Color;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import javax.swing.JComponent;
import javax.swing.JPanel;
import org.cef.browser.CefBrowser;
import org.cef.browser.CefFrame;
import org.cef.browser.CefMessageRouter;
import org.cef.callback.CefContextMenuParams;
import org.cef.callback.CefMenuModel;
import org.cef.callback.CefQueryCallback;
import org.cef.handler.CefContextMenuHandler;
import org.cef.handler.CefContextMenuHandlerAdapter;
import org.cef.handler.CefLoadHandler;
import org.cef.handler.CefLoadHandlerAdapter;
import org.cef.handler.CefMessageRouterHandler;
import org.cef.handler.CefMessageRouterHandlerAdapter;
import org.jetbrains.annotations.NotNull;

public class ApiChangeWindow
extends JPanel
implements Disposable {
    private static final Logger LOGGER = Logger.getInstance(ApiChangeWindow.class);
    private static final long serialVersionUID = 1L;
    private static final String INDEX_FILE = Paths.get("api-change-assistant-view", "index.html").toString();
    protected final JBCefBrowser jbCefBrowser;
    private final CefMessageRouter router;
    private final Project project;

    public ApiChangeWindow(@NotNull String eventKey, @NotNull Project project) {
        if (eventKey == null) {
            ApiChangeWindow.$$$reportNull$$$0(0);
        }
        if (project == null) {
            ApiChangeWindow.$$$reportNull$$$0(1);
        }
        this.project = project;
        boolean offScreenRender = SystemInfoRt.isWindows || SystemInfoRt.isMac;
        String url = ApiChangeWindow.loadUrl(eventKey);
        this.jbCefBrowser = JBCefBrowser.createBuilder().setOffScreenRendering(offScreenRender).setUrl(url).build();
        this.router = CefMessageRouter.create();
        JComponent jComponent = this.jbCefBrowser.getComponent();
        jComponent.setBackground((Color)new JBColor((Color)Gray._246, new Color(61, 63, 65)));
        jComponent.setPreferredSize((Dimension)new JBDimension(1875, 312));
        this.jbCefBrowser.getJBCefClient().addLoadHandler((CefLoadHandler)new ApiChangeCefLoadHandlerAdapter(), this.jbCefBrowser.getCefBrowser());
        this.add((Component)jComponent, "Center");
    }

    public static String loadUrl(@NotNull String actionKey) {
        if (actionKey == null) {
            ApiChangeWindow.$$$reportNull$$$0(2);
        }
        String url = "%s%s#/%s?theme=%s&countryRegion=%s&localeLanguage=%s&isNewUIEnabled=%s";
        if (SignConfigManager.getInstance().isShowSigningConfigs()) {
            url = "%s%s#/%s/project/2?theme=%s&countryRegion=%s&localeLanguage=%s&isNewUIEnabled=%s";
            SignConfigManager.getInstance().setShowSigningConfigs(false);
        }
        return String.format(Locale.ROOT, url, "file:///", ApiChangeWindow.getIndexFilePath(), actionKey, UIUtil.isUnderDarcula() ? "dark" : "light", CountryRegionSetting.getInstance().getUserCountryRegion(), DynamicBundle.getLocale().getLanguage(), NewUI.isEnabled() ? "true" : "false");
    }

    private static String getIndexFilePath() {
        return ApiChangeWindow.getPluginPath().map(path -> path.resolve(INDEX_FILE).normalize().toString()).orElse("");
    }

    public static Optional<Path> getPluginPath() {
        return Optional.of(PluginId.getId((String)"com.huawei.ohos")).map(PluginManagerCore::getPlugin).map(PluginDescriptor::getPluginPath);
    }

    public void initJCEF(Map<String, CefQueryHandler> cefQueryHandlerMap) {
        this.addCefDefaultBehavior();
        this.addDefaultHandler(cefQueryHandlerMap);
        ApiChangeMessageRouterHandler cefMessageRouterHandler = new ApiChangeMessageRouterHandler(cefQueryHandlerMap);
        CefMessageRouterHandlerProxy routerHandlerProxy = CefMessageRouterHandlerProxy.getInstance();
        routerHandlerProxy.putCefRouter(this.jbCefBrowser.getCefBrowser(), (CefMessageRouterHandler)cefMessageRouterHandler);
        this.router.addHandler((CefMessageRouterHandler)routerHandlerProxy, true);
        this.jbCefBrowser.getCefBrowser().getClient().addMessageRouter(this.router);
        this.setContentAdaptor();
        ThemeChangeUtil themeChangeUtil = new ThemeChangeUtil();
        themeChangeUtil.addThemeListener(this.jbCefBrowser);
        ProjectModel targetProjectModel = ProjectModelManager.getInstance().getTargetProjectModel(this.project);
        if (targetProjectModel != null) {
            this.registerNotifySyncRequiredListener(targetProjectModel);
        }
    }

    private void addCefDefaultBehavior() {
        JBCefClient jbCefClient = this.jbCefBrowser.getJBCefClient();
        CefBrowser cefBrowser = this.jbCefBrowser.getCefBrowser();
        jbCefClient.addContextMenuHandler((CefContextMenuHandler)new CefContextMenuHandlerAdapter(this){

            public void onBeforeContextMenu(CefBrowser browser, CefFrame frame, CefContextMenuParams params, CefMenuModel model) {
                model.clear();
            }
        }, cefBrowser);
    }

    protected void addDefaultHandler(@NotNull Map<String, CefQueryHandler> cefQueryHandlerMap) {
        if (cefQueryHandlerMap == null) {
            ApiChangeWindow.$$$reportNull$$$0(3);
        }
        cefQueryHandlerMap.putIfAbsent("/common/getThemeData", (CefQueryHandler)new ThemeHandler());
    }

    private void setContentAdaptor() {
        this.addComponentListener(new ComponentAdapter(){

            @Override
            public void componentResized(ComponentEvent e) {
                Dimension newSize = ApiChangeWindow.this.getSize();
                ApiChangeWindow.this.jbCefBrowser.getComponent().setPreferredSize(newSize);
                ApiChangeWindow.this.jbCefBrowser.getComponent().revalidate();
            }
        });
    }

    public void updateLineNumber(ApiLineChangeData detail) {
        this.jbCefBrowser.getCefBrowser().executeJavaScript("window.dispatchEvent(new CustomEvent('treeDataUpdate', { detail: " + JSON.toJSONString((Object)detail) + " }));", this.jbCefBrowser.getCefBrowser().getURL(), 0);
    }

    public void sendProgressUpdate(String stage, int percent, String path) {
        JSONObject progress = new JSONObject();
        progress.put((Object)"percent", (Object)percent);
        progress.put((Object)"path", (Object)path);
        JSONObject detail = new JSONObject();
        detail.put((Object)"stage", (Object)stage);
        detail.put((Object)"progress", (Object)progress);
        JSONObject eventDetail = new JSONObject();
        eventDetail.put((Object)"detail", (Object)detail);
        String script = "window.dispatchEvent(new CustomEvent('progressUpdate', " + String.valueOf(eventDetail) + "));";
        this.jbCefBrowser.getCefBrowser().executeJavaScript(script, this.jbCefBrowser.getCefBrowser().getURL(), 0);
    }

    private void registerNotifySyncRequiredListener(@NotNull ProjectModel projectModel) {
        if (projectModel == null) {
            ApiChangeWindow.$$$reportNull$$$0(4);
        }
        OhosSyncListenerManager.getInstance((ProjectModel)projectModel).addListener(new OhosSyncDataListener(){

            public void syncSucceed(@NotNull ProjectModel projectModel) {
                if (projectModel == null) {
                    3.$$$reportNull$$$0(0);
                }
                List<ModuleNode> moduleTreeInfos = ApiScanUtil.getModuleTreeInfos(ApiChangeWindow.this.project);
                ThemeChangeUtil.executeJavaScript(ApiChangeWindow.this.jbCefBrowser, String.format("{const event = new Event(\"syncSucceed\"); event.payload = {moduleInfos: %s}; window.dispatchEvent(event);}", JSON.toJSONString(moduleTreeInfos)));
            }

            public void syncFailed(@NotNull ProjectModel projectModel, @NotNull String errorMsg) {
                if (projectModel == null) {
                    3.$$$reportNull$$$0(1);
                }
                if (errorMsg == null) {
                    3.$$$reportNull$$$0(2);
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
                objectArray2[1] = "com/huawei/deveco/programanalysis/apiscan/ApiChangeWindow$3";
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

    public void dispose() {
        this.jbCefBrowser.dispose();
    }

    private static /* synthetic */ void $$$reportNull$$$0(int n) {
        Object[] objectArray;
        Object[] objectArray2;
        Object[] objectArray3 = new Object[3];
        switch (n) {
            default: {
                objectArray2 = objectArray3;
                objectArray3[0] = "eventKey";
                break;
            }
            case 1: {
                objectArray2 = objectArray3;
                objectArray3[0] = "project";
                break;
            }
            case 2: {
                objectArray2 = objectArray3;
                objectArray3[0] = "actionKey";
                break;
            }
            case 3: {
                objectArray2 = objectArray3;
                objectArray3[0] = "cefQueryHandlerMap";
                break;
            }
            case 4: {
                objectArray2 = objectArray3;
                objectArray3[0] = "projectModel";
                break;
            }
        }
        objectArray2[1] = "com/huawei/deveco/programanalysis/apiscan/ApiChangeWindow";
        switch (n) {
            default: {
                objectArray = objectArray2;
                objectArray2[2] = "<init>";
                break;
            }
            case 2: {
                objectArray = objectArray2;
                objectArray2[2] = "loadUrl";
                break;
            }
            case 3: {
                objectArray = objectArray2;
                objectArray2[2] = "addDefaultHandler";
                break;
            }
            case 4: {
                objectArray = objectArray2;
                objectArray2[2] = "registerNotifySyncRequiredListener";
                break;
            }
        }
        throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objectArray));
    }

    private static class ApiChangeCefLoadHandlerAdapter
    extends CefLoadHandlerAdapter {
        private ApiChangeCefLoadHandlerAdapter() {
        }

        public void onLoadEnd(CefBrowser cefBrowser, CefFrame cefFrame, int index) {
            if (SystemInfo.isMac) {
                cefBrowser.setFocus(false);
                cefBrowser.setFocus(true);
            }
        }
    }

    private static class ApiChangeMessageRouterHandler
    extends CefMessageRouterHandlerAdapter {
        private final Map<String, CefQueryHandler> cefQueryHandlerMap;

        private ApiChangeMessageRouterHandler(Map<String, CefQueryHandler> cefQueryHandlers) {
            this.cefQueryHandlerMap = Objects.requireNonNullElseGet(cefQueryHandlers, HashMap::new);
        }

        public boolean onQuery(CefBrowser browser, CefFrame frame, long queryId, String request, boolean isPersistent, CefQueryCallback callback) {
            try {
                JSONObject requestObject = JSONObject.parseObject((String)request);
                String key = requestObject.getString("key");
                String data = requestObject.getString("data");
                if (data == null || this.isEmptyHandler(key)) {
                    String errMsg = "js query error: key";
                    callback.failure(1, errMsg);
                    LOGGER.warn(errMsg);
                    return false;
                }
                CefQueryHandler handler = this.cefQueryHandlerMap.get(key);
                handler.onQuery(data, callback);
                return true;
            }
            catch (JSONException exception) {
                String errMsg = "js query error: parser request json error";
                callback.failure(1, errMsg);
                LOGGER.warn(errMsg);
                return false;
            }
        }

        private boolean isEmptyHandler(String key) {
            if (StringUtil.isEmpty((String)key)) {
                return true;
            }
            return !this.cefQueryHandlerMap.containsKey(key);
        }
    }
}

