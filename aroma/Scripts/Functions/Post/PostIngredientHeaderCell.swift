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
        static let height: CGFloat = 44
    }

    @IBOutlet weak var editButton: UIButton!

    var delegate: PostDataHandlerDelegate?
    var isIngredientEditing = false

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    class func height() -> CGFloat {
        return Const.height
    }

    @IBAction func touchUpInsideEditButton(sender: UIButton) {
        isIngredientEditing = !isIngredientEditing
        delegate?.tableEdit(isIngredientEditing)
        updateEditButtonState(editing)
    }
}

extension PostIngredientHeaderCell {
    func updateEditButtonState(editing: Bool) {
        editButton.titleLabel!.text = editing
            ? localizedString("Done")
            : localizedString("Edit")
    }
}
