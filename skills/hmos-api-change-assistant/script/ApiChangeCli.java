// BUILD: 20260806-1
import com.huawei.deveco.programanalysis.apiscan.ApiScanUtil;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiChangeItem;
import com.huawei.deveco.programanalysis.apiscan.bean.ApiDisplayItem;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 命令行入口: 直接调用 DevEco 已实现的 ApiScanUtil 接口,
 * 根据 startVersion/endVersion 输出 API 变更 + 受影响代码位置。
 *
 * 单文件跨平台实现 (macOS / Linux / Windows), 由 api-change-scan.sh / api-change-scan_windows.bat 包装执行。
 *
 * 输出列(固定 schema):
 *   ApiDefinition | Language | Changed in SDK Version | Affected Versions | CodeLocation | Guidance link
 */
public class ApiChangeCli {

    // DevEco Studio 根目录 (启动时由 detectDevDir() 解析)
    static String DEVECO;

    // 固定输出列
    static final String[] COLUMNS = {
            "ApiDefinition", "Language", "Changed in SDK Version", "Affected Versions", "CodeLocation", "Guidance link"
    };

    public static void main(String[] args) throws Exception {
        // 强制 stdout/stderr 为 UTF-8: Windows 中文系统默认 GBK(cp936) 会把中文与符号打印成乱码。
        // 配合 bat 的 chcp 65001 / JAVA_TOOL_OPTIONS, 以及 javac -encoding UTF-8 端到端消除乱码。
        try {
            System.setOut(new PrintStream(System.out, true, StandardCharsets.UTF_8));
            System.setErr(new PrintStream(System.err, true, StandardCharsets.UTF_8));
        } catch (Throwable ignore) {}

        // IntelliJ 运行时依赖的 system.path (ApiScanUtil 部分实现读取它), 指向 cwd 下独立目录避免污染
        String baseDir = System.getProperty("user.dir");
        System.setProperty("idea.system.path",
                baseDir + File.separator + ".deveco-api-change-cli" + File.separator + "system");

        Map<String, String> o = parseArgs(args);
        if (o.containsKey("list-versions")) { listVersions(); return; }
        if (o.containsKey("help") || args.length == 0) { usage(); return; }
        // --detect / --self-test / --merge 是纯本地文件操作, 不需要 DevEco
        if (o.containsKey("detect")) { runDetect(o); return; }
        if (o.containsKey("self-test")) { runSelfTest(); return; }
        if (o.containsKey("merge")) { runMergeMode(o); return; }

        DEVECO = detectDevDir();
        if (DEVECO == null) {
            System.err.println("ERROR: 无法检测到 DevEco Studio 安装目录。");
            System.err.println("请通过环境变量指定: DEVECO_HOME (macOS/Linux) 或 DEV_DIR / TOOL_HOME (Windows)。");
            System.exit(1);
        }

        // --compile 且未给 start: 独立编译完善模式, 读 out 目录已有 changeList.json (无需 start/end)
        if (o.containsKey("compile") && o.get("start") == null) { runCompileMode(o); return; }

        String project = o.get("project");
        String start = requireArg(o, "start");
        String end = requireArg(o, "end");
        String out = o.getOrDefault("out", "api-change-out");
        boolean noScan = o.containsKey("no-scan");
        // 编译默认随扫描执行 (有工程且未 --no-scan); --no-compile 可关停 (如先扫、agent 合并后再单独 --compile)
        boolean noCompile = o.containsKey("no-compile");

        // 版本归一化: 完整版本名原样返回; API Level 数字 / PowerShell 吞括号的前缀自动补全
        start = resolveVersionName(start);
        end = resolveVersionName(end);
        // mac 权威逻辑: 严格 VERSION_LIST 校验
        validateVersion(start);
        validateVersion(end);

        Path outDir = Paths.get(out).toAbsolutePath();
        Files.createDirectories(outDir);

        // ---------- [1] 直接调用已实现接口取变更清单 ----------
        System.out.println("[1/2] ApiScanUtil.getAllApiChanges(" + start + " -> " + end + ") ...");
        List<ApiChangeItem> changes = ApiScanUtil.getAllApiChanges(start, end);
        if (changes == null || changes.isEmpty()) {
            System.out.println("      No API changes between " + start + " and " + end + ". Done.");
            return;
        }
        Path changeListJson = outDir.resolve("changeList.json");
        Files.writeString(changeListJson, JSON.toJSONString(changes), StandardCharsets.UTF_8);
        // 抽取 apiChange 原始数据 (与 changeList.json 同源, 供 agent 参照发现 ApiScanUtil 遗漏的变更)
        extractRawApiChanges(outDir, start, end);
        // 阶段 2 预过滤: apiChange 各版本原始变更的紧凑摘要 (agent 交叉比对用, 免读原始大文件)
        emitApiChangeSummary(outDir);

        System.out.println("      " + changes.size() + " change entries -> " + changeListJson);

        if (project == null || noScan) {
            System.out.println("\n[2/2] Skipped code-location scan"
                    + (project == null ? " (no --project)" : " (--no-scan)") + ".");
            // 仍输出变更清单到固定 schema (CodeLocation 留空)
            writeRows(outDir, buildRowsFromChanges(changes));
            return;
        }

        // ---------- [2] 代码位置 ----------
        scanLocations(project, changes, outDir, o);

        // ---------- [3] ArkTS 编译完善 (默认执行, --no-compile 关停) ----------
        if (!noCompile) {
            System.out.println("\n[compile] ArkTS 编译完善 (hvigor compileArkTS, 仅编译不打包) ...");
            try { compileStage(outDir, project, changes, o); }
            catch (Throwable t) {
                System.out.println("      编译阶段失败(已跳过, 不影响清单): " + t);
            }
        }
    }

    // =================== DevEco 目录 / Node 探测 ===================
    // 跨平台解析 DevEco 安装目录: 环境变量 -> 常见路径 -> 本类加载位置推导。
    // 每个候选都经 validateDevDir 归一化与校验:
    //   - macOS .app 包根 (以 .app 结尾且含 Contents/) 自动改用 .../Contents
    //   - 必须含 plugins/harmony/lib, 否则跳过尝试下一个
    // 这样即便 DEVECO_HOME 指向 .app 根目录或错误路径, 也不会再误判 (与 shell 包装脚本行为一致)。
    static String detectDevDir() {
        List<String> raw = new ArrayList<>();
        addEnvCandidate(raw, "DEVECO_HOME");
        addEnvCandidate(raw, "DEV_DIR");
        addEnvCandidate(raw, "TOOL_HOME");
        // DEVECO_SDK_HOME 形如 .../Contents/sdk -> 同时尝试其父目录 .../Contents
        String sdk = System.getenv("DEVECO_SDK_HOME");
        if (sdk != null && !sdk.isBlank()) {
            Path sp = Paths.get(sdk).toAbsolutePath().normalize();
            raw.add(sp.toString());
            Path par = sp.getParent();
            String fn = sp.getFileName() == null ? "" : sp.getFileName().toString();
            if (par != null && "sdk".equals(fn)) raw.add(par.toString());
        }
        raw.addAll(Arrays.asList(
                "/Applications/DevEco-Studio.app/Contents",
                "/Applications/DevEco-Studio.app",
                "D:\\DevEcoStudio",
                "D:\\DevEco Studio",
                "C:\\DevEcoStudio",
                "C:\\DevEco Studio",
                "C:\\Program Files\\Huawei\\DevEco Studio",
                "C:\\Program Files (x86)\\Huawei\\DevEco Studio",
                "D:\\Program Files\\Huawei\\DevEco Studio"));

        for (String c : raw) {
            String v = validateDevDir(c);
            if (v != null) return v;
        }
        // 从本类加载位置向上推导 (类随 DevEco jar 加载时有效)
        try {
            Path classDir = Paths.get(ApiChangeCli.class.getProtectionDomain()
                    .getCodeSource().getLocation().toURI()).getParent();
            Path cur = classDir;
            for (int i = 0; i < 6 && cur != null; i++) {
                String v = validateDevDir(cur.toString());
                if (v != null) return v;
                cur = cur.getParent();
            }
        } catch (Exception ignore) {}
        return null;
    }

    static void addEnvCandidate(List<String> raw, String name) {
        String v = System.getenv(name);
        if (v != null && !v.isBlank()) raw.add(v);
    }

    // 归一化 (.app 包根 -> .app/Contents) 并校验 (含 plugins/harmony/lib)。可用返回绝对路径, 否则 null。
    static String validateDevDir(String candidate) {
        if (candidate == null || candidate.isBlank()) return null;
        try {
            Path p = Paths.get(candidate).toAbsolutePath().normalize();
            String name = p.getFileName() == null ? "" : p.getFileName().toString();
            if (name.endsWith(".app") && Files.isDirectory(p.resolve("Contents"))) {
                p = p.resolve("Contents").normalize();
            }
            if (Files.isDirectory(p.resolve("plugins/harmony/lib"))) {
                return p.toString();
            }
        } catch (Exception ignore) {}
        return null;
    }

    // 跨平台 node 可执行文件: macOS/Linux = tools/node/bin/node; Windows = tools/node[/bin]/node.exe
    static String findNodeExe(String deveco) {
        Path root = Paths.get(deveco);
        String[] cands;
        if (System.getProperty("os.name", "").toLowerCase(Locale.ROOT).contains("win")) {
            cands = new String[]{"tools/node/node.exe", "tools/node/bin/node.exe"};
        } else {
            cands = new String[]{"tools/node/bin/node", "tools/node/node"};
        }
        for (String c : cands) {
            Path p = root.resolve(c);
            if (Files.isExecutable(p)) return p.toString();
        }
        return root.resolve(cands[0]).toString();
    }

    // =================== 工程类型识别与 ArkTS 扫描根 ===================
    // 三种目标库根目录结构不同, 决定 ArkTS 源码实际存放位置:
    //   鸿蒙原生工程(HAP/HSP/HAR)  根有 build-profile.json5       ArkTS = 各模块 src/main/ets
    //   Flutter 插件               根有 pubspec.yaml + ohos/      ArkTS = ohos/(含 src/main/ets + 根 Index.ets)
    //   RN 插件                    根有 package.json + harmony/   ArkTS = harmony/<模块>/src/main/ets
    // 另有 NATIVE_MODULE: 传入路径本身就是独立库/模块目录(有 oh-package.json5)。
    enum ProjectType { NATIVE_PROJECT, FLUTTER_PLUGIN, RN_PLUGIN, NATIVE_MODULE, UNKNOWN }

    // 按序判定: 原生工程在根有 build-profile.json5; Flutter/RN 的该文件分别藏在 ohos/、harmony/<模块>/ 下
    static ProjectType detectProjectType(Path root) {
        if (Files.isRegularFile(root.resolve("build-profile.json5"))) return ProjectType.NATIVE_PROJECT;
        if (Files.isRegularFile(root.resolve("pubspec.yaml")) && Files.isDirectory(root.resolve("ohos")))
            return ProjectType.FLUTTER_PLUGIN;
        if (Files.isRegularFile(root.resolve("package.json")) && Files.isDirectory(root.resolve("harmony")))
            return ProjectType.RN_PLUGIN;
        if (Files.isRegularFile(root.resolve("oh-package.json5"))) return ProjectType.NATIVE_MODULE;
        return ProjectType.UNKNOWN;
    }

    // 计算应扫描的 ArkTS 根目录列表。
    // NATIVE_PROJECT / UNKNOWN 返回空列表 -> 调用方走现有 root-first / 全根扫描。
    static List<Path> computeScanTargets(Path root, ProjectType type) {
        List<Path> targets = new ArrayList<>();
        try {
            switch (type) {
                case FLUTTER_PLUGIN: {
                    Path ohos = root.resolve("ohos");
                    if (Files.isDirectory(ohos)) targets.add(ohos);
                    break;
                }
                case RN_PLUGIN: {
                    Path harmony = root.resolve("harmony");
                    if (Files.isDirectory(harmony)) {
                        try (java.util.stream.Stream<Path> s = Files.list(harmony)) {
                            s.filter(Files::isDirectory).forEach(d -> {
                                if (Files.isRegularFile(d.resolve("oh-package.json5"))
                                        || Files.isRegularFile(d.resolve("build-profile.json5"))) {
                                    targets.add(d);
                                }
                            });
                        }
                    }
                    targets.sort(null); // 稳定顺序, 便于 --detect 展示与 CSV 合并
                    break;
                }
                case NATIVE_MODULE:
                    targets.add(root);
                    break;
                default:
                    break; // NATIVE_PROJECT / UNKNOWN: 不收窄
            }
        } catch (Exception ignore) {}
        return targets;
    }

    // 类型识别入口: --type 手动覆盖 -> 否则自动识别
    static ProjectType resolveProjectType(Map<String, String> o, Path root) {
        String forced = o.get("type");
        if (forced != null && !forced.isBlank()) {
            switch (forced.toLowerCase(Locale.ROOT)) {
                case "native-project": return ProjectType.NATIVE_PROJECT;
                case "flutter": return ProjectType.FLUTTER_PLUGIN;
                case "rn": return ProjectType.RN_PLUGIN;
                case "native-module": return ProjectType.NATIVE_MODULE;
                case "unknown": return ProjectType.UNKNOWN;
                default:
                    System.err.println("ERROR: 非法 --type '" + forced
                            + "', 合法: native-project | flutter | rn | native-module | unknown");
                    System.exit(2);
            }
        }
        return detectProjectType(root);
    }

    static String typeLabel(ProjectType t) {
        switch (t) {
            case NATIVE_PROJECT: return "鸿蒙原生工程 (HAP/HSP/HAR)";
            case FLUTTER_PLUGIN: return "Flutter 插件 (ohos/)";
            case RN_PLUGIN: return "RN 插件 (harmony/)";
            case NATIVE_MODULE: return "独立原生库/模块";
            default: return "未知 (回退全根扫描)";
        }
    }

