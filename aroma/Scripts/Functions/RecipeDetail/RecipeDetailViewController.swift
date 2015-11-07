//
//  RecipeDetailViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/07.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    class func build() -> (UINavigationController, RecipeDetailViewController) {
        let navigationController = UIStoryboard(name: "RecipeDetail", bundle: nil).instantiateInitialViewController() as! UINavigationController
        let viewController = navigationController.topViewController as! RecipeDetailViewController
        return (navigationController, viewController)
    }

    @IBOutlet weak var tableView: UITableView!

    private var dataHandler: RecipeDetailDataHandler!

    override func viewDidLoad() {
        super.viewDidLoad()

        dataHandler = RecipeDetailDataHandler()
        dataHandler.setup(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
