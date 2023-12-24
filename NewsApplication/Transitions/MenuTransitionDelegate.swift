//
//  MenuTransitionDelegate.swift
//  NewsApplication
//
//  Created by Space Wizard on 12/23/23.
//

import Foundation
import UIKit

class MenuTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    var menuTransitionAnimator = MenuTransitionAnimator()
    
    var startingFrame: CGRect = .zero
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return MenuPresentationController(presentedViewController: presented, presentingViewController: presenting, startingFrame: startingFrame)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        menuTransitionAnimator.transitioningForward = true
        return menuTransitionAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        menuTransitionAnimator.transitioningForward = false
        return menuTransitionAnimator
    }
}

