//
//  NoticeDataHandler.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/03.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import UIKit

class NoticeDataHandler: NSObject {

    var delegate: NoticeViewControllerDelegate?

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
extension NoticeDataHandler: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.showRecipeDetailView()
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return NoticeCell.height("子供も安心して使えるブレンドです。アウトドアでの虫よけスプレーとしてもつかえます。")
    }
}

// MARK: - UITableViewDataSource
extension NoticeDataHandler: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("noticeCell") as! NoticeCell
        cell.configure()
        cell.delegate = self
        return cell
    }
}

extension NoticeDataHandler: NoticeViewControllerDelegate {
    func showProfileView() {
        delegate?.showProfileView()
    }

    func showRecipeDetailView() {
        delegate?.showRecipeDetailView()
    }
}
