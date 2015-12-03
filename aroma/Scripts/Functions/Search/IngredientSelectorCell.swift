//
//  IngredientSelectorCell.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/12/03.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class IngredientSelectorCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(name: String) {
        nameLabel.text = name
    }
}
