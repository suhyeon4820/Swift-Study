//
//  ResultViewController.swift
//  DataDelivery
//
//  Created by 정수현 on 2020/11/09.
//

import UIKit

class ResultViewController: UIViewController {
    
    var emailText: String? = ""
    var updateText: Bool = false
    var periodData: Double = 0

    @IBOutlet var emailLable: UILabel!
    @IBOutlet var isUpdated: UILabel!
    @IBOutlet var period: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLable.text = emailText
        isUpdated.text = String(updateText)
        period.text = String(Int(periodData))
    }

    @IBAction func previousPage(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pageShow(_ sender: Any) {
        let nextPage = self.storyboard?.instantiateViewController(identifier: "thirdVC") as! ThirdViewController
        self.present(nextPage, animated: true, completion: nil)
    }
    
    @IBAction func pageModal(_ sender: Any) {
        let nextPage = self.storyboard?.instantiateViewController(identifier: "thirdVC") as! ThirdViewController
        self.present(nextPage, animated: true, completion: nil)
    }
}
