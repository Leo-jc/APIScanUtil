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

import { HeaderRecyclerViewEntry, HeaderSpanSizeLookup, ItemCategory } from 'header_recycler_view';
import { DragonBallDataSource } from '../data/DragonBallDataSource';
import { DragonBallHeader } from '../model/DragonBallHeader';
import { DragonBallCharacter } from '../model/DragonBallCharacter';
import { DragonBallFooter } from '../model/DragonBallFooter';
import { HeaderBanner } from '../components/HeaderBanner';
import { CharacterCard } from '../components/CharacterCard';
import { FooterLoading } from '../components/FooterLoading';

const NUMBER_OF_COLUMNS: number = 2;
const FIVE_SECONDS: number = 5000;
const VISIBLE_THRESHOLD: number = 5;

/**
 * 主页面。对应 Android sample 的 MainActivity：
 * - 使用 2 列网格（GridLayoutManager + HeaderSpanSizeLookup）展示角色卡片，
 *   header / footer 横跨整行，普通条目每行 2 个。
 * - 滚动接近底部（距离末尾 visibleThreshold 以内）触发 loadMore：5 秒后
 *   hideFooter + 条目翻倍 + 刷新，与原 sample 的 loadMore 行为一致。
 * - 顶部状态栏展示真实状态：条目总数、footer 显隐、加载中标志、是否还有更多，
 *   以及最近一次触发的 API 操作。
 */
@Entry
@Component
struct Index {
  private dataSource: DragonBallDataSource = new DragonBallDataSource();
  private scroller: Scroller = new Scroller();
  private layoutOptions: GridLayoutOptions = { regularSize: [1, 1] };
  // 对应 Android sample 的 new HeaderSpanSizeLookup(adapter, layoutManager)：
  // 由 HAR 的 HeaderSpanSizeLookup 真实承担 header/footer 占满整行的列跨度计算，
  // 不再由 Demo 硬编码 columnStart/columnEnd。
  private spanSizeLookup: HeaderSpanSizeLookup<DragonBallHeader, DragonBallCharacter, DragonBallFooter> =
    new HeaderSpanSizeLookup<DragonBallHeader, DragonBallCharacter, DragonBallFooter>(this.dataSource, NUMBER_OF_COLUMNS);
  private colors: Resource[] = [
    $r('app.color.character_goku'), $r('app.color.character_freezer'),
    $r('app.color.character_buu'), $r('app.color.character_roshi'),
    $r('app.color.character_cell'), $r('app.color.character_tien'),
    $r('app.color.character_piccolo'), $r('app.color.character_raditz'),
    $r('app.color.character_trunks'), $r('app.color.character_beerus'),
    $r('app.color.character_babidi'), $r('app.color.character_gohan'),
    $r('app.color.character_vegeta'), $r('app.color.character_krillin'),
    $r('app.color.character_nappa'), $r('app.color.character_king_kai')
  ];

  @State private statusText: string = '';
  @State private loading: boolean = false;
  @State private hasMore: boolean = true;

  aboutToAppear(): void {
    this.fillRecyclerView();
    this.refreshStatus('initialized');
  }

  /**
   * 对应 Android initializeRecyclerView + fillRecyclerView：
   * 构造 adapter（DragonBallDataSource），setHeader / setItems / setFooter，
   * 刷新视图。数据装配与原 sample 一致。
   */
  private fillRecyclerView(): void {
    let characters: DragonBallCharacter[] = this.getDragonBallCharacters();
    let header: DragonBallHeader = this.getHeader(characters);
    let footer: DragonBallFooter = this.getFooter();
    this.dataSource.setHeader(header);
    this.dataSource.setItems(characters);
    this.dataSource.setFooter(footer);
    this.dataSource.notifyDataReloaded();
  }

  /**
   * 对应 Android MainActivity.loadMore：5 秒延迟后 hideFooter + 条目翻倍 + 刷新，
   * 置 hasMore=false。通过 dataSource 的真实 showFooter/hideFooter/setItems/
   * notifyDataReloaded 触发视图更新。
   */
  private loadMore(): void {
    this.loading = true;
    this.refreshStatus('loadMore triggered');
    setTimeout(() => {
      this.dataSource.hideFooter();
      let originalCharacters: DragonBallCharacter[] = this.getDragonBallCharacters();
      let doubled: DragonBallCharacter[] = originalCharacters.concat(originalCharacters);
      this.dataSource.setItems(doubled);
      this.dataSource.notifyDataReloaded();
      this.loading = false;
      this.hasMore = false;
      this.refreshStatus('loaded more, items=' + this.dataSource.getItemCount().toString());
    }, FIVE_SECONDS);
  }

  /**
   * 对应 Android onScrollStateChanged 中的接近底部判定：
   * isCloseToTheEnd = (totalItemCount - visibleItemCount) <= (first + threshold)。
   */
  private onGridScrollIndex(first: number, last: number): void {
    if (this.loading || !this.hasMore) {
      return;
    }
    let visibleItemCount: number = last - first + 1;
    let totalItemCount: number = this.dataSource.totalCount();
    let isCloseToTheEnd: boolean = (totalItemCount - visibleItemCount) <= (first + VISIBLE_THRESHOLD);
    if (isCloseToTheEnd) {
      this.loadMore();
    }
  }

