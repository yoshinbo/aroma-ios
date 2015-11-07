//
//  DoubleLineWrapView.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/07.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class DoubleLineWrapView: UIView {

    struct Const {
        static let color = UIColor.darkGrayColor().CGColor
        static let outerLineWidth: CGFloat = 2.0
        static let innerLineWidth: CGFloat = 1.0
        static let degree: CGFloat = Const.outerLineWidth + 1.0
    }

    private var innerView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        build()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        build()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        innerView.frame = CGRect(x: Const.degree, y: Const.degree, width: frame.width - (Const.degree * 2), height: frame.height - (Const.degree * 2))
    }

}

extension DoubleLineWrapView {
    private func build() {
        layer.borderWidth = Const.outerLineWidth
        layer.borderColor = Const.color

        innerView = UIView(frame: CGRectZero)
        innerView.layer.borderWidth = Const.innerLineWidth
        innerView.layer.borderColor = UIColor.darkGrayColor().CGColor
        addSubview(innerView)
    }
}
