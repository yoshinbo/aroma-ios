//
//  APIResponse+RecipeComment.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/30.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation

extension APIResponse {
    class RecipeComment: Base {
        var recipeId: NSNumber!
        var userId: NSNumber!
        var comment: String!
        var statusValue: NSNumber!

        override class func JSONKeyPathsByPropertyKey() -> [NSObject: AnyObject]! {
            return [
                "statusValue": "status"
            ]
        }
    }
}
