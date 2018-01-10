//
//  CodableType + Rx.swift
//  Midas
//
//  Created by __End on 2018/1/8.
//  Copyright © 2018年 Dressrose. All rights reserved.
//

import RxSwift

extension ObservableType {
    
    func map<T: CodableType>(_ type: T.Type) -> Observable<T> {
        return flatMap { JSON -> Single<T> in
            let data = try JSONSerialization.data(withJSONObject: JSON, options: .prettyPrinted)
            return Single.just(try T.decoder.decode(type, from: data))
        }
    }
}
