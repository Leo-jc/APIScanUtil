/*
 * Copyright (c) 2026. TableFixHeaders HarmonyOS Demo
 *
 * Mock adapter implementations for test case pages.
 * Licensed under the Apache License, Version 2.0.
 */

import { TableAdapter, BaseTableAdapter, IGNORE_ITEM_VIEW_TYPE } from 'tablefixheaders';

export interface CellView {
  type: string;
  text: string;
}

// ---- 简单均匀矩阵适配器（data含表头行+8行数据，getRowCount返回8行） ----
export class SimpleTableAdapter extends BaseTableAdapter {
  private data: string[][] = [
    ['Col 1', 'Col 2', 'Col 3', 'Col 4', 'Col 5', 'Col 6'],
    ['Row1C1', 'Row1C2', 'Row1C3', 'Row1C4', 'Row1C5', 'Row1C6'],
    ['Row2C1', 'Row2C2', 'Row2C3', 'Row2C4', 'Row2C5', 'Row2C6'],
    ['Row3C1', 'Row3C2', 'Row3C3', 'Row3C4', 'Row3C5', 'Row3C6'],
    ['Row4C1', 'Row4C2', 'Row4C3', 'Row4C4', 'Row4C5', 'Row4C6'],
    ['Row5C1', 'Row5C2', 'Row5C3', 'Row5C4', 'Row5C5', 'Row5C6'],
    ['Row6C1', 'Row6C2', 'Row6C3', 'Row6C4', 'Row6C5', 'Row6C6'],
    ['Row7C1', 'Row7C2', 'Row7C3', 'Row7C4', 'Row7C5', 'Row7C6'],
    ['Row8C1', 'Row8C2', 'Row8C3', 'Row8C4', 'Row8C5', 'Row8C6'],
  ];

  getRowCount(): number {
    return this.data.length - 1;
  }

  getColumnCount(): number {
    return this.data.length > 0 ? this.data[0].length : 0;
  }

  getView(row: number, column: number): CellView {
    if (row === -1 && column === -1) {
      return { type: 'corner', text: '' };
    }
    if (row === -1) {
      return { type: 'header', text: this.data[0][column] };
    }
    if (column === -1) {
      return { type: 'rowHeader', text: 'R-' + (row + 1) };
    }
    return { type: 'cell', text: this.data[row + 1][column] };
  }

  getWidth(column: number): number {
    return 110;
  }

  getHeight(row: number): number {
    return 32;
  }
}

// ---- 大尺寸适配器（更多行列用于滚动测试） ----
export class BigTableAdapter extends BaseTableAdapter {
  private rowCount: number = 20;
  private colCount: number = 10;

  getRowCount(): number {
    return this.rowCount;
  }

  getColumnCount(): number {
    return this.colCount;
  }

  getView(row: number, column: number): CellView {
    if (row === -1 && column === -1) {
      return { type: 'corner', text: '' };
    }
    if (row === -1) {
      return { type: 'header', text: 'Col' + (column + 1) };
    }
    if (column === -1) {
      return { type: 'rowHeader', text: 'Row' + (row + 1) };
    }
    return { type: 'cell', text: '(' + row + ',' + column + ')' };
  }

  getWidth(column: number): number {
    return 100;
  }

  getHeight(row: number): number {
    return 36;
  }
}

// ---- 切换适配器（用于测试 setAdapter 切换） ----
export class AlternateTableAdapter extends BaseTableAdapter {
  private rowCount: number = 5;
  private colCount: number = 4;

  getRowCount(): number {
    return this.rowCount;
  }

  getColumnCount(): number {
    return this.colCount;
  }

  getView(row: number, column: number): CellView {
    if (row === -1 && column === -1) {
      return { type: 'corner', text: '' };
    }
    if (row === -1) {
      return { type: 'header', text: 'AltCol' + (column + 1) };
    }
    if (column === -1) {
      return { type: 'rowHeader', text: 'AltRow' + (row + 1) };
    }
    return { type: 'cell', text: 'Alt(' + row + ',' + column + ')' };
  }

  getWidth(column: number): number {
    return 120;
  }

  getHeight(row: number): number {
    return 40;
  }
}

// ---- 空数据适配器（行数为0） ----
export class EmptyRowAdapter extends BaseTableAdapter {
  getRowCount(): number {
    return 0;
  }
  getColumnCount(): number {
    return 5;
  }
  getView(row: number, column: number): CellView {
    return { type: 'cell', text: '' };
  }
  getWidth(column: number): number {
    return 100;
  }
  getHeight(row: number): number {
    return 40;
  }
}

// ---- 空数据适配器（列数为0） ----
export class EmptyColumnAdapter extends BaseTableAdapter {
  getRowCount(): number {
    return 5;
  }
  getColumnCount(): number {
    return 0;
  }
  getView(row: number, column: number): CellView {
    return { type: 'cell', text: '' };
  }
  getWidth(column: number): number {
    return 100;
  }
  getHeight(row: number): number {
    return 40;
  }
}

// ---- 越界视图类型适配器 ----
export class OutOfBoundsViewTypeAdapter extends BaseTableAdapter {
  private normalData: string[][] = [
    ['A1', 'B1', 'C1'],
    ['A2', 'B2', 'C2'],
    ['A3', 'B3', 'C3'],
  ];
  private shouldReturnOutOfBounds: boolean = false;

  setOutOfBoundsMode(enabled: boolean): void {
    this.shouldReturnOutOfBounds = enabled;
  }

  getRowCount(): number {
    return 3;
  }
  getColumnCount(): number {
    return 3;
  }
  getView(row: number, column: number): CellView {
    if (row === -1 && column === -1) {
      return { type: 'corner', text: '' };
    }
    if (row === -1) {
      return { type: 'header', text: 'C' + (column + 1) };
    }
    if (column === -1) {
      return { type: 'rowHeader', text: 'R' + (row + 1) };
    }
    return { type: 'cell', text: this.normalData[row][column] };
  }
  getWidth(column: number): number {
    return 100;
  }
  getHeight(row: number): number {
    return 36;
  }
  getItemViewType(row: number, column: number): number {
    if (this.shouldReturnOutOfBounds) {
      return 999; // 越界值
    }
    return 0;
  }
  getViewTypeCount(): number {
    return 1;
  }
}

// ---- 数据更新适配器（支持数据变更） ----
export class UpdatableTableAdapter extends BaseTableAdapter {
  private baseRowCount: number = 6;
  private baseColCount: number = 5;
  private dataVersion: number = 1;

  getRowCount(): number {
    return this.baseRowCount;
  }

  getColumnCount(): number {
    return this.baseColCount;
  }

  getView(row: number, column: number): CellView {
    if (row === -1 && column === -1) {
      return { type: 'corner', text: '' };
    }
    if (row === -1) {
      return { type: 'header', text: 'H' + (column + 1) + ' v' + this.dataVersion };
    }
    if (column === -1) {
      return { type: 'rowHeader', text: 'R' + (row + 1) };
    }
    return { type: 'cell', text: 'v' + this.dataVersion + '(' + row + ',' + column + ')' };
  }

  getWidth(column: number): number {
    return 100;
  }

  getHeight(row: number): number {
    return 36;
  }

  updateData(): void {
    this.dataVersion++;
    this.notifyDataSetChanged();
  }

  getDataVersion(): number {
    return this.dataVersion;
  }
}
