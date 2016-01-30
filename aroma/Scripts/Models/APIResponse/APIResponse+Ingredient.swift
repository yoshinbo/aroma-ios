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
    class Ingredient: MTLModel, MTLJSONSerializing {
        var id: NSNumber!
        var name: String!

        class func JSONKeyPathsByPropertyKey() -> [NSObject: AnyObject]! {
            return [:]
        }
    }
}
