//
//  SettingDataHandler.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/12/11.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class SettingDataHandler: NSObject {

    struct Const {
        static let cells = [
            "editProfile",
            "editNotification",
            "userPolicy",
            "contact",
            "logout",
        ]
    }

    var delegate: SettingViewControllerDelegate?

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
extension SettingDataHandler: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch Const.cells[indexPath.row] {
        case "editProfile":
            delegate?.showProfileSettingView()
        case "editNotification":
            delegate?.showNotificationSettingView()
        case "userPolicy":
            delegate?.showWebView("")
        case "contact":
            delegate?.showMailView()
        default:
            break
        }
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return SearchCandidateCell.height()
    }
}

// MARK: - UITableViewDataSource
extension SettingDataHandler: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Const.cells.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let key = Const.cells[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! SettingContentCell
        cell.configure(localizedString(key))
        cell.setSeparator(indexPath.row, lastIndex: Const.cells.count)
        return cell
    }
}
