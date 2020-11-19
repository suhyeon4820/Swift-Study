//
//  ViewController.swift
//  DataDelivery
//
//  Created by 정수현 on 2020/11/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var isSwtich: UISwitch!
    @IBOutlet weak var isStepper: UIStepper!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet var switchLabel: UILabel!
    @IBOutlet var periodLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // 초기상태
        self.switchLabel.text = "자동갱신"
        self.periodLabel.text = "0분마다"
    }

    @IBAction func onSwitch(_ sender: UISwitch) {
        if (sender.isOn == true) {
            self.switchLabel.text = "갱신함"
        } else {
            self.switchLabel.text = "갱신하지 않음"
        }
    }
   
    @IBAction func onStepper(_ sender: UIStepper) {
        let stepperNumber = String(Int(sender.value))
        self.periodLabel.text = "\(stepperNumber)분 마다"
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        let nextPage = self.storyboard?.instantiateViewController(identifier: "resultVC") as! ResultViewController
        nextPage.emailText = self.email.text!
        nextPage.updateText = self.isSwtich.isOn
        nextPage.periodData = self.isStepper.value
        self.navigationController?.pushViewController(nextPage, animated: true)
    
    }
    
}

