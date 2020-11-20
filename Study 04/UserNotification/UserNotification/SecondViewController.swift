//
//  SecondViewController.swift
//  UserNotification
//
//  Created by 정수현 on 2020/11/20.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(nodtificationReceived), name: Notification.Name("ColorChanged"), object: nil)
    }
    
    @objc func nodtificationReceived() {
        view.backgroundColor = .red
    }
}
