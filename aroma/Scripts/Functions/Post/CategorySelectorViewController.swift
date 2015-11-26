//
//  CategorySelectorViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/14.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit



class CategorySelectorViewController: UIViewController {

    class func build() -> CategorySelectorViewController {
        return UIStoryboard(name: "Post", bundle: nil).instantiateViewControllerWithIdentifier("categorySelector") as! CategorySelectorViewController
    }

    @IBOutlet weak var tableView: UITableView!

    var dataHandler: CategorySelectorDataHandler!
    var delegate: PostDataHandlerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        dataHandler = CategorySelectorDataHandler()
        dataHandler.setup(tableView)
        dataHandler.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CategorySelectorViewController: PostDataHandlerDelegate {
    func tableEdit(on: Bool) {
        delegate?.tableEdit(on)
    }

    func insertIngredientContainer(name: String, amount: Int) {
        delegate?.insertIngredientContainer(name, amount: amount)
    }

    func setCategory(id: Int, name: String) {
        delegate?.setCategory(id, name: name)
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}
