//
//  ProfileSettingTextFieldCell.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/12/13.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class ProfileSettingTextFieldCell: UITableViewCell {

    struct Const {
        static let height: CGFloat = 44
        static let maxInputLength: Int = 100
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!

    var maxInputLength = Const.maxInputLength

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(label: String, content: String?, placeholder: String?) {
        self.label.text = label
        if let _content = content {
            self.textField.text = _content
        }
        if let _placeholder = placeholder {
            self.textField.placeholder = _placeholder
        }
    }

    class func height() -> CGFloat {
        return Const.height
    }
}
