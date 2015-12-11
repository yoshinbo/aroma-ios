//
//  SettingViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/12/11.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

protocol SettingViewControllerDelegate {
    func showEditProfileView()
    func showEditNotification()
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
    func showEditProfileView() {

    }
    func showEditNotification() {

    }
    func showMailView() {

    }
    func showWebView(url: String) {

    }
}
