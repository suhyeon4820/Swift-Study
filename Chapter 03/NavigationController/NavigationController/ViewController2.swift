//
//  ViewController2.swift
//  NavigationController
//
//  Created by 정수현 on 2020/11/08.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //self.navigationItem.title = "2"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func previousPage(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func returnPage(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
