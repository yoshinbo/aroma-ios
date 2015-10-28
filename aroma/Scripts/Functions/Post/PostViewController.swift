//
//  PostViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/10/28.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
    class func build() -> (UINavigationController, PostViewController) {
        let navigationController = UIStoryboard(name: "Post", bundle: nil).instantiateInitialViewController() as! UINavigationController
        let viewController = navigationController.topViewController as! PostViewController
        return (navigationController, viewController)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTapCloseButton(sender: UIBarButtonItem) {
        closeViewController()
    }
}