    // --detect: 只打印识别结果, 不扫描
    static void runDetect(Map<String, String> o) {
        String project = o.get("project");
        if (project == null) {
            System.err.println("ERROR: --detect 需要 --project <工程路径>。");
            System.exit(2);
        }
        Path root = Paths.get(project).toAbsolutePath().normalize();
        if (!Files.isDirectory(root)) { System.err.println("ERROR: 目录不存在: " + root); System.exit(2); }
        ProjectType type = resolveProjectType(o, root);
        List<Path> targets = computeScanTargets(root, type);
        System.out.println("工程路径: " + root);
        System.out.println("工程类型: " + typeLabel(type) + "  (" + type + ")");
        if (targets.isEmpty()) {
            System.out.println("扫描根  : (未收窄, 按现有 root-first / 全根流程扫描)");
        } else {
            System.out.println("扫描根  :");
            for (Path t : targets) System.out.println("  - " + t);
        }
    }

    // --self-test: 用临时 fixture 校验类型识别与扫描根计算 (纯文件系统, 无需 DevEco)
    static void runSelfTest() throws Exception {
        System.out.println("类型识别自检 (detectProjectType + computeScanTargets):");
        Path base = Files.createTempDirectory("api-change-detect-test-");
        int failed = 0;
        try {
            // NATIVE_PROJECT: 根有 build-profile.json5
            Path nat = base.resolve("native");
            Files.createDirectories(nat);
            Files.writeString(nat.resolve("build-profile.json5"), "{}", StandardCharsets.UTF_8);
            failed += expectSelfTest("NATIVE_PROJECT", nat, ProjectType.NATIVE_PROJECT, 0);

            // FLUTTER_PLUGIN: pubspec.yaml + ohos/
            Path fl = base.resolve("flutter");
            Files.createDirectories(fl.resolve("ohos"));
            Files.writeString(fl.resolve("pubspec.yaml"), "name: x", StandardCharsets.UTF_8);
            failed += expectSelfTest("FLUTTER_PLUGIN", fl, ProjectType.FLUTTER_PLUGIN, 1);

            // RN_PLUGIN: package.json + harmony/ 下两个模块 -> 2 个扫描根
            Path rn = base.resolve("rn");
            Files.createDirectories(rn.resolve("harmony/m1"));
            Files.createDirectories(rn.resolve("harmony/m2"));
            Files.writeString(rn.resolve("package.json"), "{}", StandardCharsets.UTF_8);
            Files.writeString(rn.resolve("harmony/m1/oh-package.json5"), "{}", StandardCharsets.UTF_8);
            Files.writeString(rn.resolve("harmony/m2/build-profile.json5"), "{}", StandardCharsets.UTF_8);
            failed += expectSelfTest("RN_PLUGIN", rn, ProjectType.RN_PLUGIN, 2);

            // NATIVE_MODULE: 独立模块目录
            Path nm = base.resolve("module");
            Files.createDirectories(nm);
            Files.writeString(nm.resolve("oh-package.json5"), "{}", StandardCharsets.UTF_8);
            failed += expectSelfTest("NATIVE_MODULE", nm, ProjectType.NATIVE_MODULE, 1);

            // UNKNOWN: 空目录
            Path unk = base.resolve("unknown");
            Files.createDirectories(unk);
            failed += expectSelfTest("UNKNOWN", unk, ProjectType.UNKNOWN, 0);
        } finally {
            deleteRecursive(base);
        }
        System.out.println(failed == 0 ? "\nOK: 全部 5 项类型识别通过" : "\nFAILED: " + failed + " 项未通过");
        if (failed > 0) System.exit(1);
    }

    static int expectSelfTest(String name, Path root, ProjectType wantType, int wantTargets) {
        ProjectType got = detectProjectType(root);
        List<Path> targets = computeScanTargets(root, got);
        boolean ok = got == wantType && targets.size() == wantTargets;
        System.out.printf("  %-16s 类型=%-15s 根数=%d  => %s%n",
                name, got, targets.size(), ok ? "PASS" : "FAIL (期望 " + wantType + ", " + wantTargets + " 根)");
        return ok ? 0 : 1;
    }

    static void deleteRecursive(Path dir) {
        if (dir == null || !Files.exists(dir)) return;
        try (java.util.stream.Stream<Path> s = Files.walk(dir)) {
            s.sorted(java.util.Comparator.reverseOrder()).forEach(p -> {
                try { Files.deleteIfExists(p); } catch (Exception ignore) {}
            });
        } catch (Exception ignore) {}
    }

    // 目标扫描 (Flutter/RN/独立模块): 逐 ArkTS 根扫描, 合并所有成功目标的命中
    static List<JSONObject> scanTargets(List<Path> targets, String node, String indexJs,
                                        String ohosSdk, String hmsSdk, Path changeListJson,
                                        Path scanOut, Path logPath,
                                        Map<String, ApiChangeItem> changeMap, Map<String, String> guidance) {
        List<JSONObject> rows = new ArrayList<>();
        for (Path t : targets) {
            String csv = null;
            try {
                csv = runOneTarget(t, node, indexJs, ohosSdk, hmsSdk, changeListJson, scanOut, logPath);
            } catch (Throwable t2) {
                System.out.println("      Node 扫描器启动失败 (" + t2.getClass().getSimpleName()
                        + ": " + t2.getMessage() + "), 该目标改 grep 兜底。");
            }
            if (csv == null || csv.isBlank()) continue;
            try {
                rows.addAll(convertCsvToRows(csv, t, changeMap, guidance));
                System.out.println("      (via DevEco Node 扫描器, 扫描目标: " + t + ")");
            } catch (Throwable t2) {
                System.out.println("      " + t.getFileName() + " 的 getApiChangeResult 不可用, 改 grep 兜底: " + t2);
            }
        }
        return rows;
    }

    // 现有流程 (NATIVE_PROJECT / UNKNOWN): 根优先扫描, 根失败逐模块兜底
    static List<JSONObject> scanProjectRoot(Path root, List<String> moduleSrcs, String node, String indexJs,
                                            String ohosSdk, String hmsSdk, Path changeListJson,
                                            Path scanOut, Path logPath,
                                            Map<String, ApiChangeItem> changeMap, Map<String, String> guidance) throws Exception {
        String csv = null;
        try {
            csv = runOneTarget(root, node, indexJs, ohosSdk, hmsSdk, changeListJson, scanOut, logPath);
            if (csv == null) {
                for (String m : moduleSrcs) {
                    Path mp = root.resolve(m).toAbsolutePath().normalize();
                    if (!Files.isDirectory(mp)) continue;
                    csv = runOneTarget(mp, node, indexJs, ohosSdk, hmsSdk, changeListJson, scanOut, logPath);
                    if (csv != null) break;
                }
            }
        } catch (Throwable t) {
            System.out.println("      Node 扫描器启动失败 (" + t.getClass().getSimpleName()
                    + ": " + t.getMessage() + "), 改用 grep 回退。");
            csv = null;
        }
        if (csv == null) return null;
        List<JSONObject> rows = convertCsvToRows(csv, root, changeMap, guidance);
        System.out.println("      (via DevEco Node 扫描器 + ApiScanUtil.getApiChangeResult, 扫描目标: " + root.getFileName() + ")");
        return rows;
    }

    // Node 扫描器 CSV -> 展示行 (相对路径按扫描目标换算绝对路径)
    static List<JSONObject> convertCsvToRows(String csv, Path scanned,
                                             Map<String, ApiChangeItem> changeMap, Map<String, String> guidance) throws Exception {
        List<ApiDisplayItem> raw = ApiScanUtil.getApiChangeResult(csv, changeMap);
        List<JSONObject> rows = new ArrayList<>();
        if (raw != null) for (ApiDisplayItem d : raw) {
            JSONObject dj = (JSONObject) JSON.toJSON(d);
            rows.add(row(dj.getString("apiDefinition"), dj.getString("language"),
                    dj.getString("sdkVersion"), dj.getString("affectedVersions"),
                    absolutify(str(dj.get("absolutePath"), dj.get("location")), scanned),
                    str(dj.get("tutoringUrl"), guidance.get(dj.getString("changeId")))));
        }
        return rows;
    }

    // =================== 版本列表 ===================
    static void listVersions() {
        System.out.println("ApiScanUtil.VERSION_LIST (合法的 --start / --end 取值):");
        int i = 0;
        for (String v : ApiScanUtil.VERSION_LIST) {
            System.out.printf("  [%2d] %-45s  (API Level %s)%n", i++, v, extractApiLevel(v));
        }
        System.out.println("\n版本串需完整匹配, 例如 HarmonyOS_5.1.0(18)_Release / HarmonyOS_6.0.0(20)_Beta3。");
        System.out.println("也可直接用 API Level 数字, 如 --start 14 --end 26 (优先匹配 Release)。");
    }

    static void validateVersion(String v) {
        if (!ApiScanUtil.VERSION_LIST.contains(v)) {
            System.err.println("ERROR: 版本 '" + v + "' 不在 VERSION_LIST 中。合法取值:");
            listVersions();
            System.exit(2);
        }
    }

    // 归一化: 完整版本名原样返回; API Level 数字 / PowerShell 吞括号的前缀自动补全为完整版本名 (优先 Release)
    static String resolveVersionName(String input) {
        if (input == null || input.isBlank()) {
            throw new IllegalArgumentException("版本号不能为空");
        }
        if (input.contains("(") && input.contains(")")) return input;       // 已是完整版本名
        // 含 HarmonyOS_ 前缀但括号被吞: HarmonyOS_5.1.0 -> HarmonyOS_5.1.0(18)_Release
        if (input.contains("HarmonyOS_")) {
            List<String> cands = new ArrayList<>();
            for (String v : ApiScanUtil.VERSION_LIST) {
                if (v.startsWith(input)) cands.add(v);
            }
            if (cands.size() == 1) {
                System.out.println("  (auto-resolved: " + input + " -> " + cands.get(0) + ")");
                return cands.get(0);
            }
            if (cands.size() > 1) {
                // 多候选时优先唯一的 Release (保持便捷输入语义); 仍有歧义则列出候选并退出
                List<String> releases = new ArrayList<>();
                for (String v : cands) if (v.endsWith("_Release")) releases.add(v);
                if (releases.size() == 1) {
                    System.out.println("  (auto-resolved: " + input + " -> " + releases.get(0) + ")");
                    return releases.get(0);
                }
                System.err.println("ERROR: 版本前缀 '" + input + "' 命中多个候选, 请补全版本串:");
                for (String v : cands) System.err.println("  - " + v);
                System.exit(2);
            }
        }
        // 纯 API Level 数字 -> 含 (level) 的版本, 优先 Release
        for (String v : ApiScanUtil.VERSION_LIST) {
            if (v.contains("(" + input + ")") && v.endsWith("_Release")) return v;
        }
        for (String v : ApiScanUtil.VERSION_LIST) {
            if (v.contains("(" + input + ")")) return v;
        }
        throw new IllegalArgumentException("未知版本: " + input + "\n请使用 --list-versions 查看可用版本");
    }

    static String extractApiLevel(String versionName) {
        int s = versionName.indexOf('('), e = versionName.indexOf(')');
        return (s >= 0 && e > s) ? versionName.substring(s + 1, e) : versionName;
    }

    // =================== Row 构造 ===================
    static JSONObject row(String apiDef, String lang, String sdkVer, String affVer, String codeLoc, String guidance) {
        JSONObject r = new JSONObject();
        r.put(COLUMNS[0], apiDef == null ? "" : apiDef);
        r.put(COLUMNS[1], lang == null ? "" : lang);
        r.put(COLUMNS[2], sdkVer == null ? "" : sdkVer);
        r.put(COLUMNS[3], affVer == null ? "" : affVer);
        r.put(COLUMNS[4], codeLoc == null ? "" : codeLoc);
        r.put(COLUMNS[5], guidance == null ? "" : guidance);
        return r;
    }

    // changeId -> Guidance link (直接调 ApiScanUtil.getDocumentUrl)
    @SuppressWarnings("unchecked")
    static Map<String, String> buildGuidanceMap(List<ApiChangeItem> changes) {
        Map<String, String> m = new LinkedHashMap<>();
        for (ApiChangeItem c : changes) {
            JSONObject jo = (JSONObject) JSON.toJSON(c);
            JSONObject ic = jo.getJSONObject("interfaceChanges");
            String cid = (ic != null && ic.getString("id") != null) ? ic.getString("id") : "";
            String url = "";
            try { url = ApiScanUtil.getDocumentUrl(c); } catch (Throwable ignore) {}
            if (!cid.isEmpty()) m.putIfAbsent(cid, url);
        }
        return m;
    }

    // 从 interfaceChanges + affectedApi 派生字段
    static String sdkVersionOf(JSONObject ic) { return ic == null ? "" : str(ic.get("sdkVersion"), ic.get("apiVersion")); }
    static String affectedVersionsOf(JSONObject ic) {
        if (ic == null) return "";
        String eff = ic.getString("apiEffectiveVersion");
        return "NOT_ISOLATED".equals(eff) ? "ALL" : str(ic.get("apiVersion"));
    }

    static String str(Object... vals) {
        for (Object v : vals) { if (v != null && !v.toString().isEmpty() && !"null".equals(v.toString())) return v.toString(); }
        return "";
    }

    // 变更清单 -> Row (无代码位置时 CodeLocation 为空)
    @SuppressWarnings("unchecked")
    static List<JSONObject> buildRowsFromChanges(List<ApiChangeItem> changes) {
        List<JSONObject> rows = new ArrayList<>();
        for (ApiChangeItem c : changes) {
            JSONObject jo = (JSONObject) JSON.toJSON(c);
            JSONObject ic = jo.getJSONObject("interfaceChanges");
            JSONArray apis = jo.getJSONArray("affectedApis");
            String sdk = sdkVersionOf(ic);
            String aff = affectedVersionsOf(ic);
            String guidance = "";
            try { guidance = ApiScanUtil.getDocumentUrl(c); } catch (Throwable ignore) {}
            if (apis != null && !apis.isEmpty()) {
                for (Object o : apis) {
                    JSONObject a = (JSONObject) o;
                    rows.add(row(str(a.get("methodDefinition"), qualifiedName(a)),
                            a.getString("implementLanguage"), sdk, aff, "", guidance));
                }
            } else {
                rows.add(row(ic == null ? "" : ic.getString("changeTitle"), "", sdk, aff, "", guidance));
            }
        }
        return rows;
    }

