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

import { DragonBallHeader } from '../model/DragonBallHeader';
import { DragonBallCharacter } from '../model/DragonBallCharacter';

const HEADER_RING_RADIUS_VP: number = 62;
const HEADER_BALL_SIZE_VP: number = 30;

/** 圆环上单个头像相对居中位置的偏移量。 */
interface RingOffset {
  x: number;
  y: number;
}

/**
 * 头部横幅组件。对应 Android sample 的 row_dragon_ball_header.xml + HeaderViewHolder：
 * 原 sample 使用第三方 NoxView（fixed_circular_shape）把角色图片以圆形排列展示在
 * 龙珠主题背景图之上。NoxView 源码不在本仓库范围内，此处用等价的 ArkUI 自绘组合
 * 复刻其核心视觉：背景图（bg_dragon_ball_header）+ 在圆周上均匀分布的圆形头像。
 *
 * - 高 200vp（header_row_height），宽满列。
 * - 背景 Image，objectFit=Cover。
 * - 角色 dragon ball 图按角度 θ = 2π*i/N 排布在半径 R 的圆周上，圆形裁剪，
 *   圆心为组件中心（用 offset 相对居中位置偏移，避免依赖绝对像素）。
 * - nox_item_margin=15vp 体现在圆环半径留白上。
 *
 * 标记 @Reusable，aboutToRecycle 触发 notifyViewRecycled → onHeaderViewRecycled。
 */
@Reusable
@Component
export struct HeaderBanner {
  @State header: DragonBallHeader = new DragonBallHeader([]);
  private adapterPosition: number = 0;
  private recycleHandler: (position: number) => void = () => {};

  aboutToReuse(params: Record<string, Object>): void {
    this.header = params.header as DragonBallHeader;
    this.adapterPosition = params.adapterPosition as number;
    this.recycleHandler = params.recycleHandler as (position: number) => void;
  }

  aboutToRecycle(): void {
    this.recycleHandler(this.adapterPosition);
  }

  build(): void {
    Stack() {
      Image($r('app.media.bg_dragon_ball_header'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)

      ForEach(this.header.getCharacters(), (character: DragonBallCharacter, index: number) => {
        Image(character.photo)
          .width(HEADER_BALL_SIZE_VP)
          .height(HEADER_BALL_SIZE_VP)
          .borderRadius(HEADER_BALL_SIZE_VP / 2)
          .clip(true)
          .border({ width: 2, color: $r('app.color.white') })
          .offset(this.computeOffset(index, this.header.getCharacters().length))
      }, (character: DragonBallCharacter, index: number) => index.toString())
    }
    .width('100%')
    .height($r('app.float.header_row_height'))
    .clip(true)
  }

  private computeOffset(index: number, total: number): RingOffset {
    if (total <= 0) {
      let zero: RingOffset = { x: 0, y: 0 };
      return zero;
    }
    let angle: number = (2 * Math.PI / total) * index;
    let offset: RingOffset = {
      x: HEADER_RING_RADIUS_VP * Math.cos(angle),
      y: HEADER_RING_RADIUS_VP * Math.sin(angle)
    };
    return offset;
  }
}
