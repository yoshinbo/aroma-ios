//
//  ProfileSettingDataHandler.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/12/13.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import UIKit

protocol ProfileSettingDataHandlerDelegate {
    func setLocation(id: Int, name: String)
    func refreshCellHeight()
}

class ProfileSettingDataHandler: NSObject {

    struct Const {
        static let cells = [
            "name",
            "location",
            "webURL",
            "description"
        ]
        static let nameMaxInputLength: Int = 20
        static let locationSectionIndexPath = NSIndexPath(forRow: 1, inSection: 0)
    }

    var delegate: ProfileSettingViewControllerDelegate?

    private var locationName = ""
    private weak var tableView: UITableView!

    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView.delegate = self
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

// MARK: - UITableViewDelegate
extension ProfileSettingDataHandler: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch Const.cells[indexPath.row] {
        case "location":
            delegate?.showLocationSelectorView()
        default:
            break
        }
    }
}

// MARK: - UITableViewDataSource
extension ProfileSettingDataHandler: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Const.cells.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        switch Const.cells[indexPath.row] {
        case "name":
            let _cell = tableView.dequeueReusableCellWithIdentifier("textFieldCell") as! ProfileSettingTextFieldCell
            _cell.configure(localizedString("name"), content: "", placeholder: localizedString("namePlaceholder"))
            _cell.maxInputLength = Const.nameMaxInputLength
            _cell.setSeparator(indexPath.row, lastIndex: Const.cells.count)
            cell = _cell
        case "location":
            let _cell = tableView.dequeueReusableCellWithIdentifier("labelCell") as! ProfileSettingLabelCell
            let content = locationName != "" ? locationName : "東京"
            let color = locationName != "" ? AppColorString : AppColorStringS
            _cell.configure(localizedString("location"), content: content, color: color)
            _cell.setSeparator(indexPath.row, lastIndex: Const.cells.count)
            cell = _cell
        case "webURL":
            let _cell = tableView.dequeueReusableCellWithIdentifier("textFieldCell") as! ProfileSettingTextFieldCell
            _cell.configure(localizedString("webURL"), content: "", placeholder: localizedString("webURLPlaceholder"))
            _cell.setSeparator(indexPath.row, lastIndex: Const.cells.count)
            cell = _cell
        case "description":
            let _cell = tableView.dequeueReusableCellWithIdentifier("textViewCell") as! ProfileSettingTextViewCell
            _cell.configure(localizedString("selfDescription"), content: "")
            _cell.delegate = self
            _cell.addSeparator()
            cell = _cell
        default:
            cell = UITableViewCell()
        }
        return cell
    }
}

extension ProfileSettingDataHandler: ProfileSettingDataHandlerDelegate {
    func setLocation(id: Int, name: String) {
        if let _ = tableView.cellForRowAtIndexPath(Const.locationSectionIndexPath) as? ProfileSettingLabelCell {
            locationName = name
            tableView.reloadRowsAtIndexPaths([Const.locationSectionIndexPath], withRowAnimation: .None)
        }
    }

    func refreshCellHeight() {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