    static String qualifiedName(JSONObject a) {
        String pkg = a.getString("packageName");
        String iface = a.getString("interfaceName");
        if (pkg == null || pkg.isEmpty() || "null".equals(pkg)) return iface == null ? "" : iface;
        return pkg + "." + iface;
    }

    // =================== 代码位置扫描 ===================
    static void scanLocations(String project, List<ApiChangeItem> changes,
                              Path outDir, Map<String, String> o) throws Exception {
        String node = o.getOrDefault("node", findNodeExe(DEVECO));
        String indexJs = o.getOrDefault("scanner",
                Paths.get(DEVECO, "plugins", "harmony", "arkanalyzer-apiscan", "index.js").toString());
        String ohosSdk = o.getOrDefault("sdks-ohos",
                Paths.get(DEVECO, "sdk", "default", "openharmony", "ets").toString());
        String hmsSdk = o.getOrDefault("sdks-hms",
                Paths.get(DEVECO, "sdk", "default", "hms", "ets").toString());

        Path scanOut = outDir.resolve("scan");
        Files.createDirectories(scanOut);

        System.out.println("\n[2/2] 定位代码位置 ...");
        Path rootPath = Paths.get(project).toAbsolutePath().normalize();

        // 识别工程类型并计算应扫描的 ArkTS 根 (Flutter/RN/独立模块收窄; 原生工程/未知回退现有流程), --type 可覆盖
        ProjectType type = resolveProjectType(o, rootPath);
        List<Path> targets = computeScanTargets(rootPath, type);
        String typeMsg = typeLabel(type);
        if (!targets.isEmpty()) typeMsg += "  -> 扫描根: " + targets;
        System.out.println("      工程类型: " + typeMsg);

        List<String> moduleSrcs = readModuleSrcPaths(rootPath.toString());
        Map<String, String> guidance = buildGuidanceMap(changes);
        Map<String, ApiChangeItem> changeMap = buildChangeIdMap(changes);
        Path changeListJson = outDir.resolve("changeList.json");

        List<JSONObject> rows;
        if (!targets.isEmpty()) {
            // FLUTTER_PLUGIN / RN_PLUGIN / NATIVE_MODULE: 逐 ArkTS 根扫描并合并 (只扫库自身, 跳过 example/lib/src 等)
            rows = scanTargets(targets, node, indexJs, ohosSdk, hmsSdk,
                    changeListJson, scanOut, outDir.resolve("scan.log"), changeMap, guidance);
        } else {
            // NATIVE_PROJECT / UNKNOWN: 现有 root-first + 模块兜底
            rows = scanProjectRoot(rootPath, moduleSrcs, node, indexJs, ohosSdk, hmsSdk,
                    changeListJson, scanOut, outDir.resolve("scan.log"), changeMap, guidance);
        }

        // grep 兜底: 搜索根 = 计算出的 ArkTS 根 (收窄, 排除 RN src/ 等 JS 侧代码), 否则 project 根。
        // AST 扫描器对库模块 (无 project 级 build-profile) 或未 hvigor 同步的工程会返回空:
        // getAllFiles 拿不到源码 -> 空 CSV -> 0 命中。因此 AST 空结果时用 grep 兜底交叉校验,
        // 避免把 "没扫到" 误报成 "无受影响 API"。
        List<Path> grepRoots = targets.isEmpty()
                ? Collections.singletonList(rootPath) : targets;
        if (rows == null || rows.isEmpty()) {
            if (rows == null) {
                System.out.println("      Node 扫描器未产出(工程可能未 hvigor 同步), 回退 grep:");
                tailLog(outDir.resolve("scan.log"));
            } else {
                System.out.println("      AST 未命中 (工程可能为库模块或未 hvigor 同步), 用 grep 交叉校验:");
            }
            List<JSONObject> grepRows = new ArrayList<>();
            for (Path gr : grepRoots) grepRows.addAll(locateByGrep(gr, changes, guidance));
            rows = grepRows;
            System.out.println(rows.isEmpty()
                    ? "      grep 未命中任何变更 API 的引用。"
                    : "      grep 命中 " + rows.size() + " 处(近似)。");
        }

        int before = rows.size();
        rows = dedupRows(rows);
        if (rows.size() < before) System.out.println("      去重: " + before + " -> " + rows.size());

        // ISOLATED 变更与工程 targetSdkVersion 比对: 默认只在 relatedChanges.json 标注 notApplicable, 不删行
        // (--ignore-isolation-filter 关闭; 升级前预警场景下这些行恰恰是目标, 故不默认过滤)
        Set<String> naKeys = Collections.emptySet();
        if (!o.containsKey("ignore-isolation-filter")) naKeys = markIsolationNotApplicable(rootPath, rows, o);

        writeRows(outDir, rows);
        emitRelatedChanges(outDir, rows, naKeys, buildChangeMetaMap(changes), loadCuratedPrompts(outDir));
        System.out.println("\n输出: " + outDir.resolve("result.csv") + "  (列: "
                + String.join(", ", COLUMNS) + ")");
    }

    // ISOLATED 变更的 apiVersion 高于工程 targetSdkVersion 时对当前工程不生效 -> 返回这些变更组的 key 集合
    static Set<String> markIsolationNotApplicable(Path rootPath, List<JSONObject> rows, Map<String, String> o) {
        List<Path> roots = computeCompileRoots(rootPath, o);
        if (roots.isEmpty()) return Collections.emptySet();
        int target = parseIntSafe(productField(roots.get(0), "targetSdkVersion"));
        if (target <= 0) return Collections.emptySet();
        Set<String> keys = new LinkedHashSet<>();
        for (JSONObject r : rows) {
            int aff = parseIntSafe(r.getString("Affected Versions"));
            if (aff > target) keys.add(rowKeyOfChange(r));
        }
        if (!keys.isEmpty()) {
            System.out.println("      ISOLATED 过滤: " + keys.size() + " 组变更的 apiVersion 高于工程 targetSdkVersion="
                    + target + ", 已在 relatedChanges.json 标注 notApplicable (--ignore-isolation-filter 可关闭)。");
        }
        return keys;
    }

    // 变更身份 key (与 rowKeyOfChange 同序) -> {changeType, changeId}, 供 relatedChanges 组挂元数据
    @SuppressWarnings("unchecked")
    static Map<String, JSONObject> buildChangeMetaMap(List<ApiChangeItem> changes) {
        Map<String, JSONObject> m = new LinkedHashMap<>();
        for (ApiChangeItem c : changes) {
            JSONObject jo = (JSONObject) JSON.toJSON(c);
            JSONObject ic = jo.getJSONObject("interfaceChanges");
            if (ic == null) continue;
            String sdk = sdkVersionOf(ic);
            String aff = affectedVersionsOf(ic);
            String guidance = "";
            try { guidance = ApiScanUtil.getDocumentUrl(c); } catch (Throwable ignore) {}
            JSONObject meta = new JSONObject();
            meta.put("changeType", str(ic.get("changeType")));
            meta.put("changeId", str(ic.get("id")));
            JSONArray apis = jo.getJSONArray("affectedApis");
            if (apis != null && !apis.isEmpty()) {
                for (Object ao : apis) {
                    JSONObject a = (JSONObject) ao;
                    String key = String.join("\u0001", str(a.get("methodDefinition"), qualifiedName(a)),
                            str(a.get("implementLanguage")), sdk, aff, guidance);
                    m.putIfAbsent(key, meta);
                }
            } else {
                String key = String.join("\u0001", str(ic.get("changeTitle")), "", sdk, aff, guidance);
                m.putIfAbsent(key, meta);
            }
        }
        return m;
    }

    // 读 out/apiChangePrompts.json (人工策展的变更说明), 返回 changeId -> 摘要文本 (截断 500 字符)
    static Map<String, String> loadCuratedPrompts(Path outDir) {
        Map<String, String> m = new LinkedHashMap<>();
        Path p = outDir.resolve("apiChangePrompts.json");
        if (!Files.isRegularFile(p)) return m;
        try {
            String s = Files.readString(p, StandardCharsets.UTF_8).trim();
            if (s.startsWith("[")) {
                for (Object o : JSON.parseArray(s)) {
                    if (!(o instanceof JSONObject)) continue;
                    JSONObject j = (JSONObject) o;
                    String cid = str(j.get("changeId"), j.get("id"));
                    String text = str(j.get("description"));
                    String add = str(j.get("additionPrompt"));
                    if (!add.isEmpty()) text = text.isEmpty() ? add : text + "\n" + add;
                    if (!cid.isEmpty() && !text.isEmpty()) m.putIfAbsent(cid, truncate(text, 500));
                }
            } else if (s.startsWith("{")) {
                JSONObject j = JSON.parseObject(s);
                for (String k : j.keySet()) {
                    Object v = j.get(k);
                    String text = v instanceof String ? (String) v : JSON.toJSONString(v);
                    if (text != null && !text.isEmpty()) m.putIfAbsent(k, truncate(text, 500));
                }
            }
        } catch (Exception ignore) {}
        return m;
    }

    static Map<String, ApiChangeItem> buildChangeIdMap(List<ApiChangeItem> changes) {
        Map<String, ApiChangeItem> m = new LinkedHashMap<>();
        for (ApiChangeItem c : changes) {
            JSONObject jo = (JSONObject) JSON.toJSON(c);
            JSONObject ic = jo.getJSONObject("interfaceChanges");
            if (ic != null && ic.getString("id") != null) m.putIfAbsent(ic.getString("id"), c);
        }
        return m;
    }

    static String runOneTarget(Path target, String node, String indexJs,
                               String ohosSdk, String hmsSdk, Path changeListJson,
                               Path scanOut, Path logPath) throws Exception {
        Path cfg = scanOut.resolve("config-" + sanitize(target.getFileName().toString()) + ".json");
        String cfgJson = "{\"projectPath\":\"" + esc(target.toAbsolutePath().toString()) + "\","
                + "\"sdks\":[{\"name\":\"ohos\",\"path\":\"" + esc(ohosSdk) + "\"},"
                + "{\"name\":\"hms\",\"path\":\"" + esc(hmsSdk) + "\"}],"
                + "\"outPath\":\"" + esc(scanOut.toAbsolutePath().toString()) + "\"}";
        Files.writeString(cfg, cfgJson, StandardCharsets.UTF_8);

        // tmpPath: 扫描器写进度文件 processArkTs.txt 的可写目录(必须传, 否则 path.join(undefined) 崩溃)
        Path tmpDir = scanOut.resolve("tmp-" + sanitize(target.getFileName().toString()));
        Files.createDirectories(tmpDir);

        List<String> cmd = Arrays.asList(node, "--max_old_space_size=8192", indexJs,
                "--configPath=" + cfg, "--apiModifiedPath=" + changeListJson,
                "--batchSize=1000", "--logPath=" + logPath,
                "--tmpPath=" + tmpDir.toAbsolutePath());
        System.out.println("      >> Node 扫描: " + target);
        long t0 = System.currentTimeMillis();
        // CWD 必须是 index.js 所目录(工具目录), 否则 worker 线程找不到 ApiScan.worker.ts
        Process p = new ProcessBuilder(cmd)
                .directory(new File(new File(indexJs).getParent()))
                .redirectErrorStream(true).start();
        // 输出抽取放独立线程, 主线程用 waitFor(超时) 防扫描器挂死阻塞整个流程
        final StringBuilder out = new StringBuilder();
        final Process proc = p;
        Thread reader = new Thread(() -> {
            try (BufferedReader br = new BufferedReader(new InputStreamReader(proc.getInputStream(), StandardCharsets.UTF_8))) {
                String ln;
                while ((ln = br.readLine()) != null) {
                    synchronized (out) { out.append(ln).append('\n'); }
                }
            } catch (Exception ignore) {}
        });
        reader.setDaemon(true);
        reader.start();
        boolean exited = p.waitFor(15, TimeUnit.MINUTES);
        if (!exited) {
            killTree(p);
            System.out.println("         扫描超时(15分钟), 已强制结束该目标的扫描。");
        }
        reader.join(3000);
        int code = exited ? p.exitValue() : -2;
        if (code != 0) System.out.println("         扫描器退出码=" + code);

        // 扫描器产出文件名: <projectBasename>Api<timestamp>_<batch>.csv
        // 只接受本次运行(t0)之后产出的 CSV, 避免多模块连续扫描时选到上一个目标的旧产物
        String base = sanitize(target.getFileName().toString());
        Path csv = pickNewestCsv(scanOut, base + "Api", t0 - 1000);
        if (csv == null) csv = pickNewestCsv(scanOut, base, t0 - 1000);
        // 无前缀兜底仍限本次运行时间窗 (t0 之后), 避免多 target 连续扫描时错拿上一目标的旧产物
        if (csv == null) csv = pickNewestCsv(scanOut, null, t0 - 1000);
        if (csv != null && Files.size(csv) > 0) return Files.readString(csv, StandardCharsets.UTF_8);
        return null;
    }

    static Path pickNewestCsv(Path dir, String prefix, long minMtime) {
        File[] csvs = dir.toFile().listFiles((d, n) -> n.endsWith(".csv")
                && (prefix == null || n.startsWith(prefix)));
        if (csvs == null || csvs.length == 0) return null;
        Path newest = null; long mt = -1;
        for (File f : csvs) {
            if (f.length() == 0) continue;
            if (f.lastModified() < minMtime) continue;
            if (f.lastModified() > mt) { mt = f.lastModified(); newest = f.toPath(); }
        }
        return newest;
    }

