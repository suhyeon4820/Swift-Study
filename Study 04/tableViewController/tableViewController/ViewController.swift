//
//  ViewController.swift
//  tableViewController
//
//  Created by 정수현 on 2020/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let country = ["a", "b", "c", "d"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.register(TableViewCell2.nib(), forCellReuseIdentifier: TableViewCell2.identifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell2
        //cell.textLabel?.text = country[indexPath.row]
        cell.contentsLable.text = country[indexPath.row]
        cell.conView.layer.cornerRadius = cell.conView.frame.height/4
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
}
