//
//  APIResponse+UserNotice.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/30.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation

extension APIResponse {
    class UserNotice: Base {
        var userId: NSNumber!
        var fromId: NSNumber!
        var contentId: NSNumber!
        var content: String!
        var noticeType: NSNumber!

        var type: NoticeType {
            return NoticeType.build(noticeType.integerValue)
        }

        override class func JSONKeyPathsByPropertyKey() -> [NSObject : AnyObject]! {
            return [
                "noticeType": "type"
            ]
        }
    }
}
