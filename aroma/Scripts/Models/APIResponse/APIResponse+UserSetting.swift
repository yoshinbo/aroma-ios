//
//  APIResponse+UserSetting.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/30.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation

extension APIResponse {
    class UserSetting: Base {
        var userId: NSNumber!
        var key: String!
        var value: String!
    }
}