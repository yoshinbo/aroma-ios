//
//  APIResponse+User.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/30.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation

extension APIResponse {
    class User: Base {
        var facebookId: String!
        var name: String!
    }
}