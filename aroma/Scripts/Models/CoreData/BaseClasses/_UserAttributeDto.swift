// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to UserAttributeDto.swift instead.

import CoreData

enum UserAttributeDtoAttributes: String {
    case createdAt = "createdAt"
    case id = "id"
    case introduction = "introduction"
    case regionId = "regionId"
    case updatedAt = "updatedAt"
    case url = "url"
    case userId = "userId"
}

@objc
class _UserAttributeDto: NSManagedObject {

    // MARK: - Class methods

    class func entityName () -> String {
        return "UserAttribute"
    }

    class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _UserAttributeDto.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged
    var createdAt: NSDate?

    // func validateCreatedAt(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var id: NSNumber?

    // func validateId(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var introduction: String?

    // func validateIntroduction(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var regionId: NSNumber?

    // func validateRegionId(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var updatedAt: NSDate?

    // func validateUpdatedAt(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var url: String?

    // func validateUrl(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var userId: NSNumber?

    // func validateUserId(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    // MARK: - Relationships

}

