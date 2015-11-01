//
//  IngredientDataHandler.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/01.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import UIKit

class IngredientDataHandler: NSObject {

    private struct Const{
        static let tempCellNum: Int = 3 // TODO
        static let height: CGFloat = 30
    }

    private weak var tableView: UITableView!

    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    class func height() -> CGFloat {
       return CGFloat(Const.tempCellNum) * Const.height
    }
}

extension IngredientDataHandler: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return Const.height
    }
}

// MARK: - UITableViewDataSource
extension IngredientDataHandler: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Const.tempCellNum
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ingredientCell") as! IngredientCell
        cell.configure()
        return cell
    }
}
