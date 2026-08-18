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

import { TableAdapter } from './adapters/TableAdapter';
import { DataChangeCallback } from './adapters/DataSetObserver';
import { Flinger } from './Flinger';

// ---- 常量定义 ----
const FIRST_INDEX: number = 0;
const HEADER_INDEX: number = -1;
const MIN_VELOCITY: number = 50;
const SHADOW_THRESHOLD: number = 0.01;
const SHADOW_SIZE: number = 8;
const DEFAULT_CELL_WIDTH: number = 100;
const DEFAULT_CELL_HEIGHT: number = 40;
const DEFAULT_COMP_HEIGHT: number = 300;
const SHADOW_ALPHA_FACTOR: number = 0.5;
const HEX_BASE: number = 16;
const PAD_DIGITS: number = 2;
const FONT_SIZE: number = 12;
const BORDER_WIDTH: number = 0.5;
const ALTERNATE_ROW_DIVISOR: number = 2;
const ALTERNATE_ROW_REMAINDER: number = 0;
const FIRST_COL_INDEX: number = 0;
const FIRST_ROW_INDEX: number = 0;
const HEADER_SECTION_OFFSET: number = 1;
const GRADIENT_START: number = 0;
const GRADIENT_END: number = 1;

/**
 * TableFixHeaders 控制器，供宿主通过引用调用组件公开方法。
 */
export class TableFixHeadersController {
  private scrollToRef: ((x: number, y: number) => void) | null = null;
  private scrollByRef: ((dx: number, dy: number) => void) | null = null;
  private getActualScrollXRef: (() => number) | null = null;
  private getActualScrollYRef: (() => number) | null = null;

  setScrollTo(fn: (x: number, y: number) => void): void {
    this.scrollToRef = fn;
  }

  setScrollBy(fn: (dx: number, dy: number) => void): void {
    this.scrollByRef = fn;
  }

  setGetActualScrollX(fn: () => number): void {
    this.getActualScrollXRef = fn;
  }

  setGetActualScrollY(fn: () => number): void {
    this.getActualScrollYRef = fn;
  }

  scrollTo(x: number, y: number): void {
    if (this.scrollToRef) {
      this.scrollToRef(x, y);
    }
  }

  scrollBy(dx: number, dy: number): void {
    if (this.scrollByRef) {
      this.scrollByRef(dx, dy);
    }
  }

  getActualScrollX(): number {
    if (this.getActualScrollXRef) {
      return this.getActualScrollXRef();
    }
    return 0;
  }

  getActualScrollY(): number {
    if (this.getActualScrollYRef) {
      return this.getActualScrollYRef();
    }
    return 0;
  }
}

/**
 * TableFixHeaders 是固定表头的双向可滚动表格组件。
 *
 * 布局架构：
 * ┌──────────┬──────────────────────────┐
 * │ 角标固定  │ 表头行（水平滚动，垂直固定）  │
 * ├──────────┼──────────────────────────┤
 * │ 表头列    │ 数据体（双向滚动）          │
 * │（垂直滚动 │                          │
 * │ 水平固定）│                          │
 * └──────────┴──────────────────────────┘
 *
 * 替代 Android com.inqbarna.tablefixheaders.TableFixHeaders (ViewGroup)。
 */
@Component
export struct TableFixHeaders {
  // ---- 构造参数（宿主设置） ----
  adapter?: TableAdapter;
  controller?: TableFixHeadersController;

  // ---- 内部状态 ----
  @State private actualScrollX: number = FIRST_INDEX;
  @State private actualScrollY: number = FIRST_INDEX;
  @State private needRelayout: boolean = true;
  @State private renderVersion: number = 0;
  @State private scrollX: number = FIRST_INDEX;
  @State private scrollY: number = FIRST_INDEX;
  @State private firstRow: number = FIRST_INDEX;
  @State private firstColumn: number = FIRST_INDEX;

  // ---- 尺寸数据 ----
  @State private widths: number[] = [];
  @State private heights: number[] = [];
  private rowCount: number = FIRST_INDEX;
  private columnCount: number = FIRST_INDEX;
  @State private compWidth: number = FIRST_INDEX;
  @State private compHeight: number = FIRST_INDEX;

