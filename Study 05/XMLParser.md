## XMLParser

>An event driven parser of XML documents (including DTD declarations)

```swift
class XMLParser : NSObject
```





// *************************************************

   

   

  //  // xml파일을 다운로드 및 파싱한느 오브젝트

  //  var parser = XMLParser()

  //  // feed 데이터를 저장하는 Mutable array

  //  var posts = NSMutableArray()

  //  // title과 date같은 feed 데이터를 저장하는 mutable dictionary

  //  var elements = NSMutableDictionary()

  //  var element = NSString()

  //  // 저장 문자열 변수

  //  var title1 = NSMutableString()

  //  var date = NSMutableString()

  //

  //  override func viewDidLoad() {

  //    super.viewDidLoad()

  //    tableView.delegate = self

  //    tableView.dataSource = self

  //    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

  //    beginParsing()

  //  }

  //

  //  // parse오브젝트 초기화하고 XMLParserDelegate로 설정하고 xml파싱 시작

  //  func beginParsing() {

  //    posts = []

  //    let url = "http://apis.data.go.kr/B552061/frequentzoneBicycle/getRestFrequentzoneBicycle?serviceKey=IlkN0BhF6auPlxjnjQv1Mz7tLpHiqKhby5fa2SavSnfNiNVgDTvmIXSk%2FMLNUrUkc902NSk3yuuK6M8uU%2B1MGw%3D%3D&searchYearCd=2015&siDo=11&guGun=110&type=xml&numOfRows=10&pageNo=1"

  //    //let url = "http://images.apple.com/main/rss/hotnews/hotnews.rss"

  //    parser = XMLParser(contentsOf: (URL(string: url))!)!

  //    parser.delegate = self

  //    parser.parse()

  //    tableView!.reloadData()

  //  }

  //

  //  // XML 파서가 시작 테그를 만나면 호출됨

  //  // parser기 새로운 element를 발견하면 변수를 생성

  //  // parser가 시작 태그를 만나면 호출됩니다. Ex) <name>

  //  func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {

  //    element = elementName as NSString

  //    if (elementName as NSString).isEqual(to: "item") {

  //      elements = NSMutableDictionary()

  //      elements = [:]

  //      title1 = NSMutableString(); title1 = ""

  //      date = NSMutableString(); date = ""

  //    }

  //  }

  //

  //  // title과 pubDate을 발견하면 title1과 date에 완성

  //  // 현재 테그에 담겨있는 문자열 전달

  //  // 현재 태그에 담겨있는 string이 전달됩니다.

  //  func parser(_ parser: XMLParser, foundCharacters string: String) {

  //    if element.isEqual(to: "bjd_cd") {

  //      title1.append(string)

  //      //print(title1)

  //    } else if element.isEqual(to: "spot_nm"){

  //      date.append(string)

  //      //print(date)

  //    }

  //  }

  //

  //  // element의 끝에서 feed 데이터를 dictionary에 저장

  //  // XML 파서가 종료 테그를 만나면 호출됨

  //  // parser가 닫는 태그를 만나면 호출됩니다. Ex) </name>

  //  func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {

  //    if (elementName as NSString).isEqual(to: "item") {

  //      if !title1.isEqual(nil) {

  //        elements.setObject(title1, forKey: "bjd_cd" as NSCopying)

  //      }

  //      if !date.isEqual(nil) {

  //        elements.setObject(date, forKey: "spot_nm" as NSCopying)

  //      }

  //      posts.add(elements)

  //    }

  //  }

  //

  //  private func parser(parser: XMLParser, parseErrorOccurred parseError: NSError) {

  //    NSLog("failure error: %@", parseError)

  //  }

  //

  //

   