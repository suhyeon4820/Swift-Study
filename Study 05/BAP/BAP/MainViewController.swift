//
//  MainViewController.swift
//  BAP
//
//  Created by 정수현 on 2020/11/26.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var yearSegment: UISegmentedControl!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var locationText: UITextField!
    @IBOutlet weak var nextTapButton: UIButton!
    
    var locationData: String? = ""       // 서울시
    var districtNameData: String? = ""   // 구 이름
    var districtNumbData: String? = ""   // 구 번호
    var yearData: String? = ""           // 년도 정보
   
    
    let location = ["서울시"]
    let districtName = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"]
    let districtNumb = ["680", "740", "305", "500", "620", "215", "530", "545", "350", "320", "230", "590", "440", "410", "650", "200", "290", "710", "470", "560",  "170", "380", "110", "140", "260"]
    let year = ["2017", "2018", "2019"]

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        navigationItem.title = "자전거사고 다발지역 검색"
        yearText.placeholder = "년도를 선택하세요"
        locationText.placeholder = "지역을 선택하세요"
        nextTapButton.applyDesign()
    }
    
    @IBAction func selectedAction(_ sender: UISegmentedControl) {
        sender.selectedSegmentTintColor = #colorLiteral(red: 0.6591766477, green: 0.5804956555, blue: 0.8055412173, alpha: 1)
        if sender.selectedSegmentIndex == 0 {
            yearText.text = "2018"
        } else if sender.selectedSegmentIndex == 1 {
            yearText.text = "2019"
        }
        yearData = yearText.text
    }
    
    // 다음 페이지로 데이터 전달
    @IBAction func nextPageButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "vc") as! ViewController
        vc.yearText = yearData
        vc.localText = districtNumbData
        vc.districtText = districtNameData
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return location.count // 1
        } else {
            return districtName.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return location[row]
        } else {
            print(districtName[row])
            print(row)
            return districtName[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Reloads a particular component of the picker view
        pickerView.reloadComponent(1) // 인덱스 1 번의 변화되는 데이터를 reload
        let selectLocatoin = pickerView.selectedRow(inComponent: 0) // 서울시 pickerView
        let selectDistrict = pickerView.selectedRow(inComponent: 1) // 구이름 pickerView
        locationData = location[selectLocatoin] // 서울시
        districtNameData = districtName[selectDistrict] // 구 이름
        districtNumbData = districtNumb[selectDistrict] // 구 번호
        locationText.text = "\(locationData!)" + " " + "\(districtNameData!)"
    }
}

extension UIButton {
    func applyDesign() {
        self.backgroundColor = #colorLiteral(red: 0.5921568627, green: 0.462745098, blue: 0.8117647059, alpha: 1)
        self.setTitle("검색", for: .normal)
        self.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        self.layer.cornerRadius = 5
        self.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
    }
}
