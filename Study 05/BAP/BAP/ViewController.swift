//
//  ViewController.swift
//  BAP
//
//  Created by 정수현 on 2020/11/25.
//

import UIKit
import Alamofire
import SwiftyXMLParser

// https://www.youtube.com/watch?v=yyCxsV4yvoo

class ViewController: UIViewController, XMLParserDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let districtName = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"]
    
    var xmlParser = XMLParser()
    var data = [String]()
    var detailData = [String]()
    var elements = [String: String]() // 영화 item Dictionary
    var element = "" // 현재 Element
    
    var spotName = "" // 지역 정보
    var spotDetailName = "" // 지역 세부 정보
    
    var yearText: String? = ""
    var localText: String? = ""
    var districtText: String? = ""
    //var string: String? = ""
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        beginParsing()
        initSearchBar()
        
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "\(String(describing: yearText!))"+"년 "+"\(String(describing: districtText!))"+"\n자전거 사고 발생 현황"
        self.navigationItem.titleView = label
        
    }
    
    func initSearchBar() {
        //searchBar.enablesReturnKeyAutomatically = false
        searchBar.returnKeyType = UIReturnKeyType.done
        //definesPresentationContext = true //한글 잘 안쳐짐
        navigationItem.hidesSearchBarWhenScrolling = false
        searchBar.delegate = self
    
    }
    
    func beginParsing() {
        let Url = "http://apis.data.go.kr/B552061/frequentzoneBicycle/getRestFrequentzoneBicycle?"
        let key = "ServiceKey=IlkN0BhF6auPlxjnjQv1Mz7tLpHiqKhby5fa2SavSnfNiNVgDTvmIXSk%2FMLNUrUkc902NSk3yuuK6M8uU%2B1MGw%3D%3D"
        let url = "\(Url)"+"\(key)"+"&searchYearCd="+"\(yearText!)"+"&siDo=11&guGun="+"\(localText!)"+"&type=xml&numOfRows=10&pageNo=1"
        // URL타입의 매개변수를 넣어줘서 XMLParser 객체를 생성
        guard let xmlParser = XMLParser(contentsOf: URL(string: url)!) else { return }
        xmlParser.delegate = self
        // parse()를 통해서 넣어준 URL의 응답을 파싱
        xmlParser.parse()
    }
    
    // didStartElement(태그 시작) : XMLParserDelegate 함수 -> XML 파서가 시작 테그를 만나면 호출됨
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        element = elementName
        if (elementName == "item") {
            elements = [:]
            spotName = ""
            spotDetailName = ""
        }
    }

    // foundCharacters : 현재 테그에 담겨있는 문자열 전달
    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        if (element == "sido_sgg_nm") {
            spotName.append(string)
        } else if (element == "spot_nm") {
            spotDetailName.append(string)
        }
    }
    
    
    // didEndElement(태그 끝) : XML 파서가 종료 테그를 만나면 호출됨
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if (elementName == "item") {
            elements["sido_sgg_nm"] = spotName
            elements["spot_nm"] = spotDetailName
            data.append(spotName)
            detailData.append(spotDetailName)
        }
    }
}

var filteredData = [String]()
var filter = false

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return data.count
        if filter {
            return filteredData.count
        } else {
            return detailData.count
        }

    }
    
    //테이블뷰 셀의 내용은 title과 subtitle을 posts 배열의 원소(dictionary)에서 title과 data에 해당하는 value로 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if filter {
            cell.textLabel?.text = filteredData[indexPath.row]
        } else {
            cell.textLabel?.text = detailData[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60)
    }
}


extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filteredData = detailData.filter({$0.prefix(searchText.count) == searchText})
//        filter = true
//        print(filteredData)
//        tableView.reloadData()
        
        filteredData = detailData.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText)
            return range.location != NSNotFound
        })
        if(filteredData.count == 0){
            filter = false;
        } else {
            filter = true;
        }
        tableView.reloadData()
    }
    
}




