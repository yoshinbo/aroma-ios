import Foundation

@objc(RecipeDto)
class RecipeDto: _RecipeDto {

    override var description: String {
        return "id:\(id), userId:\(userId), status:\(status), title:\(title), recipeDescription:\(recipeDescription), categoryId:\(categoryId), hasCliped:\(hasCliped), hasLiked:\(hasLiked), likedNum:\(likedNum), commentedNum:\(commentedNum), clipedNum:\(clipedNum) , updatedAt:\(updatedAt), createdAt:\(createdAt))"
    }

    var status: UserStatus = .Active {
        didSet {
            statusValue = status.rawValue
        }
    }

    func fill(recipe: APIResponse.Recipe) {
        id = recipe.id
        userId = recipe.userId
        statusValue = recipe.statusValue
        title = recipe.title
        recipeDescription = recipe.recipeDescription
        categoryId = recipe.categoryId
        hasCliped = recipe.hasCliped
        hasLiked = recipe.hasLiked
        likedNum = recipe.likedNum
        commentedNum = recipe.commentedNum
        clipedNum = recipe.clipedNum
        createdAt = recipe.createdAt
        updatedAt = recipe.updatedAt
    }
}
