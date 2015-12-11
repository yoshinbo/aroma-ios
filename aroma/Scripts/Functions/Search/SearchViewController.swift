//
//  SearchViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/10/28.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

protocol SearchViewControllerDelegate {
    func showCategorySelectorView()
    func showIngredientSelectorView()
}

class SearchViewController: UIViewController {
    
    class func build() -> (UINavigationController, SearchViewController) {
        let navigationController = UIStoryboard(name: "Search", bundle: nil).instantiateInitialViewController() as! UINavigationController
        let viewController = navigationController.topViewController as! SearchViewController
        return (navigationController, viewController)
    }

    @IBOutlet weak var wrapView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!

    private var dataHandler: SearchDataHandler!

    override func viewDidLoad() {
        super.viewDidLoad()

        dataHandler = SearchDataHandler()
        dataHandler.setup(tableView)
        dataHandler.delegate = self

        wrapView.connerLittleRound()
        wrapView.backgroundColor = AppColorLightGray

        textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(textField: UITextField) {
        let viewController = TimeLineViewController.build()
        viewController.title = textField.text
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension SearchViewController: SearchViewControllerDelegate {
    func showCategorySelectorView() {
        let viewController = CategorySelectorViewController.build()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func showIngredientSelectorView() {
        let viewController = IngredientSelectorViewController.build()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
