//
//  TargetViewController.swift
//  Esdeath
//
//  Created by 銀色魔頭號 on 2018/7/1.
//  Copyright © 2018年 Dressrose. All rights reserved.
//

import UIKit

class TargetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "❦Esdeath"
        view.backgroundColor = UIColor.randomFlat()
        
        let dismissBtn = UIButton(type: .custom)
        dismissBtn.setImage(#imageLiteral(resourceName: "dismiss"), for: .normal)
        dismissBtn.frame = CGRect(x: 16, y: 30, width: 30, height: 30)
        view.addSubview(dismissBtn)
        
        dismissBtn.addTarget(self, action: #selector(dismiss(_:)), for: .touchUpInside)
    }

    @objc func dismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension TargetViewController: UIViewControllerTransitioningDelegate {
    
}








