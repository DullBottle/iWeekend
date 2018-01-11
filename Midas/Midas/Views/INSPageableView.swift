//
//  INSPageableView.swift
//  Midas
//
//  Created by __End on 2018/1/10.
//  Copyright © 2018年 Dressrose. All rights reserved.
//

import UIKit

class INSPageableView: UIView {
    
    // MARK: Properties.
    
    fileprivate let scrollView = UIScrollView()
    
    var page: Int = 0 {
        willSet {
            let size = scrollView.frame.size
            for i in 0..<newValue {
                let node = INSImageView()
                node.frame = CGRect(x: CGFloat(i) * size.width , y: 0, width: size.width, height: size.height)
                scrollView.addSubview(node)
                pages.append(node)
            }
            // set `contentSize`
            scrollView.contentSize =  CGSize(width: (CGFloat(newValue) * size.width), height: size.height)
        }
    }
    
    var pages: [INSImageView] = [INSImageView]()
    
    var URLs: [String] = [] {
        willSet {
            if newValue.count == pages.count {
                for i in 0..<pages.count {
                    let node = pages[i]
                    node.setImage(newValue[i])
                }
            }
        }
    }
    
    // MARK: Initialize.
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.frame = frame
        addSubview(scrollView)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(frame: .zero)
    }
}



