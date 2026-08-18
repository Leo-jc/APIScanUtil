/**
 * 联系人分组数据结构，对应 Android Demo TextEntity(latter, data)。
 */
export interface ContactGroup {
  letter: string;
  contacts: string[];
}

/**
 * 列表项类型：header（字母分组标题）或 contact（联系人）。
 * 注意：类型名 FlatItem 避免与 ArkUI 内置 ListItem 组件冲突。
 */
export interface FlatItem {
  type: number; // 0=header, 1=contact
  text: string; // header: 字母；contact: 联系人名
}

export const ITEM_TYPE_HEADER: number = 0;
export const ITEM_TYPE_CONTACT: number = 1;

/**
 * 构造 A-Z 字母数组，对应 Android Demo letterArray ('A'..'Z')。
 */
export function buildLetterArray(): string[] {
  let arr: string[] = [];
  for (let i = 0; i < 26; i++) {
    arr.push(String.fromCharCode('A'.charCodeAt(0) + i));
  }
  return arr;
}

/**
 * 构造联系人分组数据，对应 Android Demo testData。
 */
export function buildContactGroups(): ContactGroup[] {
  let groups: ContactGroup[] = [];
  groups.push({ letter: 'A', contacts: ['阿拉伯', '阿里', '奥迪尔', '奥地利'] });
  groups.push({ letter: 'B', contacts: ['北京', '北上广', '北极', '倍数', '背景'] });
  groups.push({ letter: 'C', contacts: ['朝阳', '超速', '重启', '传奇'] });
  groups.push({ letter: 'D', contacts: ['东北', '动静', '冬季'] });
  groups.push({ letter: 'E', contacts: ['俄罗斯，二百件', '贰拾'] });
  groups.push({ letter: 'F', contacts: ['风的季节', '风声', '封装', '封闭', '烽火狼烟'] });
  groups.push({ letter: 'G', contacts: ['格式', '鸽子', '归仁', '盖子', '噶油'] });
  groups.push({ letter: 'L', contacts: ['里程', '琉璃', '流星雨'] });
  groups.push({ letter: 'Z', contacts: ['中心', '中间', '桌子', '琢磨'] });
  return groups;
}

/**
 * 展开分组为列表数据，并建立字母→列表索引映射。
 * 对应 Android Demo initListData：indexMap[letter]=data.size（字母作为 header 的位置）。
 */
export function buildListData(groups: ContactGroup[]): FlatItem[] {
  let data: FlatItem[] = [];
  for (let i = 0; i < groups.length; i++) {
    let group = groups[i];
    // 字母作为 header
    let headerItem: FlatItem = { type: ITEM_TYPE_HEADER, text: group.letter };
    data.push(headerItem);
    // 联系人
    for (let j = 0; j < group.contacts.length; j++) {
      let contactItem: FlatItem = { type: ITEM_TYPE_CONTACT, text: group.contacts[j] };
      data.push(contactItem);
    }
  }
  return data;
}

/**
 * 建立字母→列表索引映射，用于 SideBar 选中后滚动定位。
 */
export function buildIndexMap(groups: ContactGroup[]): Map<string, number> {
  let map = new Map<string, number>();
  let index = 0;
  for (let i = 0; i < groups.length; i++) {
    let group = groups[i];
    map.set(group.letter, index);
    index += 1 + group.contacts.length;
  }
  return map;
}
