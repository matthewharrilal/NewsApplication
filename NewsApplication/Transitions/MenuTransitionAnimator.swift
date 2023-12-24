//
//  MenuTransitionAnimator.swift
//  NewsApplication
//
//  Created by Space Wizard on 12/23/23.
//

import Foundation
import UIKit

class MenuTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var transitioningForward: Bool = true
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromViewController = transitionContext.viewController(forKey: .from),
            let toViewController = transitionContext.viewController(forKey: .to)
        else { return }
        
        let containerView = transitionContext.containerView
        let destinationViewController = transitioningForward ? toViewController : fromViewController

        destinationViewController.view.alpha = 0
        containerView.addSubview(destinationViewController.view)
        
        let initialFrame = CGRect(
            x: transitioningForward ?  containerView.frame.width : 0,
            y: transitioningForward ? containerView.frame.height / 2 : 0,
            width: 0,
            height: 0
        )
        
        destinationViewController.view.frame = initialFrame
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
            destinationViewController.view.frame = containerView.frame
            destinationViewController.view.alpha = 1
        } completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}

