//
//  SearchDataHandler.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/26.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import UIKit

class SearchDataHandler: NSObject {

    struct Const {
        static let cells = [
            "selectFromSmell",
            "selectFromEssentialOil",
        ]
    }

    var delegate: SearchViewControllerDelegate?

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
extension SearchDataHandler: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return SearchCandidateCell.height()
    }
}

// MARK: - UITableViewDataSource
extension SearchDataHandler: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Const.cells.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let key = Const.cells[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! SearchCandidateCell
        cell.configure(localizedString(key))
        return cell
    }
}

extension SearchDataHandler: SearchViewControllerDelegate {
    func showTimeLineView() {
        delegate?.showTimeLineView()
    }

    func showSmellCandidateView() {
        delegate?.showSmellCandidateView()
    }

    func showEssentialOilCandidateView() {
        delegate?.showEssentialOilCandidateView()
    }
}
