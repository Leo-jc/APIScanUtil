/*
 * Copyright (C) 2015 Karumi.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * 条目类别枚举。对应 Android 库中 HeaderRecyclerViewAdapter 的三个 protected 常量
 * TYPE_HEADER / TYPE_ITEM / TYPE_FOOTER，取值与原库完全一致，便于按 position 判定
 * 当前条目应渲染为 header、普通条目还是 footer。
 *
 * - HEADER(-2)：列表顶部固定数据条目。
 * - ITEM(-1)：普通数据条目。
 * - FOOTER(-3)：列表底部固定数据条目（如"加载更多"）。
 */
export enum ItemCategory {
  HEADER = -2,
  ITEM = -1,
  FOOTER = -3
}
