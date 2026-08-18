import xml from '@ohos.xml';
import stream from '@ohos.util.stream';

class SaxSource extends stream.Readable {
  private readonly content: string;

  constructor(content: string) {
    super();
    this.content = content;
  }

  doRead(size: number): void {
    this.push(this.content);
    this.push(null);
  }
}

class SaxHandler implements xml.XmlSAXHandler {
  private readonly events: string[] = [];

  startDocument(): void {
    this.events.push('startDocument');
  }

  endDocument(): void {
    this.events.push('endDocument');
  }

  startElement(elementName: string, namespaceURI: string | undefined, qName: string | undefined, attributes: Map<string, string>): void {
    this.events.push('start:' + elementName);
  }

  endElement(elementName: string, namespaceURI: string | undefined, qName: string | undefined): void {
    this.events.push('end:' + elementName);
  }

  characters(content: string): void {
    this.events.push('text:' + content);
  }

  getEvents(): string[] {
    return this.events;
  }
}

@Component
export struct mH4bYq5 {
  @State saxInfo: string = '';

  private parseSax(): void {
    const source: stream.Readable = new SaxSource('<note id="1"><to>Tom</to><from>Jerry</from></note>');
    const parser: xml.XmlSAXParser = new xml.XmlSAXParser(source);
    const handler: SaxHandler = new SaxHandler();
    parser.parse(handler);
    this.saxInfo = handler.getEvents().join(',');
  }

  build() {
    Column({ space: 8 }) {
      Button('parse sax')
        .onClick(() => {
          this.parseSax();
        })
      Text('sax: ' + this.saxInfo)
    }
    .width('100%')
    .padding(12)
  }
}
