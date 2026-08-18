/*
 * Copyright (c) 2026. TableFixHeaders HarmonyOS Adaptation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { TableFixHeaders, TableAdapter } from 'tablefixheaders';
import { StyleTableAdapter } from './adapters/StyleTableAdapter';
import { BaseTableAdapter } from 'tablefixheaders';
import { router } from '@kit.ArkUI';

const DEMO_DOMAIN: number = 0x0000;

/**
 * StyleTablePage 演示带表头样式区分的表格。
 * 对应 Android StyleTable Activity。
 * 表头行（row=-1）使用标题样式，数据体使用普通样式。
 */
@Entry
@Component
struct StyleTablePage {
  @State private adapter: TableAdapter = new StyleTableAdapter();
  @State private statusText: string = '表格已加载 - 10行×6列 100×40vp（2种视图类型）';
  @State private dataRefreshCount: number = 0;

  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Text('< 返回')
          .fontSize(14)
          .fontColor('#4A90D9')
          .onClick(() => {
            router.back();
          })

        Text('Style Table')
          .fontSize(17)
          .fontWeight(FontWeight.Bold)
          .fontColor('#1A1A2E')
          .layoutWeight(1)
          .textAlign(TextAlign.Center)

        Text('')
          .fontSize(14)
          .width(50)
      }
      .width('100%')
      .padding({ top: 12, bottom: 8, left: 16, right: 16 })
      .backgroundColor('#FFFFFF')

      // 状态信息
      Row() {
        Text(this.statusText)
          .fontSize(12)
          .fontColor('#666666')
      }
      .width('100%')
      .padding({ top: 6, bottom: 6, left: 16, right: 16 })
      .backgroundColor('#FAFAFA')

      // 表格容器
      Stack() {
        TableFixHeaders({ adapter: this.adapter })
      }
      .layoutWeight(1)
      .width('100%')
      .padding(2)
      .border({ width: 1, color: '#E0E0E0' })
      .margin({ left: 8, right: 8, bottom: 8 })

      // 底部信息
      Column() {
        Text('特征说明')
          .fontSize(13)
          .fontWeight(FontWeight.Medium)
          .fontColor('#666666')
          .margin({ bottom: 6 })

        Text('表头行（蓝紫色背景）与数据体（淡蓝色背景）使用不同视图类型（getItemViewType=0/1）。\n触摸拖动双向滚动，含惯性滑动与边界阴影。')
          .fontSize(12)
          .fontColor('#999999')
          .lineHeight(18)
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#F8F8F8')
      .borderRadius({ topLeft: 12, topRight: 12 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F6FA')
  }
}
