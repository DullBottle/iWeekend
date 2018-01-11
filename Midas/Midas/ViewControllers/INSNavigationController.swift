//
//  INSNavigationController.swift
//  Midas
//
//  Created by __End on 2018/1/11.
//  Copyright © 2018年 Dressrose. All rights reserved.
//

import UIKit

class INSNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Instagram Logo.
        let instagram = UIImageView(image: #imageLiteral(resourceName: "Instagram"))
        navigationBar.addSubview(instagram)
        instagram.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-7.f)
            make.width.equalTo(90.f)
            make.height.equalTo(26.f)
        }
        
        // Line.
        let line = UIView()
        line.backgroundColor = 0xE7E7E7.color
        navigationBar.addSubview(line)
        line.snp.makeConstraints { make in
            make.left.right.equalTo(0.f)
            make.bottom.equalTo(1.f)
            make.height.equalTo(1.f)
        }
    }
}
