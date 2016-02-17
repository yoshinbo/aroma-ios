//
//  Tracker.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/31.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation
/** TODO: -
 Distribuionだったら表示しないとかある程度たまったらサーバーに送るなど
 機能追加したいのでクラスにしておく。
 **/
class Tracker {

    class var sharedInstance: Tracker {
        struct Static {
            static let instance = Tracker()
        }
        return Static.instance
    }

    func debug(message: String) {
        print("debug : \(message)")
    }

    func warn(message: String) {
        print("warn : \(message)")
    }

    func error(message: String) {
        print("error : \(message)")
    }
}
