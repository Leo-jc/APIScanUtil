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

import { BaseTableAdapter } from 'tablefixheaders';
import { CellItem } from './CellItem';

// ---- 常量定义 ----
const WIDTH: number = 100;
const HEIGHT: number = 40;
const ROWS: number = 10;
const COLS: number = 6;
const HEADER_VIEW_TYPE: number = 0;
const DATA_VIEW_TYPE: number = 1;
const TWO_VIEW_TYPES: number = 2;
const HEADER_ROW: number = -1;
const BG_HEADER: string = '#AABFFE';
const BG_DATA: string = '#E0E6FF';

/**
 * StyleTableAdapter 为样式化表格提供数据，支持表头/数据两种视图类型。
 * 对应 Android StyleTable 中的 MyAdapter。
 */
export class StyleTableAdapter extends BaseTableAdapter {
  getRowCount(): number {
    return ROWS;
  }

  getColumnCount(): number {
    return COLS;
  }

  getView(row: number, column: number): object {
    if (row === HEADER_ROW || column === HEADER_ROW) {
      if (row === HEADER_ROW && column === HEADER_ROW) {
        return new CellItem('');
      }
      if (row === HEADER_ROW) {
        return new CellItem('Col ' + column);
      }
      return new CellItem('Row ' + row);
    }
    return new CellItem('Lorem (' + row + ', ' + column + ')');
  }

  getCellBackground(row: number, column: number): string {
    if (row === HEADER_ROW || column === HEADER_ROW) {
      return BG_HEADER;
    }
    return BG_DATA;
  }

  getWidth(column: number): number {
    return WIDTH;
  }

  getHeight(row: number): number {
    return HEIGHT;
  }

  getItemViewType(row: number, column: number): number {
    if (row === HEADER_ROW) {
      return HEADER_VIEW_TYPE;
    }
    return DATA_VIEW_TYPE;
  }

  getViewTypeCount(): number {
    return TWO_VIEW_TYPES;
  }
}
