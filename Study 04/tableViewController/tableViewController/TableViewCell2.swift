//
//  TableViewCell2.swift
//  tableViewController
//
//  Created by 정수현 on 2020/11/23.
//

import UIKit

class TableViewCell2: UITableViewCell {

    @IBOutlet weak var conView: UIView!
    @IBOutlet weak var contentsImage: UIImageView!
    @IBOutlet weak var contentsLable: UILabel!
    
    static let identifier = "TableViewCell2"
    
    static func nib() -> UINib {
        return UINib(nibName: "TableViewCell2", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
