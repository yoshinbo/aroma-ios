//
//  SETextView+Extension.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/01.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import SECoreTextView

extension SETextView {
    func hasSetAttributes(string: String) -> Bool {
        return attributedText != nil && attributedText.string == string
    }
    func setBasicAttributedString(string: String) {
        if hasSetAttributes(string) { return }
        attributedText = NSMutableAttributedString(string: string)
        setWholeTextColor(UIColor.darkGrayColor())
        setLinkerText(UIColor.blueColor())
    }

    // MARK : - Private Methods

    private func setWholeTextColor(color: UIColor) {
        let attributedString = NSMutableAttributedString(attributedString: attributedText)
        attributedString.addAttribute(NSForegroundColorAttributeName, value: color, range: NSMakeRange(0, attributedString.length))
        attributedText = attributedString
    }

    private func setLinkerText(color: UIColor) {
        let attributedString = NSMutableAttributedString(attributedString: attributedText)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { [weak self] in
            if let _self: SETextView = self {
                attributedString.addAttributeForLink(color)
                dispatch_sync(dispatch_get_main_queue(), { [weak _self] in
                    if let __self: SETextView = _self {
                        if __self.attributedText.string == attributedString.string {
                            __self.attributedText = attributedString
                        }
                    }
                })
            }
        })
    }

    private func setHighlightKeywords(keywords: [String]?, color: UIColor) {
        if keywords != nil && keywords!.count > 0 {
            let attributedString = NSMutableAttributedString(attributedString: attributedText)
            attributedString.addAttributeForHighlightKeywords(keywords!, color: color)
            attributedText = attributedString
        }
    }
}
