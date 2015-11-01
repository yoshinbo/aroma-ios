//
//  TimeLineViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/10/28.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class TimeLineViewController: UIViewController {
    
    class func build() -> TimeLineViewController {
        return UIStoryboard(name: "TimeLine", bundle: nil).instantiateInitialViewController() as! TimeLineViewController
    }

    @IBOutlet weak var tableView: UITableView!
    private var dataHandler: TimeLineDataHandler!

    override func viewDidLoad() {
        super.viewDidLoad()

        dataHandler = TimeLineDataHandler()
        dataHandler.setup(tableView)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        dataHandler.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
