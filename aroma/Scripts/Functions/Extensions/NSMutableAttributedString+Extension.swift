//
//  NSMutableAttributedString+Extension.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/01.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import SECoreTextView

let dataDetector = try? NSDataDetector(types: NSTextCheckingType.Link.rawValue)
extension NSMutableAttributedString {
    func addAttributeForLink(color: UIColor) {
        if let detector = dataDetector {
            let results = detector.matchesInString(string, options: NSMatchingOptions.ReportProgress, range: NSMakeRange(0, length))
            if results.count > 0 {
                for result in results {
                    let _result = result
                    addAttribute(NSLinkAttributeName, value: _result.URL!, range: _result.range)
                    addAttribute(NSForegroundColorAttributeName, value: color, range: _result.range)
                }
            }
        }
    }

    func addAttributeForHighlightKeywords(keywords: [String], color: UIColor) {
        let string = self.string
        let pattern = keywords.joinWithSeparator("|")
        let regex = try? NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions.CaseInsensitive)
        let matches = regex?.matchesInString(string, options: [], range: NSMakeRange(0, string.characters.count))
        for match in matches! {
            addAttribute(NSBackgroundColorAttributeName, value: color, range: match.range)
        }
    }
}
