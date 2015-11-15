//
//  PostIndexCell.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/08.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class PostIndexCell: UITableViewCell {

    struct Const {
        static let height: CGFloat = 44
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var subLabel: UILabel!

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

    func configure(text: String) {
        label.text = localizedString("category")
        subLabel.text = text
    }
}
