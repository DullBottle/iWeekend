//
//  FirstViewController.swift
//  Esdeath
//
//  Created by 銀色魔頭號 on 2018/7/1.
//  Copyright © 2018年 Dressrose. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var tap: UIButton!
    @IBOutlet weak var kenan: UIButton!
    @IBOutlet weak var xiaolan: UIButton!
    @IBOutlet weak var hongye: UIButton!
    
    private var swipePresentInteractionController: SwipepRresentInteractionController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.navigationController?.delegate = self
        
        swipePresentInteractionController = SwipepRresentInteractionController(viewController: self)
        
        tap.addTarget(self, action: #selector(tap(_:)), for: .touchUpInside)
        kenan.addTarget(self, action: #selector(tapKenan(_:)), for: .touchUpInside)
        xiaolan.addTarget(self, action: #selector(tapXiaolan(_:)), for: .touchUpInside)
        hongye.addTarget(self, action: #selector(tapHongye(_:)), for: .touchUpInside)
        
    }

    //MARK:- actions.
    
    @objc func tap(_ sender: UIButton) {
        let viewController = TargetViewController()
        viewController.transitioningDelegate = self
        present(viewController, animated: true, completion: nil)
//        viewController.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func tapKenan(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "__Esdeath")
    }
    
    @objc func tapXiaolan(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "__Esdeath")
    }
    
    @objc func tapHongye(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "__Esdeath")
    }
    
}

extension FirstViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        return SwiptePushAnimatedTransitioning()
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        guard let _ = animator as? SwiptePushAnimatedTransitioning else { return nil }
        return swipePresentInteractionController
        
//        return nil
    }
}


