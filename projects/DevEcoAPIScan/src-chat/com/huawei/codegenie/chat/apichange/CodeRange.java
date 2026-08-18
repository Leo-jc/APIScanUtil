/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  lombok.Generated
 */
package com.huawei.codegenie.chat.apichange;

import lombok.Generated;

public class CodeRange {
    int startLineNumber;
    int endLineNumber;

    @Generated
    public int getStartLineNumber() {
        return this.startLineNumber;
    }

    @Generated
    public int getEndLineNumber() {
        return this.endLineNumber;
    }

    @Generated
    public void setStartLineNumber(int startLineNumber) {
        this.startLineNumber = startLineNumber;
    }

    @Generated
    public void setEndLineNumber(int endLineNumber) {
        this.endLineNumber = endLineNumber;
    }

    @Generated
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof CodeRange)) {
            return false;
        }
        CodeRange other = (CodeRange)o;
        if (!other.canEqual(this)) {
            return false;
        }
        if (this.getStartLineNumber() != other.getStartLineNumber()) {
            return false;
        }
        return this.getEndLineNumber() == other.getEndLineNumber();
    }

    @Generated
    protected boolean canEqual(Object other) {
        return other instanceof CodeRange;
    }

    @Generated
    public int hashCode() {
        int PRIME = 59;
        int result = 1;
        result = result * 59 + this.getStartLineNumber();
        result = result * 59 + this.getEndLineNumber();
        return result;
    }

    @Generated
    public String toString() {
        return "CodeRange(startLineNumber=" + this.getStartLineNumber() + ", endLineNumber=" + this.getEndLineNumber() + ")";
    }

    @Generated
    public CodeRange(int startLineNumber, int endLineNumber) {
        this.startLineNumber = startLineNumber;
        this.endLineNumber = endLineNumber;
    }
}
