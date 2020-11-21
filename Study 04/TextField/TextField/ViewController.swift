//
//  ViewController.swift
//  TextField
//
//  Created by 정수현 on 2020/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.placeholder = "값을 입력하세요"
        self.textField.keyboardType = UIKeyboardType.phonePad
        self.textField.keyboardAppearance = UIKeyboardAppearance.dark
        self.textField.returnKeyType = UIReturnKeyType.join
        // 리턴키 자동 활성화 On
        self.textField.enablesReturnKeyAutomatically = true
        
    }

}