    // =================== grep 回退定位 ===================
    @SuppressWarnings("unchecked")
    static List<JSONObject> locateByGrep(Path root, List<ApiChangeItem> changes,
                                         Map<String, String> guidance) throws Exception {
        // token(interfaceName) -> 元信息列表 (一个 API 名可能对应多个变更/多个 affectedApi)
        Map<String, List<JSONObject>> tokenMeta = new LinkedHashMap<>();
        for (ApiChangeItem c : changes) {
            JSONObject jo = (JSONObject) JSON.toJSON(c);
            JSONObject ic = jo.getJSONObject("interfaceChanges");
            String cid = (ic != null && ic.getString("id") != null) ? ic.getString("id") : "";
            String sdk = sdkVersionOf(ic);
            String aff = affectedVersionsOf(ic);
            JSONArray apis = jo.getJSONArray("affectedApis");
            if (apis == null) continue;
            String url = guidance.getOrDefault(cid, "");
            for (Object o : apis) {
                JSONObject a = (JSONObject) o;
                String token = a.getString("interfaceName");
                if (token == null || token.length() < 3 || "null".equals(token) || isStopword(token)) continue;
                JSONObject meta = new JSONObject();
                meta.put("apiDef", str(a.getString("methodDefinition"), qualifiedName(a)));
                meta.put("lang", str(a.getString("implementLanguage"), "typeScript"));
                meta.put("sdk", sdk);
                meta.put("aff", aff);
                meta.put("guidance", url);
                tokenMeta.computeIfAbsent(token, k -> new ArrayList<>()).add(meta);
            }
        }
        if (tokenMeta.isEmpty()) return new ArrayList<>();

        List<String> ordered = new ArrayList<>(tokenMeta.keySet());
        // token 分桶编译, 避免巨型 alternation 的编译/回退开销; 边界由 boundaryOk 手工判断
        // (\b 对含非单词字符的 token 会失效, 故不再使用)
        List<Pattern> pats = new ArrayList<>();
        for (int i = 0; i < ordered.size(); i += 200) {
            StringBuilder re = new StringBuilder();
            for (int j = i; j < Math.min(i + 200, ordered.size()); j++) {
                if (j > i) re.append('|');
                re.append(Pattern.quote(ordered.get(j)));
            }
            pats.add(Pattern.compile(re.toString()));
        }

        Set<String> skipDirs = new LinkedHashSet<>(Arrays.asList(
                "oh_modules", "node_modules", "build", ".preview", ".cxx", ".git", ".hvigor", ".test"));
        // 只扫 ArkTS/TS 源文件 (.d.ets/.d.ts 分别以 .ets/.ts 结尾); 不扫 JS/C++/Native 与构建产物
        Set<String> exts = new LinkedHashSet<>(Arrays.asList(".ets", ".ts"));
        List<Path> files = new ArrayList<>();
        try (java.util.stream.Stream<Path> walk = Files.walk(root)) {
            walk.filter(Files::isRegularFile).forEach(p -> {
                for (Path seg : root.relativize(p)) if (skipDirs.contains(seg.toString())) return;
                String name = p.getFileName().toString();
                for (String e : exts) if (name.endsWith(e)) { files.add(p); break; }
            });
        }
        System.out.println("      grep: " + files.size() + " 个源码文件, " + ordered.size() + " 个 API 关键词");

        List<JSONObject> rows = new ArrayList<>();
        int perTokenCap = 30, totalCap = 1000;
        Map<String, Integer> counts = new LinkedHashMap<>();
        outer:
        for (Path f : files) {
            List<String> lines;
            try { lines = Files.readAllLines(f, StandardCharsets.UTF_8); } catch (Exception ignore) { continue; }
            boolean[] inBlock = new boolean[1];   // 跨行的块注释状态, 每个文件重置
            for (int li = 0; li < lines.size(); li++) {
                // 剥离注释与字符串字面量 (掩码为空格, 保持列位不变), 从源头减少注释/字符串误报
                String line = maskLine(lines.get(li), inBlock);
                for (Pattern pat : pats) {
                    Matcher m = pat.matcher(line);
                    while (m.find()) {
                        String tok = m.group();
                        int ms = m.start(), me = m.end();
                        if (!boundaryOk(line, ms, me)) continue;
                        // 仅保留调用站点 (后跟 '(') 或成员访问站点 (前缀 '.'),
                        // 过滤 let/const/var token = ... 这类同名变量声明造成的误报
                        boolean isCall = CALL_SUFFIX.matcher(line.substring(me)).matches();
                        boolean isAccess = ms > 0 && line.charAt(ms - 1) == '.';
                        if (!isCall && !isAccess) continue;
                        int n = counts.getOrDefault(tok, 0);
                        if (n >= perTokenCap) continue;
                        String codeLoc = f + ":" + (li + 1);
                        for (JSONObject meta : tokenMeta.get(tok)) {
                            if (rows.size() >= totalCap) break outer;
                            rows.add(row(meta.getString("apiDef"), meta.getString("lang"),
                                    meta.getString("sdk"), meta.getString("aff"), codeLoc, meta.getString("guidance")));
                        }
                        counts.put(tok, n + 1);
                    }
                }
            }
        }
        return rows;
    }

    static final Pattern CALL_SUFFIX = Pattern.compile("\\s*\\(.*");

    // 边界判断: 匹配位前后不是标识符字符 (字母/数字/_/$) 即视为 token 边界
    static boolean boundaryOk(String s, int start, int end) {
        if (start > 0 && isIdentChar(s.charAt(start - 1))) return false;
        if (end < s.length() && isIdentChar(s.charAt(end))) return false;
        return true;
    }

    static boolean isIdentChar(char c) { return Character.isLetterOrDigit(c) || c == '_' || c == '$'; }

    // 把注释与字符串字面量内容掩码为空格 (列位保持不变): 支持 // 行注释、跨行 /* */ 块注释、
    // 双引号/单引号/模板字符串, 全程转义感知。inBlock[0] 为跨行的块注释状态。
    static String maskLine(String line, boolean[] inBlock) {
        char[] ch = line.toCharArray();
        char str = 0;
        for (int i = 0; i < ch.length; i++) {
            char c = ch[i], n = i + 1 < ch.length ? ch[i + 1] : '\0';
            if (inBlock[0]) {
                if (c == '*' && n == '/') { ch[i] = ' '; ch[i + 1] = ' '; i++; inBlock[0] = false; }
                else ch[i] = ' ';
                continue;
            }
            if (str != 0) {
                if (c == '\\') { ch[i] = ' '; if (i + 1 < ch.length) { ch[i + 1] = ' '; i++; } continue; }
                ch[i] = ' ';
                if (c == str) str = 0;
                continue;
            }
            if (c == '/' && n == '/') { for (; i < ch.length; i++) ch[i] = ' '; break; }
            if (c == '/' && n == '*') { ch[i] = ' '; ch[i + 1] = ' '; i++; inBlock[0] = true; continue; }
            if (c == '"' || c == '\'' || c == '`') { str = c; ch[i] = ' '; }
        }
        return new String(ch);
    }

    // =================== apiChange 原始数据抽取 (供 agent 参照, 发现 ApiScanUtil 遗漏) ===================
    // ApiScanUtil 与 apiChange/*.json 位于同一 jar; 抽取 (start, end] 范围内各版本的原始变更数据到 out/apiChange/,
    // 供阶段 2 的 agent 与 changeList.json 交叉比对, 发现被合并/过滤遗漏的变更 (非 API 变更、空 affectedApis、跨版本去重项)。
    static void extractRawApiChanges(Path outDir, String start, String end) {
        try {
            Path jar = null;
            try {
                java.net.URI loc = ApiScanUtil.class.getProtectionDomain()
                        .getCodeSource().getLocation().toURI();
                if ("file".equals(loc.getScheme())) jar = Paths.get(loc);
            } catch (Exception ignore) {}
            if (jar == null || !Files.isRegularFile(jar)) {
                System.out.println("      未定位 apiChange 数据 jar, 跳过原始数据抽取。");
                return;
            }
            List<String> versions = new ArrayList<>();
            boolean inRange = false;
            for (String v : ApiScanUtil.VERSION_LIST) {
                if (v.equals(start)) { inRange = true; continue; }  // (start, end] 不含 start
                if (v.equals(end)) { versions.add(v); break; }       // 含 end
                if (inRange) versions.add(v);
            }
            if (versions.isEmpty()) return;
            Path rawDir = outDir.resolve("apiChange");
            Files.createDirectories(rawDir);
            int n = 0;
            try (java.util.zip.ZipFile zf = new java.util.zip.ZipFile(jar.toFile())) {
                for (String v : versions) {
                    java.util.zip.ZipEntry ze = zf.getEntry("apiChange/" + v + ".json");
                    if (ze == null) continue;
                    try (java.io.InputStream in = zf.getInputStream(ze)) {
                        String content = new String(in.readAllBytes(), StandardCharsets.UTF_8);
                        if (content.trim().length() < 5) continue;  // 跳过空 [] 占位文件
                        Files.writeString(rawDir.resolve(v + ".json"), content, StandardCharsets.UTF_8);
                        n++;
                    }
                }
                // 同时抽取人工策展的变更说明 (变更原因/影响/适配指导+示例代码), 供阶段 2 agent 判定
                try {
                    java.util.zip.ZipEntry pe = zf.getEntry("apiChangeDescription/apiChangePrompts.json");
                    if (pe != null) {
                        try (java.io.InputStream in = zf.getInputStream(pe)) {
                            String content = new String(in.readAllBytes(), StandardCharsets.UTF_8);
                            if (content.trim().length() > 5) {
                                Files.writeString(outDir.resolve("apiChangePrompts.json"), content, StandardCharsets.UTF_8);
                                System.out.println("      变更说明数据: apiChangePrompts.json -> " + outDir.resolve("apiChangePrompts.json"));
                            }
                        }
                    }
                } catch (Exception ignore) {}   // 老版本 DevEco 可能无此资源, 静默跳过
            }
            System.out.println("      apiChange 原始数据: " + n + " 个版本文件 -> " + rawDir);
        } catch (Exception e) {
            System.out.println("      抽取 apiChange 原始数据失败(不影响清单): " + e.getMessage());
        }
    }

    // =================== ArkTS 编译完善 (阶段 3) ===================
    // --compile 独立模式: 读 out 目录已有 changeList.json 做编译完善 (无需 start/end)
    static void runCompileMode(Map<String, String> o) {
        String project = o.get("project");
        if (project == null) {
            System.err.println("ERROR: --compile 需要 --project <工程路径>。");
            System.exit(2);
        }
        Path outDir = Paths.get(o.getOrDefault("out", "api-change-out")).toAbsolutePath();
        try {
            Path cl = outDir.resolve("changeList.json");
            if (!Files.isRegularFile(cl)) {
                System.err.println("ERROR: 缺少 " + cl + "，请先运行一次完整扫描生成变更清单。");
                System.exit(2);
            }
            List<ApiChangeItem> changes = JSON.parseArray(Files.readString(cl, StandardCharsets.UTF_8), ApiChangeItem.class);
            if (changes == null) changes = new ArrayList<>();
            System.out.println("[compile] ArkTS 编译完善 (变更清单: " + cl + ", " + changes.size() + " 条) ...");
            compileStage(outDir, project, changes, o);
        } catch (Exception e) {
            System.err.println("ERROR: 编译阶段失败: " + e.getMessage());
            System.exit(1);
        }
    }

    static class RunResult { int exit; String output; RunResult(int exit, String output) { this.exit = exit; this.output = output; } }

    static class CompileIssue {
        String raw, file, changeId, apiDefinition, language, sdkVersion, affectedVersions, guidance;
        int line, col;
        StringBuilder text = new StringBuilder();
    }

    // 编译工程根: 根 build-profile.json5 (原生工程/独立模块), Flutter 的 example/ohos (compile-guide §4.1, ohos/ 兜底),
    // RN 的 harmony/<模块> 各为独立 hvigor 工程
    static List<Path> computeCompileRoots(Path projectRoot, Map<String, String> o) {
        String override = o.get("compile-root");
        if (override != null && !override.isBlank()) {
            Path r = Paths.get(override).toAbsolutePath().normalize();
            if (Files.isDirectory(r)) return Collections.singletonList(r);
            System.err.println("ERROR: --compile-root 目录不存在: " + r);
            return Collections.emptyList();
        }
        List<Path> roots = new ArrayList<>();
        // Flutter 插件: 官方编译目录是 example/ohos (Flutter 命令内部会切到该鸿蒙工程), 优先编译它
        if (Files.isRegularFile(projectRoot.resolve("pubspec.yaml"))
                && Files.isDirectory(projectRoot.resolve("ohos"))) {
            Path exampleOhos = projectRoot.resolve("example").resolve("ohos");
            if (Files.isDirectory(exampleOhos) && Files.isRegularFile(exampleOhos.resolve("build-profile.json5"))) {
                roots.add(exampleOhos);
            }
        }
        if (Files.isRegularFile(projectRoot.resolve("build-profile.json5"))) roots.add(projectRoot);
        Path ohos = projectRoot.resolve("ohos");
        if (Files.isDirectory(ohos) && Files.isRegularFile(ohos.resolve("build-profile.json5"))) roots.add(ohos);
        Path harmony = projectRoot.resolve("harmony");
        if (Files.isDirectory(harmony)) {
            try (java.util.stream.Stream<Path> s = Files.list(harmony)) {
                s.filter(Files::isDirectory).forEach(d -> {
                    if (Files.isRegularFile(d.resolve("build-profile.json5"))) roots.add(d);
                });
            } catch (Exception ignore) {}
        }
        return roots;
    }

    // hvigorw: 默认 DevEco Studio 自带 hvigor (tools/hvigor/bin/hvigorw), 避免依赖工程 wrapper / 网络下载 hvigor;
    // 自带缺失时回退工程根 wrapper; --hvigorw 可显式覆盖
    static String findHvigorw(Map<String, String> o, Path projectRoot) {
        String override = o.get("hvigorw");
        if (override != null && !override.isBlank()) return override;
        boolean win = isWin();
        Path bundled = Paths.get(DEVECO, "tools", "hvigor", "bin", win ? "hvigorw.bat" : "hvigorw");
        if (Files.isRegularFile(bundled)) return bundled.toString();
        String[] names = win ? new String[]{"hvigorw.bat", "hvigorw"} : new String[]{"hvigorw", "hvigorw.bat"};
        for (String n : names) {
            Path p = projectRoot.resolve(n);
            if (Files.isRegularFile(p)) return p.toString();
        }
        return null;
    }

    static String findOhpm() {
        Path p = Paths.get(DEVECO, "tools", "ohpm", "bin", isWin() ? "ohpm.bat" : "ohpm");
        return Files.isRegularFile(p) ? p.toString() : null;
    }

