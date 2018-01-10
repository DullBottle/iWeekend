//
//  INSImageView + Pin.swift
//  Midas
//
//  Created by __End on 2018/1/9.
//  Copyright © 2018年 Dressrose. All rights reserved.
//

import UIKit
import PINRemoteImage

extension INSImageView {
    
    func setImage(_ urlString: String, progressive: Bool = true, errorHandler: INSErrorClosure? = nil) {
        
        if urlString.lengthOfBytes(using: .utf8) > 0 {
            
            let UUID = PINRemoteImageManager.shared().downloadImage(with: URL(string: urlString)!,
                options: .downloadOptionsSkipRetry,
                progressImage: { [weak self] result in
                    if progressive {
                        DispatchQueue.main.safeAsync {
                            self?.image = result.image
                        }
                    }
                }, progressDownload: { [weak self] (receivedData, totalData) in
                    let percent = CGFloat(receivedData) / CGFloat(totalData)
                    DispatchQueue.main.safeAsync {
                        self?.updateProgress(percent)
                    }
                }) { [weak self] result in
                    if let error = result.error {
                        if let err = errorHandler {
                            err(error)
                        }
                        return
                    }
                
                    DispatchQueue.main.safeAsync {
                        self?.image = result.image
                    }
            }
            
            if let UUID = UUID {
                INSImageManager.shared.append(UUID)
            }
        }
    }
}











