/*
 * Copyright (c) 2026. TableFixHeaders HarmonyOS Adaptation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { BaseTableAdapter } from 'tablefixheaders';
import { CellItem } from './CellItem';

// ---- 常量定义 ----
const TOTAL_ROWS: number = 14;
const TOTAL_COLS: number = 6;
const HEADER_HEIGHT: number = 35;
const FAMILY_HEIGHT: number = 25;
const DATA_HEIGHT: number = 45;
const FIVE_VIEW_TYPES: number = 5;
const VIEW_TYPE_FIRST_HEADER: number = 0;
const VIEW_TYPE_HEADER: number = 1;
const VIEW_TYPE_FIRST_BODY: number = 2;
const VIEW_TYPE_BODY: number = 3;
const VIEW_TYPE_FAMILY: number = 4;
const HEADER_ROW_INDEX: number = -1;
const HEADER_COL_INDEX: number = -1;
const FIRST_ROW_CHECK: number = 0;
const ZERO_INDEX: number = 0;
const NEGATIVE_SENTINEL: number = 0;
const DATA_OFFSET: number = 1;
const DEVICE_NAME_INDEX: number = 0;
const DEVICE_COMPANY_INDEX: number = 1;
const DEVICE_VERSION_INDEX: number = 2;
const DEVICE_API_INDEX: number = 3;
const DEVICE_STORAGE_INDEX: number = 4;
const DEVICE_INCHES_INDEX: number = 5;
const DEVICE_RAM_INDEX: number = 6;
const BG_HEADER: string = '#F0C3B6';
const BG_FAMILY: string = '#BDF0CB';
const BG_DATA_EVEN: string = '#EBF1A8';
const BG_DATA_ODD: string = '#D5F0FF';
const ALTERNATE_ROW_DIVISOR: number = 2;
const ALTERNATE_ROW_REMAINDER: number = 0;
const DEFAULT_CELL_TEXT: string = '';

/**
 * 单台 Nexus 设备的数据模型。
 */
class NexusDevice {
  name: string = '';
  company: string = '';
  version: string = '';
  api: string = '';
  storage: string = '';
  inches: string = '';
  ram: string = '';

  constructor(name: string, company: string, version: string, api: string,
    storage: string, inches: string, ram: string) {
    this.name = name;
    this.company = company;
    this.version = version;
    this.api = api;
    this.storage = storage;
    this.inches = inches;
    this.ram = ram;
  }

  getData(index: number): string {
    if (index === DEVICE_NAME_INDEX) {
      return this.name;
    }
    if (index === DEVICE_COMPANY_INDEX) {
      return this.company;
    }
    if (index === DEVICE_VERSION_INDEX) {
      return this.version;
    }
    if (index === DEVICE_API_INDEX) {
      return this.api;
    }
    if (index === DEVICE_STORAGE_INDEX) {
      return this.storage;
    }
    if (index === DEVICE_INCHES_INDEX) {
      return this.inches;
    }
    if (index === DEVICE_RAM_INDEX) {
      return this.ram;
    }
    return DEFAULT_CELL_TEXT;
  }
}

/**
 * 设备家族分组。
 */
class DeviceFamily {
  name: string = '';
  devices: NexusDevice[] = [];

  constructor(name: string) {
    this.name = name;
  }

  addDevice(device: NexusDevice): void {
    this.devices.push(device);
  }

  size(): number {
    return this.devices.length;
  }

  getDevice(index: number): NexusDevice {
    return this.devices[index];
  }
}

/**
 * FamilyTableAdapter 提供分组设备表格数据。
 * 对应 Android FamilyTable 中的 FamilyNexusAdapter。
 */
export class FamilyTableAdapter extends BaseTableAdapter {
  private readonly headers: string[] = ['Name', 'Company', 'Version', 'API', 'Storage', 'Size', 'RAM'];
  private readonly colWidths: number[] = [120, 100, 140, 60, 70, 60, 60];
  private families: DeviceFamily[] = [];

  constructor() {
    super();
    this.initData();
  }

