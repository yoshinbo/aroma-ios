//
//  CategorySelectorCell.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/15.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class CategorySelectorCell: UITableViewCell {

    struct Const {
        static let height: CGFloat = 44
    }

    @IBOutlet weak var nameLabel: UILabel!

    var id: Int!
    var name: String!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    class func height() -> CGFloat {
        return Const.height
    }

    func configure(id: Int, name: String) {
        self.id = id
        self.name = name
        nameLabel.text = name
    }
}
