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

import { DataChangeCallback } from './DataSetObserver';

/**
 * 表示该单元格不参与视图回收。
 * 替代 Android TableAdapter.IGNORE_ITEM_VIEW_TYPE = -1。
 */
export const IGNORE_ITEM_VIEW_TYPE: number = -1;

/**
 * TableAdapter 是 TableFixHeaders 与底层数据之间的桥梁。
 * 宿主实现此接口以提供表格的行列数、尺寸和单元格内容。
 *
 * 替代 Android com.inqbarna.tablefixheaders.adapters.TableAdapter。
 */
export interface TableAdapter {
  /**
   * 数据行数（不含表头行）。
   */
  getRowCount(): number;

  /**
   * 数据列数（不含表头列）。
   */
  getColumnCount(): number;

  /**
   * 获取单元格视图定义。
   * 在 ArkUI 中，实际单元格渲染通过 @BuilderParam 模式消费。
   * @param row 行索引（-1 表示表头行）
   * @param column 列索引（-1 表示表头列）
   * @returns 单元格定义（object 占位，WU-002 定义具体消费模式）
   */
  getView(row: number, column: number): object;

  /**
   * 返回列宽（像素/vp）。
   * @param column 列索引（-1 表示行标题列宽）
   */
  getWidth(column: number): number;

  /**
   * 返回行高（像素/vp）。
   * @param row 行索引（-1 表示列标题行高）
   */
  getHeight(row: number): number;

  /**
   * 返回指定单元格的视图类型。
   * 用于视图回收分类（WU-002 Recycler 使用）。
   * 返回值应在 0 到 getViewTypeCount()-1 之间，或返回 IGNORE_ITEM_VIEW_TYPE。
   */
  getItemViewType(row: number, column: number): number;

  /**
   * 返回指定单元格的背景颜色。
   * 空字符串表示使用组件默认颜色。
   * @param row 行索引（-1 表示表头行）
   * @param column 列索引（-1 表示表头列）
   */
  getCellBackground(row: number, column: number): string;

  /**
   * 返回视图类型总数。
   */
  getViewTypeCount(): number;

  /**
   * 注册数据变更观察者回调。
   */
  registerDataSetObserver(observer: DataChangeCallback): void;

  /**
   * 注销数据变更观察者回调。
   */
  unregisterDataSetObserver(observer: DataChangeCallback): void;
}
