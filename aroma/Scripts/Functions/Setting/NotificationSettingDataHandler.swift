//
//  NotificationSettingDataHandler.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/12/19.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import UIKit

class NotificationSettingDataHandler: NSObject {

    struct Const {
        static let cells = [
            "notificationSettingComment",
            "notificationSettingLike",
            "notificationSettingClip",
        ]
    }

    private weak var tableView: UITableView!

    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 10000
    }

    func loadData() {
        tableView.reloadData()
    }

    func fetchData() {
    }
}

// MARK: - UITableViewDataSource
extension NotificationSettingDataHandler: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Const.cells.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! NotificationSettingSwitchCell
        cell.configure(localizedString(Const.cells[indexPath.row]), on: false)
        cell.setSeparator(indexPath.row, lastIndex: Const.cells.count)
        return cell
    }
}
