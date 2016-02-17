//
//  APIResponse+Ingredient.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/30.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import Mantle

extension APIResponse {
    class Ingredient: Base {
        var name: String!
        var statusValue: NSNumber!

        override class func JSONKeyPathsByPropertyKey() -> [NSObject: AnyObject]! {
            return [
                "statusValue": "status"
            ]
        }
    }
}
