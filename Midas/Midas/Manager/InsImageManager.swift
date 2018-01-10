//
//  InsImageManager.swift
//  Midas
//
//  Created by __End on 2018/1/9.
//  Copyright © 2018年 Dressrose. All rights reserved.
//

import Foundation
import PINRemoteImage

class INSImageManager {
    
    static let shared = INSImageManager()
    
    private var tasks: [UUID] = [UUID]()
    
    init() {
        
    }
    
    func append(_ task: UUID) {
        tasks.append(task)
    }
    
    func cancelAllTasks() {
        if tasks.count != 0 {
            tasks.forEach { PINRemoteImageManager.shared().cancelTask(with: $0) }
        }
    }
}










