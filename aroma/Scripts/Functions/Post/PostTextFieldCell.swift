//
//  PostTextFieldCell.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/18.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class PostTextFieldCell: UITableViewCell {

    struct Const {
        static let height: CGFloat = 33
        static let numberOfLines: Int = 0
        static let font: UIFont = UIFont.systemFontOfSize(17)
        static let normalColor = AppColorLightGray
        static let warningColor = AppColorRed
        static let format = "%d / %d"
    }

    @IBOutlet weak var textField: UITextField!

    var delegate: PostViewControllerDelegate?
    var maxInputLength: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(placeholder: String, max: Int) {
        maxInputLength = max
        textField.placeholder = placeholder
        textField.delegate = self
    }

    class func height() -> CGFloat {
        return Const.height
    }
}

extension PostTextFieldCell: UITextFieldDelegate {
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        let keyboardNavigationString = String(format: Const.format, textField.text!.characters.count, maxInputLength)
        delegate?.updateKeyboardNavigation(keyboardNavigationString, color: Const.normalColor)
        return true
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var trimText = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
        let textCount = trimText.characters.count
        trimText = trimText.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())

        let keyboardNavigationString = String(format: Const.format, textCount, maxInputLength)
        if textCount > maxInputLength {
            textField.text = trimText.substringToIndex(trimText.startIndex.advancedBy(maxInputLength))
            delegate?.updateKeyboardNavigation(keyboardNavigationString, color: Const.warningColor)
            return false
        }
        delegate?.updateKeyboardNavigation(keyboardNavigationString, color: Const.normalColor)
        return true
    }
}
