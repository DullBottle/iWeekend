//
//  UIButton + Analysis.swift
//  Esdeath
//
//  Created by 銀色魔頭號 on 2018/7/16.
//  Copyright © 2018年 Dressrose. All rights reserved.
//

import UIKit

fileprivate var isSwizzled: Bool = false

extension UIButton {
    
    static let swizzle: Void = {
        let origialMethod = class_getInstanceMethod(UIButton.self, #selector(sendAction(_:to:for:)))
        let swizzleMethod = class_getInstanceMethod(UIButton.self, #selector(xxx_sendAction(_:to:for:)))
        method_exchangeImplementations(origialMethod!, swizzleMethod!)
    }()
    
    @objc func xxx_sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        xxx_sendAction(action, to: target, for: event)
        print("__Pin__")
    }
    
}


