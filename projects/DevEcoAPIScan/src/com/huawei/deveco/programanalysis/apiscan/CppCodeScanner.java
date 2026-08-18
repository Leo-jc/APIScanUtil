/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.intellij.openapi.diagnostic.Logger
 *  com.intellij.openapi.editor.Document
 *  com.intellij.openapi.fileEditor.FileDocumentManager
 *  com.intellij.openapi.util.Pair
 *  com.intellij.openapi.vfs.LocalFileSystem
 *  com.intellij.openapi.vfs.VirtualFile
 */
package com.huawei.deveco.programanalysis.apiscan;

import com.huawei.deveco.programanalysis.apiscan.bean.AffectedApiItem;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiChangeItem;
import com.huawei.deveco.programanalysis.apiscan.bean.LineApiChangeInfo;
import com.intellij.openapi.diagnostic.Logger;
import com.intellij.openapi.editor.Document;
import com.intellij.openapi.fileEditor.FileDocumentManager;
import com.intellij.openapi.util.Pair;
import com.intellij.openapi.vfs.LocalFileSystem;
import com.intellij.openapi.vfs.VirtualFile;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

public class CppCodeScanner {
    private static final Logger LOGGER = Logger.getInstance(CppCodeScanner.class);
    private static final String SPLIT_LINE_REGEX = "(?<=\\R)";
    private String filePath;
    private String sourceCode;
    private CodeLine[] lines;
    private RegionType[] indexToType;
    private final List<ApiChangeItem> cppAPIChangeList;
    private final StateHandler[] stateHandlerTable = new StateHandler[]{new CodeHandler(), new LineCommentHandler(), new BlockCommentHandler(), new StringHandler()};

    public CppCodeScanner(List<ApiChangeItem> cppAPIChangeList) {
        this.cppAPIChangeList = cppAPIChangeList;
    }

    private void analyzeRegions() {
        if (this.sourceCode == null || this.sourceCode.isEmpty()) {
            LOGGER.warn("Source code is empty");
            this.indexToType = new RegionType[0];
            return;
        }
        int length = this.sourceCode.length();
        this.indexToType = new RegionType[length];
        CodeState curState = CodeState.CODE;
        int i = 0;
        while (i < length) {
            Pair<CodeState, Integer> nextStateInfo = this.stateHandlerTable[curState.ordinal()].handle(i);
            curState = (CodeState)((Object)nextStateInfo.getFirst());
            i = (Integer)nextStateInfo.getSecond();
        }
    }

    private int getLineNumberFromIndex(int index) {
        for (int i = 0; i < this.lines.length; ++i) {
            if (this.lines[i].startIndex > index || this.lines[i].endIndex < index) continue;
            return i;
        }
        return -1;
    }

    private char getPreChar(int index) {
        return index > 0 ? this.sourceCode.charAt(index - 1) : (char)'\u0000';
    }

    private char getNextNonBlankChar(int index) {
        int currentIndex = index;
        while (currentIndex + 1 < this.sourceCode.length()) {
            char c = this.sourceCode.charAt(currentIndex + 1);
            if (!Character.isWhitespace(c) && !Character.isISOControl(c)) {
                return c;
            }
            ++currentIndex;
        }
        return '\u0000';
    }

    private boolean checkPreChar(int index) {
        char c = this.getPreChar(index);
        return !Character.isLetter(c) && !Character.isDigit(c) && c != '_';
    }

    private boolean checkNextChar(int index) {
        char c = this.getNextNonBlankChar(index);
        return c == '(';
    }

    private boolean checkRegion(int index) {
        return this.indexToType[index] == RegionType.CODE;
    }

    private String getFileContent(String filePath) {
        VirtualFile virtualFile = LocalFileSystem.getInstance().findFileByPath(filePath);
        if (virtualFile == null) {
            LOGGER.warn("Virtual file not found: " + filePath);
            return "";
        }
        virtualFile.setCharset(StandardCharsets.UTF_8);
        Document document = FileDocumentManager.getInstance().getDocument(virtualFile);
        return document == null ? "" : document.getText();
    }

    private void getCodeLines() {
        String[] rawLines = this.sourceCode.split(SPLIT_LINE_REGEX, -1);
        this.lines = new CodeLine[rawLines.length];
        int startIndex = 0;
        for (int i = 0; i < rawLines.length; ++i) {
            int endIndex = startIndex + rawLines[i].length() - 1;
            this.lines[i] = new CodeLine(rawLines[i], startIndex, endIndex);
            startIndex = endIndex + 1;
        }
    }

    public void setUp(String filePath) {
        this.filePath = filePath;
        this.sourceCode = this.getFileContent(filePath);
        this.getCodeLines();
        this.analyzeRegions();
    }

    private List<LineApiChangeInfo> getMatchedLineApiChangeInfos(int lineIndex) {
        ArrayList<LineApiChangeInfo> result = new ArrayList<LineApiChangeInfo>();
        for (ApiChangeItem cppAPIChangeItem : this.cppAPIChangeList) {
            for (AffectedApiItem affectedAPIItem : cppAPIChangeItem.getAffectedApis()) {
                String lineContent;
                int matchIndexInLine;
                if (!affectedAPIItem.getImplementLanguage().equals("c") || (matchIndexInLine = (lineContent = this.lines[lineIndex].content).indexOf(affectedAPIItem.getInterfaceName())) == -1) continue;
                int startIndex = this.lines[lineIndex].startIndex + matchIndexInLine;
                int endIndex = startIndex + affectedAPIItem.getInterfaceName().length() - 1;
                if (!this.checkRegion(startIndex) || !this.checkPreChar(startIndex) || !this.checkNextChar(endIndex) || !lineContent.contains(affectedAPIItem.getInterfaceName())) continue;
                result.add(new LineApiChangeInfo(this.filePath, lineIndex + 1, cppAPIChangeItem, affectedAPIItem));
            }
        }
        return this.removeLineApiChangeInfosWithDuplicateInterfaceName(result);
    }

