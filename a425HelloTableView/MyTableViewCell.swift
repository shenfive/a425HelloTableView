//
//  MyTableViewCell.swift
//  a425HelloTableView
//
//  Created by 申潤五 on 2021/5/2.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var headerImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phone: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
