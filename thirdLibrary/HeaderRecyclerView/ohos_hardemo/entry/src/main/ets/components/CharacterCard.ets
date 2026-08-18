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

import { DragonBallCharacter } from '../model/DragonBallCharacter';

/**
 * 角色卡片组件。对应 Android sample 的 row_dragon_ball_character.xml +
 * CharacterViewHolder：
 * - 整卡高 150vp（character_row_height）。
 * - 背景为该角色的主题色（替代原网络图片，原 dragonballz.com 图片已失效），
 *   其上叠加一张 dragon ball 本地图（objectFit 保持原尺寸居中，对应 scaleType=center）。
 * - 底部 50vp 渐变阴影条（transparent→black，自上而下，对应 bg_shadow angle=270）。
 * - 底部左侧：角色名（白，16fp）在"Level :"文案（白，14fp）上方，左边距 8vp、
 *   底边距 8vp，对应 tv_name above tv_level / alignParentBottom / marginLeft=margin=8dp。
 *
 * 该组件标记为 @Reusable，aboutToRecycle 时通过 recycleHandler 回调数据控制器，
 * 触发 HeaderRecyclerViewDataSource.notifyViewRecycled → onItemViewRecycled，
 * 对应 Android onViewRecycled(holder) 的回收分派链路。
 */
@Reusable
@Component
export struct CharacterCard {
  @State character: DragonBallCharacter = new DragonBallCharacter('', $r('app.media.ball'), 0);
  @State color: Resource = $r('app.color.character_goku');
  private adapterPosition: number = 0;
  private recycleHandler: (position: number) => void = () => {};

  aboutToReuse(params: Record<string, Object>): void {
    this.character = params.character as DragonBallCharacter;
    this.color = params.color as Resource;
    this.adapterPosition = params.adapterPosition as number;
    this.recycleHandler = params.recycleHandler as (position: number) => void;
  }

  aboutToRecycle(): void {
    this.recycleHandler(this.adapterPosition);
  }

  build(): void {
    Stack() {
      // 卡片主题色背景。
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor(this.color)

      // dragon ball 图，保持原尺寸居中（对应 scaleType=center）。
      Image(this.character.photo)
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.None)

      // 底部渐变阴影条（transparent→black，自上而下）。
      Column()
        .width('100%')
        .height($r('app.float.character_row_shadow_height'))
        .linearGradient({
          direction: GradientDirection.Bottom,
          colors: [['#00000000', 0.0], ['#000000', 1.0]]
        })
        .align(Alignment.Bottom)

      // 底部左侧：角色名 + Level 文案。
      Column() {
        Text(this.character.name)
          .fontSize($r('app.float.character_name_font_size'))
          .fontColor($r('app.color.white'))
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })

        Text('Level :' + this.character.level.toString())
          .fontSize($r('app.float.character_level_font_size'))
          .fontColor($r('app.color.white'))
      }
      .align(Alignment.BottomStart)
      .padding({
        left: $r('app.float.margin'),
        bottom: $r('app.float.margin')
      })
    }
    .width('100%')
    .height($r('app.float.character_row_height'))
    .clip(true)
  }
}
