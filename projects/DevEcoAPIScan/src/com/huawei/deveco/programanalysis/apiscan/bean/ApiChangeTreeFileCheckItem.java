/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.google.common.base.Objects
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

import com.google.common.base.Objects;

public class ApiChangeTreeFileCheckItem {
    String key;
    String checked;

    public ApiChangeTreeFileCheckItem(String key, String checked) {
        this.key = key;
        this.checked = checked;
    }

    public String getKey() {
        return this.key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getChecked() {
        return this.checked;
    }

    public void setChecked(String checked) {
        this.checked = checked;
    }

    public static ApiChangeTreeFileCheckItem of(String line) {
        String[] split = line.split(",");
        if (split.length >= 2) {
            return new ApiChangeTreeFileCheckItem(split[0], split[1]);
        }
        return null;
    }

    public boolean equals(Object o) {
        if (o == null || this.getClass() != o.getClass()) {
            return false;
        }
        ApiChangeTreeFileCheckItem that = (ApiChangeTreeFileCheckItem)o;
        return Objects.equal((Object)this.key, (Object)that.key) && Objects.equal((Object)this.checked, (Object)that.checked);
    }

    public int hashCode() {
        return Objects.hashCode((Object[])new Object[]{this.key, this.checked});
    }
}

