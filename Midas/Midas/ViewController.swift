//
//  ViewController.swift
//  Midas
//
//  Created by 銀色魔頭號 on 2017/12/26.
//  Copyright © 2017年 Dressrose. All rights reserved.
//

import UIKit
//import PINRemoteImage

class ViewController: UIViewController {

    @IBOutlet weak var imageView: INSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        let urlString = "https://scontent-lht6-1.cdninstagram.com/t51.2885-15/e35/25007863_145284662859895_8347086068658470912_n.jpg"
        imageView.setImage(urlString) { error in
            print(error.localizedDescription)
        }
        
//        _ = Networking.shared.request("https://www.instagram.com/p/BdrzrHUAgVQ/")
//            .filterNil()
//            .map(Ins.self)
//            .subscribe(onNext: { ins in
//                print(ins)
//            })
    }

}














