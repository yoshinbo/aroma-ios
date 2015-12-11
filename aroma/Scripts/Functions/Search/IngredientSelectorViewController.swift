//
//  IngredientSelectorViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/12/03.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

protocol IngredientSelectorViewControllerDelegate {
    func showTimeLine(name: String)
}

class IngredientSelectorViewController: UIViewController {

    class func build() -> IngredientSelectorViewController {
        return UIStoryboard(name: "Search", bundle: nil).instantiateViewControllerWithIdentifier("ingredient") as! IngredientSelectorViewController
    }

    @IBOutlet weak var tableView: UITableView!

    var dataHandler: IngredientSelectorDataHandler!

    override func viewDidLoad() {
        super.viewDidLoad()

        dataHandler = IngredientSelectorDataHandler()
        dataHandler.setup(tableView)
        dataHandler.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension IngredientSelectorViewController: IngredientSelectorViewControllerDelegate {
    func showTimeLine(name: String) {
        let viewController = TimeLineViewController.build()
        viewController.title = name
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