    // python 解释器 (RN 编排 rn.py / rnohos.py 需要): 显式 --python 覆盖, 默认 "python"
    // (compile-guide §2: Windows 常用 python / py; 本机只有 py 时用 --python py 指定)
    static String pythonExe(Map<String, String> o) {
        String p = o.get("python");
        return (p != null && !p.isBlank()) ? p : "python";
    }

    // 定位 RN 构建编排脚本 (rn.py / rnohos.py): --rn-py 显式指定 > 工程根自带 > 从本工具目录向上搜 skill 工具目录。
    // RN 铁律 (compile-guide §5.1): RN 的 HAR/HAP 必须经 rn.py / rnohos.py 编排, 禁止裸跑 hvigorw。
    static String findRnScript(Map<String, String> o, Path projectRoot) {
        String override = o.get("rn-py");
        if (override != null && !override.isBlank()) {
            Path p = Paths.get(override).toAbsolutePath().normalize();
            if (Files.isRegularFile(p)) return p.toString();
            System.err.println("ERROR: --rn-py 指定的脚本不存在: " + p);
            return null;
        }
        if (detectProjectType(projectRoot) != ProjectType.RN_PLUGIN) return null;
        for (String n : new String[]{"rn.py", "rnohos.py"}) {
            Path p = projectRoot.resolve(n);
            if (Files.isRegularFile(p)) return p.toString();
        }
        // 工程外工具: compile-guide 附录 -> agent-rn/.claude/skills/tool-ohos-plugin-repo/tool/rn.py
        // 同仓库 (或本工具所在 skill 目录向上几级) 命中同名工具目录即可复用
        try {
            Path dir = Paths.get(ApiChangeCli.class.getProtectionDomain()
                    .getCodeSource().getLocation().toURI()).getParent();
            for (int i = 0; i < 8 && dir != null; i++) {
                for (String rel : new String[]{
                        ".claude/skills/tool-ohos-plugin-repo/tool/rn.py",
                        ".claude/skills/tool-ohos-plugin-repo/tool/rnohos.py"}) {
                    Path p = dir.resolve(rel);
                    if (Files.isRegularFile(p)) return p.toString();
                }
                dir = dir.getParent();
            }
        } catch (Exception ignore) {}
        return null;
    }

    // DevEco 自带工具子进程环境: node (hvigorw/ohpm 依赖) + SDK 根, 使离线构建可用
    static Map<String, String> devecoBuildEnv() {
        Map<String, String> env = new LinkedHashMap<>();
        Path nodeHome = Paths.get(DEVECO, "tools", "node");
        if (Files.isDirectory(nodeHome)) {
            env.put("NODE_HOME", nodeHome.toString());
            String path = System.getenv("PATH");
            env.put("PATH", nodeHome + (path == null || path.isEmpty() ? "" : File.pathSeparator + path));
        }
        Path sdk = Paths.get(DEVECO, "sdk");
        if (Files.isDirectory(sdk)) {
            env.put("DEVECO_SDK_HOME", sdk.toString());
            env.put("HOS_SDK_HOME", sdk.toString());
        }
        return env.isEmpty() ? null : env;
    }

    // 解析 build-profile.json5 (JSON5: 含 // 与 /* */ 注释、尾随逗号), 失败返回 null
    static JSONObject readBuildProfile(Path root) {
        Path bp = root.resolve("build-profile.json5");
        if (!Files.isReadable(bp)) return null;
        try {
            return JSON.parseObject(stripJson5(Files.readString(bp, StandardCharsets.UTF_8)));
        } catch (Exception ignore) { return null; }
    }

