如果在使用过程中有任何问题，可以在GitCode提Issue，会及时跟进。issue地址：[issues](https://gitcode.com/ohos_third_party_lib/TableFixHeaders/issues)。

# TableFixHeaders

基于 [InQBarna/TableFixHeaders](https://github.com/InQBarna/TableFixHeaders) 开发，适配鸿蒙版本。

TableFixHeaders 是一个 HarmonyOS（ArkTS）自定义组件库，提供**带有固定表头（行列标题）的双向滚动表格**控件。宿主通过 `TableAdapter` 接口提供行列数、行高列宽和单元格视图；控件自动处理滚动、视图回收、惯性滑动和边界阴影提示。

## 功能特性

- 固定行表头 + 列表头的双向滚动数据表格
- 触摸拖拽滚动 + 惯性滑动动画
- 视图回收复用机制（按 viewType 缓存）
- 四方向滚动边界渐变阴影指示器
- 列宽均衡缩放（EXACTLY 模式）
- `notifyDataSetChanged()` 数据刷新支持
- 多种视图类型支持

## 环境要求

- DevEco Studio / HarmonyOS SDK
- 最低兼容版本：详见 `ohos-hardemo` 工程配置
- 构建工具：hvigor（建议随 DevEco Studio 安装）

## 编译依赖

```json5
{
  "dependencies": {
    // 无外部 ohpm 依赖
  }
}
```

HAR 模块通过 `oh-package.json5` 中的 `main: "Index.ets"` 导出公开 API。

## 快速开始 / 安装

### 方式一：本地 HAR 依赖

```json5
// ohos-hardemo/entry/oh-package.json5
{
  "dependencies": {
    "tablefixheaders": "file:../library"
  }
}
```

### 方式二：HAR 产物引用

将 `library/build/default/outputs/default/library.har` 复制到目标工程，在 `oh-package.json5` 中添加：

```json5
{
  "dependencies": {
    "tablefixheaders": "file:./libs/library.har"
  }
}
```

### 初始化步骤

```bash
cd ohos-hardemo
ohpm install
hvigorw -e assembleHap --mode module -p product=default -p buildMode=debug --no-daemon
```

HAP 产物位于 `entry/build/default/outputs/default/entry-default-unsigned.hap`。

## 初始化和宿主接入

### 1. 实现 TableAdapter 接口

```typescript
import { TableFixHeaders, TableAdapter, BaseTableAdapter, IGNORE_ITEM_VIEW_TYPE } from 'tablefixheaders';

class MyAdapter extends BaseTableAdapter {
  getRowCount(): number { return 10; }
  getColumnCount(): number { return 5; }
  getView(row: number, col: number): object { return ''; }
  getWidth(col: number): number { return 100; }
  getHeight(row: number): number { return 40; }
  getItemViewType(row: number, col: number): number { return 0; }
  getViewTypeCount(): number { return 1; }
}
```

### 2. 在页面中使用 TableFixHeaders

```typescript
import { TableFixHeaders, TableAdapter } from 'tablefixheaders';

@Entry
@Component
struct MyPage {
  private adapter: MyAdapter = new MyAdapter();

  build() {
    Stack() {
      TableFixHeaders({ adapter: this.adapter })
        .width('100%')
        .height('100%')
    }
  }
}
```

## API 参考

### 控件 API（TableFixHeaders）

| API | 签名 | 说明 |
|-----|------|------|
| `TableFixHeaders(Context)` | 构造 | 通过 Builder 创建 |
| `getAdapter()` | `TableAdapter` | 获取当前适配器 |
| `setAdapter(adapter)` | `void` | 设置适配器，触发重新布局 |
| `scrollTo(x, y)` | `void` | 滚动到指定像素位置 |
| `scrollBy(x, y)` | `void` | 相对当前位置滚动 |
| `getActualScrollX()` | `number` | 实际水平滚动偏移 |
| `getActualScrollY()` | `number` | 实际垂直滚动偏移 |

### 适配器接口（TableAdapter）

| API | 说明 |
|-----|------|
| `getRowCount()` | 数据行数 |
| `getColumnCount()` | 数据列数 |
| `getView(row, col)` | 获取单元格视图 |
| `getWidth(col)` | 列宽（vp） |
| `getHeight(row)` | 行高（vp） |
| `getItemViewType(row, col)` | 单元格视图类型 |
| `getViewTypeCount()` | 视图类型总数 |
| `registerDataSetObserver(cb)` | 注册数据变化监听 |
| `unregisterDataSetObserver(cb)` | 注销数据变化监听 |
| `IGNORE_ITEM_VIEW_TYPE` | 常量 `-1`，表示不参与视图回收 |

### 适配器基础实现（BaseTableAdapter）

| API | 说明 |
|-----|------|
| `registerDataSetObserver(cb)` | 注册观察者 |
| `unregisterDataSetObserver(cb)` | 注销观察者 |
| `notifyDataSetChanged()` | 通知数据变化，触发表格重绘 |
| `notifyDataSetInvalidated()` | 标记数据失效 |

## 已支持能力

- 固定行/列表头的双向滚动表格控件
- 触摸拖拽滚动 + 惯性滑动（`animateTo` + 物理衰减曲线）
- 视图回收复用（Map-based `Recycler` 缓存池）
- 四方向滚动边界渐变阴影
- 多种视图类型支持（`getItemViewType`/`getViewTypeCount`）
- 数据变更通知（`notifyDataSetChanged()`）
- 列宽均衡缩放
- 滚动边界限制

## 未支持/裁剪能力

| 能力 | 类型 | 原因 |
|------|------|------|
| 滚动条指示器 | 裁剪 | Android 版从未显示，不迁移 |
| View convertView 参数 | 裁剪 | ArkUI 无 View 回收概念 |
| ViewGroup parent 参数 | 裁剪 | ArkUI 无 ViewGroup 类型 |
| DataSetObserver.onInvalidated() | 裁剪 | Android 实现为空操作 |
| XML 属性声明构造 | 延后 | ArkUI 不支持 XML，通过构造参数配置 |

## Demo 运行方式

HAR 库附带一个完整的 Demo 应用（`ohos-hardemo/entry`），提供三个演示页面：

```bash
cd ohos-hardemo
ohpm install
hvigorw -e assembleHap --mode module -p product=default -p buildMode=debug --no-daemon
hdc install entry/build/default/outputs/default/entry-default-unsigned.hap
```

启动应用后从首页选择以下入口：
1. **Simple adapter** — 简单均匀矩阵表格（8 行 × 6 列，均匀 110×32vp）
2. **Style adapter** — 样式化表格（10 行 × 6 列，渐变表头，2 种视图类型）
3. **Family adapter** — 分组设备信息表（3 家族分组，5 种视图类型）

## 如何贡献

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/your-feature`)
3. 提交修改 (`git commit -am 'Add your feature'`)
4. 推送到分支 (`git push origin feature/your-feature`)
5. 创建 Pull Request

## 开源许可

```
Copyright 2012-2013 InQBarna

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
