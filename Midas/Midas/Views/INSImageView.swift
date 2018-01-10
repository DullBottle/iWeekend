//
//  INSImageView.swift
//  Midas
//
//  Created by __End on 2018/1/9.
//  Copyright © 2018年 Dressrose. All rights reserved.
//

import UIKit

class INSImageView: UIImageView {
    
    typealias INSErrorClosure = (Error) -> Void
    
    fileprivate let baseProgressBar: CAShapeLayer = CAShapeLayer()
    
    fileprivate let progressBar: CAShapeLayer = CAShapeLayer()
    
    // MARK: Constraints
    
    fileprivate struct Metric {
        static let size: CGFloat = 80.f
        static var radius: CGFloat {
            return size / 2
        }
        static let lineWidth = 1.5.f
    }
    
    // MARK: Initialize
    
    init() {
        super.init(image: nil)
        
        backgroundColor = 0xEFEFEE.color
        
        baseProgressBar.lineWidth = Metric.lineWidth
        baseProgressBar.lineCap = kCALineCapRound
        baseProgressBar.strokeColor = 0xD8D8D8.color.cgColor
        baseProgressBar.fillColor = UIColor.clear.cgColor
        layer.addSublayer(baseProgressBar)
        
        progressBar.lineWidth = Metric.lineWidth
        progressBar.lineCap = kCALineCapRound
        progressBar.strokeColor = 0x333333.color.cgColor
        progressBar.fillColor = UIColor.clear.cgColor
        progressBar.strokeStart = 0.f
        progressBar.strokeEnd = 0.f
        layer.addSublayer(progressBar)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    func updateProgress(_ percent: CGFloat) -> Void {
        progressBar.strokeEnd = percent
        if percent == 1.f {
            baseProgressBar.isHidden = true
            progressBar.isHidden = true
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let x = (frame.size.width - Metric.size) / 2
        let y = (frame.size.height - Metric.size) / 2
        let rect = CGRect(x: x, y: y, width: Metric.size, height: Metric.size)
        let path = UIBezierPath.init(roundedRect: rect, cornerRadius: Metric.radius)
        baseProgressBar.path = path.cgPath
        progressBar.path = path.cgPath
    }
}












