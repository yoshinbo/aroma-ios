//
//  APIManager+User.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/31.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import AFNetworking
import Bolts

extension APIManager {
    func registerUser(facebookId: String, name: String) -> BFTask {
        return request(.POST, path: "/v1/users", parameters: [
            "facebook_id": facebookId,
            "name": name,
        ])
    }

    func showUser(id: Int) -> BFTask {
        return request(.GET, path: "/v1/users/\(id)").APIErrorHandler()
    }
}
