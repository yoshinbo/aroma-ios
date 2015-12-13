//
//  LocationSelectorViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/12/13.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class LocationSelectorViewController: UIViewController {
    
    class func build() -> LocationSelectorViewController {
        return UIStoryboard(name: "Setting", bundle: nil).instantiateViewControllerWithIdentifier("locationSelector") as!LocationSelectorViewController
    }

    @IBOutlet weak var tableView: UITableView!
    var delegate: ProfileSettingDataHandlerDelegate?
    var dataHandler: LocationSelectorDataHandler!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataHandler = LocationSelectorDataHandler()
        dataHandler.setup(tableView)
        dataHandler.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension LocationSelectorViewController: ProfileSettingDataHandlerDelegate {
    func setLocation(id: Int, name: String) {
        delegate?.setLocation(id, name: name)
        self.navigationController?.popViewControllerAnimated(true)
    }
}
