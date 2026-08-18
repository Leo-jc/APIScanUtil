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
 * 列表底部展示模型。对应 Android sample 的 DragonBallFooter：
 * 持有"加载更多"提示文案 loadMoreMessage。原 sample 通过
 * getString(R.string.load_more_message) 取字符串；鸿蒙侧用资源 Resource
 * 直接交给 Text 渲染，文案来源仍为资源表（app.string.load_more_message）。
 */
export class DragonBallFooter {
  private loadMoreMessage: Resource = $r('app.string.load_more_message');

  constructor(loadMoreMessage: Resource) {
    this.loadMoreMessage = loadMoreMessage;
  }

  getLoadMoreMessage(): Resource {
    return this.loadMoreMessage;
  }
}