    private List<LineApiChangeInfo> removeLineApiChangeInfosWithDuplicateInterfaceName(List<LineApiChangeInfo> lineApiChangeInfos) {
        HashSet<String> seenInterfaceNames = new HashSet<String>();
        ArrayList<LineApiChangeInfo> uniqueLineApiChangeInfos = new ArrayList<LineApiChangeInfo>();
        for (LineApiChangeInfo lineApiChangeInfo : lineApiChangeInfos) {
            String interfaceName = lineApiChangeInfo.getAffectedApiItem().getInterfaceName();
            if (seenInterfaceNames.contains(interfaceName)) continue;
            seenInterfaceNames.add(interfaceName);
            uniqueLineApiChangeInfos.add(lineApiChangeInfo);
        }
        return uniqueLineApiChangeInfos;
    }

    public List<LineApiChangeInfo> scanSingleCppFileByGrep() {
        ArrayList<LineApiChangeInfo> result = new ArrayList<LineApiChangeInfo>();
        if (this.filePath == null) {
            LOGGER.warn("filePath is null.");
            return result;
        }
        for (int lineIndex = 0; lineIndex < this.lines.length; ++lineIndex) {
            result.addAll(this.getMatchedLineApiChangeInfos(lineIndex));
        }
        return result;
    }

    private static interface StateHandler {
        public Pair<CodeState, Integer> handle(int var1);
    }

    private class CodeHandler
    implements StateHandler {
        private CodeHandler() {
        }

        @Override
        public Pair<CodeState, Integer> handle(int index) {
            char currentChar = CppCodeScanner.this.sourceCode.charAt(index);
            if (currentChar == '\"') {
                CppCodeScanner.this.indexToType[index] = RegionType.STRING;
                return new Pair((Object)CodeState.STRING, (Object)(index + 1));
            }
            if (currentChar == '/' && index + 1 < CppCodeScanner.this.sourceCode.length()) {
                char nextChar = CppCodeScanner.this.sourceCode.charAt(index + 1);
                if (nextChar == '/') {
                    CppCodeScanner.this.indexToType[index] = RegionType.COMMENT;
                    return new Pair((Object)CodeState.SINGLE_LINE_COMMENT, (Object)(index + 2));
                }
                if (nextChar == '*') {
                    return new Pair((Object)CodeState.MULTI_LINE_COMMENT, (Object)(index + 2));
                }
            }
            CppCodeScanner.this.indexToType[index] = RegionType.CODE;
            return new Pair((Object)CodeState.CODE, (Object)(index + 1));
        }
    }

    private class LineCommentHandler
    implements StateHandler {
        private LineCommentHandler() {
        }

        @Override
        public Pair<CodeState, Integer> handle(int index) {
            char c = CppCodeScanner.this.sourceCode.charAt(index);
            int lineIndex = CppCodeScanner.this.getLineNumberFromIndex(index);
            int lineEndIndex = CppCodeScanner.this.lines[lineIndex].endIndex;
            for (int i = index; i <= lineEndIndex; ++i) {
                CppCodeScanner.this.indexToType[i] = RegionType.COMMENT;
            }
            return new Pair((Object)CodeState.CODE, (Object)(lineEndIndex + 1));
        }
    }

    private class BlockCommentHandler
    implements StateHandler {
        private BlockCommentHandler() {
        }

        @Override
        public Pair<CodeState, Integer> handle(int index) {
            for (int currentIndex = index; currentIndex < CppCodeScanner.this.sourceCode.length(); ++currentIndex) {
                char nextChar;
                char currentChar = CppCodeScanner.this.sourceCode.charAt(currentIndex);
                CppCodeScanner.this.indexToType[currentIndex] = RegionType.COMMENT;
                if (currentChar != '*' || currentIndex + 1 >= CppCodeScanner.this.sourceCode.length() || (nextChar = CppCodeScanner.this.sourceCode.charAt(currentIndex + 1)) != '/') continue;
                CppCodeScanner.this.indexToType[currentIndex + 1] = RegionType.COMMENT;
                return new Pair((Object)CodeState.CODE, (Object)(currentIndex + 2));
            }
            LOGGER.warn("Block comment not closed");
            return null;
        }
    }

    private class StringHandler
    implements StateHandler {
        private boolean escape = false;

        private StringHandler() {
        }

        @Override
        public Pair<CodeState, Integer> handle(int index) {
            CppCodeScanner.this.indexToType[index] = RegionType.STRING;
            char c = CppCodeScanner.this.sourceCode.charAt(index);
            if (!this.escape && c == '\"') {
                return new Pair((Object)CodeState.CODE, (Object)(index + 1));
            }
            this.escape = !this.escape && c == '\\';
            return new Pair((Object)CodeState.STRING, (Object)(index + 1));
        }
    }

    private static enum RegionType {
        COMMENT,
        CODE,
        STRING;

    }

    private static enum CodeState {
        CODE,
        SINGLE_LINE_COMMENT,
        MULTI_LINE_COMMENT,
        STRING;

    }

    private record CodeLine(String content, int startIndex, int endIndex) {
    }
}

