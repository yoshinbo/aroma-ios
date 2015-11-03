//
//  TimeLineDataHandler.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/01.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import UIKit

class TimeLineDataHandler: NSObject {

    var delegate: TimeLineViewControllerDelegate?

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

extension TimeLineDataHandler {

}

// MARK: - UITableViewDelegate
extension TimeLineDataHandler: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.showRecipeDetailView()
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return TimeLineCell.height("子供も安心して使えるブレンドです。アウトドアでの虫よけスプレーとしてもつかえます。")
    }
}

// MARK: - UITableViewDataSource
extension TimeLineDataHandler: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("timeLineCell") as! TimeLineCell
        cell.configure()
        cell.delegate = self
        return cell
    }
}

extension TimeLineDataHandler: TimeLineViewControllerDelegate {
    func showProfileView() {
        delegate?.showProfileView()
    }

    func showRecipeDetailView() {
        delegate?.showRecipeDetailView()
    }

    func showRecipeCommentView() {
        delegate?.showRecipeCommentView()
    }

    func like() {
        delegate?.like()
    }

    func clip() {
        delegate?.clip()
    }
}
