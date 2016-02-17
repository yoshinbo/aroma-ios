import Foundation
import MagicalRecord

@objc(RecipeTimelineDto)
class RecipeTimelineDto: _RecipeTimelineDto {
    struct Const {
        static let layoutVersion: Int = 100000
    }

    override var description: String {
        return "recipeId:\(recipeId), typeValue:\(typeValue), sortValue:\(sortValue), layoutVersion:\(layoutVersion), layoutHeight:\(layoutHeight)"
    }

    var type: TimelineType = .Normal {
        didSet {
            typeValue = type.rawValue
        }
    }

    func fill(timeline: APIResponse.RecipeTimeline) {
        recipeId = timeline.recipeId
        typeValue = timeline.typeValue
        sortValue = timeline.sortValue

        // TODO : - cellの高さ計算
        layoutVersion = Const.layoutVersion
        layoutHeight = 100
    }
}

extension RecipeTimelineDto {
    class func findFirstNormalWithRecipeId(recipeId: NSNumber, context: NSManagedObjectContext) -> RecipeTimelineDto {
        let predicate = NSPredicate(format: "recipeId = %d && typeValue = %d", recipeId.integerValue, TimelineType.Normal.rawValue)
        if let record = MR_findFirstWithPredicate(predicate, inContext: context) {
            return record
        }
        return RecipeTimelineDto.MR_createEntityInContext(context) as RecipeTimelineDto
    }
}
