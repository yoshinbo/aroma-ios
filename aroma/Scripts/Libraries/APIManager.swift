//
//  APIManager.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/31.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import AFNetworking
import Bolts

final class APIManager: NSObject {

    private struct Const {
        static let BaseURLForDevelopment: String = "http://api.localhost.local:3000"
        static let BaseURLForAdHoc: String = ""
        static let BaseURL: String = ""
    }

    class var sharedInstance: APIManager {
        struct Static {
            static let instance = APIManager()
        }
        return Static.instance
    }

    enum APIMethod { case GET, POST, PUT, DELETE }

    private var manager: AFHTTPSessionManager!
    private var baseURL: String!

    override private init() {
        super.init()
        #if DEBUG
            baseURL = Const.BaseURLForDevelopment
        #elseif ADHOC
            baseURL = Const.BaseURLForAdHoc
        #else
            baseURL = Const.BaseURL
        #endif

        manager = AFHTTPSessionManager(baseURL: NSURL(string: baseURL), sessionConfiguration: buildSessionConfig())
        manager.requestSerializer = requestSerializer()
    }

    func request(method: APIMethod, path: String) -> BFTask {
        return request(method, path: path, parameters: nil)
    }

    func request(method: APIMethod, path: String, parameters: [String: AnyObject]?) -> BFTask {
        let fullPath = baseURL + path
        Tracker.sharedInstance.debug("API Request: \(fullPath) parameters: \(parameters)")
        switch method {
        case .GET:
            return GET(fullPath, parameters: parameters)
        case .POST:
            return POST(fullPath, parameters: parameters)
        case .PUT:
            return PUT(fullPath, parameters: parameters)
        case .DELETE:
            return DELETE(fullPath, parameters: parameters)
        }
    }

    func upload(path: String, data: NSData, name: String, fileName: String, mimeType: String, parameters: [String: AnyObject]?) -> BFTask {
        let completionSource = BFTaskCompletionSource()

        let fullPath = baseURL + path

        manager.POST(fullPath, parameters: parameters,
            constructingBodyWithBlock: {
                (formData) -> Void in
                formData.appendPartWithFileData(data, name: name, fileName: fileName, mimeType: mimeType)
            },
            success: {
                (task, response) -> Void in
                completionSource.setResult(response)

            }, failure: {
                (task, error) -> Void in
                // TODO: - APIエラーハンドリング APIErrorクラス作る
                completionSource.setError(error)
            }
        )

        return completionSource.task
    }
}


// MARK: - Private functions
extension APIManager {

    private func GET(path: String, parameters: [String: AnyObject]? = nil) -> BFTask {
        let completionSource = BFTaskCompletionSource()

        // request
        _ = manager.GET(path, parameters: parameters,
            success: {
                (task, response) -> Void in
                completionSource.setResult(response)
            },
            failure: {
                (task, error) -> Void in
                // response
                _ = task.response as? NSHTTPURLResponse
                // TODO: - APIエラーハンドリング APIErrorクラス作る
                completionSource.setError(error)
        })

        return completionSource.task
    }

    private func POST(path: String, parameters: [String: AnyObject]? = nil) -> BFTask {
        let completionSource = BFTaskCompletionSource()

        _ = manager.POST(path, parameters: parameters,
            success: {
                (task, response) -> Void in
                completionSource.setResult(response)
            },
            failure: {
                (task, error) -> Void in
                _ = task.response as? NSHTTPURLResponse
                // TODO APIエラーハンドリング
                completionSource.setError(error)
        })

        return completionSource.task
    }

    private func PUT(path: String, parameters: [String: AnyObject]? = nil) -> BFTask {
        let completionSource = BFTaskCompletionSource()

        _ = manager.PUT(path, parameters: parameters,
            success: {
                (task, response) -> Void in
                completionSource.setResult(response)
            },
            failure: {
                (task, error) -> Void in
                _ = task.response as? NSHTTPURLResponse
                // TODO APIエラーハンドリング
                completionSource.setError(error)
        })

        return completionSource.task
    }

    private func DELETE(path: String, parameters: [String: AnyObject]? = nil) -> BFTask {
        let completionSource = BFTaskCompletionSource()

        _ = manager.DELETE(path, parameters: parameters,
            success: {
                (task, response) -> Void in
                completionSource.setResult(response)
            },
            failure: {
                (task, error) -> Void in
                _ = task.response as? NSHTTPURLResponse
                // TODO APIエラーハンドリング
                completionSource.setError(error)
        })

        return completionSource.task
    }

    private func buildSessionConfig() -> NSURLSessionConfiguration {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        config.timeoutIntervalForRequest = 20.0
        config.timeoutIntervalForResource = config.timeoutIntervalForRequest * 2.0
        config.HTTPAdditionalHeaders = buildHeader()
        config.HTTPCookieStorage = NSHTTPCookieStorage.sharedHTTPCookieStorage()
        return config
    }

    private func buildHeader() -> [String: AnyObject] {
        let generalInfo = GeneralInfo.sharedInstance
        let headers = [
            "Accept-Encoding": "gzip,deflate,sdch",
            "X-AROMA-Token": Account.sharedInstance.token,
            "X-AROMA-App-Id": generalInfo.identifier,
            "X-AROMA-App-Version": generalInfo.version,
            "X-AROMA-App-Version-Code": "\(generalInfo.versionCode)",
            "X-AROMA-Os": "ios",
            "X-AROMA-Os-Version": generalInfo.version,
            "X-AROMA-Os-Model": generalInfo.modelName,
            "X-AROMA-Os-Uuid": generalInfo.uuid
            ] as [String: AnyObject]
        Tracker.sharedInstance.debug("headers: \(headers)")
        return headers
    }

    private func requestSerializer() -> AFJSONRequestSerializer {
        return AFJSONRequestSerializer()
    }
}
