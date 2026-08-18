如果在使用过程中有任何问题，可以在GitCode提Issue，会及时跟进。issue地址：[issues](https://gitcode.com/ohos_third_party_lib/HeaderRecyclerView/issues)。

# HeaderRecyclerView

基于 https://github.com/Karumi/HeaderRecyclerView.git 开发，适配鸿蒙版本。

## 项目介绍

HeaderRecyclerView 是一个 HarmonyOS（ArkTS）列表数据控制器库，以声明式渲染范式为 ArkUI 的 Grid/List 透明地提供 header、普通条目与 footer 的位置映射、类型分派与刷新能力，并支持在网格中让 header / footer 占满整行。

库本身不渲染任何 UI，仅提供数据控制器与跨列计算器：

- `HeaderRecyclerViewDataSource<H, T, F>`：实现 ArkUI `IDataSource`，内部维护 header / items / footer / footer 显隐四段状态，对外暴露数据存取、位置与类别判定、刷新通知，以及条目回收分派钩子，供 `LazyForEach` 驱动渲染。
- `HeaderSpanSizeLookup<H, T, F>`：依据数据控制器状态计算每个 position 的跨列数，并可直接产出 `GridLayoutOptions` 或按 position 给出 `GridItem` 的列号，让 header / footer 在网格中横跨所有列。
- `ItemCategory`：条目类别枚举（`HEADER = -2`、`ITEM = -1`、`FOOTER = -3`），用于 `@Builder` 内按类别分派渲染。

## 目录结构

```
HeaderRecyclerView/
├─ ohos_library/                      # HAR 源码（数据控制器 + 跨列计算器）
│  ├─ src/main/ets/
│  │  ├─ HeaderRecyclerViewDataSource.ets   # 数据控制器（IDataSource）
│  │  ├─ HeaderSpanSizeLookup.ets            # 网格跨列计算器
│  │  └─ ItemCategory.ets                    # 条目类别枚举
│  ├─ Index.ets                         # 对外导出公开 API
│  ├─ oh-package.json5                  # name: header_recycler_view
│  └─ src/main/module.json5             # module.name: header_recycler_view
└─ ohos_hardemo/                        # Demo 应用工程
   ├─ entry/src/main/ets/
   │  ├─ pages/Index.ets                # 主页面（2 列网格 + header/footer + 加载更多）
   │  ├─ components/                    # HeaderBanner / CharacterCard / FooterLoading
   │  ├─ model/                         # DragonBallCharacter/Header/Footer
   │  └─ data/DragonBallDataSource.ets  # 继承数据控制器的 Demo 实现
   ├─ build-profile.json5              # 通过 srcPath: "../ohos_library" 引入 HAR 模块
   └─ oh-package.json5                 # 通过 "header_recycler_view": "file:../ohos_library" 声明本地依赖
```

`ohos_hardemo/build-profile.json5` 的 `modules` 中以 `srcPath: "../ohos_library"` 引入 HAR 模块（模块名 `header_recycler_view`），`ohos_hardemo/oh-package.json5` 通过 `"header_recycler_view": "file:../ohos_library"` 声明本地依赖。模块名称默认为 `header_recycler_view`，可根据需要自行修改（需同步更新 HAR 的 `oh-package.json5`、`module.json5` 与 Demo 的 `build-profile.json5`、`oh-package.json5` 及所有 import 路径）。

## 环境要求

- HarmonyOS NEXT 及以上
- DevEco Studio（含 hvigor、ohpm）
- 最低支持版本 compatibleSdkVersion 5.1.1（API 19）
- 依赖：HAR 无任何运行时依赖；Demo 依赖本地 HAR

## 快速开始

1. 在 DevEco Studio 中打开 `ohos_hardemo/` 工程。
2. 执行 `ohpm install` 安装依赖（包含本地 HAR `header_recycler_view`）。
3. 执行编译：

   ```bash
   cd ohos_hardemo
   ohpm install
   hvigorw -e assembleHap --mode module -p product=default -p buildMode=debug --no-daemon
   ```

4. 产物 `ohos_hardemo/entry/build/default/outputs/default/entry-default-unsigned.hap` 即可安装运行。

### 在你自己的工程中使用 HAR

1. 将 `ohos_library/` 复制到你的工程根目录（或作为子模块）。
2. 在应用工程的 `build-profile.json5` 的 `modules` 中加入：

   ```json5
   { "name": "header_recycler_view", "srcPath": "../ohos_library" }
   ```

3. 在应用工程的 `oh-package.json5` 中声明本地依赖：

   ```json5
   { "dependencies": { "header_recycler_view": "file:../ohos_library" } }
   ```

4. 在代码中导入并使用：

   ```typescript
   import { HeaderRecyclerViewDataSource, HeaderRecyclerViewEntry, ItemCategory, HeaderSpanSizeLookup } from 'header_recycler_view';

   // 1) 创建数据控制器
   let dataSource = new HeaderRecyclerViewDataSource<HeaderData, ItemData, FooterData>();
   dataSource.setHeader(headerData);
   dataSource.setItems(itemList);
   dataSource.setFooter(footerData);

   // 2) 在 LazyForEach 中按类别分派渲染（header/footer 横跨整行）
   let spanLookup = new HeaderSpanSizeLookup<HeaderData, ItemData, FooterData>(dataSource, 2);

   Grid(scroller, { regularSize: [1, 1] }) {
     LazyForEach(dataSource,
       (entry: HeaderRecyclerViewEntry<HeaderData, ItemData, FooterData>, index: number) => {
         if (entry.category === ItemCategory.HEADER) {
           GridItem() { /* 渲染 header，使用 entry.headerData */ }
             .columnStart(0).columnEnd(spanLookup.getSpanCount() - 1)
         } else if (entry.category === ItemCategory.FOOTER) {
           GridItem() { /* 渲染 footer，使用 entry.footerData */ }
             .columnStart(0).columnEnd(spanLookup.getSpanCount() - 1)
         } else {
           GridItem() { /* 渲染普通条目，使用 entry.itemData */ }
         }
       }, (entry, index) => index.toString())
   }
   .columnsTemplate('1fr 1fr')
   ```

5. 数据变化后调用 `dataSource.notifyDataReloaded()` 触发刷新；`showFooter()` / `hideFooter()` 已自带刷新。

## API 参考

### `HeaderRecyclerViewDataSource<H, T, F>`

实现 ArkUI `IDataSource`，是库的核心数据控制器。

| 方法 | 说明 |
|---|---|
| `totalCount(): number` | `IDataSource`。返回 items + header + footer（footer 仅在显示时计入）。 |
| `getData(index): HeaderRecyclerViewEntry<H,T,F>` | `IDataSource`。返回带 `category`/`position`/`headerData`/`itemData`/`footerData` 的渲染载体。 |
| `registerDataChangeListener(listener)` / `unregisterDataChangeListener(listener)` | `IDataSource`。注册/注销数据变化监听。 |
| `notifyDataReloaded()` | 触发整表刷新（对应 `notifyDataSetChanged`）。 |
| `notifyDataAdd/notifyDataDelete/notifyDataChange/notifyDataMove(...)` | 精确位置刷新通知。 |
| `getHeader(): H \| null` / `getFooter(): F \| null` | 读取 header / footer 数据。 |
| `getItem(position): T` | 按 position 取普通条目，有 header 且有 items 时内部 position-1。 |
| `setHeader(header)` / `setFooter(footer)` | 设置 header / footer，不自动刷新。 |
| `setItems(items: T[] \| null)` | 设置普通条目列表；`items` 为 null 时抛运行时异常。 |
| `showFooter()` / `hideFooter()` | 切换 footer 显隐并触发整表刷新。 |
| `isHeaderPosition(position)` / `isFooterPosition(position)` | 判定对外 position 是否为 header / footer。 |
| `hasHeader()` / `hasFooter()` | header 是否已配置 / footer 是否已配置且未隐藏。 |
| `getItemCategory(position): ItemCategory` | 返回 position 对应的条目类别。 |
| `notifyViewRecycled(position)` | 按位置分派到下面的回收钩子，由 `@Reusable` 组件在 `aboutToRecycle` 中调用。 |
| `onHeaderViewRecycled(position)` / `onItemViewRecycled(position)` / `onFooterViewRecycled(position)` | 可重写的回收回调（默认空实现）。 |

### `HeaderSpanSizeLookup<H, T, F>`

| 方法 | 说明 |
|---|---|
| `constructor(dataSource, spanCount)` | 关联数据控制器与网格列数。 |
| `getSpanSize(position): number` | header/footer 返回 spanCount，其余返回 1。 |
| `getIrregularIndexes(): number[]` | 当前需占满整行的位置列表。 |
| `getIrregularSizeByIndex(index): [number, number]` | 不规则位置的 `[行数, 列数]`。 |
| `buildGridLayoutOptions(): GridLayoutOptions` | 构造可直接用于 `Grid(scroller, options)` 的布局选项。 |
| `isFullSpan(position): boolean` | 给定 position 是否应占满整行。 |
| `columnStartOf(position)` / `columnEndOf(position)` | header/footer 的列号，供动态设置 `GridItem.columnStart/columnEnd`。 |

### `ItemCategory`

| 成员 | 值 | 说明 |
|---|---|---|
| `HEADER` | -2 | 头部条目 |
| `ITEM` | -1 | 普通条目 |
| `FOOTER` | -3 | 底部条目 |

## 开源许可

```
Copyright 2015 Karumi

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
