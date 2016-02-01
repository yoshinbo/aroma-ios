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
        var user: User!
        var category: Category!
        var recipeIngredients: [RecipeIngredient]!
        var recipeComments: [RecipeComment]!

        class func userJSONTransformer() -> NSValueTransformer {
            return APIResponse.modelClassJSONTransformer(User.self)
        }

        class func categoryJSONTransformer() -> NSValueTransformer {
            return APIResponse.modelClassJSONTransformer(Category.self)
        }

        class func recipeIngredientsJSONTransformer() -> NSValueTransformer {
            return NSValueTransformer.mtl_JSONArrayTransformerWithModelClass(RecipeIngredient.self)
        }

        class func recipeCommentsJSONTransformer() -> NSValueTransformer {
            return NSValueTransformer.mtl_JSONArrayTransformerWithModelClass(RecipeComment.self)
        }

        override class func JSONKeyPathsByPropertyKey() -> [NSObject: AnyObject]! {
            return [
                "recipeDescription": "description",
                "statusValue": "status"
            ]
        }
    }
}
