//
//  DataStore.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/31.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import Bolts
import MagicalRecord

final class DataStore: NSObject {
    static let sharedInstance = DataStore()

    private var queue: dispatch_queue_t

    override private init() {
        queue = QueueManager.sharedInstance.backgroundQueueForDataStore()
        super.init()
    }

    func saveUser(user: APIResponse.User) -> BFTask {
        return save { (context, willUpdate) -> Void in
            self.saveUser(user, context: context)
            return
        }
    }

    func saveRecipe(recipe: APIResponse.Recipe) -> BFTask {
        return save { (context, willUpdate) -> Void in
            return
        }
    }

    func deleteAll() -> BFTask {
        return save {
            (context, willUpdate) -> Void in
            self.truncateAll(context)
        }
    }
}

// MARK: - Praivate functions
extension DataStore {
    private func save(block: (NSManagedObjectContext, inout Bool) -> Void) -> BFTask {
        let completionSource = BFTaskCompletionSource()

        GCD.run(queue) {
            var willUpdate = false

            MagicalRecord.saveWithBlockAndWait {
                (context) -> Void in
                block(context, &willUpdate)
            }
            completionSource.setResult(willUpdate)
        }

        return completionSource.task
    }

    // NOTE: - Related Users
    private func saveUser(user: APIResponse.User, context: NSManagedObjectContext) -> UserDto {
        let userDto: UserDto = UserDto.firstOrInitializeById(user.id, context: context)
        userDto.fill(user)
        return userDto
    }

    // NOTE: - Related Recipes
    private func saveRecipe(recipe: APIResponse.Recipe, context: NSManagedObjectContext) -> RecipeDto {
        let userDto = saveUser(recipe.user, context: context)
        let categoryDto = saveCategory(recipe.category, context: context)
        let recipeIngredientsDto = saveRecipeIngredients(recipe.recipeIngredients, context: context)
        let recipeCommentsDto = saveRecipeComments(recipe.recipeComments, context: context)
        let recipeDto: RecipeDto = RecipeDto.firstOrInitializeById(recipe.id, context: context)
        recipeDto.fill(recipe)
        recipeDto.user = userDto
        recipeDto.category = categoryDto
        recipeDto.ingredients = NSSet(array: recipeIngredientsDto)
        recipeDto.comments = NSOrderedSet(array: recipeCommentsDto)
        return recipeDto
    }

    private func saveRecipeComments(recipeComments: [APIResponse.RecipeComment], context: NSManagedObjectContext) -> [RecipeCommentDto] {
        return recipeComments.map { self.saveRecipeComment($0, context: context) }
    }

    private func saveRecipeComment(recipeComment: APIResponse.RecipeComment, context: NSManagedObjectContext) -> RecipeCommentDto {
        let userDto = saveUser(recipeComment.user, context: context)
        let recipeCommentDto: RecipeCommentDto = RecipeCommentDto.firstOrInitializeById(recipeComment.id, context: context)
        recipeCommentDto.fill(recipeComment)
        recipeCommentDto.user = userDto
        return recipeCommentDto
    }

    private func saveRecipeIngredients(recipeIngredients: [APIResponse.RecipeIngredient], context: NSManagedObjectContext) -> [RecipeIngredientDto] {
        return recipeIngredients.map { self.saveRecipeIngredient($0, context: context) }
    }

    private func saveRecipeIngredient(recipeIngredient: APIResponse.RecipeIngredient, context: NSManagedObjectContext) -> RecipeIngredientDto {
        let ingredientDto = saveIngredient(recipeIngredient.ingredient, context: context)
        let recipeIngredientDto: RecipeIngredientDto = RecipeIngredientDto.firstOrInitializeById(recipeIngredient.id, context: context)
        recipeIngredientDto.ingredient = ingredientDto
        return recipeIngredientDto
    }

    private func saveIngredient(category: APIResponse.Ingredient, context: NSManagedObjectContext) -> IngredientDto {
        let ingredientDto: IngredientDto = IngredientDto.firstOrInitializeById(category.id, context: context)
        ingredientDto.fill(category)
        return ingredientDto
    }

    private func saveCategory(category: APIResponse.Category, context: NSManagedObjectContext) -> CategoryDto {
        let categoryDto: CategoryDto = CategoryDto.firstOrInitializeById(category.id, context: context)
        categoryDto.fill(category)
        return categoryDto
    }

    private func saveRecipeTimeLines(timelines: [APIResponse.RecipeTimeline], context: NSManagedObjectContext) -> [RecipeTimelineDto] {
        return timelines.map { self.saveRecipeTimeLine($0, context: context) }
    }

    private func saveRecipeTimeLine(timeline: APIResponse.RecipeTimeline, context: NSManagedObjectContext) -> RecipeTimelineDto {
        let recipeDto = saveRecipe(timeline.recipe, context: context)
        let timelineDto: RecipeTimelineDto = RecipeTimelineDto.findFirstNormalWithRecipeId(recipeDto.id!, context: context)
        timelineDto.fill(timeline)
        timelineDto.recipe = recipeDto
        return timelineDto
    }


    // NOTE: - キャッシュが全部消えるので気をつけてね。
    private func truncateAll(context: NSManagedObjectContext) {
        RecipeTimelineDto.MR_truncateAllInContext(context)
        RecipeDto.MR_truncateAllInContext(context)
        RecipeIngredientDto.MR_truncateAllInContext(context)
        RecipeCommentDto.MR_truncateAllInContext(context)
        IngredientDto.MR_truncateAllInContext(context)

        UserDto.MR_truncateAllInContext(context)
    }
}
