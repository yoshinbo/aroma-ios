//
//  MyPageViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/10/28.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class MyPageViewController: SwitchingTabViewController {
    
    class func build() -> (UINavigationController, MyPageViewController) {
        let navigationController = UIStoryboard(name: "MyPage", bundle: nil).instantiateInitialViewController() as! UINavigationController
        let viewController = navigationController.topViewController as! MyPageViewController
        return (navigationController, viewController)
    }

    @IBOutlet weak var profileImageView: ProfileImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!

    var isMine = false
    private var timeLineViewControllerCache = [Int: TimeLineViewController]()
    private var locationImage = UIImage(named: "location-icon")?.imageWithRenderingMode(.AlwaysTemplate)

    override func viewDidLoad() {
        let viewControllers = [
            mineTimeLineViewController(),
            clipTimeLineViewController()
        ]
        setSwitchingTabViewControllers(viewControllers)

        super.viewDidLoad()

        let imageURL = NSURL(string: "https://graph.facebook.com/10202450689656441/picture?width=150&height=150")
        profileImageView.configure(url: imageURL, placeholderImage: UIImage(named: "mypage-icon"), rounded: true)
        nameLabel.text = "YUKI ODA"
        locationLabel.text = "東京都"
        locationImageView.image = locationImage
        locationImageView.tintColor = AppColorRed
        let description = "子供も安心して使えるブレンドです。アウトドアでの虫よけスプレーとしてもつかえます。子供も安心して使えるブレンドです。アウトドアでの虫よけスプレーとしてもつかえます。子供も安心して使えるブレンドです。"
        descriptionTextView.text = description

        if !isMine {
           title = nameLabel.text
        }
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension MyPageViewController {
    private func mineTimeLineViewController() -> TimeLineViewController {
        return timeLineViewController(0)
    }

    private func clipTimeLineViewController() -> TimeLineViewController {
        return timeLineViewController(1)
    }

    private func timeLineViewController(type: Int) -> TimeLineViewController {
        if timeLineViewControllerCache[type] == nil {
            let vc = TimeLineViewController.build()

            switch type {
            case 0:
                vc.title = localizedString("myRecipe")
            case 1:
                vc.title = localizedString("clip")
            default:
                vc.title = ""
            }
            timeLineViewControllerCache[type] = vc
        }

        return timeLineViewControllerCache[type]!
    }
}
