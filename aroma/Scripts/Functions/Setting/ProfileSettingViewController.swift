//
//  ProfileSettingViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/12/13.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

protocol ProfileSettingViewControllerDelegate {
    func showLocationSelectorView()
}

class ProfileSettingViewController: UIViewController {

    class func build() -> (UINavigationController, ProfileSettingViewController) {
        let navigationController = UIStoryboard(name: "Setting", bundle: nil).instantiateViewControllerWithIdentifier("profileSetting") as! UINavigationController
        let viewController = navigationController.topViewController as! ProfileSettingViewController
        return (navigationController, viewController)
    }

    @IBOutlet weak var tableView: UITableView!
    private var dataHandler: ProfileSettingDataHandler!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.tintColor = AppColorRed

        dataHandler = ProfileSettingDataHandler()
        dataHandler.setup(tableView)
        dataHandler.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTapDoneButton(sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewControllerAnimated(true)
        //self.navigationController?.popViewControllerAnimated(true)
    }
}

extension ProfileSettingViewController: ProfileSettingViewControllerDelegate {
    func showLocationSelectorView() {
        let viewController = LocationSelectorViewController.build()
        viewController.delegate = dataHandler
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}