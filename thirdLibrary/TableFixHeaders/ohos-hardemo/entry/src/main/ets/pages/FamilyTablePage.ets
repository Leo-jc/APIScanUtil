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
import { FamilyTableAdapter } from './adapters/FamilyTableAdapter';
import { BaseTableAdapter } from 'tablefixheaders';
import { router } from '@kit.ArkUI';

const DEMO_DOMAIN: number = 0x0000;

/**
 * FamilyTablePage 演示分组结构的设备信息表格。
 * 对应 Android FamilyTable Activity。
 * 包含家族行（绿色）、交替数据行颜色、多列宽、5种视图类型。
 */
@Entry
@Component
struct FamilyTablePage {
  @State private adapter: TableAdapter = new FamilyTableAdapter();
  @State private statusText: string = 'Nexus 设备信息表（3个家族分组，5种视图类型）';

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

        Text('Family Table')
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

      // 图例说明
      Column() {
        Text('颜色说明')
          .fontSize(13)
          .fontWeight(FontWeight.Medium)
          .fontColor('#666666')
          .margin({ bottom: 6 })

        Text('• 粉灰色 = 表头行/角标\n• 浅黄/浅蓝交替 = 数据行\n• 绿色 = 家族分组行\n• 各列宽度不同（60~140vp）')
          .fontSize(12)
          .fontColor('#999999')
          .lineHeight(20)
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
