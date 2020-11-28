//
//  ViewController.swift
//  UIPickerView
//
//  Created by 정수현 on 2020/11/26.
//


import UIKit

class ViewController: UIViewController {



    @IBOutlet weak var lable: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!

    @IBOutlet weak var pickerView: UIPickerView!
    
    let segments = UISegmentedControl(items: ["Year", "location"])
    
    let districtName = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"]
    let districtNumb = ["680", "740", "305", "500", "620", "215", "530", "545", "350", "320", "230", "590", "440", "410", "650", "200", "290", "710", "470", "560",  "170", "380", "110", "140", "260"]
    let year = ["2017", "2018", "2019"]
    let location = ["서울시"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    
    @IBAction func selectedAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            print("2018")
        } else if sender.selectedSegmentIndex == 1 {
            print("2019")
        }
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return location.count
        } else {
            return districtName.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return location[row]
        } else {
            return districtName[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //lable.text = districtNumb[row]
        pickerView.reloadComponent(1)
        
        let selectLocatoin = pickerView.selectedRow(inComponent: 0)
        let selectDistrict = pickerView.selectedRow(inComponent: 1)
        let locationData = location[selectLocatoin]
        let districtData = districtName[selectDistrict]
        lable.text = "\(locationData)" + "\(districtData)"
    }
}

