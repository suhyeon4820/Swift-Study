//
//  ViewController.swift
//  XMLParser
//
//  Created by 정수현 on 2020/11/27.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    // xml파일을 다운로드 및 파싱하는 오브젝트
    var parser = XMLParser()
    // feed 데이터를 저장하는 Mutable array
    var posts = NSMutableArray()
    // title과 date같은 feed 데이터를 저장하는 mutable dictionary
    var elements = NSMutableDictionary()
    var element = NSString()
    // 저장 문자열 변수
    var title1 = NSMutableString()
    var date = NSMutableString()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        beginParsing()
        
    }

    // parse오브젝트 초기화하고 XMLParserDelegate로 설정하고 xml파싱 시작
    func beginParsing() {
        //posts = []
        let url = "http://apis.data.go.kr/B552061/frequentzoneBicycle/getRestFrequentzoneBicycle?serviceKey=IlkN0BhF6auPlxjnjQv1Mz7tLpHiqKhby5fa2SavSnfNiNVgDTvmIXSk%2FMLNUrUkc902NSk3yuuK6M8uU%2B1MGw%3D%3D&searchYearCd=2015&siDo=11&guGun=110&type=xml&numOfRows=10&pageNo=1"
        
        //let url = "http://images.apple.com/main/rss/hotnews/hotnews.rss"
        parser = XMLParser(contentsOf: (URL(string: url))!)!
        parser.delegate = self
        parser.parse()
        tableView!.reloadData()
    }

    
    // XML 파서가 시작 테그를 만나면 호출됨
    // parser기 새로운 element를 발견하면 변수를 생성
    // parser가 시작 태그를 만나면 호출됩니다. Ex) <name>
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "item") {
            elements = NSMutableDictionary()
            elements = [:]
            title1 = NSMutableString(); title1 = ""
            date = NSMutableString(); date = ""
        }
    }
    
    
    // title과 pubDate을 발견하면 title1과 date에 완성
    // 현재 테그에 담겨있는 문자열 전달
    // 현재 태그에 담겨있는 string이 전달됩니다.
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if element.isEqual(to: "sido_sgg_nm") {
            title1.append(string)
            //print(title1)
        } else if element.isEqual(to: "spot_nm"){
            date.append(string)
            //print(date)
        }
    }
    

    // element의 끝에서 feed 데이터를 dictionary에 저장
    // XML 파서가 종료 테그를 만나면 호출
    // parser가 닫는 태그를 만나면 호출됩니다. Ex) </name>
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if (elementName as NSString).isEqual(to: "item") {
            if !title1.isEqual(nil) {
                elements.setObject(title1, forKey: "sido_sgg_nm" as NSCopying)
            }
            if !date.isEqual(nil) {
                elements.setObject(date, forKey: "spot_nm" as NSCopying)
            }
            posts.add(elements)
            print(posts)
        }
    }
    
    private func parser(parser: XMLParser, parseErrorOccurred parseError: NSError) {
        NSLog("failure error: %@", parseError)
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    //테이블뷰 셀의 내용은 title과 subtitle을 posts 배열의 원소(dictionary)에서 title과 data에 해당하는 value로 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "sido_sgg_nm") as! NSString as String
        cell.detailTextLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "spot_nm") as! NSString as String
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
}



