//
//  APIManager+Recipe.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/31.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import Bolts

extension APIManager {
    func showRecipe(id: Int) -> BFTask {
        return request(.GET, path: "/v1/recipes/\(id)").APIErrorHandler()
    }

    func createRecipe(title: String, description: String, categoryId: Int, ingredients: [[String: AnyObject]]) -> BFTask {
        return request(.POST, path: "/v1/recipes/", parameters: [
            "title": title,
            "description": description,
            "category_id": categoryId,
            "ingredients": ingredients,
        ])
    }

    func editRecipe(id: Int) -> BFTask {
        return request(.GET, path: "/v1/recipes/\(id)/edit").APIErrorHandler()
    }

    func updateRecipe(id: Int, title: String, description: String, categoryId: Int, ingredients: [[String: AnyObject]]) -> BFTask {
        return request(.PUT, path: "/v1/recipes/\(id)", parameters: [
            "title": title,
            "description": description,
            "category_id": categoryId,
            "ingredients": ingredients,
        ])
    }

    func deleteRecipe(id: Int) -> BFTask {
        return request(.DELETE, path: "/v1/recipes/\(id)").APIErrorHandler()
    }
}

// NOTE: - Recipe Comment
extension APIManager {
    func fetchRecipeComment(recipeId: Int) -> BFTask {
        return request(.GET, path: "/v1/comment_recipe?recipe_id=\(recipeId)").APIErrorHandler()
    }

    func commentRecipe(recipeId: Int, comment: String) -> BFTask {
        return request(.POST, path: "/v1/comment_recipe", parameters: [
            "recipe_id": recipeId,
            "comment": comment,
        ])
    }

    func deleteRecipeComment(id: Int) -> BFTask {
        return request(.DELETE, path: "/v1/comment_recipe/\(id)").APIErrorHandler()
    }
}


// NOTE: - Recipe Like
extension APIManager {
    func likeRecipe(recipeId: Int) -> BFTask {
        return request(.PUT, path: "/v1/like_recipe/\(recipeId)", parameters: nil)
    }

    func unlikeRecipe(recipeId: Int) -> BFTask {
        return request(.DELETE, path: "/v1/like_recipe/\(recipeId)", parameters: nil)
    }
}

// NOTE: - Recipe Clip
extension APIManager {
    func clipRecipe(recipeId: Int) -> BFTask {
        return request(.PUT, path: "/v1/clip_recipe/\(recipeId)", parameters: nil)
    }

    func unclipRecipe(recipeId: Int) -> BFTask {
        return request(.DELETE, path: "/v1/clip_recipe/\(recipeId)", parameters: nil)
    }
}