  private initData(): void {
    const mobiles: DeviceFamily = new DeviceFamily('Mobiles');
    mobiles.addDevice(new NexusDevice('Nexus One', 'HTC', 'Gingerbread', '10', '512 MB', '3.7"', '512 MB'));
    mobiles.addDevice(new NexusDevice('Nexus S', 'Samsung', 'Gingerbread', '10', '16 GB', '4"', '512 MB'));
    mobiles.addDevice(new NexusDevice('Galaxy Nexus (16 GB)', 'Samsung', 'Ice Cream Sandwich', '15', '16 GB', '4.65"', '1 GB'));
    mobiles.addDevice(new NexusDevice('Galaxy Nexus (32 GB)', 'Samsung', 'Ice Cream Sandwich', '15', '32 GB', '4.65"', '1 GB'));
    mobiles.addDevice(new NexusDevice('Nexus 4 (8 GB)', 'LG', 'Jelly Bean', '17', '8 GB', '4.7"', '2 GB'));
    mobiles.addDevice(new NexusDevice('Nexus 4 (16 GB)', 'LG', 'Jelly Bean', '17', '16 GB', '4.7"', '2 GB'));

    const tablets: DeviceFamily = new DeviceFamily('Tablets');
    tablets.addDevice(new NexusDevice('Nexus 7 (16 GB)', 'Asus', 'Jelly Bean', '16', '16 GB', '7"', '1 GB'));
    tablets.addDevice(new NexusDevice('Nexus 7 (32 GB)', 'Asus', 'Jelly Bean', '16', '32 GB', '7"', '1 GB'));
    tablets.addDevice(new NexusDevice('Nexus 10 (16 GB)', 'Samsung', 'Jelly Bean', '17', '16 GB', '10"', '2 GB'));
    tablets.addDevice(new NexusDevice('Nexus 10 (32 GB)', 'Samsung', 'Jelly Bean', '17', '32 GB', '10"', '2 GB'));

    const others: DeviceFamily = new DeviceFamily('Others');
    others.addDevice(new NexusDevice('Nexus Q', '--', 'Honeycomb', '13', '--', '--', '--'));

    this.families.push(mobiles);
    this.families.push(tablets);
    this.families.push(others);
  }

  getRowCount(): number {
    return TOTAL_ROWS;
  }

  getColumnCount(): number {
    return TOTAL_COLS;
  }

  getView(row: number, column: number): object {
    if (row === HEADER_ROW_INDEX && column === HEADER_COL_INDEX) {
      return new CellItem(this.headers[DEVICE_NAME_INDEX]);
    }
    if (row === HEADER_ROW_INDEX) {
      return new CellItem(this.headers[column + DATA_OFFSET]);
    }
    if (this.isFamilyRow(row)) {
      if (column === HEADER_COL_INDEX) {
        return new CellItem(this.getFamilyName(row));
      }
      return new CellItem(DEFAULT_CELL_TEXT);
    }
    const device: NexusDevice | undefined = this.getDeviceForRow(row);
    if (device !== undefined) {
      if (column === HEADER_COL_INDEX) {
        return new CellItem(device.getData(DEVICE_NAME_INDEX));
      }
      return new CellItem(device.getData(column + DATA_OFFSET));
    }
    return new CellItem(DEFAULT_CELL_TEXT);
  }

  getWidth(column: number): number {
    return this.colWidths[column + DATA_OFFSET];
  }

  getHeight(row: number): number {
    if (row === HEADER_ROW_INDEX) {
      return HEADER_HEIGHT;
    }
    if (this.isFamilyRow(row)) {
      return FAMILY_HEIGHT;
    }
    return DATA_HEIGHT;
  }

  getCellBackground(row: number, column: number): string {
    if (row === HEADER_ROW_INDEX || column === HEADER_COL_INDEX) {
      return BG_HEADER;
    }
    if (this.isFamilyRow(row)) {
      return BG_FAMILY;
    }
    if (row % ALTERNATE_ROW_DIVISOR === ALTERNATE_ROW_REMAINDER) {
      return BG_DATA_EVEN;
    }
    return BG_DATA_ODD;
  }

  getItemViewType(row: number, column: number): number {
    if (row === HEADER_ROW_INDEX && column === HEADER_COL_INDEX) {
      return VIEW_TYPE_FIRST_HEADER;
    }
    if (row === HEADER_ROW_INDEX) {
      return VIEW_TYPE_HEADER;
    }
    if (this.isFamilyRow(row)) {
      return VIEW_TYPE_FAMILY;
    }
    if (column === HEADER_COL_INDEX) {
      return VIEW_TYPE_FIRST_BODY;
    }
    return VIEW_TYPE_BODY;
  }

  getViewTypeCount(): number {
    return FIVE_VIEW_TYPES;
  }

  private isFamilyRow(row: number): boolean {
    let r: number = row;
    for (let i = ZERO_INDEX; i < this.families.length; i++) {
      if (r === NEGATIVE_SENTINEL) {
        return true;
      }
      r -= this.families[i].size() + DATA_OFFSET;
    }
    return false;
  }

  private getFamilyName(row: number): string {
    let r: number = row;
    for (let i = ZERO_INDEX; i < this.families.length; i++) {
      r -= this.families[i].size() + DATA_OFFSET;
      if (r < NEGATIVE_SENTINEL) {
        return this.families[i].name;
      }
    }
    return '';
  }

  private getDeviceForRow(row: number): NexusDevice | undefined {
    let r: number = row;
    for (let i = ZERO_INDEX; i < this.families.length; i++) {
      const familySize: number = this.families[i].size();
      if (r === NEGATIVE_SENTINEL) {
        return undefined; // family row
      }
      r--;
      if (r < familySize) {
        return this.families[i].getDevice(r);
      }
      r -= familySize;
    }
    return undefined;
  }
}
