// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RecipeDto.swift instead.

import CoreData

enum RecipeDtoAttributes: String {
    case category = "category"
    case categoryId = "categoryId"
    case clipedNum = "clipedNum"
    case commentedNum = "commentedNum"
    case createdAt = "createdAt"
    case hasCliped = "hasCliped"
    case hasLiked = "hasLiked"
    case id = "id"
    case likedNum = "likedNum"
    case recipeDescription = "recipeDescription"
    case statusValue = "statusValue"
    case title = "title"
    case updatedAt = "updatedAt"
    case userId = "userId"
}

enum RecipeDtoRelationships: String {
    case comments = "comments"
    case ingredients = "ingredients"
    case recipeTimeline = "recipeTimeline"
    case user = "user"
}

@objc
class _RecipeDto: NSManagedObject {

    // MARK: - Class methods

    class func entityName () -> String {
        return "Recipe"
    }

    class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _RecipeDto.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged
    var category: String?

    // func validateCategory(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var categoryId: NSNumber?

    // func validateCategoryId(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var clipedNum: NSNumber?

    // func validateClipedNum(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var commentedNum: NSNumber?

    // func validateCommentedNum(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var createdAt: NSDate?

    // func validateCreatedAt(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var hasCliped: NSNumber?

    // func validateHasCliped(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var hasLiked: NSNumber?

    // func validateHasLiked(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var id: NSNumber?

    // func validateId(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var likedNum: NSNumber?

    // func validateLikedNum(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var recipeDescription: String?

    // func validateRecipeDescription(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var statusValue: NSNumber?

    // func validateStatusValue(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var title: String?

    // func validateTitle(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var updatedAt: NSDate?

    // func validateUpdatedAt(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var userId: NSNumber?

    // func validateUserId(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    // MARK: - Relationships

    @NSManaged
    var comments: NSOrderedSet

    @NSManaged
    var ingredients: NSSet

    @NSManaged
    var recipeTimeline: NSSet

    @NSManaged
    var user: UserDto?

    // func validateUser(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

}

extension _RecipeDto {

    func addComments(objects: NSOrderedSet) {
        let mutable = self.comments.mutableCopy() as! NSMutableOrderedSet
        mutable.unionOrderedSet(objects)
        self.comments = mutable.copy() as! NSOrderedSet
    }

    func removeComments(objects: NSOrderedSet) {
        let mutable = self.comments.mutableCopy() as! NSMutableOrderedSet
        mutable.minusOrderedSet(objects)
        self.comments = mutable.copy() as! NSOrderedSet
    }

    func addCommentsObject(value: RecipeCommentDto!) {
        let mutable = self.comments.mutableCopy() as! NSMutableOrderedSet
        mutable.addObject(value)
        self.comments = mutable.copy() as! NSOrderedSet
    }

    func removeCommentsObject(value: RecipeCommentDto!) {
        let mutable = self.comments.mutableCopy() as! NSMutableOrderedSet
        mutable.removeObject(value)
        self.comments = mutable.copy()as! NSOrderedSet
    }

}

extension _RecipeDto {

    func addIngredients(objects: NSSet) {
        let mutable = self.ingredients.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as Set<NSObject>)
        self.ingredients = mutable.copy() as! NSSet
    }

    func removeIngredients(objects: NSSet) {
        let mutable = self.ingredients.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as Set<NSObject>)
        self.ingredients = mutable.copy() as! NSSet
    }

    func addIngredientsObject(value: RecipeIngredientDto!) {
        let mutable = self.ingredients.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.ingredients = mutable.copy()as! NSSet
    }

    func removeIngredientsObject(value: RecipeIngredientDto!) {
        let mutable = self.ingredients.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.ingredients = mutable.copy() as! NSSet
    }

}

extension _RecipeDto {

    func addRecipeTimeline(objects: NSSet) {
        let mutable = self.recipeTimeline.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as Set<NSObject>)
        self.recipeTimeline = mutable.copy() as! NSSet
    }

    func removeRecipeTimeline(objects: NSSet) {
        let mutable = self.recipeTimeline.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as Set<NSObject>)
        self.recipeTimeline = mutable.copy() as! NSSet
    }

    func addRecipeTimelineObject(value: RecipeTimelineDto!) {
        let mutable = self.recipeTimeline.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.recipeTimeline = mutable.copy() as! NSSet
    }

    func removeRecipeTimelineObject(value: RecipeTimelineDto!) {
        let mutable = self.recipeTimeline.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.recipeTimeline = mutable.copy() as! NSSet
    }

}
