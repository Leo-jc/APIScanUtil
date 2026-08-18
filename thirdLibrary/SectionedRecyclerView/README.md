如果在使用过程中有任何问题，可以在GitCode提Issue，会及时跟进。issue地址：[issues](https://gitcode.com/ohos_third_party_lib/SectionedRecyclerView/issues)。

# SectionedRecyclerView

基于 https://github.com/truizlop/SectionedRecyclerView 开发，适配鸿蒙版本

一个 HarmonyOS（ArkTS）分组列表/网格库，提供带 section header 与可选 footer 的分组渲染能力。线性列表使用 `List + LazyForEach`，网格使用 `Grid + GridItem(columnStart/columnEnd)`，header/footer 可占满整行，item 占单格并按列数自动换行。数据源实现 `IDataSource`，支持 `notifySectionReloaded` / `notifySectionItemChanged` 等变更通知驱动懒加载刷新。

## 目录结构

```
SectionedRecyclerView/
├── ohos_library/                      # HAR 源码（鸿蒙库）
│   ├── Index.ets                       # 公开 API 导出
│   ├── oh-package.json5                # name: sectionedrecyclerview
│   ├── build-profile.json5
│   ├── hvigorfile.ts
│   ├── BuildProfile.ets
│   ├── consumer-rules.txt
│   ├── obfuscation-rules.txt
│   └── src/main/
│       ├── module.json5                # module.name: sectionedrecyclerview, type: har
│       ├── ets/
│       │   ├── sectionedrecyclerview/
│       │   │   ├── Types.ets            # SectionEntry, SectionEntryKind, TYPE_* 常量
│       │   │   ├── SectionedModel.ets   # 抽象段模型（3 抽象 + 3 viewType 钩子）
│       │   │   ├── SimpleSectionedModel.ets  # 简化模型（无 footer + 标题）
│       │   │   ├── SectionedDataSource.ets   # IDataSource 实现 + 通知 + 位置查询
│       │   │   └── DefaultSectionHeader.ets # 默认 header @Builder（复刻 view_header.xml）
│       │   └── components/
│       │       ├── SectionedList.ets   # 线性分组列表组件
│       │       └── SectionedGrid.ets   # 分组网格组件（header/footer 占满整行）
│       └── resources/base/element/     # 颜色/尺寸资源
│           ├── color.json              # sectioned_header_text_color #9E9E9E
│           └── float.json              # sectioned_header_height 48vp, padding 16vp
├── ohos_hardemo/                       # Demo 应用（HAP）
│   ├── build-profile.json5             # modules 含 sectionedrecyclerview，srcPath: ../ohos_library
│   ├── oh-package.json5               # 依赖 sectionedrecyclerview: file:../ohos_library
│   ├── AppScope/
│   ├── hvigor/
│   └── entry/
│       ├── build-profile.json5
│       ├── oh-package.json5
│       └── src/main/
│           ├── module.json5
│           └── ets/
│               ├── entryability/EntryAbility.ets
│               └── pages/
│                   ├── Index.ets       # 首页（导航入口）
│                   ├── CountGridPage.ets   # SectionedGrid 完整 Demo（5 段、header/item/footer、多 viewType）
│                   └── AgendaListPage.ets # SectionedList 简化 Demo（2 段、默认 header、无 footer）
└── README.md
```

`ohos_hardemo/build-profile.json5` 通过 `srcPath: "../ohos_library"` 引入 HAR 模块（模块名 `sectionedrecyclerview`），`ohos_hardemo/oh-package.json5` 通过 `"sectionedrecyclerview": "file:../ohos_library"` 声明本地依赖。`ohos_hardemo/` 内不包含 `library/` 副本。

## 环境要求

- HarmonyOS compatibleSdkVersion：5.1.1(19) 及以上
- targetSdkVersion：6.0.2(22)
- DevEco Studio / hvigor 6.x
- ohpm 6.x

## 快速开始

### 1. 编译 HAR 与 Demo HAP

```bash
cd ohos_hardemo
ohpm install
hvigorw -e assembleHap --mode module -p product=default -p buildMode=debug --no-daemon
```

产物位于 `ohos_hardemo/entry/build/default/outputs/default/entry-default-unsigned.hap`。

### 2. 在自己的工程中引用 HAR

在应用模块的 `oh-package.json5` 中添加本地依赖：

```json5
{
  "dependencies": {
    "sectionedrecyclerview": "file:../ohos_library"
  }
}
```

### 3. 最小示例（简化分组列表）

```typescript
import {
  SectionedDataSource,
  SectionedList,
  SectionedDefaultHeader,
  SectionEntry,
  SimpleSectionedModel
} from 'sectionedrecyclerview';

class AgendaModel extends SimpleSectionedModel {
  getSectionCount(): number { return 2; }
  getItemCountForSection(section: number): number { return 3; }
  getSectionHeaderTitle(section: number): string {
    return section === 0 ? 'Today' : 'Tomorrow';
  }
}

@Entry
@Component
struct AgendaPage {
  private model: AgendaModel = new AgendaModel();
  private dataSource: SectionedDataSource = new SectionedDataSource(this.model);

  @Builder
  renderItem(entry: SectionEntry) {
    Text('Item ' + (entry.positionWithinSection + 1))
  }

  build() {
    SectionedList({
      dataSource: this.dataSource,
      headerBuilder: (entry: SectionEntry): void => {
        SectionedDefaultHeader(this.model.getSectionHeaderTitle(entry.section))
      },
      itemBuilder: (entry: SectionEntry): void => {
        this.renderItem(entry)
      }
    })
  }
}
```

### 4. 完整分组网格（含 header/item/footer）

```typescript
import {
  SectionedDataSource,
  SectionedGrid,
  SectionedModel,
  SectionEntry
} from 'sectionedrecyclerview';

class CountModel extends SectionedModel {
  getSectionCount(): number { return 5; }
  getItemCountForSection(section: number): number { return section + 1; }
  hasFooterInSection(section: number): boolean { return true; }
}

@Entry
@Component
struct CountPage {
  private model: CountModel = new CountModel();
  private dataSource: SectionedDataSource = new SectionedDataSource(this.model);

  @Builder renderHeader(entry: SectionEntry) { Text('Section ' + (entry.section + 1)) }
  @Builder renderItem(entry: SectionEntry) { Text((entry.positionWithinSection + 1).toString()) }
  @Builder renderFooter(entry: SectionEntry) { Text('Footer ' + (entry.section + 1)) }

  build() {
    SectionedGrid({
      dataSource: this.dataSource,
      spanCount: 2,
      headerBuilder: (entry: SectionEntry): void => { this.renderHeader(entry) },
      itemBuilder: (entry: SectionEntry): void => { this.renderItem(entry) },
      footerBuilder: (entry: SectionEntry): void => { this.renderFooter(entry) }
    })
  }
}
```

## API 参考

### 常量与类型

| 符号 | 类型 | 说明 |
|---|---|---|
| `TYPE_SECTION_HEADER` | `number = -1` | header viewType 默认值 |
| `TYPE_SECTION_FOOTER` | `number = -2` | footer viewType 默认值 |
| `TYPE_ITEM` | `number = -3` | item viewType 默认值 |
| `SectionEntryKind` | enum `HEADER=0, ITEM=1, FOOTER=2` | 条目种类 |
| `SectionEntry` | class | `kind`, `section`, `positionWithinSection`, `viewType` |

### 抽象模型

#### `SectionedModel`（abstract）

继承此类以提供分组数据形状。等价于原始库 `SectionedRecyclerViewAdapter<H,VH,F>` 的 6 个抽象回调中的段形状部分（`getSectionCount` / `getItemCountForSection` / `hasFooterInSection`），加上 3 个可覆写的 viewType 钩子。创建/绑定由 `@Builder` 承担。

| 方法 | 签名 | 默认值 |
|---|---|---|
| `getSectionCount` | `abstract getSectionCount(): number` | — |
| `getItemCountForSection` | `abstract getItemCountForSection(section: number): number` | — |
| `hasFooterInSection` | `abstract hasFooterInSection(section: number): boolean` | — |
| `getSectionHeaderViewType` | `getSectionHeaderViewType(section: number): number` | `TYPE_SECTION_HEADER` |
| `getSectionFooterViewType` | `getSectionFooterViewType(section: number): number` | `TYPE_SECTION_FOOTER` |
| `getSectionItemViewType` | `getSectionItemViewType(section: number, position: number): number` | `TYPE_ITEM` |

#### `SimpleSectionedModel`（abstract, extends SectionedModel）

简化分组模型：`hasFooterInSection` 恒返回 `false`，新增 `getSectionHeaderTitle(section)` 抽象方法。配合 `SectionedDefaultHeader` @Builder 即可实现「无 footer、标题 header」的简化形态。

### 数据源

#### `SectionedDataSource implements IDataSource`

| 方法 | 说明 |
|---|---|
| `constructor(model?: SectionedModel)` | 构造并预计算展平索引 |
| `totalCount(): number` | 展平后总条目数 |
| `getData(index: number): SectionEntry` | 取展平条目 |
| `registerDataChangeListener(listener)` / `unregisterDataChangeListener(listener)` | 注册/注销 LazyForEach 监听器 |
| `getModel(): SectionedModel` | 取底层模型 |
| `setModel(model)` | 替换模型并触发 reload |
| `isSectionHeaderPosition(position): boolean` | 该位置是否为 header |
| `isSectionFooterPosition(position): boolean` | 该位置是否为 footer |
| `getSectionForPosition(position): number` | 该位置所属段索引 |
| `getPositionWithinSection(position): number` | 该位置在段内的偏移 |
| `notifySectionReloaded()` | 段形状变化后全量刷新（等价 SectionDataObserver.onChanged → setupIndices） |
| `notifySectionHeaderChanged(section)` | 单段 header 数据变化后局部刷新 |
| `notifySectionItemChanged(section, position)` | 单项数据变化后局部刷新 |
| `notifySectionFooterChanged(section)` | 单段 footer 数据变化后局部刷新 |

### 渲染组件

#### `SectionedList`

线性分组列表，`List + LazyForEach` 驱动，按 `SectionEntry.kind` 分派到 `headerBuilder` / `itemBuilder` / `footerBuilder`。

| 属性 | 类型 | 默认值 | 说明 |
|---|---|---|---|
| `dataSource` | `SectionedDataSource` | 空数据源 | 数据源 |
| `space` | `number` | 0 | ListItem 间距（vp） |
| `cachedCount` | `number` | 1 | 预加载条数 |
| `headerBuilder` | `@BuilderParam (entry: SectionEntry) => void` | 必填 | header 渲染 |
| `itemBuilder` | `@BuilderParam (entry: SectionEntry) => void` | 必填 | item 渲染 |
| `footerBuilder` | `@BuilderParam (entry: SectionEntry) => void` | 空 @Builder | footer 渲染（简化形态可不传） |

#### `SectionedGrid`

分组网格，`Grid + LazyForEach` 驱动，header/footer 通过 `GridItem.columnStart(0).columnEnd(spanCount-1)` 占满整行，item 占单格自动换行。

| 属性 | 类型 | 默认值 | 说明 |
|---|---|---|---|
| `dataSource` | `SectionedDataSource` | 空数据源 | 数据源 |
| `spanCount` | `number` | 2 | 列数 |
| `columnsGap` / `rowsGap` | `number` | 0 | 列/行间距（vp） |
| `cachedCount` | `number` | 1 | 预加载条数 |
| `headerBuilder` / `itemBuilder` / `footerBuilder` | 同 SectionedList | — | 三类渲染 |

### 默认 Header @Builder

#### `SectionedDefaultHeader(title: string)`

复刻 `view_header.xml` 的默认 header：`Row` 高 48vp，`Text` 字色 `#9E9E9E`（可通过资源覆写）、左右 padding 16vp、`maxLines(1)` + `TextOverflow.Ellipsis`、`FontWeight.Bold`、垂直居中。简化形态下可通过 `headerBuilder` 调用此 @Builder 传入 `getSectionHeaderTitle(section)` 的返回值。

### 多 viewType

覆写 `getSectionItemViewType(section, position)` 返回不同数值（避开 `-1/-2/-3` 三个保留值），`SectionEntry.viewType` 字段携带该值传入 `itemBuilder`，@Builder 内可据此分派不同渲染。Demo 的 CountGridPage「Multi ViewType」按钮演示此能力：奇数位 item 返回自定义 `TYPE_HIGHLIGHT=1`，@Builder 内加白边。

## 开源许可

```
Copyright 2015 Tomás Ruiz-López

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
