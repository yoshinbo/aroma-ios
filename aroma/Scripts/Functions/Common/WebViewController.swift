//
//  WebViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/12/23.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    class func build(url: String) -> WebViewController {
        let webViewController = UIStoryboard(name: "WebView", bundle: nil).instantiateInitialViewController() as! WebViewController
        webViewController.url = url
        return webViewController
    }

    @IBOutlet weak var webView: UIWebView!
    var url = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        webView.loadRequest(NSURLRequest(URL: NSURL(string: url)!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
