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

import { DragonBallFooter } from '../model/DragonBallFooter';

/**
 * 底部加载更多组件。对应 Android sample 的 row_dragon_ball_footer.xml +
 * FooterViewHolder：竖向居中的 ProgressBar + 白色"Loading..."文案，整体背景为
 * bg_shadow 渐变（transparent→black，自上而下，对应 angle=270）。
 *
 * - 整体 Column 居中，背景使用与 bg_shadow 等价的 linearGradient。
 * - LoadingProgress 为 ArkUI 不确定进度指示器，对应 Android 的 indeterminate
 *   ProgressBar。
 * - 文案颜色白色、字号 14fp，文案内容来自 DragonBallFooter.loadMoreMessage。
 *
 * 标记 @Reusable，aboutToRecycle 触发 notifyViewRecycled → onFooterViewRecycled。
 */
@Reusable
@Component
export struct FooterLoading {
  @State footer: DragonBallFooter = new DragonBallFooter($r('app.string.load_more_message'));
  private adapterPosition: number = 0;
  private recycleHandler: (position: number) => void = () => {};

  aboutToReuse(params: Record<string, Object>): void {
    this.footer = params.footer as DragonBallFooter;
    this.adapterPosition = params.adapterPosition as number;
    this.recycleHandler = params.recycleHandler as (position: number) => void;
  }

  aboutToRecycle(): void {
    this.recycleHandler(this.adapterPosition);
  }

  build(): void {
    Column() {
      LoadingProgress()
        .width(32)
        .height(32)
        .color($r('app.color.white'))

      Text(this.footer.getLoadMoreMessage())
        .fontSize($r('app.float.footer_text_font_size'))
        .fontColor($r('app.color.white'))
        .margin({ top: $r('app.float.margin') })
    }
    .width('100%')
    .padding({ top: 16, bottom: 16 })
    .justifyContent(FlexAlign.Center)
    .linearGradient({
      direction: GradientDirection.Bottom,
      colors: [['#00000000', 0.0], ['#000000', 1.0]]
    })
  }
}
