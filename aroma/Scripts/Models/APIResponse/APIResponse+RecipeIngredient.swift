//
//  APIResponse+RecipeIngredient.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/30.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation

extension APIResponse {
    class RecipeIngredient: Base {
        var recipeId: NSNumber!
        var ingredientId: NSNumber!
        var amount: NSNumber!
        var order: NSNumber!
    }
}