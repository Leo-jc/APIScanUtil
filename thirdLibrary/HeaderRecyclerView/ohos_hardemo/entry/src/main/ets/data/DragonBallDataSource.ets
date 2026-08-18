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

import { HeaderRecyclerViewDataSource } from 'header_recycler_view';
import { DragonBallHeader } from '../model/DragonBallHeader';
import { DragonBallCharacter } from '../model/DragonBallCharacter';
import { DragonBallFooter } from '../model/DragonBallFooter';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0x0000;
const LOG_TAG: string = 'DragonBallDataSource';

/**
 * Demo 数据控制器，继承自 HAR 的 HeaderRecyclerViewDataSource。对应 Android
 * sample 的 DragonBallAdapter：在 onHeaderViewRecycled / onItemViewRecycled /
 * onFooterViewRecycled 中输出日志（与原 sample 行为一致）。
 *
 * 注意：ArkUI 的 LazyForEach 不像 RecyclerView 那样在条目滑出可视区时回调
 * Adapter 的 onViewRecycled。要触发这些回收钩子，由 @Reusable 子组件在
 * aboutToRecycle 生命周期中调用 notifyViewRecycled(position) 完成。
 */
export class DragonBallDataSource extends HeaderRecyclerViewDataSource<DragonBallHeader, DragonBallCharacter, DragonBallFooter> {
  onHeaderViewRecycled(position: number): void {
    hilog.info(DOMAIN, LOG_TAG, 'onHeaderViewRecycled(position=%{public}d)', position);
  }

  onItemViewRecycled(position: number): void {
    hilog.info(DOMAIN, LOG_TAG, 'onItemViewRecycled(position=%{public}d)', position);
  }

  onFooterViewRecycled(position: number): void {
    hilog.info(DOMAIN, LOG_TAG, 'onFooterViewRecycled(position=%{public}d)', position);
  }
}
