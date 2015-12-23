//
//  ProfileSettingLabelCell.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/12/13.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class ProfileSettingLabelCell: UITableViewCell {

    struct Const {
        static let height: CGFloat = 44
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var content: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(label: String, content: String?, color: UIColor) {
        self.label.text = label
        if let _content = content {
            self.content.text = _content
        }
        self.content.textColor = color
    }

    class func height() -> CGFloat {
        return Const.height
    }
}
