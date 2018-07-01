//
//  SwipeAnimatedTransitioning.swift
//  Esdeath
//
//  Created by 銀色魔頭號 on 2018/7/1.
//  Copyright © 2018年 Dressrose. All rights reserved.
//

import UIKit

class SwiptePushAnimatedTransitioning: NSObject {
    
    override init() {
        super.init()
    }
}

extension SwiptePushAnimatedTransitioning: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let from = transitionContext.viewController(forKey: .from),
            let to = transitionContext.viewController(forKey: .to),
            let snap = to.view.snapshotView(afterScreenUpdates: true) else { return }
        
        let containerView = transitionContext.containerView
        containerView.backgroundColor = .white
        
        //MARK: - TODO add `snap` shadow.
        snap.frame = CGRect(x: containerView.frame.width, y: 0, width: containerView.frame.width, height: containerView.frame.height)
        
        containerView.addSubview(to.view)
        containerView.addSubview(snap)
        to.view.isHidden = true
        
        // animation.
        let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
            
            snap.frame = CGRect(x: 0, y: 0, width: containerView.frame.width, height: containerView.frame.height)
            from.view.frame = CGRect(x: from.view.frame.origin.x - 60,
                                     y: 0,
                                     width: containerView.frame.width,
                                     height: containerView.frame.height)
            
        }) { _ in
            to.view.isHidden = false
            snap.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
}

//
// Swipe手势驱动.
//
class SwipepRresentInteractionController: UIPercentDrivenInteractiveTransition {
    
    var interactionInProgress = false
    
    private var shouldCompleteTransition = false
    private weak var viewController: UIViewController!
    
    init(viewController: UIViewController) {
        super.init()
        self.viewController = viewController
        prepareGestureRecognizer(in: viewController.view)
    }
    
    //MARK:- actions
    
    @objc func handleGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        // 1.
        let translation = gestureRecognizer.translation(in: gestureRecognizer.view)
        var progress = -translation.x / 200
        progress = CGFloat(fminf(fmaxf(Float(progress), 0.0), 1.0))
        
        switch gestureRecognizer.state {
        case .began:
            interactionInProgress = true
            let target = TargetViewController()
            if let node = viewController as? FirstViewController {
                target.transitioningDelegate = node
                viewController.present(target, animated: true, completion: nil)
            }
        case .changed:
            shouldCompleteTransition = progress > 0.5
            update(progress)
        case .cancelled:
            interactionInProgress = false
            cancel()
        default:
            interactionInProgress = false
            if shouldCompleteTransition {
                finish()
            } else {
                cancel()
            }
//        default:
//            break
        }
        
    }
    
    //MARK:- private methods
    
    private func prepareGestureRecognizer(in view: UIView) {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
        gesture.minimumNumberOfTouches = 1
        gesture.maximumNumberOfTouches = 1
        view.addGestureRecognizer(gesture)
    }
    
}




