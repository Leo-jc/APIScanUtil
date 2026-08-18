/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  lombok.Generated
 */
package com.huawei.deveco.programanalysis.apiscan.bean;

import lombok.Generated;

public class PageResult {
    private String data;
    private String searchParams;
    private Integer total;
    private Integer page;

    @Generated
    public PageResult() {
    }

    @Generated
    public String getData() {
        return this.data;
    }

    @Generated
    public String getSearchParams() {
        return this.searchParams;
    }

    @Generated
    public Integer getTotal() {
        return this.total;
    }

    @Generated
    public Integer getPage() {
        return this.page;
    }

    @Generated
    public void setData(String data) {
        this.data = data;
    }

    @Generated
    public void setSearchParams(String searchParams) {
        this.searchParams = searchParams;
    }

    @Generated
    public void setTotal(Integer total) {
        this.total = total;
    }

    @Generated
    public void setPage(Integer page) {
        this.page = page;
    }

    @Generated
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof PageResult)) {
            return false;
        }
        PageResult other = (PageResult)o;
        if (!other.canEqual(this)) {
            return false;
        }
        Integer this$total = this.getTotal();
        Integer other$total = other.getTotal();
        if (this$total == null ? other$total != null : !((Object)this$total).equals(other$total)) {
            return false;
        }
        Integer this$page = this.getPage();
        Integer other$page = other.getPage();
        if (this$page == null ? other$page != null : !((Object)this$page).equals(other$page)) {
            return false;
        }
        String this$data = this.getData();
        String other$data = other.getData();
        if (this$data == null ? other$data != null : !this$data.equals(other$data)) {
            return false;
        }
        String this$searchParams = this.getSearchParams();
        String other$searchParams = other.getSearchParams();
        return !(this$searchParams == null ? other$searchParams != null : !this$searchParams.equals(other$searchParams));
    }

    @Generated
    protected boolean canEqual(Object other) {
        return other instanceof PageResult;
    }

    @Generated
    public int hashCode() {
        int PRIME = 59;
        int result = 1;
        Integer $total = this.getTotal();
        result = result * 59 + ($total == null ? 43 : ((Object)$total).hashCode());
        Integer $page = this.getPage();
        result = result * 59 + ($page == null ? 43 : ((Object)$page).hashCode());
        String $data = this.getData();
        result = result * 59 + ($data == null ? 43 : $data.hashCode());
        String $searchParams = this.getSearchParams();
        result = result * 59 + ($searchParams == null ? 43 : $searchParams.hashCode());
        return result;
    }

    @Generated
    public String toString() {
        return "PageResult(data=" + this.getData() + ", searchParams=" + this.getSearchParams() + ", total=" + this.getTotal() + ", page=" + this.getPage() + ")";
    }
}

