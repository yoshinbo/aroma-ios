// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RecipeTimelineDto.swift instead.

import CoreData

enum RecipeTimelineDtoAttributes: String {
    case layoutHeight = "layoutHeight"
    case layoutVersion = "layoutVersion"
    case recipeId = "recipeId"
    case sortValue = "sortValue"
    case typeValue = "typeValue"
}

enum RecipeTimelineDtoRelationships: String {
    case recipe = "recipe"
}

@objc
class _RecipeTimelineDto: NSManagedObject {

    // MARK: - Class methods

    class func entityName () -> String {
        return "RecipeTimeline"
    }

    class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _RecipeTimelineDto.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged
    var layoutHeight: NSNumber?

    // func validateLayoutHeight(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var layoutVersion: NSNumber?

    // func validateLayoutVersion(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var recipeId: NSNumber?

    // func validateRecipeId(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var sortValue: NSNumber?

    // func validateSortValue(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var typeValue: NSNumber?

    // func validateTypeValue(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    // MARK: - Relationships

    @NSManaged
    var recipe: RecipeDto?

    // func validateRecipe(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

}

