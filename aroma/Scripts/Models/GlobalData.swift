//
//  GlobalData.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/31.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation

class GlobalData {

    class var sharedInstance: GlobalData {
        struct Static {
            static let instance = GlobalData()
        }
        return Static.instance
    }

    let prefix = "globalData."

    var facebookUserData: NSDictionary? {
        get {
            return userDefault().dictionaryForKey(prefix+"facebookUserData")
        }
        set {
            userDefault().setValue(newValue, forKey: prefix+"facebookUserData")
            userDefault().synchronize()
        }
    }

}

// MARK: - Private functions
extension GlobalData {
    private func userDefault() -> NSUserDefaults {
        return NSUserDefaults.standardUserDefaults()
    }
}
