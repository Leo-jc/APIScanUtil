/*
 * Decompiled with CFR 0.152.
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

import java.util.Objects;

public class AffectedApiItem {
    private String className = "";
    private String completePath = "";
    private String implementLanguage = "";
    private String interfaceName = "";
    private String interfaceType = "";
    private String methodDefinition = "";
    private String packageName = "";
    private String version = "";
    private String invokeInstance = "";

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof AffectedApiItem)) {
            return false;
        }
        AffectedApiItem other = (AffectedApiItem)obj;
        return Objects.equals(this.className, other.className) && Objects.equals(this.completePath, other.completePath) && Objects.equals(this.implementLanguage, other.implementLanguage) && Objects.equals(this.interfaceName, other.interfaceName) && Objects.equals(this.interfaceType, other.interfaceType) && Objects.equals(this.methodDefinition, other.methodDefinition) && Objects.equals(this.packageName, other.packageName) && Objects.equals(this.version, other.version) && Objects.equals(this.invokeInstance, other.invokeInstance);
    }

    public int hashCode() {
        return Objects.hash(this.className, this.completePath, this.implementLanguage, this.interfaceName, this.interfaceType, this.methodDefinition, this.packageName, this.version, this.invokeInstance);
    }

    public String getClassName() {
        return this.className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getCompletePath() {
        return this.completePath;
    }

    public void setCompletePath(String completePath) {
        this.completePath = completePath;
    }

    public String getImplementLanguage() {
        return this.implementLanguage;
    }

    public void setImplementLanguage(String implementLanguage) {
        this.implementLanguage = implementLanguage;
    }

    public String getInterfaceName() {
        return this.interfaceName;
    }

    public void setInterfaceName(String interfaceName) {
        this.interfaceName = interfaceName;
    }

    public String getInterfaceType() {
        return this.interfaceType;
    }

    public void setInterfaceType(String interfaceType) {
        this.interfaceType = interfaceType;
    }

    public String getMethodDefinition() {
        return this.methodDefinition;
    }

    public void setMethodDefinition(String methodDefinition) {
        this.methodDefinition = methodDefinition;
    }

    public String getPackageName() {
        return this.packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getVersion() {
        return this.version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getInvokeInstance() {
        return this.invokeInstance;
    }

    public void setInvokeInstance(String invokeInstance) {
        this.invokeInstance = invokeInstance;
    }
}

