//
//  TimeLineCell.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/01.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit
import SECoreTextView

class TimeLineCell: UITableViewCell {

    private struct Const {
        static let headerHeight: CGFloat = 50
        static let titleHeight: CGFloat = 50
        static let footerHeight: CGFloat = 50
        static let widthMargin: CGFloat = 8
        static let heightMargin: CGFloat = 8
        static let font: UIFont = UIFont.systemFontOfSize(12)
        static let lineSpacing: CGFloat = 5
        static let horizontalMargin: CGFloat = widthMargin * 6
    }

    @IBOutlet weak var profileImageView: ProfileImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var createTimeLabel: UILabel!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBOutlet weak var descriptionTextView: SETextView!
    @IBOutlet weak var descriptionTextHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var likeButton: LikeButton!
    @IBOutlet weak var commentButton: CommentButton!
    @IBOutlet weak var clipButton: ClipButton!

    private var dataHandler: IngredientDataHandler!

    override func awakeFromNib() {
        super.awakeFromNib()

        dataHandler = IngredientDataHandler()

        descriptionTextView.delegate = self
        descriptionTextView.lineSpacing = Const.lineSpacing
        descriptionTextView.font = Const.font
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure() {
        dataHandler.setup(ingredientTableView)

        userNameLabel.text = "YUKI ODA"
        createTimeLabel.text = "11.1 12:00"
        recipeTitleLabel.text = "心安らかブレンド"
        let description = "子供も安心して使えるブレンドです。アウトドアでの虫よけスプレーとしてもつかえます。"
        descriptionTextView.setBasicAttributedString(description)
        descriptionTextHeightConstraint.constant = TimeLineCell.textViewHegiht(description, margin: Const.horizontalMargin)
    }

    class func height(description: String) -> CGFloat {
        return Const.headerHeight + Const.titleHeight + IngredientDataHandler.height() + textViewHegiht(description, margin: Const.horizontalMargin) + Const.footerHeight
    }

    class func textViewHegiht(string: String, margin: CGFloat) -> CGFloat {
        let frame = SETextView.frameRectWithAttributtedString(NSAttributedString(string: string), constraintSize: CGSize(width: UIScreen.mainScreen().bounds.width - margin, height: 10000), lineSpacing: Const.lineSpacing, font: Const.font)
        return frame.size.height
    }

    @IBAction func touchUpInsideLikeButton(sender: LikeButton) {
    }

    @IBAction func touchUpInsideCommentButton(sender: CommentButton) {
    }

    @IBAction func touchUpInsideClipButton(sender: ClipButton) {
    }
}

extension TimeLineCell {
}

extension TimeLineCell: SETextViewDelegate {
}
