//
//  InsService.swift
//  Midas
//
//  Created by __End on 2018/1/11.
//  Copyright © 2018年 Dressrose. All rights reserved.
//

import RxSwift

protocol InsServiceType {
    
    var currentUrl: String? { set get }
    
    func instagram(_ urlString: String) -> Single<Ins>
}

class InsService: InsServiceType {
    
    var currentUrl: String?
    
    init() {
        
    }
    
    func instagram(_ urlString: String) -> Single<Ins> {
        currentUrl = urlString
        return Networking.shared.request(urlString).filterNil().map(Ins.self).asSingle()
    }
}
