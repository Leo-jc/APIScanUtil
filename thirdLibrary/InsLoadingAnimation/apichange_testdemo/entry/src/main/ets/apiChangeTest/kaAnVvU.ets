import TreeMap from '@ohos.util.TreeMap';
import TreeSet from '@ohos.util.TreeSet';

@Component
export struct kaAnVvU {
  @State textInfo: string = '';

  private initCollections(): void {
    const treeMap: TreeMap<string, number> = new TreeMap<string, number>();
    treeMap.set('key1', 1);
    treeMap.set('key2', 2);
    const mapValue: number | undefined = treeMap.get('key1');
    const valueText: string = mapValue === undefined ? 'undefined' : String(mapValue);
    const treeSet: TreeSet<number> = new TreeSet<number>();
    treeSet.add(1);
    treeSet.add(2);
    this.textInfo = 'map size:' + treeMap.length + ' set size:' + treeSet.length + ' value:' + valueText;
  }

  build() {
    Column({ space: 8 }) {
      Button('init collections')
        .onClick(() => {
          this.initCollections();
        })
      Text('styled text')
        .fontWeight(FontWeight.Bold)
        .letterSpacing(2)
        .baselineOffset(6)
      Text(this.textInfo)
    }
    .width('100%')
    .padding(12)
  }
}
