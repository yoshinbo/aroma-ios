//
//  GeneralInfo.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/12/23.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import UIKit
import TAKUUID

class GeneralInfo {
    let identifier: String
    let version: String
    let versionCode: Int
    let osVersion: String
    let uuid: String
    var modelName: String { return getModelName() }
    let secondsFromGMT: Int
    let language: String
    let region: String

    class var sharedInstance: GeneralInfo {
        struct Static {
            static let instance = GeneralInfo()
        }
        return Static.instance
    }

    init() {
        let mainBundle = NSBundle.mainBundle()
        identifier = mainBundle.bundleIdentifier!
        version = mainBundle.infoDictionary!["CFBundleShortVersionString"] as! String
        versionCode = mainBundle.infoDictionary!["CFBundleVersion"]!.integerValue
        osVersion = UIDevice.currentDevice().systemVersion
        secondsFromGMT = NSTimeZone.systemTimeZone().secondsFromGMT
        let locale = NSLocale.currentLocale()
        language = locale.objectForKey(NSLocaleLanguageCode) as! String
        region = locale.objectForKey(NSLocaleCountryCode) as! String
        uuid = TAKUUIDStorage.sharedInstance().findOrCreate()
    }

    // MARK: - Private functions

    private func getModelName() -> String {
        var size: Int = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine = [CChar](count: Int(size), repeatedValue: 0)
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        return String.fromCString(machine)!
    }
}
