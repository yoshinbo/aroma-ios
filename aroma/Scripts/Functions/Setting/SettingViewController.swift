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
    func logout()
}

class SettingViewController: UIViewController {

    class func build() -> SettingViewController {
        return UIStoryboard(name: "Setting", bundle: nil).instantiateInitialViewController() as! SettingViewController
    }

    @IBOutlet weak var tableView: UITableView!
    private var dataHandler: SettingDataHandler!

    override func viewDidLoad() {
        super.viewDidLoad()

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

    func logout() {
        let alert = UIAlertController(title: localizedString("logout"), message: localizedString("logoutMessage"), preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: localizedString("cancel"), style: .Cancel, handler: nil))
        alert.addAction(UIAlertAction(title: localizedString("logout"), style: .Destructive, handler: {
            (action:UIAlertAction!) -> Void in
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

extension SettingViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}
