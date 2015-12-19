//
//  NotificationSettingViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/12/19.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class NotificationSettingViewController: UIViewController {

    class func build() -> (UINavigationController, NotificationSettingViewController) {
        let navigationController = UIStoryboard(name: "Setting", bundle: nil).instantiateViewControllerWithIdentifier("notificationSetting") as! UINavigationController
        let viewController = navigationController.topViewController as! NotificationSettingViewController
        return (navigationController, viewController)
    }

    @IBOutlet weak var tableView: UITableView!
    private var dataHandler: NotificationSettingDataHandler!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.tintColor = AppColorRed

        dataHandler = NotificationSettingDataHandler()
        dataHandler.setup(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
