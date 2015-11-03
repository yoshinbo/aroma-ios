//
//  SwitchingHeaderView.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/03.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class SwitchingHeaderView: UIView {

    private struct Const {
        static let margin: CGFloat = 1
        static let borderHeight: CGFloat = 2
        static let borderColor = AppColorRed
    }

    weak var borderView: UIView!

    override func awakeFromNib() {
        let v = UIView(frame: CGRect(x: Const.margin, y: 0, width: 0, height: Const.borderHeight))
        addSubview(v)
        borderView = v
    }

    override func layoutSubviews() {
        borderView.backgroundColor = Const.borderColor
        var buttons = [UIButton]()
        for v in subviews {
            if let b = v as? UIButton {
                buttons.append(b)
            }
        }

        if buttons.count == 0 { return }

        let buttonWidth = (frame.width - (Const.margin*2)) / CGFloat(buttons.count)

        borderView.frame.origin.y = frame.height - borderView.frame.height
        var borderFrame = borderView.frame
        borderFrame.size.width = buttonWidth
        borderView.frame = borderFrame

        var i = 0
        for b in buttons {
            b.frame = CGRect(x: Const.margin + CGFloat(i) * buttonWidth, y: 5, width: buttonWidth, height: 40)
            i++
        }
    }

    func setBorderOffset(rate: CGFloat) {
        let offsetSize = frame.width - Const.margin * 2 - borderView.frame.width
        borderView.frame.origin.x = Const.margin + offsetSize * rate
    }


}
