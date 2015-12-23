//
//  NotificationSettingSwitchCell.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/12/19.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class NotificationSettingSwitchCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var noticeSwitch: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(label: String, on: Bool) {
        self.label.text = label
        noticeSwitch.on = on
    }
}
