//
//  PostDataHandler.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/08.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import UIKit

class PostDataHandler: NSObject {

    struct Const {
        static let sections = [
            [
                [ "id": "title", "class": "PostTextViewCell"],
                [ "id": "description", "class": "PostTextViewCell"],
            ],
            [
                [ "id": "category", "class": "PostIndexCell"],
                [ "id": "recipe", "class": ""],
            ],
        ]
        static let sectionTitle = [
           localizedString("titleAndComment"),
           localizedString("recipe"),
        ]
        struct title {
            static let placeholder = localizedString("titlePlaceholder")
            static let maxLength: Int = 30
        }
        struct description {
            static let placeholder = localizedString("descriptionPlaceholder")
            static let maxLength: Int = 300
        }
    }

    var delegate: PostViewControllerDelegate?

    private weak var tableView: UITableView!
    private var selectedRecipe = [String: Int]()

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

extension PostDataHandler {
    func cellData(indexPath: NSIndexPath) -> [String: String] {
        return Const.sections[indexPath.section][indexPath.row]
    }
}

// MARK: - UITableViewDelegate
extension PostDataHandler: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let data = cellData(indexPath)
        var height: CGFloat = 0
        switch data["id"]! as String {
        case "title":
            height = PostTextViewCell.height("あいうえおあいうえおあいうえおあいうえおあいうえおあいうえお") // 30文字分の高さを用意
        case "description":
            height = PostTextViewCell.height("あいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえお") // 150文字分の高さを用意
        default:
            height = 100
        }
        return height
    }
}

// MARK: - UITableViewDataSource
extension PostDataHandler: UITableViewDataSource {
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Const.sectionTitle[section]
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return Const.sections.count
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Const.sections[section].count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let data = cellData(indexPath)
        var cell: UITableViewCell
        switch data["id"]! as String {
        case "title":
            let _cell = tableView.dequeueReusableCellWithIdentifier("textViewCell") as! PostTextViewCell
            _cell.configure("", placeholder: Const.title.placeholder, maxInputLength: Const.title.maxLength)
            _cell.delegate = self
            cell = _cell
        case "description":
            let _cell = tableView.dequeueReusableCellWithIdentifier("textViewCell") as! PostTextViewCell
            _cell.configure("", placeholder: Const.description.placeholder, maxInputLength: Const.description.maxLength)
            _cell.delegate = self
            cell = _cell
        default:
            cell = UITableViewCell()
        }
        return cell
    }
}

extension PostDataHandler: PostViewControllerDelegate {
    func updateKeyboardNavigation(string: String, color: UIColor) {
        delegate?.updateKeyboardNavigation(string, color: color)
    }
}
