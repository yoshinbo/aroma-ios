//
//  TabBarController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/10/28.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    var timeLineNavigationController: UINavigationController!
    var searchNavigationController: UINavigationController!
    var noticeNavigationController: UINavigationController!
    var myPageNavigationController: UINavigationController!
    var postViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let (timeLineNavigationController, timeLineViewController) = TimeLineViewController.build()
        let (searchNavigationController, searchViewController) = SearchViewController.build()
        let (noticeNavigationController, noticeViewController) = NoticeViewController.build()
        let (myPageNavigationController, myPageViewController) = MyPageViewController.build()
        
        self.timeLineNavigationController = timeLineNavigationController
        self.searchNavigationController = searchNavigationController
        postViewController = UIViewController()
        self.noticeNavigationController = noticeNavigationController
        self.myPageNavigationController = myPageNavigationController
        
        
        timeLineViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .Bookmarks, tag: 0)
        searchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .Contacts, tag: 0)
        postViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .Downloads, tag: 0)
        noticeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .Favorites, tag: 0)
        myPageViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .Featured, tag: 0)
        
        self.setViewControllers([
            self.timeLineNavigationController,
            self.searchNavigationController,
            postViewController,
            self.noticeNavigationController,
            self.myPageNavigationController
        ], animated: false)
        
        delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// Mark: - UITabBarControllerDelegate
extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        if (viewController != self.postViewController) { return true }
        let (navigationController, _) = PostViewController.build()
        self.presentViewController(navigationController, animated: true, completion: nil)
        return false
    }
}