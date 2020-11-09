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
        
        print("1페이지 1, viewDidLoad")
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("1페이지 2, viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("1페이지 3, viewDidAppear")
        print("++++++++++++++++++++++")
       
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("1페이지 4, viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("1페이지 5, viewDidDisappear")
        print("++++++++++++++++++++++")
        print("++++++++++++++++++++++")
    }

    
    @IBAction func sayHello(_ sender: Any) {
        self.uiTitle.text = "Hello, World"
    }
    
    @IBAction func fullScreenBtn(_ sender: UIButton) {
        //let secondVC = SecondViewController()
        let secondVC = (storyboard?.instantiateViewController(identifier: "secondVC"))! as SecondViewController
        secondVC.modalPresentationStyle = .fullScreen
        //.coverVertical  crossDissolve  flipHorizontal  partialCurl
        secondVC.modalTransitionStyle = .partialCurl
        self.present(secondVC, animated: true, completion: nil)
    }
}

