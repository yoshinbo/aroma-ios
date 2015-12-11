//
//  IngredientSelectorDataHandler.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/12/03.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import UIKit

class IngredientSelectorDataHandler: NSObject {

    struct Const {
        static let ingredients = [
            "ラベンダー",
            "ローズマリー",
            "ペパーミント",
            "スピカ",
            "ベルガモット",
            "レモンバーム",
        ]
    }

    var delegate: IngredientSelectorViewControllerDelegate?

    private weak var tableView: UITableView!

    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate
extension IngredientSelectorDataHandler: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let index = indexPath.row
        delegate?.showTimeLine(Const.ingredients[index])
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CategorySelectorCell.height()
    }
}

// MARK: - UITableViewDataSource
extension IngredientSelectorDataHandler: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Const.ingredients.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! IngredientSelectorCell
        cell.configure(Const.ingredients[indexPath.row])
        return cell
    }
}