  // ---- 阴影 ----
  private shadowSize: number = SHADOW_SIZE;
  @State private shadowLeftAlpha: number = FIRST_INDEX;
  @State private shadowTopAlpha: number = FIRST_INDEX;
  @State private shadowRightAlpha: number = FIRST_INDEX;
  @State private shadowBottomAlpha: number = FIRST_INDEX;

  // ---- 触摸与惯性 ----
  private flinger: Flinger = new Flinger();
  private touchStartX: number = FIRST_INDEX;
  private touchStartY: number = FIRST_INDEX;
  private touchPrevX: number = FIRST_INDEX;
  private touchPrevY: number = FIRST_INDEX;
  private touchPrevPrevX: number = FIRST_INDEX;
  private touchPrevPrevY: number = FIRST_INDEX;
  private touchPrevPrevTime: number = FIRST_INDEX;
  private touchStartTime: number = FIRST_INDEX;
  private lastMoveTime: number = FIRST_INDEX;
  private isTouchDragging: boolean = false;

  // ---- 适配器观察者 ----
  private dataChangeCb: DataChangeCallback = () => {};

  // ---- 单元格默认尺寸 ----
  private defaultCellWidth: number = DEFAULT_CELL_WIDTH;
  private defaultCellHeight: number = DEFAULT_CELL_HEIGHT;

  aboutToAppear(): void {
    if (this.adapter) {
      this.initFromAdapter();
      this.needRelayout = false;
    }
    this.dataChangeCb = () => {
      if (this.adapter) {
        this.initFromAdapter();
        this.clampActualScroll();
        this.syncScrollState();
        this.updateShadowAlpha();
        this.renderVersion++;
      }
      this.needRelayout = false;
    };
    if (this.adapter) {
      this.adapter.registerDataSetObserver(this.dataChangeCb);
    }
    if (this.controller) {
      this.controller.setScrollTo((x: number, y: number) => { this.scrollTo(x, y); });
      this.controller.setScrollBy((dx: number, dy: number) => { this.scrollBy(dx, dy); });
      this.controller.setGetActualScrollX(() => this.actualScrollX);
      this.controller.setGetActualScrollY(() => this.actualScrollY);
    }
  }

  /**
   * 设置数据适配器（供宿主调用）。
   */
  public setAdapter(newAdapter: TableAdapter): void {
    if (this.adapter) {
      this.adapter.unregisterDataSetObserver(this.dataChangeCb);
    }
    this.adapter = newAdapter;
    if (this.adapter) {
      this.adapter.registerDataSetObserver(this.dataChangeCb);
    }
    this.actualScrollX = FIRST_INDEX;
    this.actualScrollY = FIRST_INDEX;
    this.initFromAdapter();
    this.needRelayout = false;
  }

  /**
   * 返回当前适配器。
   */
  public getAdapter(): TableAdapter | undefined {
    return this.adapter;
  }

  /**
   * 滚动到指定像素位置。
   */
  public scrollTo(x: number, y: number): void {
    const maxX: number = this.getMaxScrollX();
    const maxY: number = this.getMaxScrollY();
    const clampedX: number = Math.max(FIRST_INDEX, Math.min(x, maxX));
    const clampedY: number = Math.max(FIRST_INDEX, Math.min(y, maxY));
    this.actualScrollX = clampedX;
    this.actualScrollY = clampedY;
    this.syncScrollState();
    this.updateShadowAlpha();
  }

  /**
   * 相对当前位置滚动。
   */
  public scrollBy(dx: number, dy: number): void {
    this.doScrollBy(dx, dy);
  }

  /**
   * 实际水平滚动偏移。
   */
  public getActualScrollX(): number {
    return this.actualScrollX;
  }

  /**
   * 实际垂直滚动偏移。
   */
  public getActualScrollY(): number {
    return this.actualScrollY;
  }

  // ==================== 内部方法 ====================

  private initFromAdapter(): void {
    const adapter = this.adapter;
    if (!adapter) {
      return;
    }
    this.rowCount = adapter.getRowCount();
    this.columnCount = adapter.getColumnCount();

    const newWidths: number[] = [];
    for (let i = HEADER_INDEX; i < this.columnCount; i++) {
      newWidths.push(adapter.getWidth(i));
    }
    this.widths = newWidths;

    const newHeights: number[] = [];
    for (let i = HEADER_INDEX; i < this.rowCount; i++) {
      newHeights.push(adapter.getHeight(i));
    }
    this.heights = newHeights;

    this.needRelayout = true;
  }

