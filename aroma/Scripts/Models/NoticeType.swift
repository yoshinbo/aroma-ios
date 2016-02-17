//
//  NoticeType.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/30.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation

enum NoticeType: Int {
    case News = 0
    case Comment = 1
    case Like = 2
    case Clip = 3

    static func build(rawValue: Int?) -> NoticeType {
        return rawValue.flatMap { NoticeType(rawValue: $0) } ?? .News
    }
}
