//
//  Account.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/31.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import SSKeychain

class Account {

    class var sharedInstance: Account {
        struct Static {
            static let instance = Account()
        }
        return Static.instance
    }

    private struct UserDefaults {
        static let prefix = "Account."
        private struct Key {
            static let userId = prefix+"userId"
            static let hasToken = prefix+"hasToken"
        }
    }

    private struct KeyChain {
        static let serviceName = "aroma"
        private struct Key {
            static let token = "token"
        }
    }

    var userId: NSNumber = 0
    var hasToken = false
    var token = "" { didSet{ saveToKeyChain() } }

    init() {
        loadFromKeyChain()
        loadFromUserDefaults()
    }

    var description: String {
        return "userId:\(userId), token:\(token), hasToken:\(hasToken)"
    }

    func isAuthorize() -> Bool {
        Tracker.sharedInstance.debug(description)
        return hasToken && !token.isEmpty && userId.integerValue > 0
    }

    func login(userId: NSNumber, token: String) {
        self.userId = userId
        self.token = token
        hasToken = true
        saveToUserDefaults()
    }

    func logout() {
        // TODO : - ログアウトAPIたたく(特にサーバー側で処理が必要ない場合はなし)
        clear()
        FacebookManager.sharedInstance.closeFacebookSession()
    }
}


// MARK: - Private functions
extension Account {

    private func saveToKeyChain() {
        SSKeychain.setPassword(self.token, forService: KeyChain.serviceName, account: KeyChain.Key.token)
    }

    private func loadFromKeyChain() {
        if let token = SSKeychain.passwordForService(KeyChain.serviceName, account: KeyChain.Key.token) {
            self.token = token
        }
    }

    private func saveToUserDefaults() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(userId, forKey: UserDefaults.Key.userId)
        userDefaults.setBool(hasToken, forKey: UserDefaults.Key.hasToken)
        userDefaults.synchronize()
    }

    private func loadFromUserDefaults() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let _userId = userDefaults.objectForKey(UserDefaults.Key.userId) as? NSNumber {
            userId = _userId
        }
        hasToken = userDefaults.boolForKey(UserDefaults.Key.hasToken)
    }

    private func clear() {
        SSKeychain.deletePasswordForService(KeyChain.serviceName, account: KeyChain.Key.token)
        userId = 0
        hasToken = false
        saveToUserDefaults()
    }
}
