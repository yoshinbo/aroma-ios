import Foundation

@objc(IngredientDto)
class IngredientDto: _IngredientDto {

    override var description: String {
        return "id:\(id), name:\(name), status:\(status), updatedAt:\(updatedAt), createdAt:\(createdAt)"
    }

    var status: UserStatus = .Active {
        didSet {
            statusValue = status.rawValue
        }
    }

    func fill(ingredient: APIResponse.Ingredient) {
        id = ingredient.id
        name = ingredient.name
        statusValue = ingredient.statusValue
        createdAt = ingredient.createdAt
        updatedAt = ingredient.updatedAt
    }
}
