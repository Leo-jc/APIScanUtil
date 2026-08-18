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
 * 龙珠角色展示模型。对应 Android sample 的 DragonBallCharacter：
 * name 角色名、photo 角色图片、level 战斗力。
 *
 * 适配说明：原 Android sample 用网络 URL 加载角色图片（dragonballz.com 已失效），
 * Demo 改用本地资源图（dragon ball）作为 photo，保证离线可运行；模型字段语义不变。
 */
export class DragonBallCharacter {
  name: string = '';
  photo: Resource = $r('app.media.ball');
  level: number = 0;

  constructor(name: string, photo: Resource, level: number) {
    this.name = name;
    this.photo = photo;
    this.level = level;
  }
}
