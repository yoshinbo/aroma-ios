//
//  UITableViewCell+Extension.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/23.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import UIKit

let UITableViewCellSeparatorHeight: CGFloat = 0.5
let UITableViewCellSeparatorMargin: CGFloat = 15.0
let UITableViewCellSeparatorColor: UIColor = AppColorLightGray

extension UITableViewCell {
    func setSeparator(row: Int, lastIndex: Int) {
        if row > 0 && row < lastIndex { addSeparator() }
        if row == 0 { addTopSeparator() }
        if row == lastIndex-1 { addBottomSeparator() }
    }

    func addTopSeparator() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: UITableViewCellSeparatorHeight))
        view.backgroundColor = UITableViewCellSeparatorColor
        contentView.addSubview(view)
    }

    func addBottomSeparator() {
        let view = UIView(frame: CGRect(x: 0, y: bounds.size.height-UITableViewCellSeparatorHeight, width: bounds.size.width, height: UITableViewCellSeparatorHeight))
        view.backgroundColor = UITableViewCellSeparatorColor
        contentView.addSubview(view)
    }

    func addSeparator() {
        let width = UITableViewCellSeparatorMargin * 2.0
        let view = UIView(frame: CGRect(x: UITableViewCellSeparatorMargin, y: 0, width: bounds.size.width-width, height: UITableViewCellSeparatorHeight))
        view.backgroundColor = UITableViewCellSeparatorColor
        contentView.addSubview(view)
    }
}