    // 去掉 JSON5 的 // 行注释 / /* */ 块注释 / 尾随逗号 (全程字符串字面量感知, 支持双引号与单引号, 不破坏字符串内容)
    static String stripJson5(String s) {
        StringBuilder sb = new StringBuilder(s.length());
        char quote = 0;   // 0=不在字符串中; 否则为当前字符串的引号字符 (" 或 ')
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i), n = i + 1 < s.length() ? s.charAt(i + 1) : '\0';
            if (quote != 0) {
                sb.append(c);
                if (c == '\\') { if (i + 1 < s.length()) { sb.append(s.charAt(i + 1)); i++; } }
                else if (c == quote) quote = 0;
                continue;
            }
            if (c == '"' || c == '\'') { quote = c; sb.append(c); continue; }
            if (c == '/' && n == '/') { while (i < s.length() && s.charAt(i) != '\n') i++; sb.append('\n'); continue; }
            if (c == '/' && n == '*') { i += 2; while (i + 1 < s.length() && !(s.charAt(i) == '*' && s.charAt(i + 1) == '/')) i++; i++; continue; }
            if (c == ',') {
                int j = i + 1;
                while (j < s.length() && (s.charAt(j) == ' ' || s.charAt(j) == '\t' || s.charAt(j) == '\n' || s.charAt(j) == '\r')) j++;
                if (j < s.length() && (s.charAt(j) == '}' || s.charAt(j) == ']')) { i = j - 1; continue; }
                sb.append(c);
                continue;
            }
            sb.append(c);
        }
        return sb.toString();
    }

    // build-profile.json5 的 modules 数组对象列表 (只取有 name 的模块对象)
    static List<JSONObject> readModuleObjs(Path compileRoot) {
        JSONObject bp = readBuildProfile(compileRoot);
        if (bp == null) return new ArrayList<>();
        JSONArray mods = bp.getJSONArray("modules");
        if (mods == null) return new ArrayList<>();
        List<JSONObject> out = new ArrayList<>();
        for (Object o : mods) {
            if (o instanceof JSONObject && ((JSONObject) o).getString("name") != null) out.add((JSONObject) o);
        }
        return out;
    }

    // 从 build-profile.json5 的 modules 数组提取模块名 (逐模块编译兜底用)。
    // 注意: 直接匹配所有 "name" 会把 app.products / buildModeSet / targets 里的 name 误当模块名
    // (如 "name": "default") -> 之前导致 module=default 这类假模块被尝试。这里只取 modules[].name。
    static List<String> readModuleNames(Path compileRoot) {
        List<String> names = new ArrayList<>();
        for (JSONObject m : readModuleObjs(compileRoot)) {
            String n = m.getString("name");
            if (n != null && !n.isBlank()) names.add(n);
        }
        if (!names.isEmpty()) return names;
        // 回退: JSON5 解析失败时, 用"同对象内须出现 srcPath"的正则, 排除 target/product/buildMode 的 name
        try {
            String s = Files.readString(compileRoot.resolve("build-profile.json5"), StandardCharsets.UTF_8);
            int idx = s.indexOf("\"modules\"");
            String sub = idx >= 0 ? s.substring(idx) : s;
            Matcher m = Pattern.compile("\"name\"\\s*:\\s*\"([^\"]+)\"(?=[^{}]*\"srcPath\"\\s*:\\s*\"[^\"]+\")").matcher(sub);
            while (m.find()) if (!names.contains(m.group(1))) names.add(m.group(1));
        } catch (Exception ignore) {}
        return names;
    }

    // build-profile.json5 products[0] 的某字段 (targetSdkVersion / compatibleSdkVersion), 供编译诊断
    static String productField(Path root, String field) {
        JSONObject bp = readBuildProfile(root);
        if (bp == null) return "";
        JSONObject app = bp.getJSONObject("app");
        if (app == null) return "";
        JSONArray prods = app.getJSONArray("products");
        if (prods == null || prods.isEmpty()) return "";
        Object p0 = prods.get(0);
        if (!(p0 instanceof JSONObject)) return "";
        return str(((JSONObject) p0).get(field));
    }

    // hvigor-config.json5 的 modelVersion, 供编译诊断
    static String readModelVersion(Path root) {
        Path hc = root.resolve("hvigor").resolve("hvigor-config.json5");
        if (!Files.isReadable(hc)) return "";
        try {
            JSONObject o = JSON.parseObject(stripJson5(Files.readString(hc, StandardCharsets.UTF_8)));
            return o != null ? str(o.get("modelVersion")) : "";
        } catch (Exception ignore) { return ""; }
    }

    // 本机已安装 SDK 概览 (sdk/<pkg>/sdk-pkg.json 的 displayName + apiVersion), 供编译诊断
    static String describeInstalledSdks(Path deveco) {
        Path sdkRoot = deveco.resolve("sdk");
        if (!Files.isDirectory(sdkRoot)) return "";
        StringBuilder sb = new StringBuilder();
        try (java.util.stream.Stream<Path> s = Files.list(sdkRoot)) {
            s.filter(Files::isDirectory).sorted().forEach(p -> {
                Path pk = p.resolve("sdk-pkg.json");
                if (!Files.isReadable(pk)) return;
                try {
                    JSONObject d = JSON.parseObject(Files.readString(pk, StandardCharsets.UTF_8));
                    JSONObject data = d != null ? d.getJSONObject("data") : null;
                    if (data != null) {
                        if (sb.length() > 0) sb.append(", ");
                        sb.append(str(data.get("displayName"))).append(" (API ").append(str(data.get("apiVersion"))).append(')');
                    }
                } catch (Exception ignore) {}
            });
        } catch (Exception ignore) {}
        return sb.toString();
    }

    static void compileStage(Path outDir, String project, List<ApiChangeItem> changes, Map<String, String> o) throws Exception {
        Path rootPath = Paths.get(project).toAbsolutePath().normalize();
        List<Path> roots = computeCompileRoots(rootPath, o);
        List<String> rootStrs = new ArrayList<>();
        for (Path r : roots) rootStrs.add(r.toString());
        String ohpm = findOhpm();
        Map<String, String> buildEnv = devecoBuildEnv();
        StringBuilder allLog = new StringBuilder();
        boolean anyFailed = false;
        boolean anyTimeout = false;   // 任一进程超时 (exit=-2), 写入 compile.md 状态
        String compileDiag = null;   // 工具链不兼容诊断 (fail-fast), 非空时写入 compile.md 状态

        // RN 插件铁律 (compile-guide §5.1): RN 的 HAR/HAP 必须经 rn.py / rnohos.py 编排, 禁止裸跑 hvigorw。
        // 定位到 rn 脚本时整段改用 rn.py build har (内部: 复制源码到 .rn-build/har_wrapper -> ohpm install
        // -> hvigorw assembleHar, 覆盖库全部 harmony 模块), 不进入下方裸 hvigorw 循环;
        // 未定位则降级为 compileArkTS 类型检查并给出提示, 不产出 HAR/HAP。
        if (detectProjectType(rootPath) == ProjectType.RN_PLUGIN) {
            String rnPy = findRnScript(o, rootPath);
            if (rnPy != null) {
                System.out.println("      RN 插件: 经 rn.py 编排编译 (compile-guide §5.1): " + rnPy);
                // 超时 20 分钟 >= compile-guide §5.6 要求 (RN build 3-5 分钟, timeout 至少给 600000ms)
                RunResult rr = runProcess(Arrays.asList(pythonExe(o), rnPy, "build", "har",
                        "--plugin-root", rootPath.toString()), rootPath, buildEnv, 20);
                allLog.append("===== rn.py build har @ ").append(rootPath)
                      .append(" (exit=").append(rr.exit).append(") =====\n").append(rr.output).append('\n');
                if (rr.exit == -2) {
                    anyFailed = true;
                    anyTimeout = true;
                    System.out.println("      ⚠ rn.py build har 超时(20分钟), 已强制结束 (不阻断清单)。");
                } else if (rr.exit != 0) {
                    anyFailed = true;
                    System.out.println("      ⚠ rn.py build har 失败 (exit=" + rr.exit + "), 详见 compile.log。");
                } else {
                    System.out.println("      rn.py build har 通过 (exit=0)。");
                }
                finishCompile(outDir, changes, allLog.toString(), anyFailed, compileDiag, anyTimeout, rootStrs);
                return;
            }
            System.out.println("      RN 插件: 未定位到 rn.py / rnohos.py (可用 --rn-py 指定)。");
            System.out.println("      compile-guide §5.1 要求 RN 构建经 rn.py 编排; 下方仅对 harmony/<模块> 跑 compileArkTS 类型检查作降级实证, 不产出 HAR/HAP。");
        }

        if (roots.isEmpty()) {
            System.out.println("      未找到可编译的 hvigor 工程根 (缺 build-profile.json5)。跳过编译完善。");
            writeCompileReport(outDir, new ArrayList<>(), new ArrayList<>(), "未找到编译根", rootStrs);
            return;
        }
        String hvigorw = findHvigorw(o, rootPath);
        if (hvigorw == null) {
            System.out.println("      未找到 hvigorw (DevEco tools/hvigor 或工程根)。跳过编译完善。");
            writeCompileReport(outDir, new ArrayList<>(), new ArrayList<>(), "未找到 hvigorw", rootStrs);
            return;
        }
        System.out.println("      hvigorw: " + hvigorw);
        for (Path cr : roots) {
            // 缺 oh_modules 时先 ohpm install 拉依赖: 一律用官方 registry (compile-guide §2.1)
            if (ohpm != null && Files.isRegularFile(cr.resolve("oh-package.json5"))
                    && !Files.isDirectory(cr.resolve("oh_modules"))) {
                System.out.println("      ohpm install @ " + cr + " ...");
                // 超时 3 分钟: 无网络/仓库不可达时不阻塞, 编译阶段随后自然降级
                RunResult ir = runProcess(Arrays.asList(ohpm, "install",
                        "--all", "--registry", "https://ohpm.openharmony.cn/ohpm/",
                        "--strict_ssl", "true"), cr, buildEnv, 3);
                allLog.append("===== ohpm install @ ").append(cr).append(" (exit=").append(ir.exit).append(") =====\n")
                      .append(ir.output).append('\n');
                if (ir.exit == -2) System.out.println("      ⚠ ohpm install 超时(3分钟), 已跳过 (编译可能因缺依赖失败, 不影响清单)。");
            }
            System.out.println("      >> hvigor compileArkTS @ " + cr);
            RunResult rr = runProcess(Arrays.asList(hvigorw, "--no-daemon", "compileArkTS"), cr, buildEnv, 20);
            allLog.append("===== hvigor compileArkTS @ ").append(cr).append(" (exit=").append(rr.exit).append(") =====\n")
                  .append(rr.output).append('\n');
            if (rr.exit == -2) {
                anyFailed = true;
                anyTimeout = true;
                System.out.println("      ⚠ 编译超时(20分钟), 已强制结束, 跳过该编译根 (不阻断清单)。");
                continue;
            }
            if (rr.exit != 0) {
                anyFailed = true;
                // 任务未注册 (Task ['compileArkTS'] was not found in the project) = 工具链不兼容
                // (hvigor 版本 / modelVersion / SDK 与工程不匹配), 逐模块重试必然同错, 直接跳过并给出诊断。
                if (rr.output.contains("was not found in the project")) {
                    String diag = compileIncompatDiagnosis(cr);
                    System.out.println("      ⚠ hvigor 未为工程注册构建任务 (compileArkTS not found), 判定工具链不兼容, 跳过编译。");
                    System.out.println("        " + diag);
                    allLog.append("===== 工具链不兼容诊断 =====\n").append(diag).append('\n');
                    if (compileDiag == null) compileDiag = diag;
                    continue;
                }
                for (String mod : readModuleNames(cr)) {
                    System.out.println("      >> hvigor compileArkTS (module=" + mod + ") @ " + cr);
                    RunResult mr = runProcess(Arrays.asList(hvigorw, "--no-daemon", "--mode", "module",
                            "-p", "module=" + mod + "@default", "compileArkTS"), cr, buildEnv, 20);
                    allLog.append("===== hvigor compileArkTS module=").append(mod)
                          .append(" (exit=").append(mr.exit).append(") =====\n").append(mr.output).append('\n');
                    if (mr.exit == -2) {
                        System.out.println("      ⚠ 模块 " + mod + " 编译超时(20分钟), 跳过后续模块重试。");
                        break;
                    }
                }
            }
        }
        finishCompile(outDir, changes, allLog.toString(), anyFailed, compileDiag, anyTimeout, rootStrs);
    }

    // 编译收尾: 写 compile.log / compile.json / compile.md, 匹配并并入实证行 (native/hvigor 与 rn.py 两条路径共用)
    static void finishCompile(Path outDir, List<ApiChangeItem> changes, String log,
                              boolean anyFailed, String compileDiag, boolean anyTimeout, List<String> rootStrs) throws Exception {
        Files.writeString(outDir.resolve("compile.log"), log, StandardCharsets.UTF_8);
        List<CompileIssue> issues = parseCompileLog(log);
        List<CompileIssue> matched = matchCompileIssues(issues, changes);
        appendCompileRows(outDir, matched);
        String status;
        if (!anyFailed) status = "编译完成";
        else if (compileDiag != null) status = "编译不可用(工具链不兼容): " + compileDiag;
        else if (anyTimeout) status = "编译超时(已强制结束, 详见 compile.log)";
        else status = "编译存在失败(已记录 compile.log)";
        writeCompileReport(outDir, issues, matched, status, rootStrs);
    }

    // 工具链不兼容诊断: 汇总工程 hvigor modelVersion / build-profile 版本目标 / 本机已装 SDK, 给出可操作建议
    static String compileIncompatDiagnosis(Path cr) {
        StringBuilder sb = new StringBuilder("hvigor 未为工程注册构建任务 (Task ['compileArkTS'] was not found in the project)，");
        sb.append("通常说明 DevEco 自带 hvigor 与工程 hvigor 配置不兼容，或本机 SDK 与工程版本不匹配。");
        String mv = readModelVersion(cr);
        String tgt = productField(cr, "targetSdkVersion");
        String comp = productField(cr, "compatibleSdkVersion");
        if (!mv.isEmpty()) sb.append(" 工程 modelVersion=").append(mv);
        if (!tgt.isEmpty() || !comp.isEmpty())
            sb.append(", targetSdkVersion=").append(tgt.isEmpty() ? "?" : tgt)
              .append(" / compatibleSdkVersion=").append(comp.isEmpty() ? "?" : comp);
        String sdks = describeInstalledSdks(Paths.get(DEVECO));
        if (!sdks.isEmpty()) sb.append(", 本机已装 SDK: ").append(sdks);
        sb.append("。建议: 用与工程版本匹配的 DevEco Studio 打开该工程构建；或将工程 hvigor-config modelVersion / build-profile targetSdkVersion 升级到本机 DevEco 支持的版本后再试。");
        return sb.toString();
    }

    static RunResult runProcess(List<String> cmd, Path cwd) { return runProcess(cmd, cwd, null, 0); }

    static RunResult runProcess(List<String> cmd, Path cwd, Map<String, String> env) {
        return runProcess(cmd, cwd, env, 0);
    }

    // timeoutMinutes > 0 时带超时执行: 超时强制结束整个进程树并返回 exit=-2,
    // 防止 hvigor / ohpm / 扫描器挂死永久阻塞整个流程 (调用方按"不阻断清单"语义处理)。
    static RunResult runProcess(List<String> cmd, Path cwd, Map<String, String> env, long timeoutMinutes) {
        Process p = null;
        try {
            List<String> full = cmd;
            if (isWin()) {
                // cmd /c 的引号解析: 每个参数单独加引号, 且整体再包一层引号。
                // 否则 hvigorw 在 "D:\DevEco Studio\..." 这类带空格路径时会在空格处截断。
                StringBuilder line = new StringBuilder("\"");
                for (int i = 0; i < cmd.size(); i++) {
                    if (i > 0) line.append(' ');
                    line.append('"').append(cmd.get(i)).append('"');
                }
                line.append('"');
                List<String> w = new ArrayList<>();
                w.add("cmd.exe"); w.add("/c");
                w.add(line.toString());
                full = w;
            }
            ProcessBuilder pb = new ProcessBuilder(full).directory(cwd.toFile()).redirectErrorStream(true);
            if (env != null && !env.isEmpty()) pb.environment().putAll(env);
            p = pb.start();
            // 输出抽取放独立线程, 主线程才能用 waitFor(timeout) 实现超时控制
            final StringBuilder sb = new StringBuilder();
            final Process proc = p;
            Thread reader = new Thread(() -> {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(proc.getInputStream(), StandardCharsets.UTF_8))) {
                    String ln;
                    while ((ln = br.readLine()) != null) {
                        synchronized (sb) { sb.append(ln).append('\n'); }
                    }
                } catch (Exception ignore) {}
            });
            reader.setDaemon(true);
            reader.start();
            boolean exited;
            if (timeoutMinutes > 0) {
                exited = p.waitFor(timeoutMinutes, TimeUnit.MINUTES);
            } else {
                p.waitFor();
                exited = true;
            }
            if (!exited) {
                killTree(p);
                reader.join(3000);
                synchronized (sb) {
                    sb.append("\n[TIMEOUT] 进程超过 ").append(timeoutMinutes).append(" 分钟未完成, 已强制结束 (防挂死)。\n");
                }
                return new RunResult(-2, sb.toString());
            }
            reader.join(3000);
            return new RunResult(p.exitValue(), sb.toString());
        } catch (Exception e) {
            if (p != null) killTree(p);
            return new RunResult(-1, "启动失败: " + e);
        }
    }

    // 结束进程及其整棵子进程树 (Windows 下 cmd /c 包装的子进程也要一并杀掉)
    static void killTree(Process p) {
        try { p.toHandle().descendants().forEach(ProcessHandle::destroyForcibly); } catch (Throwable ignore) {}
        try { p.destroyForcibly(); } catch (Throwable ignore) {}
    }

    // 解析 hvigor 日志: 逐条带 file:line[:col] 且含 error/warn/ArkTS 线索的编译问题
    static List<CompileIssue> parseCompileLog(String log) {
        List<CompileIssue> issues = new ArrayList<>();
        CompileIssue cur = null;
        Pattern fileLoc = Pattern.compile("(?i)\\bFile:\\s*(.+?)\\s*:\\s*(\\d+)(?::\\s*(\\d+))?");
        for (String line : log.split("\\r?\\n")) {
            CompileIssue start = startIssueIfMatch(line, fileLoc);
            if (start != null) {
                cur = start;
                issues.add(cur);
            } else if (cur != null) {
                String t = line.trim();
                if (t.isEmpty()) continue;
                if (line.startsWith(" ") || line.startsWith("\t")) cur.text.append(' ').append(t);
                else cur = null;
            }
        }
        return issues;
    }

    static CompileIssue startIssueIfMatch(String line, Pattern fileLoc) {
        String text = line.trim();
        if (!text.toLowerCase(Locale.ROOT).contains("error") && !text.contains("WARN")
                && !text.contains("warn") && !text.contains("ArkTS")) return null;
        String file = null; int ln = 0, col = 0;
        Matcher m = fileLoc.matcher(text);
        if (m.find()) {
            file = m.group(1).trim(); ln = parseIntSafe(m.group(2)); col = parseIntSafe(m.group(3));
        } else {
            // 无 "File:" 前缀时直接匹配 <路径>:<行>:<列> (兼容 Windows 盘符与 / 分隔)
            Matcher m2 = Pattern.compile("\\b([A-Za-z]:[\\\\/][^:\\s]+\\.(?:ets|ts)|[\\\\/][^:\\s]+\\.(?:ets|ts))\\s*:\\s*(\\d+)(?::\\s*(\\d+))?").matcher(text);
            if (m2.find()) {
                file = m2.group(1); ln = parseIntSafe(m2.group(2)); col = parseIntSafe(m2.group(3));
            }
        }
        if (file == null || ln == 0) return null;
        CompileIssue ci = new CompileIssue();
        ci.raw = text;
        ci.file = file;
        ci.line = ln;
        ci.col = col;
        ci.text.append(text);
        return ci;
    }

    // 变更清单 token -> 编译问题: 错误文本中出现的最长 token 匹配
    @SuppressWarnings("unchecked")
    static List<CompileIssue> matchCompileIssues(List<CompileIssue> issues, List<ApiChangeItem> changes) {
        Map<String, String> guidance = buildGuidanceMap(changes);
        Map<String, JSONObject> tokenMeta = new LinkedHashMap<>();
        for (ApiChangeItem c : changes) {
            JSONObject jo = (JSONObject) JSON.toJSON(c);
            JSONObject ic = jo.getJSONObject("interfaceChanges");
            String cid = (ic != null && ic.getString("id") != null) ? ic.getString("id") : "";
            String sdk = sdkVersionOf(ic);
            String aff = affectedVersionsOf(ic);
            String url = guidance.getOrDefault(cid, "");
            JSONArray apis = jo.getJSONArray("affectedApis");
            if (apis == null) continue;
            for (Object oo : apis) {
                JSONObject a = (JSONObject) oo;
                String iface = a.getString("interfaceName");
                JSONObject meta = new JSONObject();
                meta.put("changeId", cid);
                meta.put("apiDef", str(a.getString("methodDefinition"), qualifiedName(a)));
                meta.put("lang", str(a.getString("implementLanguage"), "typeScript"));
                meta.put("sdk", sdk);
                meta.put("aff", aff);
                meta.put("guidance", url);
                if (iface != null && iface.length() >= 3 && !isStopword(iface)) tokenMeta.putIfAbsent(iface, meta);
                String qn = qualifiedName(a);
                if (qn.contains(".") && qn.length() >= 3) tokenMeta.putIfAbsent(qn, meta);
            }
        }
        List<CompileIssue> matched = new ArrayList<>();
        for (CompileIssue issue : issues) {
            String text = issue.raw + " " + issue.text;
            String best = null; JSONObject bestMeta = null;
            for (Map.Entry<String, JSONObject> e : tokenMeta.entrySet()) {
                String tok = e.getKey();
                if (tok.length() < 2) continue;
                if (text.contains(tok) && (best == null || tok.length() > best.length())) {
                    best = tok; bestMeta = e.getValue();
                }
            }
            if (bestMeta != null) {
                issue.changeId = bestMeta.getString("changeId");
                issue.apiDefinition = bestMeta.getString("apiDef");
                issue.language = bestMeta.getString("lang");
                issue.sdkVersion = bestMeta.getString("sdk");
                issue.affectedVersions = bestMeta.getString("aff");
                issue.guidance = bestMeta.getString("guidance");
                matched.add(issue);
            }
        }
        return matched;
    }

    // 编译实证行并入 result.csv / result.json (保持 6 列, 按 6 列去重)
    static void appendCompileRows(Path outDir, List<CompileIssue> matched) throws Exception {
        // 先按 (raw|file:line) 去重, 再并入
        List<CompileIssue> unique = new ArrayList<>();
        Set<String> seenIssue = new LinkedHashSet<>();
        for (CompileIssue i : matched) {
            if (seenIssue.add(i.raw + "|" + i.file + ":" + i.line)) unique.add(i);
        }
        List<JSONObject> rows = readExistingRows(outDir.resolve("result.json"));
        Set<String> seenRow = new LinkedHashSet<>();
        for (JSONObject r : rows) seenRow.add(rowKey(r));
        List<JSONObject> added = new ArrayList<>();
        for (CompileIssue i : unique) {
            JSONObject r = row(i.apiDefinition, i.language, i.sdkVersion, i.affectedVersions, i.file + ":" + i.line, i.guidance);
            if (seenRow.add(rowKey(r))) added.add(r);
        }
        if (!added.isEmpty()) {
            rows.addAll(added);
            rows = dedupRows(rows);
            Files.writeString(outDir.resolve("result.json"), JSON.toJSONString(rows), StandardCharsets.UTF_8);
            Files.writeString(outDir.resolve("result.csv"), rowsToCsv(rows), StandardCharsets.UTF_8);
        }
        System.out.println("      编译实证匹配 " + unique.size() + " 条, 新增 " + added.size() + " 行到 result.csv。");
    }

    static List<JSONObject> readExistingRows(Path resultJson) {
        try {
            if (!Files.isRegularFile(resultJson)) return new ArrayList<>();
            String s = Files.readString(resultJson, StandardCharsets.UTF_8);
            if (s.isBlank()) return new ArrayList<>();
            List<JSONObject> rows = JSON.parseArray(s, JSONObject.class);
            return rows == null ? new ArrayList<>() : rows;
        } catch (Exception e) { return new ArrayList<>(); }
    }

    // =================== --merge: 应用 verify.json 回写 result ===================
    // 阶段 2 agent 复查产物 verify.json 的确定性合并器 (融合是脚本活, 不是 agent 活)。
    // 默认"标注不删": 主结果保持固定 6 列不变, verdict 落到 result-annotated.* 供审计;
    // --prune 显式开启才从主结果剔除 false_positive 行 (confidence < 0.5 的误报降级 needs_review, 不删)。
    static final String[] ANNOTATED_COLUMNS = {
            "ApiDefinition", "Language", "Changed in SDK Version", "Affected Versions",
            "CodeLocation", "Guidance link", "Verdict", "Confidence", "Reason"
    };

    static void runMergeMode(Map<String, String> o) {
        Path outDir = Paths.get(o.getOrDefault("out", "api-change-out")).toAbsolutePath();
        boolean prune = o.containsKey("prune");
        Path verifyPath = outDir.resolve("verify.json");
        if (!Files.isRegularFile(verifyPath)) {
            System.err.println("ERROR: 缺少 " + verifyPath + "，请先完成阶段 2 语义复查。");
            System.exit(2);
        }
        try {
            JSONObject verify = JSON.parseObject(Files.readString(verifyPath, StandardCharsets.UTF_8));
            if (verify == null) throw new IllegalArgumentException("verify.json 不是合法的 JSON 对象");
            List<JSONObject> rows = readExistingRows(outDir.resolve("result.json"));
            if (rows.isEmpty()) {
                System.err.println("ERROR: " + outDir.resolve("result.json") + " 为空或不存在，请先运行扫描。");
                System.exit(2);
            }
            // rowKey -> 该行的既有下标 (6 列全匹配)
            Map<String, Integer> index = new LinkedHashMap<>();
            for (int i = 0; i < rows.size(); i++) index.putIfAbsent(rowKey(rows.get(i)), i);

            Map<String, JSONObject> ann = new LinkedHashMap<>();   // rowKey -> {Verdict,Confidence,Reason}
            Set<String> removeKeys = new LinkedHashSet<>();
            Map<String, JSONObject> corrections = new LinkedHashMap<>();
            List<String> warnings = new ArrayList<>();
            int confirmed = 0, fp = 0, corrected = 0, supplemented = 0, needsReview = 0;

            JSONArray verdicts = verify.getJSONArray("verdicts");
            if (verdicts != null) for (Object vo : verdicts) {
                if (!(vo instanceof JSONObject)) continue;
                JSONObject v = (JSONObject) vo;
                // 两种行引用方式:
                //   rowIndex (推荐): result.json 的行下标, 免 6 列逐字回显, 省 token 且无全匹配脆弱性
                //   row (兼容):      6 列全量对象, 按 rowKey 逐字匹配
                Integer ri = v.getInteger("rowIndex");
                if (ri != null) {
                    if (ri < 0 || ri >= rows.size()) {
                        warnings.add("rowIndex 越界: " + ri + " (result 共 " + rows.size() + " 行)，已跳过");
                        continue;
                    }
                } else if (v.getJSONObject("row") == null) {
                    warnings.add("verdict 缺 rowIndex/row 字段，已跳过");
                    continue;
                }
                // rowIndex 模式下 key 直接取自 rows[ri], 必然存在于 index; 下方 containsKey 检查对两种模式均有效
                String key = ri != null ? rowKey(rows.get(ri)) : rowKey(v.getJSONObject("row"));
                if (!index.containsKey(key)) { warnings.add("未匹配到 result 行: " + truncate(key.replace("", " | "), 80)); continue; }
                String verdict = str(v.get("verdict"));
                String conf = str(v.get("confidence"));
                JSONObject a = new JSONObject();
                a.put("Verdict", verdict);
                a.put("Confidence", conf);
                a.put("Reason", str(v.get("reason")));
                ann.put(key, a);
                switch (verdict) {
                    case "confirmed":
                        confirmed++;
                        break;
                    case "corrected": {
                        JSONObject cr = v.getJSONObject("correctedRow");
                        if (cr == null) { warnings.add("corrected 缺 correctedRow: " + truncate(key, 60)); break; }
                        corrections.put(key, cr);
                        // 修正后 rowKey 变化, 标注跟随新 key
                        JSONObject na = new JSONObject();
                        na.put("Verdict", "corrected");
                        na.put("Confidence", conf);
                        na.put("Reason", str(v.get("reason")));
                        ann.put(rowKey(cr), na);
                        corrected++;
                        break;
                    }
                    case "false_positive": {
                        double cf = parseDoubleSafe(conf);
                        if (prune && (conf.isEmpty() || cf >= 0.5)) {
                            removeKeys.add(key);
                        } else if (prune) {
                            a.put("Verdict", "needs_review");   // prune 模式下低置信误报不删, 降级待人工
                            needsReview++;
                        }
                        fp++;   // 默认模式保留行, 标注仍为 false_positive
                        break;
                    }
                    default:
                        warnings.add("未知 verdict '" + verdict + "'，已跳过");
                }
            }

            List<JSONObject> merged = new ArrayList<>();
            for (JSONObject cur : rows) {
                String key = rowKey(cur);
                if (removeKeys.contains(key)) continue;
                JSONObject cr = corrections.get(key);
                merged.add(cr != null ? cr : cur);
            }
            JSONArray supps = verify.getJSONArray("supplements");
            if (supps != null) for (Object so : supps) {
                if (!(so instanceof JSONObject)) continue;
                JSONObject s = (JSONObject) so;
                JSONObject nr = row(s.getString("ApiDefinition"), s.getString("Language"),
                        s.getString("Changed in SDK Version"), s.getString("Affected Versions"),
                        s.getString("CodeLocation"), s.getString("Guidance link"));
                merged.add(nr);
                JSONObject a = new JSONObject();
                a.put("Verdict", "supplement");
                a.put("Confidence", str(s.get("confidence")));
                a.put("Reason", str(s.get("reason")));
                ann.put(rowKey(nr), a);
                supplemented++;
            }
            merged = dedupRows(merged);
            Files.writeString(outDir.resolve("result.json"), JSON.toJSONString(merged), StandardCharsets.UTF_8);
            Files.writeString(outDir.resolve("result.csv"), rowsToCsv(merged), StandardCharsets.UTF_8);
            writeAnnotated(outDir, merged, ann);

            System.out.println("[merge] confirmed=" + confirmed
                    + "  false_positive=" + fp + (prune ? "(已剔除)" : "(保留标注)")
                    + "  needs_review=" + needsReview
                    + "  corrected=" + corrected
                    + "  supplement=" + supplemented
                    + "  -> 最终 " + merged.size() + " 行");
            if (!warnings.isEmpty()) {
                System.out.println("  警告 " + warnings.size() + " 条:");
                for (String w : warnings) System.out.println("  ⚠ " + w);
            }
            System.out.println("  标注产物: " + outDir.resolve("result-annotated.csv"));
        } catch (Exception e) {
            System.err.println("ERROR: 合并失败: " + e.getMessage());
            System.exit(1);
        }
    }

    static void writeAnnotated(Path outDir, List<JSONObject> rows, Map<String, JSONObject> ann) throws Exception {
        JSONArray arr = new JSONArray();
        for (JSONObject r : rows) {
            JSONObject a = new JSONObject();
            for (String c : COLUMNS) a.put(c, r.getString(c));
            JSONObject an = ann.get(rowKey(r));
            a.put("Verdict", an == null ? "" : an.getString("Verdict"));
            a.put("Confidence", an == null ? "" : an.getString("Confidence"));
            a.put("Reason", an == null ? "" : an.getString("Reason"));
            arr.add(a);
        }
        Files.writeString(outDir.resolve("result-annotated.json"), JSON.toJSONString(arr), StandardCharsets.UTF_8);
        StringBuilder sb = new StringBuilder();
        sb.append(String.join(",", ANNOTATED_COLUMNS)).append('\n');
        for (Object o : arr) {
            JSONObject r = (JSONObject) o;
            String[] vals = new String[ANNOTATED_COLUMNS.length];
            for (int i = 0; i < ANNOTATED_COLUMNS.length; i++) vals[i] = r.getString(ANNOTATED_COLUMNS[i]);
            sb.append(String.join(",", Arrays.stream(vals).map(ApiChangeCli::csvCell).toArray(String[]::new))).append('\n');
        }
        Files.writeString(outDir.resolve("result-annotated.csv"), sb.toString(), StandardCharsets.UTF_8);
    }

    static double parseDoubleSafe(String s) { try { return s == null || s.isEmpty() ? -1 : Double.parseDouble(s.trim()); } catch (Exception e) { return -1; } }

    static void writeCompileReport(Path outDir, List<CompileIssue> issues, List<CompileIssue> matched,
                                   String status, List<String> rootStrs) throws Exception {
        JSONObject root = new JSONObject();
        root.put("status", status);
        root.put("compileRoots", rootStrs);
        JSONArray arr = new JSONArray();
        Set<String> seen = new LinkedHashSet<>();
        for (CompileIssue i : matched) {
            String key = i.raw + "|" + i.file + ":" + i.line;
            if (!seen.add(key)) continue;
            JSONObject j = new JSONObject();
            j.put("raw", i.raw);
            j.put("text", i.text.toString());
            j.put("file", i.file);
            j.put("line", i.line);
            if (i.col > 0) j.put("col", i.col);
            j.put("codeLocation", i.file + ":" + i.line);
            j.put("matchedChangeId", i.changeId);
            j.put("apiDefinition", i.apiDefinition);
            j.put("language", i.language);
            j.put("sdkVersion", i.sdkVersion);
            j.put("affectedVersions", i.affectedVersions);
            j.put("guidance", i.guidance);
            arr.add(j);
        }
        root.put("matched", arr);
        // 未匹配数以去重后的唯一编译问题为 basis, 与报告一致
        Set<String> uniq = new LinkedHashSet<>();
        for (CompileIssue i : issues) uniq.add(i.raw + "|" + i.file + ":" + i.line);
        int unmatched = uniq.size() - arr.size();
        root.put("unmatchedCount", Math.max(unmatched, 0));
        Files.writeString(outDir.resolve("compile.json"), JSON.toJSONString(root), StandardCharsets.UTF_8);

        StringBuilder md = new StringBuilder();
        md.append("# ArkTS 编译完善报告\n\n状态: ").append(status).append("\n\n");
        md.append("编译问题总数(唯一): ").append(uniq.size())
          .append(" | 匹配到变更 API: ").append(arr.size())
          .append(" | 未匹配: ").append(Math.max(unmatched, 0)).append("\n\n");
        if (arr.size() > 0) {
            md.append("## 编译实证 (匹配到变更 API)\n\n");
            for (Object oo : arr) {
                JSONObject j = (JSONObject) oo;
                md.append("- **").append(truncate(j.getString("apiDefinition"), 60)).append("**")
                  .append(" (").append(j.getString("sdkVersion")).append(")\n")
                  .append("  - 位置: `").append(j.getString("codeLocation")).append("`\n")
                  .append("  - 编译信息: `").append(truncate(j.getString("text"), 120)).append("`\n");
                String g = j.getString("guidance");
                if (g != null && !g.isEmpty()) md.append("  - 文档: ").append(g).append("\n");
            }
        }
        Files.writeString(outDir.resolve("compile.md"), md.toString(), StandardCharsets.UTF_8);
        System.out.println("      编译报告: " + outDir.resolve("compile.json")
                + " (匹配 " + arr.size() + " 条, 未匹配 " + Math.max(unmatched, 0) + " 条)");
    }

    static boolean isWin() { return System.getProperty("os.name", "").toLowerCase(Locale.ROOT).contains("win"); }
    static int parseIntSafe(String s) { try { return s == null ? 0 : Integer.parseInt(s.trim()); } catch (Exception e) { return 0; } }

    // =================== 输出 CSV / JSON / 表格 ===================
    static void writeRows(Path outDir, List<JSONObject> rows) throws Exception {
        Files.writeString(outDir.resolve("result.json"), JSON.toJSONString(rows), StandardCharsets.UTF_8);
        Files.writeString(outDir.resolve("result.csv"), rowsToCsv(rows), StandardCharsets.UTF_8);
        // 终端表格
        printTable(rows);
    }

    // 阶段 2 预过滤: 按"变更身份"(apiDef+lang+sdk+aff+guidance, 同变更的行共享前 4 列与 guidance) 把 result 行
    // 聚合成紧凑 relatedChanges.json, 供 agent 分组核验 (每唯一变更一次语义判定 + 组内行轻量抽查后展开为逐行 verdict),
    // 避免逐个读 230KB 级 changeList.json / apiChange/*.json。仅含扫描命中的变更。
    // 组上附带: changeType/changeId (供按变更类型收窄复查), curatedPrompt (官方人工策展说明, 优先判定依据),
    // notApplicable (ISOLATED 变更 apiVersion 高于工程 targetSdkVersion 时标注)。
    static void emitRelatedChanges(Path outDir, List<JSONObject> rows, Set<String> naKeys,
                                   Map<String, JSONObject> changeMeta, Map<String, String> curatedPrompts) throws Exception {
        JSONObject root = new JSONObject();
        root.put("purpose", "阶段 2 agent 分组核验的紧凑输入: 每条变更(组)一次语义判定 + 组内行轻量抽查后展开为逐行 verdict。完整数据见 changeList.json / apiChange/。组上带 changeType 时可只对行为变更类做完整判定。");
        LinkedHashMap<String, JSONObject> byKey = new LinkedHashMap<>();
        for (JSONObject r : rows) {
            String key = rowKeyOfChange(r);
            JSONObject g = byKey.get(key);
            if (g == null) {
                g = new JSONObject();
                g.put("apiDefinition", r.getString("ApiDefinition"));
                g.put("language", r.getString("Language"));
                g.put("changedInSdk", r.getString("Changed in SDK Version"));
                g.put("affectedVersions", r.getString("Affected Versions"));
                g.put("guidance", r.getString("Guidance link"));
                g.put("changeIdHint", guidanceAnchor(r.getString("Guidance link")));
                JSONObject meta = changeMeta == null ? null : changeMeta.get(key);
                if (meta != null) {
                    g.put("changeType", meta.getString("changeType"));
                    g.put("changeId", meta.getString("changeId"));
                    String cp = curatedPrompts == null ? null : curatedPrompts.get(meta.getString("changeId"));
                    if (cp != null && !cp.isEmpty()) g.put("curatedPrompt", cp);
                }
                if (naKeys != null && naKeys.contains(key)) {
                    g.put("notApplicable", "ISOLATED 变更的 apiVersion 高于工程 targetSdkVersion, 对当前工程配置不生效");
                }
                g.put("hitCount", 0);
                g.put("locations", new JSONArray());
                byKey.put(key, g);
            }
            g.put("hitCount", g.getIntValue("hitCount") + 1);
            JSONArray locs = g.getJSONArray("locations");
            String loc = r.getString("CodeLocation");
            if (loc != null && !loc.isEmpty() && !locs.contains(loc)) locs.add(loc);
        }
        JSONArray changes = new JSONArray();
        for (JSONObject g : byKey.values()) changes.add(g);
        root.put("totalRows", rows.size());
        root.put("distinctChanges", changes.size());
        root.put("changes", changes);
        Files.writeString(outDir.resolve("relatedChanges.json"), JSON.toJSONString(root), StandardCharsets.UTF_8);
        System.out.println("      阶段 2 预过滤: relatedChanges.json (" + changes.size() + " 组, " + rows.size() + " 行)");
    }

    static String rowKeyOfChange(JSONObject r) {
        return String.join("\u0001", r.getString("ApiDefinition"), r.getString("Language"),
                r.getString("Changed in SDK Version"), r.getString("Affected Versions"), r.getString("Guidance link"));
    }

    static String guidanceAnchor(String url) {
        if (url == null) return "";
        int h = url.lastIndexOf('#');
        return h >= 0 ? url.substring(h + 1) : "";
    }

    // 阶段 2 预过滤: apiChange/*.json 各版本原始变更的紧凑摘要, 供 agent 交叉比对
    // (发现被 changeList.json 合并/过滤遗漏的变更), 免读原始大文件。
    static void emitApiChangeSummary(Path outDir) {
        Path rawDir = outDir.resolve("apiChange");
        if (!Files.isDirectory(rawDir)) return;
        JSONObject root = new JSONObject();
        root.put("purpose", "阶段 2 agent 交叉比对输入: (start,end] 各版本原始变更的紧凑摘要 (id/sdkVersion/apiEffectiveVersion/changeTitle/changeType + affectedApis 的 interfaceName 列表)。完整原始数据见 apiChange/*.json, 仅对可疑条目按需深读。");
        JSONObject versions = new JSONObject();
        int total = 0;
        try (java.util.stream.Stream<Path> s = Files.list(rawDir)) {
            List<Path> files = new ArrayList<>();
            s.filter(p -> p.getFileName().toString().endsWith(".json")).forEach(files::add);
            Collections.sort(files);
            for (Path f : files) {
                try {
                    List<JSONObject> list = JSON.parseArray(Files.readString(f, StandardCharsets.UTF_8), JSONObject.class);
                    if (list == null) continue;
                    JSONArray arr = new JSONArray();
                    for (JSONObject e : list) {
                        JSONObject ic = e.getJSONObject("interfaceChanges");
                        if (ic == null) continue;
                        JSONObject c = new JSONObject();
                        c.put("id", str(ic.get("id")));
                        c.put("sdkVersion", str(ic.get("sdkVersion"), ic.get("apiVersion")));
                        c.put("apiEffectiveVersion", str(ic.get("apiEffectiveVersion")));
                        c.put("changeTitle", str(ic.get("changeTitle")));
                        c.put("changeType", str(ic.get("changeType")));
                        JSONArray apis = e.getJSONArray("affectedApis");
                        JSONArray toks = new JSONArray();
                        if (apis != null) {
                            for (Object o : apis) {
                                JSONObject a = (JSONObject) o;
                                String t = a.getString("interfaceName");
                                if (t != null && !t.isBlank() && !toks.contains(t)) toks.add(t);
                            }
                        }
                        c.put("affectedApiTokens", toks);
                        arr.add(c);
                        total++;
                    }
                    versions.put(f.getFileName().toString(), arr);
                } catch (Exception ignore) {}
            }
        } catch (Exception ignore) {}
        if (total == 0) return;
        root.put("totalEntries", total);
        root.put("versions", versions);
        try {
            Files.writeString(outDir.resolve("apiChangeSummary.json"), JSON.toJSONString(root), StandardCharsets.UTF_8);
            System.out.println("      阶段 2 预过滤: apiChangeSummary.json (" + total + " 条)");
        } catch (Exception ignore) {}
    }

    static String rowsToCsv(List<JSONObject> rows) {
        StringBuilder sb = new StringBuilder();
        sb.append(String.join(",", COLUMNS)).append('\n');
        for (JSONObject r : rows) {
            String[] vals = new String[COLUMNS.length];
            for (int i = 0; i < COLUMNS.length; i++) vals[i] = r.getString(COLUMNS[i]);
            sb.append(String.join(",", Arrays.stream(vals).map(ApiChangeCli::csvCell).toArray(String[]::new))).append('\n');
        }
        return sb.toString();
    }

    static void printTable(List<JSONObject> rows) {
        if (rows.isEmpty()) { System.out.println("(无代码位置命中)"); return; }
        System.out.println("\n------ 结果 (" + rows.size() + " 行) ------");
        int limit = 50;   // 大结果集只打前 50 行, 避免刷屏; 全量见 result.csv
        for (int i = 0; i < Math.min(rows.size(), limit); i++) {
            JSONObject r = rows.get(i);
            System.out.printf("[%s] %s  (%s, affected: %s)%n    ↳ %s%n",
                    r.getString(COLUMNS[1]),                       // Language
                    truncate(r.getString(COLUMNS[0]), 70),         // ApiDefinition
                    r.getString(COLUMNS[2]),                       // Changed in SDK Version
                    r.getString(COLUMNS[3]),                       // Affected Versions
                    r.getString(COLUMNS[4]));                      // CodeLocation
            String g = r.getString(COLUMNS[5]);
            if (g != null && !g.isEmpty()) System.out.println("    🔗 " + g);
        }
        if (rows.size() > limit) System.out.println("… 其余 " + (rows.size() - limit) + " 行见 result.csv");
    }

    static String csvCell(String s) {
        if (s == null) return "";
        if (s.contains(",") || s.contains("\"") || s.contains("\n")) {
            return "\"" + s.replace("\"", "\"\"") + "\"";
        }
        return s;
    }

    // 相对代码位置(相对"扫描目标的父目录", 如 "ohos_hardemo/lib/.../x.ets:123") -> 绝对路径
    static String absolutify(String codeLoc, Path scanned) {
        if (codeLoc == null || codeLoc.isEmpty()) return "";
        if (codeLoc.startsWith("/")) return codeLoc;             // 已是绝对路径
        Path base = scanned == null ? null : scanned.getParent();
        if (base == null) return codeLoc;
        int colon = codeLoc.lastIndexOf(':');
        String filePart = colon > 0 ? codeLoc.substring(0, colon) : codeLoc;
        String linePart = colon > 0 ? codeLoc.substring(colon) : "";
        try {
            return base.resolve(filePart).normalize() + linePart;
        } catch (Exception e) {
            return codeLoc;
        }
    }

    // 按全部列去重(保留顺序)
    static List<JSONObject> dedupRows(List<JSONObject> rows) {
        List<JSONObject> out = new ArrayList<>();
        LinkedHashSet<String> seen = new LinkedHashSet<>();
        for (JSONObject r : rows) if (seen.add(rowKey(r))) out.add(r);
        return out;
    }

    static String rowKey(JSONObject r) {
        StringBuilder key = new StringBuilder();
        for (String c : COLUMNS) key.append(r.getString(c)).append('\u0001');
        return key.toString();
    }

    // =================== 小工具 ===================
    static String truncate(String s, int max) {
        if (s == null) return "";
        s = s.trim().replaceAll("\\s+", " ");
        return s.length() <= max ? s : s.substring(0, max - 1) + "…";
    }

    static final Set<String> STOPWORDS = new LinkedHashSet<>(Arrays.asList(
            "get", "set", "new", "let", "var", "for", "try", "run", "add", "put", "use",
            "show", "hide", "init", "open", "close", "load", "save", "read", "copy", "clone",
            "name", "type", "value", "size", "count", "index", "data", "item", "list", "result",
            "start", "stop", "next", "prev", "this", "self", "that", "test", "log", "error",
            "off", "do", "if", "to", "from", "with", "void", "null", "true", "false",
            "constructor", "toString", "valueOf", "hasOwnProperty"));

    static boolean isStopword(String s) { return STOPWORDS.contains(s); }

    static List<String> readModuleSrcPaths(String project) {
        List<String> r = new ArrayList<>();
        Path bp = Paths.get(project).resolve("build-profile.json5");
        if (!Files.isReadable(bp)) return r;
        try {
            Matcher m = Pattern.compile("\"srcPath\"\\s*:\\s*\"([^\"]+)\"").matcher(Files.readString(bp, StandardCharsets.UTF_8));
            while (m.find()) r.add(m.group(1));
        } catch (Exception ignore) {}
        return r;
    }

    static void tailLog(Path log) {
        try {
            List<String> all = Files.readAllLines(log, StandardCharsets.UTF_8);
            System.out.println("------ scan.log (tail) ------");
            for (int i = Math.max(0, all.size() - 15); i < all.size(); i++) System.out.println(all.get(i));
        } catch (Exception ignore) {}
    }

    static String sanitize(String s) { return s.replaceAll("[^A-Za-z0-9._-]", "_"); }
    static String esc(String s) { return s.replace("\\", "\\\\").replace("\"", "\\\""); }

    static Map<String, String> parseArgs(String[] args) {
        Map<String, String> m = new LinkedHashMap<>();
        for (int i = 0; i < args.length; i++) {
            String a = args[i];
            if (a.startsWith("--")) {
                String key = a.substring(2);
                if (key.contains("=")) m.put(key.substring(0, key.indexOf('=')), key.substring(key.indexOf('=') + 1));
                else if (i + 1 < args.length && !args[i + 1].startsWith("--")) m.put(key, args[++i]);
                else m.put(key, "");
            }
        }
        return m;
    }

    static String requireArg(Map<String, String> o, String key) {
        String v = o.get(key);
        if (v == null) { System.err.println("ERROR: --" + key + " 必填。--help 查看用法。"); System.exit(2); }
        return v;
    }

    static void usage() {
        System.out.println("ApiChangeCli — 直接调用 DevEco ApiScanUtil 的命令行工具 (macOS / Linux / Windows)\n"
                + "\n输出列: " + String.join(" | ", COLUMNS) + "\n"
                + "\n用法:"
                + "\n  ApiChangeCli --list-versions"
                + "\n  ApiChangeCli --project <工程> --start <版本> --end <版本> [--out <目录>] [--no-scan] [--no-compile]"
                + "\n  ApiChangeCli --detect --project <工程>            只识别工程类型与 ArkTS 扫描根, 不扫描"
                + "\n  ApiChangeCli --self-test                          自检类型识别与扫描根计算"
                + "\n  ApiChangeCli --compile --project <工程> --out <目录>  只做 ArkTS 编译完善 (读已有 changeList.json)"
                + "\n  ApiChangeCli --merge --out <目录> [--prune]          应用 verify.json 回写 result (默认标注不删, --prune 剔除误报行)"
                + "\n  ApiChangeCli --type <native-project|flutter|rn|native-module|unknown>  覆盖自动识别\n"
                + "\n编译完善 (阶段 3, 扫描工程时默认执行):"
                + "\n  --no-compile            扫描时跳过 ArkTS 编译完善 (先扫、agent 合并后再单独 --compile 时用)"
                + "\n  --compile               显式编译; 也可独立运行 (--compile --project <工程> --out <目录>, 对已有 out 追加实证行)"
                + "\n  --compile-root <目录>   覆盖编译工程根 (默认按工程类型定位; Flutter 插件优先 example/ohos, 见 compile-guide §4.1)"
                + "\n  --hvigorw <路径>        覆盖 hvigorw (默认 DevEco Studio 自带 tools/hvigor, 缺省回退工程根 wrapper)"
                + "\n  --rn-py <路径>          RN 插件指定编排脚本 rn.py/rnohos.py (RN 铁律, compile-guide §5.1: 禁裸跑 hvigorw)"
                + "\n  --python <解释器>       覆盖 python 解释器 (默认 python; 本机只有 py 时用 --python py)"
                + "\n  (hvigor 报 compileArkTS 任务未注册 = 工具链不兼容, 自动跳过并写诊断到 compile.md)\n"
                + "\n合并 (阶段 2 之后, 无需 DevEco):"
                + "\n  --merge                 读 out/verify.json 合并回 result.json/csv; 默认只标注 (result-annotated.*),"
                + "\n                          corrected 应用修正, supplements 追加; false_positive 保留并标注"
                + "\n  --prune                 配合 --merge: 从主结果剔除 false_positive 行 (confidence<0.5 的降级 needs_review 不删)"
                + "\n  --ignore-isolation-filter  关闭 ISOLATED 变更的 targetSdkVersion 不适用标注\n"
                + "\n阶段 2 预过滤 (扫描时自动产出, 供 agent 分组核验):"
                + "\n  relatedChanges.json      命中变更按变更身份聚合 (组判定输入)"
                + "\n  apiChangeSummary.json    各版本原始变更紧凑摘要 (交叉比对输入)\n"
                + "\n工程类型自动识别 (也可用 --type 覆盖):"
                + "\n  鸿蒙原生工程  = 根有 build-profile.json5 (扫描各模块 src/main/ets)"
                + "\n  Flutter 插件  = 根有 pubspec.yaml + ohos/ (只扫 ohos/)"
                + "\n  RN 插件       = 根有 package.json + harmony/ (只扫 harmony/ 各模块)"
                + "\n  独立模块      = 根有 oh-package.json5 (扫模块本身)"
                + "\n  未知          = 回退全根扫描\n"
                + "\n版本串须完整匹配 VERSION_LIST, 例如 HarmonyOS_5.1.0(18)_Release。"
                + "\n也支持 API Level 数字, 如 --start 14 --end 26 (优先匹配 Release)。"
                + "\n环境变量: DEVECO_HOME (macOS/Linux) 或 DEV_DIR / TOOL_HOME (Windows) 可覆盖 DevEco 安装目录。");
    }
}
