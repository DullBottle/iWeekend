//
//  HTMLParser.swift
//  Midas
//
//  Created by 銀色魔頭號 on 2017/12/26.
//  Copyright © 2017年 Dressrose. All rights reserved.
//

import Foundation
import SwiftSoup
import SwiftyJSON

//
// parse `HTML` and convate to `JSON` data.
//
final class Parser {
    
    static func parse(_ HTML: String) -> JSON? {
        
        do {
            let doc: Document = try SwiftSoup.parse(HTML)
            let script: Element = try! doc.body()!.select("script").first()!
            var dataString = script.data().replacingOccurrences(of: "window._sharedData = ", with: "")
            dataString = String(dataString.dropLast())
            
            return JSON(parseJSON: dataString)
        } catch Exception.Error(_, let message) {
            print("⚠️ HTML parse error - \(message)")
        } catch {
            print("⚠️ HTML parse error.")
        }
        
        return nil
    }
}
