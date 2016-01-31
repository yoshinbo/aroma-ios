//
//  UserStatus.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/31.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation

enum UserStatus: Int {
    case Active = 0
    case Banned = 99
    case withdraw = 1

    static func build(rawValue: Int?) -> UserStatus {
        return rawValue.flatMap { UserStatus(rawValue: $0) } ?? .Active
    }
}
