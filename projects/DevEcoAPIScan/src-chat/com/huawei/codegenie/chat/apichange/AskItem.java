/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  lombok.Generated
 */
package com.huawei.codegenie.chat.apichange;

import com.huawei.codegenie.chat.apichange.CodeRange;
import java.util.List;
import lombok.Generated;

public class AskItem {
    CodeRange codeRange;
    String content;
    List<Integer> changeLines;

    @Generated
    public CodeRange getCodeRange() {
        return this.codeRange;
    }

    @Generated
    public String getContent() {
        return this.content;
    }

    @Generated
    public List<Integer> getChangeLines() {
        return this.changeLines;
    }

    @Generated
    public void setCodeRange(CodeRange codeRange) {
        this.codeRange = codeRange;
    }

    @Generated
    public void setContent(String content) {
        this.content = content;
    }

    @Generated
    public void setChangeLines(List<Integer> changeLines) {
        this.changeLines = changeLines;
    }

    @Generated
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof AskItem)) {
            return false;
        }
        AskItem other = (AskItem)o;
        if (!other.canEqual(this)) {
            return false;
        }
        CodeRange this$codeRange = this.getCodeRange();
        CodeRange other$codeRange = other.getCodeRange();
        if (this$codeRange == null ? other$codeRange != null : !((Object)this$codeRange).equals(other$codeRange)) {
            return false;
        }
        String this$content = this.getContent();
        String other$content = other.getContent();
        if (this$content == null ? other$content != null : !this$content.equals(other$content)) {
            return false;
        }
        List<Integer> this$changeLines = this.getChangeLines();
        List<Integer> other$changeLines = other.getChangeLines();
        return !(this$changeLines == null ? other$changeLines != null : !((Object)this$changeLines).equals(other$changeLines));
    }

    @Generated
    protected boolean canEqual(Object other) {
        return other instanceof AskItem;
    }

    @Generated
    public int hashCode() {
        int PRIME = 59;
        int result = 1;
        CodeRange $codeRange = this.getCodeRange();
        result = result * 59 + ($codeRange == null ? 43 : ((Object)$codeRange).hashCode());
        String $content = this.getContent();
        result = result * 59 + ($content == null ? 43 : $content.hashCode());
        List<Integer> $changeLines = this.getChangeLines();
        result = result * 59 + ($changeLines == null ? 43 : ((Object)$changeLines).hashCode());
        return result;
    }

    @Generated
    public String toString() {
        return "AskItem(codeRange=" + String.valueOf(this.getCodeRange()) + ", content=" + this.getContent() + ", changeLines=" + String.valueOf(this.getChangeLines()) + ")";
    }

    @Generated
    public AskItem(CodeRange codeRange, String content, List<Integer> changeLines) {
        this.codeRange = codeRange;
        this.content = content;
        this.changeLines = changeLines;
    }
}
