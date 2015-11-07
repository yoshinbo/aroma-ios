//
//  TimeLineViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/10/28.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

protocol TimeLineViewControllerDelegate {
    func showProfileView()
    func showRecipeDetailView()
    func showRecipeCommentView()
}

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
        dataHandler.delegate = self
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        dataHandler.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension TimeLineViewController: TimeLineViewControllerDelegate {
    func showProfileView() {
        let (_, viewController) = MyPageViewController.build()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func showRecipeDetailView() {
        let (_, viewController) = RecipeDetailViewController.build()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func showRecipeCommentView() {
        print("showRecipeCommentView")
    }
}
