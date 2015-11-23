//
//  TimeLineCell.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/01.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class TimeLineCell: UITableViewCell {

    private struct Const {
        static let headerHeight: CGFloat = 50
        static let titleHeight: CGFloat = 50
        static let footerHeight: CGFloat = 50
        static let horizontalMargin: CGFloat = 8
        static let verticalMargin: CGFloat = 8
        static let font: UIFont = UIFont.systemFontOfSize(12)
        static let numberOfLines: Int = 3
        static let horizontalTotalMargin: CGFloat = horizontalMargin * 6
        static let wrapViewCornerRadius: CGFloat = 0
    }

    @IBOutlet weak var wrapView: DoubleLineWrapView!
    @IBOutlet weak var profileImageView: ProfileImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var createTimeLabel: UILabel!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeLabel: RecipeLabel!
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var likeButton: LikeButton!
    @IBOutlet weak var commentButton: CommentButton!
    @IBOutlet weak var clipButton: ClipButton!

    var delegate: TimeLineViewControllerDelegate?
    private var dataHandler: IngredientDataHandler!

    override func awakeFromNib() {
        super.awakeFromNib()

        dataHandler = IngredientDataHandler()
        descriptionLabel.font = Const.font
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure() {
        dataHandler.setup(ingredientTableView)

        let description = "子供も安心して使えるブレンドです。アウトドアでの虫よけスプレーとしてもつかえます。 子供も安心して使えるブレンドです。アウトドアでの虫よけスプレーとしてもつかえます。 子供も安心して使えるブレンドです。アウトドアでの虫よけスプレーとしてもつかえます。"
        let imageURL = NSURL(string: "https://graph.facebook.com/10202450689656441/picture?width=150&height=150")

        userNameLabel.text = "YUKI ODA"
        createTimeLabel.text = "11.1 12:00"
        recipeTitleLabel.text = "心安らかブレンド"
        recipeLabel.configure("トリートメント", color: AppColorPerpul)

        descriptionLabel.text = description
        profileImageView.configure(url: imageURL, placeholderImage: UIImage(named: "mypage"), rounded: true)
        descriptionTextHeightConstraint.constant = TimeLineCell.textViewHegiht(description)

        wrapView.layer.cornerRadius = Const.wrapViewCornerRadius
        wrapView.layer.masksToBounds = true
        wrapView.layer.borderWidth = 2.0
        wrapView.layer.borderColor = UIColor.darkGrayColor().CGColor
        layoutIfNeeded()
    }

    class func height(description: String) -> CGFloat {
        return Const.verticalMargin
            + Const.headerHeight
            + Const.titleHeight
            + IngredientDataHandler.height()
            + Const.verticalMargin
            + textViewHegiht(description)
            + Const.verticalMargin
            + Const.footerHeight
            + Const.verticalMargin
    }

    class func textViewHegiht(string: String) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width - Const.horizontalTotalMargin, height: 0))
        label.text = string
        label.font = Const.font
        label.numberOfLines = Const.numberOfLines
        label.sizeToFit()
        return label.frame.height
    }

    @IBAction func touchUpInsideProfileButton(sender: UIButton) {
        delegate?.showProfileView()
    }
}

extension TimeLineCell {
}