  private doScrollBy(dx: number, dy: number): void {
    if (this.needRelayout) {
      return;
    }
    this.actualScrollX += dx;
    this.actualScrollY += dy;
    this.clampActualScroll();
    this.syncScrollState();
    this.updateShadowAlpha();
  }

  private syncScrollState(): void {
    let remaining: number = this.actualScrollX;
    let fc: number = FIRST_INDEX;
    while (fc + HEADER_SECTION_OFFSET < this.widths.length &&
      this.widths[fc + HEADER_SECTION_OFFSET] < remaining) {
      remaining -= this.widths[fc + HEADER_SECTION_OFFSET];
      fc++;
    }
    if (fc > this.columnCount) {
      fc = this.columnCount;
    }
    this.firstColumn = fc;
    this.scrollX = remaining;

    remaining = this.actualScrollY;
    let fr: number = FIRST_INDEX;
    while (fr + HEADER_SECTION_OFFSET < this.heights.length &&
      this.heights[fr + HEADER_SECTION_OFFSET] < remaining) {
      remaining -= this.heights[fr + HEADER_SECTION_OFFSET];
      fr++;
    }
    if (fr > this.rowCount) {
      fr = this.rowCount;
    }
    this.firstRow = fr;
    this.scrollY = remaining;
  }

  private clampActualScroll(): void {
    const maxX: number = this.getMaxScrollX();
    const maxY: number = this.getMaxScrollY();
    if (this.actualScrollX < FIRST_INDEX) {
      this.actualScrollX = FIRST_INDEX;
    }
    if (this.actualScrollX > maxX) {
      this.actualScrollX = maxX;
    }
    if (this.actualScrollY < FIRST_INDEX) {
      this.actualScrollY = FIRST_INDEX;
    }
    if (this.actualScrollY > maxY) {
      this.actualScrollY = maxY;
    }
  }

  private sumAll(arr: number[]): number {
    let sum: number = FIRST_INDEX;
    for (let i = 0; i < arr.length; i++) {
      sum += arr[i];
    }
    return sum;
  }

  private updateShadowAlpha(): void {
    const actualX: number = this.actualScrollX;
    const actualY: number = this.actualScrollY;
    const maxX: number = Math.max(FIRST_INDEX, this.sumAll(this.widths) - this.compWidth);
    const maxY: number = Math.max(FIRST_INDEX, this.sumAll(this.heights) - this.compHeight);
    const maxAlpha: number = 1;

    this.shadowLeftAlpha = Math.min(actualX / this.shadowSize, maxAlpha);
    this.shadowTopAlpha = Math.min(actualY / this.shadowSize, maxAlpha);
    this.shadowRightAlpha = Math.min((maxX - actualX) / this.shadowSize, maxAlpha);
    this.shadowBottomAlpha = Math.min((maxY - actualY) / this.shadowSize, maxAlpha);
  }

  private getMaxScrollX(): number {
    if (!this.adapter) {
      return FIRST_INDEX;
    }
    return Math.max(FIRST_INDEX, this.sumAll(this.widths) - this.compWidth);
  }

  private getMaxScrollY(): number {
    if (!this.adapter) {
      return FIRST_INDEX;
    }
    return Math.max(FIRST_INDEX, this.sumAll(this.heights) - this.compHeight);
  }

  // ==================== 触摸与惯性 ====================

