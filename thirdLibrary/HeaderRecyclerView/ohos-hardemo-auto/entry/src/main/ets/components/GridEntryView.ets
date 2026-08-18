/*
 * Copyright (C) 2015 Karumi.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { HeaderRecyclerViewEntry, ItemCategory } from 'header_recycler_view';

/**
 * F-02 网格用例共享的条目渲染 Builder（全局 @Builder，无 this 依赖）。
 *
 * HAR 的 HeaderSpanSizeLookup 是纯逻辑跨列计算器，本身不渲染。各 F-02 用例页面
 * 内联原始 ArkUI Grid（作为渲染验证预览组件）+ HeaderSpanSizeLookup 产出
 * GridLayoutOptions，本 Builder 负责按 entry.category 渲染头部 / 普通条目 / 尾部，
 * 使 HAR 的 span 计算能力以可见布局呈现。
 */
@Builder
export function GridEntryView(entry: HeaderRecyclerViewEntry<string, string, string>): void {
  if (entry.category === ItemCategory.HEADER) {
    Row() {
      Text('头部（占满整行）')
        .fontSize(14)
        .fontColor('#FFFFFFFF')
        .fontWeight(FontWeight.Medium)
        .layoutWeight(1)
      Text(entry.headerData === null ? '' : entry.headerData)
        .fontSize(13)
        .fontColor('#FFFFFFFF')
    }
    .width('100%')
    .height(64)
    .padding({ left: 12, right: 12 })
    .backgroundColor('#1565C0')
    .borderRadius(8)
    .justifyContent(FlexAlign.SpaceBetween)
  } else if (entry.category === ItemCategory.FOOTER) {
    Row() {
      Text('尾部（占满整行）')
        .fontSize(14)
        .fontColor('#FFFFFFFF')
        .fontWeight(FontWeight.Medium)
        .layoutWeight(1)
      Text(entry.footerData === null ? '' : entry.footerData)
        .fontSize(13)
        .fontColor('#FFFFFFFF')
    }
    .width('100%')
    .height(64)
    .padding({ left: 12, right: 12 })
    .backgroundColor('#546E7A')
    .borderRadius(8)
    .justifyContent(FlexAlign.SpaceBetween)
  } else {
    Column() {
      Text('普通条目')
        .fontSize(11)
        .fontColor('#FF9E9E9E')
        .margin({ bottom: 4 })
      Text(entry.itemData === null ? '' : entry.itemData)
        .fontSize(15)
        .fontColor('#FF212121')
        .fontWeight(FontWeight.Medium)
    }
    .width('100%')
    .height(96)
    .padding(8)
    .backgroundColor(Color.White)
    .borderRadius(8)
    .justifyContent(FlexAlign.Center)
  }
}
