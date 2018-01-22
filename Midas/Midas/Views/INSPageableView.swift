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
    
    let scrollView = UIScrollView().then {
        $0.backgroundColor = .ins_lightGray
        $0.isPagingEnabled = true
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
    }
    
    var page: Int = 0 {
        willSet {
            for _ in 0..<newValue {
                let node = INSImageView()
//                node.frame = CGRect(x: CGFloat(i) * size.width , y: 0, width: size.width, height: size.height)
                scrollView.addSubview(node)
                pages.append(node)
            }
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
        
        addSubview(scrollView)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(frame: .zero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let frame = scrollView.superview?.bounds {
            scrollView.frame = frame
            for i in 0..<page {
                let node = pages[i]
                node.frame = CGRect(x: CGFloat(i) * size.width , y: 0, width: size.width, height: size.height)
            }
            // set `contentSize`
            scrollView.contentSize =  CGSize(width: (CGFloat(page) * size.width), height: size.height)
        }
    }
}








