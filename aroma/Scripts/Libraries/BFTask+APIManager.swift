//
//  BFTask+APIManager.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/31.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import Bolts

extension BFTask {
    func APIErrorHandler() -> BFTask {
        return continueWithBlock{
            (task) -> AnyObject! in

            // TODO : - ここでAPIからのErrorCodeによって強制アップデートなどのErrorハンドリングを行う
            if let error = task.error {
                Tracker.sharedInstance.error("API Error : \(error)")
            }
            return task
        }
    }
}
