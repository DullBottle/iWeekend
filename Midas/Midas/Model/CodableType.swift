//
//  CodableType.swift
//  Midas
//
//  Created by __End on 2018/1/5.
//  Copyright © 2018年 Dressrose. All rights reserved.
//

import Foundation

protocol CodableType: Codable {
    
}

extension CodableType {
    
    static var decoder: JSONDecoder {
        return JSONDecoder()
    }
}