  private onTouchEvent(event: TouchEvent): void {
    if (event.type === TouchType.Down) {
      this.flinger.forceFinished();
      this.touchStartX = event.touches[0].x;
      this.touchStartY = event.touches[0].y;
      this.touchPrevX = event.touches[0].x;
      this.touchPrevY = event.touches[0].y;
      this.touchPrevPrevX = event.touches[0].x;
      this.touchPrevPrevY = event.touches[0].y;
      this.touchStartTime = Date.now();
      this.lastMoveTime = this.touchStartTime;
      this.touchPrevPrevTime = this.touchStartTime;
      this.isTouchDragging = false;
    } else if (event.type === TouchType.Move) {
      const currX: number = event.touches[0].x;
      const currY: number = event.touches[0].y;
      const dx: number = this.touchPrevX - currX;
      const dy: number = this.touchPrevY - currY;
      this.touchPrevPrevX = this.touchPrevX;
      this.touchPrevPrevY = this.touchPrevY;
      this.touchPrevPrevTime = this.lastMoveTime;
      this.touchPrevX = currX;
      this.touchPrevY = currY;
      const distFromStart: number = Math.abs(currX - this.touchStartX) + Math.abs(currY - this.touchStartY);
      if (distFromStart > 5) {
        this.isTouchDragging = true;
      }
      if (this.isTouchDragging) {
        this.doScrollBy(dx, dy);
      }
      this.lastMoveTime = Date.now();
    } else if (event.type === TouchType.Up || event.type === TouchType.Cancel) {
      if (this.isTouchDragging) {
        const moveElapsed: number = this.lastMoveTime - this.touchPrevPrevTime;
        if (moveElapsed > 0) {
          const velocityX: number = (this.touchPrevPrevX - this.touchPrevX) / (moveElapsed / 1000);
          const velocityY: number = (this.touchPrevPrevY - this.touchPrevY) / (moveElapsed / 1000);
          if (Math.abs(velocityX) > MIN_VELOCITY || Math.abs(velocityY) > MIN_VELOCITY) {
            this.startFling(velocityX, velocityY);
          }
        }
      }
      this.isTouchDragging = false;
    }
  }

  private startFling(velocityX: number, velocityY: number): void {
    const maxX: number = this.getMaxScrollX();
    const maxY: number = this.getMaxScrollY();

    this.flinger.start(this.actualScrollX, this.actualScrollY, velocityX, velocityY, maxX, maxY);

    const FRAME_INTERVAL: number = 16;
    let flingTimer: number = setInterval(() => {
      if (this.flinger.isFinished()) {
        clearInterval(flingTimer);
        return;
      }
      const deltas: number[] = this.flinger.computeStep();
      const diffX: number = deltas[0];
      const diffY: number = deltas[1];
      if (Math.abs(diffX) < 0.5 && Math.abs(diffY) < 0.5) {
        this.flinger.forceFinished();
        clearInterval(flingTimer);
        return;
      }
      this.doScrollBy(diffX, diffY);
    }, FRAME_INTERVAL);
  }

  // ==================== 单元格渲染 ====================

  /**
   * 获取单元格显示文本。
   */
  private getCellLabel(row: number, col: number): string {
    if (row === HEADER_INDEX && col === HEADER_INDEX) {
      return '';
    }
    if (row === HEADER_INDEX) {
      return 'Col ' + col;
    }
    if (col === HEADER_INDEX) {
      return 'Row ' + row;
    }
    return '(' + row + ',' + col + ')';
  }

  private getCellText(row: number, col: number): string {
    if (!this.adapter) {
      return '';
    }
    const view: Object = this.adapter.getView(row, col);
    const cellView = view as Record<string, string>;
    if (cellView['text'] !== undefined) {
      return cellView['text'];
    }
    return '';
  }

  private getCellBg(row: number, col: number): string {
    if (this.adapter) {
      const bg: string = this.adapter.getCellBackground(row, col);
      if (bg !== '') {
        return bg;
      }
    }
    if (row === HEADER_INDEX || col === HEADER_INDEX) {
      return '#F5F5F5';
    }
    if (row % ALTERNATE_ROW_DIVISOR === ALTERNATE_ROW_REMAINDER) {
      return '#FFFFFF';
    }
    return '#FAFAFA';
  }

  /**
   * 计算可见列索引列表。
   */
  private getVisibleColumns(): number[] {
    if (!this.adapter || this.widths.length <= HEADER_SECTION_OFFSET) {
      return [];
    }
    const result: number[] = [];
    let x: number = this.widths[FIRST_COL_INDEX] - this.scrollX;
    const maxCols: number = this.columnCount;
    for (let i = this.firstColumn; i < maxCols && x < this.compWidth; i++) {
      const colIdx: number = i + HEADER_SECTION_OFFSET;
      if (colIdx < this.widths.length) {
        result.push(i);
        x += this.widths[colIdx];
      } else {
        break;
      }
    }
    return result;
  }

  /**
   * 计算可见行索引列表。
   */
  private getVisibleRows(): number[] {
    if (!this.adapter || this.heights.length <= HEADER_SECTION_OFFSET) {
      return [];
    }
    const result: number[] = [];
    let y: number = this.heights[FIRST_ROW_INDEX] - this.scrollY;
    const maxRows: number = this.rowCount;
    for (let i = this.firstRow; i < maxRows && y < this.compHeight; i++) {
      const rowIdx: number = i + HEADER_SECTION_OFFSET;
      if (rowIdx < this.heights.length) {
        result.push(i);
        y += this.heights[rowIdx];
      } else {
        break;
      }
    }
    return result;
  }

