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
import { TableAdapter } from './TableAdapter';

// ---- 常量定义 ----
const DEFAULT_VIEW_TYPE: number = 0;
const DEFAULT_VIEW_TYPE_COUNT: number = 1;
const FIRST_OBSERVER_INDEX: number = 0;

/**
 * TableAdapter 的基础实现，提供观察者管理和默认方法。
 *
 * 替代 Android com.inqbarna.tablefixheaders.adapters.BaseTableAdapter。
 */
export abstract class BaseTableAdapter implements TableAdapter {
  private observers: DataChangeCallback[] = [];

  public registerDataSetObserver(observer: DataChangeCallback): void {
    if (observer && this.observers.indexOf(observer) < FIRST_OBSERVER_INDEX) {
      this.observers.push(observer);
    }
  }

  public unregisterDataSetObserver(observer: DataChangeCallback): void {
    const index = this.observers.indexOf(observer);
    if (index >= FIRST_OBSERVER_INDEX) {
      this.observers.splice(index, 1);
    }
  }

  /**
   * 通知所有已注册的观察者：数据已变更。
   */
  public notifyDataSetChanged(): void {
    for (const observer of this.observers) {
      observer();
    }
  }

  /**
   * 通知数据失效（原 Android 实现中为空操作）。
   * 保留此方法以保证 API 对等，当前仍执行回调通知以保持一致性。
   */
  public notifyDataSetInvalidated(): void {
    for (const observer of this.observers) {
      observer();
    }
  }

  // -- 子类必须实现 --
  abstract getRowCount(): number;
  abstract getColumnCount(): number;
  abstract getView(row: number, column: number): object;
  abstract getWidth(column: number): number;
  abstract getHeight(row: number): number;

  // -- 默认实现 --
  public getCellBackground(row: number, column: number): string {
    return '';
  }

  public getItemViewType(row: number, column: number): number {
    return DEFAULT_VIEW_TYPE;
  }

  public getViewTypeCount(): number {
    return DEFAULT_VIEW_TYPE_COUNT;
  }
}
