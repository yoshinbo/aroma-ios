//
//  CategorySelectorDataHandler.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/15.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import UIKit

class CategorySelectorDataHandler: NSObject {

    struct Const {
        static let categories = [
            "芳香浴",
            "トリートメント",
            "パスタイム",
            "美容",
            "ケア",
            "そうじ",
        ]
    }

    var delegate: PostDataHandlerDelegate?

    private weak var tableView: UITableView!

    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate
extension CategorySelectorDataHandler: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let index = indexPath.row
        delegate?.setCategory(index, name: Const.categories[index])
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CategorySelectorCell.height()
    }
}

// MARK: - UITableViewDataSource
extension CategorySelectorDataHandler: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Const.categories.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! CategorySelectorCell
        cell.configure(indexPath.row, name: Const.categories[indexPath.row])
        return cell
    }
}
