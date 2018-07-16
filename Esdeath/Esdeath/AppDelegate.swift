//
//  AppDelegate.swift
//  Esdeath
//
//  Created by 銀色魔頭號 on 2018/7/1.
//  Copyright © 2018年 Dressrose. All rights reserved.
//

import UIKit
import ChameleonFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UIButton.swizzle
        
        return true
    }
    
}

