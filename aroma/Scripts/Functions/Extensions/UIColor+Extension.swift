//
//  UIColor+Extension.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/02.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class func color(hex: UInt32) -> UIColor {
        let red = CGFloat(((hex & 0xff000000) >> 24))/255.0
        let green = CGFloat(((hex & 0x00ff0000) >> 16))/255.0
        let blue = CGFloat(((hex & 0x0000ff00) >> 8))/255.0
        let alpha = CGFloat((hex & 0x000000ff))/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}