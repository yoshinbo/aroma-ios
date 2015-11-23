//
//  RecipeDetailCell.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/07.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class RecipeDetailCell: UITableViewCell {

    private struct Const {
        static let headerHeight: CGFloat = 64
        static let recipeLabelHeight: CGFloat = 24
        static let recipeIndexHeight: CGFloat = 20
        static let buttonHeight: CGFloat = 25
        static let horizontalMargin: CGFloat = 8
        static let verticalMargin: CGFloat = 8
        static let recipeTitleFont: UIFont = UIFont.systemFontOfSize(17)
        static let descriptionFont: UIFont = UIFont.systemFontOfSize(12)
        static let numberOfLines: Int = 0
        static let horizontalTotalMargin: CGFloat = horizontalMargin * 4
    }

    @IBOutlet weak var profileImageView: ProfileImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var createTimeLabel: UILabel!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeTitleTextHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var recipeLabel: RecipeLabel!
    @IBOutlet weak var wrapView: DoubleLineWrapView!
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var likeButton: LikeButton!
    @IBOutlet weak var commentButton: CommentButton!
    @IBOutlet weak var clipButton: ClipButton!

    private var dataHandler: IngredientDataHandler!

    override func awakeFromNib() {
        super.awakeFromNib()

        dataHandler = IngredientDataHandler()
        recipeTitleLabel.font = Const.recipeTitleFont
        descriptionLabel.font = Const.descriptionFont
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure() {
        dataHandler.setup(ingredientTableView)

        let title = "心安らかブレンド"
        let description = "子供も安心して使えるブレンドです。アウトドアでの虫よけスプレーとしてもつかえます。 子供も安心して使えるブレンドです。アウトドアでの虫よけスプレーとしてもつかえます。 子供も安心して使えるブレンドです。アウトドアでの虫よけスプレーとしてもつかえます。"
        let imageURL = NSURL(string: "https://graph.facebook.com/10202450689656441/picture?width=150&height=150")

        userNameLabel.text = "YUKI ODA"
        createTimeLabel.text = "11.1 12:00"
        recipeTitleLabel.text = title
        recipeTitleTextHeightConstraint.constant = RecipeDetailCell.recipeTitleTextHeight(title)
        recipeLabel.configure("トリートメント", color: AppColorPerpul)

        descriptionLabel.text = description
        profileImageView.configure(url: imageURL, placeholderImage: UIImage(named: "mypage"), rounded: true)
        descriptionTextHeightConstraint.constant = RecipeDetailCell.descriptionTextHeight(description)
    }

    class func height(title: String, description: String) -> CGFloat {
        return Const.headerHeight
            + Const.verticalMargin * 2
            + recipeTitleTextHeight(title)
            + Const.verticalMargin * 2
            + Const.recipeLabelHeight
            + Const.verticalMargin * 2
            + Const.verticalMargin
            + Const.recipeIndexHeight
            + Const.verticalMargin
            + IngredientDataHandler.height()
            + Const.verticalMargin
            + Const.verticalMargin * 2
            + Const.buttonHeight
            + Const.verticalMargin * 2
            + descriptionTextHeight(description)
            + Const.verticalMargin * 2
            + Const.verticalMargin * 2
    }

    class func recipeTitleTextHeight(string: String) -> CGFloat {
        return textViewHegiht(string, font: Const.recipeTitleFont)
    }

    class func descriptionTextHeight(string: String) -> CGFloat {
        return textViewHegiht(string, font: Const.descriptionFont)
    }

    class func textViewHegiht(string: String, font: UIFont) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width - Const.horizontalTotalMargin, height: 0))
        label.text = string
        label.font = font
        label.numberOfLines = Const.numberOfLines
        label.sizeToFit()
        return label.frame.height
    }
}
