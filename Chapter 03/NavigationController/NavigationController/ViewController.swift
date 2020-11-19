//
//  ViewController.swift
//  NavigationController
//
//  Created by 정수현 on 2020/11/06.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
    }
    
    

    
    @IBAction func nextPage(_ sender: Any) {
//        let nextPage = (storyboard?.instantiateViewController(identifier: "secondVC"))! as ViewController2
//        self.navigationController?.pushViewController(nextPage, animated: true)
        self.performSegue(withIdentifier: "segueVC2", sender: self)
        print("segue")
    }
    
    
    @IBAction func callPage(_ sender: Any) {
        let callPage = self.storyboard?.instantiateViewController(identifier: "secondVC") as! ViewController2
        //let callPage = (storyboard?.instantiateViewController(identifier: "ViewController2"))! as ViewController3
        self.present(callPage, animated: true, completion: nil)
    }
    
    
    
}

