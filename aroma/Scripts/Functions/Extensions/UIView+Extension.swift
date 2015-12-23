//
//  UIView+Extension.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/03.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func round() {
        layer.cornerRadius = frame.size.width * 0.5
        layer.masksToBounds = true
    }

    func connerLittleRound() {
        layer.cornerRadius = 3
        layer.masksToBounds = true
    }

    class func absPoint(view: UIView) -> CGPoint {
        var ret: CGPoint = CGPointMake(view.frame.origin.x, view.frame.origin.y)
        if view.superview != nil {
            let addPoint = absPoint(view.superview!)
            ret = CGPointMake(ret.x + addPoint.x, ret.y + addPoint.y)
        }
        return ret
    }
}
