//
//  MailViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/12/23.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import MessageUI

class MailViewController {
    class func build(subject: String, body: String) -> MFMailComposeViewController {
        let mailViewController = MFMailComposeViewController()
        mailViewController.setSubject(subject)
        mailViewController.setMessageBody(body, isHTML: false)
        mailViewController.view.tintColor = AppColorRed
        return mailViewController
    }

    class func buildForSupport() -> MFMailComposeViewController {
        // TODO: - 情報を正確なものに
        let userId = "1111"
        let info = GeneralInfo.init()
        let body = String(format: localizedString("supportMailBody"), userId, info.uuid, info.osVersion, info.modelName, info.version, info.language)
        return MailViewController.build(localizedString("supportMailSubject"), body: body)
    }
}
