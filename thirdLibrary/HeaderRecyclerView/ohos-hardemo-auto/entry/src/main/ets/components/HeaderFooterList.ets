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

import {
  HeaderRecyclerViewDataSource,
  HeaderRecyclerViewEntry,
  ItemCategory
} from 'header_recycler_view';

/**
 * F-01 测试用例共享的列表视觉层。
 *
 * HAR（HeaderRecyclerViewDataSource）是纯逻辑数据控制器，本身不渲染任何 UI。
 * 当用例 checkpoint/expected_result 含「列表区域：头部/普通条目/尾部出现」等
 * 视觉展示语义时，依据 Demo 编码规范 > 渲染验证，须在页面挂载视觉组件渲染展示，
 * 禁止仅把 getData() dump 到 result 文本冒充渲染。
 *
 * 本组件接收一个 HeaderRecyclerViewDataSource 实例（string 三段泛型），用
 * LazyForEach 驱动 ArkUI List，并按控制器 getItemCategory(position) 返回的类别
 * 分别渲染头部 / 普通条目 / 尾部，使 HAR 数据存取与位置/类别分派能力可见。
 */
@Component
export struct HeaderFooterList {
  dataSource: HeaderRecyclerViewDataSource<string, string, string> =
    new HeaderRecyclerViewDataSource<string, string, string>();

  private makeEntryKey(entry: HeaderRecyclerViewEntry<string, string, string>): string {
    if (entry.category === ItemCategory.HEADER) {
      return entry.position.toString() + '-header-' + (entry.headerData === null ? '' : entry.headerData);
    }
    if (entry.category === ItemCategory.FOOTER) {
      return entry.position.toString() + '-footer-' + (entry.footerData === null ? '' : entry.footerData);
    }
    return entry.position.toString() + '-item-' + (entry.itemData === null ? '' : entry.itemData);
  }

  @Builder
  entryContent(entry: HeaderRecyclerViewEntry<string, string, string>): void {
    if (entry.category === ItemCategory.HEADER) {
      Row() {
        Text('头部')
          .fontSize(13)
          .fontColor('#FFFFFFFF')
          .backgroundColor('#1565C0')
          .padding({ left: 6, right: 6, top: 2, bottom: 2 })
          .borderRadius(4)
          .margin({ right: 8 })
        Text(entry.headerData === null ? '' : entry.headerData)
          .fontSize(14)
          .fontColor('#0D47A1')
          .layoutWeight(1)
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#E3F2FD')
      .borderRadius(8)
    } else if (entry.category === ItemCategory.FOOTER) {
      Row() {
        Text('尾部')
          .fontSize(13)
          .fontColor('#FFFFFFFF')
          .backgroundColor('#546E7A')
          .padding({ left: 6, right: 6, top: 2, bottom: 2 })
          .borderRadius(4)
          .margin({ right: 8 })
        Text(entry.footerData === null ? '' : entry.footerData)
          .fontSize(14)
          .fontColor('#37474F')
          .layoutWeight(1)
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#ECEFF1')
      .borderRadius(8)
    } else {
      Row() {
        Text('普通条目')
          .fontSize(12)
          .fontColor('#FF666666')
          .margin({ right: 8 })
        Text(entry.itemData === null ? '' : entry.itemData)
          .fontSize(14)
          .fontColor('#212121')
          .layoutWeight(1)
      }
      .width('100%')
      .padding(12)
      .backgroundColor(Color.White)
      .borderRadius(8)
    }
  }

  build(): void {
    List({ space: 8 }) {
      LazyForEach(this.dataSource, (entry: HeaderRecyclerViewEntry<string, string, string>) => {
        ListItem() {
          this.entryContent(entry)
        }
      }, (entry: HeaderRecyclerViewEntry<string, string, string>) => this.makeEntryKey(entry))
    }
    .width('100%')
    .height('100%')
    .padding({ left: 4, right: 4, top: 4, bottom: 4 })
    .backgroundColor('#F0F0F0')
    .scrollBar(BarState.Auto)
    .edgeEffect(EdgeEffect.Spring)
  }
}
