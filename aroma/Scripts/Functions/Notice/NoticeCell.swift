//
//  NoticeCell.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/03.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class NoticeCell: UITableViewCell {

    private struct Const {
        static let font: UIFont = UIFont.systemFontOfSize(12)
        static let lineSpacing: CGFloat = 5
    }

    @IBOutlet weak var profileImageView: ProfileImageView!
    @IBOutlet weak var textView: UITextView!

    var delegate: NoticeViewControllerDelegate?
    private var dataHandler: IngredientDataHandler!

    override func awakeFromNib() {
        super.awakeFromNib()

        dataHandler = IngredientDataHandler()

        //textView.lineSpacing = Const.lineSpacing
        textView.font = Const.font
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure() {
        let notice = "Yoshikazu Odaさんがあなたのレシピをクリップしました！"
        let imageURL = NSURL(string: "https://graph.facebook.com/10202450689656441/picture?width=150&height=150")

        textView.text = notice
        profileImageView.configure(url: imageURL, placeholderImage: UIImage(named: "mypage-icon"), rounded: true)
    }

    class func height(description: String) -> CGFloat {
        return 72.0
    }

    class func textViewHegiht(string: String, margin: CGFloat) -> CGFloat {
        return 72.0
    }

    @IBAction func touchUpInsideProfileButton(sender: UIButton) {
        delegate?.showProfileView()
    }
}
