import Foundation

@objc(RecipeCommentDto)
class RecipeCommentDto: _RecipeCommentDto {

	// Custom logic goes here.
    override var description: String {
        return "id:\(id), userId:\(userId), status:\(status), comment:\(comment), updatedAt:\(updatedAt), createdAt:\(createdAt)"
    }

    var status: UserStatus = .Active {
        didSet {
            statusValue = status.rawValue
        }
    }

    func fill(recipeComment: APIResponse.RecipeComment) {
        id = recipeComment.id
        userId = recipeComment.userId
        comment = recipeComment.comment
        statusValue = recipeComment.statusValue
        createdAt = recipeComment.createdAt
        updatedAt = recipeComment.updatedAt
    }
}
