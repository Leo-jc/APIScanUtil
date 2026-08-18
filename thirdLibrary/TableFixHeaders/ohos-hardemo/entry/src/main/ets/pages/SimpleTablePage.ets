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
import { MatrixTableAdapter } from './adapters/MatrixTableAdapter';
import { router } from '@kit.ArkUI';

const DEMO_DOMAIN: number = 0x0000;

/**
 * SimpleTablePage 演示简单均匀矩阵表格。
 * 对应 Android SimpleTable Activity。
 * 数据：8行×6列，统一 110vp×32vp 单元格。
 */
@Entry
@Component
struct SimpleTablePage {
  @State private adapter: TableAdapter = this.createAdapter();
  @State private refreshKey: number = 0;
  @State private statusText: string = '表格已加载 - 8行×6列 110×32vp';

  private createAdapter(): TableAdapter {
    const data: string[][] = [
      ['Col 1', 'Col 2', 'Col 3', 'Col 4', 'Col 5', 'Col 6'],
      ['Lorem', 'sed', 'do', 'eiusmod', 'tempor', 'incididunt'],
      ['ipsum', 'irure', 'occaecat', 'enim', 'laborum', 'reprehenderit'],
      ['dolor', 'fugiat', 'nulla', 'reprehenderit', 'laborum', 'consequat'],
      ['sit', 'consequat', 'laborum', 'fugiat', 'eiusmod', 'enim'],
      ['amet', 'nulla', 'Excepteur', 'voluptate', 'occaecat', 'et'],
      ['consectetur', 'occaecat', 'fugiat', 'dolore', 'consequat', 'eiusmod'],
      ['adipisicing', 'fugiat', 'Excepteur', 'occaecat', 'fugiat', 'laborum'],
      ['elit', 'voluptate', 'reprehenderit', 'Excepteur', 'fugiat', 'nulla'],
    ];
    return new MatrixTableAdapter(data);
  }

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

        Text('Simple Table')
          .fontSize(17)
          .fontWeight(FontWeight.Bold)
          .fontColor('#1A1A2E')
          .layoutWeight(1)
          .textAlign(TextAlign.Center)

        // 占位保持对称
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

      // 操作区域
      Column() {
        Text('操作说明')
          .fontSize(13)
          .fontWeight(FontWeight.Medium)
          .fontColor('#666666')
          .margin({ bottom: 6 })

        Text('触摸拖动表格内容可双向滚动，松手后有惯性滑动效果。\n滚动到边界显示渐隐阴影提示。')
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
