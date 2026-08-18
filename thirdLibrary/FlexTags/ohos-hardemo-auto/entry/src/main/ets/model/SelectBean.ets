/**
 * SelectBean —— 选中示例的数据模型。
 * 对应 Android com.chockqiu.flextags.been.SelectBeen。
 */
export class SelectBean {
  text: string = '';
  isSelected: boolean = false;

  constructor(text: string = '', isSelected: boolean = false) {
    this.text = text;
    this.isSelected = isSelected;
  }
}
