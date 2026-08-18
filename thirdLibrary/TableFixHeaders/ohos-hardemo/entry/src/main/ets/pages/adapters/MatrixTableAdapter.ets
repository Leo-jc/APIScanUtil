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
const WIDTH: number = 110;
const HEIGHT: number = 32;
const ONE_VIEW_TYPE: number = 1;
const HEADER_INDEX: number = -1;
const FIRST_DATA_INDEX: number = 0;
const DATA_OFFSET: number = 1;

/**
 * MatrixTableAdapter 提供简单矩阵表格数据。
 * 对应 Android SimpleTable 中的 MatrixTableAdapter。
 */
export class MatrixTableAdapter extends BaseTableAdapter {
  private data: string[][];

  constructor(data: string[][]) {
    super();
    this.data = data;
  }

  getRowCount(): number {
    return this.data.length - DATA_OFFSET;
  }

  getColumnCount(): number {
    if (this.data.length > FIRST_DATA_INDEX) {
      return this.data[FIRST_DATA_INDEX].length - DATA_OFFSET;
    }
    return FIRST_DATA_INDEX;
  }

  getView(row: number, column: number): object {
    const r: number = row + DATA_OFFSET;
    const c: number = column + DATA_OFFSET;
    if (r > HEADER_INDEX && r < this.data.length && c > HEADER_INDEX && c < this.data[r].length) {
      return new CellItem(this.data[r][c]);
    }
    return new CellItem('');
  }

  getWidth(column: number): number {
    return WIDTH;
  }

  getHeight(row: number): number {
    return HEIGHT;
  }
}
