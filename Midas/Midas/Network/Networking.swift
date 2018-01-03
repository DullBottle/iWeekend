//
//  Networking.swift
//  Midas
//
//  Created by 銀色魔頭號 on 2017/12/26.
//  Copyright © 2017年 Dressrose. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class Networking {
    
    typealias ErrorClosure = (_ error: Error) -> Void
    
    typealias CompletionClosure = (_ HTML: JSON?) -> Void
    
    static let shared = Networking()
    
    var urlString: String = ""
    
    init() {
        
    }
    
    func request(_ urlString: String, completionClosure:@escaping CompletionClosure, errClosure:ErrorClosure? = nil) -> Void {
        
        // set the `urlString`.
        self.urlString = urlString
        
        // perform the request.
        Alamofire.request(urlString).response { response in
            
            if let err = response.error {
                // Error handler.
                if let errClosure = errClosure {
                    print("[\(String(describing: response.response?.statusCode))] - \(err.localizedDescription)")
                    errClosure(err)
                }
            } else {
                // Data handler.
                if let data = response.data {
                    let HTML = String.init(data: data, encoding: String.Encoding.utf8)!
                    if let JSON = Parser.parse(HTML) {
                        completionClosure(JSON)
                        return
                    }
                    completionClosure(nil)
                } else {
                    // data is `nil`.
                    completionClosure(nil)
                }
            }
        }
    }
    
    //
    // Cancel the Task.
    //
    func cancel() -> Void {
        
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
    
    
}

