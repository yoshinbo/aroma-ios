//
//  PostIngredientAddCell.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/13.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class PostIngredientFooterCell: UITableViewCell {

    struct Const {
        static let borderWidth: CGFloat = 1.0
        static let height: CGFloat = 52
        static let cornerRadius: CGFloat = 18
    }

    @IBOutlet weak var wrapView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        wrapView.layer.borderColor = AppColorRed.CGColor
        wrapView.layer.borderWidth = Const.borderWidth
        wrapView.layer.cornerRadius = Const.cornerRadius
        wrapView.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    class func height() -> CGFloat {
        return Const.height
    }
}
