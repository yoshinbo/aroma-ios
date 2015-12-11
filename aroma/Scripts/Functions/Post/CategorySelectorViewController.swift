//
//  CategorySelectorViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/14.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import UIKit

protocol CategorySelectorViewControllerDelegate {
    func showTimeLine(name: String)
}

class CategorySelectorViewController: UIViewController {

    class func build() -> CategorySelectorViewController {
        return UIStoryboard(name: "Post", bundle: nil).instantiateViewControllerWithIdentifier("categorySelector") as! CategorySelectorViewController
    }

    @IBOutlet weak var tableView: UITableView!

    var dataHandler: CategorySelectorDataHandler!
    var postDelegate: PostDataHandlerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        dataHandler = CategorySelectorDataHandler()
        dataHandler.setup(tableView)
        if (self.postDelegate != nil) {
            dataHandler.postDelegate = self
        } else {
            dataHandler.delegate = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CategorySelectorViewController: CategorySelectorViewControllerDelegate {
    func showTimeLine(name: String) {
        let viewController = TimeLineViewController.build()
        viewController.title = name
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension CategorySelectorViewController: PostDataHandlerDelegate {
    func tableEdit(on: Bool) {
        postDelegate?.tableEdit(on)
    }

    func insertIngredientContainer(name: String, amount: Int) {
        postDelegate?.insertIngredientContainer(name, amount: amount)
    }

    func setCategory(id: Int, name: String) {
        postDelegate?.setCategory(id, name: name)
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}