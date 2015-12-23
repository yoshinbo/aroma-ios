//
//  ProfileSettingTextViewCell.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/12/13.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class ProfileSettingTextViewCell: UITableViewCell {

    struct Const {
        static let height: CGFloat = 44
        static let verticalMargin: CGFloat = 8
        static let horizontalTotalMargin: CGFloat = 16 + 84 + 8 + 16
        static let numberOfLines: Int = 0
        static let font: UIFont = UIFont.systemFontOfSize(14)
        static let maxInputLength: Int = 300
        static let format = "%d / %d"
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var keyboardNavigationLabel: UILabel!

    var max: Int = 0
    var delegate: ProfileSettingDataHandlerDelegate?
    var maxInputLength = Const.maxInputLength
    var keyboardHeight: CGFloat = 0
    var screenHeight: CGFloat = UIScreen.mainScreen().bounds.size.height

    override func awakeFromNib() {
        super.awakeFromNib()

        textView.delegate = self
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    class func height(content: String) -> CGFloat {
        let textViewHeight = ProfileSettingTextViewCell.textViewHeight(content, font: Const.font)
        return textViewHeight > Const.height ? textViewHeight : Const.height
    }

    func configure(label: String, content: String?, max: Int = Const.maxInputLength) {
        self.label.text = label
        if let _content = content {
            self.textView.text = _content
        }
        self.max = max

        keyboardNavigationLabel.text = String(format: Const.format, textView.text.characters.count, self.max)
        keyboardNavigationLabel.textColor = AppColorStringS
    }

    func willShowKeyboard(notification: NSNotification) {
        if let userInfo = notification.userInfo{
            if let keyboard = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue{
                keyboardHeight = keyboard.CGRectValue().size.height
            }
        }
    }
}

extension ProfileSettingTextViewCell {
    class func textViewHeight(string: String, font: UIFont) -> CGFloat {
        let _textView = UITextView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width - Const.horizontalTotalMargin, height: 0))
        _textView.font = font
        _textView.text = string
        _textView.sizeToFit()
        return _textView.frame.height
    }
}

extension ProfileSettingTextViewCell: UITextViewDelegate {
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "willShowKeyboard:", name: UIKeyboardWillShowNotification, object: nil)
        return true
    }

    func textViewDidChange(textView: UITextView) {
        delegate?.refreshCellHeight()
        if keyboardHeight > 0 && screenHeight - keyboardHeight < UIView.absPoint(textView).y + textView.frame.height {
            textView.scrollEnabled = true
        } else {
            textView.scrollEnabled = false
        }
    }

    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        let count = (textView.text.characters.count - range.length) + text.characters.count
        if 0 < count && count <= max {
            keyboardNavigationLabel.textColor = AppColorStringS
        } else {
            keyboardNavigationLabel.textColor = AppColorRed
        }
        keyboardNavigationLabel.text = String(format: Const.format, count, max)

        var trimText = (textView.text! as NSString).stringByReplacingCharactersInRange(range, withString: text)
        trimText = trimText.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        if trimText.characters.count > max {
            textView.text = trimText.substringToIndex(trimText.startIndex.advancedBy(max))
        }
        return true
    }

    func textViewDidBeginEditing(textView: UITextView) {
        keyboardNavigationLabel.text = String(format: Const.format, textView.text.characters.count, max)
    }

    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        return true
    }
}
