//
//  UIViewController+Extension.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/10/28.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func closeViewController() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}