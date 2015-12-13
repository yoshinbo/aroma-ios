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
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    var delegate: ProfileSettingDataHandlerDelegate?
    var maxInputLength = Const.maxInputLength

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

    func configure(label: String, content: String?) {
        self.label.text = label
        if let _content = content {
            self.textView.text = _content
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
    func textViewDidChange(textView: UITextView) {
    }

    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        var trimText = (textView.text! as NSString).stringByReplacingCharactersInRange(range, withString: text)
        let textCount = trimText.characters.count
        trimText = trimText.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())

        if textCount > maxInputLength {
            textView.text = trimText.substringToIndex(trimText.startIndex.advancedBy(maxInputLength))
            return false
        }
        return true
    }
}
