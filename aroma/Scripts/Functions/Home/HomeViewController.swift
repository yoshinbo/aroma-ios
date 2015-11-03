//
//  HomeViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/10/31.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    class func build() -> (UINavigationController, HomeViewController) {
        let navigationController = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as! UINavigationController
        let viewController = navigationController.topViewController as! HomeViewController
        return (navigationController, viewController)
    }

    @IBOutlet weak var wrapView: UIView!
    var timeLineViewController: TimeLineViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        timeLineViewController = TimeLineViewController.build()
        addChildViewController(timeLineViewController)
        timeLineViewController.beginAppearanceTransition(true, animated: false)
        timeLineViewController.didMoveToParentViewController(self)
        timeLineViewController.endAppearanceTransition()

        aduptTimeLine()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.layoutIfNeeded()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension HomeViewController {
    func aduptTimeLine() {
        let vc = timeLineViewController
        vc.view.frame = CGRectMake(0, 0, wrapView.frame.width, wrapView.frame.height)
        vc.view.autoresizingMask = [
            .FlexibleWidth,
            .FlexibleHeight,
            .FlexibleRightMargin,
            .FlexibleLeftMargin,
            .FlexibleTopMargin,
            .FlexibleBottomMargin
        ]
        wrapView.addSubview(vc.view)
    }
}
