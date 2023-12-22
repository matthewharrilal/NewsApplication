//
//  SearchTransitionAnimator.swift
//  NewsApplication
//
//  Created by Space Wizard on 12/21/23.
//

import Foundation
import UIKit

class SearchTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var transitioningForward: Bool = true
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromViewController = transitionContext.viewController(forKey: .from),
            let toViewController = transitionContext.viewController(forKey: .to)
        else { return }
        
        let containerView = transitionContext.containerView
        let destinationViewController = transitioningForward ? toViewController : fromViewController

        containerView.addSubview(destinationViewController.view)
        
        
        let initialFrame = CGRect(
            x: transitioningForward ? containerView.frame.width : 0,
            y: 0,
            width: containerView.frame.width,
            height: containerView.frame.height
        )
        
        destinationViewController.view.frame = initialFrame
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
            destinationViewController.view.frame = containerView.frame
        } completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
