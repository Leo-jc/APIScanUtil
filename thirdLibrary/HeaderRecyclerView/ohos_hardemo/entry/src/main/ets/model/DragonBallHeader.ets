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

import { DragonBallCharacter } from './DragonBallCharacter';

/**
 * 列表头部展示模型。对应 Android sample 的 DragonBallHeader：持有需要在头部
 * 圆形排列中展示的角色图片集合（原 sample 使用 NoxItem 包装的 photo URL 列表，
 * 此处直接持有角色引用以便取其本地图片资源）。
 */
export class DragonBallHeader {
  private characters: DragonBallCharacter[] = [];

  constructor(characters: DragonBallCharacter[]) {
    this.characters = characters;
  }

  getCharacters(): DragonBallCharacter[] {
    return this.characters;
  }
}
