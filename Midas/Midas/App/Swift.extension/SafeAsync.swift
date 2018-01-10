//
//  SafeAsync.swift
//  Midas
//
//  Created by __End on 2018/1/10.
//  Copyright © 2018年 Dressrose. All rights reserved.
//

import Foundation

extension DispatchQueue {
    
    func safeAsync(_ closure: @escaping () -> ()) {
        if self === DispatchQueue.main && Thread.isMainThread {
            closure()
        } else {
            async { closure() }
        }
    }
}
