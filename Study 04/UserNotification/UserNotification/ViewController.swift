//
//  ViewController.swift
//  UserNotification
//
//  Created by 정수현 on 2020/11/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapButton(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("ColorChanged"), object: nil)
        view.backgroundColor = .red
    }
    
}