  private refreshStatus(action: string): void {
    let parts: string[] = [];
    parts.push('action: ' + action);
    parts.push('items: ' + this.dataSource.getItemCount().toString());
    parts.push('total: ' + this.dataSource.totalCount().toString());
    parts.push('footer: ' + (this.dataSource.hasFooter() ? 'shown' : 'hidden'));
    parts.push('loading: ' + (this.loading ? 'yes' : 'no'));
    parts.push('hasMore: ' + (this.hasMore ? 'yes' : 'no'));
    // 展示 HAR HeaderSpanSizeLookup 的真实计算结果：header 位置 spanSize=spanCount，
    // 普通条目 spanSize=1，证明列跨度由 library 计算而非 Demo 硬编码。
    let headerSpan: number = this.spanSizeLookup.getSpanSize(0);
    parts.push('spanCount: ' + this.spanSizeLookup.getSpanCount().toString());
    parts.push('headerSpan: ' + headerSpan.toString());
    this.statusText = parts.join(' | ');
  }

  private getHeader(characters: DragonBallCharacter[]): DragonBallHeader {
    // 原 sample 用 3 * 16 = 48 个 NoxItem；此处用 16 个角色（每个一次）以形成清晰圆环。
    return new DragonBallHeader(characters);
  }

  private getFooter(): DragonBallFooter {
    return new DragonBallFooter($r('app.string.load_more_message'));
  }

  private getDragonBallCharacters(): DragonBallCharacter[] {
    let ball: Resource = $r('app.media.ball');
    let list: DragonBallCharacter[] = [];
    list.push(new DragonBallCharacter('Goku', ball, 100));
    list.push(new DragonBallCharacter('Freezer', ball, 82));
    list.push(new DragonBallCharacter('Buu', ball, 88));
    list.push(new DragonBallCharacter('Master Roshi', ball, 8));
    list.push(new DragonBallCharacter('Cell', ball, 84));
    list.push(new DragonBallCharacter('Tien & Chiaotzu', ball, 45));
    list.push(new DragonBallCharacter('Piccolo', ball, 80));
    list.push(new DragonBallCharacter('Raditz', ball, 35));
    list.push(new DragonBallCharacter('Trunks', ball, 85));
    list.push(new DragonBallCharacter('Beerus', ball, 98));
    list.push(new DragonBallCharacter('Babidi', ball, 30));
    list.push(new DragonBallCharacter('Gohan', ball, 70));
    list.push(new DragonBallCharacter('Vegeta', ball, 90));
    list.push(new DragonBallCharacter('Krillin', ball, 10));
    list.push(new DragonBallCharacter('Nappa', ball, 45));
    list.push(new DragonBallCharacter('King Kai', ball, 20));
    return list;
  }

  private colorFor(index: number): Resource {
    let pos: number = index % this.colors.length;
    return this.colors[pos];
  }

  private recycleAt(position: number): void {
    this.dataSource.notifyViewRecycled(position);
  }

  build(): void {
    Column() {
      // 顶部标题与状态栏。
      Column() {
        Text('HeaderRecyclerView')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.black'))
          .width('100%')

        Text(this.statusText)
          .fontSize(12)
          .fontColor($r('app.color.black'))
          .width('100%')
          .margin({ top: 4, bottom: 4 })
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 12, bottom: 12 })
      .backgroundColor($r('app.color.white'))

      // 2 列网格：header/footer 横跨整行，普通条目每行 2 个。
      Grid(this.scroller, this.layoutOptions) {
        LazyForEach(this.dataSource,
          (entry: HeaderRecyclerViewEntry<DragonBallHeader, DragonBallCharacter, DragonBallFooter>, index: number) => {
            if (entry.category === ItemCategory.HEADER) {
              GridItem() {
                HeaderBanner({
                  header: entry.headerData!,
                  adapterPosition: index,
                  recycleHandler: (position: number): void => this.recycleAt(position)
                })
              }
              .columnStart(this.spanSizeLookup.columnStartOf(index))
              .columnEnd(this.spanSizeLookup.columnEndOf(index))
            } else if (entry.category === ItemCategory.FOOTER) {
              GridItem() {
                FooterLoading({
                  footer: entry.footerData!,
                  adapterPosition: index,
                  recycleHandler: (position: number): void => this.recycleAt(position)
                })
              }
              .columnStart(this.spanSizeLookup.columnStartOf(index))
              .columnEnd(this.spanSizeLookup.columnEndOf(index))
            } else {
              GridItem() {
                CharacterCard({
                  character: entry.itemData!,
                  color: this.colorFor(index),
                  adapterPosition: index,
                  recycleHandler: (position: number): void => this.recycleAt(position)
                })
              }
            }
          },
          (entry: HeaderRecyclerViewEntry<DragonBallHeader, DragonBallCharacter, DragonBallFooter>, index: number): string => index.toString()
        )
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(4)
      .rowsGap(4)
      .layoutWeight(1)
      .width('100%')
      .backgroundColor($r('app.color.background'))
      .edgeEffect(EdgeEffect.Spring)
      .onScrollIndex((first: number, last: number) => {
        this.onGridScrollIndex(first, last);
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background'))
  }
}
