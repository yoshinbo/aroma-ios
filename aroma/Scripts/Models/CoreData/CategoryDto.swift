import Foundation

@objc(CategoryDto)
class CategoryDto: _CategoryDto {

    override var description: String {
        return "id:\(id), name:\(name), status:\(status)"
    }

    var status: UserStatus = .Active {
        didSet {
            statusValue = status.rawValue
        }
    }

    func fill(category: APIResponse.Category) {
        id = category.id
        name = category.name
        statusValue = category.statusValue
    }
}
