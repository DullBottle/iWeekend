//
//  FirstViewController.swift
//  Esdeath
//
//  Created by 銀色魔頭號 on 2018/7/1.
//  Copyright © 2018年 Dressrose. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    private var swipePresentInteractionController: SwipepRresentInteractionController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.navigationController?.delegate = self
        
        swipePresentInteractionController = SwipepRresentInteractionController(viewController: self)
    }

    @IBAction func tap(_ sender: UIButton) {
        let viewController = TargetViewController()
        viewController.transitioningDelegate = self
        present(viewController, animated: true, completion: nil)
//        viewController.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(viewController, animated: true)
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


