//
//  PostIngredientCell.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/13.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class PostIngredientCell: UITableViewCell {

    struct Const {
        static let height: CGFloat = 44
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    class func height() -> CGFloat {
        return Const.height
    }
}
