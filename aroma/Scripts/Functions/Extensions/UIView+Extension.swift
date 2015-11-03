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
}