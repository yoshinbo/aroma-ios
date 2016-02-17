import Foundation

@objc(RecipeIngredientDto)
class RecipeIngredientDto: _RecipeIngredientDto {
    override var description: String {
        return "id:\(id), recipeId:\(recipeId), ingredientId:\(ingredientId), amount:\(amount), order:\(order), updatedAt:\(updatedAt), createdAt:\(createdAt)"
    }

    func fill(recipeIngredient: APIResponse.RecipeIngredient) {
        id = recipeIngredient.id
        recipeId = recipeIngredient.recipeId
        ingredientId = recipeIngredient.ingredientId
        amount = recipeIngredient.amount
        order = recipeIngredient.order
        createdAt = recipeIngredient.createdAt
        updatedAt = recipeIngredient.updatedAt
    }
}
