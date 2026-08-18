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

// ---- 常量定义 ----
const MAP_INIT_INDEX: number = 0;

/**
 * Recycler 提供视图类型级别的缓存池，用于模拟视图回收语义。
 * 在 ArkUI 中，视图回收由 ForEach 框架自动管理；此类作为逻辑引用
 * 辅助跟踪各 viewType 的复用计数。替代 Android Recycler.java。
 */
export class Recycler {
  private views: Map<number, Object[]> = new Map();

  constructor(size: number) {
    for (let i = MAP_INIT_INDEX; i < size; i++) {
      this.views.set(i, []);
    }
  }

  /**
   * 添加一个已回收的单元格数据对象。
   */
  public addRecycledView(view: Object, type: number): void {
    const list = this.views.get(type);
    if (list !== undefined) {
      list.push(view);
    }
  }

  /**
   * 获取指定类型的已回收单元格数据对象。
   * @returns 如果缓存池不为空则返回一个对象，否则返回 undefined。
   */
  public getRecycledView(typeView: number): Object | undefined {
    const list = this.views.get(typeView);
    if (list !== undefined && list.length > MAP_INIT_INDEX) {
      return list.pop();
    }
    return undefined;
  }
}
