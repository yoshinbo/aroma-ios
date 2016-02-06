//
//  APIResponse+RecipeTimeline.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/30.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import Mantle
import MagicalRecord

extension APIResponse {
    class RecipeTimeline: MTLModel, MTLJSONSerializing {
        var recipeId: NSNumber!
        var typeValue: NSNumber!
        var sortValue: NSNumber!
        var recipe: Recipe!

        var type: TimelineType {
            return TimelineType.build(typeValue.integerValue)
        }

        class func recipeJSONTransformer() -> NSValueTransformer {
            return APIResponse.modelClassJSONTransformer(Recipe.self)
        }

        class func JSONKeyPathsByPropertyKey() -> [NSObject: AnyObject]! {
            return [
                "typeValue": "type"
            ]
        }
    }
}
