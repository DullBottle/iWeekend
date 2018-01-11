//
//  INSPageControl.swift
//  Midas
//
//  Created by __End on 2018/1/10.
//  Copyright © 2018年 Dressrose. All rights reserved.
//

import UIKit

class INSPageControl: UIView {
    
    // MARK: Contraints
    
    fileprivate struct Metric {
        static let radius = 3.5
    }
    
    // MARK: Properties.
    
    var currentPage: UInt = 0
    
    fileprivate var dots: [CALayer] = [CALayer]()

    var numberOfPages: UInt = 0 {
        willSet {
            if newValue > 0 {
                for i in 0..<newValue {
                    let dot = CALayer()
                    dot.backgroundColor = i == 0 ? UIColor.ins_blue.cgColor : UIColor.ins_darkGray.cgColor
                    dot.frame = CGRect(x: CGFloat(i) * 7.f, y: 0, width: 7, height: 7)
                    dots.append(dot)
                }
            }
        }
    }
    
    // MARK: Initialize.
    
    init() {
        super.init(frame: .zero)
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }
}
