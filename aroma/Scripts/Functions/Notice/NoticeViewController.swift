//
//  NoticeViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/10/28.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

protocol NoticeViewControllerDelegate {
    func showProfileView()
    func showRecipeDetailView()
}

class NoticeViewController: UIViewController {
    
    class func build() -> (UINavigationController, NoticeViewController) {
        let navigationController = UIStoryboard(name: "Notice", bundle: nil).instantiateInitialViewController() as! UINavigationController
        let viewController = navigationController.topViewController as! NoticeViewController
        return (navigationController, viewController)
    }

    @IBOutlet weak var tableView: UITableView!

    private var dataHandler: NoticeDataHandler!

    override func viewDidLoad() {
        super.viewDidLoad()

        dataHandler = NoticeDataHandler()
        dataHandler.setup(tableView)
        dataHandler.delegate = self
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        dataHandler.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension NoticeViewController: NoticeViewControllerDelegate {
    func showProfileView() {
        let (_, viewController) = MyPageViewController.build()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func showRecipeDetailView() {
        print("showRecipeDetailView")
    }
}