  /**
   * 获取指定列宽度。
   */
  private getColWidth(col: number): number {
    const idx: number = col + HEADER_SECTION_OFFSET;
    if (idx >= FIRST_INDEX && idx < this.widths.length) {
      return this.widths[idx];
    }
    return this.defaultCellWidth;
  }

  /**
   * 获取指定行高度。
   */
  private getRowHeight(row: number): number {
    const idx: number = row + HEADER_SECTION_OFFSET;
    if (idx >= FIRST_INDEX && idx < this.heights.length) {
      return this.heights[idx];
    }
    return this.defaultCellHeight;
  }

  // ==================== UI 构建 ====================

  @Builder
  private cellItem(row: number, col: number) {
    Text(this.getCellText(row, col))
      .fontSize(FONT_SIZE)
      .textAlign(TextAlign.Center)
      .width(this.getColWidth(col))
      .height(this.getRowHeight(row))
      .backgroundColor(this.getCellBg(row, col))
  }

  build() {
    Stack() {
      // ---- 角标区域：固定 ----
      if (this.adapter && this.rowCount > FIRST_INDEX && this.columnCount > FIRST_INDEX && this.widths.length > FIRST_INDEX && this.heights.length > FIRST_INDEX) {
        Stack() {
          this.cellItem(HEADER_INDEX, HEADER_INDEX)
        }
          .position({ x: FIRST_INDEX, y: FIRST_INDEX })
      }

      // ---- 表头行区域：水平滚动，垂直固定 ----
      // 使用 fixed 位置（紧贴角标右侧）加 offset 实现水平滚动，确保不覆盖角标
      if (this.adapter && this.rowCount > FIRST_INDEX && this.columnCount > FIRST_INDEX && this.widths.length > FIRST_INDEX && this.heights.length > FIRST_INDEX) {
        Stack() {
          Row() {
            ForEach(this.getVisibleColumns(), (col: number) => {
              this.cellItem(HEADER_INDEX, col)
            }, (col: number) => 'hdr_' + col.toString())
          }
          .height(this.heights[FIRST_ROW_INDEX])
          .offset({ x: -this.scrollX })
        }
        .align(Alignment.TopStart)
        .position({ x: this.widths[FIRST_COL_INDEX], y: FIRST_INDEX })
        .width(this.compWidth - this.widths[FIRST_COL_INDEX])
        .height(this.heights[FIRST_ROW_INDEX])
        .clip(true)
      }

      // ---- 表头列区域：垂直滚动，水平固定 ----
      // 使用 fixed 位置（紧贴角标下侧）加 offset 实现垂直滚动
      if (this.adapter && this.rowCount > FIRST_INDEX && this.columnCount > FIRST_INDEX && this.widths.length > FIRST_INDEX && this.heights.length > FIRST_INDEX) {
        Stack() {
          Column() {
            ForEach(this.getVisibleRows(), (row: number) => {
              this.cellItem(row, HEADER_INDEX)
            }, (row: number) => 'hdr_row_' + row.toString())
          }
          .offset({ y: -this.scrollY })
        }
        .align(Alignment.TopStart)
        .position({ x: FIRST_INDEX, y: this.heights[FIRST_ROW_INDEX] })
        .width(this.widths[FIRST_COL_INDEX])
        .height(this.compHeight - this.heights[FIRST_ROW_INDEX])
        .clip(true)
      }

      // ---- 数据体区域：双向滚动 ----
      // 使用 fixed 位置（紧贴角标右下角）加 offset 实现双向滚动
      if (this.adapter && this.rowCount > FIRST_INDEX && this.columnCount > FIRST_INDEX && this.widths.length > FIRST_INDEX && this.heights.length > FIRST_INDEX) {
        Stack() {
          Column() {
            ForEach(this.getVisibleRows(), (row: number) => {
              Row() {
                ForEach(this.getVisibleColumns(), (col: number) => {
                  this.cellItem(row, col)
                }, (col: number) => 'body_' + row.toString() + '_' + col.toString())
              }
              .height(this.getRowHeight(row))
              .offset({ x: -this.scrollX })
            }, (row: number) => 'body_row_' + row.toString())
          }
          .offset({ y: -this.scrollY })
        }
        .align(Alignment.TopStart)
        .position({ x: this.widths[FIRST_COL_INDEX], y: this.heights[FIRST_ROW_INDEX] })
        .width(this.compWidth - this.widths[FIRST_COL_INDEX])
        .height(this.compHeight - this.heights[FIRST_ROW_INDEX])
        .clip(true)
      }

      // ---- 阴影叠加层（使用渐变背景 Row/Column） ----
      // 左阴影：位于首列右边缘，向右渐淡（对照Android addShadow位置widths[0]）
      if (this.shadowLeftAlpha > SHADOW_THRESHOLD && this.rowCount > FIRST_INDEX && this.columnCount > FIRST_INDEX) {
        Row()
          .width(this.shadowSize)
          .height('100%')
          .position({ x: this.widths[FIRST_COL_INDEX], y: FIRST_INDEX })
          .hitTestBehavior(HitTestMode.None)
          .linearGradient({
            direction: GradientDirection.Right,
            colors: [['rgba(0,0,0,' + (SHADOW_ALPHA_FACTOR * this.shadowLeftAlpha).toFixed(PAD_DIGITS) + ')', GRADIENT_START],
            ['rgba(0,0,0,0)', GRADIENT_END]]
          })
      }

      // 上阴影：位于首行下边缘，向下渐淡（对照Android addShadow位置heights[0]）
      if (this.shadowTopAlpha > SHADOW_THRESHOLD && this.rowCount > FIRST_INDEX && this.columnCount > FIRST_INDEX) {
        Column()
          .width('100%')
          .height(this.shadowSize)
          .position({ x: FIRST_INDEX, y: this.heights[FIRST_ROW_INDEX] })
          .hitTestBehavior(HitTestMode.None)
          .linearGradient({
            direction: GradientDirection.Bottom,
            colors: [['rgba(0,0,0,' + (SHADOW_ALPHA_FACTOR * this.shadowTopAlpha).toFixed(PAD_DIGITS) + ')', GRADIENT_START],
            ['rgba(0,0,0,0)', GRADIENT_END]]
          })
      }

      // 右阴影：位于右边缘，向左渐淡（对照Android shadow_right angle=180）
      if (this.shadowRightAlpha > SHADOW_THRESHOLD && this.rowCount > FIRST_INDEX && this.columnCount > FIRST_INDEX) {
        Row()
          .width(this.shadowSize)
          .height('100%')
          .position({ x: this.compWidth - this.shadowSize, y: FIRST_INDEX })
          .hitTestBehavior(HitTestMode.None)
          .linearGradient({
            direction: GradientDirection.Left,
            colors: [['rgba(0,0,0,' + (SHADOW_ALPHA_FACTOR * this.shadowRightAlpha).toFixed(PAD_DIGITS) + ')', GRADIENT_START],
            ['rgba(0,0,0,0)', GRADIENT_END]]
          })
      }

      // 下阴影：位于底边缘，向上渐淡（对照Android shadow_bottom angle=90）
      if (this.shadowBottomAlpha > SHADOW_THRESHOLD && this.rowCount > FIRST_INDEX && this.columnCount > FIRST_INDEX) {
        Column()
          .width('100%')
          .height(this.shadowSize)
          .position({ x: FIRST_INDEX, y: this.compHeight - this.shadowSize })
          .hitTestBehavior(HitTestMode.None)
          .linearGradient({
            direction: GradientDirection.Top,
            colors: [['rgba(0,0,0,' + (SHADOW_ALPHA_FACTOR * this.shadowBottomAlpha).toFixed(PAD_DIGITS) + ')', GRADIENT_START],
            ['rgba(0,0,0,0)', GRADIENT_END]]
          })
      }
    }
    .hitTestBehavior(HitTestMode.Block)
    .width('100%')
    .height(this.compHeight > FIRST_INDEX ? this.compHeight : DEFAULT_COMP_HEIGHT)
    .onTouch((event: TouchEvent) => {
      this.onTouchEvent(event);
    })
    .onAreaChange((oldValue: Area, newValue: Area) => {
      const newW: number = newValue.width as number;
      const newH: number = newValue.height as number;
      this.compWidth = newW;
      this.compHeight = newH;
      this.clampActualScroll();
      this.syncScrollState();
      this.updateShadowAlpha();
    })
  }
}
