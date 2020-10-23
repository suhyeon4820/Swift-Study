//
//  ViewController.swift
//  HelloWorld
//
//  Created by 정수현 on 2020/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uiTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sayHello(_ sender: Any) {
        self.uiTitle.text = "Hello, World"
    }
    
    @IBAction func fullScreenBtn(_ sender: UIButton) {
        //let secondVC = SecondViewController()
        let secondVC = (storyboard?.instantiateViewController(identifier: "secondVC"))! as SecondViewController
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated: true, completion: nil)
    }
}

