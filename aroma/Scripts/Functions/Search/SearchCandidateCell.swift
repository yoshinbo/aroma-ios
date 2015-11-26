//
//  SearchCandidateCell.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/26.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class SearchCandidateCell: UITableViewCell {

    struct Const {
        static let height: CGFloat = 44
    }

    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(text: String) {
       label.text = text
    }

    class func height() -> CGFloat {
        return Const.height
    }
}
