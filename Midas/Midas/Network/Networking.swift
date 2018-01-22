//
//  Networking.swift
//  Midas
//
//  Created by __End on 2017/12/26.
//  Copyright © 2017年 Dressrose. All rights reserved.
//

import RxSwift
import Alamofire
import SwiftyJSON

final class Networking {
    
    typealias ErrorClosure = (_ error: Error) -> Void
    
    typealias CompletionClosure = (_ HTML: JSON?) -> Void
    
    static let shared = Networking()
    
    var urlString: String = ""
    
    init() {
        
    }
    
    func request(_ urlString: String) -> Observable<[String: Any]?> {
        
        return Observable.create { subscribe in
            // set the `urlString`.
            self.urlString = urlString
            
            // perform the request.
            Alamofire.request(urlString).response { response in
                
                if let err = response.error {
                    // Error handler.
                    print("[\(String(describing: response.response?.statusCode))] - \(err.localizedDescription)")
                    subscribe.onError(err)
                } else {
                    // Data handler.
                    if let data = response.data {
                        let HTML = String.init(data: data, encoding: String.Encoding.utf8)!
                        if let rawJSON = Parser.parse(HTML) {
                            let JSON = rawJSON["entry_data"]["PostPage"].array?.first?["graphql"]["shortcode_media"]
                            let reorganizeJSON = self.reorganizeJsonData(JSON)
                            subscribe.onNext(reorganizeJSON)
                            subscribe.onCompleted()
                            return
                        }
                        subscribe.onNext(nil)
                        subscribe.onCompleted()
                    } else {
                        // data is `nil`.
                        subscribe.onNext(nil)
                        subscribe.onCompleted()
                    }
                }
            }
            
            return Disposables.create {
                self.cancel()
            }
        }
    }
    
    //
    // Cancel the Task.
    //
    fileprivate func cancel() -> Void {
        
        let sessionManager = Alamofire.SessionManager.default
        sessionManager.session.getTasksWithCompletionHandler { dataTasks, _, _ in
            dataTasks.forEach {
                if !self.urlString.isEmpty {
                    if $0.originalRequest?.url?.absoluteString == self.urlString {
                        $0.cancel()
                    }
                }
            }
        }
    }
    
    /// Reorganization a new `[String:Any]` dictionary.
    fileprivate func reorganizeJsonData(_ oldValue: JSON?) -> [String : Any] {
 
//        {
//            "id" : ...
//            "username" : ...
//            "profile_pic_url" : ...
//            "tweets" : ...
//            "is_video": ...
//            "dimensions": ...
//            "video_url": ...
//            "image_urls": ...
//        }

        guard let oldValue = oldValue else { return [:] }
        
        var newValue: [String : Any] = [:]
        newValue["id"] = oldValue["id"].stringValue
        newValue["username"] = oldValue["owner"]["username"].stringValue
        newValue["profile_pic_url"] = oldValue["owner"]["profile_pic_url"].stringValue
        newValue["tweets"] = oldValue["edge_media_to_caption"]["edges"].array?.first?["node"]["text"].stringValue ?? ""
        let is_video = oldValue["is_video"].boolValue
        newValue["is_video"] = is_video
        newValue["video_url"] = is_video ? oldValue["video_url"].stringValue : ""
        var images: [String] = []
        if !is_video {
            if let edges = oldValue["edge_sidecar_to_children"]["edges"].array {
                // 多张图片
                for tmp in edges {
                    images.append(tmp["node"]["display_url"].stringValue)
                }
            } else {
                // 只有一张图片
                images.append(oldValue["display_url"].stringValue)
            }
        }
        newValue["image_urls"] = images
        let dimensions: [String: Int] = [ "width": oldValue["dimensions"]["width"].intValue,
                                          "height": oldValue["dimensions"]["height"].intValue ]
        newValue["dimensions"] = dimensions
        return newValue
    }
    
}

