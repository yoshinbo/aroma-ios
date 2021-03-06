//
//  APIResponse.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/30.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import Mantle

public struct APIResponse {

    static let dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()

    static func parse<T: MTLModel where T: MTLJSONSerializing>(klass: T.Type, _ dictionary: AnyObject?) -> T? {
        if let _dictionary = dictionary as? NSDictionary {
            return (try? MTLJSONAdapter.modelOfClass(klass, fromJSONDictionary: _dictionary as [NSObject: AnyObject], error: ())) as? T
        }
        return nil
    }

    static func parseJSONArray<T: MTLModel where T: MTLJSONSerializing>(klass: T.Type, _ array: AnyObject?) -> [T]? {
        if let _array = array as? NSArray {
            return (try? MTLJSONAdapter.modelsOfClass(klass, fromJSONArray: _array as [AnyObject])) as? [T]
        }
        return nil
    }

    static func dateJSONTransformer() -> NSValueTransformer {
        return MTLValueTransformer.reversibleTransformerWithForwardBlock({
            (obj) -> AnyObject! in
            return self.dateFormatter.dateFromString(obj as! String)
            }, reverseBlock: {
                (obj) -> AnyObject! in
                return self.dateFormatter.stringFromDate(obj as! NSDate)
            }
        )
    }

    static func modelClassJSONTransformer<T: MTLModel where T: MTLJSONSerializing>(klass: T.Type) -> NSValueTransformer {
        return NSValueTransformer.mtl_JSONDictionaryTransformerWithModelClass(klass)
    }

    class Base: MTLModel, MTLJSONSerializing {
        var id: NSNumber!
        var createdAt: NSDate!
        var updatedAt: NSDate!

        class func JSONKeyPathsByPropertyKey() -> [NSObject: AnyObject]! {
            return [:]
        }

        class func createdAtJSONTransformer() -> NSValueTransformer {
            return APIResponse.dateJSONTransformer()
        }

        class func updatedAtJSONTransformer() -> NSValueTransformer {
            return APIResponse.dateJSONTransformer()
        }
    }
}
