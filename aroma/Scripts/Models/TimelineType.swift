//
//  TimelineType.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/30.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation

enum TimelineType: Int {
    case Normal = 0

    static func build(rawValue: Int?) -> TimelineType {
        return rawValue.flatMap { TimelineType(rawValue: $0) } ?? .Normal
    }
}
