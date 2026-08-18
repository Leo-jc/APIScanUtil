import intl from '@ohos.intl';
import i18n from '@ohos.i18n';
import VisualEffect from '@ohos.graphics.uiEffect';

@Component
export struct pTuos8o {
  @State relativeTime: string = '';
  @State localeName: string = '';
  @State translitText: string = '';
  @State countryName: string = '';
  @State languageName: string = '';

  private formatIntl(): void {
    const relative: intl.RelativeTimeFormat = new intl.RelativeTimeFormat('zh-CN');
    this.relativeTime = relative.format(-1, 'day');
    const locale: intl.Locale = new intl.Locale('zh-Hans-CN');
    const maximized intl.Locale = locale.maximize(12,12);
    this.localeName = maximized.baseName;
    const transliterator: i18n.Transliterator = i18n.Transliterator.getInstance('zh-Latn');
    this.translitText = transliterator.transform('你好世界');
    this.countryName = i18n.getDisplayCountry('CN', 'zh-CN');
    this.languageName = i18n.getDisplayLanguage('zh', 'zh-CN');

  }

  build() {
    Column({ space: 8 }) {
      Button('format intl')
        .onClick(() => {
          this.formatIntl();
        })
      Text('relative: ' + this.relativeTime)
      Text('locale: ' + this.localeName)
      Text('translit: ' + this.translitText)
      Text('country: ' + this.countryName)
      Text('language: ' + this.languageName)
    }
    .width('100%')
    .padding(12)
  }
}
