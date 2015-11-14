//
//  CategorySelectorViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/14.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class CategorySelectorViewController: UIViewController {

    class func build() -> CategorySelectorViewController {
        return UIStoryboard(name: "Post", bundle: nil).instantiateViewControllerWithIdentifier("categorySelector") as! CategorySelectorViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
