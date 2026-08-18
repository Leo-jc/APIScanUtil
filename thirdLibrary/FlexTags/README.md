如果在使用过程中有任何问题，可以在GitCode提Issue，会及时跟进。issue地址：[issues](https://gitcode.com/ohos_third_party_lib/FlexTags/issues)。

# FlexTags

基于 https://github.com/chockqiu/FlexTags 开发，适配鸿蒙版本

一个 HarmonyOS（ArkTS）标签弹性布局控件，支持标签云、热门标签、兴趣标签、热门搜索词等场景。基于 ArkUI `Flex` 组件实现弹性排列与自动换行，配合自定义 `FlexTagsAdapter` 模式按数据源循环渲染标签子项。

## 目录结构

```
FlexTags/
├── ohos_library/                    # HAR 源码（弹性标签布局库）
│   ├── src/main/ets/
│   │   ├── adapter/
│   │   │   └── FlexTagsAdapter.ets   # Adapter 抽象基类 + ItemView + Controller
│   │   └── components/
│   │       └── FlexTags.ets           # FlexTags 容器组件
│   ├── Index.ets                      # 公开 API 导出
│   ├── oh-package.json5               # name: "flex_tags"
│   └── src/main/module.json5          # module.name: "flex_tags"
├── ohos_hardemo/                     # Demo 应用
│   ├── entry/src/main/ets/
│   │   ├── pages/
│   │   │   ├── Index.ets              # 热门搜索主页
│   │   │   ├── SelectSimplePage.ets   # 兴趣标签选中示例
│   │   │   └── EditSimplePage.ets     # 个人标签编辑示例
│   │   └── model/
│   │       ├── SelectBean.ets         # 选中数据模型
│   │       └── ItemViews.ets          # 标签项视图数据 + Adapter 实现类
│   ├── build-profile.json5           # 通过 srcPath: "../ohos_library" 引入 HAR 模块（name: "flex_tags"）
│   └── oh-package.json5              # 通过 "flex_tags": "file:../ohos_library" 声明本地依赖
└── .ohos-adaptation/                 # 适配文档
```

## 环境要求

- HarmonyOS compatibleSdkVersion ≥ 5.1.1(19)
- DevEco Studio（含 hvigor + ohpm 工具链）

## 快速开始

1. 在你的 HarmonyOS 工程的 `oh-package.json5` 中添加依赖：

```json5
{
  "dependencies": {
    "flex_tags": "file:../ohos_library"
  }
}
```

2. 在 `build-profile.json5` 的 `modules` 中引入 HAR 模块：

```json5
{
  "modules": [
    { "name": "entry", "srcPath": "./entry", "targets": [{ "name": "default", "applyToProducts": ["default"] }] },
    { "name": "flex_tags", "srcPath": "../ohos_library" }
  ]
}
```

3. 在代码中使用：

```typescript
import { FlexTags, FlexTagsAdapter, FlexTagsController, FlexTagsItemView } from 'flex_tags';

// 1. 定义标签项视图数据
class MyTagView extends FlexTagsItemView {
  text: string = '';
  constructor() {
    super();
    this.text = '';
  }
}

// 2. 实现 Adapter
class MyAdapter extends FlexTagsAdapter {
  tags: string[] = [];

  onCreateView(): FlexTagsItemView {
    return new MyTagView();
  }

  onBindView(view: FlexTagsItemView, position: number): void {
    let item = view as MyTagView;
    item.text = this.tags[position];
  }

  getItemCount(): number {
    return this.tags.length;
  }
}

// 3. 在页面中使用 FlexTags
@Component
struct MyPage {
  private adapter: MyAdapter = new MyAdapter();
  private controller: FlexTagsController = new FlexTagsController();

  aboutToAppear(): void {
    this.adapter.tags = ['标签1', '标签2', '标签3'];
  }

  @Builder
  itemBuilder(view: FlexTagsItemView): void {
    Text((view as MyTagView).text)
      .fontSize(14)
      .backgroundColor('#F5F7FA')
      .borderRadius(16)
      .padding({ left: 12, right: 12, top: 6, bottom: 6 })
      .margin(6)
  }

  build() {
    FlexTags({
      controller: this.controller,
      adapter: this.adapter,
      itemBuilder: this.itemBuilder,
      options: {
        direction: FlexDirection.Row,
        wrap: FlexWrap.Wrap,
        justifyContent: FlexAlign.Start,
      },
    })
  }
}
```

4. 数据变更后调用 `notifyDataSetChanged()` 刷新：

```typescript
this.adapter.tags = ['新标签1', '新标签2'];
this.adapter.notifyDataSetChanged();
```

## API 参考

### FlexTags（容器组件）

| 属性/方法 | 类型 | 说明 |
|-----------|------|------|
| `controller` | `FlexTagsController` | 外部控制句柄，提供 setAdapter/getAdapter |
| `adapter` | `FlexTagsAdapter` | 初始 Adapter，也可后续通过 controller 设置 |
| `itemBuilder` | `@BuilderParam` | 标签项渲染函数，由使用方提供 |
| `options.direction` | `FlexDirection` | 主轴方向，默认 Row |
| `options.wrap` | `FlexWrap` | 换行方式，默认 Wrap |
| `options.justifyContent` | `FlexAlign` | 主轴对齐，默认 Start |
| `options.alignItems` | `ItemAlign` | 交叉轴对齐，默认 Start |
| `options.alignContent` | `FlexAlign` | 多行交叉轴对齐，默认 Start |

### FlexTagsAdapter（数据适配器基类）

| 方法 | 签名 | 说明 |
|------|------|------|
| `onCreateView()` | `abstract onCreateView(): FlexTagsItemView` | 创建标签项视图数据 |
| `onBindView(view, position)` | `abstract onBindView(view: FlexTagsItemView, position: number): void` | 按位置绑定数据 |
| `getItemCount()` | `abstract getItemCount(): number` | 返回标签总数 |
| `notifyDataSetChanged()` | `notifyDataSetChanged(): void` | 通知数据已变更，触发容器整体重建 |

### FlexTagsController（外部控制句柄）

| 方法 | 说明 |
|------|------|
| `setAdapter(adapter)` | 设置/替换/清空 Adapter（传 null 清空） |
| `getAdapter()` | 获取当前已挂载的 Adapter |

### FlexTagsItemView（标签项视图数据基类）

继承此类扩展自定义字段，由 `@Builder` 读取并渲染。

## 开源许可

Apache License 2.0
