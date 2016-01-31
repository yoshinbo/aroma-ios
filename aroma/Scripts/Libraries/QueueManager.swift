//
//  QueueManager.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/31.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation

final class QueueManager: NSObject {

    static let sharedInstance = QueueManager()

    private struct Static {
        static var mainQueue = dispatch_get_main_queue()
        static var backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        static var backgroundQueueForDataStore = dispatch_queue_create("com.aroma.background.queue.data_store", DISPATCH_QUEUE_SERIAL)
        static var backgroundQueueForPeripheral = dispatch_queue_create("com.aroma.background.gueue.peripheral", DISPATCH_QUEUE_SERIAL)
    }

    func mainQueue() -> dispatch_queue_t {
        return Static.mainQueue
    }

    func backgroundQueueForDataStore() -> dispatch_queue_t {
        return Static.backgroundQueueForDataStore
    }

    func backgroundQueue() -> dispatch_queue_t {
        return Static.backgroundQueue
    }

    func peripheralQueue() -> dispatch_queue_t {
        return Static.backgroundQueueForPeripheral
    }
}
