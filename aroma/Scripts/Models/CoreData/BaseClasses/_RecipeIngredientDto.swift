// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RecipeIngredientDto.swift instead.

import CoreData

enum RecipeIngredientDtoAttributes: String {
    case amount = "amount"
    case createdAt = "createdAt"
    case id = "id"
    case ingredientId = "ingredientId"
    case name = "name"
    case order = "order"
    case recipeId = "recipeId"
    case updatedAt = "updatedAt"
}

enum RecipeIngredientDtoRelationships: String {
    case recipe = "recipe"
}

@objc
class _RecipeIngredientDto: NSManagedObject {

    // MARK: - Class methods

    class func entityName () -> String {
        return "RecipeIngredient"
    }

    class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _RecipeIngredientDto.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged
    var amount: NSNumber?

    // func validateAmount(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var createdAt: NSDate?

    // func validateCreatedAt(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var id: NSNumber?

    // func validateId(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var ingredientId: NSNumber?

    // func validateIngredientId(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var name: String?

    // func validateName(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var order: NSNumber?

    // func validateOrder(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var recipeId: String?

    // func validateRecipeId(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var updatedAt: NSDate?

    // func validateUpdatedAt(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    // MARK: - Relationships

    @NSManaged
    var recipe: RecipeDto?

    // func validateRecipe(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

}

