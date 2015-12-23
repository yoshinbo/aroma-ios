//
//  SettingViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/12/11.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit
import MessageUI

protocol SettingViewControllerDelegate {
    func showProfileSettingView()
    func showNotificationSettingView()
    func showMailView()
    func showWebView(url: String)
}

class SettingViewController: UIViewController {

    class func build() -> SettingViewController {
        return UIStoryboard(name: "Setting", bundle: nil).instantiateInitialViewController() as! SettingViewController
    }

    @IBOutlet weak var tableView: UITableView!
    private var dataHandler: SettingDataHandler!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.tintColor = AppColorRed

        dataHandler = SettingDataHandler()
        dataHandler.setup(tableView)
        dataHandler.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SettingViewController: SettingViewControllerDelegate {
    func showProfileSettingView() {
        let (_, viewController) = ProfileSettingViewController.build()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func showNotificationSettingView() {
        let (_, viewController) = NotificationSettingViewController.build()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func showMailView() {
        if MFMailComposeViewController.canSendMail() {
            let mailViewController = MailViewController.buildForSupport()
            mailViewController.mailComposeDelegate = self
            self.presentViewController(mailViewController, animated: true, completion: nil)
        }
    }

    func showWebView(url: String) {
        let viewController = WebViewController.build("http://yahoo.co.jp")
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension SettingViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}