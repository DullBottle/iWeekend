//
//  ViewController.swift
//  Midas
//
//  Created by 銀色魔頭號 on 2017/12/26.
//  Copyright © 2017年 Dressrose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Networking.shared.request("https://www.instagram.com/p/BdOBwNTnW0h/", completionClosure: { JSON in
            if let JSON = JSON {
                print(JSON)
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

