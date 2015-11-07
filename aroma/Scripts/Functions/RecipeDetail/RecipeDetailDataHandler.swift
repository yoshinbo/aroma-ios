//
//  RecipeDetailDataHandler.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/07.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import UIKit

class RecipeDetailDataHandler: NSObject {

    struct Const {
        static let cells = [
            "RecipeDetail",
        ]
    }

    private weak var tableView: UITableView!

    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    func loadData() {
        tableView.reloadData()
    }

    func fetchData() {
    }
}

// MARK: - UITableViewDelegate
extension RecipeDetailDataHandler: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cellName = Const.cells[indexPath.row]
        var height: CGFloat = 0
        switch cellName {
            case "RecipeDetail":
                let title = "心安らかブレンド"
                let description = "子供も安心して使えるブレンドです。アウトドアでの虫よけスプレーとしてもつかえます。 子供も安心して使えるブレンドです。アウトドアでの虫よけスプレーとしてもつかえます。 子供も安心して使えるブレンドです。アウトドアでの虫よけスプレーとしてもつかえます。"
                height = RecipeDetailCell.height(title, description: description)
            default:
                height = 0.0
        }
        return height
    }
}

// MARK: - UITableViewDataSource
extension RecipeDetailDataHandler: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Const.cells.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellName = Const.cells[indexPath.row]
        var cell: UITableViewCell
        switch cellName {
            case "RecipeDetail":
                let _cell = tableView.dequeueReusableCellWithIdentifier("recipeDetailCell") as! RecipeDetailCell
                _cell.configure()
                cell = _cell
                break
            default:
                // NOTE: - ここにはこない
                cell = UITableViewCell()
                break
        }
        return cell
    }
}
