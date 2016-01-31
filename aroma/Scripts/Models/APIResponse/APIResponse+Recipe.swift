//
//  APIResponse+Recipe.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/30.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation

extension APIResponse {
    class Recipe: Base {
        var userId: NSNumber!
        var title: String!
        var recipeDescription: String!
        var statusValue: NSNumber!
        var categoryId: NSNumber!
        var hasCliped: Bool!
        var hasLiked: Bool!
        var likedNum: NSNumber!
        var commentedNum: NSNumber!
        var clipedNum: NSNumber!

        override class func JSONKeyPathsByPropertyKey() -> [NSObject: AnyObject]! {
            return [
                "recipeDescription": "description",
                "statusValue": "status"
            ]
        }
    }
}
