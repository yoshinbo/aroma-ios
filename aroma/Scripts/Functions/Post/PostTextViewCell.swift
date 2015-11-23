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
        static let horizontalTotalMargin: CGFloat = 48
        static let numberOfLines: Int = 0
        static let font: UIFont = UIFont.systemFontOfSize(17)
    }

    @IBOutlet weak var label: UILabel!

    var delegate: PostViewControllerDelegate?


    override func awakeFromNib() {
        super.awakeFromNib()
        label.font = Const.font
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(text: String) {
        label.textColor = text == localizedString("descriptionPlaceholder") ? AppColorStringS : AppColorString
        label.text = text
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