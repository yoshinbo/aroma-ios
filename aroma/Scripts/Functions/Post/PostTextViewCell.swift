//
//  PostTextViewCell.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/08.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class PostTextViewCell: UITableViewCell {

    struct Const {
        static let verticalMargin: CGFloat = 8
        static let horizontalTotalMargin: CGFloat = 32
        static let numberOfLines: Int = 0
        static let font: UIFont = UIFont.systemFontOfSize(14)
        static let normalColor = AppColorLightGray
        static let warningColor = AppColorRed
        static let format = "%d / %d"
    }

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var placeholder: UILabel!

    var delegate: PostViewControllerDelegate?
    var maxInputLength: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()

        textView.delegate = self
        textView.font = Const.font
        placeholder.font = Const.font
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(text: String, placeholder: String, maxInputLength: Int) {
        textView.text = text
        self.placeholder.text = placeholder
        self.maxInputLength = maxInputLength
        updatePlaceholderState()
    }

    class func height(string: String) -> CGFloat {
        return Const.verticalMargin
            + textViewHegiht(string)
            + Const.verticalMargin
    }
}

extension PostTextViewCell {
    private class func textViewHegiht(string: String) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width - Const.horizontalTotalMargin, height: 0))
        label.text = string
        label.font = Const.font
        label.numberOfLines = Const.numberOfLines
        label.sizeToFit()
        return label.frame.height
    }
}

extension PostTextViewCell: UITextViewDelegate {
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        let keyboardNavigationString = String(format: Const.format, textView.text.characters.count, maxInputLength)
        delegate?.updateKeyboardNavigation(keyboardNavigationString, color: Const.normalColor)
        placeholder.hidden = true
        return true
    }

    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        var trimText = (textView.text as NSString).stringByReplacingCharactersInRange(range, withString: text)
        let textCount = trimText.characters.count
        trimText = trimText.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())

        let keyboardNavigationString = String(format: Const.format, textCount, maxInputLength)
        if textCount > maxInputLength {
            textView.text = trimText.substringToIndex(trimText.startIndex.advancedBy(maxInputLength))
            delegate?.updateKeyboardNavigation(keyboardNavigationString, color: Const.warningColor)
            return false
        }
        delegate?.updateKeyboardNavigation(keyboardNavigationString, color: Const.normalColor)
        return true
    }

    func textViewDidEndEditing(textView: UITextView) {
        updatePlaceholderState()
    }

    private func updatePlaceholderState() {
        placeholder.hidden = !textView.text.isEmpty
    }
}
