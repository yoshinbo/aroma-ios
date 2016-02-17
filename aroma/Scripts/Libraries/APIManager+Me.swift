//
//  APIManager+Me.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/31.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import Bolts

extension APIManager {
    func showMe() -> BFTask {
        return request(.GET, path: "/v1/me").APIErrorHandler()
    }

    func uploadMyInfo(parameters: [String: AnyObject]) -> BFTask {
        return request(.PUT, path: "/v1/me", parameters: parameters).APIErrorHandler()
    }

    func uploadMySetting(key: String, value: Bool) -> BFTask {
        let _value = value ? 1 : 0
        return request(.PUT, path: "/v1/me/setting/\(key)/\(_value)", parameters: nil).APIErrorHandler()
    }
}
