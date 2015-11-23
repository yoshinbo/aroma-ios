//
//  PostIngredientHeaderCell.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/14.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class PostIngredientHeaderCell: UITableViewCell {

    struct Const {
        static let height: CGFloat = 35
    }

    @IBOutlet weak var editButton: UIButton!

    var delegate: PostDataHandlerDelegate?
    var isIngredientEditing = false

    override func awakeFromNib() {
        super.awakeFromNib()
        tintColor = AppColorRed
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    class func height() -> CGFloat {
        return Const.height
    }

    func configure(isEditing: Bool) {
        //editButton.titleLabel!.text = isEditing
        //    ? localizedString("Done")
        //    : localizedString("Edit")
    }

    @IBAction func touchUpInsideEditButton(sender: UIButton) {
        isIngredientEditing = !isIngredientEditing
        delegate?.tableEdit(isIngredientEditing)
        //editButton.titleLabel!.text = isIngredientEditing
        //    ? localizedString("Done")
        //    : localizedString("Edit")
    }
}
