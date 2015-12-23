//
//  LocationSelectorDataHandler.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/12/13.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import UIKit

class LocationSelectorDataHandler: NSObject {

    struct Const {
        static let locations = [
            "東京",
            "神奈川",
            "千葉",
            "埼玉",
            "群馬",
            "栃木",
            "茨木",
        ]
    }

    var delegate: ProfileSettingDataHandlerDelegate?

    private weak var tableView: UITableView!

    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate
extension LocationSelectorDataHandler: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let index = indexPath.row
        let name = Const.locations[index]
        delegate?.setLocation(index, name: name)
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CategorySelectorCell.height()
    }
}

// MARK: - UITableViewDataSource
extension LocationSelectorDataHandler: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Const.locations.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! LocationSelectorCell
        cell.configure(indexPath.row, name: Const.locations[indexPath.row])
        return cell
    }
}
