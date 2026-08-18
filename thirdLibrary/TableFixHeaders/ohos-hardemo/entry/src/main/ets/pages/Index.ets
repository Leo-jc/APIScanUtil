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

import { router } from '@kit.ArkUI';

const TAG: string = 'TableFixHeadersDemo';
const DEMO_DOMAIN: number = 0x0000;

/**
 * 主页导航菜单。
 * 对应 Android MainActivity 中的 ListView 导航。
 */
@Entry
@Component
struct Index {
  @State private demos: DemoEntry[] = [
    { name: 'Simple adapter', description: '简单均匀矩阵表格 8×6', page: 'pages/SimpleTablePage' },
    { name: 'Style adapter', description: '样式化表格（渐变表头）10×6', page: 'pages/StyleTablePage' },
    { name: 'Family adapter', description: '分组设备信息表格', page: 'pages/FamilyTablePage' },
  ];

  build() {
    Column() {
      // 标题区域
      Row() {
        Text('TableFixHeaders Demo')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#1A1A2E')
      }
      .width('100%')
      .padding({ top: 24, bottom: 12, left: 20, right: 20 })

      // 副标题
      Text('请选择表格演示模式')
        .fontSize(14)
        .fontColor('#666666')
        .width('100%')
        .padding({ left: 20, bottom: 16 })

      // Demo 列表
      List({ space: 12 }) {
        ForEach(this.demos, (item: DemoEntry, index: number) => {
          ListItem() {
            Stack() {
              // 卡片背景
              Row()
                .width('100%')
                .height(80)
                .borderRadius(12)
                .backgroundColor('#FFFFFF')
                .shadow({
                  radius: 8,
                  offsetX: 0,
                  offsetY: 2,
                  color: 'rgba(0, 0, 0, 0.08)'
                })

              // 内容
              Row() {
                // 序号
                Text(String(index + 1))
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#4A90D9')
                  .width(36)
                  .textAlign(TextAlign.Center)

                Column() {
                  Text(item.name)
                    .fontSize(16)
                    .fontWeight(FontWeight.Medium)
                    .fontColor('#333333')
                    .lineHeight(22)

                  Text(item.description)
                    .fontSize(13)
                    .fontColor('#999999')
                    .lineHeight(18)
                    .margin({ top: 4 })
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)

                // 箭头
                Text('>')
                  .fontSize(20)
                  .fontColor('#CCCCCC')
                  .width(24)
                  .textAlign(TextAlign.Center)
              }
              .width('100%')
              .height('100%')
              .padding({ left: 16, right: 12 })
            }
            .width('100%')
            .height(80)
          }
          .onClick(() => {
            this.navigateTo(item.page);
          })
        }, (item: DemoEntry, index: number) => {
          return item.page;
        })
      }
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 16, right: 16, bottom: 16 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F6FA')
  }

  private navigateTo(page: string): void {
    router.pushUrl({
      url: page
    }).then(() => {
      // 导航成功
    }).catch((err: Error) => {
      const errorMsg: string = '导航失败: ' + err.message;
      // 导航失败处理
    });
  }
}

interface DemoEntry {
  name: string;
  description: string;
  page: string;
}
